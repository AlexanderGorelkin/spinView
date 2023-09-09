//
//  SpinViewController.swift
//  SpinView
//
//  Created by Александр Горелкин on 09.09.2023.
//

import UIKit

class SpinViewController: UIViewController {
    
    var animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut)
    
    
    private lazy var spinView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private lazy var sliderView: UISlider = {
        let view = UISlider()
        view.addAction(UIAction(handler: { [weak self] _ in
            self?.animator.fractionComplete = CGFloat(self?.sliderView.value ?? 0)
        }), for: .valueChanged)
        view.addAction(UIAction(handler: { [weak self] _ in
            self?.animator.startAnimation()
            self?.sliderView.value = 1
        }), for: [.touchUpInside, .touchUpOutside])
        return view
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        addAnimator()
        
    }
    func setupView() {
        spinView.frame = .init(x: 20, y: 150, width: 100, height: 100)
        sliderView.frame = .init(x: 10, y: spinView.frame.maxY + 50, width: view.frame.width - 20, height: 100)
        view.addSubview(spinView)
        view.addSubview(sliderView)
    }
    
    func addAnimator() {
        animator.pausesOnCompletion = true
        animator.addAnimations {
            self.spinView.center.x = self.view.frame.width - self.spinView.frame.width
            self.spinView.transform = .identity.rotated(by: .pi / 2).scaledBy(x: 1.5, y: 1.5)
        }
    }
}



