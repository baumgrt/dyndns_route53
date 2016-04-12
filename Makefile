GOOS=linux
GOARCH=amd64

all:	route53-ddns

route53-ddns:	route53-ddns.go
	env GOOS=$(GOOS) GOARCH=$(GOARCH) go build $<

clean:
	rm -f route53-ddns

distclean:	clean
	rm -f route53.log

.PHONY:	all clean distclean
