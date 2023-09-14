//
//  TimerViewSnapshotTests.swift
//  TimerTests
//
//  Created by Michael Favre on 14/09/2023.
//

import XCTest
@testable import Timer

final class TimerViewSnapshotTests: XCTestCase {

    func test_timerView_timerIsNotTrigger() {
        let sut = TimerView(totalTime: "30", remainingTime: "30", isTimerOver: false, action: {})

        assert(snapshot: sut.snapshot(for: .iPhone13(style: .light)), named: "TIMER_IS_NOT_TRIGGER_light")
        assert(snapshot: sut.snapshot(for: .iPhone13(style: .dark)), named: "TIMER_IS_NOT_TRIGGER_dark")
        assert(snapshot: sut.snapshot(for: .iPhone13(style: .dark, contentSize: .extraExtraExtraLarge)), named: "TIMER_IS_NOT_TRIGGER_xxxLarge")
    }
    
    func test_timerView_timerIsOver() {
        let sut = TimerView(totalTime: "30", remainingTime: "0", isTimerOver: true, action: {})

        assert(snapshot: sut.snapshot(for: .iPhone13(style: .light)), named: "TIMER_IS_OVER_light")
        assert(snapshot: sut.snapshot(for: .iPhone13(style: .dark)), named: "TIMER_IS_OVER_dark")
        assert(snapshot: sut.snapshot(for: .iPhone13(style: .dark, contentSize: .extraExtraExtraLarge)), named: "TIMER_IS_OVER_xxxLarge")
    }
}
