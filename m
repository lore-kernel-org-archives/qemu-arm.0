Received: by 10.25.21.156 with SMTP id 28csp457715lfv;
        Tue, 2 Aug 2016 16:58:57 -0700 (PDT)
X-Received: by 10.55.113.197 with SMTP id m188mr75224629qkc.90.1470182337217;
        Tue, 02 Aug 2016 16:58:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w82si514723qkb.296.2016.08.02.16.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 16:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUjaK-0002Md-JT
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 19:58:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bUjaC-0002LV-PP
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 19:58:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bUja9-000773-LR
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 19:58:48 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:42006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bUja7-000700-B2; Tue, 02 Aug 2016 19:58:45 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 70F66203D1;
	Tue,  2 Aug 2016 19:58:32 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Tue, 02 Aug 2016 19:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=TjTU6
	zBfwv5NwxRPL9A13nO2Fec=; b=JMgLkNiI2LQZyl/OCEOefK730HxsRpzlRzA5u
	54EfgWVek+lJl/o45IKBjPj5JUahjk+6T5EqNzAqPVKWwuNBY3NLH4xeUhZOmoup
	oYRc60COluhtK7uW4fim7SHC0ne2S3IICvkzRJsBmWJFr+xLdivwbq8QSpKcjGlK
	GI5obU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=TjTU6zBfwv5NwxRPL9A13nO2Fec=; b=M+G+4
	b/CysroxBE9gj3540rHZp7TKhdB0cPI8RW8hXsh65ijfc42BWgnjzFhSrq591jKw
	Dt7MsTa1kgFQ9EyPvQYCc0f32hTY+xnL9FRQQILPhkPaKF/QV+p7E+38RZrLotLQ
	Lq/vHRmneiC2gECz0ev82ec6P5iFU6XdryEF/4=
X-Sasl-enc: 33fjUR5lTGlgFGuSkCME7jKox6rtGkpQjrRy5J7lrZbJ 1470182311
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3E24FCCD81;
	Tue,  2 Aug 2016 19:58:29 -0400 (EDT)
Message-ID: <1470182305.4428.39.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Wed, 03 Aug 2016 09:28:25 +0930
In-Reply-To: <1470158147-16378-7-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-7-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-l45OJL6boPqtjNPrzUqY"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.29
Subject: Re: [Qemu-arm] [PATCH v3 06/10] palmetto-bmc: add board specific
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
X-TUID: XgInbp65wYlu


--=-l45OJL6boPqtjNPrzUqY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE2LTA4LTAyIGF0IDE5OjE1ICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBhc3BlZWRfYm9hcmRfaW5pdCgpIG5vdyB1c2VzIGEgYm9hcmQgaWRlbnRpZmllciB0byBj
dXN0b21pemUgc29tZSB2YWx1ZXMKPiBzcGVjaWZpYyB0byB0aGUgYm9hcmQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KClJldmlld2VkLWJ5OiBB
bmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PgoKPiAtLS0KPiAKPiDCoENoYW5nZXMgc2lu
Y2UgdjI6Cj4gCj4gwqAtIHJlbW92ZWQgc2lsaWNvbi1yZXYgYW5kIGNwdS1tb2RlbC4gVGhpcyBp
cyBub3cgaW4gdGhlIFNvQy4KPiAKPiDCoENoYW5nZXMgc2luY2UgdjE6Cj4gCj4gwqAtIGNoYW5n
ZWQgYXNwZWVkX2luaXQoKSBwcm90b3R5cGUgdG8gdXNlIGEgJ2NvbnN0IEFzcGVlZEJvYXJkQ29u
ZmlnIConCj4gwqAtIGZpeGVkIHdoaXRlIHNwYWNlIGlzc3Vlcwo+IAo+IMKgaHcvYXJtL2FzcGVl
ZC5jIHwgMjIgKysrKysrKysrKysrKysrKysrLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2h3L2FybS9hc3Bl
ZWQuYyBiL2h3L2FybS9hc3BlZWQuYwo+IGluZGV4IGFkMGEwNjJiNTYyNC4uNDIyNmI4ZGNkOTVj
IDEwMDY0NAo+IC0tLSBhL2h3L2FybS9hc3BlZWQuYwo+ICsrKyBiL2h3L2FybS9hc3BlZWQuYwo+
IEBAIC0zMCw2ICszMCwxOSBAQCB0eXBlZGVmIHN0cnVjdCBBc3BlZWRCb2FyZFN0YXRlIHsKPiDC
oMKgwqDCoMKgTWVtb3J5UmVnaW9uIHJhbTsKPiDCoH0gQXNwZWVkQm9hcmRTdGF0ZTsKPiDCoAo+
ICt0eXBlZGVmIHN0cnVjdCBBc3BlZWRCb2FyZENvbmZpZyB7Cj4gK8KgwqDCoMKgY29uc3QgY2hh
ciAqc29jX25hbWU7Cj4gK8KgwqDCoMKgdWludDMyX3QgaHdfc3RyYXAxOwo+ICt9IEFzcGVlZEJv
YXJkQ29uZmlnOwo+ICsKPiArZW51bSB7Cj4gK8KgwqDCoMKgUEFMTUVUVE9fQk1DCj4gK307Cj4g
Kwo+ICtzdGF0aWMgY29uc3QgQXNwZWVkQm9hcmRDb25maWcgYXNwZWVkX2JvYXJkc1tdID0gewo+
ICvCoMKgwqDCoFtQQUxNRVRUT19CTUNdID0geyAiYXN0MjQwMC1hMCIsIDB4MTIwQ0U0MTYgfSwK
PiArfTsKPiArCj4gwqBzdGF0aWMgdm9pZCBhc3BlZWRfYm9hcmRfaW5pdF9mbGFzaGVzKEFzcGVl
ZFNNQ1N0YXRlICpzLCBjb25zdCBjaGFyICpmbGFzaHR5cGUsCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgRXJyb3IgKiplcnJwKQo+IMKgewo+IEBAIC01NiwxMyArNjksMTQgQEAgc3RhdGljIHZvaWQg
YXNwZWVkX2JvYXJkX2luaXRfZmxhc2hlcyhBc3BlZWRTTUNTdGF0ZSAqcywgY29uc3QgY2hhciAq
Zmxhc2h0eXBlLAo+IMKgwqDCoMKgwqB9Cj4gwqB9Cj4gwqAKPiAtc3RhdGljIHZvaWQgYXNwZWVk
X2JvYXJkX2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lKQo+ICtzdGF0aWMgdm9pZCBhc3BlZWRf
Ym9hcmRfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbnN0IEFzcGVlZEJvYXJk
Q29uZmlnICpjZmcpCj4gwqB7Cj4gwqDCoMKgwqDCoEFzcGVlZEJvYXJkU3RhdGUgKmJtYzsKPiDC
oMKgwqDCoMKgQXNwZWVkU29DQ2xhc3MgKnNjOwo+IMKgCj4gwqDCoMKgwqDCoGJtYyA9IGdfbmV3
MChBc3BlZWRCb2FyZFN0YXRlLCAxKTsKPiAtwqDCoMKgwqBvYmplY3RfaW5pdGlhbGl6ZSgmYm1j
LT5zb2MsIChzaXplb2YoYm1jLT5zb2MpKSwgImFzdDI0MDAtYTAiKTsKPiArwqDCoMKgwqBvYmpl
Y3RfaW5pdGlhbGl6ZSgmYm1jLT5zb2MsIChzaXplb2YoYm1jLT5zb2MpKSwgY2ZnLT5zb2NfbmFt
ZSk7Cj4gwqDCoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9hZGRfY2hpbGQoT0JKRUNUKG1hY2hpbmUp
LCAic29jIiwgT0JKRUNUKCZibWMtPnNvYyksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmZXJyb3JfYWJvcnQpOwo+IMKgCj4g
QEAgLTczLDcgKzg3LDcgQEAgc3RhdGljIHZvaWQgYXNwZWVkX2JvYXJkX2luaXQoTWFjaGluZVN0
YXRlICptYWNoaW5lKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZibWMtPnJhbSk7Cj4gwqDCoMKgwqDCoG9iamVjdF9w
cm9wZXJ0eV9hZGRfY29uc3RfbGluayhPQkpFQ1QoJmJtYy0+c29jKSwgInJhbSIsIE9CSkVDVCgm
Ym1jLT5yYW0pLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZlcnJvcl9hYm9ydCk7Cj4gLcKgwqDCoMKgb2Jq
ZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZibWMtPnNvYyksIDB4MTIwQ0U0MTYsICJody1z
dHJhcDEiLAo+ICvCoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9zZXRfaW50KE9CSkVDVCgmYm1jLT5z
b2MpLCBjZmctPmh3X3N0cmFwMSwgImh3LXN0cmFwMSIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZlcnJvcl9hYm9ydCk7Cj4gwqDC
oMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9zZXRfYm9vbChPQkpFQ1QoJmJtYy0+c29jKSwgdHJ1ZSwg
InJlYWxpemVkIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAmZXJyb3JfYWJvcnQpOwo+IEBAIC05Myw3ICsxMDcsNyBAQCBzdGF0
aWMgdm9pZCBhc3BlZWRfYm9hcmRfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpCj4gwqAKPiDC
oHN0YXRpYyB2b2lkIHBhbG1ldHRvX2JtY19pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKPiDC
oHsKPiAtwqDCoMKgwqBhc3BlZWRfYm9hcmRfaW5pdChtYWNoaW5lKTsKPiArwqDCoMKgwqBhc3Bl
ZWRfYm9hcmRfaW5pdChtYWNoaW5lLCAmYXNwZWVkX2JvYXJkc1tQQUxNRVRUT19CTUNdKTsKPiDC
oH0KPiDCoAo+IMKgc3RhdGljIHZvaWQgcGFsbWV0dG9fYm1jX2NsYXNzX2luaXQoT2JqZWN0Q2xh
c3MgKm9jLCB2b2lkICpkYXRhKQ==


--=-l45OJL6boPqtjNPrzUqY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXoTOhAAoJEJ0dnzgO5LT5YCoP/RBM6aWGap7Hn3mwNhEB0OC/
wlJdmCBUwb9P7Oq04Rz6rRt7153xx0NGqmZX1QgmFTFd+tazCxP5dkBFmGvWgrN6
L6bSCa1rCHfQJlZ8f72XIaeGOv412wHZi39kwC3mHR6V0RNPxeWMpp58JfZQ2QUW
8AKvmAQ9sLseuWpdsg1kkJNqd0eON7ELUmCBKHqhK1SF7y/ASUWjgTQ1IwNenyam
6LxJ6W1nwcq4n45GJmOwftYiuCEnLmzKeMd6oyCWJOjZPjdz9OZ2impjxNk+wVR3
DGurWyBBKuggFpPgiBTijEP/xF2HNBOzU/tjJEYlL3vL0P4xx6D6GCKtudDFvGoQ
Vsf/40nwaR19pwiUhxkkh50EHUxDtWFDX/Xq3rD4Cj3+cU1iAb+xt4uRj7yLGBPr
AwJclnRf6Zd0I747kSJCCDz1RbJP4Zf2QSdZ0ZQdmxDfWW9/H4gz1BSTGVhzV4rw
qHPy9UK7xEnQ5Fz2jJF65Qbk3tc1Cbxu3VZ6Z0mDWCQVO+iiMNTcF+YhPSQqVvIe
YvjkGBtuGRi8UVkJ66se2My6iup8Qs4lefFDplIpOYkxfj2KcC7zgA+nMyYrctsQ
kEFqnHKtKpa5UahEz8zssfXaPHIRXqFIIbam2QHnUr46gJU+L+iav5wvRtjI/syl
sEaXPhtKrppjCkHNWPjL
=QhOp
-----END PGP SIGNATURE-----

--=-l45OJL6boPqtjNPrzUqY--

