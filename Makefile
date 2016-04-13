GOOS=linux
GOARCH=amd64

all:	route53-ddns

route53-ddns:	route53-ddns.go
	env GOOS=$(GOOS) GOARCH=$(GOARCH) go build $<

updatedeps:
	go get -u github.com/aws/aws-sdk-go/...
	go get -u github.com/kardianos/osext/...
	go get -u github.com/op/go-logging/...

clean:
	rm -f route53-ddns

distclean:	clean
	rm -f route53.log

.PHONY:	all clean distclean updatedeps
