//
//  PhotoViewController.swift
//  testPageControl
//
//  Created by Руслан on 23.10.2017.
//  Copyright © 2017 Руслан. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://jsonplaceholder.typicode.com/photos/3"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("ERROR")
            } else {
                if let content = data {
                    do {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                        let theImageURL = NSURL(string: (myJson["url"] as! String))
                        if let imageData = NSData(contentsOf: theImageURL! as URL) {
                            DispatchQueue.main.async {
                               self.imageView.image = UIImage(data: imageData as Data)
                            }
                        }
                    } catch let jsonError {
                        print(jsonError.localizedDescription)
                    }
                }
            }
        }
        task.resume()
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
