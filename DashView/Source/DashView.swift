/*

Copyright (c) 2015 - Alex Leite (al7dev)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

import UIKit

@IBDesignable open class DashView: UIView {
    @IBInspectable open var dashWidth: CGFloat = 3.0
    @IBInspectable open var dashSpace: CGFloat = 1.0
    @IBInspectable open var dashColor: UIColor = UIColor.darkGray
    @IBInspectable open var dashAxis: NSInteger = 0//0:horizontal 1:vertical . others default horizontal .
    
    //MARK- Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    //MARK- Base Overrides
    
    open override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(self.dashColor.cgColor)
            
            if 1 == self.dashAxis {
                var nextDashFrame = CGRect(x: 0.0, y: 0.0, width: rect.size.width, height: self.dashWidth)
                while nextDashFrame.origin.y < rect.size.height {
                    context.fill(nextDashFrame)
                    nextDashFrame.origin.y += (self.dashWidth + self.dashSpace)
                }
            }
            else {
                var nextDashFrame = CGRect(x: 0.0, y: 0.0, width: self.dashWidth, height: rect.size.height)
                while nextDashFrame.origin.x < rect.size.width {
                    context.fill(nextDashFrame)
                    nextDashFrame.origin.x += (self.dashWidth + self.dashSpace)
                }
            }
        }
    }
}
