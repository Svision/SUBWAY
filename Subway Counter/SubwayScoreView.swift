//
//  SubwayScoreView.swift
//  Subway Counter
//
//  Created by Changhao Song on 2022-09-17.
//

import SwiftUI

struct SubwayScoreView: View {
    let defaults = UserDefaults.standard
    let SCORE_TO_WIN = 7
    @Binding var winNum: Int;
    @Binding var score: Int;
    var isElla: Bool = false;
    
    let colorElla = Color(red: 233/255, green: 185/255, blue: 63/255);
    let colorShawn = Color(red: 59/255, green: 135/255, blue: 66/255);
    
    var body: some View {
        VStack {
            isElla ? Text("Ella").foregroundColor(colorElla).font(.system(size: 48)) : Text("Shawn").foregroundColor(colorShawn).font(.system(size: 48))
            
            // score
            HStack {
                Button {
                    if (score > 0) {
                        score -= 1
                    }
                    defaults.set(score, forKey: isElla ? "EllaScore" : "ShawnScore")
                } label: {
                    Text("-")
                }
                
                Text("\(score)")
                    .frame(width:72)
                    .foregroundColor(isElla ? colorElla : colorShawn)
                
                Button {
                    score += 1
                    if (score == SCORE_TO_WIN) {
                        score = 0
                        winNum += 1
                    }
                    defaults.set(score, forKey: isElla ? "EllaScore" : "ShawnScore")
                } label: {
                    Text("+")
                }
            }
            .font(.system(size: 72))
            
            
            // win number
            HStack() {
                Button {
                    if (winNum > 0) {
                        winNum -= 1
                    }
                    defaults.set(winNum, forKey: isElla ? "EllaWins" : "ShawnWins")
                } label: {
                    Text("-")
                }
                
                Text("\(winNum)")
                    .frame(width:60)
                    .foregroundColor(isElla ? colorElla : colorShawn)
                
                Button {
                    winNum += 1
                    defaults.set(winNum, forKey: isElla ? "EllaWins" : "ShawnWins")
                } label: {
                    Text("+")
                }
            }
            .font(.system(size: 48))
        }
        .bold()
    }
}

struct SubwayScoreView_Previews: PreviewProvider {
    @State static var winNum = 0;
    @State static var score = 0;
    static var previews: some View {
        SubwayScoreView(winNum: $winNum, score: $score)
    }
}
