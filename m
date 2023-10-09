Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1976414ejb;
        Mon, 9 Oct 2023 06:43:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaz6gfrgPuWzucXl5HFuwR/ahwRvML21Mk1MEm+EmazkZzvLKcAZamgBlJLp9sKyiE99EU
X-Received: by 2002:a7b:ce8a:0:b0:405:4776:735a with SMTP id q10-20020a7bce8a000000b004054776735amr14366457wmj.2.1696859008133;
        Mon, 09 Oct 2023 06:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696859008; cv=none;
        d=google.com; s=arc-20160816;
        b=pbFxF4paXOrHPrbSq0DXoWE0QvmdYnyhQ/y66EFPAx9QKuExSXD53OogwFa1O2KD3D
         +JoW8+LFFBKAte5LauM1+U0QatZ2hGejKjsFcaQS+6HWAiPrSkR9OhGjn1eA0y8Vx3YQ
         ZB0IvWk2/CWoHijez4zIWICJVztFoajL/1oTV3MKxi/HejOjDIR5j3cmEtQo9w5mT53m
         mWZBwkH1Qf+VoIE41qMV7C6MTJwoqTEvqNvpf5rq2rA+pVJirOSBCdOAjp5Aayf05wiJ
         78EM/AeQeGe1Zgs67lhd7ucsuSxZGsxND03FOFsqN1i3cJU/WWVnuX4XztoSfVr00ilf
         10aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=tDhe7v8pAn/YtVllMeSSiErIUQtTw+Th0Pbe2sHnz+E=;
        fh=Kb2Gcs7VD5wSTmDinyryIWwdRPJCIlRG79qMBRsDV+8=;
        b=TO4fRhsMGndCoEoX2gvQ8FuU8qTjwfsxjfLIaeNpwelT5bYkx2LvGCo9eY0CNMr0uv
         M1HyMW5cPhbhdtRX/3c9s85V0YqGbYERvF4AAXFA5qRtANPLlnwVCamOGycNv0sOUFmc
         U17imQ9sCsM0xMZoRTISFKkZhPcj8gz+eEOMayzi8rlFsk/xm6Pa5Pevu5z3RwGMFmtd
         O/5kuBrL42QIBmBh90r0wkt/PCVI3N2y2cMjmHR+abFhlvCOv335zMNFn50MxQO5CZn+
         riMDMiWVQ0Va1kTsZyCo/A7Wc9w4GYDjMhnYJlxy5OBEItPrezw8YffRSF2V1WfM7Eit
         rctQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id i11-20020a5d55cb000000b0031f91266e67si3565097wrw.309.2023.10.09.06.43.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 06:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100004.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S40XY0rjVz6D8WV;
	Mon,  9 Oct 2023 21:40:29 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100004.china.huawei.com (7.191.162.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 14:43:26 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 9 Oct 2023 14:43:26 +0100
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
Subject: RE: [PATCH V3 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len macro
 to common header file
Thread-Topic: [PATCH V3 02/10] hw/acpi: Move CPU ctrl-dev MMIO region len
 macro to common header file
Thread-Index: AQHZ+qP0kECoHw+Aq0awyG8WwpofkrBBUDoAgAAnhNA=
Date: Mon, 9 Oct 2023 13:43:26 +0000
Message-ID: <c941597940e54d5c87aedbf129d79482@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
 <20231009112812.10612-3-salil.mehta@huawei.com>
 <3380adbe-fbbe-797f-19c2-76aa2e4cfe30@redhat.com>
In-Reply-To: <3380adbe-fbbe-797f-19c2-76aa2e4cfe30@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.154.91]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: NBwPc7SdPz/U

PiBGcm9tOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBPY3RvYmVyIDksIDIwMjMgMToyMiBQTQ0KPiBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1l
aHRhQGh1YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtDQo+IGFybUBub25n
bnUub3JnDQo+IENjOiBtYXpAa2VybmVsLm9yZzsgamVhbi1waGlsaXBwZUBsaW5hcm8ub3JnOyBK
b25hdGhhbiBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBscGllcmFs
aXNpQGtlcm5lbC5vcmc7DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcmljaGFyZC5oZW5k
ZXJzb25AbGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3LmpvbmVzQGxp
bnV4LmRldjsgcGhpbG1kQGxpbmFyby5vcmc7DQo+IGVyaWMuYXVnZXJAcmVkaGF0LmNvbTsgb2xp
dmVyLnVwdG9uQGxpbnV4LmRldjsgcGJvbnppbmlAcmVkaGF0LmNvbTsNCj4gbXN0QHJlZGhhdC5j
b207IHdpbGxAa2VybmVsLm9yZzsgZ3NoYW5AcmVkaGF0LmNvbTsgcmFmYWVsQGtlcm5lbC5vcmc7
DQo+IGFsZXguYmVubmVlQGxpbmFyby5vcmc7IGxpbnV4QGFybWxpbnV4Lm9yZy51azsNCj4gZGFy
cmVuQG9zLmFtcGVyZWNvbXB1dGluZy5jb207IGlsa2thQG9zLmFtcGVyZWNvbXB1dGluZy5jb207
DQo+IHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBrYXJsLmhldWJhdW1Ab3JhY2xlLmNv
bTsNCj4gbWlndWVsLmx1aXNAb3JhY2xlLmNvbTsgc2FsaWwubWVodGFAb3Buc3JjLm5ldDsgemh1
a2VxaWFuDQo+IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5nIChDKSA8d2Fu
Z3hpb25nZmVuZzJAaHVhd2VpLmNvbT47DQo+IHdhbmd5YW5hbiAoWSkgPHdhbmd5YW5hbjU1QGh1
YXdlaS5jb20+OyBqaWFrZXJuZWwyQGdtYWlsLmNvbTsNCj4gbWFvYmlib0Bsb29uZ3Nvbi5jbjsg
bGl4aWFuZ2xhaUBsb29uZ3Nvbi5jbjsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMDIvMTBdIGh3L2FjcGk6IE1vdmUgQ1BVIGN0cmwtZGV2
IE1NSU8gcmVnaW9uIGxlbg0KPiBtYWNybyB0byBjb21tb24gaGVhZGVyIGZpbGUNCj4gDQo+IE9u
IDA5LjEwLjIzIDEzOjI4LCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gPiBDUFUgY3RybC1kZXYgTU1J
TyByZWdpb24gbGVuZ3RoIGNvdWxkIGJlIHVzZWQgaW4gQUNQSSBHRUQgYW5kIHZhcmlvdXMNCj4g
b3RoZXINCj4gPiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgcGxhY2VzLiBNb3ZlIEFDUElfQ1BVX0hP
VFBMVUdfUkVHX0xFTiBtYWNybyB0byBtb3JlDQo+ID4gYXBwcm9wcmlhdGUgY29tbW9uIGhlYWRl
ciBmaWxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRh
QGh1YXdlaS5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVA
bGluYXJvLm9yZz4NCj4gPiBSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4u
Q2FtZXJvbkBodWF3ZWkuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBHYXZpbiBTaGFuIDxnc2hhbkBy
ZWRoYXQuY29tPg0KPiA+IC0tLQ0KPiA+ICAgaHcvYWNwaS9jcHUuYyAgICAgICAgICAgICAgICAg
fCAyICstDQo+ID4gICBpbmNsdWRlL2h3L2FjcGkvY3B1X2hvdHBsdWcuaCB8IDIgKysNCj4gPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvaHcvYWNwaS9jcHUuYyBiL2h3L2FjcGkvY3B1LmMNCj4gPiBpbmRleCAx
OWMxNTRkNzhmLi40NWRlZmRjMGUyIDEwMDY0NA0KPiA+IC0tLSBhL2h3L2FjcGkvY3B1LmMNCj4g
PiArKysgYi9ody9hY3BpL2NwdS5jDQo+ID4gQEAgLTEsMTIgKzEsMTIgQEANCj4gPiAgICNpbmNs
dWRlICJxZW11L29zZGVwLmgiDQo+ID4gICAjaW5jbHVkZSAibWlncmF0aW9uL3Ztc3RhdGUuaCIN
Cj4gPiAgICNpbmNsdWRlICJody9hY3BpL2NwdS5oIg0KPiA+ICsjaW5jbHVkZSAiaHcvYWNwaS9j
cHVfaG90cGx1Zy5oIg0KPiA+ICAgI2luY2x1ZGUgInFhcGkvZXJyb3IuaCINCj4gPiAgICNpbmNs
dWRlICJxYXBpL3FhcGktZXZlbnRzLWFjcGkuaCINCj4gPiAgICNpbmNsdWRlICJ0cmFjZS5oIg0K
PiA+ICAgI2luY2x1ZGUgInN5c2VtdS9udW1hLmgiDQo+ID4NCj4gPiAtI2RlZmluZSBBQ1BJX0NQ
VV9IT1RQTFVHX1JFR19MRU4gMTINCj4gPiAgICNkZWZpbmUgQUNQSV9DUFVfU0VMRUNUT1JfT0ZG
U0VUX1dSIDANCj4gPiAgICNkZWZpbmUgQUNQSV9DUFVfRkxBR1NfT0ZGU0VUX1JXIDQNCj4gPiAg
ICNkZWZpbmUgQUNQSV9DUFVfQ01EX09GRlNFVF9XUiA1DQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvaHcvYWNwaS9jcHVfaG90cGx1Zy5oDQo+IGIvaW5jbHVkZS9ody9hY3BpL2NwdV9ob3RwbHVn
LmgNCj4gPiBpbmRleCAzYjkzMmFiYmJiLi40OGIyOTFlNDVlIDEwMDY0NA0KPiA+IC0tLSBhL2lu
Y2x1ZGUvaHcvYWNwaS9jcHVfaG90cGx1Zy5oDQo+ID4gKysrIGIvaW5jbHVkZS9ody9hY3BpL2Nw
dV9ob3RwbHVnLmgNCj4gPiBAQCAtMTksNiArMTksOCBAQA0KPiA+ICAgI2luY2x1ZGUgImh3L2hv
dHBsdWcuaCINCj4gPiAgICNpbmNsdWRlICJody9hY3BpL2NwdS5oIg0KPiA+DQo+ID4gKyNkZWZp
bmUgQUNQSV9DUFVfSE9UUExVR19SRUdfTEVOIDEyDQo+ID4gKw0KPiA+ICAgdHlwZWRlZiBzdHJ1
Y3QgQWNwaUNwdUhvdHBsdWcgew0KPiA+ICAgICAgIE9iamVjdCAqZGV2aWNlOw0KPiA+ICAgICAg
IE1lbW9yeVJlZ2lvbiBpbzsNCj4gDQo+IFJldmlld2VkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8
ZGF2aWRAcmVkaGF0LmNvbT4NCg0KVGhhbmtzDQpTYWxpbC4NCg==
