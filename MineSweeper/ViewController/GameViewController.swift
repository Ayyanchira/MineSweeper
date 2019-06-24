//
//  GameViewController.swift
//  MineSweeper
//
//  Created by Akshay Ayyanchira on 6/20/19.
//  Copyright © 2019 Akshay Ayyanchira. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GameManager.loadGame()
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GameManager.gridSize * GameManager.gridSize
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let tileSize = (Int(collectionView.frame.width))/(GameManager.gridSize)
//
//        let tile = UIButton(frame: CGRect(x: 0, y: 0, width: tileSize, height: tileSize))
//
//        tile.backgroundColor = #colorLiteral(red: 1, green: 0.7214534879, blue: 0, alpha: 1)
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Custom", for: indexPath) as! TileCollectionViewCell
        
        var i = 0
        var j = 0
        if indexPath.row != 0{
            i = indexPath.row/GameManager.gridSize
            j =  indexPath.row % GameManager.gridSize
        }
        
        print("The visibile status of tile \(i) \(j) is \(GameManager.theGrid[i][j].isVisible)")
        if(GameManager.theGrid[i][j].isVisible){
            cell.tileDisplayText.isHidden = false
            cell.tileImage.isHidden = true
            if GameManager.theGrid[i][j].value == -1{
                cell.tileDisplayText.text = "💣"
            }else{
                cell.tileDisplayText.text = "\(GameManager.theGrid[i][j].value)"
            }
        }else{
            cell.tileDisplayText.isHidden = true
            cell.tileImage.isHidden = false
        }
        //if GameManager.theGrid
//        DispatchQueue.main.async {
//            cell.frame = CGRect(x: Int(cell.frame.origin.x), y: Int(cell.frame.origin.y), width: tileSize, height: tileSize)
//
//        }
        
        //cell.addSubview(tile)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let tileSize = Int(collectionView.bounds.width) / GameManager.gridSize
        return CGSize(width: tileSize, height: tileSize)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var i = 0
        var j = 0
        if indexPath.row != 0{
            i = indexPath.row/GameManager.gridSize
            j =  indexPath.row % GameManager.gridSize
        }
        
        GameManager.theGrid[i][j].isVisible = true
        
        if GameManager.theGrid[i][j].value == 0{
            exploreZerosFor(i: i, j: j)
        }
        
        collectionView.reloadData()
        print("clicked cell is \(i) and \(j)")
    }
    
    func exploreZerosFor(i:Int, j:Int){
        
        for x in 1...8{
            
            switch (x){
            case 1:
                print("Upper left")
                if i <= 0 || j <= 0{
                    break
                }else{
                    if GameManager.theGrid[i - 1][j - 1].isVisible == false{
                        GameManager.theGrid[i - 1][j - 1].isVisible = true
                        if GameManager.theGrid[i - 1][j - 1].value == 0{
                            exploreZerosFor(i: i - 1, j: j - 1)
                        }
                    }
                    
                }
                
            case 2:
                print("Up")
                if i <= 0{
                    break
                }else{
                    if GameManager.theGrid[i - 1][j].isVisible == false{
                        GameManager.theGrid[i - 1][j].isVisible = true
                        if GameManager.theGrid[i - 1][j].value == 0{
                            exploreZerosFor(i: i - 1, j: j)
                        }
                    }
                    
                }
                
            case 3:
                print("Top right")
                if i <= 0 || j >= GameManager.gridSize - 1{
                    break
                }else{
                    if GameManager.theGrid[i - 1][j + 1].isVisible == false{
                        GameManager.theGrid[i - 1][j + 1].isVisible = true
                        if GameManager.theGrid[i - 1][j + 1].value == 0{
                            exploreZerosFor(i: i - 1 , j: j + 1)
                        }
                    }
                    
                    
                    
                }
                
            case 4:
                print("Left")
                if j <= 0 {
                    break
                }else{
                    if GameManager.theGrid[i][j - 1].isVisible == false{
                        GameManager.theGrid[i][j - 1].isVisible = true
                        if GameManager.theGrid[i][j - 1].value == 0{
                            exploreZerosFor(i: i, j: j-1)
                        }
                    }
                    
                }
                
            case 5:
                print("Right")
                if j >= GameManager.gridSize - 1 {
                    break
                }else{
                    if GameManager.theGrid[i][j + 1].isVisible == false{
                        GameManager.theGrid[i][j + 1].isVisible = true
                        if GameManager.theGrid[i][j + 1].value == 0{
                            exploreZerosFor(i: i, j: j+1)
                        }
                    }
                    
                }
                
            case 6:
                print("Bottom Left")
                if i >= GameManager.gridSize - 1 || j <= 0{
                    break
                }else{
                    if GameManager.theGrid[i + 1][j - 1].isVisible == false{
                        GameManager.theGrid[i + 1][j - 1].isVisible = true
                        if GameManager.theGrid[i + 1][j - 1].value == 0{
                            exploreZerosFor(i: i+1, j: j-1)
                        }
                    }
                }
                
            case 7:
                print("Bottom")
                if i >= GameManager.gridSize - 1{
                    break
                }else{
                    if GameManager.theGrid[i + 1][j].isVisible == false{
                        GameManager.theGrid[i + 1][j].isVisible = true
                        if GameManager.theGrid[i + 1][j].value == 0{
                            exploreZerosFor(i: i+1, j: j)
                        }
                    }
                    
                }
                
            case 8:
                print("Bottom Right")
                if i >= GameManager.gridSize - 1 || j >= GameManager.gridSize - 1{
                    break
                }else{
                    if GameManager.theGrid[i + 1][j + 1].isVisible == false{
                        GameManager.theGrid[i + 1][j + 1].isVisible = true
                        if GameManager.theGrid[i + 1][j + 1].value == 0{
                            exploreZerosFor(i: i + 1, j: j + 1)
                        }
                    }
                    
                }
                
            default:
                print("Default case executed")
            }
            
        }
    }
    
}
