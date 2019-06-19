Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp395965wrg;
        Wed, 19 Jun 2019 01:17:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyk76g2F+NJM95bb757FQhZ9qBqod5MeP3/gF3A1GOVVXAsBUO2gano9KJV2dkZEWCXXQcf
X-Received: by 2002:a17:906:3ecd:: with SMTP id d13mr1410264ejj.272.1560932266566;
        Wed, 19 Jun 2019 01:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560932266; cv=none;
        d=google.com; s=arc-20160816;
        b=ykbJRQg3Ti9OychInpH3roEesynvZno/CRUMaMEy3ROyt2WkSxZy5nvw5WxysQ4KbY
         hq0k+hc9T507f74Kc3bIA/pqASBgr74vwOfuzSudeO26CXOquyNU1FRnyny2CKqqW+hV
         a0DeOkS0/+VQbCGOrS0lebEU0grCK6SwJdfHnRaVDuS6STAcPK2ioOjFOsjECDh0lan/
         LCAPWbcaD746j1l+p3kayTUWG1ayhJw4sWWC28tTcTUu7vAbWEHqpqBZ5PQvOmpyBvwe
         Ulvp0GoblaMHBWOjc0oduLA0cfZhbMfX1ZhhvBYwcXNRTMRo/9ILcFnqufs8gbMK5+th
         otfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=6PhVlxnlEzPhmiz55LYSwSlTa4LnoW/MlRHE+wWTp4E=;
        b=LAkgLrqlKaCTV4P5qf/rC/n7kzBD8qyunSx8JtqGZO5q64kKim4Cte8k90aV/zkBNg
         zWTEjkkqyR/54B6nWOnt2GYudxrbQTTJ/XiJo12xX8vs8I+XuH8SzkxLfBrArsvkq+9O
         qApNn6Zd9Ci3bhrHDT3x2cnn+c2fU+wSWvMIgLNiW8OJQqbUErOLVtC7P6rZbWsYPZ4E
         clOQW7AS2cqltDZF0Jz5s5vNmu+Hvn5uZaeX9YFMzjJOj9L2zinPly70DWuWWVuRGJPq
         yoO2ZnMv/3YmNjHB8nZDFPBwskKk3WUHxWgdHYuu0tDm21YBmwzsrgLptzBwG1XgNB/h
         UCPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si10328336eji.362.2019.06.19.01.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 01:17:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdVmr-0007RO-L5
	for alex.bennee@linaro.org; Wed, 19 Jun 2019 04:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41928)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hdVld-0006sn-5a
 for qemu-arm@nongnu.org; Wed, 19 Jun 2019 04:16:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hdVlb-0005uy-LT
 for qemu-arm@nongnu.org; Wed, 19 Jun 2019 04:16:29 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45414 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hdVlb-0005uP-AS; Wed, 19 Jun 2019 04:16:27 -0400
Received: from lhreml708-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 322314196A6191F9F573;
 Wed, 19 Jun 2019 09:16:26 +0100 (IST)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.112]) by
 lhreml708-cah.china.huawei.com ([10.201.108.49]) with mapi id 14.03.0415.000; 
 Wed, 19 Jun 2019 09:16:16 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Thread-Topic: [PATCH v5 4/8] hw/arm/virt: Add memory hotplug framework
Thread-Index: AQHVELrbLMyPceJJRU27m8+Ob8J+pqahdEQAgAFYkfA=
Date: Wed, 19 Jun 2019 08:16:15 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA83F2AA94E@lhreml524-mbs.china.huawei.com>
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
 <20190522162252.28568-5-shameerali.kolothum.thodi@huawei.com>
 <5e59ade1-91ab-e9c8-2c41-97217355c612@redhat.com>
In-Reply-To: <5e59ade1-91ab-e9c8-2c41-97217355c612@redhat.com>
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
Subject: Re: [Qemu-arm] [PATCH v5 4/8] hw/arm/virt: Add memory hotplug
 framework
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sameo@linux.intel.com" <sameo@linux.intel.com>,
 "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
 "xuwei \(O\)" <xuwei5@huawei.com>, "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q17nNWQJypZS

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWdlciBF
cmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50OiAxOCBKdW5lIDIwMTkg
MTM6NDINCj4gVG86IFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkgPHNoYW1lZXJhbGkua29sb3Ro
dW0udGhvZGlAaHVhd2VpLmNvbT47DQo+IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1hcm1A
bm9uZ251Lm9yZzsgaW1hbW1lZG9AcmVkaGF0LmNvbQ0KPiBDYzogcGV0ZXIubWF5ZGVsbEBsaW5h
cm8ub3JnOyBzaGFubm9uLnpoYW9zbEBnbWFpbC5jb207DQo+IHNhbWVvQGxpbnV4LmludGVsLmNv
bTsgc2ViYXN0aWVuLmJvZXVmQGludGVsLmNvbTsgeHV3ZWkgKE8pDQo+IDx4dXdlaTVAaHVhd2Vp
LmNvbT47IGxlcnNla0ByZWRoYXQuY29tOyBhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnOw0KPiBM
aW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSA0
LzhdIGh3L2FybS92aXJ0OiBBZGQgbWVtb3J5IGhvdHBsdWcgZnJhbWV3b3JrDQo+IA0KPiBIaSBT
aGFtZWVyLA0KPiANCj4gT24gNS8yMi8xOSA2OjIyIFBNLCBTaGFtZWVyIEtvbG90aHVtIHdyb3Rl
Og0KPiA+IEZyb206IEVyaWMgQXVnZXIgPGVyaWMuYXVnZXJAcmVkaGF0LmNvbT4NCj4gPg0KPiA+
IFRoaXMgcGF0Y2ggYWRkcyB0aGUgbWVtb3J5IGhvdC1wbHVnL2hvdC11bnBsdWcgaW5mcmFzdHJ1
Y3R1cmUgaW4NCj4gPiBtYWNodmlydC4gVGhlIGRldmljZSBtZW1vcnkgaXMgbm90IHlldCBleHBv
c2VkIHRvIHRoZSBHdWVzdCBlaXRoZXINCj4gPiB0aHJvdWdoIERUIG9yIEFDUEkgYW5kIGhlbmNl
IGJvdGggY29sZC9ob3QgcGx1ZyBvZiBtZW1vcnkgaXMNCj4gPiBleHBsaWNpdGx5IGRpc2FibGVk
IGZvciBub3cuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBFcmljIEF1Z2VyIDxlcmljLmF1Z2Vy
QHJlZGhhdC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogS3dhbmd3b28gTGVlIDxrd2FuZ3dvby5s
ZWVAc2suY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNoYW1lZXIgS29sb3RodW0gPHNoYW1lZXJh
bGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAgaHcvYXJtL0tjb25m
aWcgfCAgMiArKw0KPiA+ICBody9hcm0vdmlydC5jICB8IDUxDQo+ID4gKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA1MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
aHcvYXJtL0tjb25maWcgYi9ody9hcm0vS2NvbmZpZyBpbmRleA0KPiA+IGFmOGNmZmRlOWMuLjZl
ZjIyNDM5YjUgMTAwNjQ0DQo+ID4gLS0tIGEvaHcvYXJtL0tjb25maWcNCj4gPiArKysgYi9ody9h
cm0vS2NvbmZpZw0KPiA+IEBAIC0xOSw2ICsxOSw4IEBAIGNvbmZpZyBBUk1fVklSVA0KPiA+ICAg
ICAgc2VsZWN0IFBMQVRGT1JNX0JVUw0KPiA+ICAgICAgc2VsZWN0IFNNQklPUw0KPiA+ICAgICAg
c2VsZWN0IFZJUlRJT19NTUlPDQo+IHNtYWxsIGNvbmZsaWN0IHRvIGJlIHJlc29sdmVkIGhlcmUg
YWZ0ZXIgYWRkaXRpb24gb2YgInNlbGVjdCBBQ1BJX1BDSSIuDQoNCk9rLiBJIHdpbGwgYWRkcmVz
cyB0aGF0IGluIG5leHQgcmV2aXNpb24uDQoNClRoYW5rcywNClNoYW1lZXINCg0KPiA+ICsgICAg
c2VsZWN0IE1FTV9ERVZJQ0UNCj4gPiArICAgIHNlbGVjdCBESU1NDQo+ID4NCj4gPiAgY29uZmln
IENIRUVUQUgNCj4gPiAgICAgIGJvb2wNCj4gPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL3ZpcnQuYyBi
L2h3L2FybS92aXJ0LmMgaW5kZXgNCj4gPiA1MzMxYWI3MWUyLi4zZGY4YzM4OWZmIDEwMDY0NA0K
PiA+IC0tLSBhL2h3L2FybS92aXJ0LmMNCj4gPiArKysgYi9ody9hcm0vdmlydC5jDQo+ID4gQEAg
LTYyLDYgKzYyLDggQEANCj4gPiAgI2luY2x1ZGUgImh3L2FybS9zbW11djMuaCINCj4gPiAgI2lu
Y2x1ZGUgImh3L2FjcGkvYWNwaS5oIg0KPiA+ICAjaW5jbHVkZSAidGFyZ2V0L2FybS9pbnRlcm5h
bHMuaCINCj4gPiArI2luY2x1ZGUgImh3L21lbS9wYy1kaW1tLmgiDQo+ID4gKyNpbmNsdWRlICJo
dy9tZW0vbnZkaW1tLmgiPg0KPiA+ICAjZGVmaW5lIERFRklORV9WSVJUX01BQ0hJTkVfTEFURVNU
KG1ham9yLCBtaW5vciwgbGF0ZXN0KSBcDQo+ID4gICAgICBzdGF0aWMgdm9pZCB2aXJ0XyMjbWFq
b3IjI18jI21pbm9yIyNfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqb2MsDQo+ID4gXCBAQCAtMTg2
Miw2ICsxODY0LDQwIEBAIHN0YXRpYyBjb25zdCBDUFVBcmNoSWRMaXN0DQo+ICp2aXJ0X3Bvc3Np
YmxlX2NwdV9hcmNoX2lkcyhNYWNoaW5lU3RhdGUgKm1zKQ0KPiA+ICAgICAgcmV0dXJuIG1zLT5w
b3NzaWJsZV9jcHVzOw0KPiA+ICB9DQo+ID4NCj4gPiArc3RhdGljIHZvaWQgdmlydF9tZW1vcnlf
cHJlX3BsdWcoSG90cGx1Z0hhbmRsZXIgKmhvdHBsdWdfZGV2LA0KPiBEZXZpY2VTdGF0ZSAqZGV2
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFcnJvciAqKmVycnApIHsN
Cj4gPiArDQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogVGhlIGRldmljZSBtZW1vcnkgaXMgbm90
IHlldCBleHBvc2VkIHRvIHRoZSBHdWVzdCBlaXRoZXIgdGhyb3VnaD4NCj4gKyAgICAgKiBEVCBv
ciBBQ1BJIGFuZCBoZW5jZSBib3RoIGNvbGQvaG90IHBsdWcgb2YgbWVtb3J5IGlzIGV4cGxpY2l0
bHkNCj4gPiArICAgICAqIGRpc2FibGVkIGZvciBub3cuDQo+ID4gKyAgICAgKi8NCj4gPiArICAg
IGlmIChvYmplY3RfZHluYW1pY19jYXN0KE9CSkVDVChkZXYpLCBUWVBFX1BDX0RJTU0pKSB7DQo+
ID4gKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAibWVtb3J5IGNvbGQvaG90IHBsdWcgaXMgbm90
IHlldCBzdXBwb3J0ZWQiKTsNCj4gPiArICAgICAgICByZXR1cm47DQo+ID4gKyAgICB9DQo+ID4g
Kw0KPiA+ICsgICAgcGNfZGltbV9wcmVfcGx1ZyhQQ19ESU1NKGRldiksIE1BQ0hJTkUoaG90cGx1
Z19kZXYpLCBOVUxMLA0KPiBlcnJwKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQg
dmlydF9tZW1vcnlfcGx1ZyhIb3RwbHVnSGFuZGxlciAqaG90cGx1Z19kZXYsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKSB7
DQo+ID4gKyAgICBWaXJ0TWFjaGluZVN0YXRlICp2bXMgPSBWSVJUX01BQ0hJTkUoaG90cGx1Z19k
ZXYpOw0KPiA+ICsNCj4gPiArICAgIHBjX2RpbW1fcGx1ZyhQQ19ESU1NKGRldiksIE1BQ0hJTkUo
dm1zKSwgTlVMTCk7DQo+ID4gKw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCB2aXJ0
X21hY2hpbmVfZGV2aWNlX3ByZV9wbHVnX2NiKEhvdHBsdWdIYW5kbGVyICpob3RwbHVnX2RldiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEZXZpY2VT
dGF0ZSAqZGV2LA0KPiBFcnJvcg0KPiA+ICsqKmVycnApIHsNCj4gPiArICAgIGlmIChvYmplY3Rf
ZHluYW1pY19jYXN0KE9CSkVDVChkZXYpLCBUWVBFX1BDX0RJTU0pKSB7DQo+ID4gKyAgICAgICAg
dmlydF9tZW1vcnlfcHJlX3BsdWcoaG90cGx1Z19kZXYsIGRldiwgZXJycCk7DQo+ID4gKyAgICB9
DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIHZpcnRfbWFjaGluZV9kZXZpY2VfcGx1
Z19jYihIb3RwbHVnSGFuZGxlciAqaG90cGx1Z19kZXYsDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvcg0KPiA+ICoqZXJy
cCkgIHsgQEAgLTE4NzMsMTIgKzE5MDksMjMgQEAgc3RhdGljIHZvaWQNCj4gPiB2aXJ0X21hY2hp
bmVfZGV2aWNlX3BsdWdfY2IoSG90cGx1Z0hhbmRsZXIgKmhvdHBsdWdfZGV2LA0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU1lTX0JVU19ERVZJQ0UoZGV2KSk7DQo+
ID4gICAgICAgICAgfQ0KPiA+ICAgICAgfQ0KPiA+ICsgICAgaWYgKG9iamVjdF9keW5hbWljX2Nh
c3QoT0JKRUNUKGRldiksIFRZUEVfUENfRElNTSkpIHsNCj4gPiArICAgICAgICB2aXJ0X21lbW9y
eV9wbHVnKGhvdHBsdWdfZGV2LCBkZXYsIGVycnApOw0KPiA+ICsgICAgfQ0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgdm9pZCB2aXJ0X21hY2hpbmVfZGV2aWNlX3VucGx1Z19yZXF1ZXN0X2Ni
KEhvdHBsdWdIYW5kbGVyDQo+ICpob3RwbHVnX2RldiwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgRGV2aWNlU3RhdGUgKmRldiwgRXJyb3INCj4gPiArKipl
cnJwKSB7DQo+ID4gKyAgICBlcnJvcl9zZXRnKGVycnAsICJkZXZpY2UgdW5wbHVnIHJlcXVlc3Qg
Zm9yIHVuc3VwcG9ydGVkIGRldmljZSINCj4gPiArICAgICAgICAgICAgICAgIiB0eXBlOiAlcyIs
IG9iamVjdF9nZXRfdHlwZW5hbWUoT0JKRUNUKGRldikpKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0
YXRpYyBIb3RwbHVnSGFuZGxlciAqdmlydF9tYWNoaW5lX2dldF9ob3RwbHVnX2hhbmRsZXIoTWFj
aGluZVN0YXRlDQo+ICptYWNoaW5lLA0KPiA+DQo+IERldmljZVN0YXRlDQo+ID4gKmRldikgIHsN
Cj4gPiAtICAgIGlmIChvYmplY3RfZHluYW1pY19jYXN0KE9CSkVDVChkZXYpLCBUWVBFX1NZU19C
VVNfREVWSUNFKSkgew0KPiA+ICsgICAgaWYgKG9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRl
diksIFRZUEVfU1lTX0JVU19ERVZJQ0UpIHx8DQo+ID4gKyAgICAgICAob2JqZWN0X2R5bmFtaWNf
Y2FzdChPQkpFQ1QoZGV2KSwgVFlQRV9QQ19ESU1NKSkpIHsNCj4gPiAgICAgICAgICByZXR1cm4g
SE9UUExVR19IQU5ETEVSKG1hY2hpbmUpOw0KPiA+ICAgICAgfQ0KPiA+DQo+ID4gQEAgLTE5NDIs
NyArMTk4OSw5IEBAIHN0YXRpYyB2b2lkIHZpcnRfbWFjaGluZV9jbGFzc19pbml0KE9iamVjdENs
YXNzDQo+ICpvYywgdm9pZCAqZGF0YSkNCj4gPiAgICAgIG1jLT5rdm1fdHlwZSA9IHZpcnRfa3Zt
X3R5cGU7DQo+ID4gICAgICBhc3NlcnQoIW1jLT5nZXRfaG90cGx1Z19oYW5kbGVyKTsNCj4gPiAg
ICAgIG1jLT5nZXRfaG90cGx1Z19oYW5kbGVyID0gdmlydF9tYWNoaW5lX2dldF9ob3RwbHVnX2hh
bmRsZXI7DQo+ID4gKyAgICBoYy0+cHJlX3BsdWcgPSB2aXJ0X21hY2hpbmVfZGV2aWNlX3ByZV9w
bHVnX2NiOw0KPiA+ICAgICAgaGMtPnBsdWcgPSB2aXJ0X21hY2hpbmVfZGV2aWNlX3BsdWdfY2I7
DQo+ID4gKyAgICBoYy0+dW5wbHVnX3JlcXVlc3QgPSB2aXJ0X21hY2hpbmVfZGV2aWNlX3VucGx1
Z19yZXF1ZXN0X2NiOw0KPiA+ICB9DQo+ID4NCj4gPiAgc3RhdGljIHZvaWQgdmlydF9pbnN0YW5j
ZV9pbml0KE9iamVjdCAqb2JqKQ0KPiA+DQo+IFRoYW5rcw0KPiANCj4gRXJpYw0K
