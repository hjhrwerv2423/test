//
//  ProjectConstants.swift
//  surf
//
//  Created by vaslobas on 09.02.2023.
//

import UIKit


struct Brand {
  struct Colors {
    static let contentBG = UIColor(named: "contentBG")
    static let buttonBG = UIColor(named: "buttonBG")
    static let buttonHLBG = UIColor(named: "buttonHLBG")
    static let Heading = UIColor(named: "headingColor")
    static let normalText = UIColor(named: "normalTextColor")
    static let buttonText = UIColor(named: "headingColor")
    static let buttonTextPressed: UIColor = .white
  }

  struct Text {
    static let heading = UIFont.boldSystemFont(ofSize: 24)
    static let normal = UIFont.systemFont(ofSize: 14)
    static let button = UIFont.systemFont(ofSize: 14)
  }
}
