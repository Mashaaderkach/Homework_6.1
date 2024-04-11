//
//  ViewController.swift
//  Homework_6(1)
//
//  Created by Maryia Dziarkach on 2.04.24.
//

import UIKit

class ViewController: UIViewController {
    let circle = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameForCats()
    }
    
    
    //  1.  Игрушка для котиков - появление разноцветного кружочка, по тапу исчезает и появляется в новом месте (кодом)
    
    func gameForCats() {
          circle.frame = CGRect(x: 100, y: 100, width: 100, height: 100) // cоздаем квадрат
          circle.backgroundColor = .systemBlue // задаем цвет квадрата
          circle.layer.cornerRadius = 50 // закругляем квадрат и получается круг
          view.addSubview(circle) // отображаем круг в рамках super view
          
          let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
          circle.addGestureRecognizer(recognizer)
      }
      
      @objc func tapDetected() {
          
          let randomColor = UIColor(red: .random(in: 0...1),
                                            green: .random(in: 0...1),
                                            blue: .random(in: 0...1),
                                            alpha: 1.0)
                  circle.backgroundColor = randomColor
          
          
          
          let screenWidth = UIScreen.main.bounds.width // определяем ширину экрана 393.0
          let screenHeight = UIScreen.main.bounds.height // определяем высоту экрана 852.0
          print(screenWidth, screenHeight)
          
          let xDiameterCircle = circle.frame.width // получаем диаметр круга 100.0
          let yDiameterCircle = circle.frame.height // получаем диаметр круга 100.0

          
          let xDifference = screenWidth - xDiameterCircle // получаем разницу между шириной экрана устройства и шириной круга 293.0
          let yDifference = screenHeight - yDiameterCircle // получаем разницу между высотой экрана устройства и высотой круга 752.0
          print(xDifference, yDifference)
          
          
          let halfCircleOfX = xDiameterCircle / 2
          let maxXPoint = screenWidth -  halfCircleOfX
          print(halfCircleOfX, maxXPoint)
          
          let halfCircleOfY = yDiameterCircle / 2
          let maxYPoint = screenHeight -  halfCircleOfY
          print(halfCircleOfY, maxYPoint)
          
          
          let randomXPoints = CGFloat.random(in: halfCircleOfX...maxXPoint) // генерируем случайные координаты в пределах диапазонов
          let randomYPoints = CGFloat.random(in: halfCircleOfY...maxYPoint) // генерируем случайные координаты в пределах диапазонов
          print(randomXPoints, randomYPoints)
         
          circle.center = CGPoint(x: randomXPoints, y: randomYPoints) // устанавливаем новую позицию кружка
          
      }
      
   
    // comment added
    
}

