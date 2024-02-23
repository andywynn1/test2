//
//  teams.swift
//  test2
//
//  Created by 64002876 on 2/14/24.
//

import Foundation
import SwiftUI
import Foundation

struct TeamData{
    @StateObject static var UCF = Team(
        teamName: "Knights",
        quarterBacks: [],
        runningBacks: [],
        wideRecievers: [],
        offensiveLineman: [],
        defensiveLineman: [],
        outsideLinebackers: [],
        insideLinebackers: [],
        cornerBacks: [],
        safetys: []
    )
}

