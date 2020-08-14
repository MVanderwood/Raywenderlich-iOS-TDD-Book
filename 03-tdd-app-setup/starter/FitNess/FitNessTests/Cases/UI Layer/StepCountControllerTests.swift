//
//  StepCountControllerTests.swift
//  FitNessTests
//
//  Created by Michael Vanderwood on 8/14/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest

@testable import FitNess

class StepCountControllerTests: XCTestCase {
  var sut: StepCountController!

  override func setUpWithError() throws {
    try super.setUpWithError()

    sut = StepCountController()
  }

  override func tearDownWithError() throws {
    sut = nil

    try super.tearDownWithError()
  }

  // MARK:- Initial State
  func testController_whenCreated_buttonLabelIsStart() {
    // given
    sut.viewDidLoad()

    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.notStarted.nextStateButtonLabel)
  }

  // MARK:- In Progress
  func testController_whenStartTapped_appIsInProgress() {
    // when
    applySutStartStopPause(withSender: nil)

    // then
    let state = AppModel.instance.appState
    XCTAssertEqual(state, AppState.inProgress)
  }

  func testController_whenStartTapped_buttonLabelIsPause() {
    // when
    applySutStartStopPause(withSender: nil)

    // then
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.inProgress.nextStateButtonLabel)
  }

  private func applySutStartStopPause(withSender sender: Any?) {
    sut.startStopPause(sender)
  }
}
