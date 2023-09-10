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
    private var timer: Timer?

    init(initialSeconds: Int) {
        self.initialSeconds = initialSeconds
        self.remainingSeconds = initialSeconds
    }
    
    func start() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                
                if self.remainingSeconds > 0 {
                    self.remainingSeconds -= 1
                } else {
                    self.timer?.invalidate()
                }
            }
            RunLoop.main.add(timer!, forMode: .common)
        }
    }
}

