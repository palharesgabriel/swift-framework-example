import UIKit

extension SwiftFramework {
    
    public class Color {
        /// Allows you to convert a 6 digit hexadecimal string into a UIColor instance
        /// - Warning: The "#" symbol is stripped from the beginning of the string submtited here.
        /// - Parameters:
        ///   - hexString: A 6-digit hexadecimal string. Use 6 digits rather than 8 and add the accompanying alpha value in the second parameter.
        ///   - alpha: A number between 0.1 and 1, indicating how translucent the color is.
        /// - Returns: A UIColor defined by the hexString paramenter.
        internal class func fromHexString(_ hexString: String, with alpha: CGFloat = 1.0) -> UIColor {
            let red, green, blue: CGFloat
            
            let offset = hexString.hasPrefix("#") ? 1 : 0
            let start = hexString.index(hexString.startIndex, offsetBy: offset)
            
            let hexColor = String(hexString[start...])
            let scanner = Scanner(string: hexColor)
            
            var hexNumber: UInt64 = 1
            
            if scanner.scanHexInt64(&hexNumber) {
                red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                blue = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                green = CGFloat(hexNumber & 0x0000ff) / 255
                
                return UIColor(red: red, green: green, blue: blue, alpha: alpha)
            }
            return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
        }
        
        
        /// The most eye-pleasing color know to all humanity
        public static var frameworkColor: UIColor {
            return fromHexString("006736")
        }
        
        /// Returns an `UIColor` object with the second most eye-pleasing color know to all humanity
        public static var secondaryColor: UIColor {
            return fromHexString("FCFFFD")
        }
    }
}
