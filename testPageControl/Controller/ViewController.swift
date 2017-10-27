//
//  ViewController.swift
//  testPageControl
//
//  Created by Руслан on 22.10.2017.
//  Copyright © 2017 Руслан. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nTextField: UITextField!
    @IBOutlet weak var titleLable: UILabel!
    var textNStr: String = ""
    
    @IBOutlet weak var resultButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func result(_ sender: UIButton) {
            if(Int(nTextField.text!)! <= 100) {
                textNStr = String(nTextField.text!)
                let urlString = "https://jsonplaceholder.typicode.com/posts/\(textNStr)"
                guard let url = URL(string: urlString) else { return }
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print("ERROR")
                    } else {
                        if let content = data {
                            do {
                                let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                                DispatchQueue.main.async { 
                                    self.titleLable.text = (myJson["title"] as! String)
                                    self.idLabel.text = String((myJson["id"] as! Int))
                                }
                            } catch let jsonError {
                                print(jsonError.localizedDescription)
                            }
                        }
                    }
                }
                task.resume()
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

