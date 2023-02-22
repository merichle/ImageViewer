//
//  ImageCollectionViewCell.swift
//  CompositionalImageViewer
//
//  Created by Ramazan Karami on 2/22/23.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    private var task: URLSessionDataTask?

    private lazy var imageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        return imageView
    }()

    override func prepareForReuse() {
        task?.cancel()
        imageView.image = nil
        super.prepareForReuse()
    }

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
extension ImageCollectionViewCell {

    func showimage(url: String) {
        task = imageView.downloaded(from: url)
    }
}

// MARK: - Private Func
private extension ImageCollectionViewCell {

    func setUpViews() {
        addSubview(imageView)
    }

    func setUpConstraints() {
        imageView.pin(to: self)
    }
}
