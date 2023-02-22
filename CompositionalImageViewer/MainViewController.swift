//
//  MainViewController.swift
//  CompositionalImageViewer
//
//  Created by Ramazan Karami on 2/20/23.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var viewModel = MainViewModel(collectionView: collectionView)

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero ,
                                              collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ImageCollectionViewCell.self,
                                forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
        collectionView.register(SectionHeaderView.self,
                                forSupplementaryViewOfKind: .gridSupplementaryItemKind,
                                withReuseIdentifier: SectionHeaderView.reuseIdentifier)
        return collectionView
    }()
}

// MARK: - Override
extension MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigation()
        setUpViews()
        setUpConstraints()
        viewModel.configureCompositionalLayout()
        viewModel.applySnapshot(animatingDifferences: false)
    }
}

// MARK: - Private Function
private extension MainViewController {

    func setUpViews() {
        view.addSubview(collectionView)
    }

    func setUpConstraints() {
        collectionView.pin(to: view)
    }

    func setUpNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.title = .navigationItemTitle
    }
}
