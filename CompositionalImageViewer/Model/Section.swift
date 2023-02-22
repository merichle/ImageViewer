//
//  Section.swift
//  CompositionalImageViewer
//
//  Created by Ramazan Karami on 2/22/23.
//

import Foundation

class Section: Hashable {
    
    var id: UUID
    var type: SectionTypeEnum
    var title: String
    var images: [Image]
    
    init() {
        self.id = UUID()
        self.type = .unknown
        self.title = ""
        self.images = []
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Section, rhs: Section) -> Bool {
        lhs.id == rhs.id
    }
}

extension Section {
    
    static var allSections: [Section] = {
        var allSection: [Section] = []
        let totalSection: Int = 3
        let itemInSection: Int = 12
        for i in 0..<(totalSection*itemInSection) {
            let sectionIndex: Int = Int(i/itemInSection)
            let rowIndex: Int = Int(i%itemInSection)
            if rowIndex == .zero {
                let section = Section()
                section.type = SectionTypeEnum(rawValue: sectionIndex) ?? .unknown
                allSection.append(section)
            }
            allSection.first(where: {$0.type == .grid})?.title = "Section Title"
            allSection[sectionIndex].images.append(Image(imageId: i))
        }
        return allSection
    }()
}
