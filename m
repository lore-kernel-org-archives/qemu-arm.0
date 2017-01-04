Received: by 10.25.205.13 with SMTP id d13csp9135013lfg;
        Tue, 3 Jan 2017 22:20:15 -0800 (PST)
X-Received: by 10.55.105.129 with SMTP id e123mr68189339qkc.173.1483510815199;
        Tue, 03 Jan 2017 22:20:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3si34552651qkf.13.2017.01.03.22.20.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jan 2017 22:20:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cOevk-0002vj-PF
	for alex.bennee@linaro.org; Wed, 04 Jan 2017 01:20:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1cOevf-0002v5-SX
	for qemu-arm@nongnu.org; Wed, 04 Jan 2017 01:20:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1cOevc-0000OS-OE
	for qemu-arm@nongnu.org; Wed, 04 Jan 2017 01:20:07 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1cOevc-0000ON-JS; Wed, 04 Jan 2017 01:20:04 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2C0AD20C86;
	Wed,  4 Jan 2017 01:20:04 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Wed, 04 Jan 2017 01:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=OO938haemcJbLvwaEJ0mVHLz65o=; b=YIZloG
	kKGH41E9rewxBuTVsVfdFRZVuVYMxsuYJvRFeywucxMgbi7eHgjjOmYvGZ4Jz3e1
	/eUZ1pNHaOuscpKBLjz9vIwj/NUnvkRoIyR6zUXaaWsiSGglbeusFoKJ4TLkFul/
	tquJZOCn6ykpUn+zLErRECiVbDgNjZSOa3Tz4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=OO938haemcJbLv
	waEJ0mVHLz65o=; b=S6VKrmH/4BR2plN/+59FQoz0mRWLivNxe2+W3kPy73X606
	kks5JxnVx2A+CPKBMpxUHg1J4cgKc4daXMi8xWvWbJmUlOmOmTQlBo6sqOng5dyc
	uo/2SRU9kYpZR02SSohdRk/AE0mERsB5YBg8FBtUfqAnimIIEB/ozITuS+FWc=
X-ME-Sender: <xms:FJRsWAzNmwO5fK4J8Ngrf73BVlV-6Ot8SsWDeIRKDZ0C36hQfHzmLw>
X-Sasl-enc: SIBa2jvy4B907pEO7rYZOrqdKUhRAiHUlMJyYs033030 1483510803
Received: from [10.104.0.15] (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9C0362423F;
	Wed,  4 Jan 2017 01:20:00 -0500 (EST)
Message-ID: <1483510797.22609.9.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Alastair D'Silva <alastair@au1.ibm.com>, qemu-arm@nongnu.org
Date: Wed, 04 Jan 2017 16:49:57 +1030
In-Reply-To: <20161215054812.12602-9-alastair@au1.ibm.com>
References: <20161215054812.12602-1-alastair@au1.ibm.com>
	<20161215054812.12602-9-alastair@au1.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-86RTWx9dJYaTAZdERKGw"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH v4 8/8] arm: Add an RX8900 RTC to the ASpeed
 board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Chris Smart <chris@distroguy.com>, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 10A4mqInoLLS


--=-86RTWx9dJYaTAZdERKGw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE2LTEyLTE1IGF0IDE2OjQ4ICsxMTAwLCBBbGFzdGFpciBEJ1NpbHZhIHdyb3Rl
Ogo+ID4gRnJvbTogQWxhc3RhaXIgRCdTaWx2YSA8YWxhc3RhaXJAZC1zaWx2YS5vcmc+Cj4gCj4g
Q29ubmVjdCBhbiBSWDg5MDAgUlRDIHRvIGkyYzEyIG9mIHRoZSBBU1QyNTAwIFNPQyBhdCBhZGRy
ZXNzIDB4MzIKPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0YWly
QGQtc2lsdmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzIFNtYXJ0IDxjaHJpc0BkaXN0cm9n
dXkuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+Cgo+
IC0tLQo+IMKgaHcvYXJtL2FzcGVlZC5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2h3L2FybS9hc3BlZWQuYyBiL2h3L2FybS9hc3BlZWQuYwo+IGluZGV4IDQwYzEzODMuLmVmNjNm
ZDAgMTAwNjQ0Cj4gLS0tIGEvaHcvYXJtL2FzcGVlZC5jCj4gKysrIGIvaHcvYXJtL2FzcGVlZC5j
Cj4gQEAgLTI2LDYgKzI2LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgYXJtX2Jvb3RfaW5mbyBhc3BlZWRf
Ym9hcmRfYmluZm8gPSB7Cj4gwqDCoMKgwqDCoC5uYl9jcHVzID0gMSwKPiDCoH07Cj4gwqAKPiAr
dHlwZWRlZiBzdHJ1Y3QgQXNwZWVkSTJDRGV2aWNlIHsKPiArwqDCoMKgwqBjb25zdCBjaGFyICp0
eXBlOwo+ICvCoMKgwqDCoHVpbnQ4X3QgYWRkcmVzczsKPiArwqDCoMKgwqBpbnQgYnVzOwo+ICt9
IEFzcGVlZEkyQ0RldmljZTsKPiArCj4gwqB0eXBlZGVmIHN0cnVjdCBBc3BlZWRCb2FyZFN0YXRl
IHsKPiDCoMKgwqDCoMKgQXNwZWVkU29DU3RhdGUgc29jOwo+IMKgwqDCoMKgwqBNZW1vcnlSZWdp
b24gcmFtOwo+IEBAIC0zNyw2ICs0Myw3IEBAIHR5cGVkZWYgc3RydWN0IEFzcGVlZEJvYXJkQ29u
ZmlnIHsKPiDCoMKgwqDCoMKgY29uc3QgY2hhciAqZm1jX21vZGVsOwo+IMKgwqDCoMKgwqBjb25z
dCBjaGFyICpzcGlfbW9kZWw7Cj4gwqDCoMKgwqDCoHVpbnQzMl90IG51bV9jczsKPiArwqDCoMKg
wqBjb25zdCBBc3BlZWRJMkNEZXZpY2UgKmkyY19kZXZpY2VzOwo+IMKgfSBBc3BlZWRCb2FyZENv
bmZpZzsKPiDCoAo+IMKgZW51bSB7Cj4gQEAgLTgwLDYgKzg3LDExIEBAIGVudW0gewo+IMKgwqDC
oMKgwqDCoMKgwqDCoFNDVV9BU1QyNTAwX0hXX1NUUkFQX0FDUElfRU5BQkxFIHzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBcCj4gwqDC
oMKgwqDCoMKgwqDCoMKgU0NVX0hXX1NUUkFQX1NQSV9NT0RFKFNDVV9IV19TVFJBUF9TUElfTUFT
VEVSKSkKPiDCoAo+ICsKPiArc3RhdGljIGNvbnN0IEFzcGVlZEkyQ0RldmljZSBhc3QyNTAwX2ky
Y19kZXZpY2VzW10gPSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqB7InJ4ODkwMCIsIDB4MzIsIDExfQo+
ICt9Owo+ICsKPiDCoHN0YXRpYyBjb25zdCBBc3BlZWRCb2FyZENvbmZpZyBhc3BlZWRfYm9hcmRz
W10gPSB7Cj4gwqDCoMKgwqDCoFtQQUxNRVRUT19CTUNdID0gewo+IMKgwqDCoMKgwqDCoMKgwqDC
oC5zb2NfbmFtZcKgwqA9ICJhc3QyNDAwLWExIiwKPiBAQCAtOTQsNiArMTA2LDcgQEAgc3RhdGlj
IGNvbnN0IEFzcGVlZEJvYXJkQ29uZmlnIGFzcGVlZF9ib2FyZHNbXSA9IHsKPiDCoMKgwqDCoMKg
wqDCoMKgwqAuZm1jX21vZGVsID0gIm4yNXEyNTZhIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqAuc3Bp
X21vZGVsID0gIm14MjVsMjU2MzVlIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqAubnVtX2NzwqDCoMKg
wqA9IDEsCj4gK8KgwqDCoMKgwqDCoMKgwqAuaTJjX2RldmljZXMgPSBhc3QyNTAwX2kyY19kZXZp
Y2VzLAo+IMKgwqDCoMKgwqB9LAo+IMKgwqDCoMKgwqBbUk9NVUxVU19CTUNdwqDCoD0gewo+IMKg
wqDCoMKgwqDCoMKgwqDCoC5zb2NfbmFtZcKgwqA9ICJhc3QyNTAwLWExIiwKPiBAQCAtMTA0LDYg
KzExNyw3IEBAIHN0YXRpYyBjb25zdCBBc3BlZWRCb2FyZENvbmZpZyBhc3BlZWRfYm9hcmRzW10g
PSB7Cj4gwqDCoMKgwqDCoH0sCj4gwqB9Owo+IMKgCj4gKwo+IMKgc3RhdGljIHZvaWQgYXNwZWVk
X2JvYXJkX2luaXRfZmxhc2hlcyhBc3BlZWRTTUNTdGF0ZSAqcywgY29uc3QgY2hhciAqZmxhc2h0
eXBlLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVycm9yICoqZXJycCkKPiDCoHsKPiBAQCAtMTMw
LDYgKzE0NCwxOSBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfYm9hcmRfaW5pdF9mbGFzaGVzKEFzcGVl
ZFNNQ1N0YXRlICpzLCBjb25zdCBjaGFyICpmbGFzaHR5cGUsCj4gwqDCoMKgwqDCoH0KPiDCoH0K
PiDCoAo+ICtzdGF0aWMgdm9pZCBhc3BlZWRfaTJjX2luaXQoQXNwZWVkQm9hcmRTdGF0ZSAqYm1j
LAo+ICvCoMKgwqDCoMKgwqDCoMKgY29uc3QgQXNwZWVkQm9hcmRDb25maWcgKmNmZykKPiArewo+
ICvCoMKgwqDCoEFzcGVlZFNvQ1N0YXRlICpzb2MgPSAmYm1jLT5zb2M7Cj4gK8KgwqDCoMKgY29u
c3QgQXNwZWVkSTJDRGV2aWNlICpkZXY7Cj4gKwo+ICvCoMKgwqDCoGZvciAoZGV2ID0gY2ZnLT5p
MmNfZGV2aWNlczsgZGV2ICE9IE5VTEwgJiYgZGV2LT50eXBlICE9IE5VTEw7IGRldisrKSB7Cj4g
K8KgwqDCoMKgwqDCoMKgwqBJMkNCdXMgKmkyY19idXMgPSBhc3BlZWRfaTJjX2dldF9idXMoKERl
dmljZVN0YXRlICopJnNvYy0+aTJjLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBkZXYtPmJ1cyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqAodm9pZClpMmNfY3JlYXRlX3NsYXZlKGky
Y19idXMsIGRldi0+dHlwZSwgZGV2LT5hZGRyZXNzKTsKPiArwqDCoMKgwqB9Cj4gK30KPiArCj4g
wqBzdGF0aWMgdm9pZCBhc3BlZWRfYm9hcmRfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUsCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBjb25zdCBBc3BlZWRCb2FyZENvbmZpZyAqY2ZnKQo+IMKgewo+IEBAIC0xNzQsNiArMjAx
LDggQEAgc3RhdGljIHZvaWQgYXNwZWVkX2JvYXJkX2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5l
LAo+IMKgwqDCoMKgwqBhc3BlZWRfYm9hcmRfYmluZm8ucmFtX3NpemUgPSByYW1fc2l6ZTsKPiDC
oMKgwqDCoMKgYXNwZWVkX2JvYXJkX2JpbmZvLmxvYWRlcl9zdGFydCA9IHNjLT5pbmZvLT5zZHJh
bV9iYXNlOwo+IMKgCj4gK8KgwqDCoMKgYXNwZWVkX2kyY19pbml0KGJtYywgY2ZnKTsKPiArCj4g
wqDCoMKgwqDCoGFybV9sb2FkX2tlcm5lbChBUk1fQ1BVKGZpcnN0X2NwdSksICZhc3BlZWRfYm9h
cmRfYmluZm8pOwo+IMKgfQo+IMKg


--=-86RTWx9dJYaTAZdERKGw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYbJQNAAoJEJ0dnzgO5LT51HAQAIOQAgPpeC1IheTB3gfa8BKb
uEqQrIUfKmWC/uIW3ZXPPnfFZLGC4fnp6v/N06aGlEhDL+w30c2pOsBoQMNv143K
dZIeuaEkmXhNN0Y0/pLtZ9gJarhDKh8AsISrkRoxhgsBw5iNgmPylZaABP72lE6g
zlGYBqfjC3VBY54cV6HfQm6ffLK3iNlsWpSVLAFrH5lkcKByH/eXUvVydm5yF2xa
uYzn+vuB82wzzmD+2s2wqXkI1hWulWxpzOcEufo+xtowdjMjCUFV+SYEGtWy2bkg
V0n+Xe0vNRnBpc32eEeQKphgbnbCjOL6TXiyCu0oRhQ98gmNwrg8Vj+D4p6+Z5Ty
D18zowHKlKctSpX/sDfBhc5qX3mRZ/35HkEQXGWv7m2Zd2v5T77ZPDZvqubBrzIc
ss955rhnkR5JBY1jAHJhD70bhUNmjNwNitpkgqSp0c7qrQnL3EvHDHcrobevVG5T
/axWbrbkkXAWaFR+/0QrAXtoc3aElFV+qmL7tdVV/ocqoCTiO+qy60B3vr6ybzBJ
P0M6gW4fFFfBcEV8roijmMrkzTfmEXANFnqUZyfPcQm/OeuhUjSeJsVl+EwvWMA9
zyckIiPIEEphw6biLHjJ1/uGSJ78syW4mYrFYZIh/wLH53p60CJNks4O7yu0D3ea
nKv66cUMjdI2HWocYijK
=DppF
-----END PGP SIGNATURE-----

--=-86RTWx9dJYaTAZdERKGw--

