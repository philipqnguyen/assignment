# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

park = Project.create(title: 'Build a theme park',
                      content: 'Lorem ipsum dolor sit amet, duo meis eligendi
                     postulant ad. Ad usu doctus saperet evertitur, ea amet
                     ceteros adipisci pri. Natum audiam pri id, at alienum
                     principes forensibus vel. Habeo persecuti te mel. Sit id
                     viderer volumus vituperatoribus. Dicunt menandri usu cu,
                     per eius blandit ex.')
everest = Project.create(title: 'Climb Everest',
                         content: 'Quidam platonem persequeris vel cu, graeco
                      nonumes has et. Nam quaestio salutatus voluptatibus an,
                      suas errem sea ea. Nec at tempor essent euripidis. His
                      vitae alterum hendrerit ei, ex nam causae euismod
                      recteque. Aeque fastidii constituam ne pri.')
facebook = Project.create(title: 'Code Facebook 2',
                          content: 'Te pro semper assueverit disputationi, at omnium
                    equidem usu, sea ea graeci everti option. Cum ei dico
                    diam dicant, ei fugit democritum quo. Id accusam invenire
                    referrentur nam, probo efficiantur cu eum, te sea lorem
                    choro. Graeci vidisse signiferumque vis et, tale commodo
                    ea vim. Nam probatus phaedrum ocurreret ex. Eu mel nisl
                    homero ullamcorper, ad solet dolorum gubergren vim.')
twitter = Project.create(title: 'Code Twitter 2',
                         content: 'Te pro semper assueverit disputationi, at
                       omnium equidem usu, sea ea graeci everti option. Cum
                       ei dico diam dicant, ei fugit democritum quo. Id
                       accusam invenire referrentur nam, probo efficiantur cu
                       eum, te sea lorem choro. Graeci vidisse signiferumque
                       vis et, tale commodo ea vim. Nam probatus phaedrum
                       ocurreret ex. Eu mel nisl homero ullamcorper, ad solet
                       dolorum gubergren vim.')

emanuel = User.create(username: 'Emanuel',
                      email: 'emanuel@email.com',
                      password: 'password')
jon = User.create(username: 'Jon',
                  email: 'jon@email.com',
                  password: 'password')
francis = User.create(username: 'Francis',
                      email: 'francis@email.com',
                      password: 'password')
bunny = User.create(username: 'Bunny',
                    email: 'bunny@email.com',
                    password: 'password')
george = User.create(username: 'George',
                     email: 'george@email.com',
                     password: 'password')

emanuel.projects << park
Project.find(park).mentships.where(user_id: emanuel.id)[0].update(role: 'creator')

jon.projects << twitter
Project.find(twitter).mentships.where(user_id: jon.id)[0].update(role: 'creator')

francis.projects << facebook
Project.find(facebook).mentships.where(user_id: francis.id)[0].update(role: 'creator')

bunny.projects << everest
Project.find(everest).mentships.where(user_id: bunny.id)[0].update(role: 'creator')

george.projects << everest << facebook << twitter << park
Project.find(park).mentships.where(user_id: george.id)[0].update(role: 'participant')
Project.find(twitter).mentships.where(user_id: george.id)[0].update(role: 'participant')
Project.find(facebook).mentships.where(user_id: george.id)[0].update(role: 'participant')
Project.find(everest).mentships.where(user_id: george.id)[0].update(role: 'participant')
