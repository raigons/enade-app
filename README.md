# Approva Test

This is initial instructions for running the app.

## Running for the first time
You can choose to run the application totally with Docker. If you choose this option, all starts with the contents of the folder `infra`, placed on the root of the directory

At this point we are considering you haven't ran this before, so it will take a bit longer to put everything on rails :)  (around 10 minutos to get everything up). It will take this time because it first get the Alpine image from docker hub, then create a `ruby image` from scratch, downloading `ruby`, unpacking and compiling it and last creates the app image with `rails`.  I choose to do this because I had an optimised ruby image which I worked on before to have a tiny image (not the huge one you can find on docker hub).

Despite all these steps, all you need to do is run the following command on the root of the project:
```
sh infra/local_build.sh
```
I set the ruby version to 2.4.1, and alo tagged the image with this version (this can be sawn in the file `infra/ruby/Dockerfile`
