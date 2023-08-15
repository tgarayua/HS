//
//  NetworkManager.swift
//  HS
//
//  Created by Thomas Garayua on 8/15/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let highSchoolsUrlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    private let satScoresUrlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    private init() {}
    
    func fetchHighSchoolsNM(completion: @escaping ([HighSchool]?) -> Void) {
        guard let url = URL(string: highSchoolsUrlString) else {
            print("Error can not find highSchoolsUrlString")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error present in URLSesson: ", error.localizedDescription)
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let highSchools = try decoder.decode([HighSchool].self, from: data)
                    completion(highSchools)
                } catch {
                    print("Catch statment triggered: ", error.localizedDescription)
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    func fetchSATScoresNM(completion: @escaping ([SATScore]?) -> Void) {
        guard let url = URL(string: satScoresUrlString) else {
            print("Error can not find satScoresUrlString")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error present in URLSession: ", error.localizedDescription)
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let satScores = try decoder.decode([SATScore].self, from: data)
                    completion(satScores)
                } catch {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
