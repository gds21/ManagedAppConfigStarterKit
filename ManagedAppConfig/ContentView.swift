//
//  ContentView.swift
//  ManagedAppConfig
//
//  Created by glee on 2020/10/9.
//

import SwiftUI

struct ContentView: View {
    
    @State var color: UIColor = .yellow
    @State var descriptionString: String?
    
    var body: some View {
        Color(color)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .overlay(Text(descriptionString ?? "No Value")
                        .foregroundColor(.black)
            )
        
        // Code Snippet 1
    }
}

struct AppConfig {
    
    let backgroundColorHexValue: String
    let allValue: String?
    
    init() {
        let kConfigurationKey = "" // Code Snippet 2
        let kBackgroundColorHexValueKey = "" // Code Snippet 3
        let dictionary = UserDefaults.standard.object(forKey: kConfigurationKey) as! [String:Any]
        let json = try! JSONSerialization.data(withJSONObject: dictionary, options: [])
        self.allValue = String(data: json, encoding: .utf8)
        self.backgroundColorHexValue = dictionary[kBackgroundColorHexValueKey] as! String
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
