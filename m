Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1912435ejb;
        Tue, 3 Oct 2023 04:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt29RBVJEipUt5ONWwd8baJjxNIdk0i30GCtNYnHm+F9/JiAe0rI1udE6i+0jFChK5/8YS
X-Received: by 2002:a05:600c:1c81:b0:406:6964:7e99 with SMTP id k1-20020a05600c1c8100b0040669647e99mr6717723wms.15.1696334068560;
        Tue, 03 Oct 2023 04:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696334068; cv=none;
        d=google.com; s=arc-20160816;
        b=lpp9+9wNJJVeK5rIwIWL+bWZsAVsP8A92wxtILedHi2ZOayBJs0yyee22eZ7u7ZiSb
         /Vq/aXy1m2Gq/DVg9WA3ob8eZOIGSh7dUI5Pv29X34IQb0wJQcglVEgMK09/9BxmfuPq
         ODUw7g3zWLvJAnhaBU2Z9rHGjKgrGylfr7WJC7ze+cFI6pjPmAW0J8wNBqCCwNmo4XtL
         Qsa6fhdInCHj7os0N0ttTaWHfBWYFCogWBf0I5MCYOseCFOHY4Kn0KmjQk8ZM4yCvV41
         L2eWM1OkkjsQ0IRJ/pesbfmVvb9ftjLf2+eRcv4a3mGMypvf8iF3LQP1zBrmM5NCW3KB
         FumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=w3pmIss2E8zBihSc4XNaNvYhJYxw3+hSFTb1HhsFCaQ=;
        fh=DCV4KZOcuvUG/wve9C1kSJ4RRlBk9KClkYRBzQw+8ow=;
        b=RcNwf9xm1z6CUbQske1uKRFrE86v3JQNo4+Vv7gL05/+9ts/SANkVmhhcWzqMcU7oQ
         DZGKhMAg56eyW6dGnd0Ah6uTOruYkVrYmbSjRpdC2Rluqkp1WRqUP6WNgzWVxAwExF3k
         pV7PR8rjlSWl3V1t04eV11BX39222xQvHBT0HeqRtAI+GkNeTMCBbhXRYfVjBwU1mPhP
         rDgEtDzqZjmmuVv1qLo6LZJcc/V4vubOEMN5LPpxr3lJfN2gxAvmQ0mbKO8cXLYbMt+p
         qSpGwCznJDeWBJEEX74grIJxeoL8l62jQT+A6cq0Lup03GhEm5duDa6E4+AL9OeUq3Gj
         xAEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id i8-20020a05600c354800b003fefd987d93si696904wmq.125.2023.10.03.04.54.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500006.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0GSn5wnQz6K7Xr;
	Tue,  3 Oct 2023 19:54:17 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:54:26 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:54:26 +0100
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
Subject: RE: [PATCH V2 08/10] physmem: Add helper function to destroy CPU
 AddressSpace
Thread-Topic: [PATCH V2 08/10] physmem: Add helper function to destroy CPU
 AddressSpace
Thread-Index: AQHZ8zQ7yGl3U6l090SRw8cLGCyLZ7A3POkAgAC7TKA=
Date: Tue, 3 Oct 2023 11:54:26 +0000
Message-ID: <25f9cedfb0444e92922de609b5e1028a@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-9-salil.mehta@huawei.com>
 <bc5e5558-8899-30d1-e64a-c1012437766e@redhat.com>
In-Reply-To: <bc5e5558-8899-30d1-e64a-c1012437766e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 79+TPNa7/iHw

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogVHVlc2RheSwgT2N0b2JlciAzLCAyMDIzIDI6MzcgQU0NCj4gVG86IFNhbGlsIE1laHRhIDxz
YWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LQ0KPiBh
cm1Abm9uZ251Lm9yZw0KPiBDYzogbWF6QGtlcm5lbC5vcmc7IGplYW4tcGhpbGlwcGVAbGluYXJv
Lm9yZzsgSm9uYXRoYW4gQ2FtZXJvbg0KPiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsg
bHBpZXJhbGlzaUBrZXJuZWwub3JnOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHJpY2hh
cmQuaGVuZGVyc29uQGxpbmFyby5vcmc7DQo+IGltYW1tZWRvQHJlZGhhdC5jb207IGFuZHJldy5q
b25lc0BsaW51eC5kZXY7IGRhdmlkQHJlZGhhdC5jb207DQo+IHBoaWxtZEBsaW5hcm8ub3JnOyBl
cmljLmF1Z2VyQHJlZGhhdC5jb207IG9saXZlci51cHRvbkBsaW51eC5kZXY7DQo+IHBib256aW5p
QHJlZGhhdC5jb207IG1zdEByZWRoYXQuY29tOyB3aWxsQGtlcm5lbC5vcmc7IHJhZmFlbEBrZXJu
ZWwub3JnOw0KPiBhbGV4LmJlbm5lZUBsaW5hcm8ub3JnOyBsaW51eEBhcm1saW51eC5vcmcudWs7
DQo+IGRhcnJlbkBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBpbGtrYUBvcy5hbXBlcmVjb21wdXRp
bmcuY29tOw0KPiB2aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsga2FybC5oZXViYXVtQG9y
YWNsZS5jb207DQo+IG1pZ3VlbC5sdWlzQG9yYWNsZS5jb207IHNhbGlsLm1laHRhQG9wbnNyYy5u
ZXQ7IHpodWtlcWlhbg0KPiA8emh1a2VxaWFuMUBodWF3ZWkuY29tPjsgd2FuZ3hpb25nZmVuZyAo
QykgPHdhbmd4aW9uZ2ZlbmcyQGh1YXdlaS5jb20+Ow0KPiB3YW5neWFuYW4gKFkpIDx3YW5neWFu
YW41NUBodWF3ZWkuY29tPjsgamlha2VybmVsMkBnbWFpbC5jb207DQo+IG1hb2JpYm9AbG9vbmdz
b24uY247IGxpeGlhbmdsYWlAbG9vbmdzb24uY247IExpbnV4YXJtIDxsaW51eGFybUBodWF3ZWku
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIFYyIDA4LzEwXSBwaHlzbWVtOiBBZGQgaGVscGVy
IGZ1bmN0aW9uIHRvIGRlc3Ryb3kgQ1BVDQo+IEFkZHJlc3NTcGFjZQ0KPiANCj4gT24gOS8zMC8y
MyAxMDoxOSwgU2FsaWwgTWVodGEgd3JvdGU6DQo+ID4gVmlydHVhbCBDUFUgSG90LXVucGx1ZyBs
ZWFkcyB0byB1bnJlYWxpemF0aW9uIG9mIGEgQ1BVIG9iamVjdC4gVGhpcyBhbHNvDQo+ID4gaW52
b2x2ZXMgZGVzdHJ1Y3Rpb24gb2YgdGhlIENQVSBBZGRyZXNzU3BhY2UuIEFkZCBjb21tb24gZnVu
Y3Rpb24gdG8gaGVscA0KPiA+IGRlc3Ryb3kgdGhlIENQVSBBZGRyZXNzU3BhY2UuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFAaHVhd2VpLmNvbT4NCj4g
PiAtLS0NCj4gPiAgIGluY2x1ZGUvZXhlYy9jcHUtY29tbW9uLmggfCAgOCArKysrKysrKw0KPiA+
ICAgaW5jbHVkZS9ody9jb3JlL2NwdS5oICAgICB8ICAxICsNCj4gPiAgIHNvZnRtbXUvcGh5c21l
bS5jICAgICAgICAgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAzIGZpbGVz
IGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2V4ZWMvY3B1LWNvbW1vbi5oIGIvaW5jbHVkZS9leGVjL2NwdS1jb21tb24uaA0KPiA+IGluZGV4
IDQxNzg4YzBiZGQuLmViNTZhMjI4YTIgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9leGVjL2Nw
dS1jb21tb24uaA0KPiA+ICsrKyBiL2luY2x1ZGUvZXhlYy9jcHUtY29tbW9uLmgNCj4gPiBAQCAt
MTIwLDYgKzEyMCwxNCBAQCBzaXplX3QgcWVtdV9yYW1fcGFnZXNpemVfbGFyZ2VzdCh2b2lkKTsN
Cj4gPiAgICAqLw0KPiA+ICAgdm9pZCBjcHVfYWRkcmVzc19zcGFjZV9pbml0KENQVVN0YXRlICpj
cHUsIGludCBhc2lkeCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBj
aGFyICpwcmVmaXgsIE1lbW9yeVJlZ2lvbiAqbXIpOw0KPiA+ICsvKioNCj4gPiArICogY3B1X2Fk
ZHJlc3Nfc3BhY2VfZGVzdHJveToNCj4gPiArICogQGNwdTogQ1BVIGZvciB3aGljaCBhZGRyZXNz
IHNwYWNlIG5lZWRzIHRvIGJlIGRlc3Ryb3llZA0KPiA+ICsgKiBAYXNpZHg6IGludGVnZXIgaW5k
ZXggb2YgdGhpcyBhZGRyZXNzIHNwYWNlDQo+ID4gKyAqDQo+ID4gKyAqIE5vdGUgdGhhdCB3aXRo
IEtWTSBvbmx5IG9uZSBhZGRyZXNzIHNwYWNlIGlzIHN1cHBvcnRlZC4NCj4gPiArICovDQo+ID4g
K3ZvaWQgY3B1X2FkZHJlc3Nfc3BhY2VfZGVzdHJveShDUFVTdGF0ZSAqY3B1LCBpbnQgYXNpZHgp
Ow0KPiA+DQo+ID4gICB2b2lkIGNwdV9waHlzaWNhbF9tZW1vcnlfcncoaHdhZGRyIGFkZHIsIHZv
aWQgKmJ1ZiwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBod2FkZHIgbGVuLCBi
b29sIGlzX3dyaXRlKTsNCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9jb3JlL2NwdS5oIGIv
aW5jbHVkZS9ody9jb3JlL2NwdS5oDQo+ID4gaW5kZXggNjQ4YjViMzU4Ni4uNjVkMmFlNDU4MSAx
MDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2h3L2NvcmUvY3B1LmgNCj4gPiArKysgYi9pbmNsdWRl
L2h3L2NvcmUvY3B1LmgNCj4gPiBAQCAtMzU1LDYgKzM1NSw3IEBAIHN0cnVjdCBDUFVTdGF0ZSB7
DQo+ID4gICAgICAgUVNJTVBMRVFfSEVBRCgsIHFlbXVfd29ya19pdGVtKSB3b3JrX2xpc3Q7DQo+
ID4NCj4gPiAgICAgICBDUFVBZGRyZXNzU3BhY2UgKmNwdV9hc2VzOw0KPiA+ICsgICAgaW50IGNw
dV9hc2VzX2NvdW50Ow0KPiA+ICAgICAgIGludCBudW1fYXNlczsNCj4gPiAgICAgICBBZGRyZXNz
U3BhY2UgKmFzOw0KPiA+ICAgICAgIE1lbW9yeVJlZ2lvbiAqbWVtb3J5Ow0KPiANCj4gQG51bV9h
c2VzIGFuZCBAY3B1X2FzZXNfY291bnQgYXJlIGR1cGxpY2F0ZSB0byBlYWNoIG90aGVyIHRvIHNv
bWUgZXh0ZW50Lg0KPiBUaGUgcmVhbCBwcm9ibGVtIGlzIEBjcHVfYXNlcyBpcyBhbGxvY2F0ZWQg
YXQgb25jZSBhbmQgd2UgbmVlZCB0byBtYWtlIHRoZQ0KPiBhbGxvY2F0aW9uIHNwYXJzZS4gSW4g
dGhhdCB3YXksIGVhY2ggQ1BVIGFkZHJlc3Mgc3BhY2UgaXMgaW5kZXBlbmRlbnQgYW5kIGNhbiBi
ZQ0KPiBkZXN0cm95ZWQgaW5kZXBlbmRlbnRseS4gVGhlIHNwYXJzZSBhbGxvY2F0aW9uIGZvciB0
aGUgQ1BVIGFkZHJlc3Mgc3BhY2UgY2FuIGJlIGRvbmUNCj4gaW4gY3B1X2FkZHJlc3Nfc3BhY2Vf
aW5pdCgpIGxpa2UgYmVsb3c6DQoNCg0KV2VsbCwgSSB0aGluayBQaGlsL1JpY2hhcmQgYXJlIHBv
aW50aW5nIHRvIHNvbWV0aGluZyBlbHNlIGhlcmUgaS5lLiBkZXN0cm95DQphdCBvbmNlLiANCg0K
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC81OTRiMjU1MC05YTczLTY4NGYtNmU1
NC0yOTQwMWRjNmNkN2FAbGluYXJvLm9yZy8NCg0KDQpJIHVzZWQgcmVmZXJlbmNlIGNvdW50ZXIg
YmVjYXVzZSBJIHdhcyBub3Qgc3VyZSBpZiBpdCBpcyBzYWZlIHRvDQphc3N1bWUgdGhhdCBBZGRy
ZXNzU3BhY2Ugd2lsbCBhbHdheXMgYmUgZGVzdHJveWVkIGF0IG9uY2UuDQoNCkJUVywgdGhlcmUg
aXMgbm8gZnVuY3Rpb25hbCBwcm9ibGVtIHdpdGggYWJvdmUgcGF0Y2guIEp1c3QgdGhhdCB3ZQ0K
ZG8gbm90IGhhdmUgdG8gbWFpbnRhaW4gdGhlIHJlZmVyZW5jZSBjb3VudGVyLg0KDQpZb3UgY2Fu
IHVzZSBiZWxvdyBjb21tYW5kIHRvIGNoZWNrIENQVSBtZW1vcnkgYWRkcmVzcyBzcGFjZXMgYXJl
IGdldHRpbmcNCmRlc3Ryb3llZCBwcm9wZXJseSBhbmQgZ2V0IHJlLWNyZWF0ZWQgYWdhaW4gd2l0
aCBDUFUgaG90KHVuKXBsdWc6DQoNClFlbXU+IGluZm8gbXRyZWUNCg0KDQpUaGFua3MNClNhbGls
Lg0KDQoNCg0K
