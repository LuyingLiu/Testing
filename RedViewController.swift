//
//  RedViewController.swift
//  L3
//
//  Created by Yana Sang on 10/7/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    var button: UIButton!
    var textField: UITextField!
    var textFieldText: String

    /*
     Why is this a "weak" variable? This is essentially due to Swift's memory management.
     Swift uses ARC, or automatic reference counting to manage memory. This means that it counts
     how many objects are pointing to one another. Since this delegate is probably
     implemented in another ViewController, a retain cycle can occur, where
     each ViewController references one another. This means that the ViewControllers will
     hog up memory and never be deallocated if they are strongly referenced (no weak keyword).
    
     With the weak keyword, Swift knows to change the delegate to nil/deallocate the delegate
     if nothing is holding a reference to it. Then, your memory won't be clogged up!
    
     This is definitely not something you need to know right now, but feel free to look into
     how Swift manages memory in your free time:
     https://krakendev.io/blog/weak-and-unowned-references-in-swift
     */
    weak var delegate: ChangeButtonTextDelegate?

    // Creating a custom initializer for a ViewController
    init(textFieldText: String) {
        self.textFieldText = textFieldText
        super.init(nibName: nil, bundle: nil)
    }

    // This function is required, you can ignore it
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        // Setting the textfield's placeholder text to be the one we received from the custom initializer
        textField.text = textFieldText
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.clearsOnBeginEditing = true
        view.addSubview(textField)

        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dismiss and save text", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)

        // When the button is pressed, dismiss this ModalViewController and change the button name
        button.addTarget(self, action: #selector(dismissViewControllerAndSaveText), for: .touchUpInside)
        view.addSubview(button)

        setupConstraints()
    }

    func setupConstraints() {
        // textField constraints
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -24),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 24)
            ])
          
        // button constraints
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 48)
            ])
    }

    @objc func dismissViewControllerAndSaveText() {
        // If let statements can also chain boolean checks after them, like a normal if statement.
        if let text = textField.text, text != "" {
            // Here, we're delegating someone to handle when the button title has changed
            // We don't know if anyone heard, but if they did, they should handle it
            // The method for textFieldTextChanged(to:) is in ViewController.
            delegate?.changeButtonText(to: text)
        }
        // To dismiss something modally, we use the dismiss(animated:completion) command.
        dismiss(animated: true, completion: nil)
    }

}
