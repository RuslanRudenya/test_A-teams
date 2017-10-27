//
//  TodosViewController.swift
//  testPageControl
//
//  Created by Руслан on 23.10.2017.
//  Copyright © 2017 Руслан. All rights reserved.
//

import UIKit

class TodosViewController: UIViewController {

    let rand = Int(arc4random_uniform(UInt32(200-1)) + 1) + 1
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var completedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://jsonplaceholder.typicode.com/todos/\(rand)"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("ERROR")
            } else {
                if let content = data {
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                        print(myJson["id"] as! Int)
                        DispatchQueue.main.async {
                            self.titleLabel.text = (myJson["title"] as! String)
                            self.idLabel.text = String((myJson["id"] as! Int))
                            self.completedLabel.text = String((myJson["completed"] as! Bool))
                        }
                    } catch let jsonError {
                        print(jsonError.localizedDescription)
                    }
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
