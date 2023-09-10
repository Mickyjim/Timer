//
//  TimerViewModel.swift
//  Timer
//
//  Created by Michael Favre on 10/09/2023.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var remainingSeconds: Int
    private var timer: Timer?
    
    init(initialSeconds: Int) {
        self.remainingSeconds = initialSeconds
    }

    func start() {
        guard timer == nil else { return } // Ensure the timer is not already running
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if self.remainingSeconds > 0 {
                self.remainingSeconds -= 1
            } else {
                // Timer is up, handle this scenario (e.g., display "Time is up")
                self.timer?.invalidate()
            }
        }
    }
}
