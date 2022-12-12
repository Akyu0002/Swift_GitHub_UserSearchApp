//
//  ListItemView.swift
//  Tibet_Akyurekli_MAD9137_Final
//
//  Created by Tibet Akyurekli on 2022-11-30.
//

import SwiftUI

struct ListItemView: View {
    
    // User Model
    let user: User
    
    var body: some View {
        HStack{
            // User Avatar Using AsyncImage
            // AsyncImage uss URLSession Cache
            AsyncImage(url: URL(string: user.avatarUrl)){ image in
                image.resizable()
                    .cornerRadius(8)
                    .frame(width: 75, height: 75)
            } placeholder: {
                
                // Placeholder Image
                Image(systemName: "icloud.and.arrow.down.fill")
                    .font(.system(size: 60))
                    
            }
            
            // Username VStack
            VStack(alignment: .leading){
                Text(user.username)
                Text(user.type)
            }
            Spacer()
        }
            .padding(16)
    }
}

