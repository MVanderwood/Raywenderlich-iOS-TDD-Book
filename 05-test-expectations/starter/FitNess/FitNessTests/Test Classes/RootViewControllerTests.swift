//
//  RootViewControllerTests.swift
//  FitNessTests
//
//  Created by Michael Vanderwood on 8/18/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest

@testable import FitNess

class RootViewControllerTests: XCTestCase {
  var sut: RootViewController!

  override func setUp() {
    super.setUp()

    sut = loadRootViewController()
    sut.reset()
  }

  override func tearDown() {
    AlertCenter.instance.clearAlerts()
    sut = nil

    super.tearDown()
  }

  func testWhenLoaded_noAlertsAreShown() {
    XCTAssertTrue(sut.alertContainer.isHidden)
  }

  func testWhenAlertsPosted_alertContainerIsShown() {
    // given
    let exp = expectation(forNotification: AlertNotification.name, object: nil, handler: nil)
    let alert = Alert("show the container")

    // when
    AlertCenter.instance.postAlert(alert: alert)

    // then
    wait(for: [exp], timeout: 1.0)
    XCTAssertFalse(sut.alertContainer.isHidden)
  }
}
