# Solr 3.6 for Packagist

This has been adapted from a Dockerfile by [Actency](https://github.com/Actency/docker-solr/blob/master/3.6/Dockerfile).

```
git clone git@github.com:UKWebMedia/packagist-solr.git
cd packagist-solr
docker build . -t "ukwm:packagist-solr"
docker run -p 8983:8983 ukwm:packagist-solr
```

Once they this is running, you can following the [Packagist](https://github.com/composer/packagist) installation guide.
