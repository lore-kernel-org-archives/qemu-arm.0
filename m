Received: by 10.80.163.71 with SMTP id 65csp1010804edn;
        Mon, 12 Sep 2016 19:57:10 -0700 (PDT)
X-Received: by 10.200.56.72 with SMTP id r8mr10657354qtb.120.1473735430438;
        Mon, 12 Sep 2016 19:57:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h197si13736090qke.319.2016.09.12.19.57.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Sep 2016 19:57:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bjduI-0006yf-29
	for alex.bennee@linaro.org; Mon, 12 Sep 2016 22:57:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bjduC-0006wc-1i
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 22:57:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bjdu7-0004Y5-IM
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 22:57:03 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36166)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bjdu5-0004QR-8h; Mon, 12 Sep 2016 22:56:59 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id EF7332093D;
	Mon, 12 Sep 2016 22:56:44 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Mon, 12 Sep 2016 22:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=ruS1W
	zUBZ/oqFnLE0mG7sG/bdE8=; b=YRyCSIAsUxxk1U2PmQSs8wELHhHM1AQRalq+6
	bm0TdVq98cYXPQHysV5lgXr6NNu7TuZ6ec+CRpaHL7gVZ0CX/H3TdNQcCMPtphmA
	ShpY8KCRjDBqJZYCjeMpvBBjxnjdbfN5okRWXk6yL48d8YuGoGUgRIAP+o6OaA6q
	9+dd9U=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=ruS1WzUBZ/oqFnLE0mG7sG/bdE8=; b=OEhXo
	ipttr2NMeHDAFF6P+5G9biCQWhgkdIWs4+0CnwTWS3OXszVHM22omSzAFGdsKCkG
	ROPvwTF3meP1ODHRnQo+XYcH9OcLb50ZO1iCL/rwtg+gsCC06zAs8uKdF5ehiBt7
	+2hl7gGIkCXUXMmv5POVlheCrXQyRTtk6ljKEA=
X-Sasl-enc: OT+ki+PxNPkdDLqEsRgvMBGGD+W+kM8+/o1wEq7s6hw8 1473735404
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id C70F0CCE8C;
	Mon, 12 Sep 2016 22:56:42 -0400 (EDT)
Message-ID: <1473735399.10397.54.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Tue, 13 Sep 2016 12:26:39 +0930
In-Reply-To: <1473438177-26079-15-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
	<1473438177-26079-15-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-J2krPRSEbT67SZEoU2v8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH v5 14/14] aspeed: allocate RAM after the
 memory controller has checked the size
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
X-TUID: jdWBViFdPbPz


--=-J2krPRSEbT67SZEoU2v8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE2LTA5LTA5IGF0IDE4OjIyICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBJZiB0aGUgUkFNIHNpemUgaXMgaW52YWxpZCwgdGhlIG1lbW9yeSBjb250cm9sbGVyIHdp
bGwgdXNlIGEgZGVmYXVsdAo+IHZhbHVlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUg
R29hdGVyIDxjbGdAa2FvZC5vcmc+CgpSZXZpZXdlZC1ieTogQW5kcmV3IEplZmZlcnkgPGFuZHJl
d0Bhai5pZC5hdT4KCj4gLS0tCj4gwqBody9hcm0vYXNwZWVkLmMgfCAxOCArKysrKysrKysrKysr
LS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9ody9hcm0vYXNwZWVkLmMgYi9ody9hcm0vYXNwZWVkLmMKPiBp
bmRleCA1NjJiYmIyNTMzOTEuLjZiMThjN2YxNzI3YyAxMDA2NDQKPiAtLS0gYS9ody9hcm0vYXNw
ZWVkLmMKPiArKysgYi9ody9hcm0vYXNwZWVkLmMKPiBAQCAtMTA4LDExICsxMDgsNiBAQCBzdGF0
aWMgdm9pZCBhc3BlZWRfYm9hcmRfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUsCj4gwqAKPiDC
oMKgwqDCoMKgc2MgPSBBU1BFRURfU09DX0dFVF9DTEFTUygmYm1jLT5zb2MpOwo+IMKgCj4gLcKg
wqDCoMKgbWVtb3J5X3JlZ2lvbl9hbGxvY2F0ZV9zeXN0ZW1fbWVtb3J5KCZibWMtPnJhbSwgTlVM
TCwgInJhbSIsIHJhbV9zaXplKTsKPiAtwqDCoMKgwqBtZW1vcnlfcmVnaW9uX2FkZF9zdWJyZWdp
b24oZ2V0X3N5c3RlbV9tZW1vcnkoKSwgc2MtPmluZm8tPnNkcmFtX2Jhc2UsCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAm
Ym1jLT5yYW0pOwo+IC3CoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9hZGRfY29uc3RfbGluayhPQkpF
Q1QoJmJtYy0+c29jKSwgInJhbSIsIE9CSkVDVCgmYm1jLT5yYW0pLAo+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
JmVycm9yX2Fib3J0KTsKPiDCoMKgwqDCoMKgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNU
KCZibWMtPnNvYyksIHJhbV9zaXplLCAicmFtLXNpemUiLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJmVycm9yX2Fib3J0KTsKPiDCoMKg
wqDCoMKgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZibWMtPnNvYyksIGNmZy0+aHdf
c3RyYXAxLCAiaHctc3RyYXAxIiwKPiBAQCAtMTIwLDYgKzExNSwxOSBAQCBzdGF0aWMgdm9pZCBh
c3BlZWRfYm9hcmRfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUsCj4gwqDCoMKgwqDCoG9iamVj
dF9wcm9wZXJ0eV9zZXRfYm9vbChPQkpFQ1QoJmJtYy0+c29jKSwgdHJ1ZSwgInJlYWxpemVkIiwK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAmZXJyb3JfYWJvcnQpOwo+IMKgCj4gK8KgwqDCoMKgLyoKPiArwqDCoMKgwqDCoCogQWxs
b2NhdGUgUkFNIGFmdGVyIHRoZSBtZW1vcnkgY29udHJvbGxlciBoYXMgY2hlY2tlZCB0aGUgc2l6
ZQo+ICvCoMKgwqDCoMKgKiB3YXMgdmFsaWQuIElmIG5vdCwgYSBkZWZhdWx0IHZhbHVlIGlzIHVz
ZWQuCj4gK8KgwqDCoMKgwqAqLwo+ICvCoMKgwqDCoHJhbV9zaXplID0gb2JqZWN0X3Byb3BlcnR5
X2dldF9pbnQoT0JKRUNUKCZibWMtPnNvYyksICJyYW0tc2l6ZSIsCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCZlcnJvcl9hYm9ydCk7Cj4gKwo+ICvCoMKgwqDCoG1lbW9yeV9yZWdpb25fYWxsb2Nh
dGVfc3lzdGVtX21lbW9yeSgmYm1jLT5yYW0sIE5VTEwsICJyYW0iLCByYW1fc2l6ZSk7Cj4gK8Kg
wqDCoMKgbWVtb3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9uKGdldF9zeXN0ZW1fbWVtb3J5KCksIHNj
LT5pbmZvLT5zZHJhbV9iYXNlLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJmJtYy0+cmFtKTsKPiArwqDCoMKgwqBvYmpl
Y3RfcHJvcGVydHlfYWRkX2NvbnN0X2xpbmsoT0JKRUNUKCZibWMtPnNvYyksICJyYW0iLCBPQkpF
Q1QoJmJtYy0+cmFtKSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZlcnJvcl9hYm9ydCk7Cj4gKwo+IMKgwqDC
oMKgwqBhc3BlZWRfYm9hcmRfaW5pdF9mbGFzaGVzKCZibWMtPnNvYy5zbWMsICJuMjVxMjU2YSIs
ICZlcnJvcl9hYm9ydCk7Cj4gwqDCoMKgwqDCoGFzcGVlZF9ib2FyZF9pbml0X2ZsYXNoZXMoJmJt
Yy0+c29jLnNwaSwgIm14MjVsMjU2MzVlIiwgJmVycm9yX2Fib3J0KTsKPiDCoA==


--=-J2krPRSEbT67SZEoU2v8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX12rnAAoJEJ0dnzgO5LT5AnEP/A276dwVFMloqRzIQtPQ+uvY
qHuB+l7Q53lx9h4B8GWGDM+ML3yWyAqq7hR7QsRP+cw7nZrhbQlwQ5G377h9lcOL
K7SudeA26iju6okMKyzLQms+066HkQNFOpdyoY8Txfa7HrR3xXGMyMmk6IUaYmvC
tBBjvqeZIhrzPmyYAehJbZBkAeUF2Hp83O0x8WHIb2FomhcKgVuxw8XrNzqRQve1
f/iR9nzQeP4TAzPAqvrltmQh0IloIEpk92wyPpl/HiwoaAEGqIhGhGHB36OvYaDx
EGh7nzxCjg9w+2jkpRseMZPPR9HKASwfLQozSVuYZaF9YsAE7uX0HdNv85MCGz0Z
chZuzCz9wtA4I1rV8JYitKlrHD/CDj9HR2cbya6V8UHGVdGmDAhSaoLRTivtdNRf
IPz1ghMgNsUEkd4Q5/i4FjDqZXvGvqj9N+kktFZs0NVB8C8W0P8Pkg53jz1PiuCI
zx7mljSZAhZRIJ4zZ8cHuDpqSmyXWfqHsDzIHrh250LcIUtHmOlBWazgWED563GC
7upoWN0MzLvVYNgNluiQb6wIjaJBj6B5vA+NVlc0aSpyqlbqjKxLjbXUbrOUT2Ax
nJaB4ajLgwyrO1VzXWpN1CJtB2rfRcTAsqacxCnoVFH0k7AAJJH6B6MQMikpFr0i
xSW+jGyedeKh/mpJ61ar
=okQq
-----END PGP SIGNATURE-----

--=-J2krPRSEbT67SZEoU2v8--

