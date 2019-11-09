//
//  Global.swift
//  SignupValidations
//
//  Created by Sai Teja on 2019-11-08.
//  Copyright © 2019 MacStudent. All rights reserved.
//

//

import Foundation
import UIKit

enum UserValidationState {
    case valid
    case invalid(String)
}

func showAlert(withMessage message: String? = nil, title: String = "Alert", okayTitle: String = "Ok", cancelTitle: String? = nil,viewController:UIViewController, okCall: @escaping () -> () = { }, cancelCall: @escaping () -> () = { }) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    if let cancelTitle = cancelTitle {
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel) { (_) in
            cancelCall()
        }
        alert.addAction(cancelAction)
    }
    let okayAction = UIAlertAction(title: okayTitle, style: .default) { (_) in
        okCall()
    }
    alert.addAction(okayAction)
    viewController.present(alert, animated: true)
}
