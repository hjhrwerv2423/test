//
//  CourcesCollectionViewCell.swift
//  surf
//
//  Created by vaslobas on 10.02.2023.
//

import UIKit

class CourcesCollectionViewCell: UICollectionViewCell {
  
  static let reuseId = "CourcesCollectionViewCell"

  var courseButton: UIButton = {
    let courseButton = UIButton()
    courseButton.setTitle("ryba", for: .normal)
    courseButton.setTitleColor(Brand.Colors.buttonText, for: .normal)
    courseButton.backgroundColor = Brand.Colors.buttonBG
    courseButton.titleLabel?.font = Brand.Text.button
    courseButton.layer.cornerRadius = 12
    courseButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
    courseButton.isUserInteractionEnabled = false
    courseButton.translatesAutoresizingMaskIntoConstraints = false
    return courseButton
  }()

  func setButton(for courses: [Course], button: UIButton, index: Int) -> UIButton {
    button.setTitle(courses[index].name, for: .normal)
    let isSelected = courses[index].isSelected

    button.backgroundColor = isSelected ? Brand.Colors.buttonHLBG : Brand.Colors.buttonBG
    button.setTitleColor(isSelected ? Brand.Colors.buttonTextPressed : Brand.Colors.buttonText, for: .normal)
    return button
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    addSubview(courseButton)

    NSLayoutConstraint.activate([
      courseButton.topAnchor.constraint(equalTo: topAnchor),
      courseButton.leadingAnchor.constraint(equalTo: leadingAnchor),
      courseButton.trailingAnchor.constraint(equalTo: trailingAnchor),
      courseButton.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }


  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
