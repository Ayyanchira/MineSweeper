//
//  GameManager.swift
//  MineSweeper
//
//  Created by Akshay Ayyanchira on 6/20/19.
//  Copyright © 2019 Akshay Ayyanchira. All rights reserved.
//

import Foundation

class GameManager{
    
    static var gridSize = 0
    static var mines = 0
    
    static var theGrid = [[Tile]]()
    
    
    //Function to load the game. This involves initializing the tile grid and assigning the bombs at random location. The rest of the tiles also get their values after the bombs are laid out. The same grid is then used as data model for ui collection view
    static func loadGame() -> Bool {
        print("Loading the game with grid size of \(GameManager.gridSize) and \(GameManager.mines) number of mines")
        
        theGrid = [[Tile]]()
        
        //Step 1: Initialize array of tiles
        for _ in 0..<gridSize{
            let subArray = Array(repeating: Tile(), count: gridSize)
            theGrid.append(subArray)
        }
        print("The Grid is initialized with empty tiles")
        
        //Step 2: Put mines in the grid
        var minesAdded = 0
        var count = 0
        while minesAdded < mines{
            let randomR = Int.random(in: 0..<gridSize)
            let randomC = Int.random(in: 0..<gridSize)
            count += 1
            if (theGrid[randomC][randomR].value == 0){
                theGrid[randomC][randomR].value = -1
                minesAdded += 1
            }
        }
        
        print("Took \(count) iterations to add \(mines) mines added in the grid")
        
        //Step 3: Determine values of all non bomb Tiles
        
        for i in 0..<gridSize{
            for j in 0..<gridSize{
                
                if theGrid[i][j].value == -1{
                    print("Its a bomb.. So skip it")
                    continue
                }
                
                var currentValue = 0
                for x in 1...8{
                    
                    switch (x){
                    case 1:
                        print("Upper left")
                        if i <= 0 || j <= 0{
                            break
                        }else{
                            if theGrid[i - 1][j - 1].value == -1{
                                currentValue += 1
                            }
                        }
                        
                    case 2:
                        print("Up")
                        if i <= 0{
                            break
                        }else{
                            if theGrid[i - 1][j].value == -1{
                                currentValue += 1
                            }
                        }
                        
                    case 3:
                        print("Top right")
                        if i <= 0 || j >= gridSize - 1{
                            break
                        }else{
                            if theGrid[i - 1][j + 1].value == -1{
                                currentValue += 1
                            }
                        }
                        
                    case 4:
                        print("Left")
                        if j <= 0 {
                            break
                        }else{
                            if theGrid[i][j - 1].value == -1{
                                currentValue += 1
                            }
                        }
                        
                    case 5:
                        print("Right")
                        if j >= gridSize - 1 {
                            break
                        }else{
                            if theGrid[i][j + 1].value == -1{
                                currentValue += 1
                            }
                        }
                        
                    case 6:
                        print("Bottom Left")
                        if i >= gridSize - 1 || j <= 0{
                            break
                        }else{
                            if theGrid[i + 1][j - 1].value == -1{
                                currentValue += 1
                            }
                        }
                        
                    case 7:
                        print("Bottom")
                        if i >= gridSize - 1{
                            break
                        }else{
                            if theGrid[i + 1][j].value == -1{
                                currentValue += 1
                            }
                        }
                        
                    case 8:
                        print("Bottom Right")
                        if i >= gridSize - 1 || j >= gridSize - 1{
                            break
                        }else{
                            if theGrid[i + 1][j + 1].value == -1{
                                currentValue += 1
                            }
                        }
                        
                    default:
                        print("Default case executed")
                    }
                    
                }
                print("value of this cell is \(currentValue)")
                theGrid[i][j].value = currentValue
                
            }
        }
        
        for i in 0..<gridSize{
            var strn = ""
            for j in 0..<gridSize{
                
                strn += " \(theGrid[i][j].value)"
            }
            print(strn)
            
        }
        
        return true
    }
    
    
    
}

struct Tile {
    var value:Int = 0
    var isVisible = false
    

}
