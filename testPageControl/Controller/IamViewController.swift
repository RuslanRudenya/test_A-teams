//
//  IamViewController.swift
//  testPageControl
//
//  Created by Руслан on 22.10.2017.
//  Copyright © 2017 Руслан. All rights reserved.
//

import UIKit

class IamViewController: UIViewController {

    let pdfTitle = "anketa"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openPDF(_ sender: UIButton) {
        if let url = Bundle.main.url(forResource: pdfTitle, withExtension: "pdf") {
            let webView = UIWebView(frame: self.view.frame)
            let urlRequest = URLRequest(url: url)
            webView.loadRequest(urlRequest as URLRequest)
            
            let pdfVC = UIViewController()
            pdfVC.view.addSubview(webView)
            pdfVC.title = "Анкета Рудени Руслана"
            self.navigationController?.pushViewController(pdfVC, animated: true)
        }
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
