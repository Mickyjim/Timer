//
//  Timer15View.swift
//  Timer
//
//  Created by Michael Favre on 10/09/2023.
//

import SwiftUI

struct TimerView15: View {
    @StateObject private var viewModel = TimerViewModel(initialSeconds: 15)

    var body: some View {
        VStack(spacing: 20) {
            Text("15 Secs")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Remaining Time: \(viewModel.remainingSeconds)")
                .font(.title)
            
            if viewModel.remainingSeconds == 0 {
                Text("Time is up!")
                    .font(.title)
            }
            
            Button(action: {
                viewModel.start()
            }) {
                Image(systemName: "play.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.orange)
            }
        }
        .padding()
    }
}

struct TimerView15_Previews: PreviewProvider {
    static var previews: some View {
        TimerView15()
    }
}
