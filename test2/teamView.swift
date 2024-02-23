//
//  teamView.swift
//  test2
//
//  Created by 64002876 on 2/8/24.
//

import Foundation
import SwiftUI

struct teamView: View {
    @StateObject var UCF = TeamData.UCF
    
    var body: some View{
        
        NavigationView{
            
            VStack{

                Text("Depth Chart")
                    .fontWeight(.bold)
                HStack{
                    Button("Generate Team"){
                        UCF.genTeam(max: 20)
                    }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    Spacer()
                    Button("UnGenerate"){
                        UCF.unGenTeam()
                    }.padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.padding(.horizontal)
                
     //this list shows ucfs depth
                List{//start list
                    positionDepthChartSection(pos: "Quarterbacks", players: UCF.quarterBacks)
                    positionDepthChartSection(pos: "Runningbacks", players: UCF.runningBacks)
                    positionDepthChartSection(pos: "Wide Recievers", players: UCF.wideRecievers)
                    positionDepthChartSection(pos: "Offensive Lineman", players: UCF.offensiveLineman)
                    positionDepthChartSection(pos: "Defensive Lineman", players: UCF.defensiveLineman)
                    positionDepthChartSection(pos: "Outside Linebackers", players: UCF.outsideLinebackers)
                    positionDepthChartSection(pos: "Inside Linebackers", players: UCF.insideLinebackers)
                    positionDepthChartSection(pos: "Cornerbacks", players: UCF.cornerBacks)
                    positionDepthChartSection(pos: "Safety", players: UCF.safetys)

     
                        

          
                }//end list
                
            }

            
        }
        
        
    }
}


struct teamView_Previews: PreviewProvider{
    static var previews: some View {
        teamView()
    }
}

struct Player: Identifiable, Hashable { // player object
    let id = UUID()
    var name: String
    var rating: Int
    var position: String
    var playerClass: String
    let imageName: String

}

class Team: Identifiable, ObservableObject {
    let id = UUID()
    var teamName: String
    @Published var quarterBacks: [Player]
    @Published var runningBacks: [Player]
    @Published var wideRecievers: [Player]
    @Published var offensiveLineman: [Player]
    @Published var defensiveLineman: [Player]
    @Published var outsideLinebackers: [Player]
    @Published var insideLinebackers: [Player]
    @Published var cornerBacks: [Player]
    @Published var safetys: [Player]
    
    init(teamName: String, quarterBacks: [Player], runningBacks: [Player], wideRecievers: [Player], offensiveLineman: [Player], defensiveLineman: [Player], outsideLinebackers: [Player], insideLinebackers: [Player], cornerBacks: [Player], safetys: [Player]){
        self.teamName = teamName
        self.quarterBacks = quarterBacks
        self.runningBacks = runningBacks
        self.wideRecievers = wideRecievers
        self.offensiveLineman = offensiveLineman
        self.defensiveLineman = defensiveLineman
        self.outsideLinebackers = outsideLinebackers
        self.insideLinebackers = insideLinebackers
        self.cornerBacks = cornerBacks
        self.safetys = safetys
    }
}








struct playerDepthChartRow: View{
    var player: Player
    
    var body: some View{
        ZStack {
            
         

            HStack{
                Image(player.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height:70)
                    .cornerRadius(100)
                Text(player.name)
                    .fontWeight(.bold)
                Text(player.playerClass)
                    
                Spacer()
                Text("\(player.rating)")
                    .padding(.leading)
                Spacer()
            }
        }.frame(alignment: .leading)
        
    }
}

struct positionDepthChartSection: View {

    var pos: String
    var players: [Player]
    
    var body: some View {
        Section(header: Text(pos).foregroundColor(.black)) {
            ForEach(players, id: \.self) { player in
                NavigationLink(destination: playerDetailView(player: player)) {
                    playerDepthChartRow(player: player)
                }
            }
        }
    }
}



extension Team{
    func genTeam(max: Int) {
        let playerNameDatabase = ["Sathvik", "Manas", "Nihal", "Soren", "Bhuvan", "Andrew", "Huijae", "Logan", "Kevin", "Myles", "Travis", "Jalen", "Jayson", "John", "Johnathon", "Drake", "Victor", "Demari", "Jamal"]
        let playerImageDatabase = [ "1", "4", "3", "5", "7", "8", "11", "king", "12", "13"]
       
        
        
        for _ in 1...max {
            let randomName = playerNameDatabase.randomElement()!
            let randomImageName = playerImageDatabase.randomElement()!
            let randomRating = Int.random(in: 50...100)
            let randomPosition = selectRandomPosition()
            
            let newPlayer = Player(name: randomName, rating: randomRating, position: randomPosition, playerClass: selectRandomClass(), imageName: randomImageName)
            

            switch randomPosition {
            case "QB":
                self.quarterBacks.append(newPlayer)
            case "RB":
                self.runningBacks.append(newPlayer)
            case "WR":
                self.wideRecievers.append(newPlayer)
            case "OL":
                self.offensiveLineman.append(newPlayer)
            case "DL":
                self.defensiveLineman.append(newPlayer)
            case "OLB":
                self.outsideLinebackers.append(newPlayer)
            case "ILB":
                self.insideLinebackers.append(newPlayer)
            case "CB":
                self.cornerBacks.append(newPlayer)
            case "S":
                self.safetys.append(newPlayer)
            default:
                self.safetys.append(newPlayer)
            }
        }
    }
    
    func unGenTeam(){
                self.quarterBacks.removeAll()
                self.runningBacks.removeAll()
                self.wideRecievers.removeAll()
                self.offensiveLineman.removeAll()
                self.defensiveLineman.removeAll()
                self.outsideLinebackers.removeAll()
                self.insideLinebackers.removeAll()
                self.cornerBacks.removeAll()
                self.safetys.removeAll()
    }
    
    private func selectRandomPosition() -> String {
            let randomNumber = Int.random(in: 1...100)
            if (1...5).contains(randomNumber) {
                return "QB"
            } else if (6...13).contains(randomNumber) {
                return "RB"
            } else if (14...25).contains(randomNumber) {
                return "WR"
            } else if (26...46).contains(randomNumber) {
                return "OL"
            } else if (47...64).contains(randomNumber) {
                return "DL"
            } else if (65...73).contains(randomNumber) {
                return "OLB"
            } else if (74...82).contains(randomNumber) {
                return "ILB"
            } else if (83...92).contains(randomNumber) {
                return "CB"
            } else if (92...100).contains(randomNumber) {
                return "S"
            } else {
             
                return "QB"
            }
        }
    private func selectRandomClass() -> String{
        let randomNumber = Int.random(in: 1...4)
        if(1...1).contains(randomNumber){
            return "Fr"
        }else
        if(2...2).contains(randomNumber){
            return "So"
        }else
        if(3...3).contains(randomNumber){
            return "Jr"
        }else
        if(4...4).contains(randomNumber){
            return "Sr"
        }else{
            return "Rs Sr"
        }
    }
}
