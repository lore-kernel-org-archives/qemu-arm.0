Received: by 10.25.21.156 with SMTP id 28csp464985lfv;
        Tue, 2 Aug 2016 17:22:55 -0700 (PDT)
X-Received: by 10.237.33.111 with SMTP id 102mr104849623qtc.56.1470183775265;
        Tue, 02 Aug 2016 17:22:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 93si613137qkz.93.2016.08.02.17.22.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 17:22:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59510 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUjxW-0002Yw-NF
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 20:22:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bUjxS-0002YS-MA
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 20:22:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bUjxM-000716-KU
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 20:22:49 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:60250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bUjxK-00070R-AX; Tue, 02 Aug 2016 20:22:44 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id D54F6204BC;
	Tue,  2 Aug 2016 20:22:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Tue, 02 Aug 2016 20:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Hrm8y
	PDcDjJoybu6uz86WEbXXeM=; b=gxLY7jtWlq/1u2Acv1P12vp3bGC1A4yZovDfe
	goXbe+lKH7LgySpjGPGOvZHopD2kuOPAD/CI2byV2psW0dPmV4sL6mJ3oCBbccWz
	RCeQ2hkwITA/35K+5ZNGtPuI7dIllYo9B0yczBIUMQk34khupP4NgLN91P2TjGFP
	uBJmiQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=Hrm8yPDcDjJoybu6uz86WEbXXeM=; b=HeFlU
	+ZO+90HALsCSsCZyvxvNB0xZ6SUQsD/1UcinVZwrI6Mnqo/mGxNXAkRMkiakQ6Md
	Nhgz2i4mJQdtq+oFE8C4HMb3S6BYbWD9gaeqkJ6Q7AorHbqF58HU/GQPnb6pirzA
	eWgIeb7u9bLubvjrv/BeKDnwkn1vJWTLBMok+c=
X-Sasl-enc: QGR1S8pc6p0oEs6XtE6nGUCbN1+Y/S5niTm/C0In3Fqr 1470183749
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9E916CC07A;
	Tue,  2 Aug 2016 20:22:27 -0400 (EDT)
Message-ID: <1470183743.4428.44.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Wed, 03 Aug 2016 09:52:23 +0930
In-Reply-To: <1470158147-16378-10-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-10-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-LaA4fr2TpfTftfT2nerr"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.29
Subject: Re: [Qemu-arm] [PATCH v3 09/10] arm: add support for an ast2500
 evaluation board
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
X-TUID: F+cCn3tyheF3


--=-LaA4fr2TpfTftfT2nerr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE2LTA4LTAyIGF0IDE5OjE1ICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBUaGUgYXN0MjUwMCBldmFsIGJvYXJkIGhhcyBhIGhhcmR3YXJlIHN0cmFwcGluZyByZWdp
c3RlciB2YWx1ZSBvZgo+IDB4RjEwMEMyRTYgd2hpY2ggd2UgdXNlIGZvciBhIGRlZmluaXRpb24g
b2YgQVNUMjUwMF9FVkJfSFdfU1RSQVAxCj4gYmVsb3cuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ8Op
ZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KClJldmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVy
eSA8YW5kcmV3QGFqLmlkLmF1PgoKPiAtLS0KPiAKPiDCoENoYW5nZXMgc2luY2UgdjI6Cj4gCj4g
wqAtIHJlbW92ZWQgc2lsaWNvbi1yZXYgYW5kIGNwdS1tb2RlbC4gVGhpcyBpcyBub3cgaW4gdGhl
IFNvQy4KPiAKPiDCoENoYW5nZXMgc2luY2UgdjE6Cj4gCj4gwqAtIGNoYW5nZWQgQVNUMjUwMF9F
REsgdG8gQVNUMjUwMF9FVkIKPiDCoC0gZml4ZWQgd2hpdGUgc3BhY2UgaXNzdWVzCj4gwqAtIGFk
ZGVkIEFTVDI1MDBfSFdfU1RSQVAxwqAKPiAKPiDCoGh3L2FybS9hc3BlZWQuYyB8IDM5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDM4
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2Fz
cGVlZC5jIGIvaHcvYXJtL2FzcGVlZC5jCj4gaW5kZXggODA5MDdiNDI0NGVhLi5lNzE1MDBjNjRi
ZDMgMTAwNjQ0Cj4gLS0tIGEvaHcvYXJtL2FzcGVlZC5jCj4gKysrIGIvaHcvYXJtL2FzcGVlZC5j
Cj4gQEAgLTM2LDcgKzM2LDggQEAgdHlwZWRlZiBzdHJ1Y3QgQXNwZWVkQm9hcmRDb25maWcgewo+
IMKgfSBBc3BlZWRCb2FyZENvbmZpZzsKPiDCoAo+IMKgZW51bSB7Cj4gLcKgwqDCoMKgUEFMTUVU
VE9fQk1DCj4gK8KgwqDCoMKgUEFMTUVUVE9fQk1DLAo+ICvCoMKgwqDCoEFTVDI1MDBfRVZCCj4g
wqB9Owo+IMKgCj4gwqAjZGVmaW5lIFBBTE1FVFRPX0JNQ19IV19TVFJBUDEgKMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgXAo+IEBAIC01Miw4ICs1MywxOSBAQCBlbnVtIHsKPiDCoMKgwqDCoMKgwqDC
oMKgwqBTQ1VfSFdfU1RSQVBfVkdBX1NJWkVfU0VUKFZHQV8xNk1fRFJBTSkgfMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBcCj4gwqDCoMKgwqDCoMKgwqDCoMKg
U0NVX0FTVDI0MDBfSFdfU1RSQVBfQk9PVF9NT0RFKEFTVDI0MDBfU1BJX0JPT1QpKQo+IMKgCj4g
KyNkZWZpbmUgQVNUMjUwMF9FVkJfSFdfU1RSQVAxICgowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBc
Cj4gK8KgwqDCoMKgwqDCoMKgwqBBU1QyNTAwX0hXX1NUUkFQMV9ERUZBVUxUUyB8wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoMKgU0NVX0FTVDI1MDBfSFdfU1RSQVBfU1BJX0FVVE9G
RVRDSF9FTkFCTEUgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFwK
PiArwqDCoMKgwqDCoMKgwqDCoFNDVV9BU1QyNTAwX0hXX1NUUkFQX0dQSU9fU1RSQVBfRU5BQkxF
IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBcCj4gK8Kg
wqDCoMKgwqDCoMKgwqBTQ1VfQVNUMjUwMF9IV19TVFJBUF9VQVJUX0RFQlVHIHzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFwKPiAr
wqDCoMKgwqDCoMKgwqDCoFNDVV9BU1QyNTAwX0hXX1NUUkFQX0REUjRfRU5BQkxFIHzCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBcCj4g
K8KgwqDCoMKgwqDCoMKgwqBTQ1VfSFdfU1RSQVBfTUFDMV9SR01JSSB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoMKgU0NVX0hXX1NUUkFQX01BQzBfUkdNSUkpICbCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoMKgflNDVV9IV19TVFJBUF8yTkRfQk9P
VF9XRFQpCj4gKwo+IMKgc3RhdGljIGNvbnN0IEFzcGVlZEJvYXJkQ29uZmlnIGFzcGVlZF9ib2Fy
ZHNbXSA9IHsKPiDCoMKgwqDCoMKgW1BBTE1FVFRPX0JNQ10gPSB7ICJhc3QyNDAwLWEwIiwgUEFM
TUVUVE9fQk1DX0hXX1NUUkFQMSB9LAo+ICvCoMKgwqDCoFtBU1QyNTAwX0VWQl3CoMKgPSB7ICJh
c3QyNTAwLWExIiwgQVNUMjUwMF9FVkJfSFdfU1RSQVAxIH0sCj4gwqB9Owo+IMKgCj4gwqBzdGF0
aWMgdm9pZCBhc3BlZWRfYm9hcmRfaW5pdF9mbGFzaGVzKEFzcGVlZFNNQ1N0YXRlICpzLCBjb25z
dCBjaGFyICpmbGFzaHR5cGUsCj4gQEAgLTE0Myw5ICsxNTUsMzQgQEAgc3RhdGljIGNvbnN0IFR5
cGVJbmZvIHBhbG1ldHRvX2JtY190eXBlID0gewo+IMKgwqDCoMKgwqAuY2xhc3NfaW5pdCA9IHBh
bG1ldHRvX2JtY19jbGFzc19pbml0LAo+IMKgfTsKPiDCoAo+ICtzdGF0aWMgdm9pZCBhc3QyNTAw
X2V2Yl9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKPiArewo+ICvCoMKgwqDCoGFzcGVlZF9i
b2FyZF9pbml0KG1hY2hpbmUsICZhc3BlZWRfYm9hcmRzW0FTVDI1MDBfRVZCXSk7Cj4gK30KPiAr
Cj4gK3N0YXRpYyB2b2lkIGFzdDI1MDBfZXZiX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKm9jLCB2
b2lkICpkYXRhKQo+ICt7Cj4gK8KgwqDCoMKgTWFjaGluZUNsYXNzICptYyA9IE1BQ0hJTkVfQ0xB
U1Mob2MpOwo+ICsKPiArwqDCoMKgwqBtYy0+ZGVzYyA9ICJBc3BlZWQgQVNUMjUwMCBFVkIgKEFS
TTExNzYpIjsKPiArwqDCoMKgwqBtYy0+aW5pdCA9IGFzdDI1MDBfZXZiX2luaXQ7Cj4gK8KgwqDC
oMKgbWMtPm1heF9jcHVzID0gMTsKPiArwqDCoMKgwqBtYy0+bm9fc2RjYXJkID0gMTsKPiArwqDC
oMKgwqBtYy0+bm9fZmxvcHB5ID0gMTsKPiArwqDCoMKgwqBtYy0+bm9fY2Ryb20gPSAxOwo+ICvC
oMKgwqDCoG1jLT5ub19wYXJhbGxlbCA9IDE7Cj4gK30KPiArCj4gK3N0YXRpYyBjb25zdCBUeXBl
SW5mbyBhc3QyNTAwX2V2Yl90eXBlID0gewo+ICvCoMKgwqDCoC5uYW1lID0gTUFDSElORV9UWVBF
X05BTUUoImFzdDI1MDAtZXZiIiksCj4gK8KgwqDCoMKgLnBhcmVudCA9IFRZUEVfTUFDSElORSwK
PiArwqDCoMKgwqAuY2xhc3NfaW5pdCA9IGFzdDI1MDBfZXZiX2NsYXNzX2luaXQsCj4gK307Cj4g
Kwo+IMKgc3RhdGljIHZvaWQgYXNwZWVkX21hY2hpbmVfaW5pdCh2b2lkKQo+IMKgewo+IMKgwqDC
oMKgwqB0eXBlX3JlZ2lzdGVyX3N0YXRpYygmcGFsbWV0dG9fYm1jX3R5cGUpOwo+ICvCoMKgwqDC
oHR5cGVfcmVnaXN0ZXJfc3RhdGljKCZhc3QyNTAwX2V2Yl90eXBlKTsKPiDCoH0KPiDCoAo+IMKg
dHlwZV9pbml0KGFzcGVlZF9tYWNoaW5lX2luaXQp


--=-LaA4fr2TpfTftfT2nerr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXoTk/AAoJEJ0dnzgO5LT5IbMP+QGfQ4o1iLD9zpC8esb+LZXw
llGVk7zIZHmrZ/S1Evf92FrFbKcD0lrw+Fw3QaI4uTVmn05zZ09euFf4597t2vzQ
uIUv457Ue1gEoHfEL4E7+uQSpacBFn0IhQT1cTRAHvDkKH+ZbdxIZwAwbjVOX+Nc
F52TpVUieI3LT5v7s5ICidDEwgIZABrzcIBeLsV6pP//loZgQg3zeuUyAj/9ZLRf
2rcSZ+YpZ8C92Tl24zVbeBZtCg+XBXtPOl5KFrP0XCK5r4uSrEQ9j/9Awp1xqImG
oU6neskXqpsamcZ2+8y3tTAVxnWdUC7fl2Zxt+aWdmPyN1Tq1/iRzxbipUFKo83T
Z4NgaGuyuBx09Ql++XdDCj18ptMfxFUoIQEJKnVGHKcy3fC/9SSzyiltJKr8ZIz6
zFhOp2gEl+QVrfETBZnqIJllN1MsGOytY5+ppxDMvglTeVkbMAQgCPDEjiTyU6WJ
3OSknTrgCEvfcar+bHSy9bs14FiJiixNBZOwc0P5HFTq5XnLxwnYQCh/sP3xqU3q
NuX5GzQpgo3ameVR5z+GP1agvoWC39PD2+oMjz8tPT8ZL7feY/AqRep88t8a8r7G
dcxKNOPqZ50yf9937S8Ct0h5gXbHp7EEZEMK2WBQ/ip9etBJFONn6JnD9Fr3YJmg
BeNfeAELD/BviJ3S5Z2y
=PtKg
-----END PGP SIGNATURE-----

--=-LaA4fr2TpfTftfT2nerr--

