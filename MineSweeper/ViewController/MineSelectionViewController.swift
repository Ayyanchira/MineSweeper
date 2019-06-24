//
//  MineSelectionViewController.swift
//  MineSweeper
//
//  Created by Akshay Ayyanchira on 6/20/19.
//  Copyright © 2019 Akshay Ayyanchira. All rights reserved.
//

import UIKit

class MineSelectionViewController: UIViewController {

    @IBOutlet weak var mines: UILabel!
    @IBOutlet weak var mineSlider: UISlider!
    var numberOfMines:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mines.text = "\(Int(mineSlider.value))"
        
        mineSlider.maximumValue = Float(GameManager.gridSize * GameManager.gridSize - 1 )
        
    }
    
    
    
    @IBAction func mineSliderChanged(_ sender: UISlider) {
        numberOfMines = Int(sender.value)
        mines.text = "\(numberOfMines)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        GameManager.mines = Int(mineSlider.value)
    }
    

}
