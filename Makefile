root = ${shell pwd}
file = "notities.adoc"
docker_run = docker run --rm -v ${root}:/documents/ asciidoctor/docker-asciidoctor
html:
	${docker_run} asciidoctor ${file}

pdf:
	${docker_run} asciidoctor-pdf ${file}
