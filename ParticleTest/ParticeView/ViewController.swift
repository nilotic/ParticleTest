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
    @IBOutlet private var likeButton: UIButton!
    @IBOutlet private var reactionButton: UIButton!
    
    
    
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
            starFillEmitter.position = point
            scene.addChild(starFillEmitter)
        }
        
        if likeButton.isSelected == true, let likeEmitter = SKEmitterNode(fileNamed: "Like") {
            // Remove previous emitters
            for node in scene.children {
                guard let emitterNode = (node as? SKEmitterNode), emitterNode.name == "Like" else { continue }
                emitterNode.particleBirthRate = 0
                
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(emitterNode.particleLifetime)) {
                    self.scene.removeChildren(in: [emitterNode])
                }
            }
            
            likeEmitter.name     = "Like"
            likeEmitter.position = point
            scene.addChild(likeEmitter)
        }
        
        if reactionButton.isSelected == true {
            // Remove previous emitters
            for node in scene.children {
                guard let emitterNode = (node as? SKEmitterNode) else { continue }
                switch emitterNode.name {
                case "LikeReaction", "AngerReaction", "HahaReaction", "LoveReaction", "SadReaction", "WowReaction":
                    emitterNode.particleBirthRate = 0
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(emitterNode.particleLifetime)) {
                        self.scene.removeChildren(in: [emitterNode])
                    }
                    
                default:
                    continue
                }
            }
            
            
            // Reactions
            if let reactionEmitter = SKEmitterNode(fileNamed: "LikeReaction") {
                reactionEmitter.name     = "LikeReaction"
                reactionEmitter.position = point
                scene.addChild(reactionEmitter)
            }
            
            if let reactionEmitter = SKEmitterNode(fileNamed: "AngerReaction") {
                reactionEmitter.name     = "AngerReaction"
                reactionEmitter.position = point
                scene.addChild(reactionEmitter)
            }
            
            if let reactionEmitter = SKEmitterNode(fileNamed: "HahaReaction") {
                reactionEmitter.name     = "HahaReaction"
                reactionEmitter.position = point
                scene.addChild(reactionEmitter)
            }
            
            if let reactionEmitter = SKEmitterNode(fileNamed: "LoveReaction") {
                reactionEmitter.name     = "LoveReaction"
                reactionEmitter.position = point
                scene.addChild(reactionEmitter)
            }
            
            if let reactionEmitter = SKEmitterNode(fileNamed: "SadReaction") {
                reactionEmitter.name     = "SadReaction"
                reactionEmitter.position = point
                scene.addChild(reactionEmitter)
            }
            
            if let reactionEmitter = SKEmitterNode(fileNamed: "WowReaction") {
                reactionEmitter.name     = "WowReaction"
                reactionEmitter.position = point
                scene.addChild(reactionEmitter)
            }
        }
    }

    
    
    // MARK: - Event
    @IBAction private func heartButtonTouchUpInside(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction private func starBorderButtonTouchUpInside(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction private func starFillButtonTouchUpInside(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction private func likeButtonTouchUpInside(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction private func reactionButtonTouchUpInside(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction private func tapGestureRecognizerAction(_ sender: UITapGestureRecognizer) {
        var point = sender.location(in: particleView)
        point.y = particleView.frame.height - point.y
        
        addParticle(point: point)
    }
}

