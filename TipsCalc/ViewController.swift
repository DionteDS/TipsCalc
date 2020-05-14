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
    
    let tipCalaculatorTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(string: "Tip Calculator", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor(red: 179/255, green: 55/255, blue: 113/255, alpha: 1.0)])
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(string: "Total", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor(red: 179/255, green: 55/255, blue: 113/255, alpha: 1.0)])
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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(NSAttributedString(string: "10%", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25), NSAttributedString.Key.foregroundColor: UIColor.white]), for: .normal)
        button.addTarget(self, action: #selector(tenPercentTapped), for: .touchUpInside)
        button.designButtonBorder()
        return button
    }()
    
    var didSelect = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayouts()
    }
    
    private func setupLayouts() {
        
        // topView constraints
        
        view.addSubview(topView)
        topView.addSubview(tipCalaculatorTitle)
        topView.addSubview(totalLabel)
        topView.addSubview(digitsLabel)
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
        digitsLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 10).isActive = true
        digitsLabel.centerXAnchor.constraint(equalTo: totalLabel.centerXAnchor, constant: 0).isActive = true
        
        // underline constraints
        underline.topAnchor.constraint(equalTo: digitsLabel.bottomAnchor, constant: 3).isActive = true
        underline.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 80).isActive = true
        underline.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -80).isActive = true
//        underline.centerXAnchor.constraint(equalTo: digitsLabel.centerXAnchor, constant: 0).isActive = true
        underline.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        // middleView constraints
        
        view.addSubview(middleView)
        middleView.addSubview(tipPercentageLabel)
        middleView.addSubview(tenPercentButton)
        
        // middleView constraints
        middleView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
        middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        middleView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.height / 3).isActive = true
        
        // tipPercentageLabel constraints
        tipPercentageLabel.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 10).isActive = true
        tipPercentageLabel.centerXAnchor.constraint(equalTo: middleView.centerXAnchor, constant: 0).isActive = true
        
        tenPercentButton.topAnchor.constraint(equalTo: tipPercentageLabel.bottomAnchor, constant: 10).isActive = true
        tenPercentButton.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 60).isActive = true
        tenPercentButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -60).isActive = true
        tenPercentButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func tenPercentTapped() {
        
        print("Tapped")
        
        tenPercentButton.backgroundColor = .red
        
    }


}

