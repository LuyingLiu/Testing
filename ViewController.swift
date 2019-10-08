//
//  ViewController.swift
//  yws3_l3
//
//  Created by Yana Sang on 10/7/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

// This is how you create a protocol, or pass information between view controllers.
// View Controllers that are the delegate for other ones will need to implement this method.
protocol ChangeButtonTextDelegate: class {
    func changeButtonText(to newString: String)
}

class ViewController: UIViewController {

    var pushNavViewControllerButton: UIButton!
    var presentModalViewControllerButton: UIButton!
          
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
          
        // Set the navigation controller's title!
        title = "Navigation Demo"
          
        pushNavViewControllerButton = UIButton()
        pushNavViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushNavViewControllerButton.setTitle("Push Navigation VC", for: .normal)
        pushNavViewControllerButton.setTitleColor(.blue, for: .normal)
        pushNavViewControllerButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        view.addSubview(pushNavViewControllerButton)
          
        presentModalViewControllerButton = UIButton()
        presentModalViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        presentModalViewControllerButton.setTitle("Present Modal VC [change my name]", for: .normal)
        presentModalViewControllerButton.setTitleColor(.red, for: .normal)
        presentModalViewControllerButton.addTarget(self, action: #selector(presentModalViewController), for: .touchUpInside)
        view.addSubview(presentModalViewControllerButton)
          
        setupConstraints()
    }
          
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pushNavViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushNavViewControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushNavViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])
          
        NSLayoutConstraint.activate([
            presentModalViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentModalViewControllerButton.topAnchor.constraint(equalTo: pushNavViewControllerButton.bottomAnchor, constant: 16),
            presentModalViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])
    }
          
    @objc func pushNavViewController() {
        let viewController = BlueViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
          
    @objc func presentModalViewController() {
        let viewController = RedViewController(textFieldText: presentModalViewControllerButton.title(for: .normal)!)
        viewController.delegate = self
        present(viewController, animated: true, completion: nil)
    }

}
// This is an extension of a ViewController. Typically, you use these to break up your ViewControllers
// into smaller, more well-defined chunks. You could implement this inside the body of code up above,
// and have the class be
//
// class ViewController: UIViewController, ChangeButtonTitleDelegate { ... }
//
// But this is more readable, because you know only this code is what you implemented so that
// other view controllers can call this function to change the button's title.
//
// In this case, ViewController now must implement the methods declared by the protocol
// ChangeButtonTitleDelegate. It's very similar to Java syntax in that regard.
extension ViewController: ChangeButtonTextDelegate {
    func changeButtonText(to newString: String) {
        presentModalViewControllerButton.setTitle(newString, for: .normal)
    }
}
