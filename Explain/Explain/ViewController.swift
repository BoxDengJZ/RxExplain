//
//  ViewController.swift
//  Explain
//
//  Created by Jz D on 2019/6/19.
//  Copyright © 2019 Jz D. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       // print(textView.frame)
        
       // print("After")
        textView.delegate = self
        textView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 10, right: 0)
        
        // print(textView.frame)
        
       // NotificationCenter.default.addObserver(self, selector: #selector(doIt), name: Notification.Name.init(rawValue: "123"), object: nil)
        NotificationCenter.default.addObserver(forName: Notification.Name.init(rawValue: "123"), object: nil, queue: OperationQueue.main) { (noti) in
            print(Thread.isMainThread)
        }
        
        
        
    }

    
    @objc
    func doIt(){
        print(Thread.isMainThread)
    }

    
    func textViewDidBeginEditing(_ textView: UITextView) {
        /*
        DispatchQueue.global().async {
            self.doIt()
        }
        */
        DispatchQueue.global().async {
            NotificationCenter.default.post(name: Notification.Name.init(rawValue: "123"), object: nil)
        }
        
        
    }
}

