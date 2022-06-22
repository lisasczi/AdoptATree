# TODO: implement your seeds

john = User.create!(
  first_name: 'John',
  last_name: 'Doe',
  password: 'secret',
  email: 'john@appeltrees.coom'
)
apple_tree = Tree.create!(
  name: 'John’s apple tree',
  address: '20 rue des Capucins 69001 Lyon',
  description: 'This apple tree produces both sweet and sour apples. They will be    perfect to cut a little hunger, or enjoy a juicy apple for the dessert.',
  price: 175,
  quantity_by_year: 5,
  fruits: "Apple",
  user: john
)

  # tree number 2

lisa = User.create!(
  first_name: 'Lisa',
  last_name: 'lisa',
  password: 'secret',
  email: 'lisa@apricottrees.coom'
)
apricot_tree = Tree.create!(
  name: 'Lisa apricot tree',
  address: '20 rue des archives 69002 Lyon',
  description: 'This apricot tree produces both sweet and sour apples. They will be    perfect to cut a little hunger, or enjoy a juicy apple for the dessert.',
  price: 150,
  quantity_by_year: 7,
  fruits: "Apricot",
  user: lisa
)

  # tree number 3

toto = User.create!(
  first_name: 'toto',
  last_name: 'toto',
  password: 'secret',
  email: 'toto@cherrytrees.coom'
)
cherry_tree = Tree.create!(
  name: 'toto cherry tree',
  address: '20 rue des cherry 69008 Lyon',
  description: 'This cherry tree produces both sweet and sour apples. They will be    perfect to cut a little hunger, or enjoy a juicy apple for the dessert.',
  price: 180,
  quantity_by_year: 10,
  fruits: "Cherry",
  user: toto
)

  # tree number 4

tata = User.create!(
  first_name: 'tata',
  last_name: 'tata',
  password: 'secret',
  email: 'tata@figtrees.coom'
)
fig_tree = Tree.create!(
  name: 'tata fig tree',
  address: '20 rue des fig 69002 Lyon',
  description: 'This fig tree produces both sweet and sour apples. They will be    perfect to cut a little hunger, or enjoy a juicy apple for the dessert.',
  price: 180,
  quantity_by_year: 9,
  fruits: "Fig",
  user: tata
)
