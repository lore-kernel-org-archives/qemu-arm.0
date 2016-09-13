Received: by 10.80.163.71 with SMTP id 65csp1010704edn;
        Mon, 12 Sep 2016 19:56:28 -0700 (PDT)
X-Received: by 10.55.119.197 with SMTP id s188mr8423789qkc.44.1473735388308;
        Mon, 12 Sep 2016 19:56:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id e34si13740662qkh.308.2016.09.12.19.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Sep 2016 19:56:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bjdtb-0006V0-Uo
	for alex.bennee@linaro.org; Mon, 12 Sep 2016 22:56:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bjdtX-0006UY-EO
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 22:56:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bjdtT-00048A-2d
	for qemu-arm@nongnu.org; Mon, 12 Sep 2016 22:56:22 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:42626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bjdtQ-00040n-Ou; Mon, 12 Sep 2016 22:56:19 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 77D2120928;
	Mon, 12 Sep 2016 22:56:04 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Mon, 12 Sep 2016 22:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=GaJ8D
	Hhp+zlu4Dv6jJKu2A66v1k=; b=YCyYs2w2FlU/w26dPaPjU0QjtV6gcy1Y/Nfli
	UdAnMoRw6bp8LxOLMbdomK6sti1bdgV9F483G6EE2MJ14ZCJi6lQwqeR/N9WhjVM
	XKSsZfenu3JF2yhXuPzMb1S7pKZHBC/5QDfPPTv4A+QXdmfHjTyh6OfkuPsgz8eg
	r3EXdI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=GaJ8DHhp+zlu4Dv6jJKu2A66v1k=; b=UHXJD
	aePyDVeG7XIY3qi32zO1nv1rEC3dtkNL6bAu7K3r451SjMgjt/StkODGwg4ggPjn
	QZFhX/ac22tlc7uvkA8Fuwgz1R/ojy9LOLymzKKhI0n8YL4AixZnDb9jYaWhkIop
	iK+jZacsqzal1SghS6fXLZ6iiUQ+2S+wJQoUHg=
X-Sasl-enc: SQ2drSY0I9jitx2ijZxKFtdH67i/k52mHmU19abTTR4C 1473735363
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2660BCCE98;
	Mon, 12 Sep 2016 22:56:01 -0400 (EDT)
Message-ID: <1473735358.10397.53.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Tue, 13 Sep 2016 12:25:58 +0930
In-Reply-To: <1473438177-26079-14-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
	<1473438177-26079-14-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-WEA2on2V/AnRwIPMWOQe"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH v5 13/14] aspeed: add a ram_size property to
 the memory controller
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
X-TUID: MxtnaN+I79Rj


--=-WEA2on2V/AnRwIPMWOQe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE2LTA5LTA5IGF0IDE4OjIyICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBDb25maWd1cmUgdGhlIHNpemUgb2YgdGhlIFJBTSBvZiB0aGUgU09DIHVzaW5nIGEgcHJv
cGVydHkgdG8gcHJvcGFnYXRlCj4gdGhlIHZhbHVlIGRvd24gdG8gdGhlIG1lbW9yeSBjb250cm9s
bGVyIGZyb20gdGhlIGJvYXJkIGxldmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUg
R29hdGVyIDxjbGdAa2FvZC5vcmc+CgpSZXZpZXdlZC1ieTogQW5kcmV3IEplZmZlcnkgPGFuZHJl
d0Bhai5pZC5hdT4KCj4gLS0tCj4gwqBody9hcm0vYXNwZWVkLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB8wqDCoDIgKysKPiDCoGh3L2FybS9hc3BlZWRfc29jLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgfMKgwqAyICsrCj4gwqBody9taXNjL2FzcGVlZF9zZG1jLmPCoMKgwqDCoMKgwqDC
oMKgwqB8IDIzICsrKysrKysrKysrKystLS0tLS0tLS0tCj4gwqBpbmNsdWRlL2h3L21pc2MvYXNw
ZWVkX3NkbWMuaCB8wqDCoDEgKwo+IMKgNCBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZC5jIGIvaHcv
YXJtL2FzcGVlZC5jCj4gaW5kZXggOTAxM2QzNWE2NzRjLi41NjJiYmIyNTMzOTEgMTAwNjQ0Cj4g
LS0tIGEvaHcvYXJtL2FzcGVlZC5jCj4gKysrIGIvaHcvYXJtL2FzcGVlZC5jCj4gQEAgLTExMyw2
ICsxMTMsOCBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfYm9hcmRfaW5pdChNYWNoaW5lU3RhdGUgKm1h
Y2hpbmUsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgJmJtYy0+cmFtKTsKPiDCoMKgwqDCoMKgb2JqZWN0X3Byb3BlcnR5
X2FkZF9jb25zdF9saW5rKE9CSkVDVCgmYm1jLT5zb2MpLCAicmFtIiwgT0JKRUNUKCZibWMtPnJh
bSksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgJmVycm9yX2Fib3J0KTsKPiArwqDCoMKgwqBvYmplY3RfcHJv
cGVydHlfc2V0X2ludChPQkpFQ1QoJmJtYy0+c29jKSwgcmFtX3NpemUsICJyYW0tc2l6ZSIsCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZl
cnJvcl9hYm9ydCk7Cj4gwqDCoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9zZXRfaW50KE9CSkVDVCgm
Ym1jLT5zb2MpLCBjZmctPmh3X3N0cmFwMSwgImh3LXN0cmFwMSIsCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZlcnJvcl9hYm9ydCk7
Cj4gwqDCoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9zZXRfYm9vbChPQkpFQ1QoJmJtYy0+c29jKSwg
dHJ1ZSwgInJlYWxpemVkIiwKPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZF9zb2MuYyBiL2h3
L2FybS9hc3BlZWRfc29jLmMKPiBpbmRleCA5M2JjN2JiNjZlNGIuLmMwYTMxMDIwNTg0MiAxMDA2
NDQKPiAtLS0gYS9ody9hcm0vYXNwZWVkX3NvYy5jCj4gKysrIGIvaHcvYXJtL2FzcGVlZF9zb2Mu
Ywo+IEBAIC0xMTMsNiArMTEzLDggQEAgc3RhdGljIHZvaWQgYXNwZWVkX3NvY19pbml0KE9iamVj
dCAqb2JqKQo+IMKgwqDCoMKgwqBxZGV2X3NldF9wYXJlbnRfYnVzKERFVklDRSgmcy0+c2RtYyks
IHN5c2J1c19nZXRfZGVmYXVsdCgpKTsKPiDCoMKgwqDCoMKgcWRldl9wcm9wX3NldF91aW50MzIo
REVWSUNFKCZzLT5zZG1jKSwgInNpbGljb24tcmV2IiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2MtPmluZm8tPnNpbGljb25fcmV2KTsKPiAr
wqDCoMKgwqBvYmplY3RfcHJvcGVydHlfYWRkX2FsaWFzKG9iaiwgInJhbS1zaXplIiwgT0JKRUNU
KCZzLT5zZG1jKSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgInJhbS1zaXplIiwgJmVycm9yX2Fib3J0KTsKPiDCoH0KPiDCoAo+
IMKgc3RhdGljIHZvaWQgYXNwZWVkX3NvY19yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9y
ICoqZXJycCkKPiBkaWZmIC0tZ2l0IGEvaHcvbWlzYy9hc3BlZWRfc2RtYy5jIGIvaHcvbWlzYy9h
c3BlZWRfc2RtYy5jCj4gaW5kZXggMjBiY2RiNTJjNGRmLi44ODMwZGMwODRjMzggMTAwNjQ0Cj4g
LS0tIGEvaHcvbWlzYy9hc3BlZWRfc2RtYy5jCj4gKysrIGIvaHcvbWlzYy9hc3BlZWRfc2RtYy5j
Cj4gQEAgLTE0MCw5ICsxNDAsOSBAQCBzdGF0aWMgY29uc3QgTWVtb3J5UmVnaW9uT3BzIGFzcGVl
ZF9zZG1jX29wcyA9IHsKPiDCoMKgwqDCoMKgLnZhbGlkLm1heF9hY2Nlc3Nfc2l6ZSA9IDQsCj4g
wqB9Owo+IMKgCj4gLXN0YXRpYyBpbnQgYXN0MjQwMF9yYW1iaXRzKHZvaWQpCj4gK3N0YXRpYyBp
bnQgYXN0MjQwMF9yYW1iaXRzKEFzcGVlZFNETUNTdGF0ZSAqcykKPiDCoHsKPiAtwqDCoMKgwqBz
d2l0Y2ggKHJhbV9zaXplID4+IDIwKSB7Cj4gK8KgwqDCoMKgc3dpdGNoIChzLT5yYW1fc2l6ZSA+
PiAyMCkgewo+IMKgwqDCoMKgwqBjYXNlIDY0Ogo+IMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBB
U1BFRURfU0RNQ19EUkFNXzY0TUI7Cj4gwqDCoMKgwqDCoGNhc2UgMTI4Ogo+IEBAIC0xNTYsMTQg
KzE1NiwxNSBAQCBzdGF0aWMgaW50IGFzdDI0MDBfcmFtYml0cyh2b2lkKQo+IMKgwqDCoMKgwqB9
Cj4gwqAKPiDCoMKgwqDCoMKgLyogdXNlIGEgY29tbW9uIGRlZmF1bHQgKi8KPiAtwqDCoMKgwqBl
cnJvcl9yZXBvcnQoIndhcm5pbmc6IEludmFsaWQgUkFNIHNpemUgMHgiIFJBTV9BRERSX0ZNVAo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIi4gVXNpbmcgZGVmYXVsdCAyNTZN
IiwgcmFtX3NpemUpOwo+ICvCoMKgwqDCoGVycm9yX3JlcG9ydCgid2FybmluZzogSW52YWxpZCBS
QU0gc2l6ZSAweCUiIFBSSXg2NAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Ii4gVXNpbmcgZGVmYXVsdCAyNTZNIiwgcy0+cmFtX3NpemUpOwo+ICvCoMKgwqDCoHMtPnJhbV9z
aXplID0gMjU2IDw8IDIwOwo+IMKgwqDCoMKgwqByZXR1cm4gQVNQRUVEX1NETUNfRFJBTV8yNTZN
QjsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgaW50IGFzdDI1MDBfcmFtYml0cyh2b2lkKQo+ICtzdGF0
aWMgaW50IGFzdDI1MDBfcmFtYml0cyhBc3BlZWRTRE1DU3RhdGUgKnMpCj4gwqB7Cj4gLcKgwqDC
oMKgc3dpdGNoIChyYW1fc2l6ZSA+PiAyMCkgewo+ICvCoMKgwqDCoHN3aXRjaCAocy0+cmFtX3Np
emUgPj4gMjApIHsKPiDCoMKgwqDCoMKgY2FzZSAxMjg6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIEFTUEVFRF9TRE1DX0FTVDI1MDBfMTI4TUI7Cj4gwqDCoMKgwqDCoGNhc2UgMjU2Ogo+IEBA
IC0xNzcsOCArMTc4LDkgQEAgc3RhdGljIGludCBhc3QyNTAwX3JhbWJpdHModm9pZCkKPiDCoMKg
wqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoC8qIHVzZSBhIGNvbW1vbiBkZWZhdWx0ICovCj4gLcKg
wqDCoMKgZXJyb3JfcmVwb3J0KCJ3YXJuaW5nOiBJbnZhbGlkIFJBTSBzaXplIDB4IiBSQU1fQURE
Ul9GTVQKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCIuIFVzaW5nIGRlZmF1
bHQgNTEyTSIsIHJhbV9zaXplKTsKPiArwqDCoMKgwqBlcnJvcl9yZXBvcnQoIndhcm5pbmc6IElu
dmFsaWQgUkFNIHNpemUgMHglIiBQUkl4NjQKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCIuIFVzaW5nIGRlZmF1bHQgNTEyTSIsIHMtPnJhbV9zaXplKTsKPiArwqDCoMKgwqBz
LT5yYW1fc2l6ZSA9IDUxMiA8PCAyMDsKPiDCoMKgwqDCoMKgcmV0dXJuIEFTUEVFRF9TRE1DX0FT
VDI1MDBfNTEyTUI7Cj4gwqB9Cj4gwqAKPiBAQCAtMjIyLDExICsyMjQsMTEgQEAgc3RhdGljIHZv
aWQgYXNwZWVkX3NkbWNfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApCj4g
wqAKPiDCoMKgwqDCoMKgc3dpdGNoIChzLT5zaWxpY29uX3Jldikgewo+IMKgwqDCoMKgwqBjYXNl
IEFTVDI0MDBfQTBfU0lMSUNPTl9SRVY6Cj4gLcKgwqDCoMKgwqDCoMKgwqBzLT5yYW1fYml0cyA9
IGFzdDI0MDBfcmFtYml0cygpOwo+ICvCoMKgwqDCoMKgwqDCoMKgcy0+cmFtX2JpdHMgPSBhc3Qy
NDAwX3JhbWJpdHMocyk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gwqDCoMKgwqDCoGNh
c2UgQVNUMjUwMF9BMF9TSUxJQ09OX1JFVjoKPiDCoMKgwqDCoMKgY2FzZSBBU1QyNTAwX0ExX1NJ
TElDT05fUkVWOgo+IC3CoMKgwqDCoMKgwqDCoMKgcy0+cmFtX2JpdHMgPSBhc3QyNTAwX3JhbWJp
dHMoKTsKPiArwqDCoMKgwqDCoMKgwqDCoHMtPnJhbV9iaXRzID0gYXN0MjUwMF9yYW1iaXRzKHMp
Owo+IMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKgwqDCoMKgwqBkZWZhdWx0Ogo+IMKgwqDC
oMKgwqDCoMKgwqDCoGdfYXNzZXJ0X25vdF9yZWFjaGVkKCk7Cj4gQEAgLTI0OSw2ICsyNTEsNyBA
QCBzdGF0aWMgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uIHZtc3RhdGVfYXNwZWVkX3NkbWMgPSB7
Cj4gwqAKPiDCoHN0YXRpYyBQcm9wZXJ0eSBhc3BlZWRfc2RtY19wcm9wZXJ0aWVzW10gPSB7Cj4g
wqDCoMKgwqDCoERFRklORV9QUk9QX1VJTlQzMigic2lsaWNvbi1yZXYiLCBBc3BlZWRTRE1DU3Rh
dGUsIHNpbGljb25fcmV2LCAwKSwKPiArwqDCoMKgwqBERUZJTkVfUFJPUF9VSU5UNjQoInJhbS1z
aXplIiwgQXNwZWVkU0RNQ1N0YXRlLCByYW1fc2l6ZSwgMCksCj4gwqDCoMKgwqDCoERFRklORV9Q
Uk9QX0VORF9PRl9MSVNUKCksCj4gwqB9Owo+IMKgCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcv
bWlzYy9hc3BlZWRfc2RtYy5oIGIvaW5jbHVkZS9ody9taXNjL2FzcGVlZF9zZG1jLmgKPiBpbmRl
eCBkZjdkY2UwZWRkZGYuLjU1MWM4YWZkZjRiZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2h3L21p
c2MvYXNwZWVkX3NkbWMuaAo+ICsrKyBiL2luY2x1ZGUvaHcvbWlzYy9hc3BlZWRfc2RtYy5oCj4g
QEAgLTI2LDYgKzI2LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgQXNwZWVkU0RNQ1N0YXRlIHsKPiDCoMKg
wqDCoMKgdWludDMyX3QgcmVnc1tBU1BFRURfU0RNQ19OUl9SRUdTXTsKPiDCoMKgwqDCoMKgdWlu
dDMyX3Qgc2lsaWNvbl9yZXY7Cj4gwqDCoMKgwqDCoHVpbnQzMl90IHJhbV9iaXRzOwo+ICvCoMKg
wqDCoHVpbnQ2NF90IHJhbV9zaXplOwo+IMKgCj4gwqB9IEFzcGVlZFNETUNTdGF0ZTsKPiDCoA==


--=-WEA2on2V/AnRwIPMWOQe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX12q+AAoJEJ0dnzgO5LT5JMwP/1nPMjaJ2e2S84r2ClK8uI2u
C94ZddAUHD2LkDHDK9Q4dPM1QU7U0hO6OErFYT0iVk6xUrdCqyZ67rGO0HJ9dOh8
IP79ZJDF+DsA0GmO0fpfFVBM703O4DkVCvNNr4CAhdXW+LUdOZzb5Qe4S5FquB58
CoKeOIgaTzk4ab5eOOuM50yfBOl8WDY4d/8Lb1bG5nVct1frLlfLTJe2U6RuLOiG
UFS0tE/NnvH3kRu+Y6FHU0/f2zNr3LdJtMygVdh+9xSIl0fd6pK45GCEtny4UszP
0C37K9Rzx9Wi+WsavF36QUGe/DZrYyNposRR1j4D4qc14wkW8Cznm4gG/bib0Lb7
a9QbMhFsi5LLkVACBn071H4TALuRPDnMs8Uef7feOkoD7G9hpO77bw4cZ76ICNtu
CQ8HXFxbJLXvKrCvrtIaH9LWSaP5MG/gvlB85EHAn4oeM4cdH625posBMSbimrWZ
Se8RvlWcEP0rJzUiqwODvZ4SL5aANeafekbgJuzjlJZM9H5rh7D+G8uwCdsq2TZ5
t0of/cJdp3/WTYpVqoAnZUC0umRYVB7X7vIr74U9IKQbmC6jho5t/t7gZlkbPn6h
p9q8u7S6RDZ9AWnVb5aMtBIx2Tih7RfGtye2WF5bRBZl06FiNUtZa25SlH4SUvjg
JmiNZxp62wLQJAgMhYM+
=mztZ
-----END PGP SIGNATURE-----

--=-WEA2on2V/AnRwIPMWOQe--

