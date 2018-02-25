# Test

This is initial instructions for running the app.

## Running for the first time
You can choose to run the application totally with Docker. If you choose this option, all starts with the contents of the folder `infra`, placed on the root of the directory

At this point we are considering you haven't ran this before, so it will take a bit longer to put everything on rails :)  (around 5 minutes to get everything up). It will take this time because it first gets the Ruby Alpine image from docker hub and then creates the app image with `rails`.

I set the ruby version to 2.4.3 this can be sawn in the file `infra/dev/Dockerfile`

Otherwise, you can choose to local run the app normally with rails command

Despite all these steps, all you need to do is run the following command on the root of the project:

```
sh infra/local_build.sh
```

It will prompt you if you want to run with docker or with rails, and all you need to do is answer with `r` for rails or `d` for docker.

With rails, it will run in the default port `3000`. For docker I choose `3001` just for preventing
conflicts with already used port 3000.
