// Character prototype
function Character(name, health) {
    this.name = name;
    this.health = health;
  }
  
  Character.prototype.printStats = function() {
    console.log(`${this.name} - Health: ${this.health}`);
  };
  
  // Player constructor
  function Player(name, health, level) {
    // Implement inheritance
    this.name = name;
    this.health = health;
    this. level = level;
  }
  
  // Enemy constructor
  function Enemy(name, health) {
    // Implement inheritance
    this.name = name;
    this.health = health;
  }
  
  Player.prototype = Object.create(Character.prototype);
  Enemy.prototype = Object.create(Character.prototype);
  
  // Implement levelUp method for Player
  // Implement attack method for Enemy
  
  Player.prototype.levelUp = function() {
    this.level++;
    this.health = this.health * this.level;
    console.log(`${this.name} leveled up to ${this.level}`)
  }
  
  Player.prototype.oneShot = function(character) {
    character.health = 0;
    console.log(`${this.name} killed ${character.name}`);
  }
  
  Player.prototype.save = function(character) {
    character.health += 100;
    console.log(`${this.name} saved ${character.name}`);
  }
  
  Enemy.prototype.attack = function(character) {
    character.health -= 15;
    console.log(`${this.name} attacked ${character.name}`);
  }
  
   
  // Create instances and demonstrate functionalities
  const player = new Player("Hero", 100, 1);
  const princess = new Character("Princess", 100);
  const enemy = new Enemy("Monster", 50);
  
  while (player.health > 10) enemy.attack(player);
  player.levelUp();
  while (princess.health > 0) enemy.attack(princess);
  princess.printStats();
  player.save(princess);
  player.oneShot(enemy);
  // Demonstrate functionalities
  player.printStats();
  princess.printStats();
  enemy.printStats();
  // Perform attacks, level up, etc.

  console.log(`Moral of the story: Don't anger ${player.name} if you value your life.`);