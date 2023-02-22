//
//  SectionHeaderView.swift
//  CompositionalImageViewer
//
//  Created by Ramazan Karami on 2/22/23.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black.withAlphaComponent(0.8)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Configuration
extension SectionHeaderView {

    func setTitle(_ title: String?) {
        titleLabel.text = title
    }
}

// MARK: - Private Func
private extension SectionHeaderView {

    func setUpViews() {
        addSubview(titleLabel)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
