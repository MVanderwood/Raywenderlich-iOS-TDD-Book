//
//  RootViewController+Tests.swift
//  FitNessTests
//
//  Created by Michael Vanderwood on 8/16/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import UIKit

@testable import FitNess

extension RootViewController {
  var stepController: StepCountController {
    return children.first {
      $0 is StepCountController
    } as! StepCountController
  }
}
