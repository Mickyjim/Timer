//
//  TimerViewModel.swift
//  Timer
//
//  Created by Michael Favre on 10/09/2023.
//


import SwiftUI

protocol Timerable {
    func scheduledTimer(block: @escaping (Timerable) -> Void) -> Timerable
    func stopTimer()
}

extension Timer: Timerable {
    func scheduledTimer(block: @escaping (Timerable) -> Void) -> Timerable {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            block(timer)
        }
    }
    
    func stopTimer() {
        self.invalidate()
    }
}

class TimerViewModel: ObservableObject {
    
    @Published var remainingSeconds: Int
    
    var timer: Timerable?
    private var timerProvider: () -> Timerable
    
    init(initialSeconds: Int, timerProvider: @escaping () -> Timerable = Timer.init) {
        self.remainingSeconds = initialSeconds
        self.timerProvider = timerProvider
    }

    func start() {
        guard timer == nil else { return }
        
        timer = timerProvider().scheduledTimer(block: { [weak self] _ in
            guard let self else { return }
            
            if remainingSeconds > 0 {
                remainingSeconds -= 1
            } else {
                timer?.stopTimer()
                timer = nil
            }
        })
    }
}
