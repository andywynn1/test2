//
//  ContentView.swift
//  test2
//
//  Created by 64002876 on 2/8/24.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        NavigationView(){
            VStack {
                Text("Team Viewer Ultra Premium Plus")
                    .fontWeight(.bold)
                    
               Image("football")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                NavigationLink(destination: teamView()){
                    Text("Click to View the team")
                        .frame(width: 200, height: 100, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
                
                
                
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
