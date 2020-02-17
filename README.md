# Docker Phan


### Build
`sudo docker build --force-rm --tag "corpoflow/phan" ./`

### Run in project root after build
`sudo docker run --rm --volume $(pwd):/workspace corpoflow/phan --output-mode json --signature-compatibility --directory ./app > reports/phan/output.json`
