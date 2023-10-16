Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3484603ejc;
        Mon, 16 Oct 2023 14:44:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTmDoOsDH3DxDSg75T+s65AOYqBYHp7C1KsHbd6TKuJCQy5C7K6EOOfWIeMj1KcY9hansM
X-Received: by 2002:adf:f20e:0:b0:32d:8c57:b4f2 with SMTP id p14-20020adff20e000000b0032d8c57b4f2mr595902wro.37.1697492658230;
        Mon, 16 Oct 2023 14:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697492658; cv=none;
        d=google.com; s=arc-20160816;
        b=hGJZ/9a0/vvy8U5g1GUgtZzrFWx6IRhXLpT9cJ1hpSudP6XY9ioypxw3AKNrcWa95/
         FUTexupb7t/MoFf8BQg0nOr8pYSX1T+Vy8AmQFkm2ew3ERG3gOdaKem6/OK3STxIJxQM
         H75jfFRe8lebh1u/1/5O+qD4z8SVVBhHsADPqQDnjZPxhZC1QFeBL74kReX+EGoWt3nY
         Ibos6r/xyBQ57VG1pBlot27C0pnL1cr9oTA9yp9TB5XzFd3GxS+mIasgoN00ezK6YUV3
         8RqSWoor+9UqSQ2LSYjD79amO0IvS9Pdpg16NSkyM6z6sM5FY3u+c4S/iJTSRwWkr5lB
         7C/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=XAVJKvjUfoLRFFH7AifqGUZAmEC705hDyl4IuSNarVY=;
        fh=hdkuu+IAzV9F5cEyPWpdhkV3n0hGx3syql0LHe616n0=;
        b=SuCAA0Vt3mSoTQJMTkZqUqClFuZXCx/jnt0BpMYA84h3Z+eQ0KEIbDO0buAC+6vRjI
         B6z0Nsk6CPagRLOqe4Xaprzlz/5sq6fj5t5HCr/4suDiZGpv0MupC0++wDIfLaHnSkfj
         wenR9DH+x3qVxRu2uNC1Wk3i1iBzCxHmHNr/Cj4NkaDzAp/DNLcQRFd+Zay/n3Y04LlA
         d5E+5alfioS2eZy9wfO/XEoDjkZ9XYt2Xb8MGWT/TGqPSqys7Lw4Y0uGCmgJ0k2iz1rv
         VgTESDhG3CWF2DKkQYAw8tnlOgCrAwy+q4O/PuAMbFg61oy9ht4HfuR/aoU3LFvYBhJc
         oREw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id r7-20020a056000014700b0032172b9eec4si110346wrx.870.2023.10.16.14.44.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2023 14:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100003.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S8Vsl2F4Lz67fBs;
	Tue, 17 Oct 2023 05:40:59 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100003.china.huawei.com (7.191.160.210) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 16 Oct 2023 22:44:16 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 16 Oct 2023 22:44:16 +0100
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
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
	<karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>
Subject: RE: [PATCH RFC V2 13/37] hw/acpi: Init GED framework with cpu hotplug
 events
Thread-Topic: [PATCH RFC V2 13/37] hw/acpi: Init GED framework with cpu
 hotplug events
Thread-Index: AQHZ8GGKFbIscQOHIEqWOQ+dLO6D7rAvW88AgB220XA=
Date: Mon, 16 Oct 2023 21:44:16 +0000
Message-ID: <473a67579196412199aef3dcac579512@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-14-salil.mehta@huawei.com>
 <f3db9fe9-2fbb-003e-3da4-26c401d09c1f@redhat.com>
In-Reply-To: <f3db9fe9-2fbb-003e-3da4-26c401d09c1f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.158.41]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 93VFlFQnq4Px

PiBGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwg
U2VwdGVtYmVyIDI4LCAyMDIzIDE6NTcgQU0NCj4gVG86IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0
YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LQ0KPiBhcm1Abm9uZ251
Lm9yZw0KPiBDYzogbWF6QGtlcm5lbC5vcmc7IGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZzsgSm9u
YXRoYW4gQ2FtZXJvbg0KPiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsgbHBpZXJhbGlz
aUBrZXJuZWwub3JnOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHJpY2hhcmQuaGVuZGVy
c29uQGxpbmFyby5vcmc7DQo+IGltYW1tZWRvQHJlZGhhdC5jb207IGFuZHJldy5qb25lc0BsaW51
eC5kZXY7IGRhdmlkQHJlZGhhdC5jb207DQo+IHBoaWxtZEBsaW5hcm8ub3JnOyBlcmljLmF1Z2Vy
QHJlZGhhdC5jb207IHdpbGxAa2VybmVsLm9yZzsgYXJkYkBrZXJuZWwub3JnOw0KPiBvbGl2ZXIu
dXB0b25AbGludXguZGV2OyBwYm9uemluaUByZWRoYXQuY29tOyBtc3RAcmVkaGF0LmNvbTsNCj4g
cmFmYWVsQGtlcm5lbC5vcmc7IGJvcm50cmFlZ2VyQGxpbnV4LmlibS5jb207IGFsZXguYmVubmVl
QGxpbmFyby5vcmc7DQo+IGxpbnV4QGFybWxpbnV4Lm9yZy51azsgZGFycmVuQG9zLmFtcGVyZWNv
bXB1dGluZy5jb207DQo+IGlsa2thQG9zLmFtcGVyZWNvbXB1dGluZy5jb207IHZpc2hudUBvcy5h
bXBlcmVjb21wdXRpbmcuY29tOw0KPiBrYXJsLmhldWJhdW1Ab3JhY2xlLmNvbTsgbWlndWVsLmx1
aXNAb3JhY2xlLmNvbTsgc2FsaWwubWVodGFAb3Buc3JjLm5ldDsNCj4gemh1a2VxaWFuIDx6aHVr
ZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5nIChDKQ0KPiA8d2FuZ3hpb25nZmVuZzJA
aHVhd2VpLmNvbT47IHdhbmd5YW5hbiAoWSkgPHdhbmd5YW5hbjU1QGh1YXdlaS5jb20+Ow0KPiBq
aWFrZXJuZWwyQGdtYWlsLmNvbTsgbWFvYmlib0Bsb29uZ3Nvbi5jbjsgbGl4aWFuZ2xhaUBsb29u
Z3Nvbi5jbg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJGQyBWMiAxMy8zN10gaHcvYWNwaTogSW5p
dCBHRUQgZnJhbWV3b3JrIHdpdGggY3B1DQo+IGhvdHBsdWcgZXZlbnRzDQo+IA0KPiBIaSBTYWxp
bCwNCj4gDQo+IE9uIDkvMjYvMjMgMjA6MDQsIFNhbGlsIE1laHRhIHdyb3RlOg0KPiA+IEFDUEkg
R0VEKGFzIGRlc2NyaWJlZCBpbiB0aGUgQUNQSSA2LjIgc3BlYykgY2FuIGJlIHVzZWQgdG8gZ2Vu
ZXJhdGUgQUNQSSBldmVudHMNCj4gPiB3aGVuIE9TUE0vZ3Vlc3QgcmVjZWl2ZXMgYW4gaW50ZXJy
dXB0IGxpc3RlZCBpbiB0aGUgX0NSUyBvYmplY3Qgb2YgR0VELiBPU1BNDQo+ID4gdGhlbiBtYXBz
IG9yIGRlbXVsdGlwbGV4ZXMgdGhlIGV2ZW50IGJ5IGV2YWx1YXRpbmcgX0VWVCBtZXRob2QuDQo+
ID4NCj4gPiBUaGlzIGNoYW5nZSBhZGRzIHRoZSBzdXBwb3J0IG9mIGNwdSBob3RwbHVnIGV2ZW50
IGluaXRpYWxpemF0aW9uIGluIHRoZQ0KPiA+IGV4aXN0aW5nIEdFRCBmcmFtZXdvcmsuDQo+ID4N
Cj4gPiBDby1kZXZlbG9wZWQtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29t
Pg0KPiA+IENvLWRldmVsb3BlZC1ieTogS2VxaWFuIFpodSA8emh1a2VxaWFuMUBodWF3ZWkuY29t
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEtlcWlhbiBaaHUgPHpodWtlcWlhbjFAaHVhd2VpLmNvbT4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgIGh3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuYyAgICAgICAgIHwg
OCArKysrKysrKw0KPiA+ICAgaW5jbHVkZS9ody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmgg
fCA1ICsrKysrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4gPg0K
PiANCj4gSXQgbG9va3MgYSBiaXQgc3RyYW5nZSB5b3UncmUgY28tZGV2ZWxvcGluZyB0aGUgcGF0
Y2ggd2l0aCB5b3Vyc2VsZi4NCj4gSXQgc2VlbXMgYWxsIHBhdGNoZXMgZm9sbG93IHRoaXMgcGFy
dGljdWxhciBwYXR0ZXJuLiBJIGNvdWxkIGJlIGNoYW5nZWQNCj4gdG86DQo+IA0KPiBDby1kZXZl
bG9wZWQtYnk6IEtlcWlhbiBaaHUgPHpodWtlcWlhbjFAaHVhd2VpLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogS2VxaWFuIFpodSA8emh1a2VxaWFuMUBodWF3ZWkuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT4NCj4gDQo+IFRoZSBjb2RlIGNo
YW5nZXMgbG9vayBnb29kIHRvIG1lIHdpdGggdGhlIGZvbGxvd2luZyBuaXRzIGFkZHJlc3NlZDoN
Cj4gDQo+IFJldmlld2VkLWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KDQoNCkFs
bCBvZiB0aGVzZSBjb21tZW50cyBoYXZlIGJlZW4gYWRkcmVzc2VkIGluIGFyY2hpdGVjdHVyZSBh
Z25vc3RpYyBwYXRjaC1zZXQuDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwv
NDc2NENGNDctNDdDQS00Njg1LTgwNUMtQkJFNjMxMEJFMTY0QG9yYWNsZS5jb20vVC8jbTkwNGVi
NTY2NThhMDdjMDMwMmQ2YzZmYmJhNmM5YjlkZGMzNWNjMWINCg0KVGhhbmtzDQpTYWxpbC4NCg0K
DQoNCg0KDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9ody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNl
LmMNCj4gYi9ody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmMNCj4gPiBpbmRleCBhM2QzMTYz
MWZlLi5kMmZhMWQwZTRhIDEwMDY0NA0KPiA+IC0tLSBhL2h3L2FjcGkvZ2VuZXJpY19ldmVudF9k
ZXZpY2UuYw0KPiA+ICsrKyBiL2h3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuYw0KPiA+IEBA
IC0yNSw2ICsyNSw3IEBAIHN0YXRpYyBjb25zdCB1aW50MzJfdCBnZWRfc3VwcG9ydGVkX2V2ZW50
c1tdID0gew0KPiA+ICAgICAgIEFDUElfR0VEX01FTV9IT1RQTFVHX0VWVCwNCj4gPiAgICAgICBB
Q1BJX0dFRF9QV1JfRE9XTl9FVlQsDQo+ID4gICAgICAgQUNQSV9HRURfTlZESU1NX0hPVFBMVUdf
RVZULA0KPiA+ICsgICAgQUNQSV9HRURfQ1BVX0hPVFBMVUdfRVZULA0KPiA+ICAgfTsNCj4gPg0K
PiANCj4gQ2FuIHdlIG1vdmUgQUNQSV9HRURfQ1BVX0hPVFBMVUdfRVZUIGFoZWFkIG9mIEFDUElf
R0VEX01FTV9IT1RQTFVHX0VWVD8NCj4gDQo+ID4gICAvKg0KPiA+IEBAIC00MDAsNiArNDAxLDEz
IEBAIHN0YXRpYyB2b2lkIGFjcGlfZ2VkX2luaXRmbihPYmplY3QgKm9iaikNCj4gPiAgICAgICBt
ZW1vcnlfcmVnaW9uX2luaXRfaW8oJmdlZF9zdC0+cmVncywgb2JqLCAmZ2VkX3JlZ3Nfb3BzLCBn
ZWRfc3QsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRZUEVfQUNQSV9HRUQgIi1y
ZWdzIiwgQUNQSV9HRURfUkVHX0NPVU5UKTsNCj4gPiAgICAgICBzeXNidXNfaW5pdF9tbWlvKHNi
ZCwgJmdlZF9zdC0+cmVncyk7DQo+ID4gKw0KPiA+ICsgICAgcy0+Y3B1aHAuZGV2aWNlID0gT0JK
RUNUKHMpOw0KPiA+ICsgICAgbWVtb3J5X3JlZ2lvbl9pbml0KCZzLT5jb250YWluZXJfY3B1aHAs
IE9CSkVDVChkZXYpLCAiY3B1aHANCj4gY29udGFpbmVyIiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBBQ1BJX0NQVV9IT1RQTFVHX1JFR19MRU4pOw0KPiA+ICsgICAgc3lzYnVzX2luaXRf
bW1pbyhTWVNfQlVTX0RFVklDRShkZXYpLCAmcy0+Y29udGFpbmVyX2NwdWhwKTsNCj4gPiArICAg
IGNwdV9ob3RwbHVnX2h3X2luaXQoJnMtPmNvbnRhaW5lcl9jcHVocCwgT0JKRUNUKGRldiksDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICZzLT5jcHVocF9zdGF0ZSwgMCk7DQo+ID4gICB9
DQo+ID4NCj4gPiAgIHN0YXRpYyB2b2lkIGFjcGlfZ2VkX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3Mg
KmNsYXNzLCB2b2lkICpkYXRhKQ0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L2FjcGkvZ2Vu
ZXJpY19ldmVudF9kZXZpY2UuaA0KPiBiL2luY2x1ZGUvaHcvYWNwaS9nZW5lcmljX2V2ZW50X2Rl
dmljZS5oDQo+ID4gaW5kZXggZDgzMWJiZDg4OS4uZDBhNWE0M2FiZiAxMDA2NDQNCj4gPiAtLS0g
YS9pbmNsdWRlL2h3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuaA0KPiA+ICsrKyBiL2luY2x1
ZGUvaHcvYWNwaS9nZW5lcmljX2V2ZW50X2RldmljZS5oDQo+ID4gQEAgLTYwLDYgKzYwLDcgQEAN
Cj4gPiAgICNkZWZpbmUgSFdfQUNQSV9HRU5FUklDX0VWRU5UX0RFVklDRV9IDQo+ID4NCj4gPiAg
ICNpbmNsdWRlICJody9zeXNidXMuaCINCj4gPiArI2luY2x1ZGUgImh3L2FjcGkvY3B1X2hvdHBs
dWcuaCINCj4gPiAgICNpbmNsdWRlICJody9hY3BpL21lbW9yeV9ob3RwbHVnLmgiDQo+ID4gICAj
aW5jbHVkZSAiaHcvYWNwaS9naGVzLmgiDQo+ID4gICAjaW5jbHVkZSAicW9tL29iamVjdC5oIg0K
PiA+IEBAIC05Nyw2ICs5OCw3IEBAIE9CSkVDVF9ERUNMQVJFX1NJTVBMRV9UWVBFKEFjcGlHZWRT
dGF0ZSwgQUNQSV9HRUQpDQo+ID4gICAjZGVmaW5lIEFDUElfR0VEX01FTV9IT1RQTFVHX0VWVCAg
IDB4MQ0KPiA+ICAgI2RlZmluZSBBQ1BJX0dFRF9QV1JfRE9XTl9FVlQgICAgICAweDINCj4gPiAg
ICNkZWZpbmUgQUNQSV9HRURfTlZESU1NX0hPVFBMVUdfRVZUIDB4NA0KPiA+ICsjZGVmaW5lIEFD
UElfR0VEX0NQVV9IT1RQTFVHX0VWVCAgICAweDgNCj4gPg0KPiANCj4gI2RlZmluZSBBQ1BJX0dF
RF9DUFVfSE9UUExVR19FVlQgIDB4MQ0KPiAjZGVmaW5lIEFDUElfR0VEX01FTV9IT1RQTFVHX0VW
VCAgMHgyDQo+ICAgIDoNCj4gDQo+IElmIHRoZSBhZGp1c3RtZW50IGlzIGZyaWVuZGx5IHRvIGxp
dmUgbWlncmF0aW9uLg0KPiANCj4gPiAgIHR5cGVkZWYgc3RydWN0IEdFRFN0YXRlIHsNCj4gPiAg
ICAgICBNZW1vcnlSZWdpb24gZXZ0Ow0KPiA+IEBAIC0xMDgsNiArMTEwLDkgQEAgc3RydWN0IEFj
cGlHZWRTdGF0ZSB7DQo+ID4gICAgICAgU3lzQnVzRGV2aWNlIHBhcmVudF9vYmo7DQo+ID4gICAg
ICAgTWVtSG90cGx1Z1N0YXRlIG1lbWhwX3N0YXRlOw0KPiA+ICAgICAgIE1lbW9yeVJlZ2lvbiBj
b250YWluZXJfbWVtaHA7DQo+ID4gKyAgICBDUFVIb3RwbHVnU3RhdGUgY3B1aHBfc3RhdGU7DQo+
ID4gKyAgICBNZW1vcnlSZWdpb24gY29udGFpbmVyX2NwdWhwOw0KPiA+ICsgICAgQWNwaUNwdUhv
dHBsdWcgY3B1aHA7DQo+ID4gICAgICAgR0VEU3RhdGUgZ2VkX3N0YXRlOw0KPiA+ICAgICAgIHVp
bnQzMl90IGdlZF9ldmVudF9iaXRtYXA7DQo+ID4gICAgICAgcWVtdV9pcnEgaXJxOw0KPiANCj4g
VGhhbmtzLA0KPiBHYXZpbg0KDQo=
