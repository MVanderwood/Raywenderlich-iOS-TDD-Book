//
//  MockPedometer.swift
//  FitNessTests
//
//  Created by Michael Vanderwood on 8/23/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation
import CoreMotion

@testable import FitNess

class MockPedometer: Pedometer {
  private(set) var started: Bool = false

  var pedometerAvailable: Bool = true
  var permissionDeclined: Bool = false

  var updateBlock: ((Error?) -> Void)?
  var dataBlock  : ((PedometerData?, Error?) -> Void)?

  var error: Error?

  func start(dataUpdates: @escaping (PedometerData?, Error?) -> Void, eventUpdates: @escaping (Error?) -> Void ) {
    started = true
    updateBlock = eventUpdates
    dataBlock = dataUpdates

    DispatchQueue.global(qos: .default).async {
      self.updateBlock?(self.error)
    }
  }

  func stop() {
    started = false
  }

  func sendData(_ data: PedometerData?) {
    if started {
      dataBlock?(data, error)
    }
  }

  static let notAuthorizedError = NSError(domain: CMErrorDomain, code: Int(CMErrorMotionActivityNotAuthorized.rawValue), userInfo: nil)
}
