//
//  ViewController.swift
//  ParticleTest
//
//  Created by Den Jo on 2020/06/15.
//  Copyright © 2020 Den Jo. All rights reserved.
//

import UIKit
import SpriteKit

final class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private var particleView: SKView!
    @IBOutlet private var heartButton: UIButton!
    @IBOutlet private var starBorderButton: UIButton!
    @IBOutlet private var starFillButton: UIButton!
    
    
    
    // MARK: - Value
    // MARK: Private
    private let scene = SKScene()
    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setScene()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scene.size = particleView.frame.size
    }
    
    
    // MARK: - Function
    // MARK: Private
    private func setScene() {
        scene.scaleMode       = .aspectFit
        scene.backgroundColor = .clear
        
        particleView.presentScene(scene)
    }
    
    private func addParticle(point: CGPoint) {
        if heartButton.isSelected == true, let heartEmitter = SKEmitterNode(fileNamed: "Heart") {
            heartEmitter.position = point
            scene.addChild(heartEmitter)
        }
        
        if starBorderButton.isSelected == true, let starBorderEmitter = SKEmitterNode(fileNamed: "StarBorder") {
            starBorderEmitter.position = point
            scene.addChild(starBorderEmitter)
        }
        
        if starFillButton.isSelected == true, let starFillEmitter = SKEmitterNode(fileNamed: "StarFill") {
            starFillEmitter.position   = point
            scene.addChild(starFillEmitter)
        }
    }
    
    
    
    // MARK: - Event
    @IBAction private func heartButtonTouchUpInside(_ sender: UIButton) {
        // Default setting
        if !sender.isSelected == false, starBorderButton.isSelected == false, starFillButton.isSelected == false {
            return
        }
        
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction private func starBorderButtonTouchUpInside(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        // Default setting
        guard starBorderButton.isSelected == false, starFillButton.isSelected == false else { return }
        heartButton.isSelected = true
    }
    
    @IBAction private func starFillButtonTouchUpInside(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        // Default setting
        guard starBorderButton.isSelected == false, starFillButton.isSelected == false else { return }
        heartButton.isSelected = true
    }
    
    @IBAction private func tapGestureRecognizerAction(_ sender: UITapGestureRecognizer) {
        var point = sender.location(in: particleView)
        point.y = particleView.frame.height - point.y
        
        addParticle(point: point)
    }
}

