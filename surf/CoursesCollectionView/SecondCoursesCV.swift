//
//  SecondCoursesCV.swift
//  surf
//
//  Created by vaslobas on 11.02.2023.
//

import UIKit

class SecondCoursesCV: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
  
  init() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    super.init(frame: .zero, collectionViewLayout: layout)
    
    delegate = self
    dataSource = self
    register(CourcesCollectionViewCell.self, forCellWithReuseIdentifier: CourcesCollectionViewCell.reuseId)
    
    showsHorizontalScrollIndicator = false
    contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 30)
    
    if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
      flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    }

    
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .clear
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

              return CGSize(width: 0, height: 80 / 2)
          }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSecondCourses.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: CourcesCollectionViewCell.reuseId, for: indexPath) as! CourcesCollectionViewCell
    cell.courseButton = cell.setButton(for: dataSecondCourses, button: cell.courseButton, index: indexPath.row)
    return cell
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    dataSecondCourses[indexPath.row].isSelected = !dataSecondCourses[indexPath.row].isSelected
    collectionView.reloadItems(at: [indexPath])
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
