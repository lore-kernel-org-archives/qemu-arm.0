Received: by 10.80.163.71 with SMTP id 65csp1010004edn;
        Mon, 12 Sep 2016 19:51:23 -0700 (PDT)
X-Received: by 10.200.54.13 with SMTP id m13mr24352977qtb.85.1473735083305;
        Mon, 12 Sep 2016 19:51:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s185si13739909qke.185.2016.09.12.19.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Sep 2016 19:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bjdoL-0004QX-VW
	for alex.bennee@linaro.org; Mon, 12 Sep 2016 22:51:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bjdoI-0004QS-6H
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 22:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bjdoE-00021z-VU
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 22:50:58 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34060)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bjdoC-0001yI-M9; Mon, 12 Sep 2016 22:50:54 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 9AF902079F;
	Mon, 12 Sep 2016 22:50:36 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Mon, 12 Sep 2016 22:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=oouoA
	AGPN1RZ+xCtiLW9WImiUD8=; b=ZRTNKp7q/t+Safsx/tQ1mqhQevW8Nev9QAuJ0
	n9DaYSceB/G//29SSStFHPfSnyjtIjxMOEMbZfJwyawetjl4kcM6pvnb9RNRCN20
	c8aY+5H9FZo3B78EwNbfJtvVWi3WAxY8KQn7SWAkz9bcTqqUBV+Vh4FA+rCkg7Uu
	Erq+io=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=oouoAAGPN1RZ+xCtiLW9WImiUD8=; b=nDojj
	wZantImIFoSpmQqKMixOoUHNH9Ej40tR6aVORoZ0mGRIjWOaMsFapKkcaXDtKW2c
	LeCWBQAYmJRMnw7iMD9ce0/5HVr9QXRGcurY80PX/W0pG+08Up5HYmw9Ifz7Xda1
	uVT+CFevvz2xf9IEwzFWYMpARMB2lJfrAE6W0o=
X-Sasl-enc: EXZcFW9mpWTgayPZUF2GwAtMnKgVdUgaFN2VNFQu8DC2 1473735035
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 61326CCE75;
	Mon, 12 Sep 2016 22:50:34 -0400 (EDT)
Message-ID: <1473735030.10397.52.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Tue, 13 Sep 2016 12:20:30 +0930
In-Reply-To: <1473438177-26079-13-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
	<1473438177-26079-13-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-9GdD64+6rBTN9X47tRGD"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH v5 12/14] aspeed: use error_report instead of
 LOG_GUEST_ERROR
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
X-TUID: NBzwk5RkZAKc


--=-9GdD64+6rBTN9X47tRGD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE2LTA5LTA5IGF0IDE4OjIyICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBBbHNvIGNoYW5nZSB0aGUgZGVmYXVsdCB2YWx1ZSB1c2VkIGluIGNhc2Ugb2YgYW4gZXJy
b3IuIFRoZSBtaW5pbXVtCj4gc2l6ZSBpcyBhIGJpdCBzZXZlcmUsIHNvIGxldCdzIGp1c3QgdXNl
IGFuIGF2ZXJhZ2UgUkFNIHNpemUuCgpJJ20gbm90IHN1cmUgd2Ugc2hvdWxkIGJlIHN3aXRjaGlu
ZyB0aGUgZGVmYXVsdCB2YWx1ZSBpbiB0aGlzIHBhdGNoLApidXQgSSdtIG5vdCBzdXJlIGl0J3Mg
d29ydGggYW55IGVmZm9ydCB0byBzcGxpdCBpdCBvdXQgZWl0aGVyLi4uCgpPdGhlcndpc2UsIGJv
dGggdGhlIGNoYW5nZXMgc2VlbSBzZW5zaWJsZSBlbm91Z2guCgpBbmRyZXcKCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KPiAtLS0KPiDCoGh3L21p
c2MvYXNwZWVkX3NkbWMuYyB8IDE3ICsrKysrKysrKy0tLS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9ody9t
aXNjL2FzcGVlZF9zZG1jLmMgYi9ody9taXNjL2FzcGVlZF9zZG1jLmMKPiBpbmRleCAxZDI4MjUy
Mzc3MjguLjIwYmNkYjUyYzRkZiAxMDA2NDQKPiAtLS0gYS9ody9taXNjL2FzcGVlZF9zZG1jLmMK
PiArKysgYi9ody9taXNjL2FzcGVlZF9zZG1jLmMKPiBAQCAtOSw2ICs5LDcgQEAKPiDCoAo+IMKg
I2luY2x1ZGUgInFlbXUvb3NkZXAuaCIKPiDCoCNpbmNsdWRlICJxZW11L2xvZy5oIgo+ICsjaW5j
bHVkZSAicWVtdS9lcnJvci1yZXBvcnQuaCIKPiDCoCNpbmNsdWRlICJody9taXNjL2FzcGVlZF9z
ZG1jLmgiCj4gwqAjaW5jbHVkZSAiaHcvbWlzYy9hc3BlZWRfc2N1LmgiCj4gwqAjaW5jbHVkZSAi
aHcvcWRldi1wcm9wZXJ0aWVzLmgiCj4gQEAgLTE1MSwxMyArMTUyLDEzIEBAIHN0YXRpYyBpbnQg
YXN0MjQwMF9yYW1iaXRzKHZvaWQpCj4gwqDCoMKgwqDCoGNhc2UgNTEyOgo+IMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiBBU1BFRURfU0RNQ19EUkFNXzUxMk1COwo+IMKgwqDCoMKgwqBkZWZhdWx0
Ogo+IC3CoMKgwqDCoMKgwqDCoMKgcWVtdV9sb2dfbWFzayhMT0dfR1VFU1RfRVJST1IsICIlczog
SW52YWxpZCBSQU0gc2l6ZTogMHgiCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgUkFNX0FERFJfRk1UICJcbiIsIF9fZnVuY19fLCByYW1fc2l6ZSk7Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoH0KPiDCoAo+IC3CoMKgwqDCoC8qIHNl
dCBhIG1pbmltdW0gZGVmYXVsdCAqLwo+IC3CoMKgwqDCoHJldHVybiBBU1BFRURfU0RNQ19EUkFN
XzY0TUI7Cj4gK8KgwqDCoMKgLyogdXNlIGEgY29tbW9uIGRlZmF1bHQgKi8KPiArwqDCoMKgwqBl
cnJvcl9yZXBvcnQoIndhcm5pbmc6IEludmFsaWQgUkFNIHNpemUgMHgiIFJBTV9BRERSX0ZNVAo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIi4gVXNpbmcgZGVmYXVsdCAyNTZN
IiwgcmFtX3NpemUpOwo+ICvCoMKgwqDCoHJldHVybiBBU1BFRURfU0RNQ19EUkFNXzI1Nk1COwo+
IMKgfQo+IMKgCj4gwqBzdGF0aWMgaW50IGFzdDI1MDBfcmFtYml0cyh2b2lkKQo+IEBAIC0xNzIs
MTMgKzE3MywxMyBAQCBzdGF0aWMgaW50IGFzdDI1MDBfcmFtYml0cyh2b2lkKQo+IMKgwqDCoMKg
wqBjYXNlIDEwMjQ6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIEFTUEVFRF9TRE1DX0FTVDI1
MDBfMTAyNE1COwo+IMKgwqDCoMKgwqBkZWZhdWx0Ogo+IC3CoMKgwqDCoMKgwqDCoMKgcWVtdV9s
b2dfbWFzayhMT0dfR1VFU1RfRVJST1IsICIlczogSW52YWxpZCBSQU0gc2l6ZTogMHgiCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUkFNX0FERFJfRk1UICJc
biIsIF9fZnVuY19fLCByYW1fc2l6ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDC
oMKgwqDCoH0KPiDCoAo+IC3CoMKgwqDCoC8qIHNldCBhIG1pbmltdW0gZGVmYXVsdCAqLwo+IC3C
oMKgwqDCoHJldHVybiBBU1BFRURfU0RNQ19BU1QyNTAwXzEyOE1COwo+ICvCoMKgwqDCoC8qIHVz
ZSBhIGNvbW1vbiBkZWZhdWx0ICovCj4gK8KgwqDCoMKgZXJyb3JfcmVwb3J0KCJ3YXJuaW5nOiBJ
bnZhbGlkIFJBTSBzaXplIDB4IiBSQU1fQUREUl9GTVQKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCIuIFVzaW5nIGRlZmF1bHQgNTEyTSIsIHJhbV9zaXplKTsKPiArwqDCoMKg
wqByZXR1cm4gQVNQRUVEX1NETUNfQVNUMjUwMF81MTJNQjsKPiDCoH0KPiDCoAo+IMKgc3RhdGlj
IHZvaWQgYXNwZWVkX3NkbWNfcmVzZXQoRGV2aWNlU3RhdGUgKmRldik=


--=-9GdD64+6rBTN9X47tRGD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX12l2AAoJEJ0dnzgO5LT5+/wP/jtgKr2UBjlAl0j9Cyi5tGj5
+CONfE438dhGP0TH1tropza0WaHFwqikMAzhDbws4pm0Nx+j0/UP9Dy3uRp2MYTe
yjTtT4F6+1Q7X6QZnHP3BiZUfGgkQC6K54Ple82kBmSM/khKWmmi28G5wWlpJxFh
v6Df/UOEyrMViC4FQvnD5fVovqOQD3F3XixWu2xibJbUhBq2I5uDaFGi0YDFgiaS
XVRyM8h3YiCcBhAgo2lG3xTUXMGx9C5GHb/ornfG7LWeXmS7r/wPBdfd5esuLKgv
TC2sbtCBTyps6xr0W3Tedz0+4JDwuzhYs8Lc3FkTCzbMAg1gqiFeZOSIFak1aGt3
abgJUnbAisYzTH8nYDtrqMX3Dg26peskxKM/IBffr64EVL5BNX8MF26c3LRddxJU
Q1EiGRYmG6QhvglQFbBcrBsHxV/0GX2tXYEQd0d2+7amNe/DDgjHVs/f7ZA9la1J
Yt1XIy6DO1/Ig9K3ab1If3h7WT3hfGuB7z7weKJaQFA8nOMACaHzwyTODhmkvB3+
IVLAVdHMSskPvp0AkhfPvAtDKk3eOMD2QwK7lxwjFbwvFmDlFKX5cHWZQgVYnLBD
PnBquxBQnxhqLjdlki6dbsBVodspDYOBWD9/qWxBGxDbRRivR4umS8w2l2qi06xK
AbvFueDhHYb3bbq6g2/2
=a7Sp
-----END PGP SIGNATURE-----

--=-9GdD64+6rBTN9X47tRGD--

