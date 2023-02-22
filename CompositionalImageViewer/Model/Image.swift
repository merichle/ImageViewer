//
//  Image.swift
//  CompositionalImageViewer
//
//  Created by Ramazan Karami on 2/22/23.
//

import Foundation

class Image: Hashable {

    var id = UUID()
    var url: String
    
    init(imageId: Int) {
        self.url = "https://picsum.photos/id/\(imageId)/300/300"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Image, rhs: Image) -> Bool {
        lhs.id == rhs.id
    }
}
