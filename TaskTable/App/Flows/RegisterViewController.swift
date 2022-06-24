//
//  RegisterViewController.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 23.06.2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let requestFactory = RequestFactory()
    


    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerRequest() 
      
    }
    
    func registerRequest() {
        let register  = requestFactory.makeLoginRequestFactory()
        let login = loginTextField.text
        let password = passwordTextField.text
        
        register
            .registration(username: login ?? "", password: password ?? "") { response in
                switch response.result {
                case .success(let login):
                    print(login)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }


}
