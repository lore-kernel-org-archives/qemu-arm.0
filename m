Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3490359ejc;
        Mon, 16 Oct 2023 14:57:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsw5jNRBC6qCGQw4a7BdVXbi6z8tqQ26BvJfMYvQ/RemCurODcleoqSseViWn5CRO8MktC
X-Received: by 2002:a17:902:e841:b0:1c9:fdbf:296a with SMTP id t1-20020a170902e84100b001c9fdbf296amr603022plg.8.1697493450348;
        Mon, 16 Oct 2023 14:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697493450; cv=none;
        d=google.com; s=arc-20160816;
        b=f6cMJz5B6XdVJALaJRj285o0s4Fcyq8ZB8jre1tE5Kqhst3TAb9Mt8QzqlcueWKAJE
         nyUKzFJ504/ap7trZfqQyncnPmz/OmuxWCAi8JpLFxTMlzdVyQl0+or71dO6buUBLxMs
         rtNDBmoKnYz8NjSivcwEfPVt7DaRN1cuMnvhkz8BNryqax+BzQINg5bXmg44sLq/okSn
         WKOxK/NY49qdr1ZAtHGA1b3ZTAVb2lTlq4ApcKiwGifmygh9DeqcKSaHcoyr2nZAeVn7
         5ItTVXfmsmClrPbJ+GuvPF/JxxGfdcd4eH6RykG/Bo9tliNKygotOcaGh1r6yTNgjmtZ
         t2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=zJi5Ap62koTNzZaxrbcWf1AzejWT5d9JjKCh2Q8GImg=;
        fh=hdkuu+IAzV9F5cEyPWpdhkV3n0hGx3syql0LHe616n0=;
        b=G3AJk/8j8XuPsNY1tUeZ75Kmz45VvpFpJV8Uy4tOesQWu3NCDU16TqFIDuC0P4vbH/
         Do1EKAhQljkMNRvM2uy/UN7OyHARbmVvxe9m/uSKvHXs990WhKYJPPDMf3dmfuup4sH7
         +u/06USVyFoSuH9TZqG4jY0rwvMCHuSH5n3PJH+Ttu8cM7cIJ14/haWFmP4tdKztBMfQ
         MCFuBqsiJIrzjz28iua+8NSHMOlqPc2fM2Mr6n2gSh2R69su5jWbvtI84yCP6cVbLCTr
         SciriUJs0l6RTu646ElnuHoAiHX4B/KjIsIVKHVc+Q/xg/FZXiUFs6nL9tNtR3s68GN6
         N9xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id p2-20020a170902eac200b001b7d2b55d8asi204759pld.626.2023.10.16.14.57.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2023 14:57:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100004.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S8WB25PD2z6K5dS;
	Tue, 17 Oct 2023 05:55:06 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100004.china.huawei.com (7.191.162.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 16 Oct 2023 22:57:24 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 16 Oct 2023 22:57:24 +0100
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
Subject: RE: [PATCH RFC V2 16/37] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Thread-Topic: [PATCH RFC V2 16/37] hw/acpi: Update CPUs AML with cpu-(ctrl)dev
 change
Thread-Index: AQHZ8GGq8S4CfrEjAEuYiCf+HToRt7AvY/2AgB2yJoA=
Date: Mon, 16 Oct 2023 21:57:24 +0000
Message-ID: <283e5d2580814fbebeb33d66a1104cf5@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-17-salil.mehta@huawei.com>
 <26f2a18a-4315-443f-560a-c4f007434206@redhat.com>
In-Reply-To: <26f2a18a-4315-443f-560a-c4f007434206@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.158.41]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 37Q/qwyPaLLa

PiBGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwg
U2VwdGVtYmVyIDI4LCAyMDIzIDI6MjYgQU0NCj4gVG86IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0
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
Z3Nvbi5jbg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFJGQyBWMiAxNi8zN10gaHcvYWNwaTogVXBk
YXRlIENQVXMgQU1MIHdpdGggY3B1LQ0KPiAoY3RybClkZXYgY2hhbmdlDQo+IA0KPiBPbiA5LzI2
LzIzIDIwOjA0LCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gPiBDUFVzIENvbnRyb2wgZGV2aWNlKFxc
X1NCLlBDSTApIHJlZ2lzdGVyIGludGVyZmFjZSBmb3IgdGhlIHg4NiBhcmNoIGlzDQo+IGJhc2Vk
IG9uDQo+ID4gUENJIGFuZCBpcyBJTyBwb3J0IGJhc2VkIGFuZCBoZW5jZSBleGlzdGluZyBjcHVz
IEFNTCBjb2RlIGFzc3VtZXMgX0NSUyBvYmplY3RzDQo+IA0KPiBeXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4NCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLiBUaGUgZXhpc3RpbmcgQU1MIGNvZGUgYXNzdW1lcyBfQ1JTIG9iamVjdA0KPiA+
IHdvdWxkIGV2YWx1YXRlIHRvIGEgc3lzdGVtIHJlc291cmNlIHdoaWNoIGRlc2NyaWJlcyBJTyBQ
b3J0IGFkZHJlc3MuIEJ1dA0KPiBvbiBBUk0NCj4gICAgXl5eXl5eXl5eXl5eXl5eXl5eXg0KPiAg
ICBpcyBldmFsdWF0ZWQgdG8gYQ0KPiANCj4gPiBhcmNoIENQVXMgY29udHJvbCBkZXZpY2UoXFxf
U0IuUFJFUykgcmVnaXN0ZXIgaW50ZXJmYWNlIGlzIG1lbW9yeS1tYXBwZWQNCj4gaGVuY2UNCj4g
PiBfQ1JTIG9iamVjdCBzaG91bGQgZXZhbHVhdGUgdG8gc3lzdGVtIHJlc291cmNlIHdoaWNoIGRl
c2NyaWJlcyBtZW1vcnktbWFwcGVkDQo+ICAgICAgICAgICAgICAgIF5eXl5eXg0KPiAgICAgICAg
ICAgICAgICBzaG91bGQgYmUgZXZhbHVhdGVkDQo+ID4gYmFzZSBhZGRyZXNzLg0KPiA+DQo+ID4g
VGhpcyBjcHVzIEFNTCBjb2RlIGNoYW5nZSB1cGRhdGVzIHRoZSBleGlzdGluZyBpbmVyZmFjZSBv
ZiB0aGUgYnVpbGQgY3B1cyBBTUwNCj4gPiBmdW5jdGlvbiB0byBhY2NlcHQgYm90aCBJTy9NRU1P
UlkgdHlwZSByZWdpb25zIGFuZCB1cGRhdGUgdGhlIF9DUlMgb2JqZWN0DQo+ID4gY29ycmVzcG9u
ZGluZ2x5Lg0KPiA+DQo+ID4gTk9URTogQmVzaWRlIGFib3ZlIENQVSBzY2FuIHNoYWxsIGJlIHRy
aWdnZXJlZCB3aGVuIE9TUE0gZXZhbHVhdGVzIF9FVlQgbWV0aG9kDQo+ID4gICAgICAgIHBhcnQg
b2YgdGhlIEdFRCBmcmFtZXdvcmsgd2hpY2ggaXMgY292ZXJlZCBpbiBzdWJzZXF1ZW50IHBhdGNo
Lg0KPiA+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVh
d2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVh
d2VpLmNvbT4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IEtlcWlhbiBaaHUgPHpodWtlcWlhbjFAaHVh
d2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLZXFpYW4gWmh1IDx6aHVrZXFpYW4xQGh1YXdl
aS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1YXdl
aS5jb20+DQo+ID4gLS0tDQo+ID4gICBody9hY3BpL2NwdS5jICAgICAgICAgfCAyMyArKysrKysr
KysrKysrKysrLS0tLS0tLQ0KPiA+ICAgaHcvaTM4Ni9hY3BpLWJ1aWxkLmMgIHwgIDIgKy0NCj4g
PiAgIGluY2x1ZGUvaHcvYWNwaS9jcHUuaCB8ICA1ICsrKy0tDQo+ID4gICAzIGZpbGVzIGNoYW5n
ZWQsIDIwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiA+DQo+IA0KPiBJIGd1ZXNz
IHRoZSBjb21taXQgbG9nIGNhbiBiZSBzaW1wbGlmaWVkIHRvOg0KPiANCj4gVGhlIENQVSBob3Rw
bHVnIHJlZ2lzdGVyIGJsb2NrIGlzIGRlY2xhcmVkIGFzIGEgSU8gcmVnaW9uIG9uIHg4Niwgb3Ig
YSBtZW1vcnkNCj4gcmVnaW9uIG9uIGFybTY0IGluIGJ1aWxkX2NwdXNfYW1sKCksIGFzIHBhcnQg
b2YgdGhlIGdlbmVyaWMgY29udGFpbmVyIGRldmljZQ0KPiAoXFxfU0IuUENJMCBvciBcXF9TQi5Q
UkVTKS4NCj4gDQo+IEFkYXB0IGJ1aWxkX2NwdXNfYW1sKCkgc28gdGhhdCBJTyByZWdpb24gYW5k
IG1lbW9yeSByZWdpb24gY2FuIGJlIGhhbmRsZWQNCj4gaW4gdGhlIG1lYW4gd2hpbGUuDQo+IA0K
PiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCg0KSGFzIGJlZW4g
cmV2aWV3ZWQgYWxyZWFkeSBwYXJ0IG9mIGFyY2hpdGVjdHVyZSBhZ25vc3RpYyBwYXRjaC1zZXQs
DQoNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC80NzY0Q0Y0Ny00N0NBLTQ2
ODUtODA1Qy1CQkU2MzEwQkUxNjRAb3JhY2xlLmNvbS9ULyNtZDYxNWM2ZDM0NjRlNzE3ODIxNDc4
NTUwMWU3MDM1YmY5Nzc4ODZmMg0KDQoNClRoYW5rcw0KU2FsaWwuDQoNCg0K
