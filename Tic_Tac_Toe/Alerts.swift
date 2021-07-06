//
//  Alerts.swift
//  Tic_Tac_Toe
//
//  Created by Akash Sarkar on 2/7/21.
//

import SwiftUI

struct AlertItem: Identifiable {
  let id = UUID()
  var title: Text
  var message: Text
  var buttonTitle: Text
}

struct AlertContext {
  static let humanWin = AlertItem(title: Text("You Win"),
    message: Text("Congrats"),
    buttonTitle: Text("Okay"))

  static let computerWin = AlertItem(title: Text("you lost"),
    message: Text("Sorry You lost"),
    buttonTitle: Text("Rematch"))

  static let Draw = AlertItem(title: Text("Draw"),
    message: Text("Okay"),
    buttonTitle: Text("Try again"))
}
