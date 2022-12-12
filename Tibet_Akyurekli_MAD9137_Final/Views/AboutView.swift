//
//  AboutView.swift
//  Tibet_Akyurekli_MAD9137_Final
//
//  Created by Tibet Akyurekli on 2022-11-30.
//

import SwiftUI

let imageURL = "https://avatars.githubusercontent.com/u/90468197?v=4"
let email = "akyu0002@algonquinlive.com"

let dictionary = Bundle.main.infoDictionary!
let version = dictionary["CFBundleShortVersionString"] as! String

struct AboutView: View {
    
    var body: some View {
        VStack{
            
            AsyncImage(url: URL(string: imageURL)){ image in
                image.resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(8)
            } placeholder: {
                // Placeholder Image
                Image(systemName: "icloud.and.arrow.down.fill")
                    .font(.system(size: 60))
            }
            Text("Version: \(version)")
                .padding(0.5)
            Text("Created by Tibet Akyurekli")
                .padding(0.5)
            Text("Justin & Co.")
                .padding(0.5)
            Link("E-Mail Me", destination: URL(string: "mailto:akyu0002@algonquinliv.com")!)
            .padding()
            Link("Tibet's Website ",
                  destination: URL(string: "https://www.tibetakyurekli.com")!)
        }
        .navigationBarTitle("About The Dev")
        Spacer()
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
