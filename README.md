# configs
Configuration files for things like bash, screen, and vim

## Note for SSH agent forwarding

A common task when setting up on a new host is setting up [ssh agent forwarding](https://developer.github.com/v3/guides/using-ssh-agent-forwarding/). When doing this, it may be necessary to follow [this section](https://developer.github.com/v3/guides/using-ssh-agent-forwarding/#your-key-must-be-available-to-ssh-agent) of the document. For example, the command might be:

    ssh-add -K ~/.ssh/id_rsa

on the host that you're SSH-ing in from. This could resolve an error like `Permission denied (publickey).` encountered on the remote server when you try `ssh -T git@github.com`.
