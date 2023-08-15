//
//  HighSchool.swift
//  HS
//
//  Created by Thomas Garayua on 8/15/23.
//

import Foundation

struct HighSchool: Codable {
    let dbn: String
    let schoolName: String
    let city: String
    let zip: String
    let overviewParagraph: String
    let website: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case city
        case zip
        case overviewParagraph = "overview_paragraph"
        case website
    }
}
