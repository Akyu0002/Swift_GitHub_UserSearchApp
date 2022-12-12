//
//  UserDetailsView.swift
//  Tibet_Akyurekli_MAD9137_Final
//
//  Created by Tibet Akyurekli on 2022-11-30.
//

import SwiftUI
import Alamofire

struct UserDetailsView: View {
    
    @State var user: UserDetail?
    @State var url = ""
    @State var isDataLoaded = false
    
    // Alert State Variables
    @State var alertIsPresented = false
    @State var alertTitle: String = "Error"
    @State var alertMessage: String = "An Error Occured."
    
    var body: some View {
        VStack {
            if isDataLoaded {
                if let user {
                    AsyncImage(url: URL(string: user.avatarUrl)){ image in
                        image.resizable()
                            .frame(width: 250, height: 250)
                            .cornerRadius(8)
                    } placeholder: {
                        
                        // Placeholder Image
                        Image(systemName: "icloud.and.arrow.down.fill")
                            .font(.system(size: 60))
                    }
                    
                    //MARK: User GH Link
                    Link("GitHub Page",
                         destination: URL(string: user.userUrl)!)
                    .foregroundColor(.blue)
                    .padding(1)
                    
                    //MARK: User Name
                    if let name = user.name {
                        Text("Name: \(name)")
                            .foregroundColor(.black)
                            .padding(1)
                    } else {
                        Text("Name: No Data Found")
                            .foregroundColor(.gray)
                            .padding(1)
                    }
                    
                    //MARK: User Location
                    if let location = user.location {
                        Text("Location: \(location)")
                            .foregroundColor(.black)
                            .padding(1)
                    } else {
                        Text("Location: No Data Found")
                            .foregroundColor(.gray)
                            .padding(1)
                    }
                    
                    //MARK: User Company
                    if let company = user.company {
                        Text("Company: \(company)")
                            .padding(1)
                    } else {
                        Text("Company: No Data Found")
                            .foregroundColor(.gray)
                            .padding(1)
                    }
                    
                    
                    //MARK: User Followers
                    Text("Followers: \(user.followers)")
                        .padding(1)
                    
                    //MARK: User Public Gists
                    Text("Public Gists: \(user.publicRepos)")
                        .padding(1)
                    
                    //MARK: User Public Repos
                    Text("Public Repos: \(user.publicRepos)")
                        .padding(1)
                    
                    //MARK: User Last Updated
                    Text("Last Updated: \(user.updatedAt)")
                        .padding(1)
                    
                    //MARK: User Created At
                    Text("Created: \(user.createdAt)")
                        .padding(1)
                }
                Spacer()
            } else  {
                Text("Loading...")
                    .bold()
            }
        }.onAppear{
            getUserData()
        }
        .navigationBarTitle("About")
        .alert(isPresented: $alertIsPresented) {
                   Alert(
                       title: Text(alertTitle),
                       message: Text(alertMessage)
                   )
               }
    }
}


extension UserDetailsView {
    func getUserData() {
        AF.request(url)
            .validate(statusCode : 200..<300)
            .responseDecodable(of: UserDetail.self) {
                response in
                switch response.result {
                case .failure(let error):
                    if let msg = error.errorDescription {
                        alertIsPresented = true
                        alertMessage = msg
                    } else {
                        alertIsPresented = true
                        alertMessage = "Something went wrong, please try again later."
                    }
                case.success(let user):
                    self.user = user
                    isDataLoaded.toggle()
                }
            }
    }}
