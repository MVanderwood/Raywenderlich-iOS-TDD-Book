//
//  Pedometer.swift
//  FitNess
//
//  Created by Michael Vanderwood on 8/23/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation

protocol Pedometer {
  var pedometerAvailable: Bool { get }
  var permissionDeclined: Bool { get }
  
  func start(
    dataUpdates: @escaping (PedometerData?, Error?) -> Void,
    eventUpdates: @escaping (Error?) -> Void
  )

  func stop()
}

protocol PedometerData {
  var steps: Int { get }
  var distanceTravelled: Double { get }
}
