//
//  DetailViewController.swift
//  Tumblr Feed
//
//  Created by Stephanie Angulo on 6/16/16.
//  Copyright © 2016 Stephanie Angulo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = ("You tapped the cell at index \(index)")
        print("You tapped the cell at index \(index)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
