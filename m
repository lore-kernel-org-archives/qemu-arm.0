Received: by 10.25.21.156 with SMTP id 28csp566515lfv;
        Wed, 27 Jul 2016 19:46:13 -0700 (PDT)
X-Received: by 10.55.48.19 with SMTP id w19mr41255382qkw.141.1469673973864;
        Wed, 27 Jul 2016 19:46:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3si6489671qkd.136.2016.07.27.19.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 19:46:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSbKv-0004co-A3
	for alex.bennee@linaro.org; Wed, 27 Jul 2016 22:46:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSbKr-0004cX-9E
	for qemu-arm@nongnu.org; Wed, 27 Jul 2016 22:46:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSbKo-0001W4-4m
	for qemu-arm@nongnu.org; Wed, 27 Jul 2016 22:46:09 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:56935)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bSbKl-0001Rg-RF; Wed, 27 Jul 2016 22:46:06 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 62C9211E5;
	Wed, 27 Jul 2016 22:45:50 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Wed, 27 Jul 2016 22:45:50 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=DQE09
	zWdOwOXgNZHZwxfgd1+m78=; b=Dk6Sj5AbrL+Ftx6CHhNQL5TIQq8MzPiSUyqFZ
	6sG+nhtw1DssXsViKMOxHwuO3NSmQqF36j4mS4i+QqaX3eIml+ddNTOhpNbpoLbu
	QRkT00Zlncjx/C7Jf//0zpzgh9rZQKyQahQqho8k8DrxfSOpSFGWxomPJE8FCmcD
	dwVVXk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=DQE09zWdOwOXgNZHZwxfgd1+m78=; b=Ng8xE
	Ves9nsHxpARNfGnd2W+/oWcAO1GuHHywOMZ1eCwdn0lVzDqCyByufYLJL1viTGmo
	4dQ6wszgKizfjPQnC2jdnpndJiKnC8gQZ5SIw92bTIrSTeVpZ6pzXvQPfjwkHagu
	Q1h5tebORNuxlZZC2GXRus+nP/y5GEuxj96tWw=
X-Sasl-enc: hxGC+Ag78wyNFYyYcyDSGDsO3WpP6hsb406cwLj1muXB 1469673949
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id A55C6CCDB1;
	Wed, 27 Jul 2016 22:45:47 -0400 (EDT)
Message-ID: <1469673943.5468.94.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 12:15:43 +0930
In-Reply-To: <1469638018-17590-5-git-send-email-clg@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-5-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Byuravp6aYz1JatHzP8Y"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: Re: [Qemu-arm] [PATCH 4/6] palmetto-bmc: add board specific
 configuration
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
X-TUID: FgyYARmDhlPL


--=-Byuravp6aYz1JatHzP8Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE2LTA3LTI3IGF0IDE4OjQ2ICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBhc3BlZWRfaW5pdCgpIG5vdyB1c2VzIGEgYm9hcmQgaWRlbnRpZmllciB0byBjdXN0b21p
emUgc29tZSB2YWx1ZXMKPiBzcGVjaWZpYyB0byB0aGUgYm9hcmQsIHJhbSBiYXNlLCBib2FyZCBy
ZXZpc2lvbiBudW1iZXIsIGV0Yy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRl
ciA8Y2xnQGthb2Qub3JnPgoKTG9va3Mgb2theSB0byBtZSwgc29tZSBtaW5vciBjb21tZW50cyBi
ZWxvdzoKCj4gLS0tCj4gwqBody9hcm0vcGFsbWV0dG8tYm1jLmMgfCAzNCArKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL3BhbG1ldHRvLWJtYy5j
IGIvaHcvYXJtL3BhbG1ldHRvLWJtYy5jCj4gaW5kZXggOGEzZmY1NTY4NTc1Li5jZDhhYTU5NzU2
YjkgMTAwNjQ0Cj4gLS0tIGEvaHcvYXJtL3BhbG1ldHRvLWJtYy5jCj4gKysrIGIvaHcvYXJtL3Bh
bG1ldHRvLWJtYy5jCj4gQEAgLTIyLDggKzIyLDYgQEAKPiDCoCNpbmNsdWRlICJzeXNlbXUvYmxv
Y2tkZXYuaCIKPiDCoAo+IMKgc3RhdGljIHN0cnVjdCBhcm1fYm9vdF9pbmZvIGFzcGVlZF9iaW5m
byA9IHsKPiAtwqDCoMKgwqAubG9hZGVyX3N0YXJ0ID0gQVNUMjQwMF9TRFJBTV9CQVNFLAo+IC3C
oMKgwqDCoC5ib2FyZF9pZCA9IDAsCj4gwqDCoMKgwqDCoC5uYl9jcHVzID0gMSwKPiDCoH07Cj4g
wqAKPiBAQCAtMzIsNiArMzAsMjEgQEAgdHlwZWRlZiBzdHJ1Y3QgQXNwZWVkQm9hcmRTdGF0ZSB7
Cj4gwqDCoMKgwqDCoE1lbW9yeVJlZ2lvbiByYW07Cj4gwqB9IEFzcGVlZEJvYXJkU3RhdGU7Cj4g
wqAKPiArdHlwZWRlZiBzdHJ1Y3QgQXNwZWVkQm9hcmRDb25maWcgewo+ICvCoMKgwqDCoHVpbnQz
Ml90IGh3X3N0cmFwMTsKPiArwqDCoMKgwqB1aW50MzJfdCBzaWxpY29uX3JldjsKPiArwqDCoMKg
wqBod2FkZHIgc2RyYW1fYmFzZTsKPiArfSBBc3BlZWRCb2FyZENvbmZpZzsKPiArCj4gK2VudW0g
ewo+ICvCoMKgwqDCoFBBTE1FVFRPX0JNQwo+ICt9Owo+ICsKPiArc3RhdGljIGNvbnN0IEFzcGVl
ZEJvYXJkQ29uZmlnIGFzcGVlZF9ib2FyZHNbXSA9IHsKPiArwqDCoMKgwqBbIFBBTE1FVFRPX0JN
QyBdID0geyAweDEyMENFNDE2LCBBU1QyNDAwX0EwX1NJTElDT05fUkVWLAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEFTVDI0MDBfU0RSQU1fQkFT
RSB9LAoKSSB3YXMgcGxheWluZyBhcm91bmQgYmVmb3JlIGFuZCBteSB0ZXN0IHNjcmlwdHMgbm90
aWNlZCBjaGVja3BhdGNoCmNvbXBsYWluZWQgYWJvdXQgdGhlIHNwYWNpbmcgd2l0aCB0aGUgYXJy
YXkgaW5kZXhpbmc6ICJbUEFMTUVUVE9fQk1DXSIKZml4ZWQgdGhlIGVycm9yLgoKPiArfTsKPiAr
Cj4gwqBzdGF0aWMgdm9pZCBhc3BlZWRfaW5pdF9mbGFzaGVzKEFzcGVlZFNNQ1N0YXRlICpzLCBj
b25zdCBjaGFyICpmbGFzaHR5cGUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRXJyb3IgKiplcnJwKQo+IMKgewo+IEBA
IC01OCw3ICs3MSw3IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9pbml0X2ZsYXNoZXMoQXNwZWVkU01D
U3RhdGUgKnMsIGNvbnN0IGNoYXIgKmZsYXNodHlwZSwKPiDCoMKgwqDCoMKgfQo+IMKgfQo+IMKg
Cj4gLXN0YXRpYyB2b2lkIGFzcGVlZF9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKPiArc3Rh
dGljIHZvaWQgYXNwZWVkX2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lLCBpbnQgYm9hcmRfbW9k
ZWwpCgpJIGZlZWwgbGlrZSB3ZSBzaG91bGQgcGFzcyBhICJzdHJ1Y3QgQXNwZWVkQm9hcmRDb25m
aWcgKiIgcmF0aGVyIHRoYW4KdGhlICJpbnQgYm9hcmRfbW9kZWwiLCBjbGVhbmluZyB1cCB0aGUg
cmVwZWF0ZWQgaW5kZXhpbmcgaW50bwphc3BlZWRfYm9hcmRzIHRoZSBib2R5LiBUaG91Z2h0cz8g
PC9iaWtlc2hlZD4KCkFuZHJldwoKPiDCoHsKPiDCoMKgwqDCoMKgQXNwZWVkQm9hcmRTdGF0ZSAq
Ym1jOwo+IMKgCj4gQEAgLTY4LDEzICs4MSwxNiBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfaW5pdChN
YWNoaW5lU3RhdGUgKm1hY2hpbmUpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmZXJyb3JfYWJvcnQpOwo+IMKgCj4gwqDCoMKg
wqDCoG1lbW9yeV9yZWdpb25fYWxsb2NhdGVfc3lzdGVtX21lbW9yeSgmYm1jLT5yYW0sIE5VTEws
ICJyYW0iLCByYW1fc2l6ZSk7Cj4gLcKgwqDCoMKgbWVtb3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9u
KGdldF9zeXN0ZW1fbWVtb3J5KCksIEFTVDI0MDBfU0RSQU1fQkFTRSwKPiArwqDCoMKgwqBtZW1v
cnlfcmVnaW9uX2FkZF9zdWJyZWdpb24oZ2V0X3N5c3RlbV9tZW1vcnkoKSwKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFz
cGVlZF9ib2FyZHNbYm9hcmRfbW9kZWxdLnNkcmFtX2Jhc2UsCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJmJtYy0+cmFt
KTsKPiDCoMKgwqDCoMKgb2JqZWN0X3Byb3BlcnR5X2FkZF9jb25zdF9saW5rKE9CSkVDVCgmYm1j
LT5zb2MpLCAicmFtIiwgT0JKRUNUKCZibWMtPnJhbSksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJmVycm9y
X2Fib3J0KTsKPiAtwqDCoMKgwqBvYmplY3RfcHJvcGVydHlfc2V0X2ludChPQkpFQ1QoJmJtYy0+
c29jKSwgMHgxMjBDRTQxNiwgImh3LXN0cmFwMSIsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJmVycm9yX2Fib3J0KTsKPiAtwqDCoMKg
wqBvYmplY3RfcHJvcGVydHlfc2V0X2ludChPQkpFQ1QoJmJtYy0+c29jKSwgQVNUMjQwMF9BMF9T
SUxJQ09OX1JFViwKPiArwqDCoMKgwqBvYmplY3RfcHJvcGVydHlfc2V0X2ludChPQkpFQ1QoJmJt
Yy0+c29jKSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBhc3BlZWRfYm9hcmRzW2JvYXJkX21vZGVsXS5od19zdHJhcDEsCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgImh3LXN0
cmFwMSIsICZlcnJvcl9hYm9ydCk7Cj4gK8KgwqDCoMKgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQo
T0JKRUNUKCZibWMtPnNvYyksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgYXNwZWVkX2JvYXJkc1tib2FyZF9tb2RlbF0uc2lsaWNvbl9y
ZXYsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCJzaWxpY29uLXJldiIsICZlcnJvcl9hYm9ydCk7Cj4gwqDCoMKgwqDCoG9iamVjdF9w
cm9wZXJ0eV9zZXRfYm9vbChPQkpFQ1QoJmJtYy0+c29jKSwgdHJ1ZSwgInJlYWxpemVkIiwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAmZXJyb3JfYWJvcnQpOwo+IEBAIC04NiwxMyArMTAyLDE1IEBAIHN0YXRpYyB2b2lkIGFzcGVl
ZF9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKPiDCoMKgwqDCoMKgYXNwZWVkX2JpbmZvLmlu
aXRyZF9maWxlbmFtZSA9IG1hY2hpbmUtPmluaXRyZF9maWxlbmFtZTsKPiDCoMKgwqDCoMKgYXNw
ZWVkX2JpbmZvLmtlcm5lbF9jbWRsaW5lID0gbWFjaGluZS0+a2VybmVsX2NtZGxpbmU7Cj4gwqDC
oMKgwqDCoGFzcGVlZF9iaW5mby5yYW1fc2l6ZSA9IHJhbV9zaXplOwo+ICvCoMKgwqDCoGFzcGVl
ZF9iaW5mby5sb2FkZXJfc3RhcnQgPSBhc3BlZWRfYm9hcmRzW2JvYXJkX21vZGVsXS5zZHJhbV9i
YXNlLAo+ICvCoMKgwqDCoGFzcGVlZF9iaW5mby5ib2FyZF9pZCA9IGFzcGVlZF9ib2FyZHNbYm9h
cmRfbW9kZWxdLnNpbGljb25fcmV2LAo+IMKgwqDCoMKgwqBhcm1fbG9hZF9rZXJuZWwoQVJNX0NQ
VShmaXJzdF9jcHUpLCAmYXNwZWVkX2JpbmZvKTsKPiDCoH0KPiDCoAo+IMKgc3RhdGljIHZvaWQg
cGFsbWV0dG9fYm1jX2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lKQo+IMKgewo+IMKgwqDCoMKg
wqBtYWNoaW5lLT5jcHVfbW9kZWwgPSAiYXJtOTI2IjsKPiAtwqDCoMKgwqBhc3BlZWRfaW5pdCht
YWNoaW5lKTsKPiArwqDCoMKgwqBhc3BlZWRfaW5pdChtYWNoaW5lLCBQQUxNRVRUT19CTUMpOwo+
IMKgfQo+IMKgCj4gwqBzdGF0aWMgdm9pZCBwYWxtZXR0b19ibWNfY2xhc3NfaW5pdChPYmplY3RD
bGFzcyAqb2MsIHZvaWQgKmRhdGEp


--=-Byuravp6aYz1JatHzP8Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmXHXAAoJEJ0dnzgO5LT5huoP/3l3snOEJttY/qOM2pAfMqyz
nFxjVxejj7M1gk9H4qvXXnfM0aVufvR8gA9QXYQRUhvlXLgYKAP/+VkdUCSAP+1i
2WKTdmGVqH6dA2SFZcNYLm2eZrGG0DougmXRs5fCOC186nTFlFU1NKkOODHBArwF
YhpPT5rndfiSsRMGEJUjuCqKef7FVB3+DRLpS1mpoeKvl2cwXufVyaF4UY7VgnuW
4HBZODIJVkkNVjsCNVB+/0Ro36kckYsN4kv329mlXBz0pcEbZxJMhCSN+RhQhUNo
v1RmDJoDJ9S7qYMuK/4E1zAEiSxqZZ/qI7Ga2iN73UjsCRlhdFg9OJpi0e+lSh0T
PCJ4s1yrxqrqePPdBjP1oVzU6vuv3fGUZf3P+xZcyaCEnM2A0P7kDPIgoa1dFUr2
DxpNgxGgUKkIG5G495DKLGT9ocLGbdcuZZF7D4mwmnVGfXFoe+ttMu/O4aAIewiv
zjZUmaPYSBr6FrS5EEcs0Qx1EvHb/J8J6tTiG0tpgEimGX4VZXFLWt0gtZo0pQf2
9MTNQ0KnwJ0sZCCLsqmXWFelDBO3+PMS9PK9CaCgtM0U+82ISQK0sEk3K86ckiBk
yXVkwnHKusBN8dAYh33qoU0pfLfw36M+6ohFb/iKv+w0RbG0hwE2Dd9hdw56QtED
WWQj2tAuBu3YHZf5SNxZ
=0fTO
-----END PGP SIGNATURE-----

--=-Byuravp6aYz1JatHzP8Y--

