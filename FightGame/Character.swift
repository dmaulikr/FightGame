//
//  Character.swift
//  FightGame
//
//  Created by Kaleb Bataran on 3/1/16.
//  Copyright © 2016 kaydot. All rights reserved.
//

import Foundation

class Character {
	
	//Attributes
	private var _health: Int = 100
	private var _attackPwr: Int = 20
	private var _name: String!
	
	//Accessors
	var health: Int {
		get {
			return _health
		}
	}
	
	var attackPwr: Int{
		get{
			return _attackPwr
		}
	}
	
	var name: String {
		get {
			return _name
		}
	}
	
	var isAlive: Bool {
		get {
			if health > 0 {
				return true
			}
			else {
				return false
			}
		}
	}
	
	init(startingHealth: Int, attackPwr: Int, name: String) {
		self._health = startingHealth
		self._attackPwr = attackPwr
		self._name = name
	}
	
	func attack(target: Character) {
		target._health -= attackPwr
	}
}