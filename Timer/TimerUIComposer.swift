//
//  TimerUICompser.swift
//  Timer
//
//  Created by Michael Favre on 12/09/2023.
//

import SwiftUI

final class TimerUIComposer {
    private init() {}

    struct ContainerView: View {

        @ObservedObject var viewModel: TimerViewModel
        let totalTime: Int
        
        var body: some View {
            TimerView(totalTime: "\(totalTime) Secs",
                      remainingTime: "\(viewModel.remainingSeconds)",
                      isTimerOver: viewModel.remainingSeconds == 0,
                      action: viewModel.start
            )
        }
    }
    
    static func composeWith(seconds: Int) -> some View {
        let viewModel = TimerViewModel(initialSeconds: seconds)
        return ContainerView(viewModel: viewModel, totalTime: seconds)
    }
}
