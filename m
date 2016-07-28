Received: by 10.25.21.156 with SMTP id 28csp557288lfv;
        Wed, 27 Jul 2016 19:14:45 -0700 (PDT)
X-Received: by 10.55.136.133 with SMTP id k127mr41853580qkd.0.1469672084979;
        Wed, 27 Jul 2016 19:14:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p87si3014607qkp.313.2016.07.27.19.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 19:14:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSaqS-0003IS-CU
	for alex.bennee@linaro.org; Wed, 27 Jul 2016 22:14:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSaqP-0003IN-Ef
	for qemu-arm@nongnu.org; Wed, 27 Jul 2016 22:14:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSaqM-0002el-3H
	for qemu-arm@nongnu.org; Wed, 27 Jul 2016 22:14:41 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:38403)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bSaqJ-0002b6-N9; Wed, 27 Jul 2016 22:14:38 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 0B1BE1251;
	Wed, 27 Jul 2016 22:14:23 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Wed, 27 Jul 2016 22:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=aX1yP
	20tbm0cpdQ1ZUKal7cQaV8=; b=FmiaOtm84Lb6mOJGTe7I8Z6yvqPDKMNpAn1GN
	p/AQvAQ2p9a16jHHpwcSj5XzhaU+lsrR8CFOfJ7xO67k4q2W4vI2owyDjzixAj/R
	6zfsTTQrCylUP7dfjVvkGVDIWXrKItAYXVasC9uMBJxFx8p8ThbO3eN8EqW4JRJh
	KkkPuk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=aX1yP20tbm0cpdQ1ZUKal7cQaV8=; b=VDq+6
	VNOmaC46jBreZ4ltGwkIKk6f3lPqOBEo4O20jAmqaTbfTwJ7NswqAf84/zOuPfN0
	0a/I3QQhgfPRg/McRsiUJX4MySnxGPH17gU6+g1TAnLORiFYj8ROLvUOcH0s+y36
	sx7bAXf6COLTMUS6qldDCww5o7RXYJvlKeNtcU=
X-Sasl-enc: +GWUr2adNOTNGxjvURjMkIa2CmZmkTw1oMMIFhQvOx6n 1469672061
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 70E9ECCD84;
	Wed, 27 Jul 2016 22:14:20 -0400 (EDT)
Message-ID: <1469672053.5468.81.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 11:44:13 +0930
In-Reply-To: <1469638018-17590-2-git-send-email-clg@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-2-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-akwGD7QZ157wrFtlAgOh"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: Re: [Qemu-arm] [PATCH 1/6] palmetto-bmc: add a "silicon-rev"
 property at the soc level
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
X-TUID: xXTRbxikqRQd


--=-akwGD7QZ157wrFtlAgOh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE2LTA3LTI3IGF0IDE4OjQ2ICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBUaGUgU0NVIGNvbnRyb2xlciBob2xkcyB0aGUgYm9hcmQgcmV2aXNpb24gbnVtYmVyIGlu
IGl0cyAweDdDCj4gcmVnaXN0ZXIuIExldCdzIHVzZSBhbiBhbGlhcyB0byBsaW5rIGEgInNpbGlj
b24tcmV2IiBwcm9wZXJ0eSBvZiB0aGUKPiBzb2MgdG8gdGhlICJzaWxpY29uLXJldiIgcHJvcGVy
dHkgb2YgdGhlIFNDVSBjb250cm9sZXIuCj4gCj4gVGhlIFNETUMgY29udHJvbGVyICJzaWxpY29u
LXJldiIgcHJvcGVydHkgaXMgZGVyaXZlZCBmcm9tIHRoZSBTQ1Ugb25lCj4gYXQgcmVhbGl6ZSB0
aW1lLiBJIGRpZCBub3QgZmluZCBhIGJldHRlciB3YXkgdG8gaGFuZGxlIHRoaXMgcGFydC4KPiBM
aW5rcyBhbmQgYWxpYXNlcyBiZWluZyBhIG9uZS10by1vbmUgcmVsYXRpb24sIEkgY291bGQgbm90
IHVzZSBvbmUgb2YKPiB0aGVtLiBJIG1pZ2h0IHdyb25nIHRob3VnaC4KCkFyZSB3ZSB0cnlpbmcg
dG8gb3Zlci11c2UgdGhlIHNpbGljb24tcmV2IHZhbHVlIChpdCB3b3VsZCBzZWVtIHNvIGF0Cmxl
YXN0IGluIHRoZSBmYWNlIG9mIHRoZSBsaW5rL2FsaWFzIGNvbnN0cmFpbnRzKT8gV2Uga25vdyB3
aGljaCBTRE1DCnJldmlzaW9uIHdlIG5lZWQgZm9yIGVhY2ggU29DIGFuZCB3ZSdsbCBiZSBtb2Rl
bGxpbmcgYW4gZXhwbGljaXQgU29DCnJldmlzaW9uLCBzbyBzaG91bGQgd2UgaW5zdGVhZCBzZXQg
YSBzZXBhcmF0ZSBwcm9wZXJ0eSBvbiB0aGUgU0RNQyBpbgp0aGUgU29DcycgcmVzcGVjdGl2ZSBp
bml0aWFsaXNlIGZ1bmN0aW9ucyAoYW5kIGxlYXZlIHNpbGljb24tcmV2IHRvIHRoZQpTQ1UpPyBN
eSB0aG91Z2h0IHdhcyB0aGUgc2lsaWNvbi1yZXYgdmFsdWUgaXMgcmVmbGVjdGl2ZSBvZiB0aGUg
U29DCmRlc2lnbiByYXRoZXIgdGhhbiB0aGUgb3RoZXIgd2F5IGFyb3VuZCAtIGJ1dCBtYXliZSB0
aGF0J3Mgc3BsaXR0aW5nCmhhaXJzLiBJdCB3b3VsZCBhbHNvIGJlIHRyYWRpbmcgb2ZmIGEgYml0
IG9mIHVnbGluZXNzIGluIHRoaXMgcGF0Y2ggZm9yCnBvdGVudGlhbCBidWdzIGlmIHRoZSBwcm9w
ZXJ0aWVzIGdldCBvdXQgb2Ygc3luYy4KCkNoZWVycywKCkFuZHJldwoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgo+IC0tLQo+IMKgaHcvYXJtL2Fz
dDI0MDAuY8KgwqDCoMKgwqDCoHwgMTggKysrKysrKysrKysrKy0tLS0tCj4gwqBody9hcm0vcGFs
bWV0dG8tYm1jLmMgfMKgwqAyICsrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2h3L2FybS9hc3QyNDAwLmMgYi9o
dy9hcm0vYXN0MjQwMC5jCj4gaW5kZXggMTM2YmY2NDY0ZTFkLi5mYTUzNTA2NWY3NjUgMTAwNjQ0
Cj4gLS0tIGEvaHcvYXJtL2FzdDI0MDAuYwo+ICsrKyBiL2h3L2FybS9hc3QyNDAwLmMKPiBAQCAt
ODQsOCArODQsOCBAQCBzdGF0aWMgdm9pZCBhc3QyNDAwX2luaXQoT2JqZWN0ICpvYmopCj4gwqDC
oMKgwqDCoG9iamVjdF9pbml0aWFsaXplKCZzLT5zY3UsIHNpemVvZihzLT5zY3UpLCBUWVBFX0FT
UEVFRF9TQ1UpOwo+IMKgwqDCoMKgwqBvYmplY3RfcHJvcGVydHlfYWRkX2NoaWxkKG9iaiwgInNj
dSIsIE9CSkVDVCgmcy0+c2N1KSwgTlVMTCk7Cj4gwqDCoMKgwqDCoHFkZXZfc2V0X3BhcmVudF9i
dXMoREVWSUNFKCZzLT5zY3UpLCBzeXNidXNfZ2V0X2RlZmF1bHQoKSk7Cj4gLcKgwqDCoMKgcWRl
dl9wcm9wX3NldF91aW50MzIoREVWSUNFKCZzLT5zY3UpLCAic2lsaWNvbi1yZXYiLAo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEFTVDI0MDBfQTBf
U0lMSUNPTl9SRVYpOwo+ICvCoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9hZGRfYWxpYXMob2JqLCAi
c2lsaWNvbi1yZXYiLCBPQkpFQ1QoJnMtPnNjdSksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJzaWxpY29uLXJldiIsICZlcnJv
cl9hYm9ydCk7Cj4gwqDCoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9hZGRfYWxpYXMob2JqLCAiaHct
c3RyYXAxIiwgT0JKRUNUKCZzLT5zY3UpLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgImh3LXN0cmFwMSIsICZlcnJvcl9hYm9y
dCk7Cj4gwqDCoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9hZGRfYWxpYXMob2JqLCAiaHctc3RyYXAy
IiwgT0JKRUNUKCZzLT5zY3UpLAo+IEBAIC0xMDIsOCArMTAyLDYgQEAgc3RhdGljIHZvaWQgYXN0
MjQwMF9pbml0KE9iamVjdCAqb2JqKQo+IMKgwqDCoMKgwqBvYmplY3RfaW5pdGlhbGl6ZSgmcy0+
c2RtYywgc2l6ZW9mKHMtPnNkbWMpLCBUWVBFX0FTUEVFRF9TRE1DKTsKPiDCoMKgwqDCoMKgb2Jq
ZWN0X3Byb3BlcnR5X2FkZF9jaGlsZChvYmosICJzZG1jIiwgT0JKRUNUKCZzLT5zZG1jKSwgTlVM
TCk7Cj4gwqDCoMKgwqDCoHFkZXZfc2V0X3BhcmVudF9idXMoREVWSUNFKCZzLT5zZG1jKSwgc3lz
YnVzX2dldF9kZWZhdWx0KCkpOwo+IC3CoMKgwqDCoHFkZXZfcHJvcF9zZXRfdWludDMyKERFVklD
RSgmcy0+c2RtYyksICJzaWxpY29uLXJldiIsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQVNUMjQwMF9BMF9TSUxJQ09OX1JFVik7Cj4gwqB9Cj4g
wqAKPiDCoHN0YXRpYyB2b2lkIGFzdDI0MDBfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJv
ciAqKmVycnApCj4gQEAgLTExMSw2ICsxMDksNyBAQCBzdGF0aWMgdm9pZCBhc3QyNDAwX3JlYWxp
emUoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQo+IMKgwqDCoMKgwqBpbnQgaTsKPiDC
oMKgwqDCoMKgQVNUMjQwMFN0YXRlICpzID0gQVNUMjQwMChkZXYpOwo+IMKgwqDCoMKgwqBFcnJv
ciAqZXJyID0gTlVMTCwgKmxvY2FsX2VyciA9IE5VTEw7Cj4gK8KgwqDCoMKgdWludDMyX3Qgc2ls
aWNvbl9yZXY7Cj4gwqAKPiDCoMKgwqDCoMKgLyogSU8gc3BhY2UgKi8KPiDCoMKgwqDCoMKgbWVt
b3J5X3JlZ2lvbl9pbml0X2lvKCZzLT5pb21lbSwgTlVMTCwgJmFzdDI0MDBfaW9fb3BzLCBOVUxM
LAo+IEBAIC0xOTIsNyArMTkxLDE2IEBAIHN0YXRpYyB2b2lkIGFzdDI0MDBfcmVhbGl6ZShEZXZp
Y2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApCj4gwqDCoMKgwqDCoHN5c2J1c19tbWlvX21hcChT
WVNfQlVTX0RFVklDRSgmcy0+c3BpKSwgMSwgQVNUMjQwMF9TUElfRkxBU0hfQkFTRSk7Cj4gwqAK
PiDCoMKgwqDCoMKgLyogU0RNQyAtIFNEUkFNIE1lbW9yeSBDb250cm9sbGVyICovCj4gLcKgwqDC
oMKgb2JqZWN0X3Byb3BlcnR5X3NldF9ib29sKE9CSkVDVCgmcy0+c2RtYyksIHRydWUsICJyZWFs
aXplZCIsICZlcnIpOwo+ICvCoMKgwqDCoHNpbGljb25fcmV2ID0gKHVpbnQzMl90KQo+ICvCoMKg
wqDCoMKgwqDCoMKgb2JqZWN0X3Byb3BlcnR5X2dldF9pbnQoT0JKRUNUKCZzLT5zY3UpLCAic2ls
aWNvbi1yZXYiLCAmZXJyKTsKPiArwqDCoMKgwqBpZiAoZXJyKSB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqBlcnJvcl9wcm9wYWdhdGUoZXJycCwgZXJyKTsKPiArwqDCoMKgwqDCoMKgwqDCoHJldHVybjsK
PiArwqDCoMKgwqB9Cj4gKwo+ICvCoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9zZXRfaW50KE9CSkVD
VCgmcy0+c2RtYyksIHNpbGljb25fcmV2LCAic2lsaWNvbi1yZXYiLCAmZXJyKTsKPiArwqDCoMKg
wqBvYmplY3RfcHJvcGVydHlfc2V0X2Jvb2woT0JKRUNUKCZzLT5zZG1jKSwgdHJ1ZSwgInJlYWxp
emVkIiwgJmxvY2FsX2Vycik7Cj4gK8KgwqDCoMKgZXJyb3JfcHJvcGFnYXRlKCZlcnIsIGxvY2Fs
X2Vycik7Cj4gwqDCoMKgwqDCoGlmIChlcnIpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqBlcnJvcl9w
cm9wYWdhdGUoZXJycCwgZXJyKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gZGlmZiAt
LWdpdCBhL2h3L2FybS9wYWxtZXR0by1ibWMuYyBiL2h3L2FybS9wYWxtZXR0by1ibWMuYwo+IGlu
ZGV4IDU0ZTI5YTg2NWQ4OC4uMWVlMTNkNTc4ODk5IDEwMDY0NAo+IC0tLSBhL2h3L2FybS9wYWxt
ZXR0by1ibWMuYwo+ICsrKyBiL2h3L2FybS9wYWxtZXR0by1ibWMuYwo+IEBAIC03NCw2ICs3NCw4
IEBAIHN0YXRpYyB2b2lkIHBhbG1ldHRvX2JtY19pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAmZXJyb3JfYWJvcnQpOwo+IMKgwqDCoMKgwqBvYmplY3RfcHJvcGVy
dHlfc2V0X2ludChPQkpFQ1QoJmJtYy0+c29jKSwgMHgxMjBDRTQxNiwgImh3LXN0cmFwMSIsCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCZlcnJvcl9hYm9ydCk7Cj4gK8KgwqDCoMKgb2JqZWN0X3Byb3BlcnR5X3NldF9pbnQoT0JKRUNU
KCZibWMtPnNvYyksIEFTVDI0MDBfQTBfU0lMSUNPTl9SRVYsCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgInNpbGljb24tcmV2IiwgJmVy
cm9yX2Fib3J0KTsKPiDCoMKgwqDCoMKgb2JqZWN0X3Byb3BlcnR5X3NldF9ib29sKE9CSkVDVCgm
Ym1jLT5zb2MpLCB0cnVlLCAicmVhbGl6ZWQiLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZlcnJvcl9hYm9ydCk7Cj4gwqA=


--=-akwGD7QZ157wrFtlAgOh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmWp1AAoJEJ0dnzgO5LT5cZEP/1utmuKIWiHuM/8DihvjxkCf
FPsqZ9vOuIr8erp/06o5Yqk9NZQW2he0+RINmbR692W1QT9hCObPb/HQIZ6i+okt
gnC5ddSpGsv3X47y1++6ail2Wljx5PSGV98UFmMfci1dHKGQMZBYXr2YTZngixno
SX2Smu6iqNyFFsPXgo07qKu0C4LsHjsbeh5iW2Yqfn/q5IvFcFob05WT0MhdqBLD
S2Y5U6S1vb13+p66Mc/OruTcJVF8wZSfj/jwMXgu/42aaIIpRTyPTN85NCitfikk
r008EWngsAJacbTht1N5WCzZZnpwCy1xjCBmZTV+i0Bw/sSxR+MgwxngH47hB7iD
IUDfllGIzQXRaJ1DUiaFJ2anAnBm567WyHTTCF0IYARnFUZUtfa3L+Jzre8GpW63
xDjqsa788T7PDAydQaYyo5v/Ta3ndayq0ZOhi3TW0pVcVWWYJtp+sqP3XwIMLaS8
K1H1JnkF6P3Pa0lPSVxYH9frFvWhICeqL7ER0dXLwE5YCtAYP10c3Uqnlu5fkmiE
AvvQnEy/vGhLmJ+e/E1WLOFZxIMN2utDrpGjJ1KnpiCUfvDpOFqXVSlibkisgc9K
YS3Bbx6PBQxOgkaHg2nGlatTqDwR0thwVUiFLJKDiaP1s3RXNdhqIZ6FVzzB95a4
8CHvuTZKgeY5uSgEjq6s
=I4ES
-----END PGP SIGNATURE-----

--=-akwGD7QZ157wrFtlAgOh--

