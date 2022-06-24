//
//  WelcomeScreenViewController.swift
//  AutorisationScreen
//
//  Created by kukushkin-ds on 20.06.2022.
//

import UIKit



class WelcomeViewController: UIViewController {
   
    @IBOutlet var welcomeLabel: UILabel!

    var welcomeText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let backgroundImage = UIImage(named: "backgroundImage") {
            view.backgroundColor = UIColor(patternImage: backgroundImage)
        }
        
        welcomeLabel.text = welcomeText
    }
    
}
