# How to release

The release process bumps the current version, writes it to a file then creates a tag from the master branch and pushes that tag. 

The commands to create a release are:

```bash
    # for a patch release
    make release-patch

    # for a minor release
    make release-minor    

    # for a major release
    make release-major
```
