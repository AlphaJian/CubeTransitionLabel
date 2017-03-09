//
//  ViewController.swift
//  CubeTransitionLabel
//
//  Created by Jian Zhang on 3/9/17.
//  Copyright © 2017 AZ. All rights reserved.
//

import UIKit

func delay(seconds: Double, completion:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { 
        completion()
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var cubeLbl: CubeLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        delay(seconds: 2) {
        }
    }
    @IBAction func downTapped(_ sender: Any) {
        self.cubeLbl.cubeTransition(newText: "Alex", direction: TransitionDirection.Down, duration: 1)
    }

    @IBAction func upTapped(_ sender: Any) {
        self.cubeLbl.cubeTransition(newText: "Zhang", direction: TransitionDirection.Up, duration: 1)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

