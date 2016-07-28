Received: by 10.25.21.156 with SMTP id 28csp569447lfv;
        Wed, 27 Jul 2016 19:57:08 -0700 (PDT)
X-Received: by 10.55.106.195 with SMTP id f186mr39236261qkc.52.1469674628280;
        Wed, 27 Jul 2016 19:57:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h5si6527285qkf.7.2016.07.27.19.57.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 19:57:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSbVT-0001Fm-Bx
	for alex.bennee@linaro.org; Wed, 27 Jul 2016 22:57:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSbVQ-0001FU-2z
	for qemu-arm@nongnu.org; Wed, 27 Jul 2016 22:57:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSbVL-0004f7-O2
	for qemu-arm@nongnu.org; Wed, 27 Jul 2016 22:57:03 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:46616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bSbVJ-0004b7-Ed; Wed, 27 Jul 2016 22:56:59 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 3AF4C1D68;
	Wed, 27 Jul 2016 22:56:45 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Wed, 27 Jul 2016 22:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=/tgrR
	sW7yRSSQ8kk+OZnEzxuijk=; b=a3Y+N3577tlFEhzNyBvSjYnjrhYcznb5IhvMa
	5H67XWzBrgWSQVnmbcHWN6BQYDCy57B9XkszcdhyUJRJ7FxzQ02VKRxmyp72OJMU
	Ynk3zCnv/TrO9CM6mmpemrGPa7v72G41mF3paH6KaMq4RdAdEEVYQqHrZJVh2uAT
	2wumxY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=/tgrRsW7yRSSQ8kk+OZnEzxuijk=; b=NFPIV
	UfDVsVKloU9I3yOT7lh0my+AnvxubrhoBexZqEW3Clo9dyd5w2mxhwgnxTRXtaDS
	gLLnIHe0oFUaa0EFRTXQ/NHDLab7zHFWOofL5pUeY/WNVolIJsXHenVq33+Q2kP9
	Zw3oI3PsLLfOjMzHL8H/3DDpJoipIAMgTtdsSQ=
X-Sasl-enc: 2TbXc87wd9WMYZuBXNifp7EHrUZIVJmVq0uRRxnmivo9 1469674604
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id E15A9F29E1;
	Wed, 27 Jul 2016 22:56:42 -0400 (EDT)
Message-ID: <1469674599.5468.95.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 12:26:39 +0930
In-Reply-To: <1469638018-17590-6-git-send-email-clg@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-6-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-6jDYlZMGckvu7+ppKM5C"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: Re: [Qemu-arm] [PATCH 5/6] aspeed: add ast2500 support to scu and
 sdmc controllers
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
X-TUID: tLBUmC9FeOr0


--=-6jDYlZMGckvu7+ppKM5C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE2LTA3LTI3IGF0IDE4OjQ2ICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBCYXNlZCBvbiBwcmV2aW91cyB3b3JrIGRvbmUgYnkgQW5kcmV3IEplZmZlcnkgPGFuZHJl
d0Bhai5pZC5hdT4uCj4gCj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0Br
YW9kLm9yZz4KClJldmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PgoK
PiAtLS0KPiDCoGh3L21pc2MvYXNwZWVkX3NjdS5jwqDCoMKgwqDCoMKgwqDCoMKgfCA0NSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+IMKgaHcvbWlzYy9hc3Bl
ZWRfc2RtYy5jwqDCoMKgwqDCoMKgwqDCoHzCoMKgMSArCj4gwqBpbmNsdWRlL2h3L21pc2MvYXNw
ZWVkX3NjdS5oIHzCoMKgMSArCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvbWlzYy9hc3BlZWRfc2N1LmMgYi9o
dy9taXNjL2FzcGVlZF9zY3UuYwo+IGluZGV4IGM3ZTJjODI2M2Y1NS4uNmRkN2UxMDg1NDIwIDEw
MDY0NAo+IC0tLSBhL2h3L21pc2MvYXNwZWVkX3NjdS5jCj4gKysrIGIvaHcvbWlzYy9hc3BlZWRf
c2N1LmMKPiBAQCAtMTIwLDYgKzEyMCw0MSBAQCBzdGF0aWMgY29uc3QgdWludDMyX3QgYXN0MjQw
MF9hMF9yZXNldHNbQVNQRUVEX1NDVV9OUl9SRUdTXSA9IHsKPiDCoMKgwqDCoMKgwqBbQk1DX0RF
Vl9JRF3CoMKgwqDCoMKgwqA9IDB4MDAwMDI0MDJVCj4gwqB9Owo+IMKgCj4gKy8qIFNDVTcwIGJp
dCAyMzogMCAyNE1oei4gYml0IDExOjk6IDBiMDAxIEFYSTpBQkggcmF0aW8gMjoxICovCj4gKy8q
IEFTVDI1MDAgcmV2aXNpb24gQTEgKi8KPiArCj4gK3N0YXRpYyBjb25zdCB1aW50MzJfdCBhc3Qy
NTAwX2ExX3Jlc2V0c1tBU1BFRURfU0NVX05SX1JFR1NdID0gewo+ICvCoMKgwqDCoMKgW1NZU19S
U1RfQ1RSTF3CoMKgwqDCoD0gMHhGRkNGRkVEQ1UsCj4gK8KgwqDCoMKgwqBbQ0xLX1NFTF3CoMKg
wqDCoMKgwqDCoMKgwqA9IDB4RjNGNDAwMDBVLAo+ICvCoMKgwqDCoMKgW0NMS19TVE9QX0NUUkxd
wqDCoMKgPSAweDE5RkMzRThCVSwKPiArwqDCoMKgwqDCoFtEMlBMTF9QQVJBTV3CoMKgwqDCoMKg
PSAweDAwMDI2MTA4VSwKPiArwqDCoMKgwqDCoFtNUExMX1BBUkFNXcKgwqDCoMKgwqDCoD0gMHgw
MDAzMDI5MVUsCj4gK8KgwqDCoMKgwqBbSFBMTF9QQVJBTV3CoMKgwqDCoMKgwqA9IDB4OTMwMDA0
MDBVLAo+ICvCoMKgwqDCoMKgW01JU0NfQ1RSTDFdwqDCoMKgwqDCoMKgPSAweDAwMDAwMDEwVSwK
PiArwqDCoMKgwqDCoFtQQ0lfQ1RSTDFdwqDCoMKgwqDCoMKgwqA9IDB4MjAwMDFBMDNVLAo+ICvC
oMKgwqDCoMKgW1BDSV9DVFJMMl3CoMKgwqDCoMKgwqDCoD0gMHgyMDAwMUEwM1UsCj4gK8KgwqDC
oMKgwqBbUENJX0NUUkwzXcKgwqDCoMKgwqDCoMKgPSAweDA0MDAwMDMwVSwKPiArwqDCoMKgwqDC
oFtTWVNfUlNUX1NUQVRVU13CoMKgPSAweDAwMDAwMDAxVSwKPiArwqDCoMKgwqDCoFtTT0NfU0NS
QVRDSDFdwqDCoMKgwqA9IDB4MDAwMDAwQzBVLCAvKiBTb0MgY29tcGxldGVkIERSQU0gaW5pdCAq
Lwo+ICvCoMKgwqDCoMKgW01JU0NfQ1RSTDJdwqDCoMKgwqDCoMKgPSAweDAwMDAwMDIzVSwKPiAr
wqDCoMKgwqDCoFtSTkdfQ1RSTF3CoMKgwqDCoMKgwqDCoMKgPSAweDAwMDAwMDBFVSwKPiArwqDC
oMKgwqDCoFtQSU5NVVhfQ1RSTDJdwqDCoMKgwqA9IDB4MDAwMEYwMDBVLAo+ICvCoMKgwqDCoMKg
W1BJTk1VWF9DVFJMM13CoMKgwqDCoD0gMHgwMzAwMDAwMFUsCj4gK8KgwqDCoMKgwqBbUElOTVVY
X0NUUkw0XcKgwqDCoMKgPSAweDAwMDAwMDAwVSwKPiArwqDCoMKgwqDCoFtQSU5NVVhfQ1RSTDVd
wqDCoMKgwqA9IDB4MDAwMEEwMDBVLAo+ICvCoMKgwqDCoMKgW1dEVF9SU1RfQ1RSTF3CoMKgwqDC
oD0gMHgwMjNGRkZGM1UsCj4gK8KgwqDCoMKgwqBbUElOTVVYX0NUUkw4XcKgwqDCoMKgPSAweEZG
RkYwMDAwVSwKPiArwqDCoMKgwqDCoFtQSU5NVVhfQ1RSTDldwqDCoMKgwqA9IDB4MDAwRkZGRkZV
LAo+ICvCoMKgwqDCoMKgW0ZSRUVfQ05UUjRdwqDCoMKgwqDCoMKgPSAweDAwMDAwMEZGVSwKPiAr
wqDCoMKgwqDCoFtGUkVFX0NOVFI0X0VYVF3CoMKgPSAweDAwMDAwMEZGVSwKPiArwqDCoMKgwqDC
oFtDUFUyX0JBU0VfU0VHMV3CoMKgPSAweDgwMDAwMDAwVSwKPiArwqDCoMKgwqDCoFtDUFUyX0JB
U0VfU0VHNF3CoMKgPSAweDFFNjAwMDAwVSwKPiArwqDCoMKgwqDCoFtDUFUyX0JBU0VfU0VHNV3C
oMKgPSAweEMwMDAwMDAwVSwKPiArwqDCoMKgwqDCoFtVQVJUX0hQTExfQ0xLXcKgwqDCoD0gMHgw
MDAwMTkwM1UsCj4gK8KgwqDCoMKgwqBbUENJRV9DVFJMXcKgwqDCoMKgwqDCoMKgPSAweDAwMDAw
MDdCVSwKPiArwqDCoMKgwqDCoFtCTUNfREVWX0lEXcKgwqDCoMKgwqDCoD0gMHgwMDAwMjQwMlUK
PiArfTsKPiArCj4gwqBzdGF0aWMgdWludDY0X3QgYXNwZWVkX3NjdV9yZWFkKHZvaWQgKm9wYXF1
ZSwgaHdhZGRyIG9mZnNldCwgdW5zaWduZWQgc2l6ZSkKPiDCoHsKPiDCoMKgwqDCoMKgQXNwZWVk
U0NVU3RhdGUgKnMgPSBBU1BFRURfU0NVKG9wYXF1ZSk7Cj4gQEAgLTE5OCw2ICsyMzMsMTAgQEAg
c3RhdGljIHZvaWQgYXNwZWVkX3NjdV9yZXNldChEZXZpY2VTdGF0ZSAqZGV2KQo+IMKgwqDCoMKg
wqBjYXNlIEFTVDI0MDBfQTBfU0lMSUNPTl9SRVY6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgcmVzZXQg
PSBhc3QyNDAwX2EwX3Jlc2V0czsKPiDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiArwqDCoMKg
wqBjYXNlIEFTVDI1MDBfQTBfU0lMSUNPTl9SRVY6Cj4gK8KgwqDCoMKgY2FzZSBBU1QyNTAwX0Ex
X1NJTElDT05fUkVWOgo+ICvCoMKgwqDCoMKgwqDCoMKgcmVzZXQgPSBhc3QyNTAwX2ExX3Jlc2V0
czsKPiArwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKgwqDCoMKgwqBkZWZhdWx0Ogo+IMKgwqDC
oMKgwqDCoMKgwqDCoGdfYXNzZXJ0X25vdF9yZWFjaGVkKCk7Cj4gwqDCoMKgwqDCoH0KPiBAQCAt
MjA4LDcgKzI0NywxMSBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc2N1X3Jlc2V0KERldmljZVN0YXRl
ICpkZXYpCj4gwqDCoMKgwqDCoHMtPnJlZ3NbSFdfU1RSQVAyXSA9IHMtPmh3X3N0cmFwMjsKPiDC
oH0KPiDCoAo+IC1zdGF0aWMgdWludDMyX3QgYXNwZWVkX3NpbGljb25fcmV2c1tdID0geyBBU1Qy
NDAwX0EwX1NJTElDT05fUkVWLCB9Owo+ICtzdGF0aWMgdWludDMyX3QgYXNwZWVkX3NpbGljb25f
cmV2c1tdID0gewo+ICvCoMKgwqDCoEFTVDI0MDBfQTBfU0lMSUNPTl9SRVYsCj4gK8KgwqDCoMKg
QVNUMjUwMF9BMF9TSUxJQ09OX1JFViwKPiArwqDCoMKgwqBBU1QyNTAwX0ExX1NJTElDT05fUkVW
Cj4gK307Cj4gwqAKPiDCoGJvb2wgaXNfc3VwcG9ydGVkX3NpbGljb25fcmV2KHVpbnQzMl90IHNp
bGljb25fcmV2KQo+IMKgewo+IGRpZmYgLS1naXQgYS9ody9taXNjL2FzcGVlZF9zZG1jLmMgYi9o
dy9taXNjL2FzcGVlZF9zZG1jLmMKPiBpbmRleCA2Y2MwMzAxYTYzMzEuLjYyMWQxNjY4OTBmYSAx
MDA2NDQKPiAtLS0gYS9ody9taXNjL2FzcGVlZF9zZG1jLmMKPiArKysgYi9ody9taXNjL2FzcGVl
ZF9zZG1jLmMKPiBAQCAtMTk2LDYgKzE5Niw3IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9zZG1jX3Jl
c2V0KERldmljZVN0YXRlICpkZXYpCj4gwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqAKPiDC
oMKgwqDCoMKgY2FzZSBBU1QyNTAwX0EwX1NJTElDT05fUkVWOgo+ICvCoMKgwqDCoGNhc2UgQVNU
MjUwMF9BMV9TSUxJQ09OX1JFVjoKPiDCoMKgwqDCoMKgwqDCoMKgwqBzLT5yZWdzW1JfQ09ORl0g
fD0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEFTUEVFRF9TRE1DX0hXX1ZFUlNJT04oMSkg
fAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQVNQRUVEX1NETUNfVkdBX0FQRVJUVVJFKEFT
UEVFRF9TRE1DX1ZHQV82NE1CKSB8Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvbWlzYy9hc3Bl
ZWRfc2N1LmggYi9pbmNsdWRlL2h3L21pc2MvYXNwZWVkX3NjdS5oCj4gaW5kZXggZmRmZDk4MjI4
OGYyLi5lMmU0ZDE4NjRlMzQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9ody9taXNjL2FzcGVlZF9z
Y3UuaAo+ICsrKyBiL2luY2x1ZGUvaHcvbWlzYy9hc3BlZWRfc2N1LmgKPiBAQCAtMzMsNiArMzMs
NyBAQCB0eXBlZGVmIHN0cnVjdCBBc3BlZWRTQ1VTdGF0ZSB7Cj4gwqAKPiDCoCNkZWZpbmUgQVNU
MjQwMF9BMF9TSUxJQ09OX1JFVsKgwqDCoDB4MDIwMDAzMDNVCj4gwqAjZGVmaW5lIEFTVDI1MDBf
QTBfU0lMSUNPTl9SRVbCoMKgwqAweDA0MDAwMzAzVQo+ICsjZGVmaW5lIEFTVDI1MDBfQTFfU0lM
SUNPTl9SRVbCoMKgwqAweDA0MDEwMzAzVQo+IMKgCj4gwqBleHRlcm4gYm9vbCBpc19zdXBwb3J0
ZWRfc2lsaWNvbl9yZXYodWludDMyX3Qgc2lsaWNvbl9yZXYpOwo+IMKg


--=-6jDYlZMGckvu7+ppKM5C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmXRnAAoJEJ0dnzgO5LT5gSwP+wV+u/cQq7+cnFtcYwGfhnwR
q8SYhsqMzzPN/DZlpl6CPoF1Em6YRsNqg/n9c5oX1we5c/eP7PbYVc2r8/8/Pll4
Vppd2C3V69ace66eupfG6zykXRvUgTCLOAzq44tNyG7z0Ch0rIPglrdGWZhlVqDl
kLg33wWmg8KsrlftLtUC15pCuB/VGtAmQ+GPjGGezF9VMnRp3vvF4GoZiweusWj4
LkJGV7eKGG1BbRtcpcWjXFUDENazS6aXvQvMm85Pa78VbvrCGtXEQ8bwWFGuUi5b
pJCI/COZ0W6e0E42QitfKdn9extIB+whrpf35AnqnSH2GbqOljDItsX3aTsGVePW
MYtZlH+HFMqz5bPrkWHqiG/A2pzO2rm9Wa6kw1jfUPP02pDfPZBQMUqHV+uWQseC
EQa/A9MjwC7vJjR19vV1L4xQpO03n83b3ptYfPtje3WYXES419Ok8ZKPqkDi5Q2R
JwzTybuJYFy7G/9LQCoT/wJ1MoUT/rvWPbuHwwnn8Zx6rWa3klvvu5rCGNKGI+hP
dL3ouYvbvaXmkAZfPrw1ifAnO4Ve6ApiTyEK9TO5H5B0C/FXQfkCu0sxAImLyZ3H
0MUB0Balg5N3g9XpOUOmtDVgq78KqS7c60pXYA1GenBRbSLFx6+8Uk2TNE9UenS6
KxnrVWno89FSD0WFrBdJ
=UJEY
-----END PGP SIGNATURE-----

--=-6jDYlZMGckvu7+ppKM5C--

