# Agenda

Complete the `Agenda` class.

When an agenda is created it will be given a `filename`. On initialization, it should read `filename` and create an array of contacts using the file information (using the `Contact` class). If the filename doesn't exists it should be created at that moment.

- When asked for `contacts` it will return its array of contacts.
- When asked for `filename` it will return its filename.
- When asked for `add` it will be given a `name` and `email` and it will create a new contact and add it to the contact array only if the contact is valid. Otherwise return `nil`
  - A contact is valid if the name is not empty and the email follows a valid format.
  - For this exercise, a valid email consist on:
    - any number of word characters, follow by `@`, follow by any number of word characters, follow by a `.`, follow by 2 or 3 word characters.
- When asked for `save`it will write on `filename` the list of contacts, one contact per line, using the format "[name],[email]" (name and email separated by a comma)
- When asked for `filter` it will be given a field and term and it should return an array of contacts containing only the contacts that match the `term` on the required `field`. For example, if field = "name" and term = "John" it should return all the contacts which `name` match the word "John".
