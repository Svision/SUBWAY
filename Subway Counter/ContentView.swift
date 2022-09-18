//
//  ContentView.swift
//  Subway Counter
//
//  Created by Changhao Song on 2022-09-17.
//

import SwiftUI

struct ContentView: View {
    let defaults = UserDefaults.standard
    let SCORE_TO_WIN = 7
    
    // Subway won number
    @State var ella_win_number: Int;
    @State var shawn_win_number: Int;
    
    // Current score
    @State var ella_curr_score: Int;
    @State var shawn_curr_score: Int;
    
    init() {
        self.ella_win_number = defaults.integer(forKey: "EllaWins")
        self.shawn_win_number = defaults.integer(forKey: "ShawnWins")
        self.ella_curr_score = defaults.integer(forKey: "EllaScore")
        self.shawn_curr_score = defaults.integer(forKey: "ShawnScore")
    }
    
    var body: some View {
        VStack {
            Image("subway-logo")
            HStack {
                SubwayScoreView(winNum: $ella_win_number, myScore: $ella_curr_score, otherScore: $shawn_curr_score, isElla: true)
                SubwayScoreView(winNum: $shawn_win_number, myScore: $shawn_curr_score, otherScore: $ella_curr_score)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
