# Test Perma-Id w3id.org forwarding

This is a test facility to test-drive your forwarding rules before publishing them to [w3id.org](https://w3id.org/)

## Edit your forwards

The [w3id.org source repository](https://github.com/perma-id/w3id.org) is integrated as a [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) under [pid-w3id.org](pid-w3id.org/)

Be sure to run the following command after cloning this repo:

```console
git submodule update --init
```

We further recommend creating a fork of the [w3id.org source repository](https://github.com/perma-id/w3id.org).
Enter the [pid-w3id.org](pid-w3id.org/) and add it to the remotes

```console
cd pid-w3id.org
git remote add https://github.com/yourfork.git
cd ..
```

You can now create new branches and edit your namespace before test-driving it.

## Start a local w3id.org instance

We use docker for that purpose

```console
docker compose up
```

Afterwards, a w3id.org clone is available under `http://localhost:8080` which replaces the original `https://w3id.org`.

To check or compare the result of  `https://w3id.org/catenax/` you would now call 'http://localhost:8080/catenax/' instead.

We have added a shell script which performs that comparison for you by giving it a [csv file](test_local.csv). 

```console
./test_local.sh
```

Each line in the csv file contains two columns, one collumn with the test URL and one with the reference URL:

```csv
http://localhost:8080/catenax/;https://big-data-spaces.github.io/ontology/
```

After a successful local test, you may prepare a pull request (PR) agains w3id.org from the changed source repo.

## Test the final deployment

When the PR has been accepted and merged, you may test your changes again, now against the real deal:

```console
./test.sh
```

Each line in the [live csv file](test.csv) contains two columns, one collumn with the test URL and one with the reference URL:

```csv
https://w3id.org/catenax/;https://big-data-spaces.github.io/ontology/
```


