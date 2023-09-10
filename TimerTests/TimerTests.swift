//
//  TimerTests.swift
//  TimerTests
//
//  Created by Michael Favre on 10/09/2023.
//

import XCTest
@testable import Timer

class TimerTests: XCTestCase {
    
    func testTimerStartsAtInitialValue() {
        let timerViewModel = TimerViewModel(initialSeconds: 15)
        XCTAssertEqual(timerViewModel.remainingSeconds, 15)
    }
    
    func testTimerDecreasedByOneSecond() {
        let timerViewModel = TimerViewModel(initialSeconds: 15)
        timerViewModel.start()
        sleep(1)
        XCTAssertEqual(timerViewModel.remainingSeconds, 14)
    }
}
