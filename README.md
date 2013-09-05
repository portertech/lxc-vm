# LXC-VM

Builds a VirtualBox VM to run Docker/LXC containers within.

Using synced folders, the following are available within the VM:

- `~/.ssh`
- `~/.emacs.d`
- `~/projects`

The VM is intended to be ephemeral.

## Dependencies

- Ruby >= 1.9
- [Vagrant](http://downloads.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## Usage

```
bundle install
librarian-chef install
vagrant up
```
