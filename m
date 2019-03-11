Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp903529wrt;
        Mon, 11 Mar 2019 10:38:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3H52ioT/ZMBp5htgwyC1AB4qqzonT097cZc2otnN2JiU0PvVjFrHTS4MBTCtSdpWx1KuA
X-Received: by 2002:a25:c804:: with SMTP id y4mr28914889ybf.429.1552325909069;
        Mon, 11 Mar 2019 10:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552325909; cv=none;
        d=google.com; s=arc-20160816;
        b=TddTLucM3G/AtZHk4uZsQfnMievdguops35wkOLeRai0SogiySNn/9BYCM+1Z/XzxJ
         2AkS6o1jWrmffFDkR0MMu07NR6w8JgoK6DmrRUCRUV5N0dUsCmVe1YssaSPTpvisvWKk
         CwL6pB3yyNn1L9LzaMD+OFflWpEjezRyyoxkM2oYP2wfjHOE9v+wFcktjP0CND6fP/He
         hl00oufgmEQ/T1oJS1b1z8wp6OIINlBIyFfwKEG5ErxrYnyysKggcCx7z9rYYH7yfgna
         Z7Ikzme0Zi5gRdMRA6M36J1Eu0n+CF0c/60UgQxipF16wYz/utvufNoQSd0fReAMnh0x
         uo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=KH+aUiAjVhVzj6Ue4tGD+ZSqtsVdKw80Kg3uB4nnuLw=;
        b=BxDvQlLXtxJR+i4MKZrtJuZ7liz+1XUmkTtZwZpOlOHRGAhe1qgxkz6j6xlLAr53lX
         LO3eN5hs9Kt3+cIkJmK6Wf0XigTZvvKblVRQsALLcGCnEo2BjmI3RaMlVXknk3+V+x9s
         nqdBUOiIvS6+LdMSv0ZOQUbkXqf/FPn/i893KQ1DeIeJp0vgx1BvMRM9+bR+OIDKGwzR
         auiYWMe7zXWIJ8ffKrph3X4MFOnYkcOXhLWszctK7Bjbhs6g6nts0Urb/W/kIZMguHMd
         yMrllhtDAfjX8Y1RNLgucO4fQ+PEZWTlXXOzd06NbQjAxLiq2RtUCM6GkaxtjpcO5a66
         rk6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a187si3492325ywf.296.2019.03.11.10.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 10:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:37436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3Ose-0007yt-Eq
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 13:38:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3OsO-0007s0-Ek
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 13:38:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3Orw-0007pU-Sv
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 13:37:46 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45361 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3Orw-0007oh-JB; Mon, 11 Mar 2019 13:37:44 -0400
Received: from lhreml706-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id B175D4FEBC22E365667B;
	Mon, 11 Mar 2019 17:37:43 +0000 (GMT)
Received: from LHREML524-MBB.china.huawei.com ([169.254.3.135]) by
	lhreml706-cah.china.huawei.com ([10.201.108.47]) with mapi id
	14.03.0415.000; Mon, 11 Mar 2019 17:37:33 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "shannon.zhaosl@gmail.com"
	<shannon.zhaosl@gmail.com>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>, 
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Thread-Topic: [PATCH v2 06/11] hw/arm/virt: Add ACPI support for device
	memory cold-plug
Thread-Index: AQHU2A7uVX2vHAOWLkqNUk+ZTfOJNqYGr7dg
Date: Mon, 11 Mar 2019 17:37:33 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839304E27@lhreml524-mbb.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-7-shameerali.kolothum.thodi@huawei.com>
	<3c656ef1-a58e-6461-254e-140976b01d4e@redhat.com>
In-Reply-To: <3c656ef1-a58e-6461-254e-140976b01d4e@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [PATCH v2 06/11] hw/arm/virt: Add ACPI support for
 device memory cold-plug
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
Cc: Linuxarm <linuxarm@huawei.com>, "xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pDjxnqIPdA9R

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVnZXIgRXJpYyBbbWFp
bHRvOmVyaWMuYXVnZXJAcmVkaGF0LmNvbV0NCj4gU2VudDogMTEgTWFyY2ggMjAxOSAxMzozMg0K
PiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9k
aUBodWF3ZWkuY29tPjsNCj4gcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFybUBub25nbnUu
b3JnOyBpbWFtbWVkb0ByZWRoYXQuY29tOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHNo
YW5ub24uemhhb3NsQGdtYWlsLmNvbTsNCj4gc2FtZW9AbGludXguaW50ZWwuY29tOyBzZWJhc3Rp
ZW4uYm9ldWZAaW50ZWwuY29tDQo+IENjOiBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT47
IHh1d2VpIChPKSA8eHV3ZWk1QGh1YXdlaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MDYvMTFdIGh3L2FybS92aXJ0OiBBZGQgQUNQSSBzdXBwb3J0IGZvciBkZXZpY2UNCj4gbWVtb3J5
IGNvbGQtcGx1Zw0KPiANCj4gSGkgU2hhbWVlciwNCj4gDQo+IE9uIDMvOC8xOSAxMjo0MiBQTSwg
U2hhbWVlciBLb2xvdGh1bSB3cm90ZToNCj4gPiBUaGlzIGFkZHMgc3VwcG9ydCB0byBidWlsZCB0
aGUgYW1sIGNvZGUgc28gdGhhdCBHdWVzdCBjYW4gc2VlIHRoZQ0KPiBzL0d1ZXN0L3RoZSBndWVz
dA0KPiA+IGNvbGQtcGx1Z2dlZCBkZXZpY2UgbWVtb3J5Lg0KPiANCj4gSXNuJ3QgdGhlIGNvbHBs
dWcgcGFydCBvbmx5IHJlbGF0ZWQgdG8gYWNwaV9kc2R0X2FkZF9tZW1vcnlfaG90cGx1ZygpPyBJ
DQo+IHVuZGVyc3RhbmQgdGhlIHBhdGNoIGFsc28gYWRkcyBzb21lIGhvdHBsdWcgaW5mcmE/DQoN
CkhtbS4uYnVpbGRfbWVtb3J5X2hvdHBsdWdfYW1sKCkgZG9lc27igJl0IGRvIG11Y2ggaWYgaW9f
YmFzZSBhZGRyZXNzDQpJcyBub3QgaW5pdGlhbGl6ZWQuIFNvIHdlIG5lZWQgdGhlIGFjcGlfbWVt
b3J5X2hvdHBsdWdfaW5pdCgpLg0KDQpBbHNvLCBJIHRoaW5rIGFjcGlfbWVtb3J5X3BsdWdfY2Io
KSBuZWVkcyB0byBiZSBjYWxsZWQgZm9yIGNvbGQtcGx1Z2dlZCBkaW1tDQpvdGhlcndpc2UgdGhl
IHNjYW4gd29udCBkZXRlY3QgaXQuDQogDQo+IENhbid0IHlvdSBqdXN0IGtlZXJwIHRoZSBkc2R0
IGFkZGl0aW9ucyBoZXJlLCBtb3ZlIHRoZSB2aXJ0LWFjcGkgY2hhbmdlcw0KPiBpbiB0aGUgb3Jp
Z2luYWwgcGF0Y2ggYW5kIG1vdmUgdGhlIHZpcnQtYWNwaSBpbnN0YW50aWF0aW9uIGluIGENCj4g
c3Vic2VxdWVudCBwYXRjaD8NCg0KT2ssIHdpbGwgdGFrZSBsb29rIGlmIHRoZXJlIGlzIGFueSBz
Y29wZSBmb3IgcmVvcmRlcmluZyB0aGlzLg0KDQpUaGFua3MsDQpTaGFtZWVyDQogDQo+IFRoYW5r
cw0KPiANCj4gRXJpYw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2hhbWVlciBLb2xvdGh1bSA8
c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tPg0KPiA+IC0tLQ0KPiA+ICBkZWZh
dWx0LWNvbmZpZ3MvYXJtLXNvZnRtbXUubWFrIHwgIDEgKw0KPiA+ICBody9hcm0vdmlydC1hY3Bp
LWJ1aWxkLmMgICAgICAgIHwgIDkgKysrKysrKysrDQo+ID4gIGh3L2FybS92aXJ0LWFjcGkuYyAg
ICAgICAgICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBody9hcm0vdmly
dC5jICAgICAgICAgICAgICAgICAgIHwgMTEgKysrKysrKysrKysNCj4gPiAgaW5jbHVkZS9ody9h
cm0vdmlydC5oICAgICAgICAgICB8ICAyICsrDQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgNDYgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RlZmF1bHQtY29uZmlncy9hcm0tc29m
dG1tdS5tYWsNCj4gYi9kZWZhdWx0LWNvbmZpZ3MvYXJtLXNvZnRtbXUubWFrDQo+ID4gaW5kZXgg
ZmJjNDU2NC4uYjNiYWMyNSAxMDA2NDQNCj4gPiAtLS0gYS9kZWZhdWx0LWNvbmZpZ3MvYXJtLXNv
ZnRtbXUubWFrDQo+ID4gKysrIGIvZGVmYXVsdC1jb25maWdzL2FybS1zb2Z0bW11Lm1haw0KPiA+
IEBAIC0xNjcsMyArMTY3LDQgQEAgQ09ORklHX0hJR0hCQU5LPXkNCj4gPiAgQ09ORklHX01VU0lD
UEFMPXkNCj4gPiAgQ09ORklHX01FTV9ERVZJQ0U9eQ0KPiA+ICBDT05GSUdfRElNTT15DQo+ID4g
K0NPTkZJR19BQ1BJX01FTU9SWV9IT1RQTFVHPXkNCj4gPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL3Zp
cnQtYWNwaS1idWlsZC5jIGIvaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jDQo+ID4gaW5kZXggZDdl
MmU0OC4uODdkNjZkYSAxMDA2NDQNCj4gPiAtLS0gYS9ody9hcm0vdmlydC1hY3BpLWJ1aWxkLmMN
Cj4gPiArKysgYi9ody9hcm0vdmlydC1hY3BpLWJ1aWxkLmMNCj4gPiBAQCAtNDAsNiArNDAsNyBA
QA0KPiA+ICAjaW5jbHVkZSAiaHcvbG9hZGVyLmgiDQo+ID4gICNpbmNsdWRlICJody9ody5oIg0K
PiA+ICAjaW5jbHVkZSAiaHcvYWNwaS9hbWwtYnVpbGQuaCINCj4gPiArI2luY2x1ZGUgImh3L2Fj
cGkvbWVtb3J5X2hvdHBsdWcuaCINCj4gPiAgI2luY2x1ZGUgImh3L3BjaS9wY2llX2hvc3QuaCIN
Cj4gPiAgI2luY2x1ZGUgImh3L3BjaS9wY2kuaCINCj4gPiAgI2luY2x1ZGUgImh3L2FybS92aXJ0
LmgiDQo+ID4gQEAgLTQ5LDYgKzUwLDEzIEBADQo+ID4gICNkZWZpbmUgQVJNX1NQSV9CQVNFIDMy
DQo+ID4gICNkZWZpbmUgQUNQSV9QT1dFUl9CVVRUT05fREVWSUNFICJQV1JCIg0KPiA+DQo+ID4g
K3N0YXRpYyB2b2lkIGFjcGlfZHNkdF9hZGRfbWVtb3J5X2hvdHBsdWcoQW1sICpzY29wZSwgTWFj
aGluZVN0YXRlDQo+ICptcykNCj4gPiArew0KPiA+ICsgICAgdWludDMyX3QgbnJfbWVtID0gbXMt
PnJhbV9zbG90czsNCj4gPiArDQo+ID4gKyAgICBidWlsZF9tZW1vcnlfaG90cGx1Z19hbWwoc2Nv
cGUsIG5yX21lbSwgIlxcX1NCIiwgTlVMTCwNCj4gQU1MX1NZU1RFTV9NRU1PUlkpOw0KPiA+ICt9
DQo+ID4gKw0KPiA+ICBzdGF0aWMgdm9pZCBhY3BpX2RzZHRfYWRkX2NwdXMoQW1sICpzY29wZSwg
aW50IHNtcF9jcHVzKQ0KPiA+ICB7DQo+ID4gICAgICB1aW50MTZfdCBpOw0KPiA+IEBAIC03NDAs
NiArNzQ4LDcgQEAgYnVpbGRfZHNkdChHQXJyYXkgKnRhYmxlX2RhdGEsIEJJT1NMaW5rZXIgKmxp
bmtlciwNCj4gVmlydE1hY2hpbmVTdGF0ZSAqdm1zKQ0KPiA+ICAgICAgICogdGhlIFJUQyBBQ1BJ
IGRldmljZSBhdCBhbGwgd2hlbiB1c2luZyBVRUZJLg0KPiA+ICAgICAgICovDQo+ID4gICAgICBz
Y29wZSA9IGFtbF9zY29wZSgiXFxfU0IiKTsNCj4gPiArICAgIGFjcGlfZHNkdF9hZGRfbWVtb3J5
X2hvdHBsdWcoc2NvcGUsIE1BQ0hJTkUodm1zKSk7DQo+ID4gICAgICBhY3BpX2RzZHRfYWRkX2Nw
dXMoc2NvcGUsIHZtcy0+c21wX2NwdXMpOw0KPiA+ICAgICAgYWNwaV9kc2R0X2FkZF91YXJ0KHNj
b3BlLCAmbWVtbWFwW1ZJUlRfVUFSVF0sDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgKGly
cW1hcFtWSVJUX1VBUlRdICsgQVJNX1NQSV9CQVNFKSk7DQo+ID4gZGlmZiAtLWdpdCBhL2h3L2Fy
bS92aXJ0LWFjcGkuYyBiL2h3L2FybS92aXJ0LWFjcGkuYw0KPiA+IGluZGV4IGRmOGEwMmIuLjE4
ZWJlOTQgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvYXJtL3ZpcnQtYWNwaS5jDQo+ID4gKysrIGIvaHcv
YXJtL3ZpcnQtYWNwaS5jDQo+ID4gQEAgLTI2LDkgKzI2LDExIEBADQo+ID4gICNpbmNsdWRlICJo
dy9hcm0vdmlydC5oIg0KPiA+DQo+ID4gICNpbmNsdWRlICJody9hY3BpL2FjcGkuaCINCj4gPiAr
I2luY2x1ZGUgImh3L2FjcGkvbWVtb3J5X2hvdHBsdWcuaCINCj4gPg0KPiA+ICB0eXBlZGVmIHN0
cnVjdCBWaXJ0QWNwaVN0YXRlIHsNCj4gPiAgICAgIFN5c0J1c0RldmljZSBwYXJlbnRfb2JqOw0K
PiA+ICsgICAgTWVtSG90cGx1Z1N0YXRlIG1lbWhwX3N0YXRlOw0KPiA+ICB9IFZpcnRBY3BpU3Rh
dGU7DQo+ID4NCj4gPiAgI2RlZmluZSBUWVBFX1ZJUlRfQUNQSSAidmlydC1hY3BpIg0KPiA+IEBA
IC00NCw2ICs0NiwxNiBAQCBzdGF0aWMgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uIHZtc3RhdGVf
YWNwaSA9IHsNCj4gPiAgc3RhdGljIHZvaWQgdmlydF9kZXZpY2VfcGx1Z19jYihIb3RwbHVnSGFu
ZGxlciAqaG90cGx1Z19kZXYsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
RGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPiA+ICB7DQo+ID4gKyAgICBWaXJ0QWNw
aVN0YXRlICpzID0gVklSVF9BQ1BJKGhvdHBsdWdfZGV2KTsNCj4gPiArDQo+ID4gKyAgICBpZiAo
cy0+bWVtaHBfc3RhdGUuaXNfZW5hYmxlZCAmJg0KPiA+ICsgICAgICAgIG9iamVjdF9keW5hbWlj
X2Nhc3QoT0JKRUNUKGRldiksIFRZUEVfUENfRElNTSkpIHsNCj4gPiArICAgICAgICAgICAgYWNw
aV9tZW1vcnlfcGx1Z19jYihob3RwbHVnX2RldiwgJnMtPm1lbWhwX3N0YXRlLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldiwgZXJycCk7DQo+ID4gKyAgICB9IGVsc2Ug
ew0KPiA+ICsgICAgICAgIGVycm9yX3NldGcoZXJycCwgInZpcnQ6IGRldmljZSBwbHVnIHJlcXVl
c3QgZm9yIHVuc3VwcG9ydGVkDQo+IGRldmljZSINCj4gPiArICAgICAgICAgICAgICAgICAgICIg
dHlwZTogJXMiLCBvYmplY3RfZ2V0X3R5cGVuYW1lKE9CSkVDVChkZXYpKSk7DQo+ID4gKyAgICB9
DQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCB2aXJ0X2RldmljZV91bnBsdWdfcmVxdWVz
dF9jYihIb3RwbHVnSGFuZGxlciAqaG90cGx1Z19kZXYsDQo+ID4gQEAgLTYyLDYgKzc0LDE1IEBA
IHN0YXRpYyB2b2lkIHZpcnRfc2VuZF9nZWQoQWNwaURldmljZUlmICphZGV2LA0KPiBBY3BpRXZl
bnRTdGF0dXNCaXRzIGV2KQ0KPiA+DQo+ID4gIHN0YXRpYyB2b2lkIHZpcnRfZGV2aWNlX3JlYWxp
emUoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPiA+ICB7DQo+ID4gKyAgICBWaXJ0
TWFjaGluZVN0YXRlICp2bXMgPSBWSVJUX01BQ0hJTkUocWRldl9nZXRfbWFjaGluZSgpKTsNCj4g
PiArICAgIGNvbnN0IE1lbU1hcEVudHJ5ICptZW1tYXAgPSB2bXMtPm1lbW1hcDsNCj4gPiArICAg
IFZpcnRBY3BpU3RhdGUgKnMgPSBWSVJUX0FDUEkoZGV2KTsNCj4gPiArDQo+ID4gKyAgICBpZiAo
cy0+bWVtaHBfc3RhdGUuaXNfZW5hYmxlZCkgew0KPiA+ICsgICAgICAgIGFjcGlfbWVtb3J5X2hv
dHBsdWdfaW5pdChnZXRfc3lzdGVtX21lbW9yeSgpLCBPQkpFQ1QoZGV2KSwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJnMtPm1lbWhwX3N0YXRlLA0KPiA+ICsNCj4gbWVt
bWFwW1ZJUlRfUENESU1NX0FDUEldLmJhc2UpOw0KPiA+ICsgICAgfQ0KPiA+ICB9DQo+ID4NCj4g
PiAgRGV2aWNlU3RhdGUgKnZpcnRfYWNwaV9pbml0KHZvaWQpDQo+ID4gQEAgLTcwLDYgKzkxLDgg
QEAgRGV2aWNlU3RhdGUgKnZpcnRfYWNwaV9pbml0KHZvaWQpDQo+ID4gIH0NCj4gPg0KPiA+ICBz
dGF0aWMgUHJvcGVydHkgdmlydF9hY3BpX3Byb3BlcnRpZXNbXSA9IHsNCj4gPiArICAgIERFRklO
RV9QUk9QX0JPT0woIm1lbW9yeS1ob3RwbHVnLXN1cHBvcnQiLCBWaXJ0QWNwaVN0YXRlLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICBtZW1ocF9zdGF0ZS5pc19lbmFibGVkLCB0cnVlKSwNCj4g
PiAgICAgIERFRklORV9QUk9QX0VORF9PRl9MSVNUKCksDQo+ID4gIH07DQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvaHcvYXJtL3ZpcnQuYyBiL2h3L2FybS92aXJ0LmMNCj4gPiBpbmRleCA0MGExMjcz
Li45NDI3ZjRmIDEwMDY0NA0KPiA+IC0tLSBhL2h3L2FybS92aXJ0LmMNCj4gPiArKysgYi9ody9h
cm0vdmlydC5jDQo+ID4gQEAgLTEzMyw2ICsxMzMsNyBAQCBzdGF0aWMgY29uc3QgTWVtTWFwRW50
cnkgYmFzZV9tZW1tYXBbXSA9IHsNCj4gPiAgICAgIFtWSVJUX0dQSU9dID0gICAgICAgICAgICAg
ICB7IDB4MDkwMzAwMDAsIDB4MDAwMDEwMDAgfSwNCj4gPiAgICAgIFtWSVJUX1NFQ1VSRV9VQVJU
XSA9ICAgICAgICB7IDB4MDkwNDAwMDAsIDB4MDAwMDEwMDAgfSwNCj4gPiAgICAgIFtWSVJUX1NN
TVVdID0gICAgICAgICAgICAgICB7IDB4MDkwNTAwMDAsIDB4MDAwMjAwMDAgfSwNCj4gPiArICAg
IFtWSVJUX1BDRElNTV9BQ1BJXSA9ICAgICAgICB7IDB4MDkwNzAwMDAsIDB4MDAwMTAwMDAgfSwN
Cj4gPiAgICAgIFtWSVJUX01NSU9dID0gICAgICAgICAgICAgICB7IDB4MGEwMDAwMDAsIDB4MDAw
MDAyMDAgfSwNCj4gPiAgICAgIC8qIC4uLnJlcGVhdGluZyBmb3IgYSB0b3RhbCBvZiBOVU1fVklS
VElPX1RSQU5TUE9SVFMsIGVhY2ggb2YgdGhhdA0KPiBzaXplICovDQo+ID4gICAgICBbVklSVF9Q
TEFURk9STV9CVVNdID0gICAgICAgeyAweDBjMDAwMDAwLCAweDAyMDAwMDAwIH0sDQo+ID4gQEAg
LTE2NDgsNiArMTY0OSw4IEBAIHN0YXRpYyB2b2lkIG1hY2h2aXJ0X2luaXQoTWFjaGluZVN0YXRl
ICptYWNoaW5lKQ0KPiA+DQo+ID4gICAgICBjcmVhdGVfcGxhdGZvcm1fYnVzKHZtcywgcGljKTsN
Cj4gPg0KPiA+ICsgICAgdm1zLT5hY3BpID0gdmlydF9hY3BpX2luaXQoKTsNCj4gPiArDQo+ID4g
ICAgICB2bXMtPmJvb3RpbmZvLnJhbV9zaXplID0gbWFjaGluZS0+cmFtX3NpemU7DQo+ID4gICAg
ICB2bXMtPmJvb3RpbmZvLmtlcm5lbF9maWxlbmFtZSA9IG1hY2hpbmUtPmtlcm5lbF9maWxlbmFt
ZTsNCj4gPiAgICAgIHZtcy0+Ym9vdGluZm8ua2VybmVsX2NtZGxpbmUgPSBtYWNoaW5lLT5rZXJu
ZWxfY21kbGluZTsNCj4gPiBAQCAtMTgzMiwxMSArMTgzNSwxOSBAQCBzdGF0aWMgdm9pZA0KPiB2
aXJ0X21lbW9yeV9wcmVfcGx1ZyhIb3RwbHVnSGFuZGxlciAqaG90cGx1Z19kZXYsIERldmljZVN0
YXRlICpkZXYsDQo+ID4gIHN0YXRpYyB2b2lkIHZpcnRfbWVtb3J5X3BsdWcoSG90cGx1Z0hhbmRs
ZXIgKmhvdHBsdWdfZGV2LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERldmlj
ZVN0YXRlICpkZXYsIEVycm9yICoqZXJycCkNCj4gPiAgew0KPiA+ICsgICAgSG90cGx1Z0hhbmRs
ZXJDbGFzcyAqaGhjOw0KPiA+ICAgICAgVmlydE1hY2hpbmVTdGF0ZSAqdm1zID0gVklSVF9NQUNI
SU5FKGhvdHBsdWdfZGV2KTsNCj4gPiAgICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxMOw0KPiA+
DQo+ID4gICAgICBwY19kaW1tX3BsdWcoUENfRElNTShkZXYpLCBNQUNISU5FKHZtcyksICZsb2Nh
bF9lcnIpOw0KPiA+ICsgICAgaWYgKGxvY2FsX2Vycikgew0KPiA+ICsgICAgICAgIGdvdG8gb3V0
Ow0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIGhoYyA9IEhPVFBMVUdfSEFORExFUl9HRVRf
Q0xBU1Modm1zLT5hY3BpKTsNCj4gPiArICAgIGhoYy0+cGx1ZyhIT1RQTFVHX0hBTkRMRVIodm1z
LT5hY3BpKSwgZGV2LCAmZXJyb3JfYWJvcnQpOw0KPiA+DQo+ID4gK291dDoNCj4gPiAgICAgIGVy
cm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpOw0KPiA+ICB9DQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9ody9hcm0vdmlydC5oIGIvaW5jbHVkZS9ody9hcm0vdmlydC5oDQo+ID4g
aW5kZXggNjA3NjE2Ny4uZTQ2YTA1MSAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2h3L2FybS92
aXJ0LmgNCj4gPiArKysgYi9pbmNsdWRlL2h3L2FybS92aXJ0LmgNCj4gPiBAQCAtNzcsNiArNzcs
NyBAQCBlbnVtIHsNCj4gPiAgICAgIFZJUlRfR1BJTywNCj4gPiAgICAgIFZJUlRfU0VDVVJFX1VB
UlQsDQo+ID4gICAgICBWSVJUX1NFQ1VSRV9NRU0sDQo+ID4gKyAgICBWSVJUX1BDRElNTV9BQ1BJ
LA0KPiA+ICAgICAgVklSVF9MT1dNRU1NQVBfTEFTVCwNCj4gPiAgfTsNCj4gPg0KPiA+IEBAIC0x
MzIsNiArMTMzLDcgQEAgdHlwZWRlZiBzdHJ1Y3Qgew0KPiA+ICAgICAgdWludDMyX3QgaW9tbXVf
cGhhbmRsZTsNCj4gPiAgICAgIGludCBwc2NpX2NvbmR1aXQ7DQo+ID4gICAgICBod2FkZHIgaGln
aGVzdF9ncGE7DQo+ID4gKyAgICBEZXZpY2VTdGF0ZSAqYWNwaTsNCj4gPiAgfSBWaXJ0TWFjaGlu
ZVN0YXRlOw0KPiA+DQo+ID4gICNkZWZpbmUgVklSVF9FQ0FNX0lEKGhpZ2gpIChoaWdoID8gVklS
VF9ISUdIX1BDSUVfRUNBTSA6DQo+IFZJUlRfUENJRV9FQ0FNKQ0KPiA+DQo=
