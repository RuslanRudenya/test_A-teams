//
//  CommentsViewController.swift
//  testPageControl
//
//  Created by Руслан on 23.10.2017.
//  Copyright © 2017 Руслан. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var NTextField: UITextField!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var n: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func resultButton(_ sender: UIButton) {
        if(Int(NTextField.text!)! <= 500) {
            n = String(NTextField.text!)
            let urlString = "https://jsonplaceholder.typicode.com/comments/\(n)"
            guard let url = URL(string: urlString) else { return }
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("ERROR")
                } else {
                    if let content = data {
                        do {
                            let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                            DispatchQueue.main.async { 
                                self.nameLabel.text = (myJson["name"] as! String)
                                self.idLabel.text = String((myJson["id"] as! Int))
                                self.emailLabel.text = (myJson["email"] as! String)
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
}
