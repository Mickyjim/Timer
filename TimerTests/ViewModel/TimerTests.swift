//
//  TimerTests.swift
//  TimerTests
//
//  Created by Michael Favre on 10/09/2023.
//

import XCTest
@testable import Timer

class TimerViewModelTests: XCTestCase {

    func test_init_doesNotTriggerTimerUponCreation() {
        let (_, timer) = makeSUT()

        XCTAssertNil(timer.block)
    }
    
    func test_start_triggersTimer() {
        let (sut, timer) = makeSUT()

        sut.start()

        XCTAssertNotNil(timer.block)
    }
    
    func test_start_countsDownRemainingSecondsOnTimerIsTrigger() {
        let (sut, timer) = makeSUT(time: 10)

        sut.start()
        decrement(of: 5, action: timer.trigger)

        XCTAssertEqual(sut.remainingSeconds, 5)
    }
    
    func test_start_invalidsTimerOnRemainingSecondsHasReachedZero() {
        let (sut, timer) = makeSUT(time: 5)

        sut.start()
        decrement(of: 6, action: timer.trigger)

        XCTAssertEqual(sut.remainingSeconds, 0)
        XCTAssertNil(timer.block)
    }
    
    // MARK: - Helpers

    private func makeSUT(time: Int = 1, file: StaticString = #filePath, line: UInt = #line) -> (sut: TimerViewModel, timer: TimerStub) {
        let timer = TimerStub()
        let sut = TimerViewModel(initialSeconds: time, timerProvider: { timer })
        trackForMemoryLeaks(timer, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)

        return (sut, timer)
    }
    
    private func decrement(of seconds: Int, action: () -> Void) {
        for _ in 0 ..< seconds {
            action()
        }
    }

    private final class TimerStub: Timerable {
        
        private(set) var block: ((Timerable) -> Void)?

        func scheduledTimer(block: @escaping (Timerable) -> Void) -> Timerable {
            self.block = block
            return self
        }
        
        func stopTimer() {
            block = nil
        }
        
        func trigger() {
            block?(self)
        }
    }
}
