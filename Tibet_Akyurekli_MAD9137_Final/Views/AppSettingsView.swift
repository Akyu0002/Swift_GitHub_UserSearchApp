//
//  AppSettingsView.swift
//  Tibet_Akyurekli_MAD9137_Final
//
//  Created by Tibet Akyurekli on 2022-11-30.
//

import SwiftUI

struct AppSettingsView: View {
    @AppStorage("resultsPerPage") var resultsPerPage: Int = 25
    @AppStorage("minNumberOfRepos") var minNumberOfRepos: Int = 25
    @AppStorage("minNumberOfFollowers") var minNumberOfFollowers: Int = 25
    // Make the rest
    
    var body: some View {
        Stepper(value: $resultsPerPage, in: 1...50, step: 1, label: {
            Text("Results Per Page: \(resultsPerPage)")
        }).padding()
        Stepper(value: $minNumberOfRepos, in: 1...50, step: 1, label: {
            Text("Min. Number of Repos: \(minNumberOfRepos)")
        }).padding()
        Stepper(value: $minNumberOfFollowers, in: 1...50, step: 1, label: {
            Text("Min. Number of Followers: \(minNumberOfFollowers)")
        }).padding()
    }
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
    }
}
