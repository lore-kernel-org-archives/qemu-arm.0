Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp903890wrt;
        Mon, 11 Mar 2019 10:38:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkOFvzSXlcoX1wrrS7s7f/GFpE01cH1/fS8E96KNLM5AsbwjOeFx5UvcNSS/qtAG4Ij2fz
X-Received: by 2002:a81:9b05:: with SMTP id s5mr26106266ywg.351.1552325930001;
        Mon, 11 Mar 2019 10:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552325929; cv=none;
        d=google.com; s=arc-20160816;
        b=eaIHUFyZ7+mNQzz5KEkfx8tJ6n1MH/JMEso8gkk17hE+oDghPOcNPFmfJ2E103p7Sq
         duMAKMTIbGv/6lq1X6Vj8NHbrxt1OLiIfHvGLevEnl10xB/dqPgRCgyQglvMUfX/JnEr
         MupX9oot/sTHK/NlN/ES0GvJNcy/XsieouyvWVwUIrDPKuf6jXfi+m5OQCEFcaC9yaAt
         6dKPj6D+0Ck4EnmhBws/4rWOZYCB6Fec3XmriYlLbfnhigd0TM+NYPp6NS4ymis2Pc6c
         u3h7xETexSjRJKKd/fAgwSExYElJvWMFUnhrUTiu2UDKUtm3x4htjYtYp69K04RFVO3s
         GkBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=0NGwxI9Z8ZWdg8d3WqdSl+DovnMzHrWo2EVDZ53BNW8=;
        b=RzvVquaiWU31Ulmfinp/FeUnpIZEFJmgfTwbK8UcYuIbhNOsDryaGoZCZYPifNMnbv
         Am6cN8fwckpXwFJXtfVHwCCBQRly22R9YF8DCsJ0rdh9WkWaVoMdXwuIhrG8Cd63NPfL
         abYPa40Z2H2+nAmoBrOXhaz1QUY6Bnf0rfkETYXEuZP8SuH+4K9dAc0VejSychWXHxzu
         dS/QwumX5qqfjamyknBctpqmMPxEXE20VDotldUMtlYnYjIyJSWDv1DPTjDXKNZ/hGeA
         D82QEzBKAW8NC3A3MPlB97mNrtJvpDzFlwbT5MewRHjnc/Zc76VvNw45tc5GPbGxpgmg
         jrRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 197si3112186ybf.108.2019.03.11.10.38.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 10:38:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:37443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3Osz-0008Fq-AG
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 13:38:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3OsV-0007rx-BV
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 13:38:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3Oqb-00071H-Nz
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 13:36:22 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45360 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3Oqb-0006vk-Co; Mon, 11 Mar 2019 13:36:21 -0400
Received: from LHREML711-CAH.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 38EE0EECE0820B3D5029;
	Mon, 11 Mar 2019 17:36:15 +0000 (GMT)
Received: from LHREML524-MBB.china.huawei.com ([169.254.3.135]) by
	LHREML711-CAH.china.huawei.com ([10.201.108.34]) with mapi id
	14.03.0415.000; Mon, 11 Mar 2019 17:36:07 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "shannon.zhaosl@gmail.com"
	<shannon.zhaosl@gmail.com>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>, 
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Thread-Topic: [PATCH v2 04/11] hw/arm/virt: Add virtual ACPI device
Thread-Index: AQHU1aRuwKWi3K07OkyNbQWLIMG7oqYGcCSAgABCGLA=
Date: Mon, 11 Mar 2019 17:36:06 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839304E12@lhreml524-mbb.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-5-shameerali.kolothum.thodi@huawei.com>
	<7cea0bf3-2eba-d649-fb33-a84648f856e0@redhat.com>
In-Reply-To: <7cea0bf3-2eba-d649-fb33-a84648f856e0@redhat.com>
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
Subject: Re: [Qemu-arm] [PATCH v2 04/11] hw/arm/virt: Add virtual ACPI device
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
X-TUID: 4CNv+sWtqAjv

DQpIaSBFcmljLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEF1Z2Vy
IEVyaWMgW21haWx0bzplcmljLmF1Z2VyQHJlZGhhdC5jb21dDQo+IFNlbnQ6IDExIE1hcmNoIDIw
MTkgMTM6MjQNCj4gVG86IFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkgPHNoYW1lZXJhbGkua29s
b3RodW0udGhvZGlAaHVhd2VpLmNvbT47DQo+IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1h
cm1Abm9uZ251Lm9yZzsgaW1hbW1lZG9AcmVkaGF0LmNvbTsNCj4gcGV0ZXIubWF5ZGVsbEBsaW5h
cm8ub3JnOyBzaGFubm9uLnpoYW9zbEBnbWFpbC5jb207DQo+IHNhbWVvQGxpbnV4LmludGVsLmNv
bTsgc2ViYXN0aWVuLmJvZXVmQGludGVsLmNvbQ0KPiBDYzogTGludXhhcm0gPGxpbnV4YXJtQGh1
YXdlaS5jb20+OyB4dXdlaSAoTykgPHh1d2VpNUBodWF3ZWkuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYyIDA0LzExXSBody9hcm0vdmlydDogQWRkIHZpcnR1YWwgQUNQSSBkZXZpY2UNCj4g
DQo+IEhpIFNoYW1lZXIsDQo+IA0KPiBPbiAzLzgvMTkgMTI6NDIgUE0sIFNoYW1lZXIgS29sb3Ro
dW0gd3JvdGU6DQo+ID4gRnJvbTogU2FtdWVsIE9ydGl6IDxzYW1lb0BsaW51eC5pbnRlbC5jb20+
DQo+ID4NCj4gPiBUaGlzIGlzIHRvIHByb3ZpZGUgYW4gYWNwaSBkZXZpY2UgaW50ZXJmYWNlIGZv
ciBBcm0vdmlydC4NCj4gPiBUaGlzIHdpbGwgYmUgdXNlZCBieSBBcm0vVmlydCB0byBhZGQgaG90
cGx1ZyBzdXBwb3J0IHZpYQ0KPiA+IEFDUEkgR0VEIGRldmljZS4NCj4gDQo+IEkgdGhpbmsgdGhp
cyB3b3VsZCBkZXNlcnZlcyB0byBtZW50aW9uIHRoaXMgaXMgYSBza2VsZXRvbiBvciwNCj4gd291
bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBtZXJnZSB0aGUgdmlydC1hY3BpIHBhcnQgb2YgImh3L2Fy
bS92aXJ0OiBBZGQNCj4gQUNQSSBzdXBwb3J0IGZvciBkZXZpY2UgbWVtb3J5IGNvbGQtcGx1ZyIg
aW5zaWRlIHRoaXMgcGF0Y2g7IGFuZCBrZWVwDQo+IGl0cyBpbnN0YW50aWF0aW9uIGluIG1hY2h2
aXJ0IGluIGEgc2VwYXJhdGUgcGF0Y2g/DQoNCk9rLiBJIHdpbGwgbG9vayBpbnRvIGl0Lg0KDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgT3J0aXogPHNhbWVvQGxpbnV4LmludGVsLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGFtZWVyIEtvbG90aHVtIDxzaGFtZWVyYWxpLmtvbG90
aHVtLnRob2RpQGh1YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gIGh3L2FybS9NYWtlZmlsZS5vYmpz
ICB8ICAgMiArLQ0KPiA+ICBody9hcm0vdmlydC1hY3BpLmMgICAgfCAxMTENCj4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgaW5jbHVkZS9o
dy9hcm0vdmlydC5oIHwgICAxICsNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMTMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvYXJtL3ZpcnQt
YWNwaS5jDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL01ha2VmaWxlLm9ianMgYi9ody9h
cm0vTWFrZWZpbGUub2Jqcw0KPiA+IGluZGV4IGZhNTdjN2MuLmUwZGIzY2QgMTAwNjQ0DQo+ID4g
LS0tIGEvaHcvYXJtL01ha2VmaWxlLm9ianMNCj4gPiArKysgYi9ody9hcm0vTWFrZWZpbGUub2Jq
cw0KPiA+IEBAIC0xLDYgKzEsNiBAQA0KPiA+ICBvYmoteSArPSBib290Lm8gc3lzYnVzLWZkdC5v
DQo+ID4gIG9iai0kKENPTkZJR19BUk1fVklSVCkgKz0gdmlydC5vDQo+ID4gLW9iai0kKENPTkZJ
R19BQ1BJKSArPSB2aXJ0LWFjcGktYnVpbGQubw0KPiA+ICtvYmotJChDT05GSUdfQUNQSSkgKz0g
dmlydC1hY3BpLWJ1aWxkLm8gdmlydC1hY3BpLm8NCj4gPiAgb2JqLSQoQ09ORklHX0RJR0lDKSAr
PSBkaWdpY19ib2FyZHMubw0KPiA+ICBvYmotJChDT05GSUdfRVhZTk9TNCkgKz0gZXh5bm9zNF9i
b2FyZHMubw0KPiA+ICBvYmotJChDT05GSUdfSElHSEJBTkspICs9IGhpZ2hiYW5rLm8NCj4gPiBk
aWZmIC0tZ2l0IGEvaHcvYXJtL3ZpcnQtYWNwaS5jIGIvaHcvYXJtL3ZpcnQtYWNwaS5jDQo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwLi5kZjhhMDJiDQo+ID4gLS0t
IC9kZXYvbnVsbA0KPiA+ICsrKyBiL2h3L2FybS92aXJ0LWFjcGkuYw0KPiA+IEBAIC0wLDAgKzEs
MTExIEBADQo+ID4gKy8qDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAxOCBJbnRl
bCBDb3Jwb3JhdGlvbg0KPiA+ICsgKg0KPiA+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0
d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeSBpdA0KPiA+ICsgKiB1
bmRlciB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlLA0KPiA+ICsgKiB2ZXJzaW9uIDIgb3IgbGF0ZXIsIGFzIHB1Ymxpc2hlZCBieSB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLg0KPiA+ICsgKg0KPiA+ICsgKiBUaGlzIHByb2dyYW0g
aXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgaXQgd2lsbCBiZSB1c2VmdWwsIGJ1dCBXSVRIT1VU
DQo+ID4gKyAqIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5
IG9mDQo+IE1FUkNIQU5UQUJJTElUWSBvcg0KPiA+ICsgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VM
QVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VIEdlbmVyYWwgUHVibGljDQo+IExpY2Vuc2UgZm9yDQo+
ID4gKyAqIG1vcmUgZGV0YWlscy4NCj4gPiArICoNCj4gPiArICogWW91IHNob3VsZCBoYXZlIHJl
Y2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYWxvbmcNCj4g
d2l0aA0KPiA+ICsgKiB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUu
b3JnL2xpY2Vuc2VzLz4uDQo+ID4gKyAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgInFlbXUvb3Nk
ZXAuaCINCj4gPiArI2luY2x1ZGUgInFlbXUvcmFuZ2UuaCINCj4gPiArI2luY2x1ZGUgInFhcGkv
ZXJyb3IuaCINCj4gPiArI2luY2x1ZGUgImV4ZWMvYWRkcmVzcy1zcGFjZXMuaCINCj4gPiArDQo+
ID4gKyNpbmNsdWRlICJody9ody5oIg0KPiA+ICsjaW5jbHVkZSAiaHcvaG90cGx1Zy5oIg0KPiA+
ICsjaW5jbHVkZSAiaHcvc3lzYnVzLmgiDQo+ID4gKyNpbmNsdWRlICJody9hcm0vdmlydC5oIg0K
PiA+ICsNCj4gPiArI2luY2x1ZGUgImh3L2FjcGkvYWNwaS5oIg0KPiA+ICsNCj4gPiArdHlwZWRl
ZiBzdHJ1Y3QgVmlydEFjcGlTdGF0ZSB7DQo+ID4gKyAgICBTeXNCdXNEZXZpY2UgcGFyZW50X29i
ajsNCj4gPiArfSBWaXJ0QWNwaVN0YXRlOw0KPiA+ICsNCj4gPiArI2RlZmluZSBUWVBFX1ZJUlRf
QUNQSSAidmlydC1hY3BpIg0KPiA+ICsjZGVmaW5lIFZJUlRfQUNQSShvYmopIFwNCj4gPiArICAg
IE9CSkVDVF9DSEVDSyhWaXJ0QWNwaVN0YXRlLCAob2JqKSwgVFlQRV9WSVJUX0FDUEkpDQo+ID4g
Kw0KPiA+ICtzdGF0aWMgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uIHZtc3RhdGVfYWNwaSA9IHsN
Cj4gPiArICAgIC5uYW1lID0gInZpcnRfYWNwaSIsDQo+ID4gKyAgICAudmVyc2lvbl9pZCA9IDEs
DQo+ID4gKyAgICAubWluaW11bV92ZXJzaW9uX2lkID0gMSwNCj4gPiArfTsNCj4gPiArDQo+ID4g
K3N0YXRpYyB2b2lkIHZpcnRfZGV2aWNlX3BsdWdfY2IoSG90cGx1Z0hhbmRsZXIgKmhvdHBsdWdf
ZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERldmljZVN0YXRlICpk
ZXYsIEVycm9yICoqZXJycCkNCj4gPiArew0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9p
ZCB2aXJ0X2RldmljZV91bnBsdWdfcmVxdWVzdF9jYihIb3RwbHVnSGFuZGxlciAqaG90cGx1Z19k
ZXYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERldmlj
ZVN0YXRlICpkZXYsIEVycm9yDQo+ICoqZXJycCkNCj4gPiArew0KPiA+ICt9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgdm9pZCB2aXJ0X2RldmljZV91bnBsdWdfY2IoSG90cGx1Z0hhbmRsZXIgKmhvdHBs
dWdfZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRGV2aWNlU3Rh
dGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPiA+ICt7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRp
YyB2b2lkIHZpcnRfc2VuZF9nZWQoQWNwaURldmljZUlmICphZGV2LCBBY3BpRXZlbnRTdGF0dXNC
aXRzIGV2KQ0KPiA+ICt7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHZpcnRfZGV2
aWNlX3JlYWxpemUoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPiA+ICt7DQo+ID4g
K30NCj4gPiArDQo+ID4gK0RldmljZVN0YXRlICp2aXJ0X2FjcGlfaW5pdCh2b2lkKQ0KPiA+ICt7
DQo+ID4gKyAgICByZXR1cm4gc3lzYnVzX2NyZWF0ZV9zaW1wbGUoVFlQRV9WSVJUX0FDUEksIC0x
LCBOVUxMKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIFByb3BlcnR5IHZpcnRfYWNwaV9w
cm9wZXJ0aWVzW10gPSB7DQo+ID4gKyAgICBERUZJTkVfUFJPUF9FTkRfT0ZfTElTVCgpLA0KPiA+
ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgdmlydF9hY3BpX2NsYXNzX2luaXQoT2JqZWN0
Q2xhc3MgKmNsYXNzLCB2b2lkICpkYXRhKQ0KPiA+ICt7DQo+ID4gKyAgICBEZXZpY2VDbGFzcyAq
ZGMgPSBERVZJQ0VfQ0xBU1MoY2xhc3MpOw0KPiA+ICsgICAgSG90cGx1Z0hhbmRsZXJDbGFzcyAq
aGMgPSBIT1RQTFVHX0hBTkRMRVJfQ0xBU1MoY2xhc3MpOw0KPiA+ICsgICAgQWNwaURldmljZUlm
Q2xhc3MgKmFkZXZjID0gQUNQSV9ERVZJQ0VfSUZfQ0xBU1MoY2xhc3MpOw0KPiA+ICsNCj4gPiAr
ICAgIGRjLT5kZXNjID0gIkFDUEkiOw0KPiA+ICsgICAgZGMtPnZtc2QgPSAmdm1zdGF0ZV9hY3Bp
Ow0KPiBkbyB3ZSByZWFsbHkgbmVlZCB0aGUgdm1zZCBmaWVsZCBhcyBvZiBub3c/DQoNCkkgYW0g
bm90IHN1cmUuIElzIHRoaXMgb25seSByZWxldmFudCBmb3IgbWlncmF0aW9uIGNhc2VzIG9ubHk/
DQoNCj4gPiArICAgIGRjLT5wcm9wcyA9IHZpcnRfYWNwaV9wcm9wZXJ0aWVzOz4gKyAgICBkYy0+
cmVhbGl6ZSA9DQo+IHZpcnRfZGV2aWNlX3JlYWxpemU7DQo+ID4gKw0KPiA+ICsgICAgaGMtPnBs
dWcgPSB2aXJ0X2RldmljZV9wbHVnX2NiOw0KPiA+ICsgICAgaGMtPnVucGx1Z19yZXF1ZXN0ID0g
dmlydF9kZXZpY2VfdW5wbHVnX3JlcXVlc3RfY2I7DQo+ID4gKyAgICBoYy0+dW5wbHVnID0gdmly
dF9kZXZpY2VfdW5wbHVnX2NiOw0KPiB1bnBsdWdfcmVxdWVzdCBhbmQgdW5wbHVnIHN0aWxsIGFy
ZW4ndCBpbXBsZW1lbnRlZCBhdCB0aGUgZW5kIG9mIHRoZQ0KPiBzZXJpZXMuIE1heWJlIHdlIGNh
biBpZ25vcmUgdGhlbSBhdCB0aGUgbW9tZW50Pw0KDQpBZ3JlZWQuIEkgd2lsbCByZW1vdmUgdGhv
c2UuDQoNClRoYW5rcywNClNoYW1lZXINCg0KPiA+ICsNCj4gPiArICAgIGFkZXZjLT5zZW5kX2V2
ZW50ID0gdmlydF9zZW5kX2dlZDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IFR5
cGVJbmZvIHZpcnRfYWNwaV9pbmZvID0gew0KPiA+ICsgICAgLm5hbWUgICAgICAgICAgPSBUWVBF
X1ZJUlRfQUNQSSwNCj4gPiArICAgIC5wYXJlbnQgICAgICAgID0gVFlQRV9TWVNfQlVTX0RFVklD
RSwNCj4gPiArICAgIC5pbnN0YW5jZV9zaXplID0gc2l6ZW9mKFZpcnRBY3BpU3RhdGUpLA0KPiA+
ICsgICAgLmNsYXNzX2luaXQgICAgPSB2aXJ0X2FjcGlfY2xhc3NfaW5pdCwNCj4gPiArICAgIC5p
bnRlcmZhY2VzID0gKEludGVyZmFjZUluZm9bXSkgew0KPiA+ICsgICAgICAgIHsgVFlQRV9IT1RQ
TFVHX0hBTkRMRVIgfSwNCj4gPiArICAgICAgICB7IFRZUEVfQUNQSV9ERVZJQ0VfSUYgfSwNCj4g
PiArICAgICAgICB7IH0NCj4gPiArICAgIH0NCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyB2
b2lkIHZpcnRfYWNwaV9yZWdpc3Rlcl90eXBlcyh2b2lkKQ0KPiA+ICt7DQo+ID4gKyAgICB0eXBl
X3JlZ2lzdGVyX3N0YXRpYygmdmlydF9hY3BpX2luZm8pOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICt0
eXBlX2luaXQodmlydF9hY3BpX3JlZ2lzdGVyX3R5cGVzKQ0KPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2h3L2FybS92aXJ0LmggYi9pbmNsdWRlL2h3L2FybS92aXJ0LmgNCj4gPiBpbmRleCA1MDc1
MTdjLi42MDc2MTY3IDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvaHcvYXJtL3ZpcnQuaA0KPiA+
ICsrKyBiL2luY2x1ZGUvaHcvYXJtL3ZpcnQuaA0KPiA+IEBAIC0xNDUsNiArMTQ1LDcgQEAgdHlw
ZWRlZiBzdHJ1Y3Qgew0KPiA+ICAgICAgT0JKRUNUX0NMQVNTX0NIRUNLKFZpcnRNYWNoaW5lQ2xh
c3MsIGtsYXNzLA0KPiBUWVBFX1ZJUlRfTUFDSElORSkNCj4gPg0KPiA+ICB2b2lkIHZpcnRfYWNw
aV9zZXR1cChWaXJ0TWFjaGluZVN0YXRlICp2bXMpOw0KPiA+ICtEZXZpY2VTdGF0ZSAqdmlydF9h
Y3BpX2luaXQodm9pZCk7DQo+ID4NCj4gPiAgLyogUmV0dXJuIHRoZSBudW1iZXIgb2YgdXNlZCBy
ZWRpc3RyaWJ1dG9yIHJlZ2lvbnMgICovDQo+ID4gIHN0YXRpYyBpbmxpbmUgaW50IHZpcnRfZ2lj
djNfcmVkaXN0X3JlZ2lvbl9jb3VudChWaXJ0TWFjaGluZVN0YXRlICp2bXMpDQo+ID4NCj4gDQo+
IFRoYW5rcw0KPiANCj4gRXJpYw0K
