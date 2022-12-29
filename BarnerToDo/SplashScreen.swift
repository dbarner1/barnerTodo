//
//  SplashScreen.swift
//  BarnerToDo
//
//  Created by Dave Barner on 12/29/22.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            if self.isActive {
                ContentView()
            } else {
                VStack(alignment: .center) {
                      Text("GSD!")
                        .font(.title)
                        .padding(.top, 300)
                        .foregroundColor(.white)
                      Spacer()
                    }
                    .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      minHeight: 0,
                      maxHeight: .infinity,
                      alignment: .center
                    )
                    .background(Color.mint)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
