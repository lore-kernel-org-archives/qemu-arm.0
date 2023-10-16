Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3474755ejc;
        Mon, 16 Oct 2023 14:24:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRYxSbNZ7u36FImYj1ONqBhMYZZEnNecURBy0wR11axsnTv67zlEU7Jx8F/8XyQ+vHxEYJ
X-Received: by 2002:a05:600c:190c:b0:402:98cd:a3e9 with SMTP id j12-20020a05600c190c00b0040298cda3e9mr263640wmq.32.1697491440838;
        Mon, 16 Oct 2023 14:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697491440; cv=none;
        d=google.com; s=arc-20160816;
        b=aNJdTInzxNYCyWS0ExLQGnGCkqLBosNywm9AHUynF9PuubwcnpPrp9VcNU5ISW6sFn
         i2sysg+1Ka6YxY9C+a0Df6FZ3Oyvf1UhrLZDptq+cIt40xBDZ+HKE2y9hJ39ms48QlLu
         i62U/xyOcFu8tGA8jOXI9TnhgP5J0EBHy778QfgZwEBomoAHFx5rIYzZtvubQzH1QIS/
         cGwpyZx1mqUXRUi3A9kcyUe5RciaFeTowm8lYxuKWt34befHIQ6y7uOWc1DNy9eFwBfh
         82GZc5pwI1wM8WzkDD+ljGgxfZ+NSkxxsjEJYu6PHVO5YNrp8myulL9mxGRFtlY6TifV
         5Dcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=p82ICpyxbvwl9OyPMlsOA9E/ubZ4EJsy8bcnBvNC1WY=;
        fh=hdkuu+IAzV9F5cEyPWpdhkV3n0hGx3syql0LHe616n0=;
        b=UERVsjnd7NgH6p0iXAmFACIdS2zV+bJJIuplNosnSU+NfnHklQKTCV8TNHI/pkTi7f
         OvKLDfTb2uZXSw7xecsI6HiatLnTEWT/YjOtgdvBhBxnrUaZub5Ihc/6JdI/rSN/cGHe
         7+7oIihUn9DEHOq9zpf7DcN8+mAtEVrqbVp8OpFKPjCdfLT9TT0eZaozlTPfxzNfA1rE
         iNbX5OkFhlbwl9yAFBKNkWqgBftY8+adNFNugOUBwkOoe9ZKeF4EBdKc0RCWxFpHYvs1
         /9xPTvlLTwneqFXgleqBf8pehCIvIwk13rcckXQeXpHTDBCJqgalRLXJqRzR7JOUNZHN
         IAoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id fm12-20020a05600c0c0c00b004073bf970f1si3076022wmb.146.2023.10.16.14.24.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2023 14:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S8VQK3vNkz67bMk;
	Tue, 17 Oct 2023 05:20:41 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100001.china.huawei.com (7.191.160.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 16 Oct 2023 22:23:58 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 16 Oct 2023 22:23:58 +0100
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
Subject: RE: [PATCH RFC V2 10/37] arm/acpi: Enable ACPI support for vcpu
 hotplug
Thread-Topic: [PATCH RFC V2 10/37] arm/acpi: Enable ACPI support for vcpu
 hotplug
Thread-Index: AQHZ8GFpc/syoMBAhEu6SV96HNthD7AvUxSAgB23LjA=
Date: Mon, 16 Oct 2023 21:23:58 +0000
Message-ID: <ddfe09973e71404098e3528d18da45ff@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-11-salil.mehta@huawei.com>
 <ce26889c-344a-b09c-a8b4-35904ffff771@redhat.com>
In-Reply-To: <ce26889c-344a-b09c-a8b4-35904ffff771@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.158.41]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: qrG/HoOqA8wh

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogVGh1cnNkYXksIFNlcHRlbWJlciAyOCwgMjAyMyAxOjI2IEFNDQo+IFRvOiBTYWxpbCBNZWh0
YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1h
cm1Abm9uZ251Lm9yZw0KPiBDYzogbWF6QGtlcm5lbC5vcmc7IGplYW4tcGhpbGlwcGVAbGluYXJv
Lm9yZzsgSm9uYXRoYW4gQ2FtZXJvbiANCj4gPGpvbmF0aGFuLmNhbWVyb25AaHVhd2VpLmNvbT47
IGxwaWVyYWxpc2lAa2VybmVsLm9yZzsNCj4gcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyByaWNo
YXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnOw0KPiBpbWFtbWVkb0ByZWRoYXQuY29tOyBhbmRyZXcu
am9uZXNAbGludXguZGV2OyBkYXZpZEByZWRoYXQuY29tOw0KPiBwaGlsbWRAbGluYXJvLm9yZzsg
ZXJpYy5hdWdlckByZWRoYXQuY29tOyB3aWxsQGtlcm5lbC5vcmc7IGFyZGJAa2VybmVsLm9yZzsN
Cj4gb2xpdmVyLnVwdG9uQGxpbnV4LmRldjsgcGJvbnppbmlAcmVkaGF0LmNvbTsgbXN0QHJlZGhh
dC5jb207DQo+IHJhZmFlbEBrZXJuZWwub3JnOyBib3JudHJhZWdlckBsaW51eC5pYm0uY29tOyBh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnOw0KPiBsaW51eEBhcm1saW51eC5vcmcudWs7IGRhcnJlbkBv
cy5hbXBlcmVjb21wdXRpbmcuY29tOw0KPiBpbGtrYUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyB2
aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsNCj4ga2FybC5oZXViYXVtQG9yYWNsZS5jb207
IG1pZ3VlbC5sdWlzQG9yYWNsZS5jb207IHNhbGlsLm1laHRhQG9wbnNyYy5uZXQ7DQo+IHpodWtl
cWlhbiA8emh1a2VxaWFuMUBodWF3ZWkuY29tPjsgd2FuZ3hpb25nZmVuZyAoQykNCj4gPHdhbmd4
aW9uZ2ZlbmcyQGh1YXdlaS5jb20+OyB3YW5neWFuYW4gKFkpIDx3YW5neWFuYW41NUBodWF3ZWku
Y29tPjsNCj4gamlha2VybmVsMkBnbWFpbC5jb207IG1hb2JpYm9AbG9vbmdzb24uY247IGxpeGlh
bmdsYWlAbG9vbmdzb24uY24NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBSRkMgVjIgMTAvMzddIGFy
bS9hY3BpOiBFbmFibGUgQUNQSSBzdXBwb3J0IGZvciB2Y3B1DQo+IGhvdHBsdWcNCj4gDQo+IEhp
IFNhbGlsLA0KPiANCj4gT24gOS8yNi8yMyAyMDowNCwgU2FsaWwgTWVodGEgd3JvdGU6DQo+ID4g
QUNQSSBpcyByZXF1aXJlZCB0byBpbnRlcmZhY2UgUUVNVSB3aXRoIHRoZSBndWVzdC4gUm91Z2hs
eSBmYWxscyBpbnRvIGJlbG93DQo+ID4gY2FzZXMsDQo+ID4NCj4gPiAxLiBDb252ZXkgdGhlIHBv
c3NpYmxlIHZjcHVzIGNvbmZpZyBhdCB0aGUgbWFjaGluZSBpbml0IHRpbWUgdG8gdGhlIGd1ZXN0
DQo+ID4gICAgIHVzaW5nIHZhcmlvdXMgRFNEVCB0YWJsZXMgbGlrZSBNQURUIGV0Yy4NCj4gPiAy
LiBDb252ZXkgdmNwdSBob3RwbHVnIGV2ZW50cyB0byBndWVzdCh1c2luZyBHRUQpDQo+ID4gMy4g
QXNzaXN0IGluIGV2YWx1YXRpb24gb2YgdmFyaW91cyBBQ1BJIG1ldGhvZHMobGlrZSBfRVZULCBf
U1RBLCBfT1NULCBfRUowLA0KPiA+ICAgICBfTUFUIGV0Yy4pDQo+ID4gNC4gUHJvdmlkZXMgQUNQ
SSBjcHUgaG90cGx1ZyBzdGF0ZSBhbmQgMTIgQnl0ZSBtZW1vcnkgbWFwcGVkIGNwdSBob3RwbHVn
DQo+ID4gICAgIGNvbnRyb2wgcmVnaXN0ZXIgaW50ZXJmYWNlIHRvIHRoZSBPU1BNL2d1ZXN0IGNv
cnJlc3BvbmRpbmcgdG8gZWFjaCBwb3NzaWJsZQ0KPiA+ICAgICB2Y3B1LiBUaGUgcmVnaXN0ZXIg
aW50ZXJmYWNlIGNvbnNpc3RzIG9mIHZhcmlvdXMgUi9XIGZpZWxkcyBhbmQgdGhlaXINCj4gPiAg
ICAgaGFuZGxpbmcgb3BlcmF0aW9ucy4gVGhlc2UgYXJlIGNhbGxlZCB3aGVuZXZlciByZWdpc3Rl
ciBmaWVsZHMgb3IgbWVtb3J5DQo+ID4gICAgIHJlZ2lvbnMgYXJlIGFjY2Vzc2VkKGkuZS4gcmVh
ZCBvciB3cml0dGVuKSBieSBPU1BNIHdoZW4gZXZlciBpdCBldmFsdWF0ZXMNCj4gPiAgICAgdmFy
aW91cyBBQ1BJIG1ldGhvZHMuDQo+ID4NCj4gPiBOb3RlOiBsb3Qgb2YgdGhpcyBmcmFtZXdvcmsg
Y29kZSBpcyBpbmhlcml0ZWQgZnJvbSB0aGUgY2hhbmdlcyBhbHJlYWR5IGRvbmUgZm9yDQo+ID4g
ICAgICAgIHg4NiBidXQgc3RpbGwgc29tZSBtaW5vciBjaGFuZ2VzIGFyZSByZXF1aXJlZCB0byBt
YWtlIGl0IGNvbXBhdGlibGUgd2l0aA0KPiA+ICAgICAgICBBUk02NC4pDQo+ID4NCj4gPiBUaGlz
IHBhdGNoIGVuYWJsZXMgdGhlIEFDUEkgc3VwcG9ydCBmb3IgdmlydHVhbCBjcHUgaG90cGx1Zy4g
QUNQSSBjaGFuZ2VzDQo+ID4gcmVxdWlyZWQgd2lsbCBmb2xsb3cgaW4gc3Vic2VxdWVudCBwYXRj
aGVzLg0KPiA+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFA
aHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFA
aHVhd2VpLmNvbT4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IEtlcWlhbiBaaHUgPHpodWtlcWlhbjFA
aHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLZXFpYW4gWmh1IDx6aHVrZXFpYW4xQGh1
YXdlaS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1
YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gICBody9hcm0vS2NvbmZpZyB8IDEgKw0KPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gDQo+IEkgYXNzdW1lIHRoaXMgcGF0
Y2ggbmVlZHMgdG8gYmUgbW92ZWQgYXJvdW5kIHRvIGxhc3Qgb25lLCB1bnRpbCB2Q1BVIGhvdHBs
dWcNCj4gaXMgc3VwcG9ydGVkIGluIHRoZSBjb2RlIGJhc2UuDQoNCkluIHRoYXQgY2FzZSBzdWJz
ZXF1ZW50IHBhdGNoZXMgd2lsbCBub3QgZ2V0IGNvbXBpbGVkIHRpbGwgdGhpcw0Kc3dpdGNoIGlz
IG5vdCBlbmFibGVkLiBnaXQtYmlzZWN0IHdvbnQgd29yayBjb3JyZWN0bHkgaW4gY2FzZSBvZg0K
Y29tcGlsYXRpb24gZmFpbHVyZSBpcyBvYnNlcnZlZCBpbiBwcmV2aW91cyBwYXRjaGVzIHdoZW4g
dGhpcw0Kc3dpdGNoIGdldHMgY29tcGlsZWQgZXZlbnR1YWxseS4NCg0KV2l0aCB0aGUgY3VycmVu
dCBvcmRlciBldmVyeSBzdWJzZXF1ZW50IHBhdGNoIGlzIGdldHRpbmcgY29tcGlsZWQuDQpBbmQg
aW4gZmFjdCBpbiB0aGlzIGNhc2UgeW91IGNhbiBldmVuIGJyaW5nIHVwIHRoZSBzeXN0ZW0uIExh
dGVyDQp3YXMgbm90IGEgcmVxdWlyZW1lbnQgdGhvdWdoLg0KDQpBbHNvLCB0aGlzIHBhdGNoIGNh
bm5vdCBiZSBiZXlvbmQgdGhlIHBhdGNoIHdoZXJlIGZ1bmN0aW9ucyBkZWZpbmVkDQppbiB0aGUg
cGF0Y2hlcyBzdWJzZXF1ZW50IHRvIHRoaXMgd2lsbCBnZXQgY2FsbGVkLiBGb3IgZXhhbXBsZSwN
CmJ1aWxkX2NwdXNfYW1sKCkgaS5lLiBbUGF0Y2ggUkZDIFYyIDE3LzM3XQ0KDQpUaGFua3MNClNh
bGlsLg0KDQo=
