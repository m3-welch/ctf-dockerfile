# ctf-dockerfile
A Dockerfile I use for CTFs.

## Use with HackTheBox
This container is meant to work with HackTheBox, but in order to do so, is a bit _hacky_. HackTheBox requires connecting to an OpenVPN server using a given config. In order to get this to run in this docker container, you must modify this config to not use IPv6 using these 2 lines:

`pull-filter ignore "ifconfig-ipv6"`
`pull-filter ignore "route-ipv6"`

You then need to run the container using the `byobu` command rather than `/bin/bash`. This is because when you run `openvpn <username>.ovpn`, it hangs when the connection is successful, and you must open a separate terminal session and leave the OpenVPN session running.

## Help, Contribution and Forking
I encourage you to offer me advice on where I've gone completely insane in this. Please raise an issue if you can see somewhere I can improve, or better yet, create a merge request and do it yourself! I'll check through any and all merge requests before merging. Also, this is obviously tailored to my needs (using my OpenVPN config and dotfiles), so feel free to fork this to make it work for you.
