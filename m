Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp782863wrt;
        Mon, 11 Mar 2019 08:38:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz52MFjiYNy3ReNBylvM2r3dHm/rfvi88G4knCJjuJLSIM9U4CEsZv2LMyOVMy4+xNvG+uV
X-Received: by 2002:a25:be92:: with SMTP id i18mr10885346ybk.426.1552318719048;
        Mon, 11 Mar 2019 08:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552318719; cv=none;
        d=google.com; s=arc-20160816;
        b=e04IN/K7VfyLXtY8qI+hK57wDias38G883Vlg+MQiBr+f1pyrz4EhrMHu1SJip22Zf
         fa3esI1ldDyKsY5UMrdmPWdw6JEbkIlxCCCiOzn4PJruNDCkfwtpLlK73yCzz+SkaS3G
         zd6nC39xorQro9sMiEHoykbDzMAvKmsSBSpPAkCM+Pegp2+9qIJLoLp6Ou0louJtMyUd
         +veYGx3TAo9M0+jYw1KZPF6YgiaNo1EkA1zIXZmbivXD9FrylFweUvz/vNp01JqBX+cp
         UGSf89XgZbVagOKkwSqYP4liEpgR6LMxXZ8lHNLexugf5k/bPqyEdKU1j8pH6U90m3Bq
         910Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from;
        bh=fUkywvHFSr1/ybfXR/LPtaqFUrtY8/1BNVD64YIXFds=;
        b=OXEPQtVV40FovNfGbrx+0BYlUre+84iRL6zH8hCMiiMz6bVMzg9OhPMtTd/+/475//
         HPiiCfKvJHSp1F+CPvIgGKuzUQT5OVYh6cc/7f68aKlg+WT2olsReLpmzym2G3Vb9bWO
         Mc2tq4nEzheNOFmMIgBcnhn0JTfX/6T4xK2ycj8+RyiSEluFol9FGF7gEX5K5SiLFRSZ
         C7PaVB7EeDtluOdvx4+3t4OPrqg1D+3n0QqG3z10gKhR7EQStsJ+hAjKrKVGhEFOrQ35
         XiCrH28nlnP7BrviEq4hwzKGnXm9YdvOaSP4MBkczZEXsDN8SDOEfkSd1hr5SfIQNodo
         3HMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x128si3279167ybc.185.2019.03.11.08.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 08:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3N0g-0001CV-EN
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 11:38:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3Mw1-0005vi-2i
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 11:33:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h3MnH-0007qR-0p
	for qemu-devel@nongnu.org; Mon, 11 Mar 2019 11:24:48 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2488 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1h3MnF-0007oN-7t; Mon, 11 Mar 2019 11:24:45 -0400
Received: from DGGEMA404-HUB.china.huawei.com (unknown [172.30.72.57])
	by Forcepoint Email with ESMTP id 18671F414083C84ADC55;
	Mon, 11 Mar 2019 23:24:38 +0800 (CST)
Received: from DGGEMA523-MBX.china.huawei.com ([169.254.5.115]) by
	DGGEMA404-HUB.china.huawei.com ([10.3.20.45]) with mapi id
	14.03.0415.000; Mon, 11 Mar 2019 23:24:34 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [RESEND PATCH] target/arm: change arch timer registers access
	permission
Thread-Index: AdTYGYIM5QqfYxHeRXuAzVojhxHLjQAA1dHA
Date: Mon, 11 Mar 2019 15:24:33 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F202153AC7@dggema523-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.49.82]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.188
Subject: Re: [Qemu-devel] [RESEND PATCH] target/arm: change arch timer
 registers access permission
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MAPP4F9ezI8F

PiBIaSBQZXRlciwNCj4gICAgVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KPiANCj4gPiA+DQo+ID4g
PiBGcm9tOiBEb25naml1IEdlbmcgPGdlbmdkb25naml1QGh1YXdlaS5jb20+DQo+ID4gPg0KPiA+
ID4gU29tZSBnZW5lcmljIGFyY2ggdGltZXIgcmVnaXN0ZXJzIGFyZSBDb25maWctUlcgaW4gdGhl
IEVMMCwgd2hpY2gNCj4gPiA+IG1lYW5zIHRoZSBFTDAgZXhjZXB0aW9uIGxldmVsIGNhbiBoYXZl
IHdyaXRlIHBlcm1pc3Npb24gaWYgaXQgaXMNCj4gPiA+IGFwcHJvcHJpYXRlbHkgY29uZmlndXJl
ZC4NCj4gPiA+DQo+ID4gPiBXaGVuIFZNIGFjY2VzcyByZWdpc3RlcnMsIGl0IGZpcnN0bHkgY2hl
Y2tzIHdoZXRoZXIgdGhleSBoYXZlIFJXDQo+ID4gPiBwZXJtaXNzaW9uLCB0aGVuIGNoZWNrIHdo
ZXRoZXIgaXQgaXMgYXBwcm9wcmlhdGVseSBjb25maWd1cmVkLg0KPiA+ID4gSWYgdGhleSBhcmUg
ZGVmaW5lZCB0byBSZWFkeSBvbmx5IGluIEVMMCwgZXZlbiB0aG91Z2ggdGhleSBoYXZlIGJlZW4N
Cj4gPg0KPiA+ICJyZWFkIG9ubHkiID8NCj4gWWVzLCByZWFkIG9ubHkuDQo+IA0KPiA+DQo+ID4g
PiBhcHByb3ByaWF0ZWx5IGNvbmZpZ3VyZWQsIHRoZXkgc3RpbGwgZG8gbm90IGhhdmUgd3JpdGUg
cGVybWlzc2lvbi4NCj4gPiA+IFNvIG5lZWQgdG8gYWRkIHRoZSB3cml0ZSBwZXJtaXNzaW9uIGFj
Y29yZGluZyB0byBBUk1WOCBzcGVjIHdoZW4NCj4gPiA+IGRlZmluZSBpdC4NCj4gPiA+DQo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBEb25naml1IEdlbmcgPGdlbmdkb25naml1QGh1YXdlaS5jb20+DQo+
ID4NCj4gPiBZZXMsIHRoaXMgc2VlbXMgdG8gYmUgYSBidWcgd2hpY2ggaGFzIGJlZW4gcHJlc2Vu
dCBzaW5jZSBJIGFkZGVkIHRoZSBnZW5lcmljIHRpbWVyIHN1cHBvcnQgaW4gY29tbWl0IDU1ZDI4
NGFmOGUzMWIgaW4gMjAxMy4NCj4gPg0KPiA+IEknbSBub3Qgc3VyZSB3aHkgdGhlIGJ1ZyBpcyB0
aGVyZSAtLSBteSBiZXN0IGd1ZXNzIGlzIHRoYXQgSQ0KPiA+IGluY29ycmVjdGx5IGNvcGllZCB0
aGUgcGVybWlzc2lvbiBmbGFncyBmcm9tIHRoZSBDTlRGUlEgcmVnaXN0ZXIgKHdoaWNoIHJlYWxs
eSBpcyBSTyBmcm9tIFBMMCBidXQgUlcgZnJvbSBQTDEgYW5kIGFib3ZlKSB0byB0aGVzZSBvdGhl
cg0KPiByZWdpc3RlcnMgd2hpY2ggc2hvdWxkIGJlIGZ1bGx5IFJXIGZyb20gUEwwLg0KPiANCj4g
VGhlIGN1cnJlbnQgbG9naWMgaXMgc2hvdyBiZWxvd1sxXSwgaGFuZGxlX3N5cygpIHdpbGwgY2hl
Y2sgd2hldGhlciB0aGUgc3lzdGVtIHJlZ2lzdGVyIGhhdmUgd3JpdGUgcGVybWlzc2lvbiBpbiBQ
TDAsIGlmIGhhdmUsIHRoZW4gY2hlY2sNCj4gd2hldGhlciBJdCBoYXZlIGJlZW4gY29uZmlndXJl
ZCBpbiB0aGUgaGlnaCBQTHggYnkgcmktPmFjY2Vzc2ZuKCkuDQoNClNvIElmIFFFTVUgZGVmaW5l
ZCB0aGUgdGltZXIgcmVnaXN0ZXJzIHJlYWQgb25seSBpbiBQTDAsIGV2ZW4gdGhvdWdoIGl0IGhh
cyBiZWVuIGNvbmZpZ3VyZWQgdG8gaGF2ZSB3cml0ZSBwZXJtaXNzaW9uIGluIFBMMCBieSBoaWdo
IFBMeCwgd2Ugc3RpbGwgY2Fubm90IGhhdmUNCldyaXRlIHBlcm1pc3Npb24sIGJlY2F1c2UgUUVN
VSB3aWxsIGZpcnN0bHkgY2hlY2sgdGhlIGRlZmluZWQgcGVybWlzc2lvbiBhbmQgdGhlbiBjaGVj
ayB0aGUgY29uZmlndXJlZCBwZXJtaXNzaW9uIGJ5IGhpZ2ggUEx4Lg0KDQo+IA0KPiANCj4gWzFd
Og0KPiBoYW5kbGVfc3lzKCkNCj4gICAgIC0tLS0tLT4gY3BfYWNjZXNzX29rKHMtPmN1cnJlbnRf
ZWwsIHJpLCBpc3JlYWQpDQo+ICAgICAtLS0tLS0+IGdlbl9oZWxwZXJfYWNjZXNzX2NoZWNrX2Nw
X3JlZygpDQo+ICAgICAgICAgICAgLS0tLS0+cmktPmFjY2Vzc2ZuKCkNCj4gDQo+IFsyXToNCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gc3RhdGljIHZvaWQgaGFuZGxlX3N5cyhEaXNhc0NvbnRleHQgKnMsIHVpbnQzMl90
IGluc24sIGJvb2wgaXNyZWFkLA0KPiAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBvcDAsIHVuc2lnbmVkIGludCBvcDEsIHVuc2lnbmVkIGludCBvcDIsDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IGNybiwgdW5zaWduZWQgaW50IGNybSwgdW5zaWduZWQg
aW50IHJ0KSB7DQo+IA0KPiAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgICAgICAvKiBDaGVj
ayBhY2Nlc3MgcGVybWlzc2lvbnMgKi8NCj4gICAgIGlmICghY3BfYWNjZXNzX29rKHMtPmN1cnJl
bnRfZWwsIHJpLCBpc3JlYWQpKSB7DQo+ICAgICAgICAgdW5hbGxvY2F0ZWRfZW5jb2Rpbmcocyk7
DQo+ICAgICAgICAgcmV0dXJuOw0KPiAgICAgfQ0KPiANCj4gICAgIGlmIChyaS0+YWNjZXNzZm4p
IHsNCj4gICAgICAgICAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCj4gICAgICAgICBn
ZW5faGVscGVyX2FjY2Vzc19jaGVja19jcF9yZWcoY3B1X2VudiwgdG1wcHRyLCB0Y2dfc3luLCB0
Y2dfaXNyZWFkKTsNCj4gICAgICAgICAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCj4g
CX0NCj4gICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
fQ0KPiANCj4gDQo+IA0KPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2FybS9oZWxwZXIu
YyBiL3RhcmdldC9hcm0vaGVscGVyLmMgaW5kZXgNCj4gPiA+IDI2MDdkMzkuLjNkYjk0YzYgMTAw
NjQ0DQo+ID4gPiAtLS0gYS90YXJnZXQvYXJtL2hlbHBlci5jDQo+ID4gPiArKysgYi90YXJnZXQv
YXJtL2hlbHBlci5jDQo+ID4gPiBAQCAtMjY2NSw3ICsyNjY1LDcgQEAgc3RhdGljIGNvbnN0IEFS
TUNQUmVnSW5mbyBnZW5lcmljX3RpbWVyX2NwX3JlZ2luZm9bXSA9IHsNCj4gPiA+ICAgICAgLyog
cGVyLXRpbWVyIGNvbnRyb2wgKi8NCj4gPiA+ICAgICAgeyAubmFtZSA9ICJDTlRQX0NUTCIsIC5j
cCA9IDE1LCAuY3JuID0gMTQsIC5jcm0gPSAyLCAub3BjMSA9IDAsIC5vcGMyID0gMSwNCj4gPiA+
ICAgICAgICAuc2VjdXJlID0gQVJNX0NQX1NFQ1NUQVRFX05TLA0KPiA+ID4gLSAgICAgIC50eXBl
ID0gQVJNX0NQX0lPIHwgQVJNX0NQX0FMSUFTLCAuYWNjZXNzID0gUEwxX1JXIHwgUEwwX1IsDQo+
ID4gPiArICAgICAgLnR5cGUgPSBBUk1fQ1BfSU8gfCBBUk1fQ1BfQUxJQVMsIC5hY2Nlc3MgPSBQ
TDFfUlcgfCBQTDBfUlcsDQo+ID4NCj4gPiBUaGUgUEx4X3tSLFcsUld9IGNvbnN0YW50cyBhbGwg
aW1wbHkgYWNjZXNzIGlzIGFsc28gcG9zc2libGUgZnJvbSB0aGUgaGlnaGVyIFBMcywgc28gdGhp
cyBjYW4ganVzdCBiZSB3cml0dGVuICIuYWNjZXNzID0gUEwwX1JXIi4NCj4gDQo+IE9rLCBJIHdp
bGwgdXNlcyB5b3VyIHN1Z2dlc3RlZCBtZXRob2QgYW5kIHRvIHNlZSB3aGV0aGVyIGl0IGNhbiBi
ZSB3b3JrYWJsZS4NCj4gDQo+ID4NCj4gPiB0aGFua3MNCj4gPiAtLSBQTU0NCg==
