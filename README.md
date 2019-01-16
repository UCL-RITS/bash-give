# give

A tool to allow users to pass files to each other.

## Installation

 - Copy the `give` script to somewhere in-PATH
 - Create symlinks `ungive` and `take` to the `give` script
 - Create the spool directory/"gift store" directory somewhere with appropriate permissions: these should be 1777 (rwxrwxrwt)
 - Alter the script's gift-store variable at the top to default to your spool directory's path

## TODO

 - Consider whether having some sort of `/etc/gift-store.conf` setup would be better than putting the gift-store path in the script itself
 - Consider whether this is actually a good implementation
 - Add a subcommand to both `give` and `take` to list available gifts

## How It Works

A user `user_a` wants to give a file `my_file` to another user `user_b`. They enter:

```
give user_b my_file
```

This gets the numeric user ID of both `user_a` and `user_b` and creates a directory in a publically-accessible directory (the "gift store") named `<uid_a>-<uid_b>` with an ACL that allows `user_b` to read from it. The file is then copied into that directory.

`user_b` can then use:

```
take user_a my_file
```

This copies the file into `user_b`'s current working directory and deletes it from the shared directory. Note that the shared directory is not deleted -- the ACLs do make this possible for `user_b` but it was not seen as necessary.

