root = $(shell pwd)
msg = "deploy"
file = "notities"
adoc = ${file}.adoc
html = ${file}.html
docker_run = docker run --rm -v ${root}:/documents/ asciidoctor/docker-asciidoctor
	
all: index git

html:
	${docker_run} asciidoctor ${adoc}

pdf:
	${docker_run} asciidoctor-pdf ${adoc}

index: html
	cp ${html} index.html

git:
	git add -A
	git commit -m "${msg}"
	git push
