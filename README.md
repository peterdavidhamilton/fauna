# Fauna

### A demonstration of animal taxonomy stored in LDAP.

This example code is bundled with [ROM-LDAP](https://gitlab.com/peterdavidhamilton/rom-ldap).

## Running Locally

Bring up the LDAP server

    $ docker-compose up ldap

Update the ldap server with our custom schema and add new entries.
Uses environment variables set in `.env` and requires `ldapmodify` to be installed.

    $ bundle exec rake ldap:modify

Drop into the interactive console and explore the relations.

    $ bundle exec ./bin/console


## Running in Docker

Alternatively, you can do this in the `console` container.
To detach the tty without exiting the shell, use the escape sequence <kbd>Ctrl-p Ctrl-q</kbd>

    $ docker-compose up -d && docker attach fauna-console


## Example


```ruby
relations[:fauna].to_a
```
     => [{:dn=>["species=Homo sapiens,ou=fauna,dc=earth"],
      :cn=>["Human"],
      :description=>["Modern humans are the only extant members of the subtribe Hominina, a branch of the tribe Hominini belonging to the family of great apes."],
      :endangered=>false,
      :extinct=>false,
      :family=>"Hominidae",
      :genus=>"Homo",
      :labeled_uri=>["https://en.wikipedia.org/wiki/Human"],
      :object_class=>["extensibleObject", "top", "mammalia"],
      :order=>"Primates",
      :population_count=>7582530942,
      :species=>"Homo sapiens",
      :study=>"anthropology"},
     {:dn=>["species=Ounalashkastylus tomidai,ou=fauna,dc=earth"],
      :cn=>["Desmostylian"],
      :description=>["This species honours distinguished Japanese vertebrate palaeontologist Yukimitsu Tomida"],
      :extinct=>true,
      :family=>"Desmostylidae",
      :genus=>"Ounalashkastylus",
      :labeled_uri=>["https://www.youtube.com/watch?v=AeTvZ1AH7mM", "http://fossilworks.org/?a=taxonInfo&taxon_no=329742", "https://en.wikipedia.org/wiki/Desmostylia"],
      :object_class=>["extensibleObject", "top", "mammalia"],
      :order=>"Desmostylia",
      :species=>"Ounalashkastylus tomidai",
      :translation=>["From Greek δεσμά desma, \"bundle\", and στῦλος stylos, \"pillar\"; and refers to the unique teeth morphology"]}]




## Development

Place built gems *(ldap-ber-x.x.x.gem, rom-ldap-x.x.x.gem)* in `./tmp/vendor/cache`

