//
//  ViewController.swift
//  BitmapRectangle
//
//  Created by Kenny Batista on 5/5/15.
//  Copyright (c) 2015 Kenny Batista. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawingView: DrawingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDrawingView()
    }
    
    
    func setupDrawingView() {
        drawingView.draw = {
            let drawRectangleInRowAndColumn = self.drawingView.drawRectangleInRowAndColumn
            _ = self.drawingView.rows
            _ = self.drawingView.columns
 
            for x in 0...8 {
                for y in 0...9 {
                    drawRectangleInRowAndColumn(y, x)
                }
            }

        }
    }
    
}
