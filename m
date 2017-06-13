Received: by 10.25.0.23 with SMTP id 23csp144466lfa;
        Mon, 12 Jun 2017 21:38:21 -0700 (PDT)
X-Received: by 10.237.40.35 with SMTP id r32mr40109797qtd.105.1497328701815;
        Mon, 12 Jun 2017 21:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497328701; cv=none;
        d=google.com; s=arc-20160816;
        b=kqD7moZKzzzerV5uhCN2fsxVb2aTd5WhyGgXnph5RbUzqcCI6TjT4+XDzkWdl6fWtl
         ew8+oKRB8bgoucEFJl0VTSio6R8wxbx+g+WDDbazaGxOczGJXdFSKClGYjE5nV4Od4lm
         v3npF7UKP17jIgz5mmKIxVnx+JQ4iEqmlXw6eWRnw1l9RA1WCC/yWZsPb3T5pljIaQwF
         1l69DjuWgQsgoNBHIgh9Pe9YGXVBWq7kdxy8Lmromz2GQIp35J9n16b4XV75t8sRcojD
         GmSv9AtinPs8Ss+6uLquNXOpfC8gDEYhOWo17VUqNOuxk/mQ8tq7qAewrE2+P/FoDVqL
         q5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=3XUW4UEmVS1ZD9VelN1pNXmVfqY9A/mf6Gs/M/TthLs=;
        b=Ub4zF46qYe7Oi9h09QgUZlu9dK5IBEYghSYuDlybSutFOzj7PpKURVu1aHk1JRrA0N
         s/LoNVKBYJACVUfAX4K4GMpfyC4EsJm3Kf4QkMCYVvXTBfGREb7CUoApD4tS68sSMw03
         4DSVwAD25ZFb5nMIJp+leAqkcXZPJBCRwK5h3cAusR/CxaRfwRUqP/gVjg5KGVubxeYc
         6T0aOvlfTNGQfO86goFiqlSqM+gUECVqPUaWnZwNia3pf74wK6kotYSh1I9o95xrtqH9
         1DlIhfJ1OGt6hFS9s4OiO3bXop6WkUl/iZPY/Ne+94KUdNg2DhQR3rphQGa75C3wCdmC
         l0og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e16si10634842qtc.87.2017.06.12.21.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Jun 2017 21:38:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKdat-0005kG-7d
	for alex.bennee@linaro.org; Tue, 13 Jun 2017 00:38:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dKdan-0005jY-9D
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 00:38:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dKdai-0001Qj-AJ
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 00:38:13 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44643)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dKdah-0001KR-7X; Tue, 13 Jun 2017 00:38:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C9D5B20843;
	Tue, 13 Jun 2017 00:38:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Tue, 13 Jun 2017 00:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=3XUW4UEmVS1ZD9VelN1pNXmVfqY9A/mf6Gs/M/Tth
	Ls=; b=glpegdf7GKrah3BGJL6SwnNa1Dq3Py3i06ovkcgxxlr6Emamu08CFhRmR
	SXVN9Ep39lmWJTrCGxyztpYL5fb7PYXUyigWZDqKk5WhWnsOmd4zQ41PdqeZ0q5i
	trVOcyFxLyv7U5q5aVLHn8oDALpsdL9p/QcyN4hvyOqWUutg1csHlsHNPsUBfVc4
	V4znUcYF50i+rC6a5Bkiv6Cd5b7VL3iy0rzuuWk0oq5u77qsmHxDQj3DzOvMy1Bj
	4eHu9ul+q21zQykxxep0PMmlANsGa5ZPg/gDNjPy7Oir/QrllWYB+Eh56NjkTuIC
	njfsUy5UhFCfK+gYp10jz2LEW4XgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=3XUW4UEmVS1ZD9VelN
	1pNXmVfqY9A/mf6Gs/M/TthLs=; b=qqbPeoZvoZkPm3x+f3NpMD/nBPKNd8cnf4
	tpxChy94B/uPlYnJhlv876/BDCbtzg905BIEEHTzSDo7jwRKVs/LQItbtRcWRWhS
	YWNhepo13MIIqpCpG3TgAhdhFUTocCSmh0H8ffhop0wnQ3Eb2i82/QmyQOl4Ioqv
	juKeBlmGuVx3IhPvwdmGXABVvTb/Lq0SAZSTGUdtIgSRZWiGNkx+XT4qp9Fgd3Li
	1CYoknS3HHY70wHTSAVYFDuSl3QQfLUJU8GSA6Yt9bZ4gMmCucetpBd/lRSCdYa/
	FxTWzDSRVl7/GlUt356R8lCRsZfyfT6Vk9GTKqNXhoudqu48+HcQ==
X-ME-Sender: <xms:LGw_WdTwAqYGXyKlpLMklyLwcTwuGSV_ttrH6PpjjGJFLyx6Db4BNQ>
X-Sasl-enc: VNCS54dWtPZs+/t/Izd7xC4Zn3cbR3tcPNqYdL7qzL3Z 1497328683
Received: from keelia (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id B8C407E96F;
	Tue, 13 Jun 2017 00:38:02 -0400 (EDT)
Message-ID: <1497328676.11158.1.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Tue, 13 Jun 2017 14:07:56 +0930
In-Reply-To: <bc98777b-e99d-3b55-3904-8f752a350b6c@kaod.org>
References: <1496739312-32304-1-git-send-email-clg@kaod.org>
	<1496975205.23335.9.camel@aj.id.au>
	<bc98777b-e99d-3b55-3904-8f752a350b6c@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-QV+O+a46wFWmkOwNTRAe"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
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
X-TUID: 83mbLRZGstNg


--=-QV+O+a46wFWmkOwNTRAe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE3LTA2LTA5IGF0IDA3OjQwICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBPbiAwNi8wOS8yMDE3IDA0OjI2IEFNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToKPiA+IE9u
IFR1ZSwgMjAxNy0wNi0wNiBhdCAxMDo1NSArMDIwMCwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6
Cj4gPiA+IFdoZW4gYSB0aW1lciBpcyBlbmFibGVkIGJlZm9yZSBhIHJlbG9hZCB2YWx1ZSBpcyBz
ZXQsIHRoZSBjb250cm9sbGVyCj4gPiA+IHdhaXRzIGZvciBhIHJlbG9hZCB2YWx1ZSB0byBiZSBz
ZXQgYmVmb3JlIHN0YXJ0aW5nIGRlY3JlbWVudGluZy4gVGhpcwo+ID4gPiBmaXggdHJpZXMgdG8g
Y292ZXIgdGhhdCBjYXNlIGJ5IGNoYW5naW5nIHRoZSB0aW1lciBleHBpcnkgb25seSB3aGVuCj4g
PiA+IGEgcmVsb2FkIHZhbHVlIGlzIHZhbGlkLgo+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgo+ID4gPiAKPiA+ID4gLS0tCj4gPiA+
IMKgaHcvdGltZXIvYXNwZWVkX3RpbWVyLmMgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvaHcvdGltZXIvYXNwZWVkX3Rp
bWVyLmMgYi9ody90aW1lci9hc3BlZWRfdGltZXIuYwo+ID4gPiBpbmRleCA5YjcwZWUwOWIwN2Yu
LjUwYWNiZjUzMGEzYSAxMDA2NDQKPiA+ID4gLS0tIGEvaHcvdGltZXIvYXNwZWVkX3RpbWVyLmMK
PiA+ID4gKysrIGIvaHcvdGltZXIvYXNwZWVkX3RpbWVyLmMKPiA+ID4gQEAgLTEzMCwxNSArMTMw
LDI2IEBAIHN0YXRpYyB1aW50NjRfdCBjYWxjdWxhdGVfbmV4dChzdHJ1Y3QgQXNwZWVkVGltZXIg
KnQpCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbmV4dCA9IHNlcVsxXTsKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIGlmIChub3cgPCBzZXFbMl0pIHsKPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBuZXh0ID0gc2VxWzJdOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqDC
oH0gZWxzZSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIGlmICh0LT5yZWxvYWQpIHsK
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWxvYWRfbnMgPSBtdWxkaXY2NCh0LT5y
ZWxvYWQsIE5BTk9TRUNPTkRTX1BFUl9TRUNPTkQsIHJhdGUpOwo+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHQtPnN0YXJ0ID0gbm93IC0gKChub3cgLSB0LT5zdGFydCkgJSByZWxvYWRf
bnMpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoH0gZWxzZSB7Cj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAvKiBubyByZWxvYWQgdmFsdWUsIHJldHVybiAwICovCj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiDC
oMKgwqDCoMKgfQo+ID4gPiDCoAo+ID4gPiDCoMKgwqDCoMKgcmV0dXJuIG5leHQ7Cj4gPiA+IMKg
fQo+ID4gPiDCoAo+ID4gPiArc3RhdGljIHZvaWQgYXNwZWVkX3RpbWVyX21vZChBc3BlZWRUaW1l
ciAqdCkKPiA+ID4gK3sKPiA+ID4gK8KgwqDCoMKgdWludDY0X3QgbmV4dCA9IGNhbGN1bGF0ZV9u
ZXh0KHQpOwo+ID4gPiArwqDCoMKgwqBpZiAobmV4dCkgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oHRpbWVyX21vZCgmdC0+dGltZXIsIG5leHQpOwo+ID4gPiArwqDCoMKgwqB9Cj4gPiA+ICt9Cj4g
PiA+ICsKPiA+ID4gwqBzdGF0aWMgdm9pZCBhc3BlZWRfdGltZXJfZXhwaXJlKHZvaWQgKm9wYXF1
ZSkKPiA+ID4gwqB7Cj4gPiA+IMKgwqDCoMKgwqBBc3BlZWRUaW1lciAqdCA9IG9wYXF1ZTsKPiA+
ID4gQEAgLTE2NCw3ICsxNzUsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfdGltZXJfZXhwaXJlKHZv
aWQgKm9wYXF1ZSkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgcWVtdV9zZXRfaXJxKHQtPmlycSwg
dC0+bGV2ZWwpOwo+ID4gPiDCoMKgwqDCoMKgfQo+ID4gPiDCoAo+ID4gPiAtwqDCoMKgwqB0aW1l
cl9tb2QoJnQtPnRpbWVyLCBjYWxjdWxhdGVfbmV4dCh0KSk7Cj4gPiA+ICvCoMKgwqDCoGFzcGVl
ZF90aW1lcl9tb2QodCk7Cj4gPiA+IMKgfQo+ID4gPiDCoAo+ID4gPiDCoHN0YXRpYyB1aW50NjRf
dCBhc3BlZWRfdGltZXJfZ2V0X3ZhbHVlKEFzcGVlZFRpbWVyICp0LCBpbnQgcmVnKQo+ID4gPiBA
QCAtMjI3LDEwICsyMzgsMjMgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3RpbWVyX3NldF92YWx1ZShB
c3BlZWRUaW1lckN0cmxTdGF0ZSAqcywgaW50IHRpbWVyLCBpbnQgcmVnLAo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB1aW50MzJfdCB2YWx1ZSkKPiA+ID4gwqB7Cj4gPiA+IMKgwqDCoMKgwqBBc3BlZWRU
aW1lciAqdDsKPiA+ID4gK8KgwqDCoMKgdWludDMyX3Qgb2xkX3JlbG9hZDsKPiA+ID4gwqAKPiA+
ID4gwqDCoMKgwqDCoHRyYWNlX2FzcGVlZF90aW1lcl9zZXRfdmFsdWUodGltZXIsIHJlZywgdmFs
dWUpOwo+ID4gPiDCoMKgwqDCoMKgdCA9ICZzLT50aW1lcnNbdGltZXJdOwo+ID4gPiDCoMKgwqDC
oMKgc3dpdGNoIChyZWcpIHsKPiA+ID4gK8KgwqDCoMKgY2FzZSBUSU1FUl9SRUdfUkVMT0FEOgo+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoG9sZF9yZWxvYWQgPSB0LT5yZWxvYWQ7Cj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgdC0+cmVsb2FkID0gdmFsdWU7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqAvKiBJZiB0aGUgcmVsb2FkIHZhbHVlIHdhcyBub3QgcHJldmlvdXNseSBzZXQsIG9yIHpl
cm8sIGFuZAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgKiB0aGUgY3VycmVudCB2YWx1ZSBpcyB2
YWxpZCwgdHJ5IHRvIHN0YXJ0IHRoZSB0aW1lciBpZiBpdCBpcwo+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgKiBlbmFibGVkLgo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgKi8KPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqBpZiAob2xkX3JlbG9hZCB8fCAhdC0+cmVsb2FkKSB7Cj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqB9Cj4gPiAKPiA+
IE1heWJlIEkgbmVlZCBtb3JlIGNhZmZlaW5lLCBidXQgSSBpbml0aWFsbHkgc3RydWdnbGVkIHRv
IHJlY29uY2lsZSB0aGUKPiA+IGNvbmRpdGlvbiB3aXRoIHRoZSBjb21tZW50LCBhcyB0aGUgY29u
ZGl0aW9uIGNoZWNrcyB0aGUgaW52ZXJzZSBpbgo+ID4gb3JkZXIgdG8gYnJlYWsgd2hpbGUgdGhl
IGNvbW1lbnQgZGlzY3Vzc2VzIHRoZSBub24tYnJlYWtpbmcgY2FzZS7CoAo+IAo+IEkgYWdyZWUu
IFRoZSByZWxvYWQgInZhbHVlIiBpcyB1c2VkIGluIGEgaGlkZGVuIHdheSB0byB0aGUgYWN0aXZh
dGUgdGhlwqAKPiB0aW1lci4KPiAKPiA+IEhvd2V2ZXIsIGFmdGVyIHRyeWluZyBmb3Igc2V2ZXJh
bCBtaW51dGVzLCBJJ20gbm90IHN1cmUgdGhlcmUncyBhbiBlYXN5Cj4gPiB3YXkgdG8gaW1wcm92
ZSBpdC4KPiAKPiBJIHRyaWVkIGEgZmV3IHRoaW5ncy4gTWF5IGJlLCB3ZSBjb3VsZCBtb3ZlIHRo
ZSBmb2xsb3dpbmcgY29kZSBpbsKgCj4gaXRzIG93biByb3V0aW5lIGFuZCBjYWxsIGl0IHR3aWNl
ID/CoAoKSSBkb24ndCB0aGluayBpdCdzIG5lY2Vzc2FyeS4gVGhlIGNvbW1lbnQgc2VydmVzIGFz
IGVub3VnaCB3YXJuaW5nIC0gaXQKc2hvdWxkIGF0IGxlYXN0IG1ha2UgcGVvcGxlIHRoaW5rIGJl
Zm9yZSBtb2RpZnlpbmcgdGhlIGNvZGUuCgpDaGVlcnMsCgpBbmRyZXcKCj4gwqAKPiA+ID4gKwo+
ID4gPiDCoMKgwqDCoMKgY2FzZSBUSU1FUl9SRUdfU1RBVFVTOgo+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqBpZiAodGltZXJfZW5hYmxlZCh0KSkgewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHVpbnQ2NF90IG5vdyA9IHFlbXVfY2xvY2tfZ2V0X25zKFFFTVVfQ0xPQ0tfVklSVFVBTCk7
Cj4gPiA+IEBAIC0yMzgsMTcgKzI2MiwxNCBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfdGltZXJfc2V0
X3ZhbHVlKEFzcGVlZFRpbWVyQ3RybFN0YXRlICpzLCBpbnQgdGltZXIsIGludCByZWcsCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdWludDMyX3QgcmF0ZSA9IGNhbGN1bGF0ZV9yYXRl
KHQpOwo+ID4gPiDCoAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHQtPnN0YXJ0ICs9
IG11bGRpdjY0KGRlbHRhLCBOQU5PU0VDT05EU19QRVJfU0VDT05ELCByYXRlKTsKPiA+ID4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRpbWVyX21vZCgmdC0+dGltZXIsIGNhbGN1bGF0ZV9uZXh0
KHQpKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFzcGVlZF90aW1lcl9tb2QodCk7
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7
Cj4gPiA+IC3CoMKgwqDCoGNhc2UgVElNRVJfUkVHX1JFTE9BRDoKPiA+ID4gLcKgwqDCoMKgwqDC
oMKgwqB0LT5yZWxvYWQgPSB2YWx1ZTsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+
ID4gwqDCoMKgwqDCoGNhc2UgVElNRVJfUkVHX01BVENIX0ZJUlNUOgo+ID4gPiDCoMKgwqDCoMKg
Y2FzZSBUSU1FUl9SRUdfTUFUQ0hfU0VDT05EOgo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqB0LT5t
YXRjaFtyZWcgLSAyXSA9IHZhbHVlOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBpZiAodGltZXJf
ZW5hYmxlZCh0KSkgewo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdGltZXJfbW9kKCZ0
LT50aW1lciwgY2FsY3VsYXRlX25leHQodCkpOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgYXNwZWVkX3RpbWVyX21vZCh0KTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+ID4gwqDCoMKgwqDCoGRlZmF1bHQ6Cj4gPiA+IEBA
IC0yNjgsNyArMjg5LDcgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3RpbWVyX2N0cmxfZW5hYmxlKEFz
cGVlZFRpbWVyICp0LCBib29sIGVuYWJsZSkKPiA+ID4gwqDCoMKgwqDCoHRyYWNlX2FzcGVlZF90
aW1lcl9jdHJsX2VuYWJsZSh0LT5pZCwgZW5hYmxlKTsKPiA+ID4gwqDCoMKgwqDCoGlmIChlbmFi
bGUpIHsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgdC0+c3RhcnQgPSBxZW11X2Nsb2NrX2dldF9u
cyhRRU1VX0NMT0NLX1ZJUlRVQUwpOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoHRpbWVyX21vZCgm
dC0+dGltZXIsIGNhbGN1bGF0ZV9uZXh0KHQpKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqBhc3Bl
ZWRfdGltZXJfbW9kKHQpOwo+ID4gPiDCoMKgwqDCoMKgfSBlbHNlIHsKPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgdGltZXJfZGVsKCZ0LT50aW1lcik7Cj4gPiA+IMKgwqDCoMKgwqB9Cj4gPiAKPiA+
IFJldmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pgo+IAo+IFRoYW5r
cywKPiAKPiBDLg==


--=-QV+O+a46wFWmkOwNTRAe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZP2wlAAoJEJ0dnzgO5LT5QY8P/2cuwzNPLb9RbzZ+i+BIjk0n
eoiHTIUdlQs6QJDJ8WeiK2YOtxeyn7eZcGolKi2MzRY7avgjJmq8FMJ68pc9mNdH
rEXqgWoMaTNbzKTDPXWZ27jbGG2GrHw8YupefbH9TO5xOQFgqSsIS0Jt24TB9pgl
NkVg5mbawWxd9/nBtsjGTlBQNvZzPMYiA7PLu3fDRVp8L2dE+pxSSvpE02/zPV/d
ByPP/cg0ZYoUhboVl5Yk3n7Bnb0EpsppdEJzi/jU1lv1vXTcuJgDAdtDMK2VgK2n
vlzkQmBUyGoIutULMvs/n6WQU6IWJUw5LQFKG5xa600VwJD3kctfL5qwZoKFKckf
cZZ+Fz8MV4BtXyvuNnBsLzzN3Iz6BW4k5s9H0WBfAM6MLSdO+w0XwXcJtJIo87Nj
/Nq7n5RFBMTazoJ9a9h1zShv2zzO19mOpCKf7XTAQ+hwCTA0dtv+IrnDumsqmb45
4nnifO5PPfQaT18RtSKPN1cbKUQu5HmWvXIEINdcva0CpoLHB1Iq68RBVoktbmq0
PyWFyZlcWeGB4Pp/rwbGibgzsneMwIm7MQNbdVZcum288V2NFwcadeOlXXrCRsp2
q7od0JmOcXxRUq1nDkFZ5O+V5LkE0qvgH0lKOVyw2LcDiOuLBacWWQgx0fQV5twT
7+4uHW9Ds+o7jQKS4qT1
=dgXJ
-----END PGP SIGNATURE-----

--=-QV+O+a46wFWmkOwNTRAe--

