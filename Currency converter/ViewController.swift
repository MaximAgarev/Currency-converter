//
//  ViewController.swift
//  Currency converter
//
//  Created by Maxim Agarev on 16/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amdLabel: UILabel!
    @IBOutlet weak var rubLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var aedLabel: UILabel!
    @IBOutlet weak var tklLabel: UILabel!
    
    @IBOutlet weak var amdValue: UITextField!
    @IBOutlet weak var rubValue: UITextField!
    @IBOutlet weak var usdValue: UITextField!
    @IBOutlet weak var eurValue: UITextField!
    @IBOutlet weak var aedValue: UITextField!
    @IBOutlet weak var tklValue: UITextField!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var updateSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

