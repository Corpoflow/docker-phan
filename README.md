# Docker Phan


### Build
> `git clone https://github.com/Corpoflow/docker-phan.git`
> `cd docker-phan`
> `sudo docker build --force-rm --tag "corpoflow/phan" ./`

### Run in project root after build
> `sudo docker run --rm --volume $(pwd):/workspace corpoflow/phan --output-mode json --signature-compatibility --directory ./app > reports/phan/output.json`


### Phan
https://github.com/phan/phan
