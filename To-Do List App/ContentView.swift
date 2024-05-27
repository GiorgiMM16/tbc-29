//
//  ContentView.swift
//  To-Do List App
//
//  Created by Giorgi Michitashvili on 5/26/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var taskuniebi: [Task] = [
        Task(title: "შევამოწმოთ ბოვშების დავალებები", date: "May 30", isCompleted: true),
        Task(title: "ბექას და ვასოსთან ქოლი", date: "May 29", isCompleted: false),
        Task(title: "საყიდლებზე წავიდე", date: "May 27", isCompleted: false)
    ]
    
    var body: some View {
        ZStack {
            
            // Header HStack View
            VStack(spacing: 35) {
                HStack {
                    Text("You have \(taskuniebi.count) Tasks to complete")
                        .font(.headline)
                    
                    Spacer()
                    
                    Circle()
                        .overlay(
                            Image("daviti")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                        )
                        .frame(width: 40, height: 40)
                }
                .padding([.top, .leading, .trailing], 20)
                
                // Complete All Button
                Button(action: {
                    taskuniebi.indices.forEach { index in
                        taskuniebi[index].isCompleted = true
                    }
                    })
                    {
                    Text("Complete All")}
                
                .foregroundColor(.white)
                .frame(width: 350, height: 50, alignment: .center)
                .background(LinearGradient(colors: [Color(hex: 0x73ABFF), Color(hex: 0x46C0C2)], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10.0)
                
                ScrollView {
                    
                    VStack {
                        Text("Progress")
                            .padding(.trailing, 250)
                            .font(.custom("Roboto", size: 25))
                        
                        VStack {
                            Text("Daily Task")
                                .font(.title3)
                                .padding(.trailing, 230)
                                .padding(.top, 20)
                                .bold()
                            
                            Spacer()
                            
                            Text("3/6 Tasks Completed")
                                .padding(.trailing, 165)
                                .foregroundColor(.gray)
                                .lineLimit(0)
                            
                            Spacer()
                            
                            VStack (spacing: -8) {
                                HStack {
                                    Text("Keep Working")
                                        .foregroundColor(.gray)
                                        .font(.caption)
                                        .padding(.leading, 3)
                                    Spacer()
                                    Text("50%")
                                        .font(.caption)
                                        .padding(.trailing, 10)
                                } .padding(.leading, 13)
                                    .padding(.trailing, 13)
                                ProgressView(value: 0.5)
                                    .progressViewStyle(LinearProgressViewStyle())
                                    .tint(Color(hex: 0x73ABFF))
                                    .background(Color(hex: 0x73ABFF, alpha: 0.4))
                                    .scaleEffect(x: 1, y: 4, anchor: .center)
                                    .padding()
                                    .cornerRadius(10.0)
                            }
                        }.background(Color(hex: 0xFFFFFF))
                            .cornerRadius(10.0)
                        
                        Text("Completed Tasks")
                            .padding(.trailing, 181)
                            .font(.custom("Roboto", size: 22))
                        
                        VStack {
                                ForEach(taskuniebi) { task in
                                    VStack {
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(height: 80)
                                            .cornerRadius(10.0)
                                            .overlay(
                                                VStack {
                                                    HStack {
                                                            Text(task.title)
                                                                .strikethrough(task.isCompleted, color: .black)
                                                                .font(.custom("Roboto", size: 16))
                                                    
                                                        Spacer()
                                                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                                            .resizable()
                                                            .frame(width: 26, height: 26)
                                                            .foregroundColor(task.isCompleted ? .blue : .blue)
                                                    }
                                                    .padding()
                                                    
                                                    Text(task.date)
                                                        .font(.caption)
                                                        .padding(.leading, -160)
                                                }
                                            )
                                        Spacer().frame(height: 10)
                                    }
                                }
                        }
                        }
                    }
                    
                }
                .padding(.horizontal, 20)
                
                
            }
            .background(Color(hex: 0xF3F2F8))
        }
    }
    
    extension Color {
        init(hex: UInt, alpha: Double = 1.0) {
            self.init(
                .sRGB,
                red: Double((hex >> 16) & 0xff) / 255,
                green: Double((hex >> 08) & 0xff) / 255,
                blue: Double((hex >> 00) & 0xff) / 255,
                opacity: alpha
            )
        }
    }
    
    struct Task: Identifiable {
        var id = UUID()
        var title: String
        var date: String
        var isCompleted: Bool
    }
    
    #Preview {
        ContentView()
    }
