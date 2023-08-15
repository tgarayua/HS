//
//  SATScoresViewModel.swift
//  HS
//
//  Created by Thomas Garayua on 8/15/23.
//

import Foundation

class SATScoresViewModel: ObservableObject {
    @Published var satScores: [SATScore] = []
    
    func fetchSatScoresVM() {
        NetworkManager.shared.fetchSATScoresNM { [weak self] satScore in
            DispatchQueue.main.async {
                self?.satScores = satScore ?? []
            }
        }
    }
}
