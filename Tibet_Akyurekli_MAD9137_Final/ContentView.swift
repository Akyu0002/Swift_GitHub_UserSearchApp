//
//  ContentView.swift
//  Tibet_Akyurekli_MAD9137_Final
//
//  Created by Tibet Akyurekli on 2022-11-30.
//

import SwiftUI
import UIKit
import Alamofire

struct ContentView: View {
    @State var aboutViewIsPresented = false
    @State var settingsViewIsPresented = false
    
    @State var userSearchResultsViewIsPresented = false
    @State var searchTerm = ""
    
    @State var userList = [User]()
    
    // Alert State Variables
    @State var alertIsPresented = false
    @State var alertTitle: String = "Error"
    @State var alertMessage: String = "An Error Occured."
    
    var body: some View {
        NavigationStack{
            VStack {
                
                // GitHub Logo
                Image("GH")
                    .resizable()
                    .frame(width: 400, height: 250)
                    .scaledToFit()
                    
                Text("User Search")
                    .fontWeight(.bold)
                    .font(.system(size: 33))
                    
                HStack {
                    TextField("Enter Search Term", text: $searchTerm)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Search", action: {
                        searchGitHub()
                    })
                    .padding(8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(8)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        settingsViewIsPresented.toggle()
                    }, label: {
                        Image(systemName: "gearshape.2" )
                            .font(.system(size: 25))
                    } )
                })
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Button(action: {
                        aboutViewIsPresented.toggle()
                    }, label: {
                        Image(systemName: "person.crop.circle.fill.badge.questionmark" )
                            .font(.system(size: 25))
                    } )
                })
            })
            .navigationDestination(isPresented: $settingsViewIsPresented, destination: {
                AppSettingsView()
            })
            .navigationDestination(isPresented: $aboutViewIsPresented, destination: {
                AboutView()
            })
            .navigationDestination(isPresented: $userSearchResultsViewIsPresented, destination: {
                UserSearchResultsView(users: userList)
            })
            .padding()
            Spacer()
        }
        .alert(isPresented: $alertIsPresented) {
                   Alert(
                       title: Text(alertTitle),
                       message: Text(alertMessage)
                   )
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    func searchGitHub() {

        @AppStorage("resultsPerPage") var resultsPerPage: Int = 25
        @AppStorage("minimumRepos") var minimumRepos: Int = 0
        @AppStorage("minimumFollowers") var minimumFollowers: Int = 0
        
        // URL Component
        var myUrlComponents =  URLComponents(string: "https://api.github.com")!
        
        myUrlComponents.path = "/search/users"
        
        let searchTermQuery = URLQueryItem(name: "q", value: searchTerm)
        let perPageQuery = URLQueryItem(name: "per_page", value: String(resultsPerPage))
        let repoQuery = URLQueryItem(name: "repos", value: String(minimumRepos))
        let followerQuery = URLQueryItem(name: "followers", value: String(minimumFollowers))
        
        myUrlComponents.queryItems = [
                searchTermQuery,
                perPageQuery,
                repoQuery,
                followerQuery]
        
        
        AF.request(myUrlComponents)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: UserSearchResponseModel.self) {response in
                
                switch response.result {
                case .failure(let error):
                   
                    if let message = error.errorDescription {

                        alertMessage = message
                        alertIsPresented = true
                    } else {
                        alertIsPresented = true
                        alertMessage = "Something went wrong, please try again later."
                    }
                    
                case .success(let value):
                    if value.users.count != 0 {
                        self.userList = value.users
                        DispatchQueue.main.async {
                            userSearchResultsViewIsPresented.toggle()
                        }
                    } else {
                        alertTitle = "Whoops..."
                        alertMessage = "\(value.totalCount) Results Found"
                        alertIsPresented = true
                    }
                    
                }
            }
    }
}
