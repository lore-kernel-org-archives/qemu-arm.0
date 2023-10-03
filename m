Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1902371ejb;
        Tue, 3 Oct 2023 04:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOXkdhk3TVqMnUbPaDJ3nqmxgbVZGX5oFy5CBRnoEqX1v5LeGAcbZx3oVptO7Y4JP2PYjj
X-Received: by 2002:a05:6a20:3243:b0:154:d3ac:2063 with SMTP id hm3-20020a056a20324300b00154d3ac2063mr12208022pzc.27.1696332806061;
        Tue, 03 Oct 2023 04:33:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696332806; cv=none;
        d=google.com; s=arc-20160816;
        b=0Llm84V5yMsKY5oiRfgHJ8mVE/uc9PEGkH02viCG2mBUt2CycwPrlJZNmHDJ7ruz9N
         tcR1Zyu/i2YtWaK04FJW/Nf9LNNut45fkn2o6K4cLW4u6Z5fTCyrtV1RnqkFmTn7X6c/
         kGIlQae4V0X+Si06sRdupjTv1sF5SXrqigSeNMNSTcMxI+gOWAAuTdRARyJTL5QORExq
         dEHeYfA8OrdczhOZVeML4EJT+G9sAhAKVZ4zreTGCXN1SZ7YM3Je9ggkIs2nGOfj854V
         2LbhnH6AYPXopTV8z5+iLl1X0jgAlKNk3CkhYYH69/4TXNKV+E+6aNrxkrveiQaNiT9n
         yr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=u6KJdnNMu/VKBH0WBZTpJkMo5TAdDrJbasixAdSaIJc=;
        fh=DCV4KZOcuvUG/wve9C1kSJ4RRlBk9KClkYRBzQw+8ow=;
        b=yFvUtNhc77IlWT4+3t1l4z9PtjChKpNddUuGT0XvTat14vhZG/qx6OsJt7DDssCH+f
         spSfkaSy/3qYjc4zjSm4SnDA/pfo1WUShp/XEO11e1/BHPhKI9Go0C+PXZ9qXcb2ERI1
         KtSIF1zvoD0UlO4HGk33jGqFZd6pFckZUzhAhrNX8Bs2EJhbf7Gs50x5l9ijdfT4m/4G
         GxXEsKRKD3Ym8UgvyXVw++Es+jFA6JeNnS4W3fO9yj+9sHAyFDUEzQGuFEN9eaDoXHNd
         BhmX4jvzV7Kc5TcPiJtuX9TOZej/0LV68I+6kNQi4qbrWaJ2hu8Q95xX+tExqFpMLcsY
         juAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id c16-20020a170903235000b001bb377f8c8bsi1318812plh.2.2023.10.03.04.33.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:33:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500003.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0Fyn24cgz6K69L;
	Tue,  3 Oct 2023 19:31:45 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500003.china.huawei.com (7.191.162.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:33:20 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:33:20 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Gavin Shan <gshan@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
CC: "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"rafael@kernel.org" <rafael@kernel.org>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V2 05/10] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Thread-Topic: [PATCH V2 05/10] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Thread-Index: AQHZ8zQYC4/+Jpm3GUq+5/2Z200pcbA3JHiAgADPgrA=
Date: Tue, 3 Oct 2023 11:33:20 +0000
Message-ID: <a2f6c1632bd74c4581a80f1cb765292c@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-6-salil.mehta@huawei.com>
 <5dc18701-973b-bd1c-8704-479ea67a7be8@redhat.com>
In-Reply-To: <5dc18701-973b-bd1c-8704-479ea67a7be8@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: HMNfBCNchPdI

PiBGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBP
Y3RvYmVyIDMsIDIwMjMgMTowOSBBTQ0KPiBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1
YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtDQo+IGFybUBub25nbnUub3Jn
DQo+IENjOiBtYXpAa2VybmVsLm9yZzsgamVhbi1waGlsaXBwZUBsaW5hcm8ub3JnOyBKb25hdGhh
biBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBscGllcmFsaXNpQGtl
cm5lbC5vcmc7DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcmljaGFyZC5oZW5kZXJzb25A
bGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3LmpvbmVzQGxpbnV4LmRl
djsgZGF2aWRAcmVkaGF0LmNvbTsNCj4gcGhpbG1kQGxpbmFyby5vcmc7IGVyaWMuYXVnZXJAcmVk
aGF0LmNvbTsgb2xpdmVyLnVwdG9uQGxpbnV4LmRldjsNCj4gcGJvbnppbmlAcmVkaGF0LmNvbTsg
bXN0QHJlZGhhdC5jb207IHdpbGxAa2VybmVsLm9yZzsgcmFmYWVsQGtlcm5lbC5vcmc7DQo+IGFs
ZXguYmVubmVlQGxpbmFyby5vcmc7IGxpbnV4QGFybWxpbnV4Lm9yZy51azsNCj4gZGFycmVuQG9z
LmFtcGVyZWNvbXB1dGluZy5jb207IGlsa2thQG9zLmFtcGVyZWNvbXB1dGluZy5jb207DQo+IHZp
c2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBrYXJsLmhldWJhdW1Ab3JhY2xlLmNvbTsNCj4g
bWlndWVsLmx1aXNAb3JhY2xlLmNvbTsgc2FsaWwubWVodGFAb3Buc3JjLm5ldDsgemh1a2VxaWFu
DQo+IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5nIChDKSA8d2FuZ3hpb25n
ZmVuZzJAaHVhd2VpLmNvbT47DQo+IHdhbmd5YW5hbiAoWSkgPHdhbmd5YW5hbjU1QGh1YXdlaS5j
b20+OyBqaWFrZXJuZWwyQGdtYWlsLmNvbTsNCj4gbWFvYmlib0Bsb29uZ3Nvbi5jbjsgbGl4aWFu
Z2xhaUBsb29uZ3Nvbi5jbjsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggVjIgMDUvMTBdIGh3L2FjcGk6IFVwZGF0ZSBDUFVzIEFNTCB3aXRoIGNw
dS0oY3RybClkZXYNCj4gY2hhbmdlDQo+IA0KPiBPbiA5LzMwLzIzIDEwOjE5LCBTYWxpbCBNZWh0
YSB3cm90ZToNCj4gPiBDUFVzIENvbnRyb2wgZGV2aWNlKFxcX1NCLlBDSTApIHJlZ2lzdGVyIGlu
dGVyZmFjZSBmb3IgdGhlIHg4NiBhcmNoIGlzIGJhc2VkIG9uDQo+ID4gUENJIGFuZCBpcyBJTyBw
b3J0IGJhc2VkIGFuZCBoZW5jZSBleGlzdGluZyBjcHVzIEFNTCBjb2RlIGFzc3VtZXMgX0NSUyBv
YmplY3RzDQo+ID4gd291bGQgZXZhbHVhdGUgdG8gYSBzeXN0ZW0gcmVzb3VyY2Ugd2hpY2ggZGVz
Y3JpYmVzIElPIFBvcnQgYWRkcmVzcy4gQnV0IG9uIEFSTQ0KPiA+IGFyY2ggQ1BVcyBjb250cm9s
IGRldmljZShcXF9TQi5QUkVTKSByZWdpc3RlciBpbnRlcmZhY2UgaXMgbWVtb3J5LW1hcHBlZCBo
ZW5jZQ0KPiA+IF9DUlMgb2JqZWN0IHNob3VsZCBldmFsdWF0ZSB0byBzeXN0ZW0gcmVzb3VyY2Ug
d2hpY2ggZGVzY3JpYmVzIG1lbW9yeS1tYXBwZWQNCj4gPiBiYXNlIGFkZHJlc3MuDQo+ID4NCj4g
PiBUaGlzIGNwdXMgQU1MIGNvZGUgY2hhbmdlIHVwZGF0ZXMgdGhlIGV4aXN0aW5nIGluZXJmYWNl
IG9mIHRoZSBidWlsZCBjcHVzIEFNTA0KPiA+IGZ1bmN0aW9uIHRvIGFjY2VwdCBib3RoIElPL01F
TU9SWSB0eXBlIHJlZ2lvbnMgYW5kIHVwZGF0ZSB0aGUgX0NSUyBvYmplY3QNCj4gPiBjb3JyZXNw
b25kaW5nbHkuDQo+ID4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IEtlcWlhbiBaaHUgPHpodWtlcWlh
bjFAaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLZXFpYW4gWmh1IDx6aHVrZXFpYW4x
QGh1YXdlaS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRh
QGh1YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gICBody9hY3BpL2NwdS5jICAgICAgICAgfCAyMyAr
KysrKysrKysrKysrKysrLS0tLS0tLQ0KPiA+ICAgaHcvaTM4Ni9hY3BpLWJ1aWxkLmMgIHwgIDIg
Ky0NCj4gPiAgIGluY2x1ZGUvaHcvYWNwaS9jcHUuaCB8ICA1ICsrKy0tDQo+ID4gICAzIGZpbGVz
IGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiA+DQo+IA0KPiBX
aXRoIGNvbW1pdCBsb2cgaW1wcm92ZWQgdG8gYWRkcmVzcyBKb25hdGhhbidzIGNvbW1lbnRzIHdo
eQ0KPiBAZXZlbnRfaGFuZGxlcl9tZXRob2QNCj4gd29uJ3QgYmUgbmVlZGVkIG9uIGFhcmNoNjQ6
DQo+IA0KPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCg0KDQpU
aGFua3MNClNhbGlsLg0KDQoNCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2h3L2FjcGkvY3B1LmMgYi9o
dy9hY3BpL2NwdS5jDQo+ID4gaW5kZXggNDVkZWZkYzBlMi4uNjZhNzE2NjBlYyAxMDA2NDQNCj4g
PiAtLS0gYS9ody9hY3BpL2NwdS5jDQo+ID4gKysrIGIvaHcvYWNwaS9jcHUuYw0KPiA+IEBAIC0z
MzgsOSArMzM4LDEwIEBAIGNvbnN0IFZNU3RhdGVEZXNjcmlwdGlvbiB2bXN0YXRlX2NwdV9ob3Rw
bHVnID0gew0KPiA+ICAgI2RlZmluZSBDUFVfRldfRUpFQ1RfRVZFTlQgIkNFSkYiDQo+ID4NCj4g
PiAgIHZvaWQgYnVpbGRfY3B1c19hbWwoQW1sICp0YWJsZSwgTWFjaGluZVN0YXRlICptYWNoaW5l
LA0KPiBDUFVIb3RwbHVnRmVhdHVyZXMgb3B0cywNCj4gPiAtICAgICAgICAgICAgICAgICAgICBo
d2FkZHIgaW9fYmFzZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICBod2FkZHIgYmFzZV9hZGRy
LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpyZXNfcm9vdCwNCj4gPiAt
ICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpldmVudF9oYW5kbGVyX21ldGhvZCkNCj4g
PiArICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpldmVudF9oYW5kbGVyX21ldGhvZCwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICBBbWxSZWdpb25TcGFjZSBycykNCj4gPiAgIHsNCj4g
PiAgICAgICBBbWwgKmlmY3R4Ow0KPiA+ICAgICAgIEFtbCAqZmllbGQ7DQo+ID4gQEAgLTM2Nywx
MyArMzY4LDE5IEBAIHZvaWQgYnVpbGRfY3B1c19hbWwoQW1sICp0YWJsZSwgTWFjaGluZVN0YXRl
DQo+ICptYWNoaW5lLCBDUFVIb3RwbHVnRmVhdHVyZXMgb3B0cywNCj4gPiAgICAgICAgICAgYW1s
X2FwcGVuZChjcHVfY3RybF9kZXYsIGFtbF9tdXRleChDUFVfTE9DSywgMCkpOw0KPiA+DQo+ID4g
ICAgICAgICAgIGNycyA9IGFtbF9yZXNvdXJjZV90ZW1wbGF0ZSgpOw0KPiA+IC0gICAgICAgIGFt
bF9hcHBlbmQoY3JzLCBhbWxfaW8oQU1MX0RFQ09ERTE2LCBpb19iYXNlLCBpb19iYXNlLCAxLA0K
PiA+ICsgICAgICAgIGlmIChycyA9PSBBTUxfU1lTVEVNX0lPKSB7DQo+ID4gKyAgICAgICAgICAg
IGFtbF9hcHBlbmQoY3JzLCBhbWxfaW8oQU1MX0RFQ09ERTE2LCBiYXNlX2FkZHIsIGJhc2VfYWRk
ciwNCj4gMSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBQ1BJX0NQVV9I
T1RQTFVHX1JFR19MRU4pKTsNCj4gPiArICAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAg
ICBhbWxfYXBwZW5kKGNycywgYW1sX21lbW9yeTMyX2ZpeGVkKGJhc2VfYWRkciwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFDUElfQ1BVX0hPVFBMVUdfUkVHX0xFTiwNCj4g
QU1MX1JFQURfV1JJVEUpKTsNCj4gPiArICAgICAgICB9DQo+ID4gKw0KPiA+ICAgICAgICAgICBh
bWxfYXBwZW5kKGNwdV9jdHJsX2RldiwgYW1sX25hbWVfZGVjbCgiX0NSUyIsIGNycykpOw0KPiA+
DQo+ID4gICAgICAgICAgIC8qIGRlY2xhcmUgQ1BVIGhvdHBsdWcgTU1JTyByZWdpb24gd2l0aCBy
ZWxhdGVkIGFjY2VzcyBmaWVsZHMNCj4gKi8NCj4gPiAgICAgICAgICAgYW1sX2FwcGVuZChjcHVf
Y3RybF9kZXYsDQo+ID4gLSAgICAgICAgICAgIGFtbF9vcGVyYXRpb25fcmVnaW9uKCJQUlNUIiwg
QU1MX1NZU1RFTV9JTywNCj4gYW1sX2ludChpb19iYXNlKSwNCj4gPiArICAgICAgICAgICAgYW1s
X29wZXJhdGlvbl9yZWdpb24oIlBSU1QiLCBycywgYW1sX2ludChiYXNlX2FkZHIpLA0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQUNQSV9DUFVfSE9UUExVR19SRUdfTEVO
KSk7DQo+ID4NCj4gPiAgICAgICAgICAgZmllbGQgPSBhbWxfZmllbGQoIlBSU1QiLCBBTUxfQllU
RV9BQ0MsIEFNTF9OT0xPQ0ssDQo+ID4gQEAgLTY5OSw5ICs3MDYsMTEgQEAgdm9pZCBidWlsZF9j
cHVzX2FtbChBbWwgKnRhYmxlLCBNYWNoaW5lU3RhdGUNCj4gKm1hY2hpbmUsIENQVUhvdHBsdWdG
ZWF0dXJlcyBvcHRzLA0KPiA+ICAgICAgIGFtbF9hcHBlbmQoc2Jfc2NvcGUsIGNwdXNfZGV2KTsN
Cj4gPiAgICAgICBhbWxfYXBwZW5kKHRhYmxlLCBzYl9zY29wZSk7DQo+ID4NCj4gPiAtICAgIG1l
dGhvZCA9IGFtbF9tZXRob2QoZXZlbnRfaGFuZGxlcl9tZXRob2QsIDAsIEFNTF9OT1RTRVJJQUxJ
WkVEKTsNCj4gPiAtICAgIGFtbF9hcHBlbmQobWV0aG9kLCBhbWxfY2FsbDAoIlxcX1NCLkNQVVMu
IiBDUFVfU0NBTl9NRVRIT0QpKTsNCj4gPiAtICAgIGFtbF9hcHBlbmQodGFibGUsIG1ldGhvZCk7
DQo+ID4gKyAgICBpZiAoZXZlbnRfaGFuZGxlcl9tZXRob2QpIHsNCj4gPiArICAgICAgICBtZXRo
b2QgPSBhbWxfbWV0aG9kKGV2ZW50X2hhbmRsZXJfbWV0aG9kLCAwLCBBTUxfTk9UU0VSSUFMSVpF
RCk7DQo+ID4gKyAgICAgICAgYW1sX2FwcGVuZChtZXRob2QsIGFtbF9jYWxsMCgiXFxfU0IuQ1BV
Uy4iIENQVV9TQ0FOX01FVEhPRCkpOw0KPiA+ICsgICAgICAgIGFtbF9hcHBlbmQodGFibGUsIG1l
dGhvZCk7DQo+ID4gKyAgICB9DQo+ID4NCj4gPiAgICAgICBnX2ZyZWUoY3BocF9yZXNfcGF0aCk7
DQo+ID4gICB9DQo+ID4gZGlmZiAtLWdpdCBhL2h3L2kzODYvYWNwaS1idWlsZC5jIGIvaHcvaTM4
Ni9hY3BpLWJ1aWxkLmMNCj4gPiBpbmRleCA0ZDJkNDBiYWI1Li42MTFkM2QwNDRkIDEwMDY0NA0K
PiA+IC0tLSBhL2h3L2kzODYvYWNwaS1idWlsZC5jDQo+ID4gKysrIGIvaHcvaTM4Ni9hY3BpLWJ1
aWxkLmMNCj4gPiBAQCAtMTU1MCw3ICsxNTUwLDcgQEAgYnVpbGRfZHNkdChHQXJyYXkgKnRhYmxl
X2RhdGEsIEJJT1NMaW5rZXIgKmxpbmtlciwNCj4gPiAgICAgICAgICAgICAgIC5md191bnBsdWdz
X2NwdSA9IHBtLT5zbWlfb25fY3B1X3VucGx1ZywNCj4gPiAgICAgICAgICAgfTsNCj4gPiAgICAg
ICAgICAgYnVpbGRfY3B1c19hbWwoZHNkdCwgbWFjaGluZSwgb3B0cywgcG0tPmNwdV9ocF9pb19i
YXNlLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICJcXF9TQi5QQ0kwIiwgIlxcX0dQRS5f
RTAyIik7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIlxcX1NCLlBDSTAiLCAiXFxfR1BF
Ll9FMDIiLCBBTUxfU1lTVEVNX0lPKTsNCj4gPiAgICAgICB9DQo+ID4NCj4gPiAgICAgICBpZiAo
cGNtcy0+bWVtaHBfaW9fYmFzZSAmJiBucl9tZW0pIHsNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9ody9hY3BpL2NwdS5oIGIvaW5jbHVkZS9ody9hY3BpL2NwdS5oDQo+ID4gaW5kZXggOTk5Y2Fh
ZjUxMC4uYjg3ZWJmZGY0YiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2h3L2FjcGkvY3B1LmgN
Cj4gPiArKysgYi9pbmNsdWRlL2h3L2FjcGkvY3B1LmgNCj4gPiBAQCAtNTYsOSArNTYsMTAgQEAg
dHlwZWRlZiBzdHJ1Y3QgQ1BVSG90cGx1Z0ZlYXR1cmVzIHsNCj4gPiAgIH0gQ1BVSG90cGx1Z0Zl
YXR1cmVzOw0KPiA+DQo+ID4gICB2b2lkIGJ1aWxkX2NwdXNfYW1sKEFtbCAqdGFibGUsIE1hY2hp
bmVTdGF0ZSAqbWFjaGluZSwNCj4gQ1BVSG90cGx1Z0ZlYXR1cmVzIG9wdHMsDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgaHdhZGRyIGlvX2Jhc2UsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
aHdhZGRyIGJhc2VfYWRkciwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAq
cmVzX3Jvb3QsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqZXZlbnRfaGFu
ZGxlcl9tZXRob2QpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmV2ZW50
X2hhbmRsZXJfbWV0aG9kLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgIEFtbFJlZ2lvblNwYWNl
IHJzKTsNCj4gPg0KPiA+ICAgdm9pZCBhY3BpX2NwdV9vc3BtX3N0YXR1cyhDUFVIb3RwbHVnU3Rh
dGUgKmNwdV9zdCwgQUNQSU9TVEluZm9MaXN0DQo+ICoqKmxpc3QpOw0KPiA+DQo+IA0KPiBUaGFu
a3MsDQo+IEdhdmluDQoNCg==
