Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1219140ejb;
        Mon, 2 Oct 2023 03:25:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiGbhrLiA76XvD9IJR8jzx9ojY4zfQGjZj7+ROUr4Cutu+mPZq1jB/jX6bhb4cbXKp84Sa
X-Received: by 2002:a7b:cb8d:0:b0:406:177e:5df7 with SMTP id m13-20020a7bcb8d000000b00406177e5df7mr10020698wmi.29.1696242300177;
        Mon, 02 Oct 2023 03:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696242300; cv=none;
        d=google.com; s=arc-20160816;
        b=HunRxXtRqsKZZIBNByIH4RLqwW8rE1AO5RKdKvtpF/YZxynaIMH5QmM2ZWFBfwJlKF
         cUR8ERWZY8FZEWP31RXS66BBHr/TR7vYY9zO9ry1BvfoI1CrGNRFz0MyoWf6Fw3mEEJc
         b499EnwMboZMZUkUgeXz6juH56uTn5ooRy8CzaFeFSD5noJQXhZ/jc3vvSjXNwGPllhY
         sxEqh+zxnM9LObtsDGOrAEwh/endaotW6+5dECSSAEphXvQ1Zp4Pd2MSL7oZ+prE5zx/
         31KoaggLSKMFwUkUVDE/8n2DHwqB0H8kWJzb2bwmRQ8Znl5VH5ihfdrkIukCaNSYNqMn
         j9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=n4Fb6HD580lFTxNZIsrK0MDOTi6HF7TfMg8IyO5vu5o=;
        fh=hdkuu+IAzV9F5cEyPWpdhkV3n0hGx3syql0LHe616n0=;
        b=M+inyJ/dGcBY+jZMEm0PElh9KRq3hcD/sz569cWCTYVOcuqv4qf8YPCRh9QsZQqpcz
         ED+XwYyklrc9Tpb0noI9sL8N2AQamVNrr2Fax1yA8nTLNS0PArbrmE4op2izgthz1kTX
         hjg7tf7IGhiZuhVnTWgGjhOK9Gjq3yS6/bz3COPaNuDDyxqDCagQ0obRhiBY1uArfYSw
         itne9wEnpdd0MpAmLzV79PQfoWfiRPOANJP0GgBZaFyX8UfWkjQDTAteQOc/KdGeauTi
         Td3FjLYGw2aTGD0IaIXwr9eU5fccxJId9c2gYyp12nC+vRu6yDNzxnuyM2mi+hnH9mDo
         rtHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id u15-20020a05600c4d0f00b00406446215desi3820918wmp.20.2023.10.02.03.25.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 03:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RzcT94TYCz6HJd7;
	Mon,  2 Oct 2023 18:22:21 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 2 Oct 2023 11:24:58 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 2 Oct 2023 11:24:58 +0100
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
Subject: RE: [PATCH RFC V2 03/37] hw/arm/virt: Move setting of common CPU
 properties in a function
Thread-Topic: [PATCH RFC V2 03/37] hw/arm/virt: Move setting of common CPU
 properties in a function
Thread-Index: AQHZ8GEaEyUsIrH+KUCDDRLt+0W0MrAuEgUAgAhCAZA=
Date: Mon, 2 Oct 2023 10:24:58 +0000
Message-ID: <fa8ec6306f124953b939c95a67de1d9a@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-4-salil.mehta@huawei.com>
 <c987543c-c05d-31cf-5cfa-e703d4b90d8f@redhat.com>
In-Reply-To: <c987543c-c05d-31cf-5cfa-e703d4b90d8f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.33.168]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 1He2Rxvy8SzF

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjcsIDIwMjMgNjoxNyBBTQ0KPiBUbzogU2FsaWwgTWVo
dGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUt
YXJtQG5vbmdudS5vcmcNCj4gQ2M6IG1hekBrZXJuZWwub3JnOyBqZWFuLXBoaWxpcHBlQGxpbmFy
by5vcmc7IEpvbmF0aGFuIENhbWVyb24NCj4gPGpvbmF0aGFuLmNhbWVyb25AaHVhd2VpLmNvbT47
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
bmdsYWlAbG9vbmdzb24uY24NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBSRkMgVjIgMDMvMzddIGh3
L2FybS92aXJ0OiBNb3ZlIHNldHRpbmcgb2YgY29tbW9uIENQVQ0KPiBwcm9wZXJ0aWVzIGluIGEg
ZnVuY3Rpb24NCj4gDQo+IEhpIFNhbGlsLA0KPiANCj4gT24gOS8yNi8yMyAyMDowNCwgU2FsaWwg
TWVodGEgd3JvdGU6DQo+ID4gRmFjdG9yIG91dCBDUFUgcHJvcGVydGllcyBjb2RlIGNvbW1vbiBm
b3Ige2hvdCxjb2xkfS1wbHVnZ2VkIENQVXMuIFRoaXMNCj4gYWxsb3dzDQo+ID4gY29kZSByZXVz
ZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3
ZWkuY29tPg0KPiA+IC0tLQ0KPiA+ICAgaHcvYXJtL3ZpcnQuYyAgICAgICAgIHwgMjIwICsrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAgaW5jbHVkZS9ody9h
cm0vdmlydC5oIHwgICA0ICsNCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQwIGluc2VydGlvbnMo
KyksIDg0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L2FybS92aXJ0LmMg
Yi9ody9hcm0vdmlydC5jDQo+ID4gaW5kZXggNTdmZTk3YzI0Mi4uMGViNmJmNWExOCAxMDA2NDQN
Cj4gPiAtLS0gYS9ody9hcm0vdmlydC5jDQo+ID4gKysrIGIvaHcvYXJtL3ZpcnQuYw0KPiA+IEBA
IC0yMDE4LDE2ICsyMDE4LDEzMCBAQCBzdGF0aWMgdm9pZCB2aXJ0X2NwdV9wb3N0X2luaXQoVmly
dE1hY2hpbmVTdGF0ZQ0KPiAqdm1zLCBNZW1vcnlSZWdpb24gKnN5c21lbSkNCj4gPiAgICAgICB9
DQo+ID4gICB9DQo+ID4NCg0KWy4uLl0NCg0KDQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAg
LyoNCj4gPiArICAgICAqIFJGQzogUXVlc3Rpb246IHRoaXMgbXVzdCBvbmx5IGJlIGNhbGxlZCBm
b3IgdGhlIGhvdHBsdWdnZWQgY3B1cy4gRm9yIHRoZQ0KPiA+ICsgICAgICogY29sZCBib290ZWQg
c2Vjb25kYXJ5IGNwdXMgdGhpcyBpcyBiZWluZyB0YWtlbiBjYXJlIGluIGFybV9sb2FkX2tlcm5l
bCgpDQo+ID4gKyAgICAgKiBpbiBib290LmMuIFBlcmhhcHMgd2Ugc2hvdWxkIHJlbW92ZSB0aGF0
IGNvZGUgbm93Pw0KPiA+ICsgICAgICovDQo+ID4gKyAgICBpZiAodm1zLT5wc2NpX2NvbmR1aXQg
IT0gUUVNVV9QU0NJX0NPTkRVSVRfRElTQUJMRUQpIHsNCj4gPiArICAgICAgICBvYmplY3RfcHJv
cGVydHlfc2V0X2ludChjcHVvYmosICJwc2NpLWNvbmR1aXQiLCB2bXMtPnBzY2lfY29uZHVpdCwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKTsNCj4gPiArDQo+ID4g
KyAgICAgICAgLyogU2Vjb25kYXJ5IENQVXMgc3RhcnQgaW4gUFNDSSBwb3dlcmVkLWRvd24gc3Rh
dGUgKi8NCj4gPiArICAgICAgICBpZiAoQ1BVKGNwdW9iaiktPmNwdV9pbmRleCA+IDApIHsNCj4g
PiArICAgICAgICAgICAgb2JqZWN0X3Byb3BlcnR5X3NldF9ib29sKGNwdW9iaiwgInN0YXJ0LXBv
d2VyZWQtb2ZmIiwgdHJ1ZSwgTlVMTCk7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsgICAgfQ0KPiA+
ICsNCj4gPiArb3V0Og0KPiA+ICsgICAgaWYgKGxvY2FsX2Vycikgew0KPiA+ICsgICAgICAgIGVy
cm9yX3Byb3BhZ2F0ZShlcnJwLCBsb2NhbF9lcnIpOw0KPiA+ICsgICAgfQ0KPiA+ICsgICAgcmV0
dXJuOw0KPiAgICAgICAgIF5eXl5eXg0KPiANCj4gSXQncyBub3QgbmVlZGVkIG9idmlvdXNseSA6
KQ0KDQoNClllcCwgd2lsbCByZW1vdmUgdGhhdC4NCg0KDQpUaGFua3MNClNhbGlsLg0KDQoNCg==
