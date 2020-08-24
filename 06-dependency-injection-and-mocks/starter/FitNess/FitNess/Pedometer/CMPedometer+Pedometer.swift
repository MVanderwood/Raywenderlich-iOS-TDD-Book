//
//  CMPedometer+Pedometer.swift
//  FitNess
//
//  Created by Michael Vanderwood on 8/23/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation
import CoreMotion

extension CMPedometer: Pedometer {
  var pedometerAvailable: Bool {
    return CMPedometer.isStepCountingAvailable() &&
      CMPedometer.isDistanceAvailable() &&
      CMPedometer.authorizationStatus() != .restricted
  }
  var permissionDeclined: Bool {
    return CMPedometer.authorizationStatus() == .denied
  }

  func start(dataUpdates: @escaping (PedometerData?, Error?) -> Void, eventUpdates: @escaping (Error?) -> Void) {
    startEventUpdates { event, error in
      eventUpdates(error)
    }

    startUpdates(from: Date()) { data, error in
      dataUpdates(data, error)
    }
  }

  func stop() {
    stopUpdates()
  }
}

extension CMPedometerData: PedometerData {
  var steps: Int { numberOfSteps.intValue }
  var distanceTravelled: Double { distance?.doubleValue ?? 0.0 }
}
