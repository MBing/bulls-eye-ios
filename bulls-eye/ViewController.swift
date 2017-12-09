//
//  ViewController.swift
//  bulls-eye
//
//  Created by Martin Demiddel on 09.12.17.
//  Copyright © 2017 Martin Demiddel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func hitMePressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Geklikt", message: "You have succesfully clicked the button", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                print("Clicked Ok")
            }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("Clicked Cancel")
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
}

