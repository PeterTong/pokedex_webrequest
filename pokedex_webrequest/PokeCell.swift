//
//  PokeCell.swift
//  pokedex_webrequest
//
//  Created by KwokWing Tong on 28/5/2016.
//  Copyright © 2016 Tong Kwok Wing. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
  
  @IBOutlet weak var thumbImg: UIImageView!
  @IBOutlet weak var nameLbl: UILabel!
  
  var pokemon: Pokemon!
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    layer.cornerRadius = 5.0
  }
  
  func configureCell(pokemon: Pokemon){
    self.pokemon = pokemon
    
    nameLbl.text = pokemon.name.capitalizedString
    thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
  }
  
  
    
}
