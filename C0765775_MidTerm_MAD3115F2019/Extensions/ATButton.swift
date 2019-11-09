//
//  ATButton.swift
//  sample
//
//  Created by Sai Teja on 2019-11-08.
//  Copyright © 2019 MacStudent. All rights reserved.
//


import UIKit

@IBDesignable class ATButton: UIButton {

    @IBInspectable var borderClr:UIColor = .black{
        didSet{
            self.layer.borderColor = borderClr.cgColor
        }
    }
    
    @IBInspectable var border_Width:CGFloat = 1{
        didSet{
            self.layer.borderWidth = border_Width
        }
    }

}
