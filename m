Received: by 10.80.163.71 with SMTP id 65csp1008789edn;
        Mon, 12 Sep 2016 19:43:01 -0700 (PDT)
X-Received: by 10.55.31.85 with SMTP id f82mr24855685qkf.213.1473734581056;
        Mon, 12 Sep 2016 19:43:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q19si13690466qke.132.2016.09.12.19.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Sep 2016 19:43:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bjdga-000304-Kn
	for alex.bennee@linaro.org; Mon, 12 Sep 2016 22:43:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bjdgV-0002zl-Mx
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 22:42:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bjdgS-0007PW-FC
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 22:42:55 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60555)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bjdgQ-0007M7-2h; Mon, 12 Sep 2016 22:42:52 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 2C51820996;
	Mon, 12 Sep 2016 22:42:35 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Mon, 12 Sep 2016 22:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=5fYfm
	l9QF864YfLfP1rt9t7MJlw=; b=hsGidJ8OKMdlwZ1uR1f3yyzlWT0rED3fkLyA2
	1wut4w/E80NXC1JQ0pI6yTc430baP51jeebT7y0aULy8AE16UyEWGLZR6KKHdXnl
	rDJWtc2/gWDDJxV4DYsCIERbOrKWIjL4SOVT2pDVnqJ/yAca3GVKCg8z4DJeTYYK
	L4/xDU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=5fYfml9QF864YfLfP1rt9t7MJlw=; b=PGb35
	skT6HUPmWWN0HdWaLqUAFBQ/WL07a5jGSmhjaYsaKdbTL+fSyJd1lmpou2orQNL/
	IU2lVncBLJQPsoYr4SJkAGn4iHjvCpSIjc/UlpQMTRh2KYbWqs9Jd5KqQjWBB18u
	HlPzWMIYLi678jWDuu9Yo2kIokW+VbhCBnNnvQ=
X-Sasl-enc: +ybdw6WfZ+ItOOACdC0IkpPr0syuSi7MlM53CNHluCc7 1473734554
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1E07CF29CD;
	Mon, 12 Sep 2016 22:42:32 -0400 (EDT)
Message-ID: <1473734540.10397.46.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Tue, 13 Sep 2016 12:12:20 +0930
In-Reply-To: <1473438177-26079-12-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
	<1473438177-26079-12-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-SkvGnmXf3juE2Va6ireO"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH v5 11/14] aspeed: calculate the RAM size bits
 at realize time
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
X-TUID: e9QzST87bgNN


--=-SkvGnmXf3juE2Va6ireO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE2LTA5LTA5IGF0IDE4OjIyICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBUaGVyZSBpcyBubyBuZWVkIHRvIGRvIHRoaXMgYXQgZWFjaCByZXNldCBhcyB0aGUgUkFN
IHNpemUgd2lsbCBub3QKPiBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBH
b2F0ZXIgPGNsZ0BrYW9kLm9yZz4KClJldmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3
QGFqLmlkLmF1PgoKPiAtLS0KPiDCoGh3L21pc2MvYXNwZWVkX3NkbWMuY8KgwqDCoMKgwqDCoMKg
wqDCoHwgMTYgKysrKysrKysrKysrKystLQo+IMKgaW5jbHVkZS9ody9taXNjL2FzcGVlZF9zZG1j
LmggfMKgwqAxICsKPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvbWlzYy9hc3BlZWRfc2RtYy5jIGIvaHcvbWlz
Yy9hc3BlZWRfc2RtYy5jCj4gaW5kZXggMjQ0ZTVjMGRjNWVmLi4xZDI4MjUyMzc3MjggMTAwNjQ0
Cj4gLS0tIGEvaHcvbWlzYy9hc3BlZWRfc2RtYy5jCj4gKysrIGIvaHcvbWlzYy9hc3BlZWRfc2Rt
Yy5jCj4gQEAgLTE5Miw3ICsxOTIsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc2RtY19yZXNldChE
ZXZpY2VTdGF0ZSAqZGV2KQo+IMKgwqDCoMKgwqBjYXNlIEFTVDI0MDBfQTBfU0lMSUNPTl9SRVY6
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgcy0+cmVnc1tSX0NPTkZdIHw9Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBBU1BFRURfU0RNQ19WR0FfQ09NUEFUIHwKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgQVNQRUVEX1NETUNfRFJBTV9TSVpFKGFzdDI0MDBfcmFtYml0cygpKTsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgQVNQRUVEX1NETUNfRFJBTV9TSVpFKHMtPnJhbV9iaXRzKTsKPiDC
oMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiDCoAo+IMKgwqDCoMKgwqBjYXNlIEFTVDI1MDBfQTBf
U0lMSUNPTl9SRVY6Cj4gQEAgLTIwMCw3ICsyMDAsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc2Rt
Y19yZXNldChEZXZpY2VTdGF0ZSAqZGV2KQo+IMKgwqDCoMKgwqDCoMKgwqDCoHMtPnJlZ3NbUl9D
T05GXSB8PQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQVNQRUVEX1NETUNfSFdfVkVSU0lP
TigxKSB8Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBBU1BFRURfU0RNQ19WR0FfQVBFUlRV
UkUoQVNQRUVEX1NETUNfVkdBXzY0TUIpIHwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQVNQ
RUVEX1NETUNfRFJBTV9TSVpFKGFzdDI1MDBfcmFtYml0cygpKTsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgQVNQRUVEX1NETUNfRFJBTV9TSVpFKHMtPnJhbV9iaXRzKTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqBicmVhazsKPiDCoAo+IMKgwqDCoMKgwqBkZWZhdWx0Ogo+IEBAIC0yMTksNiArMjE5
LDE4IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9zZG1jX3JlYWxpemUoRGV2aWNlU3RhdGUgKmRldiwg
RXJyb3IgKiplcnJwKQo+IMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiDCoMKgwqDCoMKgfQo+
IMKgCj4gK8KgwqDCoMKgc3dpdGNoIChzLT5zaWxpY29uX3Jldikgewo+ICvCoMKgwqDCoGNhc2Ug
QVNUMjQwMF9BMF9TSUxJQ09OX1JFVjoKPiArwqDCoMKgwqDCoMKgwqDCoHMtPnJhbV9iaXRzID0g
YXN0MjQwMF9yYW1iaXRzKCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqBicmVhazsKPiArwqDCoMKgwqBj
YXNlIEFTVDI1MDBfQTBfU0lMSUNPTl9SRVY6Cj4gK8KgwqDCoMKgY2FzZSBBU1QyNTAwX0ExX1NJ
TElDT05fUkVWOgo+ICvCoMKgwqDCoMKgwqDCoMKgcy0+cmFtX2JpdHMgPSBhc3QyNTAwX3JhbWJp
dHMoKTsKPiArwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ICvCoMKgwqDCoGRlZmF1bHQ6Cj4gK8Kg
wqDCoMKgwqDCoMKgwqBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpOwo+ICvCoMKgwqDCoH0KPiArCj4g
wqDCoMKgwqDCoG1lbW9yeV9yZWdpb25faW5pdF9pbygmcy0+aW9tZW0sIE9CSkVDVChzKSwgJmFz
cGVlZF9zZG1jX29wcywgcywKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBUWVBFX0FTUEVFRF9TRE1DLCAweDEwMDApOwo+IMKgwqDCoMKgwqBz
eXNidXNfaW5pdF9tbWlvKHNiZCwgJnMtPmlvbWVtKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9o
dy9taXNjL2FzcGVlZF9zZG1jLmggYi9pbmNsdWRlL2h3L21pc2MvYXNwZWVkX3NkbWMuaAo+IGlu
ZGV4IDdlMDgxZjZkMmI4Ni4uZGY3ZGNlMGVkZGRmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvaHcv
bWlzYy9hc3BlZWRfc2RtYy5oCj4gKysrIGIvaW5jbHVkZS9ody9taXNjL2FzcGVlZF9zZG1jLmgK
PiBAQCAtMjUsNiArMjUsNyBAQCB0eXBlZGVmIHN0cnVjdCBBc3BlZWRTRE1DU3RhdGUgewo+IMKg
Cj4gwqDCoMKgwqDCoHVpbnQzMl90IHJlZ3NbQVNQRUVEX1NETUNfTlJfUkVHU107Cj4gwqDCoMKg
wqDCoHVpbnQzMl90IHNpbGljb25fcmV2Owo+ICvCoMKgwqDCoHVpbnQzMl90IHJhbV9iaXRzOwo+
IMKgCj4gwqB9IEFzcGVlZFNETUNTdGF0ZTsKPiDCoA==


--=-SkvGnmXf3juE2Va6ireO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX12eMAAoJEJ0dnzgO5LT5J8QQALRSH9PFG2nA2erj4z4LQ79V
qTi700xtoMNw7TJlGFuYfBTeLoi6GdTFPEmKxpDTpGwMNjHLMvUcTo0NWbv39Bvk
UYA3dH/ihnDg4uLlCpdLkx2HVgTzkeAqk1Ap0kNkPfQe1Ounhvl69fJq4dO2Qtmw
/jlgInilDQeTGLJK2wxhh1iD4trV+i2kxK/ierzQn411IQbYn/yhaFP3tHqbPtVK
RwC3gEzn4aBFv6LHEYgQX1D2UL+2N6nRhUJETnUt4+ggzONhxArFDW7abDKj3TYE
yTKLajH2pdm0+36YaB35mwCEntVpL/a3cI9a1l2Tu1WbY/Ty3w9rb3aemBKVv75c
wnhXGfSM/bf4yV8GyiOi3Jx472mqpCtxMUn9VDMYUHUxGig2xxV7uwxiQBhmfxSz
zpH6dIfwHi0bfhB+L4Ardy7aTcx8NB/vQVwGKVZSi0ItTADJJv49reCfnvonRG4G
nMeVZ8EGpApUX3tSehvvG/17GJsi4oaI4XmOdn+66A3kd+k24SyBpl0oXvqrsuzL
mQXUTbzf6BWTHmpL02n5Dm1TocT233qxDz/9YupdenonQENBoh1L23v19n+pTAUY
8g72FL60i+aIFHBPx7TCizMBxb/dKBQokjoXdDFUfWyj+kWHYjPjM0rb5IZqukXf
Y4+3XKC3LUvSbFoARSay
=sPdg
-----END PGP SIGNATURE-----

--=-SkvGnmXf3juE2Va6ireO--

