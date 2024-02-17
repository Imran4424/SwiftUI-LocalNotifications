//
//  ContentView.swift
//  LocalNotifications
//
//  Created by Shah Md Imran Hossain on 17/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { sucess, error in
                    if sucess {
                        print("All set! Good to go")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notifications") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the dogs"
                content.subtitle = "They look hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
