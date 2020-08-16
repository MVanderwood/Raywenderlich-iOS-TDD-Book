//
//  ViewControllers.swift
//  FitNessTests
//
//  Created by Michael Vanderwood on 8/16/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import UIKit

@testable import FitNess

func loadRootViewController() -> RootViewController {
  let window = UIApplication.shared.windows[0]
  return window.rootViewController as! RootViewController
}
