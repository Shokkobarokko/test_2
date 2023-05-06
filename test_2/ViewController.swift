//
//  ViewController.swift
//  test_2
//
//  Created by Аветис Парсаданян on 05.05.2023.
//

import UIKit

let button1 = UIButton(type: .system)


let button2 = UIButton(type: .system)

let button3 = UIButton(type: .system)


let modalViewController = UIViewController()




class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTitleButton()
        addIcon()
        addPaddings()
        addPaddingsIcon()
        addBackGroundColorButton()
        modalWindow()
        addActionButtons()
        addIconColor()
        addSubviewButton()
        addMargins()
        radiusButton()
        addFontColorButton()
        
    }
    
    func setTitleButton(){
        button1.setTitle("First Button", for: .normal)
        button2.setTitle("Second Medium Button", for: .normal)
        button3.setTitle("Third", for: .normal)
        
    }
    
    func addIcon(){
        button1.setImage(UIImage(systemName: "arrowshape.turn.up.right.circle.fill"), for: .normal)
        button2.setImage(UIImage(systemName: "arrowshape.turn.up.right.circle.fill"), for: .normal)
        button3.setImage(UIImage(systemName: "arrowshape.turn.up.right.circle.fill"), for: .normal)
        
    }
    
    func addPaddings(){
        button1.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        button2.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        button3.imageEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        button1.semanticContentAttribute = .forceRightToLeft
        button2.semanticContentAttribute = .forceRightToLeft
        button3.semanticContentAttribute = .forceRightToLeft
    }
    
    func addPaddingsIcon(){
        button1.contentEdgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
        button2.contentEdgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)
        button3.contentEdgeInsets = UIEdgeInsets(top: 10, left: 14, bottom: 10, right: 14)

    }
    
    func addBackGroundColorButton(){
        button1.backgroundColor = .systemBlue
        button2.backgroundColor = .systemBlue
        button3.backgroundColor = .systemBlue
        
    }
    func addIconColor(){
        button1.tintColor = .white
        button2.tintColor = .white
        button3.tintColor = .white
    }
    
    func addFontColorButton(){
        button1.setTitleColor(.white, for: .normal)
        button2.setTitleColor(.white, for: .normal)
        button3.setTitleColor(.white, for: .normal)
    }
    
        func addActionButtons(){
            // Добавить обработчик события touchDown к кнопке
            button1.addTarget(self, action: #selector(shrinkButton), for: .touchDown)

            // Добавить обработчик события touchUpInside к кнопке
            button1.addTarget(self, action: #selector(growButton), for: .touchUpInside)
            
         
            
            // Добавить обработчик события touchDown к кнопке
            button2.addTarget(self, action: #selector(shrinkButton), for: .touchDown)

            // Добавить обработчик события touchUpInside к кнопке
            button2.addTarget(self, action: #selector(growButton), for: .touchUpInside)
            
            // Добавить обработчик события touchDown к кнопке
            button3.addTarget(self, action: #selector(shrinkButton), for: .touchDown)

            // Добавить обработчик события touchUpInside к кнопке
            button3.addTarget(self, action: #selector(growButton), for: .touchUpInside)
            button3.addTarget(self, action: #selector(showModal), for: .touchUpInside)
            
  
            
        }
    
    func modalWindow(){
        // Добавить текстовую метку к модальному окну

        modalViewController.view.backgroundColor = .white

        // Настроить стиль представления модального окна
        modalViewController.modalPresentationStyle = .pageSheet // Показывать модальное окно на весь экран
        
        modalViewController.presentationController?.addObserver(self, forKeyPath: "isPresented", options: [.new], context: nil)

   
    }
    
    
    func addSubviewButton(){
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
    }
    
    func addMargins(){
        let stackView = UIStackView(arrangedSubviews: [button1, button2, button3])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
        
        
    }
    
    func radiusButton(){
        button1.layer.cornerRadius = 10
        button2.layer.cornerRadius = 10
        button3.layer.cornerRadius = 10
    }
    

    @objc func showModal(sender: UIButton) {

        // Представить модальное окно с анимацией и обработчиком завершения
        present(modalViewController, animated: true,completion: nil)
     
        print("Hi")
    }
 
    // Функция для уменьшения кнопки
    @objc func shrinkButton(sender: UIButton) {
        // Анимировать изменение transform на 20% меньше с опцией .allowUserInteraction
        UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction) {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
    }

    // Функция для возврата кнопки к исходному размеру
    @objc func growButton(sender: UIButton) {
        // Анимировать изменение transform на 100% с опцией .allowUserInteraction
        UIView.animate(withDuration: 0.2, delay: 0, options: .allowUserInteraction) {
            sender.transform = .identity
        }
    }
    
    
    // Метод для обработки изменения свойства isPresented модального контроллера
     override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
         print("by")
         if keyPath == "isPresented" {
             // Получаем новое значение свойства isPresented
             if let isPresented = change?[.newKey] as? Bool {
                 // Если модальный контроллер показан, делаем кнопку серой
                 
                 if isPresented {
                     
                     button1.tintColor = .gray
                     button1.tintColorDidChange()
                     
                 } else {
                     // Если модальный контроллер скрыт, возвращаем кнопке исходный цвет
                     button1.tintColor = .systemBlue
                 }
             }
         }
     }
    
    

    
}

extension UIButton {
    override open func tintColorDidChange () {
        super . tintColorDidChange ()
        switch tintAdjustmentMode {
        case .normal:
            self .backgroundColor = .yellow
        case .automatic:
            break
            
        case .dimmed:
            self.backgroundColor = .red
        @unknown default:
            break
            
        }
        
    }
}
