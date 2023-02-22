//
//  LayoutSection.swift
//  CompositionalImageViewer
//
//  Created by Ramazan Karami on 2/22/23.
//

import UIKit

class LayoutSection {

    static func makeTopBannerLayoutSection() -> NSCollectionLayoutSection {
        let fraction: CGFloat = 0.8
        let ratio: CGFloat = 9/16
        let itemInset: CGFloat = 8
        let groupInset: CGFloat = 0
        let sectionInset: CGFloat = 16

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                     leading: itemInset,
                                                     bottom: itemInset,
                                                     trailing: itemInset)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction),
                                               heightDimension: .fractionalWidth(fraction*ratio))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: groupInset,
                                                      leading: groupInset,
                                                      bottom: groupInset,
                                                      trailing: groupInset)


        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: sectionInset,
                                                        leading: sectionInset,
                                                        bottom: sectionInset,
                                                        trailing: sectionInset)
        section.orthogonalScrollingBehavior = .continuous

        return section
    }

    static func makeGridLayoutSection() -> NSCollectionLayoutSection{
        let fraction: CGFloat = 1/3
        let itemInset: CGFloat = 8
        let groupInset: CGFloat = 0
        let sectionInset: CGFloat = 16

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                     leading: itemInset,
                                                     bottom: itemInset,
                                                     trailing: itemInset)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: groupInset,
                                                      leading: groupInset,
                                                      bottom: groupInset,
                                                      trailing: groupInset)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: sectionInset,
                                                        leading: sectionInset,
                                                        bottom: 0,
                                                        trailing: sectionInset)

        let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .estimated(100))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize,
                                                                     elementKind: .gridSupplementaryItemKind,
                                                                     alignment: .top)
        section.boundarySupplementaryItems = [headerItem]

        return section
    }

    static func makeBottomBannerLayoutSection() -> NSCollectionLayoutSection {
        let fraction: CGFloat = 0.7
        let ratio: CGFloat = 9/16
        let itemInset: CGFloat = 8
        let groupInset: CGFloat = 0
        let sectionInset: CGFloat = 16

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: itemInset,
                                                     leading: itemInset,
                                                     bottom: itemInset,
                                                     trailing: itemInset)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction),
                                               heightDimension: .fractionalWidth(fraction*ratio))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: groupInset,
                                                      leading: groupInset,
                                                      bottom: groupInset,
                                                      trailing: groupInset)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: sectionInset,
                                                        bottom: sectionInset,
                                                        trailing: sectionInset)
        section.orthogonalScrollingBehavior = .continuous

        return section
    }

}

