Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1734120wrx;
        Fri, 29 Mar 2019 04:22:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqweA2VVeAmiHmOjfWA6Sy4gl7Zvy1tj9253NscERrg1MCHX2TN3b0xKt29NyNYV3XPEaFp1
X-Received: by 2002:a6b:760b:: with SMTP id g11mr33915466iom.249.1553858555167;
        Fri, 29 Mar 2019 04:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553858555; cv=none;
        d=google.com; s=arc-20160816;
        b=SS4d+28nMng0hdrgm/WEH3B524Pmx+3/8st2uidDtBoCzj0mmcmHI6mvFhKrlUOoxg
         a+Bqo/AyQ4IU+14sJMy9v7/yN3+EIL1JW6VYkH18yntpTGeJCt/ri37hf34NkWYkEjcJ
         IFUfnSG8QUpj6OG5p72O3HkDOGI9jql00sQjma7dTnWKE1765Y42MgeA8P6xc9c7nENq
         98Ju6vntNBIYNgTwmOG6LqJMZrTVvVhswya9wq3q6mIoLRH0Z+XxR7GGuMVAyz10PHUj
         Jw1fRMR6ltXRHuwnqlIiknNdjo+4axZ/xzXCJFUMsxqHgKdonDkWLp1HvPQmcPFL/xvE
         o3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=8dUcb18nRF0K7v+Ks7IuZA6yTgyVw2y7pq88pJOkRqc=;
        b=zyr/XGD23UyaQTFtLf7AhrXLojeqbdyzk84N37g8QKWtbX16SPeezebAps1++uYg96
         utyIk9EWeBCyu4AeNI3Y42OKmqyE+bWV2ySTdEzjhmOJo93/coAiaDqEpzYRh7JR8UMk
         ZI3IZPYVBylJGfjVnRbjOayCCovd2Gj/uXTKUvZ1JEjEQNeOE6fMfKQSxse4qTK9cfn7
         E2s9iZ0eIiNfKX2FvTcrCokzlIeEIreI+Sqi68j0DdE2RQMQlqil9IrMO74TYU1Vpi+z
         V4rD39Q0PbWeHaBDDGoKBGO1ktFLd85Sr8zlxpx2H4K3EAse8poMXTZSeXpM2PCqMAVW
         CzUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17si917917itp.13.2019.03.29.04.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 04:22:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:51015 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9pak-0005TU-AH
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 07:22:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9paR-0005Qj-Rf
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 07:22:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9paQ-0003uC-7N
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 07:22:15 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45378 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h9paP-0003tB-SY; Fri, 29 Mar 2019 07:22:14 -0400
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 0C42072B6DBD051B3573;
	Fri, 29 Mar 2019 11:22:11 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.165]) by
	lhreml704-cah.china.huawei.com ([10.201.108.45]) with mapi id
	14.03.0415.000; Fri, 29 Mar 2019 11:22:02 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "shannon.zhaosl@gmail.com"
	<shannon.zhaosl@gmail.com>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>, 
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Thread-Topic: [PATCH v3 03/10] hw/arm/virt: Add virtual ACPI device
Thread-Index: AQHU39O3pGz5ONjWFkKOeMcMWF1+QKYhIYqAgAFa4vA=
Date: Fri, 29 Mar 2019 11:22:02 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83933849C@lhreml524-mbs.china.huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-4-shameerali.kolothum.thodi@huawei.com>
	<52334300-4029-d54d-91de-441d68188e70@redhat.com>
In-Reply-To: <52334300-4029-d54d-91de-441d68188e70@redhat.com>
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
Subject: Re: [Qemu-arm] [PATCH v3 03/10] hw/arm/virt: Add virtual ACPI device
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
X-TUID: 8dsSMDuoAMle

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVnZXIgRXJpYyBbbWFp
bHRvOmVyaWMuYXVnZXJAcmVkaGF0LmNvbV0NCj4gU2VudDogMjggTWFyY2ggMjAxOSAxNDoxNQ0K
PiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSA8c2hhbWVlcmFsaS5rb2xvdGh1bS50aG9k
aUBodWF3ZWkuY29tPjsNCj4gcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFybUBub25nbnUu
b3JnOyBpbWFtbWVkb0ByZWRoYXQuY29tOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHNo
YW5ub24uemhhb3NsQGdtYWlsLmNvbTsNCj4gc2FtZW9AbGludXguaW50ZWwuY29tOyBzZWJhc3Rp
ZW4uYm9ldWZAaW50ZWwuY29tDQo+IENjOiBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT47
IHh1d2VpIChPKSA8eHV3ZWk1QGh1YXdlaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMg
MDMvMTBdIGh3L2FybS92aXJ0OiBBZGQgdmlydHVhbCBBQ1BJIGRldmljZQ0KPiANCj4gSGkgU2hh
bWVlciwNCj4gDQo+IE9uIDMvMjEvMTkgMTE6NDcgQU0sIFNoYW1lZXIgS29sb3RodW0gd3JvdGU6
DQo+ID4gRnJvbTogU2FtdWVsIE9ydGl6IDxzYW1lb0BsaW51eC5pbnRlbC5jb20+DQo+ID4NCj4g
PiBUaGlzIGFkZHMgdGhlIHNrZWxldG9uIHRvIHN1cHBvcnQgYW4gYWNwaSBkZXZpY2UgaW50ZXJm
YWNlIGZvcg0KPiA+IEhXLXJlZHVjZWQgYWNwaSBwbGF0Zm9ybXMgdmlhIEFDUEkgR0VEIC0gR2Vu
ZXJpYyBFdmVudCBEZXZpY2UgKEFDUEkNCj4gPiB2Ni4xIDUuNi45KS4NCj4gPg0KPiA+IFRoaXMg
d2lsbCBiZSB1c2VkIGJ5IEFybS9WaXJ0IHRvIGFkZCBob3RwbHVnIHN1cHBvcnQuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgT3J0aXogPHNhbWVvQGxpbnV4LmludGVsLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBTaGFtZWVyIEtvbG90aHVtIDxzaGFtZWVyYWxpLmtvbG90aHVtLnRo
b2RpQGh1YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gIGh3L2FjcGkvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDQgKysNCj4gPiAgaHcvYWNwaS9NYWtlZmlsZS5vYmpzICAgICAgICAg
ICAgICAgICAgfCAgMSArDQo+ID4gIGh3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuYyAgICAg
ICAgIHwgNzINCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBpbmNs
dWRlL2h3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuaCB8IDI5ICsrKysrKysrKysrKysrDQo+
ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTA2IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGh3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuYyAgY3JlYXRlIG1vZGUNCj4gMTAw
NjQ0DQo+ID4gaW5jbHVkZS9ody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmgNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9ody9hY3BpL0tjb25maWcgYi9ody9hY3BpL0tjb25maWcgaW5kZXggZWNh
M2JlZS4uMDFhOGI0MQ0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2h3L2FjcGkvS2NvbmZpZw0KPiA+
ICsrKyBiL2h3L2FjcGkvS2NvbmZpZw0KPiA+IEBAIC0yNywzICsyNyw3IEBAIGNvbmZpZyBBQ1BJ
X1ZNR0VOSUQNCj4gPiAgICAgIGJvb2wNCj4gPiAgICAgIGRlZmF1bHQgeQ0KPiA+ICAgICAgZGVw
ZW5kcyBvbiBQQw0KPiA+ICsNCj4gPiArY29uZmlnIEFDUElfSFdfUkVEVUNFRA0KPiA+ICsgICAg
Ym9vbA0KPiA+ICsgICAgZGVwZW5kcyBvbiBBQ1BJDQo+ID4gZGlmZiAtLWdpdCBhL2h3L2FjcGkv
TWFrZWZpbGUub2JqcyBiL2h3L2FjcGkvTWFrZWZpbGUub2JqcyBpbmRleA0KPiA+IDJkNDZlMzcu
LmI3NTMyMzIgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvYWNwaS9NYWtlZmlsZS5vYmpzDQo+ID4gKysr
IGIvaHcvYWNwaS9NYWtlZmlsZS5vYmpzDQo+ID4gQEAgLTYsNiArNiw3IEBAIGNvbW1vbi1vYmot
JChDT05GSUdfQUNQSV9NRU1PUllfSE9UUExVRykgKz0NCj4gPiBtZW1vcnlfaG90cGx1Zy5vDQo+
ID4gIGNvbW1vbi1vYmotJChDT05GSUdfQUNQSV9DUFVfSE9UUExVRykgKz0gY3B1Lm8NCj4gPiAg
Y29tbW9uLW9iai0kKENPTkZJR19BQ1BJX05WRElNTSkgKz0gbnZkaW1tLm8NCj4gPiAgY29tbW9u
LW9iai0kKENPTkZJR19BQ1BJX1ZNR0VOSUQpICs9IHZtZ2VuaWQubw0KPiA+ICtjb21tb24tb2Jq
LSQoQ09ORklHX0FDUElfSFdfUkVEVUNFRCkgKz0gZ2VuZXJpY19ldmVudF9kZXZpY2Uubw0KPiA+
ICBjb21tb24tb2JqLSQoY2FsbCBsbm90LCQoQ09ORklHX0FDUElfWDg2KSkgKz0gYWNwaS1zdHVi
Lm8NCj4gPg0KPiA+ICBjb21tb24tb2JqLXkgKz0gYWNwaV9pbnRlcmZhY2Uubw0KPiA+IGRpZmYg
LS1naXQgYS9ody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmMNCj4gPiBiL2h3L2FjcGkvZ2Vu
ZXJpY19ldmVudF9kZXZpY2UuYyBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRleA0KPiA+IDAwMDAw
MDAuLmIyMWE1NTENCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvaHcvYWNwaS9nZW5lcmlj
X2V2ZW50X2RldmljZS5jDQo+ID4gQEAgLTAsMCArMSw3MiBAQA0KPiA+ICsvKg0KPiA+ICsgKg0K
PiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTggSW50ZWwgQ29ycG9yYXRpb24NCj4gPiArICoNCj4g
PiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRl
IGl0IGFuZC9vcg0KPiA+ICttb2RpZnkgaXQNCj4gPiArICogdW5kZXIgdGhlIHRlcm1zIGFuZCBj
b25kaXRpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSwNCj4gPiArICogdmVy
c2lvbiAyIG9yIGxhdGVyLCBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbi4NCj4gPiArICoNCj4gPiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRo
ZSBob3BlIGl0IHdpbGwgYmUgdXNlZnVsLCBidXQNCj4gPiArV0lUSE9VVA0KPiA+ICsgKiBBTlkg
V0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZg0KPiBNRVJDSEFO
VEFCSUxJVFkNCj4gPiArb3INCj4gPiArICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBP
U0UuICBTZWUgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYw0KPiA+ICtMaWNlbnNlIGZvcg0KPiA+ICsg
KiBtb3JlIGRldGFpbHMuDQo+ID4gKyAqDQo+ID4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZl
ZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlDQo+ID4gK2Fsb25nIHdp
dGgNCj4gPiArICogdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9y
Zy9saWNlbnNlcy8+Lg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJxZW11L29zZGVw
LmgiDQo+ID4gKyNpbmNsdWRlICJody9zeXNidXMuaCINCj4gPiArI2luY2x1ZGUgImh3L2FjcGkv
YWNwaS5oIg0KPiA+ICsjaW5jbHVkZSAiaHcvYWNwaS9nZW5lcmljX2V2ZW50X2RldmljZS5oIg0K
PiB0aGUgZmlsZXMgYXJlIG5hbWVkIGdlbmVyaWNfZXZlbnRfZGV2aWNlLmMvaCB3aGlsZSB0aGUg
ZGV2aWNlIGlzIG5hbWVkDQo+ICJ2aXJ0LWFjcGkiLiBJIHdvdWxkIHN1Z2dlc3QgdG8gdXNlIHRo
ZSBzYW1lIG5hbWluZyBhcyBpbiBuZW11IGllLiBnZWQgb3INCj4gYWNwaV9nZWQuDQoNCkFncmVl
LiBUaGUgbmFtaW5nIGlzIGEgYml0IGNvbmZ1c2luZy4gSW4gbmVtdSB0aGV5IGhhdmUgYSBzZXBh
cmF0ZSB2aXJ0LWFjcGkNCmRldiB3aGljaCBtYWtlcyB1c2Ugb2YgR0VELiBIZXJlLCB3ZSBhcmUg
cm9sbGluZyB0aG9zZSB0d28gaW50byBvbmUuIEkgYW0NCnN0aWxsIG5vdCB2ZXJ5IHN1cmUgd2hl
dGhlciB3ZSBzaG91bGQgbGVhdmUgaXQgYXMgdmlydC1hY3BpLCBiZWNhdXNlIHRoZSBhY3R1YWwN
CmRldmljZSBvbiB3aGljaCB0aGlzIGlzIGltcGxlbWVudGVkIGNhbiBiZSBjaGFuZ2VkIGVnLCBH
RUQgdnMgR1BJTy4gDQoNCj4gSWYgdGhpbmsgeW91IHNob3VsZCBjbGFyaWZ5IHdoYXQgaXMgdGhl
IGV4YWN0IHNjb3BlIG9mIHRoaXMgZGV2aWNlLiBUaGUgcGF0Y2ggdGl0bGUNCj4gbWFrZSB0aGlu
ayB0aGlzIGlzIGJvdW5kIHRvIGJlIHVzZWQgb25seSBpbiBtYWNodmlydCAoKyB0aGUgdmlydCBw
cmVmaXggdXNlZCBpbg0KPiBudW1lcm91cyBmdW5jdGlvbnM/KS4gSXMgaXQgYWxzbyBib3VuZCB0
byBiZSB1c2VkIGJ5IG90aGVyIGFyY2hpdGVjdHVyZXM/DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9p
ZCB2aXJ0X2RldmljZV9wbHVnX2NiKEhvdHBsdWdIYW5kbGVyICpob3RwbHVnX2RldiwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAq
KmVycnApIHsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgdmlydF9zZW5kX2dlZChBY3BpRGV2
aWNlSWYgKmFkZXYsIEFjcGlFdmVudFN0YXR1c0JpdHMgZXYpDQo+ID4gK3sgfQ0KPiA+ICsNCj4g
PiArc3RhdGljIHZvaWQgdmlydF9kZXZpY2VfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJv
ciAqKmVycnApIHsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIFByb3BlcnR5IHZpcnRfYWNwaV9wcm9w
ZXJ0aWVzW10gPSB7DQo+ID4gKyAgICBERUZJTkVfUFJPUF9FTkRfT0ZfTElTVCgpLA0KPiA+ICt9
Ow0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgdmlydF9hY3BpX2NsYXNzX2luaXQoT2JqZWN0Q2xh
c3MgKmNsYXNzLCB2b2lkICpkYXRhKSB7DQo+ID4gKyAgICBEZXZpY2VDbGFzcyAqZGMgPSBERVZJ
Q0VfQ0xBU1MoY2xhc3MpOw0KPiA+ICsgICAgSG90cGx1Z0hhbmRsZXJDbGFzcyAqaGMgPSBIT1RQ
TFVHX0hBTkRMRVJfQ0xBU1MoY2xhc3MpOw0KPiA+ICsgICAgQWNwaURldmljZUlmQ2xhc3MgKmFk
ZXZjID0gQUNQSV9ERVZJQ0VfSUZfQ0xBU1MoY2xhc3MpOw0KPiA+ICsNCj4gPiArICAgIGRjLT5k
ZXNjID0gIkFDUEkiOw0KPiA+ICsgICAgZGMtPnByb3BzID0gdmlydF9hY3BpX3Byb3BlcnRpZXM7
DQo+ID4gKyAgICBkYy0+cmVhbGl6ZSA9IHZpcnRfZGV2aWNlX3JlYWxpemU7DQo+ID4gKw0KPiA+
ICsgICAgaGMtPnBsdWcgPSB2aXJ0X2RldmljZV9wbHVnX2NiOw0KPiA+ICsNCj4gPiArICAgIGFk
ZXZjLT5zZW5kX2V2ZW50ID0gdmlydF9zZW5kX2dlZDsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNv
bnN0IFR5cGVJbmZvIHZpcnRfYWNwaV9pbmZvID0gew0KPiA+ICsgICAgLm5hbWUgICAgICAgICAg
PSBUWVBFX1ZJUlRfQUNQSSwNCj4gPiArICAgIC5wYXJlbnQgICAgICAgID0gVFlQRV9TWVNfQlVT
X0RFVklDRSwNCj4gPiArICAgIC5pbnN0YW5jZV9zaXplID0gc2l6ZW9mKFZpcnRBY3BpU3RhdGUp
LA0KPiA+ICsgICAgLmNsYXNzX2luaXQgICAgPSB2aXJ0X2FjcGlfY2xhc3NfaW5pdCwNCj4gPiAr
ICAgIC5pbnRlcmZhY2VzID0gKEludGVyZmFjZUluZm9bXSkgew0KPiA+ICsgICAgICAgIHsgVFlQ
RV9IT1RQTFVHX0hBTkRMRVIgfSwNCj4gPiArICAgICAgICB7IFRZUEVfQUNQSV9ERVZJQ0VfSUYg
fSwNCj4gPiArICAgICAgICB7IH0NCj4gPiArICAgIH0NCj4gPiArfTsNCj4gPiArDQo+ID4gK3N0
YXRpYyB2b2lkIHZpcnRfYWNwaV9yZWdpc3Rlcl90eXBlcyh2b2lkKSB7DQo+ID4gKyAgICB0eXBl
X3JlZ2lzdGVyX3N0YXRpYygmdmlydF9hY3BpX2luZm8pOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICt0
eXBlX2luaXQodmlydF9hY3BpX3JlZ2lzdGVyX3R5cGVzKQ0KPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2h3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuaA0KPiA+IGIvaW5jbHVkZS9ody9hY3Bp
L2dlbmVyaWNfZXZlbnRfZGV2aWNlLmgNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGlu
ZGV4IDAwMDAwMDAuLmYzMTQ1MTUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvaW5jbHVk
ZS9ody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmgNCj4gPiBAQCAtMCwwICsxLDI5IEBADQo+
ID4gKy8qDQo+ID4gKyAqDQo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAxOCBJbnRlbCBDb3Jwb3Jh
dGlvbg0KPiA+ICsgKg0KPiA+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91
IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yDQo+ID4gK21vZGlmeSBpdA0KPiA+ICsgKiB1bmRl
ciB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlLA0KPiA+ICsgKiB2ZXJzaW9uIDIgb3IgbGF0ZXIsIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLg0KPiA+ICsgKg0KPiA+ICsgKiBUaGlzIHByb2dyYW0gaXMg
ZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgaXQgd2lsbCBiZSB1c2VmdWwsIGJ1dA0KPiA+ICtXSVRI
T1VUDQo+ID4gKyAqIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJh
bnR5IG9mDQo+IE1FUkNIQU5UQUJJTElUWQ0KPiA+ICtvcg0KPiA+ICsgKiBGSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VIEdlbmVyYWwgUHVibGljDQo+ID4gK0xp
Y2Vuc2UgZm9yDQo+ID4gKyAqIG1vcmUgZGV0YWlscy4NCj4gPiArICoNCj4gPiArICogWW91IHNo
b3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UNCj4gPiArYWxvbmcgd2l0aA0KPiA+ICsgKiB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8
aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uDQo+ID4gKyAqLw0KPiBBZGQgYSBjb21tZW50
IGluIHRoZSBoZWFkZXIgaW50cm9kdWNpbmcgd2hhdCBpcyB0aGUgcm9sZSBvZiB0aGlzIGRldmlj
ZT8NCj4gbGluayB0byBHRUQgc3BlYz8gRXhwbGFpbiB0aGUgc3Vic2V0IG9mIHRoZSBpbnRlcmZh
Y2VzIGJlaW5nIGltcGxlbWVudGVkIGJ5DQo+IHRoZSBkZXZpY2UuDQoNCk9rLiBJIGhhdmUgYWRk
ZWQgY29tbWVudHMgdG8gdGhhdCBlZmZlY3QgaW4gcGF0Y2ggIzEwLCBidXQgSSB0aGluayBJIHdp
bGwgbWFrZSBpdA0KY2xlYXIgaGVyZSBhcyB3ZWxsLg0KDQpDaGVlcnMsDQpTaGFtZWVyDQoNCj4g
PiArDQo+ID4gKyNpZm5kZWYgSFdfQUNQSV9HRURfSA0KPiA+ICsjZGVmaW5lIEhXX0FDUElfR0VE
X0gNCj4gPiArDQo+ID4gKyNkZWZpbmUgVFlQRV9WSVJUX0FDUEkgInZpcnQtYWNwaSINCj4gPiAr
I2RlZmluZSBWSVJUX0FDUEkob2JqKSBcDQo+ID4gKyAgICBPQkpFQ1RfQ0hFQ0soVmlydEFjcGlT
dGF0ZSwgKG9iaiksIFRZUEVfVklSVF9BQ1BJKQ0KPiA+ICsNCj4gPiArdHlwZWRlZiBzdHJ1Y3Qg
VmlydEFjcGlTdGF0ZSB7DQo+ID4gKyAgICBTeXNCdXNEZXZpY2UgcGFyZW50X29iajsNCj4gPiAr
fSBWaXJ0QWNwaVN0YXRlOw0KPiA+ICsNCj4gPiArI2VuZGlmDQo+ID4NCg==
