Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3298825ejc;
        Mon, 16 Oct 2023 09:20:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsLvVMSXSpJh8yoWxOi0GkeuWtFm72rS+oCpZgemjHRkWjEFtcDj7OcdNgeEy0ghI8Tbid
X-Received: by 2002:a05:600c:c8b:b0:401:b2c7:34aa with SMTP id fj11-20020a05600c0c8b00b00401b2c734aamr29073733wmb.33.1697473244944;
        Mon, 16 Oct 2023 09:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697473244; cv=none;
        d=google.com; s=arc-20160816;
        b=gLYxf08yr82Vga7w1QpTEINTglaH0H1P/CP5fPCGuoxnzInDwyFNq5054X1rqHKlFd
         tFEz0/szFdphICdVwdniMvlhGzphvF8ju/6K26uTkC/vVMsaxmfeMNAituzL6yJNy+dy
         SVBcyMvA/J+2KpLN8x1k/NAUjpm7T1OR88EF4mGFXTeAOOlGinlgOlQ1zEDngD/1E4Su
         OSmke388Rh6hXOCO2t6hoGWcyLm8IZzXsRlhHS7oM2a5r7AxmPhxKqfbCiBif51ZV2el
         GZrOU9RdLuvTYsvJYRcJWF7QQJ/Bf2Q1Af0rD8Al86/8SpwG+8IahWOfhB5Wwabx5aAc
         a6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=+BAmBOQLevE+R9HLJdVd9x4ApW8N03MvcK7Xl/tI4tQ=;
        fh=hdkuu+IAzV9F5cEyPWpdhkV3n0hGx3syql0LHe616n0=;
        b=G7JBP7/3coA8nDzBGoc8VS4+aueXxczpQLZT6lQqtVPZquf5bepNMPKG2OYLJp4AH/
         4uXvytZnRZcMurVtjYOokzjRQ8qbVS9zbOkD2LJspW4hH1vfpmxgARCXIPcpazP14yYI
         NZuLlciGGWXHLCL2DZ99qhAVrIAq1VKxYsbSrfAjfQOqHgAH/M1Vb2AiFvXArsrDXd58
         J8pJ8rMK474LrKOjcHJ38Wih4sg0ABqXk6sAtGJ0lLXcHBNdL3Nr4sN1uZYlHv1kaHXV
         IhOdKSFv8IQWM2EJ4+r3Zfvci11ryK9ILakKNentMRurrNpDEFzcp8ZPCXjBalBQGdj7
         shWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d15-20020adffd8f000000b0032d9cf7ce73si3659265wrr.282.2023.10.16.09.20.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2023 09:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500002.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S8MhQ3s9sz6JB0J;
	Tue, 17 Oct 2023 00:17:26 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 16 Oct 2023 17:20:43 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 16 Oct 2023 17:20:43 +0100
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
Subject: RE: [PATCH RFC V2 09/37] hw/acpi: Move CPU ctrl-dev MMIO region len
 macro to common header file
Thread-Topic: [PATCH RFC V2 09/37] hw/acpi: Move CPU ctrl-dev MMIO region len
 macro to common header file
Thread-Index: AQHZ8GFeYHIJ1KE2a0qnn5kBHRkTcrAvUWyAgB1mplA=
Date: Mon, 16 Oct 2023 16:20:42 +0000
Message-ID: <49dbcbe515d740fbad2c5ae6cf0b1d00@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-10-salil.mehta@huawei.com>
 <a478929d-9b43-4e87-c16a-e33f82aa20da@redhat.com>
In-Reply-To: <a478929d-9b43-4e87-c16a-e33f82aa20da@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.147.12]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: YatA0I9zDvjL

PiBGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwg
U2VwdGVtYmVyIDI4LCAyMDIzIDE6MjAgQU0NCj4gVG86IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0
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
Z3Nvbi5jbg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJGQyBWMiAwOS8zN10gaHcvYWNwaTogTW92
ZSBDUFUgY3RybC1kZXYgTU1JTyByZWdpb24NCj4gbGVuIG1hY3JvIHRvIGNvbW1vbiBoZWFkZXIg
ZmlsZQ0KPiANCj4gT24gOS8yNi8yMyAyMDowNCwgU2FsaWwgTWVodGEgd3JvdGU6DQo+ID4gQ1BV
IGN0cmwtZGV2IE1NSU8gcmVnaW9uIGxlbmd0aCBjb3VsZCBiZSB1c2VkIGluIEFDUEkgR0VEIChj
b21tb24gQUNQSQ0KPiBjb2RlDQo+ID4gYWNyb3NzIGFyY2hpdGVjdHVyZXMpIGFuZCB2YXJpb3Vz
IG90aGVyIGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBwbGFjZXMuIFRvDQo+IG1ha2UNCj4gPiB0aGVz
ZSBjb2RlIHBsYWNlcyBpbmRlcGVuZGVudCBvZiBjb21waWxhdGlvbiBvcmRlciwNCj4gQUNQSV9D
UFVfSE9UUExVR19SRUdfTEVODQo+ID4gbWFjcm8gc2hvdWxkIGJlIG1vdmVkIHRvIGEgaGVhZGVy
IGZpbGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFA
aHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGh3L2FjcGkvY3B1LmMgICAgICAgICAgICAgICAg
IHwgMiArLQ0KPiA+ICAgaW5jbHVkZS9ody9hY3BpL2NwdV9ob3RwbHVnLmggfCAyICsrDQo+ID4g
ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+
IA0KPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCg0KQWxyZWFk
eSBkZWFsdC4gTm93LCBwYXJ0IG9mIGFyY2hpdGVjdHVyZSBhZ25vc3RpYyBwYXRjaC1zZXQsDQoN
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvNDc2NENGNDctNDdDQS00Njg1LTgw
NUMtQkJFNjMxMEJFMTY0QG9yYWNsZS5jb20vVC8jbTIzMzE2ODJlZDlhYTFiNzY0YTQyZWQ5ZmEx
Yjg1YTg0OWY4YWNkNzYNCg0KVGhhbmtzDQpTYWxpbC4NCg0K
