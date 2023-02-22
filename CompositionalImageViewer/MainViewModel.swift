//
//  MainViewModel.swift
//  CompositionalImageViewer
//
//  Created by Ramazan Karami on 2/22/23.
//

import UIKit

class MainViewModel {

    private var collectionView: UICollectionView

    typealias DataSource = UICollectionViewDiffableDataSource<Section, Image>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Image>

    private lazy var sections = Section.allSections
    private lazy var dataSource = makeDataSource()

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }

    func configureCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            switch SectionTypeEnum(rawValue: sectionIndex) {
            case .topBanner:
                return LayoutSection.makeTopBannerLayoutSection()
            case .bottomBanner:
                return LayoutSection.makeBottomBannerLayoutSection()
            default:
                return LayoutSection.makeGridLayoutSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true )
    }

    func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, image) ->
                UICollectionViewCell? in
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier,
                    for: indexPath) as? ImageCollectionViewCell
                cell?.showimage(url: image.url)
                return cell
            })
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == .gridSupplementaryItemKind else {
                return nil
            }
            let section = self.dataSource.snapshot()
                .sectionIdentifiers[indexPath.section]
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderView.reuseIdentifier,
                for: indexPath) as? SectionHeaderView
            view?.setTitle(section.title)
            return view
        }
        return dataSource
    }

    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        sections.forEach { section in
            snapshot.appendItems(section.images, toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}
