//
//  ViewController.swift
//  surf
//
//  Created by vaslobas on 09.02.2023.
//

import UIKit

class ViewController: UIViewController {
  
  let offsetFromEdges: CGFloat = 20
  
  private lazy var mainScrollView: UIScrollView = {
    let mainScrollView = UIScrollView()
    mainScrollView.frame = self.view.bounds
    mainScrollView.bounces = false
    mainScrollView.translatesAutoresizingMaskIntoConstraints = false
    return mainScrollView
  }()
  
  
  private let backgroundImage: UIImageView = {
    let backgroundImage = UIImageView()
    backgroundImage.image = UIImage(named: "bgImage")
    backgroundImage.frame = UIScreen.main.bounds
    backgroundImage.contentMode = .scaleAspectFill
    backgroundImage.translatesAutoresizingMaskIntoConstraints = false
    return backgroundImage
  }()
  
  private let contentView: UIView = {
    let contentView = UIView()
    contentView.backgroundColor = Brand.Colors.contentBG
    contentView.layer.cornerRadius = 32
    contentView.translatesAutoresizingMaskIntoConstraints = false
    return contentView
  }()
  
  private let contentLabel: UILabel = {
    let label = UILabel()
    label.text = "Стажировка в Surf"
    label.textColor = Brand.Colors.Heading
    label.font = Brand.Text.heading
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private var contentDescription: UILabel {
    let contentDescription = UILabel()
    contentDescription.numberOfLines = 3
    contentDescription.textColor = Brand.Colors.normalText
    contentDescription.font = Brand.Text.normal
    contentDescription.translatesAutoresizingMaskIntoConstraints = false
    return contentDescription
  }
  
  private lazy var firstDescription: UILabel = {
    let firstDescription = contentDescription
    firstDescription.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
    return firstDescription
  }()
  
  private lazy var secondDescription: UILabel = {
    let secondDescription = contentDescription
    secondDescription.text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
    return secondDescription
  }()
  
  private lazy var thirdDescription: UILabel = {
    let thirdDescription = contentDescription
    thirdDescription.text = "Хочешь к нам?"
    return thirdDescription
  }()
  
  private let bottomView: UIView = {
    let bottomView = UIView()
    bottomView.backgroundColor = Brand.Colors.contentBG
    bottomView.translatesAutoresizingMaskIntoConstraints = false
    return bottomView
  }()
  
  
  private let sendApplication: UIButton = {
    let sendApplication = UIButton()
    sendApplication.setTitle("Отправить заявку", for: .normal)
    sendApplication.setTitle("Заявка отправлена", for: .disabled)
    sendApplication.setTitleColor(.white, for: .normal)
    sendApplication.setTitleColor(Brand.Colors.Heading, for: .disabled)
    sendApplication.backgroundColor = Brand.Colors.buttonHLBG
    sendApplication.layer.cornerRadius = 30
    sendApplication.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    sendApplication.sizeToFit()
    sendApplication.addTarget(self, action: #selector(showSuccessAlert), for: .touchUpInside)
    sendApplication.contentEdgeInsets = UIEdgeInsets(top: 20, left: 44, bottom: 20, right: 44)
    sendApplication.translatesAutoresizingMaskIntoConstraints = false
    return sendApplication
  }()
  
  
  private var firstCourses = FirstCoursesCV()
  private var secondCourses = SecondCoursesCV()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Brand.Colors.contentBG
    
    setupViews()
    setupConstraints()
  }
  
  @objc func showSuccessAlert() {
    let successAlert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
    successAlert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
    present(successAlert, animated: true) { [weak self] in
        guard let self = self else { return }
        self.sendApplication.isEnabled = false
        self.sendApplication.backgroundColor = Brand.Colors.buttonBG
    }
  }
}


//MARK: SetupViews & Constraints
extension ViewController {
  private func setupViews() {
    view.addSubview(mainScrollView)
    bottomView.addSubview(sendApplication)
    bottomView.addSubview(thirdDescription)
    
    mainScrollView.addSubview(backgroundImage)
    mainScrollView.addSubview(contentView)
    contentView.addSubview(contentLabel)
    contentView.addSubview(firstDescription)
    contentView.addSubview(firstCourses)
    contentView.addSubview(secondDescription)
    contentView.addSubview(secondCourses)
    mainScrollView.addSubview(bottomView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      
      mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
      mainScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      mainScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      mainScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      
      
      backgroundImage.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: -100),
      backgroundImage.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
      backgroundImage.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
      backgroundImage.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
      backgroundImage.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor),
      
      contentView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -250),
      contentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
      contentView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
      contentView.heightAnchor.constraint(equalToConstant: 460),
      contentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
      
      contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
      contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offsetFromEdges),
      
      
      firstDescription.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 12),
      firstDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offsetFromEdges),
      firstDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      
      firstCourses.topAnchor.constraint(equalTo: firstDescription.bottomAnchor, constant: 20),
      firstCourses.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      firstCourses.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: offsetFromEdges),
      firstCourses.heightAnchor.constraint(equalToConstant: 50),
      
      
      secondDescription.topAnchor.constraint(equalTo: firstCourses.bottomAnchor, constant: 24),
      secondDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offsetFromEdges),
      secondDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: offsetFromEdges),
      
      
      secondCourses.topAnchor.constraint(equalTo: secondDescription.bottomAnchor, constant: 12),
      secondCourses.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      secondCourses.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: offsetFromEdges),
      secondCourses.heightAnchor.constraint(equalToConstant: 100),
      
      
      bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      bottomView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
      bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      
      sendApplication.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -10),
      sendApplication.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
      
      thirdDescription.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: offsetFromEdges),
      thirdDescription.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
    ])
  }
  
}


