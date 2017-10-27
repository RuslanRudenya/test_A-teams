//
//  UsersViewController.swift
//  testPageControl
//
//  Created by Руслан on 23.10.2017.
//  Copyright © 2017 Руслан. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    var str: String = ""
    
    @IBOutlet weak var usersTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let n = 1...5
        for z in n {
            let urlString = "https://jsonplaceholder.typicode.com/users/\(z)"
            guard let url = URL(string: urlString) else { return }
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("ERROR")
                } else {
                    if let content = data {
                        do {
                            let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                            self.str.append(contentsOf: String(describing: myJson))
                            DispatchQueue.main.async {
                                self.usersTextView.text = self.str
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
    }
    


}
