Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp45445ejc;
        Fri, 3 May 2024 13:09:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxJEUihps9Ome5K+rcc4EY7huaZNK9OEwtZHaye/ji6NclSVyWEFLefaHWWIuEAARJA7tB//jt5pTUZRApUju1psxSjs+x
X-Google-Smtp-Source: AGHT+IFyxaCiG/0AQ1ZAbtWDdecqRkTRWMQyTZOcfE9Td46CN8VuXQKGzRJulDW2oSShrffJ0RN1
X-Received: by 2002:adf:f68c:0:b0:346:e590:1a0f with SMTP id v12-20020adff68c000000b00346e5901a0fmr2926930wrp.61.1714766952254;
        Fri, 03 May 2024 13:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714766952; cv=none;
        d=google.com; s=arc-20160816;
        b=U+DWVsYc3PQsPnxFY5P1WoSF1wHj6Lr75NqfRC+rjUEhdqJcW6htWc/oEdgxcXxUqq
         dn+yTswg7Q2k+QAsD9ccJg1N2lQCSOgbhq5uAI2FpDR3bXI/CraWYfnxIPguyTjg9xxS
         j+oPCn2i7NnJ/GSAAZ8AoeZvbXrNhuSaAyh087cUjoRjjOcAvgMncJyfVZ5Gduvl0Q50
         Yre8KEkRrovc488q+v4lhGPtXovdlhTzoR5Do1nkfP2BYptg00waOdWa6aFbJg6TjWF9
         HkjkXj3xaVjEKFhjvui9cP2IZ3RWJ3VQoLq/qtm3rTVgcBrEM+jJslbR5PjCEVkEVr/w
         J2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=bwLHPXzc069pNtp1tLqNuNlUuCyOM773Cicpuy6mug0=;
        fh=PSo62VkhYPitl4NKfoh4l/buQhYoGGtJe97votQaHz4=;
        b=hgLohW5tWpImhw7mUHzdLNpPfDATvRlnbhv6dnR57mCLoG5heC7BFkdib6bbZrumTA
         GQ+0oMQ9gvy7Rl0Zlg3c0xUQn2RbKmP4Wesvn6CahpH39oD5t8r61Bs7XFQ8XgQOLWrw
         HnASUQhCiDtR5UKiJMEqCnkkS4dW6GdH20FQNG2x1FnyUSsq7P2koqBLu5SPju7OspEj
         rDQPEAZvewGpOc0dIgHsMKxV1JPztZ0DuQ5cj3n9xla3ZwCm8NR7AUFkrWB44rhGfLqg
         AoVzscrI1wYCkiIj2DSPwt5VwbpM7Zn8St9gaJsrTboIYnWWwxSX3pZcFPjkduFVqQAo
         vDww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id e7-20020a5d4e87000000b0034d8e602bf6si2333304wru.594.2024.05.03.13.09.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2024 13:09:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VWMJJ3s4hz6J9v7;
	Sat,  4 May 2024 04:06:24 +0800 (CST)
Received: from lhrpeml100001.china.huawei.com (unknown [7.191.160.183])
	by mail.maildlp.com (Postfix) with ESMTPS id 034E71400CD;
	Sat,  4 May 2024 04:09:11 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100001.china.huawei.com (7.191.160.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 3 May 2024 21:09:10 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Fri, 3 May 2024 21:09:10 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Vishnu Pajjuri <vishnu@amperemail.onmicrosoft.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>
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
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
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
	Linuxarm <linuxarm@huawei.com>, "gankulkarni@os.amperecomputing.com"
	<gankulkarni@os.amperecomputing.com>
Subject: RE: [PATCH V8 3/8] hw/acpi: Update ACPI GED framework to support vCPU
 Hotplug
Thread-Topic: [PATCH V8 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Index: AQHadCE2/9My+8CRgUW+VfhEC8BhG7FYOAgAgC4IpoA=
Date: Fri, 3 May 2024 20:09:10 +0000
Message-ID: <dfefe23348be42ccaf1c7f9c41bf8bc6@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-4-salil.mehta@huawei.com>
 <98b28e91-20e1-4b71-8997-608303fbdb3f@amperemail.onmicrosoft.com>
In-Reply-To: <98b28e91-20e1-4b71-8997-608303fbdb3f@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.152.25]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: Ct/6EWNJALrT

SGkgVmlzaG51LA0KDQo+ICBGcm9tOiBWaXNobnUgUGFqanVyaSA8dmlzaG51QGFtcGVyZW1haWwu
b25taWNyb3NvZnQuY29tPiANCj4gIFNlbnQ6IFRodXJzZGF5LCBBcHJpbCA0LCAyMDI0IDM6MDEg
UE0NCj4gIFRvOiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT47IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZzsgcWVtdS1hcm1Abm9uZ251Lm9yZw0KPiAgDQo+ICBIaSBTYWxpbCwNCj4+
ICBPbiAxMi0wMy0yMDI0IDA3OjI5LCBTYWxpbCBNZWh0YSB3cm90ZToNCj4+ICBBQ1BJIEdFRCAo
YXMgZGVzY3JpYmVkIGluIHRoZSBBQ1BJIDYuNCBzcGVjKSB1c2VzIGFuIGludGVycnVwdCBsaXN0
ZWQgaW4gdGhlDQo+PiAgX0NSUyBvYmplY3Qgb2YgR0VEIHRvIGludGltYXRlIE9TUE0gYWJvdXQg
YW4gZXZlbnQuIExhdGVyIHRoZW4gZGVtdWx0aXBsZXhlcyB0aGUNCj4+ICBub3RpZmllZCBldmVu
dCBieSBldmFsdWF0aW5nIEFDUEkgX0VWVCBtZXRob2QgdG8ga25vdyB0aGUgdHlwZSBvZiBldmVu
dC4gVXNlDQo+PiAgQUNQSSBHRUQgdG8gYWxzbyBub3RpZnkgdGhlIGd1ZXN0IGtlcm5lbCBhYm91
dCBhbnkgQ1BVIGhvdCh1bilwbHVnIGV2ZW50cy4NCj4+ICANCj4+ICBBQ1BJIENQVSBob3RwbHVn
IHJlbGF0ZWQgaW5pdGlhbGl6YXRpb24gc2hvdWxkIG9ubHkgaGFwcGVuIGlmIEFDUElfQ1BVX0hP
VFBMVUcNCj4+ICBzdXBwb3J0IGhhcyBiZWVuIGVuYWJsZWQgZm9yIHBhcnRpY3VsYXIgYXJjaGl0
ZWN0dXJlLiBBZGQgY3B1X2hvdHBsdWdfaHdfaW5pdCgpDQo+PiAgc3R1YiB0byBhdm9pZCBjb21w
aWxhdGlvbiBicmVhay4NCj4+ICANCj4+ICBDby1kZXZlbG9wZWQtYnk6IEtlcWlhbiBaaHUgbWFp
bHRvOnpodWtlcWlhbjFAaHVhd2VpLmNvbQ0KPj4gIFNpZ25lZC1vZmYtYnk6IEtlcWlhbiBaaHUg
bWFpbHRvOnpodWtlcWlhbjFAaHVhd2VpLmNvbQ0KPj4gIFNpZ25lZC1vZmYtYnk6IFNhbGlsIE1l
aHRhIG1haWx0bzpzYWxpbC5tZWh0YUBodWF3ZWkuY29tDQo+PiAgUmV2aWV3ZWQtYnk6IEpvbmF0
aGFuIENhbWVyb24gbWFpbHRvOkpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbQ0KPj4gIFJldmll
d2VkLWJ5OiBHYXZpbiBTaGFuIG1haWx0bzpnc2hhbkByZWRoYXQuY29tDQo+PiAgUmV2aWV3ZWQt
Ynk6IERhdmlkIEhpbGRlbmJyYW5kIG1haWx0bzpkYXZpZEByZWRoYXQuY29tDQo+PiAgUmV2aWV3
ZWQtYnk6IFNoYW9xaW4gSHVhbmcgbWFpbHRvOnNoYWh1YW5nQHJlZGhhdC5jb20NCj4+ICBUZXN0
ZWQtYnk6IFZpc2hudSBQYWpqdXJpIG1haWx0bzp2aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNv
bQ0KPj4gIFRlc3RlZC1ieTogWGlhbmdsYWkgTGkgbWFpbHRvOmxpeGlhbmdsYWlAbG9vbmdzb24u
Y24NCj4+ICBUZXN0ZWQtYnk6IE1pZ3VlbCBMdWlzIG1haWx0bzptaWd1ZWwubHVpc0BvcmFjbGUu
Y29tDQo+PiAgLS0tDQo+PiAgIGh3L2FjcGkvYWNwaS1jcHUtaG90cGx1Zy1zdHViLmM+ICAgIHwg
IDYgKysrKysrDQo+PiAgIGh3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuYz4gICAgIHwgMTcg
KysrKysrKysrKysrKysrKysNCj4+ICAgaW5jbHVkZS9ody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2
aWNlLmggfCAgNCArKysrDQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQ0K
Pj4gIA0KPj4gIGRpZmYgLS1naXQgYS9ody9hY3BpL2FjcGktY3B1LWhvdHBsdWctc3R1Yi5jIGIv
aHcvYWNwaS9hY3BpLWNwdS1ob3RwbHVnLXN0dWIuYw0KPj4gIGluZGV4IDNmYzRiMTRjMjYuLmM2
YzYxYmI5Y2QgMTAwNjQ0DQo+PiAgLS0tIGEvaHcvYWNwaS9hY3BpLWNwdS1ob3RwbHVnLXN0dWIu
Yw0KPj4gICsrKyBiL2h3L2FjcGkvYWNwaS1jcHUtaG90cGx1Zy1zdHViLmMNCj4+ICBAQCAtMTks
NiArMTksMTIgQEAgdm9pZCBsZWdhY3lfYWNwaV9jcHVfaG90cGx1Z19pbml0KE1lbW9yeVJlZ2lv
biAqcGFyZW50LCBPYmplY3QgKm93bmVyLA0KPj4gICAgICAgcmV0dXJuOw0KPj4gICB9DQo+PiAg
IA0KPj4gICt2b2lkIGNwdV9ob3RwbHVnX2h3X2luaXQoTWVtb3J5UmVnaW9uICphcywgT2JqZWN0
ICpvd25lciwNCj4+ICArICAgICAgICAgQ1BVSG90cGx1Z1N0YXRlICpzdGF0ZSwgaHdhZGRyIGJh
c2VfYWRkcikNCj4+ICArew0KPj4gICsgICAgcmV0dXJuOw0KPj4gICt9DQo+PiAgKw0KPj4gICB2
b2lkIGFjcGlfY3B1X29zcG1fc3RhdHVzKENQVUhvdHBsdWdTdGF0ZSAqY3B1X3N0LCBBQ1BJT1NU
SW5mb0xpc3QgKioqbGlzdCkNCj4+ICAgew0KPj4gICAgICAgcmV0dXJuOw0KPj4gIGRpZmYgLS1n
aXQgYS9ody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmMgYi9ody9hY3BpL2dlbmVyaWNfZXZl
bnRfZGV2aWNlLmMNCj4+ICBpbmRleCAyZDZlOTFiMTI0Li4zNWE3MTUwNWE1IDEwMDY0NA0KPj4g
IC0tLSBhL2h3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuYw0KPj4gICsrKyBiL2h3L2FjcGkv
Z2VuZXJpY19ldmVudF9kZXZpY2UuYw0KPj4gIEBAIC0xMiw2ICsxMiw3IEBADQo+PiAgICNpbmNs
dWRlICJxZW11L29zZGVwLmgiDQo+PiAgICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiDQo+PiAgICNp
bmNsdWRlICJody9hY3BpL2FjcGkuaCINCj4+ICArI2luY2x1ZGUgImh3L2FjcGkvY3B1LmgiDQo+
PiAgICNpbmNsdWRlICJody9hY3BpL2dlbmVyaWNfZXZlbnRfZGV2aWNlLmgiDQo+PiAgICNpbmNs
dWRlICJody9pcnEuaCINCj4+ICAgI2luY2x1ZGUgImh3L21lbS9wYy1kaW1tLmgiDQo+PiAgQEAg
LTI1LDYgKzI2LDcgQEAgc3RhdGljIGNvbnN0IHVpbnQzMl90IGdlZF9zdXBwb3J0ZWRfZXZlbnRz
W10gPSB7DQo+PiAgICAgICBBQ1BJX0dFRF9NRU1fSE9UUExVR19FVlQsDQo+PiAgICAgICBBQ1BJ
X0dFRF9QV1JfRE9XTl9FVlQsDQo+PiAgICAgICBBQ1BJX0dFRF9OVkRJTU1fSE9UUExVR19FVlQs
DQo+PiAgKyAgICBBQ1BJX0dFRF9DUFVfSE9UUExVR19FVlQsDQo+PiAgIH07DQo+PiAgIA0KPj4g
ICAvKg0KPj4gIEBAIC0yMzQsNiArMjM2LDggQEAgc3RhdGljIHZvaWQgYWNwaV9nZWRfZGV2aWNl
X3BsdWdfY2IoSG90cGx1Z0hhbmRsZXIgKmhvdHBsdWdfZGV2LA0KPj4gICAgICAgfSBlbHNlIHsN
Cj4+ICAgICAgIGFjcGlfbWVtb3J5X3BsdWdfY2IoaG90cGx1Z19kZXYsICZzLT5tZW1ocF9zdGF0
ZSwgZGV2LCBlcnJwKTsNCj4+ICAgICAgIH0NCj4+ICArICAgIH0gZWxzZSBpZiAob2JqZWN0X2R5
bmFtaWNfY2FzdChPQkpFQ1QoZGV2KSwgVFlQRV9DUFUpKSB7DQo+PiAgKyAgICBhY3BpX2NwdV9w
bHVnX2NiKGhvdHBsdWdfZGV2LCAmcy0+Y3B1aHBfc3RhdGUsIGRldiwgZXJycCk7DQo+PiAgICAg
ICB9IGVsc2Ugew0KPj4gICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAidmlydDogZGV2aWNlIHBsdWcg
cmVxdWVzdCBmb3IgdW5zdXBwb3J0ZWQgZGV2aWNlIg0KPj4gICAgICAgICAgIiB0eXBlOiAlcyIs
IG9iamVjdF9nZXRfdHlwZW5hbWUoT0JKRUNUKGRldikpKTsNCj4+ICBAQCAtMjQ4LDYgKzI1Miw4
IEBAIHN0YXRpYyB2b2lkIGFjcGlfZ2VkX3VucGx1Z19yZXF1ZXN0X2NiKEhvdHBsdWdIYW5kbGVy
ICpob3RwbHVnX2RldiwNCj4+ICAgICAgIGlmICgob2JqZWN0X2R5bmFtaWNfY2FzdChPQkpFQ1Qo
ZGV2KSwgVFlQRV9QQ19ESU1NKSAmJg0KPj4gICAgICAgICAgIShvYmplY3RfZHluYW1pY19jYXN0
KE9CSkVDVChkZXYpLCBUWVBFX05WRElNTSkpKSkgew0KPj4gID4gICAgIGFjcGlfbWVtb3J5X3Vu
cGx1Z19yZXF1ZXN0X2NiKGhvdHBsdWdfZGV2LCAmcy0+bWVtaHBfc3RhdGUsIGRldiwgZXJycCk7
DQo+PiAgKyAgICB9IGVsc2UgaWYgKG9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldiksIFRZ
UEVfQ1BVKSkgew0KPj4gICsgICAgYWNwaV9jcHVfdW5wbHVnX3JlcXVlc3RfY2IoaG90cGx1Z19k
ZXYsICZzLT5jcHVocF9zdGF0ZSwgZGV2LCBlcnJwKTsNCj4+ICAgICAgIH0gZWxzZSB7DQo+PiAg
ICAgICBlcnJvcl9zZXRnKGVycnAsICJhY3BpOiBkZXZpY2UgdW5wbHVnIHJlcXVlc3QgZm9yIHVu
c3VwcG9ydGVkIGRldmljZSINCj4+ICAgICAgICAgICIgdHlwZTogJXMiLCBvYmplY3RfZ2V0X3R5
cGVuYW1lKE9CSkVDVChkZXYpKSk7DQo+PiAgQEAgLTI2MSw2ICsyNjcsOCBAQCBzdGF0aWMgdm9p
ZCBhY3BpX2dlZF91bnBsdWdfY2IoSG90cGx1Z0hhbmRsZXIgKmhvdHBsdWdfZGV2LA0KPj4gICAN
Cj4+ICAgICAgIGlmIChvYmplY3RfZHluYW1pY19jYXN0KE9CSkVDVChkZXYpLCBUWVBFX1BDX0RJ
TU0pKSB7DQo+PiAgICAgICBhY3BpX21lbW9yeV91bnBsdWdfY2IoJnMtPm1lbWhwX3N0YXRlLCBk
ZXYsIGVycnApOw0KPj4gICsgICAgfSBlbHNlIGlmIChvYmplY3RfZHluYW1pY19jYXN0KE9CSkVD
VChkZXYpLCBUWVBFX0NQVSkpIHsNCj4+ICArICAgIGFjcGlfY3B1X3VucGx1Z19jYigmcy0+Y3B1
aHBfc3RhdGUsIGRldiwgZXJycCk7DQo+PiAgICAgICB9IGVsc2Ugew0KPj4gICAgICAgZXJyb3Jf
c2V0ZyhlcnJwLCAiYWNwaTogZGV2aWNlIHVucGx1ZyBmb3IgdW5zdXBwb3J0ZWQgZGV2aWNlIg0K
Pj4gICAgICAgICAgIiB0eXBlOiAlcyIsIG9iamVjdF9nZXRfdHlwZW5hbWUoT0JKRUNUKGRldikp
KTsNCj4+ICBAQCAtMjcyLDYgKzI4MCw3IEBAIHN0YXRpYyB2b2lkIGFjcGlfZ2VkX29zcG1fc3Rh
dHVzKEFjcGlEZXZpY2VJZiAqYWRldiwgQUNQSU9TVEluZm9MaXN0ICoqKmxpc3QpDQo+PiAgICAg
ICBBY3BpR2VkU3RhdGUgKnMgPSBBQ1BJX0dFRChhZGV2KTsNCj4+ICAgDQo+PiAgICAgICBhY3Bp
X21lbW9yeV9vc3BtX3N0YXR1cygmcy0+bWVtaHBfc3RhdGUsIGxpc3QpOw0KPj4gICsgICAgYWNw
aV9jcHVfb3NwbV9zdGF0dXMoJnMtPmNwdWhwX3N0YXRlLCBsaXN0KTsNCj4+ICAgfQ0KPj4gICAN
Cj4+ICAgc3RhdGljIHZvaWQgYWNwaV9nZWRfc2VuZF9ldmVudChBY3BpRGV2aWNlSWYgKmFkZXYs
IEFjcGlFdmVudFN0YXR1c0JpdHMgZXYpDQo+PiAgQEAgLTI4Niw2ICsyOTUsOCBAQCBzdGF0aWMg
dm9pZCBhY3BpX2dlZF9zZW5kX2V2ZW50KEFjcGlEZXZpY2VJZiAqYWRldiwgQWNwaUV2ZW50U3Rh
dHVzQml0cyBldikNCj4+ICAgICAgIHNlbCA9IEFDUElfR0VEX1BXUl9ET1dOX0VWVDsNCj4+ICAg
ICAgIH0gZWxzZSBpZiAoZXYgJiBBQ1BJX05WRElNTV9IT1RQTFVHX1NUQVRVUykgew0KPj4gICAg
ICAgc2VsID0gQUNQSV9HRURfTlZESU1NX0hPVFBMVUdfRVZUOw0KPj4gICsgICAgfSBlbHNlIGlm
IChldiAmIEFDUElfQ1BVX0hPVFBMVUdfU1RBVFVTKSB7DQo+PiAgKyAgICBzZWwgPSBBQ1BJX0dF
RF9DUFVfSE9UUExVR19FVlQ7DQo+PiAgICAgICB9IGVsc2Ugew0KPj4gICAgICAgLyogVW5rbm93
biBldmVudC4gUmV0dXJuIHdpdGhvdXQgZ2VuZXJhdGluZyBpbnRlcnJ1cHQuICovDQo+PiAgICAg
ICB3YXJuX3JlcG9ydCgiR0VEOiBVbnN1cHBvcnRlZCBldmVudCAlZC4gTm8gaXJxIGluamVjdGVk
IiwgZXYpOw0KPj4gIEBAIC00MDAsNiArNDExLDEyIEBAIHN0YXRpYyB2b2lkIGFjcGlfZ2VkX2lu
aXRmbihPYmplY3QgKm9iaikNCj4+ICAgICAgIG1lbW9yeV9yZWdpb25faW5pdF9pbygmZ2VkX3N0
LT5yZWdzLCBvYmosICZnZWRfcmVnc19vcHMsIGdlZF9zdCwNCj4+ICAgICAgICAgICAgIFRZUEVf
QUNQSV9HRUQgIi1yZWdzIiwgQUNQSV9HRURfUkVHX0NPVU5UKTsNCj4+ICAgICAgIHN5c2J1c19p
bml0X21taW8oc2JkLCAmZ2VkX3N0LT5yZWdzKTsNCj4+ICArDQo+PiAgKyAgICBtZW1vcnlfcmVn
aW9uX2luaXQoJnMtPmNvbnRhaW5lcl9jcHVocCwgT0JKRUNUKGRldiksICJjcHVocCBjb250YWlu
ZXIiLA0KPj4gICsgICAgICAgICAgIEFDUElfQ1BVX0hPVFBMVUdfUkVHX0xFTik7DQo+PiAgKyAg
ICBzeXNidXNfaW5pdF9tbWlvKFNZU19CVVNfREVWSUNFKGRldiksICZzLT5jb250YWluZXJfY3B1
aHApOw0KPiAgc2FtZSBzYmQgY2FuIGJlIHVzZWQgaGVyZSBpbnN0ZWFkIG9mIFNZU19CVVNfREVW
SUNFKGRldikuDQoNCg0KICAgIFllcywgd2UgY2FuLg0KCQ0KDQo+PiAgKyAgICBjcHVfaG90cGx1
Z19od19pbml0KCZzLT5jb250YWluZXJfY3B1aHAsIE9CSkVDVChkZXYpLA0KPj4gICsgICAgICAg
ICZzLT5jcHVocF9zdGF0ZSwgMCk7DQo+PiAgIH0NCj4+ICAgDQo+PiAgIHN0YXRpYyB2b2lkIGFj
cGlfZ2VkX2NsYXNzX2luaXQoT2JqZWN0Q2xhc3MgKmNsYXNzLCB2b2lkICpkYXRhKQ0KPj4gIGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2h3L2FjcGkvZ2VuZXJpY19ldmVudF9kZXZpY2UuaCBiL2luY2x1
ZGUvaHcvYWNwaS9nZW5lcmljX2V2ZW50X2RldmljZS5oDQo+PiAgaW5kZXggYmE4NGNlMDIxNC4u
OTBmYzQxY2JiOCAxMDA2NDQNCj4+ICAtLS0gYS9pbmNsdWRlL2h3L2FjcGkvZ2VuZXJpY19ldmVu
dF9kZXZpY2UuaA0KPj4gICsrKyBiL2luY2x1ZGUvaHcvYWNwaS9nZW5lcmljX2V2ZW50X2Rldmlj
ZS5oDQo+PiAgQEAgLTYwLDYgKzYwLDcgQEANCj4+ICAgI2RlZmluZSBIV19BQ1BJX0dFTkVSSUNf
RVZFTlRfREVWSUNFX0gNCj4+ICAgDQo+PiAgICNpbmNsdWRlICJody9zeXNidXMuaCINCj4+ICAr
I2luY2x1ZGUgImh3L2FjcGkvY3B1X2hvdHBsdWcuaCINCj4+ICAgI2luY2x1ZGUgImh3L2FjcGkv
bWVtb3J5X2hvdHBsdWcuaCINCj4+ICAgI2luY2x1ZGUgImh3L2FjcGkvZ2hlcy5oIg0KPj4gICAj
aW5jbHVkZSAicW9tL29iamVjdC5oIg0KPj4gIEBAIC05NSw2ICs5Niw3IEBAIE9CSkVDVF9ERUNM
QVJFX1NJTVBMRV9UWVBFKEFjcGlHZWRTdGF0ZSwgQUNQSV9HRUQpDQo+PiAgICNkZWZpbmUgQUNQ
SV9HRURfTUVNX0hPVFBMVUdfRVZUICAgMHgxDQo+PiAgICNkZWZpbmUgQUNQSV9HRURfUFdSX0RP
V05fRVZUPiAgMHgyDQo+PiAgICNkZWZpbmUgQUNQSV9HRURfTlZESU1NX0hPVFBMVUdfRVZUIDB4
NA0KPj4gICsjZGVmaW5lIEFDUElfR0VEX0NQVV9IT1RQTFVHX0VWVCAgICAweDgNCj4+ICAgDQo+
PiAgIHR5cGVkZWYgc3RydWN0IEdFRFN0YXRlIHsNCj4+ICAgICAgIE1lbW9yeVJlZ2lvbiBldnQ7
DQo+PiAgQEAgLTEwNiw2ICsxMDgsOCBAQCBzdHJ1Y3QgQWNwaUdlZFN0YXRlIHsNCj4+ICAgICAg
IFN5c0J1c0RldmljZSBwYXJlbnRfb2JqOw0KPj4gICAgICAgTWVtSG90cGx1Z1N0YXRlIG1lbWhw
X3N0YXRlOw0KPj4gICAgICAgTWVtb3J5UmVnaW9uIGNvbnRhaW5lcl9tZW1ocDsNCj4+ICArICAg
IENQVUhvdHBsdWdTdGF0ZSBjcHVocF9zdGF0ZTsNCj4+ICArICAgIE1lbW9yeVJlZ2lvbiBjb250
YWluZXJfY3B1aHA7DQo+PiAgICAgICBHRURTdGF0ZSBnZWRfc3RhdGU7DQo+PiAgICAgICB1aW50
MzJfdCBnZWRfZXZlbnRfYml0bWFwOw0KPj4gICAgICAgcWVtdV9pcnEgaXJxOw0KPj4gIE90aGVy
d2lzZSwgTG9va3MgZ29vZCB0byBtZS4gIEZlZWwgZnJlZSB0byBhZGQNCj4+ICBSZXZpZXdlZC1i
eTogIlZpc2hudSBQYWpqdXJpIiBtYWlsdG86dmlzaG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb20N
Cg0KVGhhbmtzLg0KDQoNCj4+ICBSZWdhcmRzLA0KPj4gIC1WaXNobnUNCg0K
