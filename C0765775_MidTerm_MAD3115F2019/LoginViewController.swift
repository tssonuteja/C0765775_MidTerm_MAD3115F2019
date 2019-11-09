


import UIKit

class LoginViewController: UIViewController {
    
 @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rememberSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        switch validateLoginCredentials {
        case .valid:
            showAlert(withMessage: "Login Successfull",viewController: self,okCall:{
                self.moveToCustomersScreen()
            })
        case .invalid(let error):
            showAlert(withMessage: error,viewController: self)
        }
    }
   
    func moveToCustomersScreen(){
        if #available(iOS 13.0, *) {
            if let billDetailsVC = self.storyboard?.instantiateViewController(identifier: "CustomerListTableViewController") as? CustomerListTableViewController{
                self.navigationController?.pushViewController(billDetailsVC, animated: true)
            }
        } else {
            
        }
        }
    }
    extension LoginViewController {
    var validateLoginCredentials:UserValidationState {
        if emailTextField.text.isBlank {
            return .invalid(ATErrorMessage.Email.emptyNew)
        }
        else if !emailTextField.text!.isEmail {
            return .invalid(ATErrorMessage.Email.invalid)
        }
        else if passwordTextField.text.isBlank {
            
            return .invalid(ATErrorMessage.Password.newEmpty)
        }
        return .valid
    }
}

