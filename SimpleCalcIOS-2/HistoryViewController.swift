//
//  HistoryViewController.swift
//  SimpleCalcIOS-2
//
//  Created by Aayush  Saxena on 1/30/18.
//  Copyright © 2018 Aayush  Saxena. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBAction func back(_ sender: UIButton) {
        performSegue(withIdentifier: "segue2", sender: self)
    }
    var calculations: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...calculations.count - 1 {
            let label = UILabel(frame: CGRect(x: 50, y: index * 25 + 50, width: 300, height: 40))
            label.text = calculations[index]
            scrollview.addSubview(label)
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var viewController = segue.destination as! MainViewController
        viewController.calculations = calculations
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
