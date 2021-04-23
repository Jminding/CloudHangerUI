import Foundation
import UIKit
import SwiftUI
import DateTimePicker

struct DateTimeSelector: UIViewRepresentable {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    @State var completion: () -> Void
    @Binding var show: Bool
    @Binding var dateOutput: Date
    
    func makeUIView(context: Context) -> DateTimePicker {
        let v = DateTimePicker.create(minimumDate: Date().addingTimeInterval(-60*60*24*1), maximumDate: Date().addingTimeInterval(60*60*24*14))
        
        v.timeInterval = DateTimePicker.MinuteInterval.fifteen
        v.includesSecond = false
        v.is12HourFormat = true
        
        v.customFontSetting = DateTimePicker.CustomFontSetting(cancelButtonFont: UIFont(name: "OpenSans-Semibold", size: 15)!, todayButtonFont: UIFont(name: "OpenSans-Semibold", size: 15)!, doneButtonFont: UIFont(name: "OpenSans-Semibold", size: 15)!, selectedDateLabelFont: UIFont(name: "OpenSans-Regular", size: 12)!, timeLabelFont: UIFont(name: "OpenSans-Semibold", size: 17)!, colonLabelFont: UIFont(name: "OpenSans-Semibold", size: 17)!, dateCellNumberLabelFont: UIFont(name: "OpenSans-Semibold", size: 25)!, dateCellDayMonthLabelFont: UIFont(name: "OpenSans-Regular", size: 10)!)
        
        v.highlightColor = #colorLiteral(red: 0.3490196078, green: 0.3137254902, blue: 0.6509803922, alpha: 1)
        
        
        v.completionHandler = { date in
            
            

            dateOutput = date
            show = false
            completion()
            
        }
        
        v.dismissHandler = {
            show = false
        }
        
        return v
    }
    
    func updateUIView(_ dateTimeSelector: DateTimePicker, context: Context) {
        if show{
            dateTimeSelector.show()
        }
    }
    
}
 
