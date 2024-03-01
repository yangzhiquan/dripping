//
//  ViewController.swift
//  App
//
//  Created by yvanyang on 2024/2/21.
//

import UIKit

class ViewController: UIViewController {
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // 设置文本字段和按钮的属性
        usernameTextField.placeholder = "Username"
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true // 密码输入框
        loginButton.setTitle("Login", for: .normal)
        
        // 设置输入框的边框，背景色
        usernameTextField.borderStyle = .roundedRect // 设置边框样式
        usernameTextField.layer.borderWidth = 1.0 // 设置边框宽度
        usernameTextField.layer.borderColor = UIColor.gray.cgColor // 设置边框颜色
        
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        
        loginButton.backgroundColor = UIColor.systemBlue // 设置背景色为系统蓝色
        loginButton.setTitleColor(.white, for: .normal) // 设置按钮标题颜色为白色
        
        
        // 自动布局
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false;
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false;
        loginButton.translatesAutoresizingMaskIntoConstraints = false;
        
        // 添加到视图
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        // 设置布局约束
        let views = ["usernameTextField": usernameTextField, "passwordTextField": passwordTextField, "loginButton": loginButton]
        let metrics = ["padding": 20.0, "y_offset": -100.0, ]
        
        // 约束文本字段
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: metrics["y_offset"]!),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: metrics["padding"]!),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -metrics["padding"]!),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: metrics["padding"]!),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: metrics["padding"]!),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -metrics["padding"]!),
            passwordTextField.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor)
        ])
        
        // 约束登录按钮
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: metrics["padding"]!),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: metrics["padding"]!),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -metrics["padding"]!),
            loginButton.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor)
        ])
        
        // 添加登录按钮的点击事件
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        // 这里处理登录逻辑
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        // 验证用户名和密码，然后进行登录操作...
        //        print("Username: \(username)), Password: \(password)")
        
        // 创建一个UIAlertController来展示弹窗
        let alertController = UIAlertController(title: "登录成功", message: "Username: \(username)\nPassword: \(password)", preferredStyle: .alert)
        
        // 添加一个确认按钮到弹窗
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // 用户点击了OK按钮，这里可以添加额外的逻辑，比如开始登录过程
        }
        alertController.addAction(okAction)
        
        // 展示弹窗
        present(alertController, animated: true, completion: nil)
    }
}

