//
//  HighSchoolsViewModel.swift
//  HS
//
//  Created by Thomas Garayua on 8/15/23.
//

import Foundation

class HighSchoolsViewModel: ObservableObject {
    @Published var highschools: [HighSchool] = []
    
    func fetchHighSchoolsVM() {
        NetworkManager.shared.fetchHighSchoolsNM { [weak self] highSchool in
            DispatchQueue.main.async {
                self?.highschools = highSchool ?? []
            }
        }
    }
}
