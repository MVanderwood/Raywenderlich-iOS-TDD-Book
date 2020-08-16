//
//  DataModelTests.swift
//  FitNessTests
//
//  Created by Michael Vanderwood on 8/16/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest

@testable import FitNess

class DataModelTests: XCTestCase {
  var sut: DataModel!

  override func setUpWithError() throws {
    try super.setUpWithError()

    sut = DataModel()
  }

  override func tearDownWithError() throws {
    sut = nil

    try super.tearDownWithError()
  }

  func testModel_whenStepsReachGoal_goalIsReached() {
    // given
    sut.goal = 1_000

    // when
    sut.steps = 1_000

    // then
    XCTAssertTrue(sut.goalReached)
  }

  // MARK:- Goal
  func testModel_whenStarted_goalIsNotReached() {
    XCTAssertFalse(sut.goalReached, "goalReached should be false when the model is created")
  }

  func testGoal_whenUserCaught_cannotBeReached() {
    // given goal should be reached
    sut.goal  = 1_000
    sut.steps = 1_000

    // when caught by Nessie
    sut.distance        = 100
    sut.nessie.distance = 100

    // then
    XCTAssertFalse(sut.goalReached)
  }

  // MARK:- Nessie
  func testModel_whenStarted_userIsNotCaught() {
    XCTAssertFalse(sut.caught)
  }

  func testModel_whenUserAheadOfNessie_isNotCaught() {
    // given
    sut.distance = 1_000
    sut.nessie.distance = 100

    // then
    XCTAssertFalse(sut.caught)
  }

  func testModel_whenNessieAheadOfUser_isCaught() {
    // given
    sut.distance = 100
    sut.nessie.distance = 1_000

    // then
    XCTAssertTrue(sut.caught)
  }
}
