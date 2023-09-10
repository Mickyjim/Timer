//
//  TimerViewModel.swift
//  Timer
//
//  Created by Michael Favre on 10/09/2023.
//

import Foundation

class TimerViewModel {
    var initialSeconds: Int
    var remainingSeconds: Int

    init(initialSeconds: Int) {
        self.initialSeconds = initialSeconds
        self.remainingSeconds = initialSeconds
    }
}

