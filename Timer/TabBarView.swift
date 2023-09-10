//
//  TabBarView.swift
//  Timer
//
//  Created by Michael Favre on 10/09/2023.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        TabView {
            
            TimerView15()
                .tabItem {
                    Image(systemName: "clock")
                    Text("15")
                }
            
            TimerView30()
                .tabItem {
                    Image(systemName: "clock")
                    Text("30")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
