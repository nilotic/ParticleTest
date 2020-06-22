//
//  DataManager.swift
//  ParticleTest
//
//  Created by Den Jo on 2020/06/22.
//  Copyright © 2020 Den Jo. All rights reserved.
//

import UIKit
import SpriteKit

final class DataManager: NSObject {

    // MARK: - Value
    // MARK: Public
    var anglerAction: SKAction {
        let atlas = SKTextureAtlas(named: "love")
        var textures = [SKTexture]()
        
        for i in 0..<atlas.textureNames.count {
            guard let number = formatter.string(for: i) else { continue }
            textures.append(atlas.textureNamed("frame_\(number)_delay-0.03s.png"))
        }
        
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        return SKAction.repeatForever(action)
    }
    
    var likeAction: SKAction {
        let atlas = SKTextureAtlas(named: "like")
        var textures = [SKTexture]()
        
        for i in 0..<atlas.textureNames.count {
            guard let number = formatter.string(for: i) else { continue }
            textures.append(atlas.textureNamed("frame_\(number)_delay-0.03s.png"))
        }
        
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        return SKAction.repeatForever(action)
    }
    
    var hahaAction: SKAction {
        let atlas = SKTextureAtlas(named: "haha")
        var textures = [SKTexture]()
        
        for i in 0..<atlas.textureNames.count {
            guard let number = formatter.string(for: i) else { continue }
            textures.append(atlas.textureNamed("frame_\(number)_delay-0.03s.png"))
        }
        
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        return SKAction.repeatForever(action)
    }
    
    var wowAction: SKAction {
        let atlas = SKTextureAtlas(named: "wow")
        var textures = [SKTexture]()
        
        for i in 0..<atlas.textureNames.count {
            guard let number = formatter.string(for: i) else { continue }
            textures.append(atlas.textureNamed("frame_\(number)_delay-0.03s.png"))
        }
        
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        return SKAction.repeatForever(action)
    }
    
    var sadAction: SKAction {
        let atlas = SKTextureAtlas(named: "sad")
        var textures = [SKTexture]()
        
        for i in 0..<atlas.textureNames.count {
            guard let number = formatter.string(for: i) else { continue }
            textures.append(atlas.textureNamed("frame_\(number)_delay-0.03s.png"))
        }
        
        let action = SKAction.animate(with: textures, timePerFrame: 0.03)
        return SKAction.repeatForever(action)
    }
    
    var angerGIF: UIImage? {
        guard let url = Bundle.main.url(forResource: "anger", withExtension: "gif") else { return nil }
        return GIFConverter.gif(data: try? Data(contentsOf: url))
    }
    
    var loveGIF: UIImage? {
        guard let url = Bundle.main.url(forResource: "love", withExtension: "gif") else { return nil }
        return GIFConverter.gif(data: try? Data(contentsOf: url))
    }
    
    var wowGIF: UIImage? {
        guard let url = Bundle.main.url(forResource: "wow", withExtension: "gif") else { return nil }
        return GIFConverter.gif(data: try? Data(contentsOf: url))
    }
    
    var hahaGIF: UIImage? {
        guard let url = Bundle.main.url(forResource: "haha", withExtension: "gif") else { return nil }
        return GIFConverter.gif(data: try? Data(contentsOf: url))
    }
    
    var sadGIF: UIImage? {
        guard let url = Bundle.main.url(forResource: "sad", withExtension: "gif") else { return nil }
        return GIFConverter.gif(data: try? Data(contentsOf: url))
    }
    
    var likeGIF: UIImage? {
        guard let url = Bundle.main.url(forResource: "like", withExtension: "gif") else { return nil }
        return GIFConverter.gif(data: try? Data(contentsOf: url))
    }
    
    
    // MARK: Private
    private lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumIntegerDigits = 2
        return formatter
    }()
}
