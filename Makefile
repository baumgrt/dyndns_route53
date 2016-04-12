all:	route53-ddns

route53-ddns:	route53-ddns.go
	go build $<

clean:	

distclean:	clean
	rm route53-ddns

.PHONY:	all clean distclean
