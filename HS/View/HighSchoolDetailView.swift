//
//  HighSchoolDetailView.swift
//  HS
//
//  Created by Thomas Garayua on 8/15/23.
//

import SwiftUI

struct HighSchoolDetailView: View {
    @StateObject var satScoresViewModel = SATScoresViewModel()
    let passedHighSchool: HighSchool
    @State var isShowing = false
    // TODO: Figure out how to get the SAT scores and Highschools to match
    var body: some View {
        VStack {
            if let satScore = satScoresViewModel.satScores.first(where: {$0.dbn == passedHighSchool.dbn}) {
                VStack {
                    Text(satScore.schoolName)
                        .font(.headline)
                        .padding()
                    Text(passedHighSchool.overviewParagraph)
                        .font(.subheadline)
                        .padding()
                    
                    HStack {
                        VStack {
                            Text("Avg SAT Score:")
                                .font(.headline)
                                .opacity(isShowing ? 1.0 : 0.0)
                            
                            VStack {
                                
                                Text("SAT Test Takers:")
                                    .font(.headline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                Text(satScore.satTestTakers)
                                    .font(.subheadline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                
                                Text("Reading Avg:")
                                    .font(.headline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                Text(satScore.readingScore)
                                    .font(.subheadline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                
                                Text("Math Avg:")
                                    .font(.headline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                Text(satScore.mathScore)
                                    .font(.subheadline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                
                                Text("Writing Avg:")
                                    .font(.headline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                Text(satScore.writingScore)
                                    .font(.subheadline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                            }
                                
                            .background(Color.white)
                            .shadow(radius: 5)
                            .padding()
                        }
                        VStack {
                            Text("School Details:")
                                .font(.headline)
                                .opacity(isShowing ? 1.0 : 0.0)
                            
                            VStack {
                                Text("City:")
                                    .font(.headline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                Text(passedHighSchool.city)
                                    .font(.subheadline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                
                                
                                Text("Zip Code:")
                                    .font(.headline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                Text(passedHighSchool.zip)
                                    .font(.subheadline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                
                                Text("Website:")
                                    .font(.headline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                                Text(passedHighSchool.website)
                                    .font(.subheadline)
                                    .opacity(isShowing ? 1.0 : 0.0)
                            }
                            .background(Color.white)
                            .shadow(radius: 5)
                            .padding()
                        }
                    }
                }
            } else {
                Text("No Data Availible")
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 3)) {
                isShowing = true
            }
            satScoresViewModel.fetchSatScoresVM()
        }
    }
}

//struct HighSchoolDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        HighSchoolDetailView(passedHighSchool: <#T##HighSchool#>)
//    }
//}
