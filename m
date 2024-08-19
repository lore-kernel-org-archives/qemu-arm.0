Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp2058775njf;
        Mon, 19 Aug 2024 05:58:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUutbOdHjzUGJmkbj4OtWvLlrutVux4rdztS8OynzRguaRJhl8nXz+vMfXCD/XqLoQHQhd6qaI7dkrJEndvDMOpR7MRoGEl
X-Google-Smtp-Source: AGHT+IHqi0brEMn1N4G7qRiwtFvDJGPH4pKElYxlYkjLi4XkdkLFqYzpg9v50oiZYk4lZVKOr4tY
X-Received: by 2002:adf:9790:0:b0:368:3f6a:1dec with SMTP id ffacd0b85a97d-37194314dbbmr7207121f8f.9.1724072321242;
        Mon, 19 Aug 2024 05:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724072321; cv=none;
        d=google.com; s=arc-20160816;
        b=QKPDrRhzBfJFOGBzR7OFxZJ51dRpcq+ypfx59nKd22oNXavuyDEc5ry2Uc2NkDxT0y
         BJ6GDP7CISQGpAc9PQ6Hgj8OOl4p0HdF4LanN4dmGaif8LIpeRSu/9O7+I067sycy33K
         CfebaQ2ZLdVOiSoPibZQNpqrY0qyyTYDqSlqzGxrWtG7ZTaseyEiSgnRZcrrdw3JqYtC
         dBxesPe2/HUiVF9Pbq/Y12yv6WET0OTUF3ELz9Spx9P2d7FhfDnZiEfh9wIT421DdQMq
         dfOldGRgz7gvXu0SxpzuQFdEKVtFWHCmzf9V1TdF+8upMeP+tVXURk3Yf48ECoR4VsDX
         D/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=V1a2Ohl7ogX2UTKUrVHk/qQo88zRKGj+yVcNqCQZHcY=;
        fh=iwz5zzZl5kqbGUPc+7neqYAiJxC5LBdxf4wiB2I9RHw=;
        b=hbcgSmcjqlfwXhDIEpLVjBGOvZHnJ0i8M2/o5Bye/j2Sq9T9EHnYYOWmdAVPI6P7W9
         dVG/sgCgRFNUZSMZ1D7MsnI3QYoZ3JtlT+gvO9f64LlGzZNJz1xKaP87j+AHoOD32Z1z
         zGBbCT2QS9ry8Zofi/BbLRtR5nHT03CPf6r7mKbYnfBzC8/oka/TmPXzHHu5ryZW8F84
         sWNtGm9xHcgXCmzrKRxjSx/HHU6KarvbDU+7LH8HWtEGwdzhpkLSHPVp5/2AF8eY2HK1
         FXjHGyvrEP3tST53xqtYJEhUV6eFG5vekmr5G+JaN3kBVFOX4srJAtlbDcIgPwCcJqCh
         Oycw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-371898c8f4asi4251959f8f.794.2024.08.19.05.58.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2024 05:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WnXdP1TMHz6LDKx;
	Mon, 19 Aug 2024 20:55:37 +0800 (CST)
Received: from lhrpeml500006.china.huawei.com (unknown [7.191.161.198])
	by mail.maildlp.com (Postfix) with ESMTPS id 2FD42140A78;
	Mon, 19 Aug 2024 20:58:40 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 13:58:39 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Mon, 19 Aug 2024 13:58:39 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>, "maz@kernel.org"
	<maz@kernel.org>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
	<karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "shahuang@redhat.com"
	<shahuang@redhat.com>, "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm
	<linuxarm@huawei.com>
Subject: RE: [PATCH RFC V3 24/29] target/arm: Add support of *unrealize*
 ARMCPU during vCPU Hot-unplug
Thread-Topic: [PATCH RFC V3 24/29] target/arm: Add support of *unrealize*
 ARMCPU during vCPU Hot-unplug
Thread-Index: AQHavev6H7OxF7zZK02qabf2MUOdZrIqaJGS///y5oCABJZOYA==
Date: Mon, 19 Aug 2024 12:58:39 +0000
Message-ID: <0059c598676a4b9d8e34b9c0dc62b09e@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-25-salil.mehta@huawei.com>
 <87v800wkb1.fsf@draig.linaro.org>
 <CAFEAcA9A9Oq0nURkiLNWZNC=P7KQGyr8TjjfOmEq+squwF+xog@mail.gmail.com>
In-Reply-To: <CAFEAcA9A9Oq0nURkiLNWZNC=P7KQGyr8TjjfOmEq+squwF+xog@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.151.47]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: aI3WKYVngAbv

SGkgUGV0ZXIsDQoNCj4gIEZyb206IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJv
Lm9yZz4NCj4gIFNlbnQ6IEZyaWRheSwgQXVndXN0IDE2LCAyMDI0IDQ6NTEgUE0NCj4gIFRvOiBB
bGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+ICANCj4gIE9uIEZyaSwgMTYg
QXVnIDIwMjQgYXQgMTY6MzcsIEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4g
d3JvdGU6DQo+ICA+DQo+ICA+IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPiB3
cml0ZXM6DQo+ICA+DQo+ICA+ID4gdkNQVSBIb3QtdW5wbHVnIHdpbGwgcmVzdWx0IGluIFFPTSBD
UFUgb2JqZWN0IHVucmVhbGl6YXRpb24gd2hpY2gNCj4gID4gPiB3aWxsIGRvIGF3YXkgd2l0aCBh
bGwgdGhlIHZDUFUgdGhyZWFkIGNyZWF0aW9ucywgYWxsb2NhdGlvbnMsDQo+ICA+ID4gcmVnaXN0
cmF0aW9ucyB0aGF0IGhhcHBlbmVkIGFzIHBhcnQgb2YgdGhlIHJlYWxpemF0aW9uIHByb2Nlc3Mu
IFRoaXMNCj4gID4gPiBjaGFuZ2UgaW50cm9kdWNlcyB0aGUgQVJNIENQVSB1bnJlYWxpemUgZnVu
Y3Rpb24gdGFraW5nIGNhcmUgb2YgZXhhY3RseQ0KPiAgdGhhdC4NCj4gID4gPg0KPiAgPiA+IE5v
dGUsIGluaXRpYWxpemVkIEtWTSB2Q1BVcyBhcmUgbm90IGRlc3Ryb3llZCBpbiBob3N0IEtWTSBi
dXQgdGhlaXINCj4gID4gPiBRZW11IGNvbnRleHQgaXMgcGFya2VkIGF0IHRoZSBRRU1VIEtWTSBs
YXllci4NCj4gID4gPg0KPiAgPiA+IENvLWRldmVsb3BlZC1ieTogS2VxaWFuIFpodSA8emh1a2Vx
aWFuMUBodWF3ZWkuY29tPg0KPiAgPiA+IFNpZ25lZC1vZmYtYnk6IEtlcWlhbiBaaHUgPHpodWtl
cWlhbjFAaHVhd2VpLmNvbT4NCj4gID4gPiBTaWduZWQtb2ZmLWJ5OiBTYWxpbCBNZWh0YSA8c2Fs
aWwubWVodGFAaHVhd2VpLmNvbT4NCj4gID4gPiBSZXBvcnRlZC1ieTogVmlzaG51IFBhamp1cmkg
PHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tPg0KPiAgPiA+IFtWUDogSWRlbnRpZmllZCBD
UFUgc3RhbGwgaXNzdWUgJiBzdWdnZXN0ZWQgcHJvYmFibGUgZml4XQ0KPiAgPiA+IFNpZ25lZC1v
ZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiAgPiA+IC0tLQ0K
PiAgPiA+ICB0YXJnZXQvYXJtL2NwdS5jICAgICAgIHwgMTAxDQo+ICArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgPiA+ICB0YXJnZXQvYXJtL2NwdS5oICAgICAg
IHwgIDE0ICsrKysrKw0KPiAgPiA+ICB0YXJnZXQvYXJtL2dkYnN0dWIuYyAgIHwgICA2ICsrKw0K
PiAgPiA+ICB0YXJnZXQvYXJtL2hlbHBlci5jICAgIHwgIDI1ICsrKysrKysrKysNCj4gID4gPiAg
dGFyZ2V0L2FybS9pbnRlcm5hbHMuaCB8ICAgMyArKw0KPiAgPiA+ICB0YXJnZXQvYXJtL2t2bS5j
ICAgICAgIHwgICA1ICsrDQo+ICA+ID4gIDYgZmlsZXMgY2hhbmdlZCwgMTU0IGluc2VydGlvbnMo
KykNCj4gID4gPg0KPiAgPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvYXJtL2NwdS5jIGIvdGFyZ2V0
L2FybS9jcHUuYyBpbmRleA0KPiAgPiA+IGM5MjE2MmZhOTcuLmEzZGM2NjkzMDkgMTAwNjQ0DQo+
ICA+ID4gLS0tIGEvdGFyZ2V0L2FybS9jcHUuYw0KPiAgPiA+ICsrKyBiL3RhcmdldC9hcm0vY3B1
LmMNCj4gID4gPiBAQCAtMTU3LDYgKzE1NywxNiBAQCB2b2lkDQo+ICBhcm1fcmVnaXN0ZXJfcHJl
X2VsX2NoYW5nZV9ob29rKEFSTUNQVSAqY3B1LCBBUk1FTENoYW5nZUhvb2tGbg0KPiAgKmhvb2ss
DQo+ICA+ID4gICAgICBRTElTVF9JTlNFUlRfSEVBRCgmY3B1LT5wcmVfZWxfY2hhbmdlX2hvb2tz
LCBlbnRyeSwgbm9kZSk7ICB9DQo+ICA+ID4NCj4gID4gPiArdm9pZCBhcm1fdW5yZWdpc3Rlcl9w
cmVfZWxfY2hhbmdlX2hvb2tzKEFSTUNQVSAqY3B1KSB7DQo+ICA+ID4gKyAgICBBUk1FTENoYW5n
ZUhvb2sgKmVudHJ5LCAqbmV4dDsNCj4gID4gPiArDQo+ICA+ID4gKyAgICBRTElTVF9GT1JFQUNI
X1NBRkUoZW50cnksICZjcHUtPnByZV9lbF9jaGFuZ2VfaG9va3MsIG5vZGUsDQo+ICBuZXh0KSB7
DQo+ICA+ID4gKyAgICAgICAgUUxJU1RfUkVNT1ZFKGVudHJ5LCBub2RlKTsNCj4gID4gPiArICAg
ICAgICBnX2ZyZWUoZW50cnkpOw0KPiAgPiA+ICsgICAgfQ0KPiAgPiA+ICt9DQo+ICA+ID4gKw0K
PiAgPiA+ICB2b2lkIGFybV9yZWdpc3Rlcl9lbF9jaGFuZ2VfaG9vayhBUk1DUFUgKmNwdSwNCj4g
IEFSTUVMQ2hhbmdlSG9va0ZuICpob29rLA0KPiAgPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkICpvcGFxdWUpICB7IEBAIC0xNjgsNiArMTc4LDE2DQo+ICA+ID4gQEAg
dm9pZCBhcm1fcmVnaXN0ZXJfZWxfY2hhbmdlX2hvb2soQVJNQ1BVICpjcHUsDQo+ICBBUk1FTENo
YW5nZUhvb2tGbiAqaG9vaywNCj4gID4gPiAgICAgIFFMSVNUX0lOU0VSVF9IRUFEKCZjcHUtPmVs
X2NoYW5nZV9ob29rcywgZW50cnksIG5vZGUpOyAgfQ0KPiAgPiA+DQo+ICA+ID4gK3ZvaWQgYXJt
X3VucmVnaXN0ZXJfZWxfY2hhbmdlX2hvb2tzKEFSTUNQVSAqY3B1KSB7DQo+ICA+ID4gKyAgICBB
Uk1FTENoYW5nZUhvb2sgKmVudHJ5LCAqbmV4dDsNCj4gID4gPiArDQo+ICA+ID4gKyAgICBRTElT
VF9GT1JFQUNIX1NBRkUoZW50cnksICZjcHUtPmVsX2NoYW5nZV9ob29rcywgbm9kZSwgbmV4dCkN
Cj4gIHsNCj4gID4gPiArICAgICAgICBRTElTVF9SRU1PVkUoZW50cnksIG5vZGUpOw0KPiAgPiA+
ICsgICAgICAgIGdfZnJlZShlbnRyeSk7DQo+ICA+ID4gKyAgICB9DQo+ICA+ID4gK30NCj4gID4g
PiArDQo+ICA+ID4gIHN0YXRpYyB2b2lkIGNwX3JlZ19yZXNldChncG9pbnRlciBrZXksIGdwb2lu
dGVyIHZhbHVlLCBncG9pbnRlcg0KPiAgPiA+IG9wYXF1ZSkgIHsNCj4gID4gPiAgICAgIC8qIFJl
c2V0IGEgc2luZ2xlIEFSTUNQUmVnSW5mbyByZWdpc3RlciAqLyBAQCAtMjU1Miw2ICsyNTcyLDg1
DQo+ICA+ID4gQEAgc3RhdGljIHZvaWQgYXJtX2NwdV9yZWFsaXplZm4oRGV2aWNlU3RhdGUgKmRl
diwgRXJyb3IgKiplcnJwKQ0KPiAgPiA+ICAgICAgYWNjLT5wYXJlbnRfcmVhbGl6ZShkZXYsIGVy
cnApOyAgfQ0KPiAgPiA+DQo+ICA+ID4gK3N0YXRpYyB2b2lkIGFybV9jcHVfdW5yZWFsaXplZm4o
RGV2aWNlU3RhdGUgKmRldikgew0KPiAgPiA+ICsgICAgQVJNQ1BVQ2xhc3MgKmFjYyA9IEFSTV9D
UFVfR0VUX0NMQVNTKGRldik7DQo+ICA+ID4gKyAgICBBUk1DUFUgKmNwdSA9IEFSTV9DUFUoZGV2
KTsNCj4gID4gPiArICAgIENQVUFSTVN0YXRlICplbnYgPSAmY3B1LT5lbnY7DQo+ICA+ID4gKyAg
ICBDUFVTdGF0ZSAqY3MgPSBDUFUoZGV2KTsNCj4gID4gPiArICAgIGJvb2wgaGFzX3NlY3VyZTsN
Cj4gID4gPiArDQo+ICA+ID4gKyAgICBoYXNfc2VjdXJlID0gY3B1LT5oYXNfZWwzIHx8IGFybV9m
ZWF0dXJlKGVudiwNCj4gID4gPiArIEFSTV9GRUFUVVJFX01fU0VDVVJJVFkpOw0KPiAgPiA+ICsN
Cj4gID4gPiArICAgIC8qIHJvY2sgJ24nIHVuLXJvbGwsIHdoYXRldmVyIGhhcHBlbmVkIGluIHRo
ZSBhcm1fY3B1X3JlYWxpemVmbg0KPiAgY2xlYW5seSAqLw0KPiAgPiA+ICsgICAgY3B1X2FkZHJl
c3Nfc3BhY2VfZGVzdHJveShjcywgQVJNQVNJZHhfTlMpOw0KPiAgPg0KPiAgPiBPbiBjdXJyZW50
IG1hc3RlciB0aGlzIHdpbGwgZmFpbDoNCj4gID4NCj4gID4gLi4vLi4vdGFyZ2V0L2FybS9jcHUu
YzogSW4gZnVuY3Rpb24g4oCYYXJtX2NwdV91bnJlYWxpemVmbuKAmToNCj4gID4gLi4vLi4vdGFy
Z2V0L2FybS9jcHUuYzoyNjI2OjU6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5j
dGlvbg0KPiAg4oCYY3B1X2FkZHJlc3Nfc3BhY2VfZGVzdHJveeKAmSBbLVdlcnJvcj1pbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4gID4gIDI2MjYgfCAgICAgY3B1X2FkZHJlc3Nfc3Bh
Y2VfZGVzdHJveShjcywgQVJNQVNJZHhfTlMpOw0KPiAgPiAgICAgICB8ICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+DQo+ICA+IC4uLy4uL3RhcmdldC9hcm0vY3B1LmM6MjYyNjo1OiBlcnJv
cjogbmVzdGVkIGV4dGVybiBkZWNsYXJhdGlvbiBvZg0KPiAgPiDigJhjcHVfYWRkcmVzc19zcGFj
ZV9kZXN0cm954oCZIFstV2Vycm9yPW5lc3RlZC1leHRlcm5zXQ0KPiAgPiBjYzE6IGFsbCB3YXJu
aW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0KPiAgDQo+ICBXZSBzaG91bGRuJ3QgbmVlZCB0
byBleHBsaWNpdGx5IGNhbGwgY3B1X2FkZHJlc3Nfc3BhY2VfZGVzdHJveSgpIGZyb20gYQ0KPiAg
dGFyZ2V0LXNwZWNpZmljIHVucmVhbGl6ZSBhbnl3YXk6IHdlIGNhbiBkbyBpdCBhbGwgZnJvbSB0
aGUgYmFzZSBjbGFzcyAoYW5kIEkNCj4gIHRoaW5rIHRoaXMgd291bGQgZml4IHNvbWUgbGVha3Mg
aW4gY3VycmVudCBjb2RlIGZvciB0YXJnZXRzIHRoYXQgaG90LXVucGx1ZywNCj4gIHRob3VnaCBJ
IHNob3VsZCBjaGVjayB0aGF0KS4gT3RoZXJ3aXNlIHlvdSBuZWVkIHRvIGR1cGxpY2F0ZSBhbGwg
dGhlIGxvZ2ljIGZvcg0KPiAgZmlndXJpbmcgb3V0IHdoaWNoIGFkZHJlc3Mgc3BhY2VzIHdlIGNy
ZWF0ZWQgaW4gcmVhbGl6ZSwgd2hpY2ggaXMgZnJhZ2lsZSBhbmQNCj4gIG5vdCBuZWNlc3Nhcnkg
d2hlbiBhbGwgd2Ugd2FudCB0byBkbyBpcyAiZGVsZXRlIGV2ZXJ5IGFkZHJlc3Mgc3BhY2UgdGhl
DQo+ICBDUFUgb2JqZWN0IGhhcyINCj4gIGFuZCB3ZSB3YW50IHRvIGRvIHRoYXQgZm9yIGV2ZXJ5
IHRhcmdldCBhcmNoaXRlY3R1cmUgYWx3YXlzLg0KDQoNCkFncmVlZCBidXQgSSB3b3VsZCBzdWdn
ZXN0IHRvIG1ha2UgaXQgb3B0aW9uYWwgaS5lLiBpbiBjYXNlIGFyY2hpdGVjdHVyZSB3YW50DQp0
byByZWxlYXNlIHRvIGZyb20gaXRzIGNvZGUuIEl0IHNob3VsZCBiZSBhbGxvd2VkLiAgVGhpcyBh
bHNvIGVuc3VyZXMgY2xhcml0eSBvZiB0aGUNCmZsb3dzLA0KDQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9xZW11LWRldmVsL2EzMDhlMWY0ZjA2ZjRlM2FiNmFiNTFmMzUzNjAxZjQzQGh1YXdlaS5j
b20vDQoNCg0KVGhhbmtzDQpTYWxpbC4NCg0KDQoNCj4gIA0KPiAgLS0gUE1NDQo=
