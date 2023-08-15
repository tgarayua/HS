//
//  SATScore.swift
//  HS
//
//  Created by Thomas Garayua on 8/15/23.
//

import Foundation

struct SATScore: Codable {
    let dbn: String
    let schoolName: String
    let satTestTakers: String
    let readingScore: String
    let mathScore: String
    let writingScore: String
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case satTestTakers = "num_of_sat_test_takers"
        case readingScore = "sat_critical_reading_avg_score"
        case mathScore = "sat_math_avg_score"
        case writingScore = "sat_writing_avg_score"
    }
}
