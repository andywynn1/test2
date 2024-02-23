//
//  playerDetailView.swift
//  test2
//
//  Created by 64002876 on 2/11/24.
//

import SwiftUI

struct playerDetailView: View {
    var player: Player
    var body: some View {
        VStack{
            Image(player.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .cornerRadius(100)
            Spacer()
            HStack{
                Text(player.name)
                    .fontWeight(.bold)
                Text(player.playerClass)
            }
            
            Text("\(player.rating) overall" )
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("\(player.name) plays \(player.position)")
                .padding()
                .font(.body)
            Spacer()
        }
        

    }
}

struct playerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        playerDetailView(player: Player(name: "Sample Player", rating: 88, position: "QB", playerClass: "rs jr", imageName: "1"))
    }
}
