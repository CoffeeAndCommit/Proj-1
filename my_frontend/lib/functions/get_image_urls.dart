String getImageUrl(String type) {
  switch (type.toLowerCase()) {
    case 'grass':
      return 'images/grass.png';
    case 'fire':
      return 'images/fire.png';
    case 'water':
      return 'images/water.png';
    case 'bug':
      return 'images/bug.png';
    case 'normal':
      return 'images/normal.png';
    case 'ghost':
      return 'images/ghost.png';

    case 'poison':
      return 'images/poison1.png';
    case 'electric':
      return 'images/electric.png';
    case 'ground':
      return 'images/ground.png';
    case 'fairy':
      return 'images/fairy.png';
    case 'fighting':
      return 'images/fighting.png';
    case 'psychic':
      return 'images/psychic.png';
    case "ghost/poison":
      return 'images/ghost.png';
    case 'electric/steel':
      return 'images/electric.png';
    case 'normal/flying':
      return 'images/normalflying.png';
    case 'water/ice':
      return 'images/water.png';
    case 'bug/poison':
      return 'images/bug.png';
    case 'bug/grass':
      return 'images/bug.png';
    case "water/psychic":
      return 'images/water.png';
    case "fire/flying":
      return 'images/fire.png';
    case 'grass/poison':
      return 'images/grass.png';
    case 'rock/ground':
      return 'images/ground.png';
    case "water/fighting":
      return 'images/fighting.png';

    default:
      return 'images/default.png';
  }
}
