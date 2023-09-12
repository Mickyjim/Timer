//
//  TimerView.swift
//  Timer
//
//  Created by Michael Favre on 12/09/2023.
//

import SwiftUI

struct TimerView: View {

    let totalTime: String
    let remainingTime: String
    let isTimerOver: Bool
    let action: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text(totalTime)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Remaining Time: \(remainingTime)")
                .font(.title)
            
            if isTimerOver {
                Text("Time is up!")
                    .font(.title)
            }
            
            Button(action: action) {
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.orange)
            }
        }
        .padding()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(totalTime: "30 Secs", remainingTime: "00:10", isTimerOver: false, action: {})
    }
}
