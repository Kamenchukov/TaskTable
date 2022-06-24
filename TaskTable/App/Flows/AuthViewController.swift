//
//  ViewController.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 22.06.2022.
//

import UIKit

class AuthViewController: UIViewController {
    
    let requestFactory = RequestFactory()

    
    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButton(_ sender: Any) {
//        authRequest()
    }
    
    @IBAction func regButton(_ sender: Any) {
        
    }
    
    
    
    
    func authRequest() {
        let auth = requestFactory.makeLoginRequestFactory()
        let login = loginText.text
        let passwword = passwordText.text
        
        auth
            .auth(username: login ?? "", password: passwword ?? "") { response in
                switch response.result {
                case .success(let login):
                
                    print(login)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    
}

