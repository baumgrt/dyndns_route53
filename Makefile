GOOS=linux
GOARCH=amd64

PANDOC_ARGS=-f markdown_github-hard_line_breaks --normalize

all:	binary

binary:	route53-ddns

route53-ddns:	route53-ddns.go
	env GOOS=$(GOOS) GOARCH=$(GOARCH) go build $<

docs:	pdfdoc htmldoc

pdfdoc:	README.pdf

htmldoc:	README.html

%.pdf:	%.md
	pandoc $(PANDOC_ARGS) -t latex -N -o $@ $<

%.html:	%.md
	pandoc $(PANDOC_ARGS) -t html5 -N -o $@ $<

updatedeps:
	go get -u github.com/aws/aws-sdk-go/...
	go get -u github.com/kardianos/osext/...
	go get -u github.com/op/go-logging/...

clean:
	rm -f route53-ddns
	rm -f README.pdf

distclean:	clean
	rm -f route53.log
	rm -f README.html


.PHONY:	all binary clean distclean docs htmldoc pdfdoc updatedeps
