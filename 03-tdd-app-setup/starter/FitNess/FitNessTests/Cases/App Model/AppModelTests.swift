//
//  AppModelTests.swift
//  FitNessTests
//
//  Created by Michael Vanderwood on 8/14/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest

@testable import FitNess

class AppModelTests: XCTestCase {
  var sut: AppModel!

  override func setUpWithError() throws {
    try super.setUpWithError()

    sut = AppModel()
  }

  override func tearDownWithError() throws {
    sut = nil

    try super.tearDownWithError()
  }

  func testAppModel_whenInitialized_isNotStartedState() {
    let initialState = sut.appState
    XCTAssertEqual(initialState, AppState.notStarted)
  }

  func testAppModel_whenStarted_isInInProgressState() {
    // 1 given app in not started
    // 2 when started
    sut.start()

    // 3 then it is in progress
    let observedState = sut.appState
    XCTAssertEqual(observedState, AppState.inProgress)
  }
}
