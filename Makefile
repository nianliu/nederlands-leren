root = $(shell pwd)
msg = "deploy"
docs_folder = docs
file = notities
adoc = ${docs_folder}/${file}.adoc
html = ${docs_folder}/${file}.html
docker_run = docker run --rm -v ${root}:/documents/ asciidoctor/docker-asciidoctor
	
all: index git

html:
	${docker_run} asciidoctor ${adoc}

pdf:
	${docker_run} asciidoctor-pdf ${adoc}

index: html
	cp ${html} ${docs_folder}/index.html

git:
	git add -A
	git commit -m "${msg}"
	git push
