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
    
    let underline: UIView = {
        let underline = UIView()
        underline.translatesAutoresizingMaskIntoConstraints = false
        underline.backgroundColor = UIColor.black
        return underline
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "Reset", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor(red: 179/255, green: 55/255, blue: 113/255, alpha: 1.0)]), for: .normal)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 30
        button.backgroundColor = .clear
        return button
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
        button.addTarget(self, action: #selector(fifthteenPercentTapped), for: .touchUpInside)
        return button
    }()
    
    let twentyPercentButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSAttributedString(string: "20%", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.white]), for: .normal)
        button.designButtonBorder()
        button.addTarget(self, action: #selector(twentyPercentTapped), for: .touchUpInside)
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
    
    // MARK: - BottomView properties
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 206/255, green: 214/255, blue: 224/255, alpha: 1.0)
        return view
    }()
    
    let displayBillLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let displayTipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let displayGrandTotal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var amount: Double = 0
    var didTap: Bool = true
    
    // MARK: Setup Constraints

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
        topView.addSubview(tipTextField)
        topView.addSubview(underline)
        topView.addSubview(resetButton)
        
        // TopView constraints
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height / 3).isActive = true
        
        // tipCalculatorTitle constraints
        tipCalaculatorTitle.topAnchor.constraint(equalTo: topView.topAnchor, constant: 70).isActive = true
        tipCalaculatorTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor, constant: 0).isActive = true
        
        
        // totalLabel constraints
        totalLabel.topAnchor.constraint(equalTo: tipCalaculatorTitle.bottomAnchor, constant: 10).isActive = true
        totalLabel.centerXAnchor.constraint(equalTo: tipCalaculatorTitle.centerXAnchor, constant: 0).isActive = true
        
        // tipTextField constraints
        tipTextField.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 10).isActive = true
        tipTextField.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 80).isActive = true
        tipTextField.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -80).isActive = true
        tipTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // underline constraints
        underline.topAnchor.constraint(equalTo: tipTextField.bottomAnchor, constant: 5).isActive = true
        underline.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 80).isActive = true
        underline.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -80).isActive = true
        underline.heightAnchor.constraint(equalToConstant: 5).isActive = true
        
        // resetButton constraints
        resetButton.topAnchor.constraint(equalTo: underline.bottomAnchor, constant: 15).isActive = true
        resetButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 60).isActive = true
        resetButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -60).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
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
        
        view.addSubview(bottomView)
        bottomView.addSubview(displayBillLabel)
        bottomView.addSubview(displayTipLabel)
        bottomView.addSubview(displayGrandTotal)
        
        // bottomView constraints
        bottomView.topAnchor.constraint(equalTo: middleView.bottomAnchor, constant: 0).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height / 3).isActive = true
        
        // displayBillLabel constraints
        displayBillLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 50).isActive = true
        displayBillLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 0).isActive = true
        
        // displayTipLabel constraints
        displayTipLabel.topAnchor.constraint(equalTo: displayBillLabel.bottomAnchor, constant: 10).isActive = true
        displayTipLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor, constant: 0).isActive = true
        
        // displayGrandTotal constraints
        displayGrandTotal.topAnchor.constraint(equalTo: displayTipLabel.bottomAnchor, constant: 10).isActive = true
        displayGrandTotal.centerXAnchor.constraint(equalTo: displayTipLabel.centerXAnchor, constant: 0).isActive = true
    }
    
    // MARK: Percentage buttons functions
    
    // 10% button
    @objc func tenPercentTapped() {
        
        // if true disable the 15% and 20% buttons and then calculate the total + tip
        // else reset the buttons
        if didTap {
            
            print("Tapped")
            
            let tenPercentAdded = amount * 0.10
            
            let grandTotal = amount + tenPercentAdded
            
            let formattedTip = String(format: "$%.02f", tenPercentAdded)
            let formattedTotal = String(format: "$%.02f", grandTotal)
            let formattedBill = String(format: "$%.02f", amount)
            
            print("Grand total: \(String(format: "$%.02f", grandTotal))")
            
            fifthteenPercentButton.isEnabled = false
            twentyPercentButton.isEnabled = false
            tenPercentButton.backgroundColor = .red
            
            displayTotal(tip: formattedTip, total: formattedTotal, bill: formattedBill)
            
            didTap = false
        } else {
            fifthteenPercentButton.isEnabled = true
            twentyPercentButton.isEnabled = true
            tenPercentButton.backgroundColor = .clear
            
            didTap = true
        }
        
    }
    
    // 15% button
    @objc func fifthteenPercentTapped() {
        
        // if true disable the 10% and 20% buttons and then calculate the total + tip
        // else reset the buttons
        if didTap {
            
            print("tapped")
            
            let fifthteenPercentAdded = amount * 0.15
            
            let grandTotal = amount + fifthteenPercentAdded
            
            let formattedTip = String(format: "$%.02f", fifthteenPercentAdded)
            let formattedTotal = String(format: "$%.02f", grandTotal)
            let formattedBill = String(format: "$%.02f", amount)
            
            print("Grand total: \(String(format: "$%.02f", grandTotal))")
            
            fifthteenPercentButton.backgroundColor = .red
            
            displayTotal(tip: formattedTip, total: formattedTotal, bill: formattedBill)
            
            tenPercentButton.isEnabled = false
            twentyPercentButton.isEnabled = false
            
            didTap = false
        } else {
            tenPercentButton.isEnabled = true
            twentyPercentButton.isEnabled = true
            fifthteenPercentButton.backgroundColor = .clear
            
            didTap = true
        }
        
    }
    
    // 20% button
    @objc func twentyPercentTapped() {
        
        // if true disable the 10% and 15% buttons and then calculate the total + tip
        // else reset the buttons
        if didTap {
            
            let twentyPercentAdded = amount * 0.20
            
            let grandTotal = amount + twentyPercentAdded
            
            let formattedTip = String(format: "$%.02f", twentyPercentAdded)
            let formattedTotal = String(format: "$%.02f", grandTotal)
            let formattedBill = String(format: "$%.02f", amount)
            
            print("Grand Total: \(String(format: "$%.02f", grandTotal))")
            
            twentyPercentButton.backgroundColor = .red
            
            tenPercentButton.isEnabled = false
            fifthteenPercentButton.isEnabled = false
            
            displayTotal(tip: formattedTip, total: formattedTotal, bill: formattedBill)
            
            didTap = false
        } else {
            tenPercentButton.isEnabled = true
            fifthteenPercentButton.isEnabled = true
            twentyPercentButton.backgroundColor = .clear
            
            didTap = true
        }
        
    }
    
    
    
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
    
    // MARK: - Display the grand total
    
    func displayTotal(tip: String, total: String, bill: String) {
        
        print("The tip: \(tip)")
        print("Total + tip: \(total)")
        
        displayBillLabel.font = UIFont.boldSystemFont(ofSize: 40)
        displayBillLabel.text = "Bill \(bill)"
        
        displayTipLabel.font = UIFont.boldSystemFont(ofSize: 40)
        displayTipLabel.text = "Tip \(tip)"
        
        displayGrandTotal.font = UIFont.boldSystemFont(ofSize: 40)
        displayGrandTotal.text = "Total \(total)"
        
    }
    
    // MARK: - Reset button
    
    // Reset everything
    @objc func resetButtonTapped() {
        
        amount = 0
        didTap = true
        tipTextField.text = ""
        tipTextField.placeholder = "$0.00"
        
        tenPercentButton.isEnabled = true
        tenPercentButton.backgroundColor = .clear
        
        fifthteenPercentButton.isEnabled = true
        fifthteenPercentButton.backgroundColor = .clear
        
        twentyPercentButton.isEnabled = true
        twentyPercentButton.backgroundColor = .clear
        
        displayTotal(tip: "$0.00", total: "$0.00", bill: "$0.00")
    }

}

// MARK: - TextField Delegate Methods

extension TipsViewController: UITextFieldDelegate {
    
    
    
}
