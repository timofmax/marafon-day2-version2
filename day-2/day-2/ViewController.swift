//
//  ViewController.swift
//  day-2
//
//  Created by Timofey Privalov on 04.03.2023.
//


import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Properties
    private let firstButton = BounceButton()
    private let secondButton = BounceButton()
    private let thirdButton = BounceButton()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewButtons()
        setActionsButtons()
    }
    
    //MARK: - Private Methods
    private func setupViewButtons() {
        let buttonArr = [firstButton, secondButton, thirdButton]
        let buttonNameArr = ["First Button", "Second Medium Button", "Third"]
        var verticalSpace = 60.0
        
        for i in buttonArr.enumerated() {
            let button = buttonArr[i.offset]
            view.addSubview(buttonArr[i.offset])
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: view.topAnchor, constant: verticalSpace),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            verticalSpace += 60.0
            button.layer.masksToBounds = false
            button.layer.cornerRadius = 15
            button.backgroundColor = .systemBlue
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            button.setTitle("\(buttonNameArr[i.offset])", for: .normal)
            var config = UIButton.Configuration.filled()
            config.imagePadding = 8
            config.imagePlacement = .trailing
            config.contentInsets = NSDirectionalEdgeInsets(top: 14.0, leading: 10.0, bottom: 14.0, trailing: 10.0)
            button.configuration = config
            button.setImage(UIImage(systemName: "arrow.forward.circle.fill"), for: .normal)
        }
    }
    
    private func setActionsButtons() {
        firstButton.addTarget(self, action: #selector(didTapAndDoNothing), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(didTapAndDoNothing), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(presentVc), for: .touchUpInside)
    }
    
    //MARK: - Button Manipulation Methods
    @objc private func didTapAndDoNothing() {
        print("HELLO! ")
    }
    
    @objc private func presentVc() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "second") as? SecondViewController else { return }
        vc.modalPresentationStyle = .popover
        let buttonArr = [self.firstButton, self.secondButton, self.thirdButton]
        buttonArr.forEach { button in
            DispatchQueue.main.async {
                button.backgroundColor = .lightGray
            }
        }
        present(vc, animated: true)
    }
}
