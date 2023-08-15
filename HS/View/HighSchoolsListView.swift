//
//  HighSchoolsListView.swift
//  HS
//
//  Created by Thomas Garayua on 8/15/23.
//

import SwiftUI

struct HighSchoolsListView: View {
    @StateObject var highSchoolsViewModel = HighSchoolsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if highSchoolsViewModel.highschools.isEmpty {
                    ProgressView("Loading...")
                } else {
                    List(highSchoolsViewModel.highschools, id: \.dbn) { highSchool in
                        NavigationLink(destination: HighSchoolDetailView(passedHighSchool: highSchool)) {
                            Text(highSchool.schoolName)
                        }
                    }
                    .navigationTitle("NYC High Schools") 
                }
            }
        }
        .onAppear {
            highSchoolsViewModel.fetchHighSchoolsVM()
        }
    }
}

struct HighSchoolsListView_Previews: PreviewProvider {
    static var previews: some View {
        HighSchoolsListView()
    }
}
