//
//  MockData.swift
//  FitNessTests
//
//  Created by Michael Vanderwood on 8/23/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation

@testable import FitNess

struct MockData: PedometerData {
  let steps: Int
  let distanceTravelled: Double
}
