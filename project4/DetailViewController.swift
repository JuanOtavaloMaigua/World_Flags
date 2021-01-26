//
//  DetailViewController.swift
//  project4
//
//  Created by Juan Otavalo on 20/10/18.
//  Copyright © 2018 Juan Otavalo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //var model: Modelo!
    var modex = Modelo()
    
    @IBOutlet weak var nombrePaisContinente: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var flagImageView: UIImageView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = modex.continentCountry()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        //model = Modelo()
        //print("dato: \(modex.changeImage())")
        nombrePaisContinente.text = modex.continentCountry()
        flagImageView.image = UIImage(named: modex.changeImage())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    

    
}

