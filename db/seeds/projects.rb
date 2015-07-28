Project.create!([
    {
        title: 'iHUB Rails meetup',
    },
    {
        title: 'Netguru worshop',
    },
    {
        title: 'Career at Netguru',
    }
])

puts("#{Project.count} projects(s) have been created")