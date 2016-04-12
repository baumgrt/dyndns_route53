GOOS=linux
GOARCH=amd64

all:	route53-ddns

route53-ddns:	route53-ddns.go
	env GOOS=$(GOOS) GOARCH=$(GOARCH) go build $<

clean:	

distclean:	clean
	rm route53-ddns

.PHONY:	all clean distclean
