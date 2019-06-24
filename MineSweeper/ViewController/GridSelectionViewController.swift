//
//  GridSelectionViewController.swift
//  MineSweeper
//
//  Created by Akshay Ayyanchira on 6/20/19.
//  Copyright © 2019 Akshay Ayyanchira. All rights reserved.
//

import UIKit

class GridSelectionViewController: UIViewController {

    @IBOutlet weak var gridSizeLabel: UILabel!
    @IBOutlet weak var gridSlider: UISlider!
    var gridSize:Int = 0
    
    override func viewDidLoad() {
        gridSizeLabel.text = "\(Int(gridSlider.value))"
    }
    
    @IBAction func gridSizeValueChanged(_ sender: UISlider) {
        
        gridSize = Int(sender.value)
        gridSizeLabel.text = "\(gridSize)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        GameManager.gridSize = Int(gridSlider.value)
    }

}
