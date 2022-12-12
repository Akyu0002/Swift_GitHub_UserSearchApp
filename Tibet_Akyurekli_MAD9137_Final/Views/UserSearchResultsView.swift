//
//  UserSearchResultsView.swift
//  Tibet_Akyurekli_MAD9137_Final
//
//  Created by Tibet Akyurekli on 2022-11-30.
//

import SwiftUI

struct UserSearchResultsView: View {
    @State var users: [User]
    
    
    var body: some View {
        
        NavigationStack {
            List(users) { user in
                NavigationLink(destination: UserDetailsView(url: user.userUrl), label: {
                    ListItemView(user: user)
                })
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .navigationBarTitle("Search Results")
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}
