

import SwiftUI

struct ContentView: View {
    @StateObject var fastingManager = FastingManager()
    
    var title: String {
        switch fastingManager.fastingState {
        case .notStarted:
            return "Let's get started!"
        case .fasting:
            return "You are now fasting"
        case .feeding:
            return "You are now feeding"
       
        }
    }
    
    var body: some View {
     
        ZStack {
            Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                .ignoresSafeArea()

            content
            
        }
     
    }
    
    var content: some View {
        ZStack {
            VStack(spacing: 40) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.blue)
                
                Text(fastingManager.fastingPlan.rawValue)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                
                Spacer()
            }
            .padding()
            
            VStack(spacing: 40) {
                
                ProgressRing()
                    .environmentObject(fastingManager)

                HStack(spacing: 60) {
                    
                    VStack (spacing: 5) {
                        
                        Text(fastingManager.fastingState == .notStarted ? "Start" : "Started")
                            .opacity(0.7)
                            
                        
                        Text(fastingManager.startTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    } 
                    VStack (spacing: 5) {
                        
                        Text(fastingManager.fastingState == .notStarted ? "End" : "Ends")
                            .opacity(0.7)
                            
                        
                        Text(fastingManager.endTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                    
                }
                
                Button {
                    fastingManager.toggleFastingState()
                }label: {
                    Text(fastingManager.fastingState == .fasting ? "End Fast" : "Start Fasting")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
            }
            .padding()
        }
        .foregroundColor(.white)

    }
}

#Preview {
    ContentView()
}
