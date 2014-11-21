# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


cow = Animal.create(name:"cow")
PrimalCut.create(name:"chuck" , animal: cow )
PrimalCut.create(name:"short loin" , animal: cow )
rib = PrimalCut.create(name:"rib" , animal: cow )
Cut.create(name:"Prime Rib" , animal: cow, primal_cut: rib )
Cut.create(name:"Ribeye" , animal: cow, primal_cut: rib )
Cut.create(name:"porterhouse" , animal: cow )
Cut.create(name:"t-bone" , animal: cow )
Cut.create(name:"strip" , animal: cow )
pig = Animal.create(name:"pig")
PrimalCut.create(name:"jowl" , animal: pig )
PrimalCut.create(name:"ham" , animal: pig )
loin = PrimalCut.create(name:"loin" , animal: pig )
Cut.create(name:"Loin Chop" , animal: pig, primal_cut: loin )

Cut.create(name:"Blade Roast" , animal: pig, primal_cut: loin )


Cut.create(name:"Babyback Ribs" , animal: pig )
Cut.create(name:"Spareribs" , animal: pig )
Cut.create(name:"Hock" , animal: pig )