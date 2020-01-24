//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum Currency {
    case cad
    case mxn
}

class ViewController: UIViewController {
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let usdTextFieldInput = fromCurrencyTextField.text
        let usdAmount = Double(usdTextFieldInput); else { return }
        
        var convertedAmount: Double = 0
        if mxnButton.isSelected == true {
            convertedAmount = convert(dollars: usdAmount, to: .cad)
        }
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        if sender == mxnButton{
            mxnButton.isSelected = true
            cadButton.isSelected = false
            toCurrencyLabel.text = "Currency (MXN)"
        } else if sender == cadButton{
            mxnButton.isSelected = false
            cadButton.isSelected = true
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        if sender == mxnButton{
            mxnButton.isSelected = true
            cadButton.isSelected = false
            toCurrencyLabel.text = "Currency (MXN)"
        } else if sender == cadButton{
            mxnButton.isSelected = false
            cadButton.isSelected = true
            toCurrencyLabel.text = "Currency (CAD)"
        }
    }
    
    // MARK: - Helper Methods
    func convert(dollars: Double, to unit: Currency) -> Double {
        let money: Double = dollars
        var conversion: Double = 0
        
        switch unit {
        case .cad:
            conversion = money * 1.35
        case .mxn:
            conversion = money * 19.78
        }
        return conversion
    }
}

