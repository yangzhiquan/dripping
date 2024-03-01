//
//  ContentView.swift
//  AppUI
//
//  Created by yvanyang on 2024/2/21.
//


import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // 用户名输入框
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // 密码输入框
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            // 登录按钮
            Button(action: {
                // 登录逻辑
                //                print("Logging in with $self.username) and password.")
                self.showAlert = true
            }) {
                Text("Log In")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Details"), message: Text("Username: \(self.username)\nPassword: \(self.password)"), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    ContentView()
}
