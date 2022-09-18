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
    @Binding var myScore: Int;
    @Binding var otherScore: Int;
    var isElla: Bool = false;
    
    let colorElla = Color(red: 233/255, green: 185/255, blue: 63/255);
    let colorShawn = Color(red: 59/255, green: 135/255, blue: 66/255);
    
    var body: some View {
        VStack {
            isElla ? Text("Ella").foregroundColor(colorElla).font(.system(size: 48)) : Text("Shawn").foregroundColor(colorShawn).font(.system(size: 48))
            
            // score
            HStack {
                Button {
                    if (myScore > 0) {
                        myScore -= 1
                    }
                    defaults.set(myScore, forKey: isElla ? "EllaScore" : "ShawnScore")
                } label: {
                    Text("-")
                }
                
                Text("\(myScore)")
                    .frame(width:72)
                    .foregroundColor(isElla ? colorElla : colorShawn)
                
                Button {
                    myScore += 1
                    if (myScore == SCORE_TO_WIN) {
                        myScore = 0
                        otherScore = 0
                        winNum += 1
                    }
                    defaults.set(myScore, forKey: isElla ? "EllaScore" : "ShawnScore")
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
    @State static var myScore = 0;
    @State static var otherScore = 0;
    static var previews: some View {
        SubwayScoreView(winNum: $winNum, myScore: $myScore, otherScore: $otherScore)
    }
}
