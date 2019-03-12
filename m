Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp717901wrs;
        Tue, 12 Mar 2019 10:09:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0hoL8TNZ8n1PEl+pV1JzTT90YVxBTxvlUsK4DOzMsDBOKcYDrGvAjY1h/RJ9XCbg2pboy
X-Received: by 2002:a0d:c9c2:: with SMTP id l185mr8744422ywd.227.1552410597840;
        Tue, 12 Mar 2019 10:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552410597; cv=none;
        d=google.com; s=arc-20160816;
        b=XMtL+Kuzwf4xtt6I6zB+1LTwsYOAJ2wPuKl8rA/ate+EVom8kj2DsLxPsjlCnlQEA+
         jPTJGBwaOarJT3ZxDZPQTAylg7OuPX0RJkodvMOko5qGPTrpQfQFSTg9E+xGsQloRAZa
         W+QIhD1pq/+oqY1ONKvXMQn00r/Xg0xra09pK6MSPJ4vqZ32OxwlAP6EZBVaGA9BpfZK
         uKxsiWIXLuCytIirF7UNUBR+8ZqiQFSl49VWJM1G4LuWZrYaJ6kl3EMBbuj50jWGUAUK
         xdbAF/EKGX83Ouy2tOLBEGc299TafduSwlemK4+0/ocx2spK62spYsMLsPpg2pgtDu44
         0WlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=rgnIX9JwBPSCvw64hfaomi6LZtLOmVG72ztH36pN/0Q=;
        b=L0yn6Z44uXlYlhVmF8QXnQX0GZ1qljay/gu3bjGfD8LvKevHTohDK2Yw+NvYlAPuM0
         oAsYNSqaq9//oDESUisX3zIIXuA8E8oJYBBlKO/+hGmDuats80m0v7115y7mcbUyU5er
         hcK7eL+UaheblKu7IobEeZU9aM0V/cf+wMXFoOK9iRJvCrZuWZGQQEHdt0bkvEtW3k1I
         NuVIQWC0qPy50P8bJHX9d+d+i0WPu82E+fVf3w8OwYVsgSsK7OQwX5oRZZAxRoLhSf9J
         wukg/qXQjT0qFUVvN0YyFL7Ev2QKcbQECjMFL+1R4fbJdmuCzMbLKZ37h6FrF42IiN/x
         hTJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si5354615ywe.292.2019.03.12.10.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 10:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:56076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3kub-0006wk-3U
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 13:09:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3khn-0004o4-VW
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 12:56:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3khm-0003kh-Fg
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 12:56:43 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45365 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3khm-0003jK-53; Tue, 12 Mar 2019 12:56:42 -0400
Received: from lhreml701-cah.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id 8BB1D79C78F78C7A44E5;
	Tue, 12 Mar 2019 16:56:39 +0000 (GMT)
Received: from LHREML524-MBB.china.huawei.com ([169.254.3.135]) by
	lhreml701-cah.china.huawei.com ([10.201.108.42]) with mapi id
	14.03.0415.000; Tue, 12 Mar 2019 16:56:32 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH v2 08/11] hw/arm/boot: Expose the PC-DIMM
	nodes in the DT
Thread-Index: AQHU1aRx9hViP7MrKUKDA7jHJKP06KYGip6AgAGSmyCAAAqwgIAAD+hAgAADlQCAAACLsA==
Date: Tue, 12 Mar 2019 16:56:32 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839305FFC@lhreml524-mbb.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-9-shameerali.kolothum.thodi@huawei.com>
	<20190311155857.78c6703d@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839305DC1@lhreml524-mbb.china.huawei.com>
	<640f3fde-5197-ddbc-924e-fba301a142ca@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839305F81@lhreml524-mbb.china.huawei.com>
	<90bf7b78-99c2-4950-32db-ebfb9048c76d@redhat.com>
In-Reply-To: <90bf7b78-99c2-4950-32db-ebfb9048c76d@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.84.144]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 08/11] hw/arm/boot: Expose
 the PC-DIMM nodes in the DT
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vHdBDflEICrg

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWdlciBF
cmljIFttYWlsdG86ZXJpYy5hdWdlckByZWRoYXQuY29tXQ0KPiBTZW50OiAxMiBNYXJjaCAyMDE5
IDE2OjQ4DQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtvbG90
aHVtLnRob2RpQGh1YXdlaS5jb20+Ow0KPiBJZ29yIE1hbW1lZG92IDxpbWFtbWVkb0ByZWRoYXQu
Y29tPg0KPiBDYzogcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyBzYW1lb0BsaW51eC5pbnRlbC5j
b207DQo+IHNoYW5ub24uemhhb3NsQGdtYWlsLmNvbTsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBM
aW51eGFybQ0KPiA8bGludXhhcm1AaHVhd2VpLmNvbT47IHFlbXUtYXJtQG5vbmdudS5vcmc7IHh1
d2VpIChPKQ0KPiA8eHV3ZWk1QGh1YXdlaS5jb20+OyBzZWJhc3RpZW4uYm9ldWZAaW50ZWwuY29t
DQo+IFN1YmplY3Q6IFJlOiBbUWVtdS1kZXZlbF0gW1BBVENIIHYyIDA4LzExXSBody9hcm0vYm9v
dDogRXhwb3NlIHRoZQ0KPiBQQy1ESU1NIG5vZGVzIGluIHRoZSBEVA0KPiANCj4gSGkgU2hhbWVl
ciwNCj4gDQo+IE9uIDMvMTIvMTkgNTozOSBQTSwgU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSB3
cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZy
b206IEF1Z2VyIEVyaWMgW21haWx0bzplcmljLmF1Z2VyQHJlZGhhdC5jb21dDQo+ID4+IFNlbnQ6
IDEyIE1hcmNoIDIwMTkgMTU6MzgNCj4gPj4gVG86IFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkg
PHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT47DQo+ID4+IElnb3IgTWFtbWVk
b3YgPGltYW1tZWRvQHJlZGhhdC5jb20+DQo+ID4+IENjOiBwZXRlci5tYXlkZWxsQGxpbmFyby5v
cmc7IHNhbWVvQGxpbnV4LmludGVsLmNvbTsNCj4gPj4gc2hhbm5vbi56aGFvc2xAZ21haWwuY29t
OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IExpbnV4YXJtDQo+ID4+IDxsaW51eGFybUBodWF3ZWku
Y29tPjsgcWVtdS1hcm1Abm9uZ251Lm9yZzsgeHV3ZWkgKE8pDQo+ID4+IDx4dXdlaTVAaHVhd2Vp
LmNvbT47IHNlYmFzdGllbi5ib2V1ZkBpbnRlbC5jb20NCj4gPj4gU3ViamVjdDogUmU6IFtRZW11
LWRldmVsXSBbUEFUQ0ggdjIgMDgvMTFdIGh3L2FybS9ib290OiBFeHBvc2UgdGhlDQo+ID4+IFBD
LURJTU0gbm9kZXMgaW4gdGhlIERUDQo+ID4+DQo+ID4+IEhpIFNoYW1lZXIsDQo+ID4+DQo+ID4+
IE9uIDMvMTIvMTkgNDoxMyBQTSwgU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaSB3cm90ZToNCj4g
Pj4+DQo+ID4+Pg0KPiA+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4gRnJv
bTogSWdvciBNYW1tZWRvdiBbbWFpbHRvOmltYW1tZWRvQHJlZGhhdC5jb21dDQo+ID4+Pj4gU2Vu
dDogMTEgTWFyY2ggMjAxOSAxNDo1OQ0KPiA+Pj4+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRo
b2RpDQo+IDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+DQo+ID4+Pj4gQ2M6
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1hcm1Abm9uZ251Lm9yZzsNCj4gPj4+PiBlcmlj
LmF1Z2VyQHJlZGhhdC5jb207IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsNCj4gPj4+PiBzaGFu
bm9uLnpoYW9zbEBnbWFpbC5jb207IHNhbWVvQGxpbnV4LmludGVsLmNvbTsNCj4gPj4+PiBzZWJh
c3RpZW4uYm9ldWZAaW50ZWwuY29tOyBMaW51eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT47IHh1
d2VpDQo+IChPKQ0KPiA+Pj4+IDx4dXdlaTVAaHVhd2VpLmNvbT4NCj4gPj4+PiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYyIDA4LzExXSBody9hcm0vYm9vdDogRXhwb3NlIHRoZSBQQy1ESU1NIG5vZGVz
DQo+IGluDQo+ID4+IHRoZQ0KPiA+Pj4+IERUDQo+ID4+Pj4NCj4gPj4+PiBPbiBGcmksIDggTWFy
IDIwMTkgMTE6NDI6MTUgKzAwMDANCj4gPj4+PiBTaGFtZWVyIEtvbG90aHVtIDxzaGFtZWVyYWxp
LmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+IHdyb3RlOg0KPiA+Pj4+DQo+ID4+Pj4+IFRoaXMg
cGF0Y2ggYWRkcyBtZW1vcnkgbm9kZXMgY29ycmVzcG9uZGluZyB0byBQQy1ESU1NIHJlZ2lvbnMu
DQo+ID4+Pj4+DQo+ID4+Pj4+IE5WRElNTSBhbmQgQUNQSV9OVkRJTU0gY29uZmlncyBhcmUgbm90
IHlldCBzZXQgZm9yIEFSTSBzbyB3ZQ0KPiA+Pj4+PiBkb24ndCBuZWVkIHRvIGNhcmUgYWJvdXQg
TlZESU1NIGF0IHRoaXMgc3RhZ2UuDQo+ID4+Pj4+DQo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IFNo
YW1lZXIgS29sb3RodW0NCj4gPj4gPHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNv
bT4NCj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogRXJpYyBBdWdlciA8ZXJpYy5hdWdlckByZWRoYXQu
Y29tPg0KPiA+Pj4+PiAtLS0NCj4gPj4+Pj4gIGh3L2FybS9ib290LmMgfCA0Mg0KPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPj4+Pj4gIDEgZmlsZSBjaGFu
Z2VkLCA0MiBpbnNlcnRpb25zKCspDQo+ID4+Pj4+DQo+ID4+Pj4+IGRpZmYgLS1naXQgYS9ody9h
cm0vYm9vdC5jIGIvaHcvYXJtL2Jvb3QuYw0KPiA+Pj4+PiBpbmRleCBhODMwNjU1Li40Y2FhZjkx
IDEwMDY0NA0KPiA+Pj4+PiAtLS0gYS9ody9hcm0vYm9vdC5jDQo+ID4+Pj4+ICsrKyBiL2h3L2Fy
bS9ib290LmMNCj4gPj4+Pj4gQEAgLTE5LDYgKzE5LDcgQEANCj4gPj4+Pj4gICNpbmNsdWRlICJz
eXNlbXUvbnVtYS5oIg0KPiA+Pj4+PiAgI2luY2x1ZGUgImh3L2JvYXJkcy5oIg0KPiA+Pj4+PiAg
I2luY2x1ZGUgImh3L2xvYWRlci5oIg0KPiA+Pj4+PiArI2luY2x1ZGUgImh3L21lbS9tZW1vcnkt
ZGV2aWNlLmgiDQo+ID4+Pj4+ICAjaW5jbHVkZSAiZWxmLmgiDQo+ID4+Pj4+ICAjaW5jbHVkZSAi
c3lzZW11L2RldmljZV90cmVlLmgiDQo+ID4+Pj4+ICAjaW5jbHVkZSAicWVtdS9jb25maWctZmls
ZS5oIg0KPiA+Pj4+PiBAQCAtNTIyLDYgKzUyMyw0MSBAQCBzdGF0aWMgdm9pZCBmZHRfYWRkX3Bz
Y2lfbm9kZSh2b2lkICpmZHQpDQo+ID4+Pj4+ICAgICAgcWVtdV9mZHRfc2V0cHJvcF9jZWxsKGZk
dCwgIi9wc2NpIiwgIm1pZ3JhdGUiLCBtaWdyYXRlX2ZuKTsNCj4gPj4+Pj4gIH0NCj4gPj4+Pj4N
Cj4gPj4+Pj4gK3N0YXRpYyBpbnQgZmR0X2FkZF9ob3RwbHVnZ2FibGVfbWVtb3J5X25vZGVzKHZv
aWQgKmZkdCwNCj4gPj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVpbnQzMl90IGFjZWxscywNCj4gPj4+PiB1aW50MzJfdCBzY2VsbHMpIHsNCj4gPj4+
Pj4gKyAgICBNZW1vcnlEZXZpY2VJbmZvTGlzdCAqaW5mbywgKmluZm9fbGlzdCA9DQo+IHFtcF9t
ZW1vcnlfZGV2aWNlX2xpc3QoKTsNCj4gPj4+Pj4gKyAgICBNZW1vcnlEZXZpY2VJbmZvICptaTsN
Cj4gPj4+Pj4gKyAgICBpbnQgcmV0ID0gMDsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArICAgIGZvciAo
aW5mbyA9IGluZm9fbGlzdDsgaW5mbyAhPSBOVUxMOyBpbmZvID0gaW5mby0+bmV4dCkgew0KPiA+
Pj4+PiArICAgICAgICBtaSA9IGluZm8tPnZhbHVlOw0KPiA+Pj4+PiArICAgICAgICBzd2l0Y2gg
KG1pLT50eXBlKSB7DQo+ID4+Pj4+ICsgICAgICAgIGNhc2UgTUVNT1JZX0RFVklDRV9JTkZPX0tJ
TkRfRElNTToNCj4gPj4+Pj4gKyAgICAgICAgew0KPiA+Pj4+PiArICAgICAgICAgICAgUENESU1N
RGV2aWNlSW5mbyAqZGkgPSBtaS0+dS5kaW1tLmRhdGE7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAg
ICAgICAgICAgIHJldCA9IGZkdF9hZGRfbWVtb3J5X25vZGUoZmR0LCBhY2VsbHMsIGRpLT5hZGRy
LA0KPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzY2VsbHMs
IGRpLT5zaXplLA0KPiBkaS0+bm9kZSk7DQo+ID4+Pj4+ICsgICAgICAgICAgICBpZiAocmV0KSB7
DQo+ID4+Pj4+ICsgICAgICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsDQo+ID4+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAiY291bGRuJ3QgYWRkIFBDRElNTQ0KPiA+PiAvbWVtb3J5QCUi
UFJJeDY0Ig0KPiA+Pj4+IG5vZGVcbiIsDQo+ID4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICBkaS0+YWRkcik7DQo+ID4+Pj4+ICsgICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+ID4+Pj4+
ICsgICAgICAgICAgICB9DQo+ID4+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4gPj4+Pj4gKyAg
ICAgICAgfQ0KPiA+Pj4+PiArICAgICAgICBkZWZhdWx0Og0KPiA+Pj4+PiArICAgICAgICAgICAg
ZnByaW50ZihzdGRlcnIsICIlcyBtZW1vcnkgbm9kZXMgYXJlIG5vdCB5ZXQNCj4gPj4gc3VwcG9y
dGVkXG4iLA0KPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICBNZW1vcnlEZXZpY2VJbmZvS2lu
ZF9zdHIobWktPnR5cGUpKTsNCj4gPj4+Pj4gKyAgICAgICAgICAgIHJldCA9IC1FTk9FTlQ7DQo+
ID4+Pj4+ICsgICAgICAgICAgICBnb3RvIG91dDsNCj4gPj4+Pj4gKyAgICAgICAgfQ0KPiA+Pj4+
PiArICAgIH0NCj4gPj4+Pj4gK291dDoNCj4gPj4+Pj4gKyAgICBxYXBpX2ZyZWVfTWVtb3J5RGV2
aWNlSW5mb0xpc3QoaW5mb19saXN0KTsNCj4gPj4+Pj4gKyAgICByZXR1cm4gcmV0Ow0KPiA+Pj4+
PiArfQ0KPiA+Pj4+PiArDQo+ID4+Pj4+ICBpbnQgYXJtX2xvYWRfZHRiKGh3YWRkciBhZGRyLCBj
b25zdCBzdHJ1Y3QgYXJtX2Jvb3RfaW5mbyAqYmluZm8sDQo+ID4+Pj4+ICAgICAgICAgICAgICAg
ICAgIGh3YWRkciBhZGRyX2xpbWl0LCBBZGRyZXNzU3BhY2UgKmFzKQ0KPiA+Pj4+PiAgew0KPiA+
Pj4+PiBAQCAtNjIxLDYgKzY1NywxMiBAQCBpbnQgYXJtX2xvYWRfZHRiKGh3YWRkciBhZGRyLCBj
b25zdCBzdHJ1Y3QNCj4gPj4+PiBhcm1fYm9vdF9pbmZvICpiaW5mbywNCj4gPj4+Pj4gICAgICAg
ICAgfQ0KPiA+Pj4+PiAgICAgIH0NCj4gPj4+Pj4NCj4gPj4+Pj4gKyAgICByYyA9IGZkdF9hZGRf
aG90cGx1Z2dhYmxlX21lbW9yeV9ub2RlcyhmZHQsIGFjZWxscywgc2NlbGxzKTsNCj4gPj4+PiBB
Y2NvcmRpbmcgdG8gRXJpYydzIHRlc3QsIGd1ZXN0IGtlcm5lbCBwaWNrcyB0aGlzIHVwLiBTbyBp
dCBwcm9iYWJseQ0KPiA+Pj4+IHNob3VsZCBiZSBhbiBvcHQtaW4gZmVhdHVyZSB0byBhdm9pZCBj
b25mbGljdCB3aXRoIEFDUEkgZGVmaW5pdGlvbiBpbiBEU0RULg0KPiA+Pj4NCj4gPj4+IE9rLiBN
eSB0YWtlIGF3YXkgZnJvbSB0aGF0IGRpc2N1c3Npb24gd2FzIHRoYXQgaWYgd2UgcHJvcGVybHkg
ZGVzY3JpYmUgdGhlDQo+ID4+PiBQTlAwQzgwICh3aGljaCBpcyB3aGF0ICMwNiBvZiB0aGlzIHNl
cmllcyBkb2VzKSB0aGVuIHdlIGRvbid0IGhhdmUgdG8NCj4gd29ycnkNCj4gPj4+IGFib3V0IERU
IGVudHJpZXMgYXMgQUNQSSB3aWxsICJvdmVycmlkZSIgaXQuICBCdXQgaXQgbG9va3MgbGlrZSB0
aGF0IGlzIG5vdCB0aGUNCj4gPj4gY2FzZQ0KPiA+Pj4gYW5kIGRlc2NyaWJpbmcgRFQgd2lsbCBh
bnl3YXkgY2F1c2UgdGhlIG1lbW9yeSBiZWluZyBlbmQgdXAgaW4gVUVGSQ0KPiA+Pj4gR2VUTWVt
b3J5TWFwKCkgYW5kIHJlc3VsdHMgaW4gYmVpbmcgdXNlZCBhcyBub3JtYWwgbWVtb3J5IGVhcmx5
IGF0DQo+IGJvb3QuDQo+ID4+Pg0KPiA+Pj4gSGkgRXJpYywNCj4gPj4+DQo+ID4+PiBIb3cgZG8g
d2UgdmVyaWZ5IHRoYXQgdGhpcyBpcyBhY3R1YWxseSBoYXBwZW5pbmc/IEkgdHJpZWQgcnVubmlu
ZyB0aGUNCj4gPj4gL3Byb2MvbWVtaW5mbw0KPiA+Pj4gb24gYSBRZW11IGJ1aWxkIHVwdG8gIzA2
IG9mIHRoaXMgc2VyaWVzLCBhbmQgaXQgcmVwb3J0ZWQgbWVtb3J5IGluY2x1ZGluZw0KPiB0aGUN
Cj4gPj4+IGNvbGQgcGx1Z2dlZCBkaW1tIG1lbW9yeS4NCj4gPj4+DQo+ID4+PiBCdXQgbm90IHN1
cmUgaG93IHRvIHZlcmlmeSB0aGF0IHRoaXMgZGltbSBtZW0gaXMgYmVpbmcgdHJlYXRlZCBhcyBu
b3JtYWwNCj4gPj4gbWVtIG9uDQo+ID4+PiBib290IHRpbWUgb3Igbm90PyBQbGVhc2UgbGV0IG1l
IGtub3cuDQo+ID4+DQo+ID4+IEF0IHRoZSB0aW1lIEkgdGVzdGVkIEkgZGlkIG5vdCBoYXZlIFBO
UDBDODAgYnVpbGQuIEkgY29uZmlybSB0aGF0IGlmIHlvdQ0KPiA+PiByZW1vdmUgdGhlIGR0IGRl
c2NyaXB0aW9uIGluIEFDUEkgbW9kZSwgL3Byb2MvbWVtaW5mbyBkb2VzIG5vdCByZXBvcnQNCj4g
Pj4gdGhlIERJTU1zLiBOb3cgdGhhdCB5b3UgaGF2ZSAjMDYsIGlmIHlvdSByZW1vdmUgdGhlIERU
ICBob3RwbHVnZ2FibGVzDQo+ID4+IG1lbW9yeSBtb2RlIGdlbmVyYXRpb24gaW4gQUNQSSBtb2Rl
LCB5b3Ugc2hvdWxkIHNlZSB0aGVtIGFuZCBpZiBJDQo+ID4+IHVuZGVyc3RhbmQgY29ycmVjdGx5
IHRoaXMgaXMgd2hhdCB5b3UgY29uZmlybS4gSSBoYXZlIG5vdCB0ZXN0ZWQNCj4gPj4gYW55dGhp
bmcgZWxzZSBhdCB0aGUgbW9tZW50Lg0KPiA+DQo+ID4gWWVzLCB0aGF0IGlzIHdoYXQgSSBjb25m
aXJtZWQuIEJ1dCB0aGUgY29uY2VybiBub3cgaXMgaGF2aW5nIERUIG1lbW9yeSBub2RlDQo+ID4g
Z2VuZXJhdGlvbiB3aWxsIHJlc3VsdCBpbiB0aGUgcHJvYmxlbSBkZXNjcmliZWQgYWJvdmUgLSBV
RUZJDQo+IEdldE1lbW9yeU1hcCgpLg0KPiBTb3JyeSBJIGRvbid0IHVuZGVyc3RhbmQgdGhlIHN0
YXRlZCBwcm9ibGVtLiBJZiB5b3UgcmVtb3ZlIHRoZSBjYWxsIHRvDQo+IGZkdF9hZGRfaG90cGx1
Z2dhYmxlX21lbW9yeV9ub2RlcyB3aGVuIHJ1bm5pbmcgaW4gQUNQSSBtb2RlLCAgZG9lcyB0aGUN
Cj4gYWJvdmUgR2V0TWVtb3J5TWFwIHNlZSB0aGUgRElNTXM/DQoNClRoYXQgaXMgd2hhdCBJIGFt
IGFsc28gdHJ5aW5nIHRvIHZlcmlmeSA6KS4gSG93IGRvIHdlIHZlcmlmeSB0aGUgR2V0TWVtb3J5
TWFwKCkgc2Vlcw0KdGhlIERJTU1zIG9yIG5vdD8gQXMgSSBzYWlkLCBJIGhhdmUgdGVzdGVkIGl0
IHdpdGggcGF0Y2ggdXB0byAjMDYobWVhbnMgbm8gDQpmZHRfYWRkX2hvdHBsdWdnYWJsZV9tZW1v
cnlfbm9kZXMpIGFuZCBjaGVja2VkIC9wcm9jL21lbWluZm8gd2hpY2ggaGFzDQp0aGUgZGltbSBt
ZW1vcnkgaW5jbHVkZWQgaW4gdGhlIHRvdGFsIG1lbW9yeSBpdCByZXBvcnRzLg0KDQpCdXQgbm90
IHN1cmUgaG93IHlvdSB3aWxsIHZlcmlmeSB3aGV0aGVyIEdldE1lbW9yeU1hcCgpIHNlZSB0aGUg
ZGltbSBvciBub3QuDQoNClRoYW5rcywNClNoYW1lZXINCiANCj4gVGhhbmtzDQo+IA0KPiBFcmlj
DQo+ID4NCj4gPiBJIHdhcyBsb29raW5nIGZvciBhIHdheSB0byBjaGVjayB0aGF0IGlzIGEgdmFs
aWQgaXNzdWUgb3Igbm90LiBJIHdpbGwgdHJ5IHRvIGxvb2sgZm9yDQo+ID4gYSB3YXkgdG8gdmVy
aWZ5IHRoYXQuIFBsZWFzZSB1cGRhdGUgaWYgeW91IGNvbWUgYWNyb3NzIGFueXRoaW5nLg0KPiA+
DQo+ID4gVGhhbmtzLA0KPiA+IFNoYW1lZXINCj4gPg0KPiA+PiBUaGFua3MNCj4gPj4NCj4gPj4g
RXJpYw0KPiA+Pj4NCj4gPj4+IFRoYW5rcywNCj4gPj4+IFNoYW1lZXINCj4gPj4+DQo+ID4+Pg0K
PiA+Pj4+PiArICAgIGlmIChyYyA8IDApIHsNCj4gPj4+Pj4gKyAgICAgICAgZnByaW50ZihzdGRl
cnIsICJjb3VsZG4ndCBhZGQgaG90cGx1Z2dhYmxlIG1lbW9yeSBub2Rlc1xuIik7DQo+ID4+Pj4+
ICsgICAgICAgIGdvdG8gZmFpbDsNCj4gPj4+Pj4gKyAgICB9DQo+ID4+Pj4+ICsNCj4gPj4+Pj4g
ICAgICByYyA9IGZkdF9wYXRoX29mZnNldChmZHQsICIvY2hvc2VuIik7DQo+ID4+Pj4+ICAgICAg
aWYgKHJjIDwgMCkgew0KPiA+Pj4+PiAgICAgICAgICBxZW11X2ZkdF9hZGRfc3Vibm9kZShmZHQs
ICIvY2hvc2VuIik7DQo+ID4+Pg0KPiA+Pj4NCg==
