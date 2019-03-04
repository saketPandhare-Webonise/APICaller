//
//  ViewController.swift
//  APICaller

import UIKit
import APICaller

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Example for API calling
    func callAPI() {
        WebServiceHandler().callWebservice(url: "https://reqres.in/api/users?page=2", methodType: .get, parameters: nil, headerParameter: nil, showLoader: false, succeess: { (response, headerFeild, statusCode) in
            print("Response has \(String(describing: response))")
        }) { (error, statuscode) in
            print("Status code \(statuscode)")
        }
    }

}

