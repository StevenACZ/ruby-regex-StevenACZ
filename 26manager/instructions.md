# AgendaManager

Complete the `AgendaManager` start method and menu private method.

- The program, when executed with a filename as a command line argument, creates an `AgendaManager` instance passing the filename and call its start method.
- The start method prints the menu, showing the filename on the title and the options: list, add, save, search and exit. Then prompt the user to pick an option.

```bash
$ ruby manager.rb agenda.txt
-----------------------agenda.txt-----------------------
1. list     2. add      3. save     4. search   5. exit
>
```

- When the user input add, the program ask for a name and then for a email. If the name and email are valid, add it to the agenda and prints "Contact added". Then shows the menu again.

```bash
> add
Name: John Doe
Email: john@mail.com
Contact added
-----------------------agenda.txt-----------------------
1. list     2. add      3. save     4. search   5. exit
>
```

- When the user input list, the current contacts in the agenda are listed.

```bash
> list
John Doe,john@mail.com

-----------------------agenda.txt-----------------------
1. list     2. add      3. save     4. search   5. exit
>
```

- When the user input save, the current contacts are saved to the `filename` and the menu is displayed again.

```bash
> save
-----------------------agenda.txt-----------------------
1. list     2. add      3. save     4. search   5. exit
>
```

- When the user input search, the program ask for a field and term, and list the contacts that matches.

```bash
> search
Field: name
Search term: Doe
John Doe,john@mail.com
-----------------------agenda.txt-----------------------
1. list     2. add      3. save     4. search   5. exit
>
```

If the user add an invalid contact, the program shows "Failed" and no contact is added.

```bash
> add
Name:
Email: mail.com
Failed
-----------------------agenda.txt-----------------------
1. list     2. add      3. save     4. search   5. exit
>
```
