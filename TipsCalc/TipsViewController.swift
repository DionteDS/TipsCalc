//
//  ViewController.swift
//  TipsCalc
//
//  Created by Dionte Silmon on 5/13/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController {
    
    // MARK: - Top View properties
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 248/255, green: 239/255, blue: 186/255, alpha: 1.0)
        return view
    }()
    
    let tipTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.backgroundColor = .clear
        textField.tintColor = UIColor(red: 179/255, green: 55/255, blue: 113/255, alpha: 1.0)
        textField.placeholder = "$0.00"
        return textField
    }()
    
    let tipCalaculatorTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(string: "Tip Calculator", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor(red: 179/255, green: 55/255, blue: 113/255, alpha: 1.0)])
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(string: "Enter total below", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor(red: 179/255, green: 55/255, blue: 113/255, alpha: 1.0)])
        return label
    }()
    
    let digitsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(string: "$115.00", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 50), NSAttributedString.Key.foregroundColor: UIColor(red: 179/255, green: 55/255, blue: 113/255, alpha: 1.0)])
        return label
    }()
    
    let underline: UIView = {
        let underline = UIView()
        underline.translatesAutoresizingMaskIntoConstraints = false
        underline.backgroundColor = UIColor.black
        return underline
    }()
    
    // ----------------------------------------------------------------------------------------------------------
    
    // MARK: - Middle view properties
    
    let middleView: UIView = {
        let middleView = UIView()
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.backgroundColor = UIColor(red: 72/255, green: 126/255, blue: 176/255, alpha: 1.0)
        return middleView
    }()
    
    let tipPercentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(string: "TIP PERCENTAGE", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white])
        return label
    }()
    
    let tenPercentButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: "10%", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.white]), for: .normal)
        button.addTarget(self, action: #selector(tenPercentTapped), for: .touchUpInside)
        button.designButtonBorder()
        return button
    }()
    
    let fifthteenPercentButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: "15%", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.white]), for: .normal)
        button.designButtonBorder()
        return button
    }()
    
    let twentyPercentButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: "20%", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.white]), for: .normal)
        button.designButtonBorder()
        return button
    }()
    
    let stacks: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    // ----------------------------------------------------------------------------------------------------------
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 206/255, green: 214/255, blue: 224/255, alpha: 1.0)
        return view
    }()
    
    
    var amount: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipTextField.delegate = self
        
        self.doneButtonOnKeyboard()
        
        setupLayouts()
    }
    
    private func setupLayouts() {
        
        // topView constraints
        
        view.addSubview(topView)
        topView.addSubview(tipCalaculatorTitle)
        topView.addSubview(totalLabel)
//        topView.addSubview(digitsLabel)
        topView.addSubview(tipTextField)
        topView.addSubview(underline)
        
        // TopView constraints
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height / 3).isActive = true
        
        // tipCalculatorTitle constraints
        tipCalaculatorTitle.topAnchor.constraint(equalTo: topView.topAnchor, constant: 50).isActive = true
        tipCalaculatorTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0).isActive = true
        
        
        // totalLabel constraints
        totalLabel.topAnchor.constraint(equalTo: tipCalaculatorTitle.bottomAnchor, constant: 10).isActive = true
        totalLabel.centerXAnchor.constraint(equalTo: tipCalaculatorTitle.centerXAnchor, constant: 0).isActive = true
        
        // digitsLabel constraints
//        digitsLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 10).isActive = true
//        digitsLabel.centerXAnchor.constraint(equalTo: totalLabel.centerXAnchor, constant: 0).isActive = true
        
        // tipTextField constraints
        tipTextField.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 10).isActive = true
        tipTextField.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 80).isActive = true
        tipTextField.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -80).isActive = true
        tipTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // underline constraints
//        underline.topAnchor.constraint(equalTo: digitsLabel.bottomAnchor, constant: 3).isActive = true
//        underline.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 80).isActive = true
//        underline.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -80).isActive = true
////        underline.centerXAnchor.constraint(equalTo: digitsLabel.centerXAnchor, constant: 0).isActive = true
//        underline.heightAnchor.constraint(equalToConstant: 2).isActive = true
        underline.topAnchor.constraint(equalTo: tipTextField.bottomAnchor, constant: 5).isActive = true
        underline.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 80).isActive = true
        underline.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -80).isActive = true
        underline.heightAnchor.constraint(equalToConstant: 5).isActive = true
        
        // middleView constraints
        
        view.addSubview(middleView)
        middleView.addSubview(tipPercentageLabel)
//        middleView.addSubview(tenPercentButton)
        middleView.addSubview(stacks)
        stacks.addArrangedSubview(tenPercentButton)
        stacks.addArrangedSubview(fifthteenPercentButton)
        stacks.addArrangedSubview(twentyPercentButton)
        
        // middleView constraints
        middleView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        middleView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height / 3).isActive = true
        
        // tipPercentageLabel constraints
        tipPercentageLabel.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 10).isActive = true
        tipPercentageLabel.centerXAnchor.constraint(equalTo: middleView.centerXAnchor, constant: 0).isActive = true
        
        // stacks constraints
        
        stacks.topAnchor.constraint(equalTo: tipPercentageLabel.bottomAnchor, constant: 10).isActive = true
        stacks.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 60).isActive = true
        stacks.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -60).isActive = true
        
        tenPercentButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // 10% constraints
//        tenPercentButton.topAnchor.constraint(equalTo: tipPercentageLabel.bottomAnchor, constant: 10).isActive = true
//        tenPercentButton.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 60).isActive = true
//        tenPercentButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -60).isActive = true
//        tenPercentButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // bottomView constraints
        
        view.addSubview(bottomView)
        
        bottomView.topAnchor.constraint(equalTo: middleView.bottomAnchor, constant: 0).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height / 3).isActive = true
    }
    
    // MARK: Percentage buttons
    
    
    // 10% button
    @objc func tenPercentTapped() {
        
        print("Tapped")
        
        let tenPercentAdded = amount * 0.10
        
        let grandTotal = amount + tenPercentAdded
        
        print("Grand total: \(String(format: "$%.02f", grandTotal))")
        
        tenPercentButton.backgroundColor = .red
        
    }
    
    // 15% button
    
    // 20% button
    
    
    
    // MARK: - Done button functions
    
    // Create the done button on the textField keyboard
    private func doneButtonOnKeyboard() {
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        tipTextField.inputAccessoryView = doneToolbar
        
    }
    
    // store the amount when the done button is tapped
    @objc func doneButtonAction() {
        print(tipTextField.text!)
        
        guard let checkAmountIfNil = tipTextField.text else { fatalError("TextField is nil") }
        
        let convertAmount = Double(checkAmountIfNil)
        
        if let convert = convertAmount {
            amount = convert
            let formattedString = String(format: "$%.02f", amount)
            print(formattedString)
            tipTextField.resignFirstResponder()
        }
        
        tipTextField.resignFirstResponder()
        
    }


}

// MARK: - TextField Delegate Methods

extension TipsViewController: UITextFieldDelegate {
    
    
    
}
