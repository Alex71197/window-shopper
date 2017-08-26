//
//  CurrencyTxtField.swift
//  window-shopper
//
//  Created by Alex Villacres on 8/25/17.
//  Copyright © 2017 Alex Villacres. All rights reserved.
//

import UIKit

@IBDesignable
class CurrencyTxtField: UITextField {
    
    override func draw(_ rect: CGRect) {
        // setting fixed size and creating the variable for the currency symbol and placing it into the text field correctly
        let size: CGFloat = 20
        let currencyLbl = UILabel(frame: CGRect(x: 10, y: ((frame.size.height / 2) - size / 2), width: size, height: size))
        
        // simple label formatting (b/g color, aligment, text color, and corner radius)
        currencyLbl.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)
        currencyLbl.textAlignment = .center
        currencyLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLbl.layer.cornerRadius = 5.0
        // Set clip to bounds to isolate changes to the currencyLbl (the draw func)
        currencyLbl.clipsToBounds = true
        
        // creating a formatter variable to create the actual symbol using .numberStyle and the .locale
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        // setting the currencyLbl.text (.text b/c it is a label) to the currencySymbol (property of NumberFormatter)
        currencyLbl.text = formatter.currencySymbol
        // finally adding subView to our CurrencyTxtField class in order to display the currency symbol
        addSubview(currencyLbl)
    }
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }

    override func awakeFromNib() {
        customizeView()
    }
    
    func customizeView() {
        super.awakeFromNib()
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5.0
        textAlignment = .center
        
        clipsToBounds = true
        
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }

}
