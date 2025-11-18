
String getImageUrl(String type) {
  switch (type.toLowerCase()) {
    case 'grass':
      return 'images/grass.png';
    case 'fire':
      return 'images/fire.png';
    case 'water':
      return 'images/water.png';    
    default:
      return 'images/default.png';

  }
}
