Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp2054628ejb;
        Mon, 9 Oct 2023 08:42:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqsnZu+i9MAkVr3hJJUjikEDPyNTkHHwofYW2I7rz+hx7O3x4ZmMeZ7pG+N8koE/T20A5t
X-Received: by 2002:a5d:674a:0:b0:317:e68f:e1b2 with SMTP id l10-20020a5d674a000000b00317e68fe1b2mr12914711wrw.28.1696866164907;
        Mon, 09 Oct 2023 08:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696866164; cv=none;
        d=google.com; s=arc-20160816;
        b=OVYZPyYc59wYJWcvVCV3r29d9Mkra7qF/a2DbS13jZZvCsp4uEpZNiLcRiLprxaiZc
         LxPiuSDgbdp7A4GZd2yOCkcs1ZWkgodZvPiwoCrXLsu7JLHLFjve58+3t3Qw+ow4IwRD
         IC2C1bsEJ4bjwhgKw2YjqJd3/GSDOSB4Wp6hxZ2ihZ39DRHWS9J6eGkv8HZB8B5S0KCZ
         xt5W7vxuc83O6OkZu5C2jrSTnSDDEXSgB0NSpNSEH0ma0nIjZbfIO1OQ5B10zILWSszt
         PlmyULT4YZ05yzFml3hWT/mlzsLCgOatBblIQKsng9Y4GLO14I236QcvaQxO5q7LBSJu
         gg8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=gnKQKNKABME5fobFToAXDgRcIRPd1YW+NABgzL+syx0=;
        fh=Kb2Gcs7VD5wSTmDinyryIWwdRPJCIlRG79qMBRsDV+8=;
        b=kuqI/5wESsI5l5SXk9x3Z1XiQW2H7KgFk4YUc31LCIrL/fdldjn/OQYHWpjTtS7Lfz
         ZyF8ZbKSXn+U+hhU7rvEyDUdtK0X8DRSEyS2zqqYBWbm6JA/sq4jUiRfPkwIlzuWCfHf
         7sz7mDtkEqRE100JUTDl1oYH2i2ZmPn2DHAI35Qgc3d3YcPZotVI1RYBpXMHtlbnVwQ2
         mmosFLpDgl5ukQI4syyeyvXaAgIVyaTUzRcK6gFLZ5opjrQ8PfSj8YKfouo9uqoqHdTv
         4ZCQCVkAgnl3/c89r8X7GnPZ7qrdAaDSvnrJpytwz9ZzVyAMCkaPLBDVjD+3UEW6p5Qa
         R2rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id s6-20020a5d5106000000b003232294eac9si4046310wrt.989.2023.10.09.08.42.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 08:42:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100002.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S43CN4r4mz6K6Y6;
	Mon,  9 Oct 2023 23:40:48 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100002.china.huawei.com (7.191.160.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 16:42:43 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 9 Oct 2023 16:42:43 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: David Hildenbrand <david@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
CC: "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "philmd@linaro.org"
	<philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
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
Subject: RE: [PATCH V3 04/10] hw/acpi: Init GED framework with cpu hotplug
 events
Thread-Topic: [PATCH V3 04/10] hw/acpi: Init GED framework with cpu hotplug
 events
Thread-Index: AQHZ+qQKlc9E+oOc5kSBsTtattk5ybBBUZ0AgAAt45D///AqgIAAKSug
Date: Mon, 9 Oct 2023 15:42:42 +0000
Message-ID: <3bdad41c31764fd3b10f5e6564ffbd58@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
	<20231009112812.10612-5-salil.mehta@huawei.com>
	<794b07a3-6004-23e2-189a-f76952751112@redhat.com>
	<0e9c23f079ac417687c8261739ea22f2@huawei.com>
 <11e7cf3f-e733-1109-4b8d-918ba445eeea@redhat.com>
In-Reply-To: <11e7cf3f-e733-1109-4b8d-918ba445eeea@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.154.91]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: u1LQspnhxGG9

PiBGcm9tOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBPY3RvYmVyIDksIDIwMjMgMzoxNCBQTQ0KPiANCj4gT24gMDkuMTAuMjMgMTY6MTIsIFNh
bGlsIE1laHRhIHdyb3RlOg0KPiA+PiBGcm9tOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVk
aGF0LmNvbT4NCj4gPj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDksIDIwMjMgMToyNyBQTQ0KPiA+
PiBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+OyBxZW11LWRldmVsQG5v
bmdudS5vcmc7IHFlbXUtYXJtQG5vbmdudS5vcmcNCj4gPj4gQ2M6IG1hekBrZXJuZWwub3JnOyBq
ZWFuLXBoaWxpcHBlQGxpbmFyby5vcmc7IEpvbmF0aGFuIENhbWVyb24NCj4gPj4gPGpvbmF0aGFu
LmNhbWVyb25AaHVhd2VpLmNvbT47IGxwaWVyYWxpc2lAa2VybmVsLm9yZzsNCj4gPj4gcGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnOyByaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOw0KPiA+PiBp
bWFtbWVkb0ByZWRoYXQuY29tOyBhbmRyZXcuam9uZXNAbGludXguZGV2OyBwaGlsbWRAbGluYXJv
Lm9yZzsNCj4gPj4gZXJpYy5hdWdlckByZWRoYXQuY29tOyBvbGl2ZXIudXB0b25AbGludXguZGV2
OyBwYm9uemluaUByZWRoYXQuY29tOw0KPiA+PiBtc3RAcmVkaGF0LmNvbTsgd2lsbEBrZXJuZWwu
b3JnOyBnc2hhbkByZWRoYXQuY29tOyByYWZhZWxAa2VybmVsLm9yZzsNCj4gPj4gYWxleC5iZW5u
ZWVAbGluYXJvLm9yZzsgbGludXhAYXJtbGludXgub3JnLnVrOw0KPiA+PiBkYXJyZW5Ab3MuYW1w
ZXJlY29tcHV0aW5nLmNvbTsgaWxra2FAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsNCj4gPj4gdmlz
aG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb207IGthcmwuaGV1YmF1bUBvcmFjbGUuY29tOw0KPiA+
PiBtaWd1ZWwubHVpc0BvcmFjbGUuY29tOyBzYWxpbC5tZWh0YUBvcG5zcmMubmV0OyB6aHVrZXFp
YW4NCj4gPj4gPHpodWtlcWlhbjFAaHVhd2VpLmNvbT47IHdhbmd4aW9uZ2ZlbmcgKEMpIDx3YW5n
eGlvbmdmZW5nMkBodWF3ZWkuY29tPjsNCj4gPj4gd2FuZ3lhbmFuIChZKSA8d2FuZ3lhbmFuNTVA
aHVhd2VpLmNvbT47IGppYWtlcm5lbDJAZ21haWwuY29tOw0KPiA+PiBtYW9iaWJvQGxvb25nc29u
LmNuOyBsaXhpYW5nbGFpQGxvb25nc29uLmNuOyBMaW51eGFybQ0KPiA8bGludXhhcm1AaHVhd2Vp
LmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMyAwNC8xMF0gaHcvYWNwaTogSW5pdCBH
RUQgZnJhbWV3b3JrIHdpdGggY3B1IGhvdHBsdWcNCj4gPj4gZXZlbnRzDQo+ID4+DQo+ID4+IE9u
IDA5LjEwLjIzIDEzOjI4LCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gPj4+IEFDUEkgR0VEKGFzIGRl
c2NyaWJlZCBpbiB0aGUgQUNQSSA2LjIgc3BlYykgY2FuIGJlIHVzZWQgdG8gZ2VuZXJhdGUgQUNQ
SQ0KPiA+PiBldmVudHMNCj4gPj4+IHdoZW4gT1NQTS9ndWVzdCByZWNlaXZlcyBhbiBpbnRlcnJ1
cHQgbGlzdGVkIGluIHRoZSBfQ1JTIG9iamVjdCBvZiBHRUQuDQo+ID4+IE9TUE0NCj4gPj4+IHRo
ZW4gbWFwcyBvciBkZW11bHRpcGxleGVzIHRoZSBldmVudCBieSBldmFsdWF0aW5nIF9FVlQgbWV0
aG9kLg0KPiA+Pj4NCj4gPj4+IFRoaXMgY2hhbmdlIGFkZHMgdGhlIHN1cHBvcnQgb2YgY3B1IGhv
dHBsdWcgZXZlbnQgaW5pdGlhbGl6YXRpb24gaW4gdGhlDQo+ID4+PiBleGlzdGluZyBHRUQgZnJh
bWV3b3JrLg0KPiA+Pj4NCj4gPj4+IENvLWRldmVsb3BlZC1ieTogS2VxaWFuIFpodSA8emh1a2Vx
aWFuMUBodWF3ZWkuY29tPg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogS2VxaWFuIFpodSA8emh1a2Vx
aWFuMUBodWF3ZWkuY29tPg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGls
Lm1laHRhQGh1YXdlaS5jb20+DQo+ID4+PiBSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8
Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPg0KPiA+Pj4gUmV2aWV3ZWQtYnk6IEdhdmluIFNo
YW4gPGdzaGFuQHJlZGhhdC5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGh3L2FjcGkvZ2VuZXJp
Y19ldmVudF9kZXZpY2UuYyAgICAgICAgIHwgOCArKysrKysrKw0KPiA+Pj4gICAgaW5jbHVkZS9o
dy9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmggfCA1ICsrKysrDQo+ID4+PiAgICAyIGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvaHcv
YWNwaS9nZW5lcmljX2V2ZW50X2RldmljZS5jDQo+ID4+IGIvaHcvYWNwaS9nZW5lcmljX2V2ZW50
X2RldmljZS5jDQo+ID4+PiBpbmRleCBhM2QzMTYzMWZlLi5kMmZhMWQwZTRhIDEwMDY0NA0KPiA+
Pj4gLS0tIGEvaHcvYWNwaS9nZW5lcmljX2V2ZW50X2RldmljZS5jDQo+ID4+PiArKysgYi9ody9h
Y3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmMNCj4gPj4+IEBAIC0yNSw2ICsyNSw3IEBAIHN0YXRp
YyBjb25zdCB1aW50MzJfdCBnZWRfc3VwcG9ydGVkX2V2ZW50c1tdID0gew0KPiA+Pj4gICAgICAg
IEFDUElfR0VEX01FTV9IT1RQTFVHX0VWVCwNCj4gPj4+ICAgICAgICBBQ1BJX0dFRF9QV1JfRE9X
Tl9FVlQsDQo+ID4+PiAgICAgICAgQUNQSV9HRURfTlZESU1NX0hPVFBMVUdfRVZULA0KPiA+Pj4g
KyAgICBBQ1BJX0dFRF9DUFVfSE9UUExVR19FVlQsDQo+ID4+PiAgICB9Ow0KPiA+Pj4NCj4gPj4+
ICAgIC8qDQo+ID4+PiBAQCAtNDAwLDYgKzQwMSwxMyBAQCBzdGF0aWMgdm9pZCBhY3BpX2dlZF9p
bml0Zm4oT2JqZWN0ICpvYmopDQo+ID4+PiAgICAgICAgbWVtb3J5X3JlZ2lvbl9pbml0X2lvKCZn
ZWRfc3QtPnJlZ3MsIG9iaiwgJmdlZF9yZWdzX29wcywgZ2VkX3N0LA0KPiA+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBUWVBFX0FDUElfR0VEICItcmVncyIsDQo+IEFDUElfR0VEX1JF
R19DT1VOVCk7DQo+ID4+PiAgICAgICAgc3lzYnVzX2luaXRfbW1pbyhzYmQsICZnZWRfc3QtPnJl
Z3MpOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBzLT5jcHVocC5kZXZpY2UgPSBPQkpFQ1Qocyk7DQo+
ID4+PiArICAgIG1lbW9yeV9yZWdpb25faW5pdCgmcy0+Y29udGFpbmVyX2NwdWhwLCBPQkpFQ1Qo
ZGV2KSwgImNwdWhwDQo+ID4+IGNvbnRhaW5lciIsDQo+ID4+PiArICAgICAgICAgICAgICAgICAg
ICAgICBBQ1BJX0NQVV9IT1RQTFVHX1JFR19MRU4pOw0KPiA+Pj4gKyAgICBzeXNidXNfaW5pdF9t
bWlvKFNZU19CVVNfREVWSUNFKGRldiksICZzLT5jb250YWluZXJfY3B1aHApOw0KPiA+Pj4gKyAg
ICBjcHVfaG90cGx1Z19od19pbml0KCZzLT5jb250YWluZXJfY3B1aHAsIE9CSkVDVChkZXYpLA0K
PiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICZzLT5jcHVocF9zdGF0ZSwgMCk7DQo+ID4+
PiAgICB9DQo+ID4+Pg0KPiA+Pj4gICAgc3RhdGljIHZvaWQgYWNwaV9nZWRfY2xhc3NfaW5pdChP
YmplY3RDbGFzcyAqY2xhc3MsIHZvaWQgKmRhdGEpDQo+ID4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9ody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmgNCj4gPj4gYi9pbmNsdWRlL2h3L2FjcGkv
Z2VuZXJpY19ldmVudF9kZXZpY2UuaA0KPiA+Pj4gaW5kZXggZDgzMWJiZDg4OS4uZDBhNWE0M2Fi
ZiAxMDA2NDQNCj4gPj4+IC0tLSBhL2luY2x1ZGUvaHcvYWNwaS9nZW5lcmljX2V2ZW50X2Rldmlj
ZS5oDQo+ID4+PiArKysgYi9pbmNsdWRlL2h3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuaA0K
PiA+Pj4gQEAgLTYwLDYgKzYwLDcgQEANCj4gPj4+ICAgICNkZWZpbmUgSFdfQUNQSV9HRU5FUklD
X0VWRU5UX0RFVklDRV9IDQo+ID4+Pg0KPiA+Pj4gICAgI2luY2x1ZGUgImh3L3N5c2J1cy5oIg0K
PiA+Pj4gKyNpbmNsdWRlICJody9hY3BpL2NwdV9ob3RwbHVnLmgiDQo+ID4+PiAgICAjaW5jbHVk
ZSAiaHcvYWNwaS9tZW1vcnlfaG90cGx1Zy5oIg0KPiA+Pj4gICAgI2luY2x1ZGUgImh3L2FjcGkv
Z2hlcy5oIg0KPiA+Pj4gICAgI2luY2x1ZGUgInFvbS9vYmplY3QuaCINCj4gPj4+IEBAIC05Nyw2
ICs5OCw3IEBAIE9CSkVDVF9ERUNMQVJFX1NJTVBMRV9UWVBFKEFjcGlHZWRTdGF0ZSwgQUNQSV9H
RUQpDQo+ID4+PiAgICAjZGVmaW5lIEFDUElfR0VEX01FTV9IT1RQTFVHX0VWVCAgIDB4MQ0KPiA+
Pj4gICAgI2RlZmluZSBBQ1BJX0dFRF9QV1JfRE9XTl9FVlQgICAgICAweDINCj4gPj4+ICAgICNk
ZWZpbmUgQUNQSV9HRURfTlZESU1NX0hPVFBMVUdfRVZUIDB4NA0KPiA+Pj4gKyNkZWZpbmUgQUNQ
SV9HRURfQ1BVX0hPVFBMVUdfRVZUICAgIDB4OA0KPiA+Pj4NCj4gPj4+ICAgIHR5cGVkZWYgc3Ry
dWN0IEdFRFN0YXRlIHsNCj4gPj4+ICAgICAgICBNZW1vcnlSZWdpb24gZXZ0Ow0KPiA+Pj4gQEAg
LTEwOCw2ICsxMTAsOSBAQCBzdHJ1Y3QgQWNwaUdlZFN0YXRlIHsNCj4gPj4+ICAgICAgICBTeXNC
dXNEZXZpY2UgcGFyZW50X29iajsNCj4gPj4+ICAgICAgICBNZW1Ib3RwbHVnU3RhdGUgbWVtaHBf
c3RhdGU7DQo+ID4+PiAgICAgICAgTWVtb3J5UmVnaW9uIGNvbnRhaW5lcl9tZW1ocDsNCj4gPj4+
ICsgICAgQ1BVSG90cGx1Z1N0YXRlIGNwdWhwX3N0YXRlOw0KPiA+Pj4gKyAgICBNZW1vcnlSZWdp
b24gY29udGFpbmVyX2NwdWhwOw0KPiA+Pj4gKyAgICBBY3BpQ3B1SG90cGx1ZyBjcHVocDsNCj4g
Pj4NCj4gPj4gQW0gSSB3cm9uZyBvciBpcyB0aGF0IG1lbWJlciBjb21wbGV0ZWx5IHVudXNlZC91
bmluaXRpYWxpemVkPw0KPiA+DQo+ID4gTm8gaXQgaXMgbm90LiBQbGVhc2UgY2hlY2sgYmVsb3cg
Y2hhbmdlIGluIGFjcGlfZ2VkX2luaXRmbigpDQo+ID4NCj4gPiArICAgIHMtPmNwdWhwLmRldmlj
ZSA9IE9CSkVDVChzKTsNCj4gDQo+IE5vdCB0aGUgYmVzdCBvZiBteSBtb25kYXlzLCBzb3JyeSBm
b3IgdGhhdC4NCj4gDQo+IFJldmlld2VkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVk
aGF0LmNvbT4NCg0KTm8gaXNzdWVzIGF0IGFsbC4gVGhhbmtzIGZvciB0YWtpbmcgdGltZSB0byBy
ZXZpZXcgdGhpcy4NCg0KQmVzdCByZWdhcmRzDQpTYWxpbC4NCg0K
