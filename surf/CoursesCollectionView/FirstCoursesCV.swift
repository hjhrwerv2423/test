//
//  FirstCoursesCV.swift
//  surf
//
//  Created by vaslobas on 10.02.2023.
//

import UIKit

class FirstCoursesCV: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
  
  //В карусели максимум 10 элементов по ТЗ
  let maxItems = 10
  
  init() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    super.init(frame: .zero, collectionViewLayout: layout)
    
    delegate = self
    dataSource = self
    register(CourcesCollectionViewCell.self, forCellWithReuseIdentifier: CourcesCollectionViewCell.reuseId)
    
    showsHorizontalScrollIndicator = false
    contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 30)
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .none
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataFirstCourses.count <= maxItems ? dataFirstCourses.count : maxItems
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: CourcesCollectionViewCell.reuseId, for: indexPath) as! CourcesCollectionViewCell
    cell.courseButton = cell.setButton(for: dataFirstCourses, button: cell.courseButton, index: indexPath.row)
    return cell
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    dataFirstCourses[indexPath.row].isSelected = !dataFirstCourses[indexPath.row].isSelected
    collectionView.reloadItems(at: [indexPath])
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
      let indexPathForFirstCell = IndexPath(item: 0, section: 0)
      collectionView.scrollToItem(at: indexPathForFirstCell, at: .left, animated: true)
    }
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
