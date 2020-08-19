//
//  Notifcations+Tests.swift
//  FitNessTests
//
//  Created by Michael Vanderwood on 8/18/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import Foundation

@testable import FitNess

extension Notification {
  var alert: Alert? { userInfo?[AlertNotification.Keys.alert] as? Alert }
}
