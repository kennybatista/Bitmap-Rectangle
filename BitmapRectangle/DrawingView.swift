//
//  DrawingView.swift
//  
//
//  Created by Kenny Batista on 12/14/15.
//
//

import UIKit

class DrawingView: UIView {
    
    //properties: every instance of DrawingView will have it's own unique property values
    let rows = 10
    let columns = 7
    var totalWidth: CGFloat { return bounds.width }
    var totalHeight: CGFloat { return bounds.height }
    var columnWidth: CGFloat { return totalWidth / CGFloat(columns) }
    var rowHeight: CGFloat { return totalHeight / CGFloat(rows) }
    var rectangleSize: CGSize { return CGSize(width: columnWidth, height: rowHeight) }
    var context: CGContextRef?
    var draw: (() -> ())?
    
    override func drawRect(rect: CGRect) {
        getReadyToDraw()
        draw?()
    }
    
    func drawRectangleInRowAndColumn(row: Int, _ column: Int) {
        let fillColor = UIColor(red: CGFloat(column) / CGFloat(columns),
            green: CGFloat(row) / CGFloat(rows), blue: 1, alpha: 1)
        CGContextSetFillColorWithColor(context, fillColor.CGColor)
        let rectOrigin = CGPoint(x: CGFloat(column) * columnWidth, y: CGFloat(row) * rowHeight)
        drawRectangleFromPoint(rectOrigin)
    }
    
    private func getReadyToDraw() {
        context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 0)
    }
    
    private func drawRectangleFromPoint(point: CGPoint) {
        CGContextAddRect(context, CGRect(origin: point, size: rectangleSize))
        CGContextFillPath(context)
    }


}
