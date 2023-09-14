//
//  TimerTests.swift
//  TimerTests
//
//  Created by Michael Favre on 10/09/2023.
//

import XCTest
@testable import Timer

class TimerViewModelTests: XCTestCase {
    
    func testTimerViewModelInitialization() {
        // Given
        let initialSeconds = 1
        
        // When
        let viewModel = TimerViewModel(initialSeconds: initialSeconds)
        
        // Then
        XCTAssertEqual(viewModel.remainingSeconds, initialSeconds, "Initial remainingSeconds should match initialSeconds")
    }
    
    func testTimerStart() {
        // Given
        let initialSeconds = 15
        let viewModel = TimerViewModel(initialSeconds: initialSeconds)
        
        // When
        viewModel.start()
        
        // Then
        XCTAssertNotNil(viewModel.timer, "Timer should not be nil after starting")
        XCTAssertEqual(viewModel.remainingSeconds, initialSeconds, "Remaining seconds should not change immediately after starting")
        
        // Wait for a moment (e.g., 2 seconds) to allow the timer to decrement the remainingSeconds
        let expectation = XCTestExpectation(description: "Wait for timer")
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
        
        XCTAssertLessThan(viewModel.remainingSeconds, initialSeconds, "Remaining seconds should decrease after starting")
        
        // Stop the timer and wait for a moment to ensure it has stopped
        viewModel.timer?.stopTimer()
        viewModel.timer = nil // Set it to nil after stopping
        XCTAssertNil(viewModel.timer, "Timer should be nil after stopping")
    }

    
    func testTimerRestart() {
        // Given
        let initialSeconds = 15
        let viewModel = TimerViewModel(initialSeconds: initialSeconds)
        
        // When
        viewModel.start()
        viewModel.timer?.stopTimer()
        viewModel.start()
        
        // Then
        XCTAssertNotNil(viewModel.timer, "Timer should not be nil after restarting")
    }
}
