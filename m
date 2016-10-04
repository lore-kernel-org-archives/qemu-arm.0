Received: by 10.80.163.71 with SMTP id 65csp2382153edn;
        Tue, 4 Oct 2016 16:32:40 -0700 (PDT)
X-Received: by 10.200.58.135 with SMTP id x7mr5348026qte.93.1475623960539;
        Tue, 04 Oct 2016 16:32:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p190si4134235qke.206.2016.10.04.16.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 16:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brZCR-0008Pq-VL
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 19:32:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1brZCL-0008Nq-3w
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 19:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1brZCI-00065J-Ku
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 19:32:32 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1brZCG-000619-BE; Tue, 04 Oct 2016 19:32:30 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 91FC0209AB;
	Tue,  4 Oct 2016 19:32:17 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Tue, 04 Oct 2016 19:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=eYn93
	kz+zTJXk0oIyZYI8G5m8G8=; b=UmmWH1/hcO8gBfqdPWWlE0GOP5NQZI9dukyyp
	UMTpV5VINxVCxUQK8Q9WKGPC5DvFuhFjeSPdGV8kWA3pVT6Aw7iZsInFJpxfW1k/
	jke2WMtbuyMYR8koTi8bNU6yf7bDEhPuOFvOD+ps7tt7+lvW9Qg5xkDVJZhrz0je
	1U0z9Y=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=eYn93kz+zTJXk0oIyZYI8G5m8G8=; b=aMAWz
	bMqSY3csvOjYhF/ItQmxAIrdHlnDTI2bzUv0Lixr1wAb7ZE0byM3X4BQ5dQotw4b
	dd8fmNYa1h8IsP+nFKjqXSm2EgF+W71wtHu/T5Pjfoo4pDpBBsM7NNa+O5weSkzB
	Qd1n24U1v9LA72OrlzmNdDkfzBt+dDj1wmvYX8=
X-Sasl-enc: vOn56LD6HP5CF9qTRFS6Tpb51+wTnJHg5TSKpHmyZTuz 1475623936
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2E624F29CC;
	Tue,  4 Oct 2016 19:32:14 -0400 (EDT)
Message-ID: <1475623930.5030.5.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 05 Oct 2016 10:02:10 +1030
In-Reply-To: <1474977462-28032-4-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
	<1474977462-28032-4-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BQWNK+2xT2fa19WVx/iu"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH 3/6] aspeed: extend the number of host SPI
 controllers
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
X-TUID: 0kewicuX0pJX


--=-BQWNK+2xT2fa19WVx/iu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE2LTA5LTI3IGF0IDEzOjU3ICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBUaGUgQVNUMjUwMCBTb0MgaGFzIHR3by4gTGV0J3MgcHJlcGFyZSBncm91bmQgZm9yIHRo
ZSBuZXh0IGNoYW5nZXMKPiB3aGljaCB3aWxsIGFkZCB0aGUgcmVxdWlyZWQgZGVmaW5pdGlvbnMg
Zm9yIHRoZSBzZWNvbmQgaG9zdCBTUEkKPiBjb250cm9sbGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+CgpSZXZpZXdlZC1ieTogQW5kcmV3IEpl
ZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4KCj4gLS0tCj4gwqBody9hcm0vYXNwZWVkLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHzCoMKgMiArLQo+IMKgaHcvYXJtL2FzcGVlZF9zb2MuY8KgwqDC
oMKgwqDCoMKgwqDCoHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0KPiDCoGluY2x1ZGUvaHcvYXJtL2FzcGVlZF9zb2MuaCB8wqDCoDYgKysrKystCj4gwqAz
IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9ody9hcm0vYXNwZWVkLmMgYi9ody9hcm0vYXNwZWVkLmMKPiBpbmRleCA0YmIz
M2NiYjVlNzAuLmM3MjA2ZmRhNmQ4NSAxMDA2NDQKPiAtLS0gYS9ody9hcm0vYXNwZWVkLmMKPiAr
KysgYi9ody9hcm0vYXNwZWVkLmMKPiBAQCAtMTI5LDcgKzEyOSw3IEBAIHN0YXRpYyB2b2lkIGFz
cGVlZF9ib2FyZF9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSwKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAm
ZXJyb3JfYWJvcnQpOwo+IMKgCj4gwqDCoMKgwqDCoGFzcGVlZF9ib2FyZF9pbml0X2ZsYXNoZXMo
JmJtYy0+c29jLmZtYywgIm4yNXEyNTZhIiwgJmVycm9yX2Fib3J0KTsKPiAtwqDCoMKgwqBhc3Bl
ZWRfYm9hcmRfaW5pdF9mbGFzaGVzKCZibWMtPnNvYy5zcGksICJteDI1bDI1NjM1ZSIsICZlcnJv
cl9hYm9ydCk7Cj4gK8KgwqDCoMKgYXNwZWVkX2JvYXJkX2luaXRfZmxhc2hlcygmYm1jLT5zb2Mu
c3BpWzBdLCAibXgyNWwyNTYzNWUiLCAmZXJyb3JfYWJvcnQpOwo+IMKgCj4gwqDCoMKgwqDCoGFz
cGVlZF9ib2FyZF9iaW5mby5rZXJuZWxfZmlsZW5hbWUgPSBtYWNoaW5lLT5rZXJuZWxfZmlsZW5h
bWU7Cj4gwqDCoMKgwqDCoGFzcGVlZF9ib2FyZF9iaW5mby5pbml0cmRfZmlsZW5hbWUgPSBtYWNo
aW5lLT5pbml0cmRfZmlsZW5hbWU7Cj4gZGlmZiAtLWdpdCBhL2h3L2FybS9hc3BlZWRfc29jLmMg
Yi9ody9hcm0vYXNwZWVkX3NvYy5jCj4gaW5kZXggODBhZDczMjJiZGUyLi5iMzEwM2YzMzczNzQg
MTAwNjQ0Cj4gLS0tIGEvaHcvYXJtL2FzcGVlZF9zb2MuYwo+ICsrKyBiL2h3L2FybS9hc3BlZWRf
c29jLmMKPiBAQCAtMzcsMTAgKzM3LDE3IEBAIHN0YXRpYyBjb25zdCBpbnQgdGltZXJfaXJxc1td
ID0geyAxNiwgMTcsIDE4LCAzNSwgMzYsIDM3LCAzOCwgMzksIH07Cj4gwqAjZGVmaW5lIEFTVDI0
MDBfU0RSQU1fQkFTRcKgwqDCoMKgwqDCoMKgMHg0MDAwMDAwMAo+IMKgI2RlZmluZSBBU1QyNTAw
X1NEUkFNX0JBU0XCoMKgwqDCoMKgwqDCoDB4ODAwMDAwMDAKPiDCoAo+ICtzdGF0aWMgY29uc3Qg
aHdhZGRyIGFzcGVlZF9zb2NfYXN0MjQwMF9zcGlfYmFzZXNbXSA9IHsgQVNQRUVEX1NPQ19TUElf
QkFTRSB9Owo+ICsKPiArc3RhdGljIGNvbnN0IGh3YWRkciBhc3BlZWRfc29jX2FzdDI1MDBfc3Bp
X2Jhc2VzW10gPSB7IEFTUEVFRF9TT0NfU1BJX0JBU0UgfTsKPiArCj4gwqBzdGF0aWMgY29uc3Qg
QXNwZWVkU29DSW5mbyBhc3BlZWRfc29jc1tdID0gewo+IC3CoMKgwqDCoHsgImFzdDI0MDAtYTAi
LCAiYXJtOTI2IiwgQVNUMjQwMF9BMF9TSUxJQ09OX1JFViwgQVNUMjQwMF9TRFJBTV9CQVNFIH0s
Cj4gLcKgwqDCoMKgeyAiYXN0MjQwMCIswqDCoMKgwqAiYXJtOTI2IiwgQVNUMjQwMF9BMF9TSUxJ
Q09OX1JFViwgQVNUMjQwMF9TRFJBTV9CQVNFIH0sCj4gLcKgwqDCoMKgeyAiYXN0MjUwMC1hMSIs
ICJhcm0xMTc2IiwgQVNUMjUwMF9BMV9TSUxJQ09OX1JFViwgQVNUMjUwMF9TRFJBTV9CQVNFIH0s
Cj4gK8KgwqDCoMKgeyAiYXN0MjQwMC1hMCIsICJhcm05MjYiLCBBU1QyNDAwX0EwX1NJTElDT05f
UkVWLCBBU1QyNDAwX1NEUkFNX0JBU0UsCj4gK8KgwqDCoMKgwqDCoDEsIGFzcGVlZF9zb2NfYXN0
MjQwMF9zcGlfYmFzZXMgfSwKPiArwqDCoMKgwqB7ICJhc3QyNDAwIizCoMKgwqDCoCJhcm05MjYi
LCBBU1QyNDAwX0EwX1NJTElDT05fUkVWLCBBU1QyNDAwX1NEUkFNX0JBU0UsCj4gK8KgwqDCoMKg
wqDCoDEsIGFzcGVlZF9zb2NfYXN0MjQwMF9zcGlfYmFzZXMgfSwKPiArwqDCoMKgwqB7ICJhc3Qy
NTAwLWExIiwgImFybTExNzYiLCBBU1QyNTAwX0ExX1NJTElDT05fUkVWLCBBU1QyNTAwX1NEUkFN
X0JBU0UsCj4gK8KgwqDCoMKgwqDCoDEsIGFzcGVlZF9zb2NfYXN0MjUwMF9zcGlfYmFzZXMgfSwK
PiDCoH07Cj4gwqAKPiDCoC8qCj4gQEAgLTcyLDYgKzc5LDcgQEAgc3RhdGljIHZvaWQgYXNwZWVk
X3NvY19pbml0KE9iamVjdCAqb2JqKQo+IMKgewo+IMKgwqDCoMKgwqBBc3BlZWRTb0NTdGF0ZSAq
cyA9IEFTUEVFRF9TT0Mob2JqKTsKPiDCoMKgwqDCoMKgQXNwZWVkU29DQ2xhc3MgKnNjID0gQVNQ
RUVEX1NPQ19HRVRfQ0xBU1Mocyk7Cj4gK8KgwqDCoMKgaW50IGk7Cj4gwqAKPiDCoMKgwqDCoMKg
cy0+Y3B1ID0gY3B1X2FybV9pbml0KHNjLT5pbmZvLT5jcHVfbW9kZWwpOwo+IMKgCj4gQEAgLTEw
MSw5ICsxMDksMTEgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3NvY19pbml0KE9iamVjdCAqb2JqKQo+
IMKgwqDCoMKgwqBvYmplY3RfcHJvcGVydHlfYWRkX2NoaWxkKG9iaiwgImZtYyIsIE9CSkVDVCgm
cy0+Zm1jKSwgTlVMTCk7Cj4gwqDCoMKgwqDCoHFkZXZfc2V0X3BhcmVudF9idXMoREVWSUNFKCZz
LT5mbWMpLCBzeXNidXNfZ2V0X2RlZmF1bHQoKSk7Cj4gwqAKPiAtwqDCoMKgwqBvYmplY3RfaW5p
dGlhbGl6ZSgmcy0+c3BpLCBzaXplb2Yocy0+c3BpKSwgImFzcGVlZC5zbWMuc3BpIik7Cj4gLcKg
wqDCoMKgb2JqZWN0X3Byb3BlcnR5X2FkZF9jaGlsZChvYmosICJzcGkiLCBPQkpFQ1QoJnMtPnNw
aSksIE5VTEwpOwo+IC3CoMKgwqDCoHFkZXZfc2V0X3BhcmVudF9idXMoREVWSUNFKCZzLT5zcGkp
LCBzeXNidXNfZ2V0X2RlZmF1bHQoKSk7Cj4gK8KgwqDCoMKgZm9yIChpID0gMDsgaSA8IHNjLT5p
bmZvLT5zcGlzX251bTsgaSsrKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqBvYmplY3RfaW5pdGlhbGl6
ZSgmcy0+c3BpW2ldLCBzaXplb2Yocy0+c3BpW2ldKSwgImFzcGVlZC5zbWMuc3BpIik7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqBvYmplY3RfcHJvcGVydHlfYWRkX2NoaWxkKG9iaiwgInNwaSIsIE9CSkVD
VCgmcy0+c3BpW2ldKSwgTlVMTCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqBxZGV2X3NldF9wYXJlbnRf
YnVzKERFVklDRSgmcy0+c3BpW2ldKSwgc3lzYnVzX2dldF9kZWZhdWx0KCkpOwo+ICvCoMKgwqDC
oH0KPiDCoAo+IMKgwqDCoMKgwqBvYmplY3RfaW5pdGlhbGl6ZSgmcy0+c2RtYywgc2l6ZW9mKHMt
PnNkbWMpLCBUWVBFX0FTUEVFRF9TRE1DKTsKPiDCoMKgwqDCoMKgb2JqZWN0X3Byb3BlcnR5X2Fk
ZF9jaGlsZChvYmosICJzZG1jIiwgT0JKRUNUKCZzLT5zZG1jKSwgTlVMTCk7Cj4gQEAgLTExOCw2
ICsxMjgsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc29jX3JlYWxpemUoRGV2aWNlU3RhdGUgKmRl
diwgRXJyb3IgKiplcnJwKQo+IMKgewo+IMKgwqDCoMKgwqBpbnQgaTsKPiDCoMKgwqDCoMKgQXNw
ZWVkU29DU3RhdGUgKnMgPSBBU1BFRURfU09DKGRldik7Cj4gK8KgwqDCoMKgQXNwZWVkU29DQ2xh
c3MgKnNjID0gQVNQRUVEX1NPQ19HRVRfQ0xBU1Mocyk7Cj4gwqDCoMKgwqDCoEVycm9yICplcnIg
PSBOVUxMLCAqbG9jYWxfZXJyID0gTlVMTDsKPiDCoAo+IMKgwqDCoMKgwqAvKiBJTyBzcGFjZSAq
Lwo+IEBAIC0xOTAsMTYgKzIwMSwxOSBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc29jX3JlYWxpemUo
RGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHFkZXZfZ2V0X2dwaW9faW4oREVWSUNFKCZzLT52aWMp
LCAxOSkpOwo+IMKgCj4gwqDCoMKgwqDCoC8qIFNQSSAqLwo+IC3CoMKgwqDCoG9iamVjdF9wcm9w
ZXJ0eV9zZXRfaW50KE9CSkVDVCgmcy0+c3BpKSwgMSwgIm51bS1jcyIsICZlcnIpOwo+IC3CoMKg
wqDCoG9iamVjdF9wcm9wZXJ0eV9zZXRfYm9vbChPQkpFQ1QoJnMtPnNwaSksIHRydWUsICJyZWFs
aXplZCIsICZsb2NhbF9lcnIpOwo+IC3CoMKgwqDCoGVycm9yX3Byb3BhZ2F0ZSgmZXJyLCBsb2Nh
bF9lcnIpOwo+IC3CoMKgwqDCoGlmIChlcnIpIHsKPiAtwqDCoMKgwqDCoMKgwqDCoGVycm9yX3By
b3BhZ2F0ZShlcnJwLCBlcnIpOwo+IC3CoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+ICvCoMKgwqDC
oGZvciAoaSA9IDA7IGkgPCBzYy0+aW5mby0+c3Bpc19udW07IGkrKykgewo+ICvCoMKgwqDCoMKg
wqDCoMKgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNUKCZzLT5zcGlbaV0pLCAxLCAibnVt
LWNzIiwgJmVycik7Cj4gK8KgwqDCoMKgwqDCoMKgwqBvYmplY3RfcHJvcGVydHlfc2V0X2Jvb2wo
T0JKRUNUKCZzLT5zcGlbaV0pLCB0cnVlLCAicmVhbGl6ZWQiLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmbG9jYWxf
ZXJyKTsKPiArwqDCoMKgwqDCoMKgwqDCoGVycm9yX3Byb3BhZ2F0ZSgmZXJyLCBsb2NhbF9lcnIp
Owo+ICvCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBlcnJvcl9wcm9wYWdhdGUoZXJycCwgZXJyKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuOwo+ICvCoMKgwqDCoMKgwqDCoMKgfQo+ICvCoMKgwqDCoMKgwqDCoMKgc3lzYnVzX21t
aW9fbWFwKFNZU19CVVNfREVWSUNFKCZzLT5zcGlbaV0pLCAwLCBzYy0+aW5mby0+c3BpX2Jhc2Vz
W2ldKTsKPiArwqDCoMKgwqDCoMKgwqDCoHN5c2J1c19tbWlvX21hcChTWVNfQlVTX0RFVklDRSgm
cy0+c3BpW2ldKSwgMSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcy0+c3BpW2ldLmN0cmwtPmZsYXNoX3dpbmRvd19iYXNlKTsKPiDCoMKgwqDCoMKg
fQo+IC3CoMKgwqDCoHN5c2J1c19tbWlvX21hcChTWVNfQlVTX0RFVklDRSgmcy0+c3BpKSwgMCwg
QVNQRUVEX1NPQ19TUElfQkFTRSk7Cj4gLcKgwqDCoMKgc3lzYnVzX21taW9fbWFwKFNZU19CVVNf
REVWSUNFKCZzLT5zcGkpLCAxLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcy0+c3BpLmN0cmwtPmZsYXNoX3dpbmRvd19iYXNlKTsKPiDCoAo+IMKgwqDCoMKgwqAv
KiBTRE1DIC0gU0RSQU0gTWVtb3J5IENvbnRyb2xsZXIgKi8KPiDCoMKgwqDCoMKgb2JqZWN0X3By
b3BlcnR5X3NldF9ib29sKE9CSkVDVCgmcy0+c2RtYyksIHRydWUsICJyZWFsaXplZCIsICZlcnIp
Owo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2FybS9hc3BlZWRfc29jLmggYi9pbmNsdWRlL2h3
L2FybS9hc3BlZWRfc29jLmgKPiBpbmRleCA3MzU5ZTI1ZmNlNDkuLmYyNmE5ZjA0Mzk4MyAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2h3L2FybS9hc3BlZWRfc29jLmgKPiArKysgYi9pbmNsdWRlL2h3
L2FybS9hc3BlZWRfc29jLmgKPiBAQCAtMjAsNiArMjAsOCBAQAo+IMKgI2luY2x1ZGUgImh3L2ky
Yy9hc3BlZWRfaTJjLmgiCj4gwqAjaW5jbHVkZSAiaHcvc3NpL2FzcGVlZF9zbWMuaCIKPiDCoAo+
ICsjZGVmaW5lIEFTUEVFRF9TUElTX05VTcKgwqAyCj4gKwo+IMKgdHlwZWRlZiBzdHJ1Y3QgQXNw
ZWVkU29DU3RhdGUgewo+IMKgwqDCoMKgwqAvKjwgcHJpdmF0ZSA+Ki8KPiDCoMKgwqDCoMKgRGV2
aWNlU3RhdGUgcGFyZW50Owo+IEBAIC0zMiw3ICszNCw3IEBAIHR5cGVkZWYgc3RydWN0IEFzcGVl
ZFNvQ1N0YXRlIHsKPiDCoMKgwqDCoMKgQXNwZWVkSTJDU3RhdGUgaTJjOwo+IMKgwqDCoMKgwqBB
c3BlZWRTQ1VTdGF0ZSBzY3U7Cj4gwqDCoMKgwqDCoEFzcGVlZFNNQ1N0YXRlIGZtYzsKPiAtwqDC
oMKgwqBBc3BlZWRTTUNTdGF0ZSBzcGk7Cj4gK8KgwqDCoMKgQXNwZWVkU01DU3RhdGUgc3BpW0FT
UEVFRF9TUElTX05VTV07Cj4gwqDCoMKgwqDCoEFzcGVlZFNETUNTdGF0ZSBzZG1jOwo+IMKgfSBB
c3BlZWRTb0NTdGF0ZTsKPiDCoAo+IEBAIC00NCw2ICs0Niw4IEBAIHR5cGVkZWYgc3RydWN0IEFz
cGVlZFNvQ0luZm8gewo+IMKgwqDCoMKgwqBjb25zdCBjaGFyICpjcHVfbW9kZWw7Cj4gwqDCoMKg
wqDCoHVpbnQzMl90IHNpbGljb25fcmV2Owo+IMKgwqDCoMKgwqBod2FkZHIgc2RyYW1fYmFzZTsK
PiArwqDCoMKgwqBpbnQgc3Bpc19udW07Cj4gK8KgwqDCoMKgY29uc3QgaHdhZGRyICpzcGlfYmFz
ZXM7Cj4gwqB9IEFzcGVlZFNvQ0luZm87Cj4gwqAKPiDCoHR5cGVkZWYgc3RydWN0IEFzcGVlZFNv
Q0NsYXNzIHs=


--=-BQWNK+2xT2fa19WVx/iu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX9Dv6AAoJEJ0dnzgO5LT5xTsP/257VkJgqtJArHCxopvDSpJn
fsjmotWcW5PRsUNvuu6BfqOod2yUe5Dtutm46EkKYVS4g4Q/r/RP6FtPHXBZzQUL
97tY0KeNS56CsHQghjSQIdxcXeZpKsrQAcgAYW5ybYte6y7iZnnOO5zY5q5tEBmk
B2RFyZZj3RSWqq8YyFr/8eV5jDkU/fZ5zrH3k5aHyNWvfguIxZUhZj5I1wsW7iir
Xdl1p8IzmhRYJbCtNrpVRLQZPcK/150D27l9gM+aYadvRMGUiirE3HO6blYlw6Jz
J7UDjwgGtZMjCYkw5rJavFGQmr+A7DbGMt4+COPaaiDwr08VBqIBG/UGGOeBaZyg
Y5UfDV7g1YiJmYj5z8gIz+zdLElj4IaQZcHoaGrUfGdJ6zto5rdB0rhHzhIT1ufR
UrYS8pOuYPSo0dqBfCuCXSR0x1BBkEMu77JtQR17XrDah68ms6nAwPQW7Akk/xcJ
oFafThYmevwORip/qghzqjLd3X5aZOdSMkGNl7gIlC02rsazn6Pw5o1Z+QtcTyw/
TBXkQCcFKrPVUd/YniAPeVfvehOCco58qSlXaYDqXwj10c57o2waj66h5al+Fna5
GvGsPnGmNSH/Io15dqI5956zP57n3nEXrceeVzqpyKLf5AlF34DsdcwlDOrMKLaZ
JvTjFITOTKWE9YNMRCjh
=ryPv
-----END PGP SIGNATURE-----

--=-BQWNK+2xT2fa19WVx/iu--

