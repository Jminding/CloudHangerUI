//
//  Settings.swift
//  DryCleaning
//
//  Created by Jaymin Ding on 10/13/20.
//  Copyright © 2020 Gavin McCabe. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var userData: UserData
    var body: some View {
        VStack(){
            Text("\(userData.name)'s Settings")
                .font(.custom("OpenSans-Semibold",size: 48.0))
                .padding(.leading)
            
            ZStack(){
                RoundedRectangle(cornerRadius: 20.0)
                    .frame(width: 275, height: 50)
                Text("Name")
                    .font(.custom("OpenSans-SemiBold", size: 20.0))
            }
            
        }
    }
}
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
