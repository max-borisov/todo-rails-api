Project.create!([
    {
        title: 'Netguru worshop',
    },
    {
        title: 'RubyGarage application',
    },
    {
        title: 'iHUB booshelf app',
    }
])

puts("#{Project.count} projects(s) have been created")