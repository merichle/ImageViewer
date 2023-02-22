//
//  UIImageView.swift
//  CompositionalImageViewer
//
//  Created by Ramazan Karami on 2/22/23.
//

import UIKit

extension UIImageView {
    
    @discardableResult
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) -> URLSessionDataTask? {

        let urlCache = URLCache.shared
        let urlRequest = URLRequest(url: url)

        if let casheData = urlCache.cachedResponse(for: urlRequest)?.data, let image = UIImage(data: casheData) {
            DispatchQueue.main.async() { [weak self] in
                self?.contentMode = mode
                self?.image = image
            }
        } else {
            let loadingView = self.animating()
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                else { return }
                let cachedURLResponse = CachedURLResponse(response: httpURLResponse, data: data)
                urlCache.storeCachedResponse(cachedURLResponse, for: urlRequest)
                DispatchQueue.main.async() { [weak self] in
                    loadingView.stopAnimating()
                    loadingView.removeFromSuperview()
                    self?.contentMode = mode
                    self?.image = image
                }
            }
            task.resume()
            return task
        }
        return nil
    }

    @discardableResult
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) -> URLSessionDataTask? {
        guard let url = URL(string: link) else { return nil }
        return downloaded(from: url, contentMode: mode)
    }
}
