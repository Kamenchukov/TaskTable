//
//  TableViewController.swift
//  TaskTable
//
//  Created by Константин Каменчуков on 23.06.2022.
//

import UIKit

class TableViewController: UIViewController {

    var todoList: Int = 0
    var name: String = ""
    
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CreateTaskRequest()
        ListOfTasksRequest()
        ListRequest()
    }
    

   

}
