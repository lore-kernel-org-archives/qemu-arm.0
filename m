Received: by 10.25.0.23 with SMTP id 23csp2851354lfa;
        Thu, 8 Jun 2017 19:28:08 -0700 (PDT)
X-Received: by 10.237.53.33 with SMTP id a30mr13717000qte.207.1496975288053;
        Thu, 08 Jun 2017 19:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496975288; cv=none;
        d=google.com; s=arc-20160816;
        b=x8jl4VbnA4lWFFnw2oxJ+zLBkyCi8yJRMRS0YixWmLAt5Eo5N1XPs4PeYfX1M/7ori
         j8bnAqeai6LaJbCt8R8IMSaptGCQdj3FpWC6WAHchqI5Y/gtWwAx0nRfdF4H5JtdM/WF
         yMmmCPrwkWlaEULZX2l0ARjd/T8VTrPKGotxuYqZ6gKdppAzYp6BsSLT3LQF0xh2hey8
         ALxpC+Aa/LwcxkrQOizdV6Hf6rCeSiS0vCBYbV8vgyPEtHYeqGuj65Fwzyko5h6tQmg0
         CB/X1qQWCTap+Armw1M67uvZ96IcMe0RR9GY8/yHMuXpSKF0FwSKOHZ6SIhwB+rLzPnX
         TX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=XERpe6qHTmMyvJLK5E9wTRpIxyuaxI4IGYPmiBctShc=;
        b=a8fPfiVkMdefQ8Te/Q7eBJfPyZ2hBCtLRofPvzn9ecLWJy5JacXIffbgKBiG6MOjx+
         RwBaCb3Xi8//mcukKb1XpANMDDYfVCeu3tVz+lCBwRciWWGsu7PXS/oT41obxwRGXymP
         QVolsJzAHjEPUWLusf3UkjKMW0sxzXGN7xrl2iIqGmon7ACVIM1JdYx4h4jAWsN5Pnsi
         cag0DH7b1VVl4N/L11NyA6+TJTfsZ6fMFZ56K+m3+Fd7Hhv7KrtqEcKFtTWDYasA2eGE
         9gHNRwoYd3MwOxb7sdXiI/vp8G2Rh13O++IUvUb9BRiWN0Sj04ck+VC+kDpD6I4BOQBG
         oaJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5si6979978qtb.73.2017.06.08.19.28.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Jun 2017 19:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJ9ef-0002l1-DB
	for alex.bennee@linaro.org; Thu, 08 Jun 2017 22:28:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dJ9dZ-0001Vr-Cz
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 22:26:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dJ9dW-0006O0-8C
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 22:26:57 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56245)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dJ9dV-0006Nk-ND; Thu, 08 Jun 2017 22:26:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 7A337208A3;
	Thu,  8 Jun 2017 22:26:51 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Thu, 08 Jun 2017 22:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=XERpe6qHTmMyvJLK5E9wTRpIxyuaxI4IGYPmiBctS
	hc=; b=XdQh1YytM6i8ofMAjc1LOpZLLTyIp6AU0KAXwmKH7Lqp8cIM6y0DoCOT2
	gSbvxfYiU6yEnMJHeHI47Bu7YQw0qPMsrVkK+4zulKbM+uqPu40wZ/oQislaoW3S
	dmSKmbjtdR3vCcy5bLH62z0bv9jgWptlytbcbvLRY0z5aLARhzTUasg4JK2/CPij
	9kANCndXt2M8szwz1ZhBLoH3irGj9lXVeU7POlTdYRJ1EP/+AgCxfkh+syBXmYOl
	hUNXB4akJKVGhTCwmpXDmzXJRHy6ixMTnviJXvDP8GDtrBchQfwTLPuGpAPySbCa
	Hpe70HStf0Mn3rXiiRcaV8EjPb3Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=XERpe6qHTmMyvJLK5E
	9wTRpIxyuaxI4IGYPmiBctShc=; b=ZMwu4i5kqWw/rPChmodnU5eQK5mKB8lR+d
	t4vcom3QpHE1JMcY2965sWXm+0pgVXZMqMsOyploNe3Pt71bsayIBzt/wF7dn35c
	1NyHjNL8f+sd/ljy4nTQFHfGPuxh6v8ZeseShX7tyWI+5cu948hW5z8PxwVM3Wc0
	1c1Ni4f9knz2xgBBvbTfdNqKZiMWL6z9QL0vd2rR/Kl0W9aW7B/wE0UxCY7Oz1WM
	+4L+VuSSB8jTms05asYJv64Ms94JbEBA6R+EACjOf8ME9wCT8XOcBxYAhJe/U9bo
	7+IOf+FHzVIr33NXB3oPHDyCfPbMwF+9SShezngjh0kvMUSPgR/w==
X-ME-Sender: <xms:awc6WfQQPry8zqo5uURXDrsjg1ZmUzv4fqh2GN6AmS9IdIGFo91bDw>
X-Sasl-enc: BQ4qoF5ZlWjZs+p8NOJbQqdfHoSXpFAOLkgPvHxOiCn6 1496975210
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4201B7E7AA;
	Thu,  8 Jun 2017 22:26:49 -0400 (EDT)
Message-ID: <1496975205.23335.9.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Fri, 09 Jun 2017 11:56:45 +0930
In-Reply-To: <1496739312-32304-1-git-send-email-clg@kaod.org>
References: <1496739312-32304-1-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-82dWZunQWbGaf3i9I6cf"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [PATCH] timer/aspeed: fix timer enablement when a
 reload is not set
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OsbMJCdyv0h9


--=-82dWZunQWbGaf3i9I6cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE3LTA2LTA2IGF0IDEwOjU1ICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBXaGVuIGEgdGltZXIgaXMgZW5hYmxlZCBiZWZvcmUgYSByZWxvYWQgdmFsdWUgaXMgc2V0
LCB0aGUgY29udHJvbGxlcgo+IHdhaXRzIGZvciBhIHJlbG9hZCB2YWx1ZSB0byBiZSBzZXQgYmVm
b3JlIHN0YXJ0aW5nIGRlY3JlbWVudGluZy4gVGhpcwo+IGZpeCB0cmllcyB0byBjb3ZlciB0aGF0
IGNhc2UgYnkgY2hhbmdpbmcgdGhlIHRpbWVyIGV4cGlyeSBvbmx5IHdoZW4KPiBhIHJlbG9hZCB2
YWx1ZSBpcyB2YWxpZC4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxj
bGdAa2FvZC5vcmc+Cj4gLS0tCj4gwqBody90aW1lci9hc3BlZWRfdGltZXIuYyB8IDM3ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyOSBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9ody90aW1lci9h
c3BlZWRfdGltZXIuYyBiL2h3L3RpbWVyL2FzcGVlZF90aW1lci5jCj4gaW5kZXggOWI3MGVlMDli
MDdmLi41MGFjYmY1MzBhM2EgMTAwNjQ0Cj4gLS0tIGEvaHcvdGltZXIvYXNwZWVkX3RpbWVyLmMK
PiArKysgYi9ody90aW1lci9hc3BlZWRfdGltZXIuYwo+IEBAIC0xMzAsMTUgKzEzMCwyNiBAQCBz
dGF0aWMgdWludDY0X3QgY2FsY3VsYXRlX25leHQoc3RydWN0IEFzcGVlZFRpbWVyICp0KQo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbmV4dCA9IHNlcVsxXTsKPiDCoMKgwqDCoMKgwqDCoMKg
wqB9IGVsc2UgaWYgKG5vdyA8IHNlcVsyXSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
bmV4dCA9IHNlcVsyXTsKPiAtwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gK8KgwqDCoMKgwqDC
oMKgwqB9IGVsc2UgaWYgKHQtPnJlbG9hZCkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmVsb2FkX25zID0gbXVsZGl2NjQodC0+cmVsb2FkLCBOQU5PU0VDT05EU19QRVJfU0VDT05ELCBy
YXRlKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHQtPnN0YXJ0ID0gbm93IC0gKChub3cg
LSB0LT5zdGFydCkgJSByZWxvYWRfbnMpOwo+ICvCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogbm8gcmVsb2FkIHZhbHVlLCByZXR1cm4gMCAqLwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4g
wqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqByZXR1cm4gbmV4dDsKPiDCoH0KPiDCoAo+ICtz
dGF0aWMgdm9pZCBhc3BlZWRfdGltZXJfbW9kKEFzcGVlZFRpbWVyICp0KQo+ICt7Cj4gK8KgwqDC
oMKgdWludDY0X3QgbmV4dCA9IGNhbGN1bGF0ZV9uZXh0KHQpOwo+ICvCoMKgwqDCoGlmIChuZXh0
KSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqB0aW1lcl9tb2QoJnQtPnRpbWVyLCBuZXh0KTsKPiArwqDC
oMKgwqB9Cj4gK30KPiArCj4gwqBzdGF0aWMgdm9pZCBhc3BlZWRfdGltZXJfZXhwaXJlKHZvaWQg
Km9wYXF1ZSkKPiDCoHsKPiDCoMKgwqDCoMKgQXNwZWVkVGltZXIgKnQgPSBvcGFxdWU7Cj4gQEAg
LTE2NCw3ICsxNzUsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfdGltZXJfZXhwaXJlKHZvaWQgKm9w
YXF1ZSkKPiDCoMKgwqDCoMKgwqDCoMKgwqBxZW11X3NldF9pcnEodC0+aXJxLCB0LT5sZXZlbCk7
Cj4gwqDCoMKgwqDCoH0KPiDCoAo+IC3CoMKgwqDCoHRpbWVyX21vZCgmdC0+dGltZXIsIGNhbGN1
bGF0ZV9uZXh0KHQpKTsKPiArwqDCoMKgwqBhc3BlZWRfdGltZXJfbW9kKHQpOwo+IMKgfQo+IMKg
Cj4gwqBzdGF0aWMgdWludDY0X3QgYXNwZWVkX3RpbWVyX2dldF92YWx1ZShBc3BlZWRUaW1lciAq
dCwgaW50IHJlZykKPiBAQCAtMjI3LDEwICsyMzgsMjMgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3Rp
bWVyX3NldF92YWx1ZShBc3BlZWRUaW1lckN0cmxTdGF0ZSAqcywgaW50IHRpbWVyLCBpbnQgcmVn
LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHVpbnQzMl90IHZhbHVlKQo+IMKgewo+IMKgwqDCoMKgwqBBc3Bl
ZWRUaW1lciAqdDsKPiArwqDCoMKgwqB1aW50MzJfdCBvbGRfcmVsb2FkOwo+IMKgCj4gwqDCoMKg
wqDCoHRyYWNlX2FzcGVlZF90aW1lcl9zZXRfdmFsdWUodGltZXIsIHJlZywgdmFsdWUpOwo+IMKg
wqDCoMKgwqB0ID0gJnMtPnRpbWVyc1t0aW1lcl07Cj4gwqDCoMKgwqDCoHN3aXRjaCAocmVnKSB7
Cj4gK8KgwqDCoMKgY2FzZSBUSU1FUl9SRUdfUkVMT0FEOgo+ICvCoMKgwqDCoMKgwqDCoMKgb2xk
X3JlbG9hZCA9IHQtPnJlbG9hZDsKPiArwqDCoMKgwqDCoMKgwqDCoHQtPnJlbG9hZCA9IHZhbHVl
Owo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoC8qIElmIHRoZSByZWxvYWQgdmFsdWUgd2FzIG5vdCBw
cmV2aW91c2x5IHNldCwgb3IgemVybywgYW5kCj4gK8KgwqDCoMKgwqDCoMKgwqDCoCogdGhlIGN1
cnJlbnQgdmFsdWUgaXMgdmFsaWQsIHRyeSB0byBzdGFydCB0aGUgdGltZXIgaWYgaXQgaXMKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgKiBlbmFibGVkLgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAqLwo+ICvC
oMKgwqDCoMKgwqDCoMKgaWYgKG9sZF9yZWxvYWQgfHwgIXQtPnJlbG9hZCkgewo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiArwqDCoMKgwqDCoMKgwqDCoH0KCk1heWJlIEkgbmVl
ZCBtb3JlIGNhZmZlaW5lLCBidXQgSSBpbml0aWFsbHkgc3RydWdnbGVkIHRvIHJlY29uY2lsZSB0
aGUKY29uZGl0aW9uIHdpdGggdGhlIGNvbW1lbnQsIGFzIHRoZSBjb25kaXRpb24gY2hlY2tzIHRo
ZSBpbnZlcnNlIGluCm9yZGVyIHRvIGJyZWFrIHdoaWxlIHRoZSBjb21tZW50IGRpc2N1c3NlcyB0
aGUgbm9uLWJyZWFraW5nIGNhc2UuIAoKSG93ZXZlciwgYWZ0ZXIgdHJ5aW5nIGZvciBzZXZlcmFs
IG1pbnV0ZXMsIEknbSBub3Qgc3VyZSB0aGVyZSdzIGFuIGVhc3kKd2F5IHRvIGltcHJvdmUgaXQu
Cgo+ICsKPiDCoMKgwqDCoMKgY2FzZSBUSU1FUl9SRUdfU1RBVFVTOgo+IMKgwqDCoMKgwqDCoMKg
wqDCoGlmICh0aW1lcl9lbmFibGVkKHQpKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1
aW50NjRfdCBub3cgPSBxZW11X2Nsb2NrX2dldF9ucyhRRU1VX0NMT0NLX1ZJUlRVQUwpOwo+IEBA
IC0yMzgsMTcgKzI2MiwxNCBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfdGltZXJfc2V0X3ZhbHVlKEFz
cGVlZFRpbWVyQ3RybFN0YXRlICpzLCBpbnQgdGltZXIsIGludCByZWcsCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB1aW50MzJfdCByYXRlID0gY2FsY3VsYXRlX3JhdGUodCk7Cj4gwqAKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHQtPnN0YXJ0ICs9IG11bGRpdjY0KGRlbHRhLCBOQU5P
U0VDT05EU19QRVJfU0VDT05ELCByYXRlKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdGlt
ZXJfbW9kKCZ0LT50aW1lciwgY2FsY3VsYXRlX25leHQodCkpOwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBhc3BlZWRfdGltZXJfbW9kKHQpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKg
wqDCoMKgwqDCoMKgwqBicmVhazsKPiAtwqDCoMKgwqBjYXNlIFRJTUVSX1JFR19SRUxPQUQ6Cj4g
LcKgwqDCoMKgwqDCoMKgwqB0LT5yZWxvYWQgPSB2YWx1ZTsKPiAtwqDCoMKgwqDCoMKgwqDCoGJy
ZWFrOwo+IMKgwqDCoMKgwqBjYXNlIFRJTUVSX1JFR19NQVRDSF9GSVJTVDoKPiDCoMKgwqDCoMKg
Y2FzZSBUSU1FUl9SRUdfTUFUQ0hfU0VDT05EOgo+IMKgwqDCoMKgwqDCoMKgwqDCoHQtPm1hdGNo
W3JlZyAtIDJdID0gdmFsdWU7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHRpbWVyX2VuYWJsZWQo
dCkpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdGltZXJfbW9kKCZ0LT50aW1lciwgY2Fs
Y3VsYXRlX25leHQodCkpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhc3BlZWRfdGltZXJf
bW9kKHQpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsK
PiDCoMKgwqDCoMKgZGVmYXVsdDoKPiBAQCAtMjY4LDcgKzI4OSw3IEBAIHN0YXRpYyB2b2lkIGFz
cGVlZF90aW1lcl9jdHJsX2VuYWJsZShBc3BlZWRUaW1lciAqdCwgYm9vbCBlbmFibGUpCj4gwqDC
oMKgwqDCoHRyYWNlX2FzcGVlZF90aW1lcl9jdHJsX2VuYWJsZSh0LT5pZCwgZW5hYmxlKTsKPiDC
oMKgwqDCoMKgaWYgKGVuYWJsZSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoHQtPnN0YXJ0ID0gcWVt
dV9jbG9ja19nZXRfbnMoUUVNVV9DTE9DS19WSVJUVUFMKTsKPiAtwqDCoMKgwqDCoMKgwqDCoHRp
bWVyX21vZCgmdC0+dGltZXIsIGNhbGN1bGF0ZV9uZXh0KHQpKTsKPiArwqDCoMKgwqDCoMKgwqDC
oGFzcGVlZF90aW1lcl9tb2QodCk7Cj4gwqDCoMKgwqDCoH0gZWxzZSB7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgdGltZXJfZGVsKCZ0LT50aW1lcik7Cj4gwqDCoMKgwqDCoH0KClJldmlld2VkLWJ5OiBB
bmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pg==


--=-82dWZunQWbGaf3i9I6cf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZOgdlAAoJEJ0dnzgO5LT5qvwP/RkBNLcwYbOIjiEGOfeWLaxC
9NTZ+oX06bX4FCG+YD1FqGoEQS5EVoMXgn1rS1GWbrm3EB3r+9vKQjgGVKWZwgOI
kb2cIqKEabGdL26XnqrSc6mgdEYVVL2WAZef3ZWReQ8ewkhIwnMnQMd1E19PqI71
j7VzkvQ5y06F4GRSWJTzw5GgbO/iNfl51iqZkgJJ1qYOln8idHc13fW3pKVaLfI4
Jd9xXH/Ag5bTqyshUsVBIWM9TFxECvG4JDPM7GPVMf2hzo8A7uC7KrNjdlKQvNZ6
dyalWHeSlSN8Pxe6yMiK12O2t63pNrb1I6BDO7ZgPIaeWFVHv47R1ujSJZFGn40x
YqPut3eDqF2k3uEbbhDrCgX5y9lxqW3C54YzCEBWPnwWDuUjsPszd2kDp9VWLEjd
9J3Ac8VLKCZPq4WEqnrt2d8KU2Rb8tyV/pIpnKjZL8SWPJ6fSz4ozOcDKot4i4aj
5SS7LbeqDOfnDJS5CP4zBNdO1o8g908zAqDgmCJxqbbY5FUKu+RrIV5jo8LZBwTj
mQg/u6yXKdvJ6hCVceq0PizTflqLUrFn8BLPu0uE0YeSeqamdKJ89StaMNyCSJbb
kbHjl59nuGzrV5TbcySlT6pH/imZnTACqODHloR3S55IYcjyxc8b5pLedfq66ZXG
fTV2xEnUoI8QeP55XLLj
=FdrJ
-----END PGP SIGNATURE-----

--=-82dWZunQWbGaf3i9I6cf--

