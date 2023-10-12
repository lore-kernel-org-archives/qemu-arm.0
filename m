Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp673529ejc;
        Thu, 12 Oct 2023 02:22:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFOT6P/axZSWSOMzYvwdMZctoAWI6fgw2DKUvs+V1QAIrQ1J3ORT+uO8yiPJOlVkfP0UzO
X-Received: by 2002:adf:e9d0:0:b0:313:e8b6:1699 with SMTP id l16-20020adfe9d0000000b00313e8b61699mr20409825wrn.55.1697102577108;
        Thu, 12 Oct 2023 02:22:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697102577; cv=none;
        d=google.com; s=arc-20160816;
        b=Qk9JMT3fkfifKY3iFUPwvGm8rJutXScTk69zbhic+ggSzv/Wbp4bTsQ5TGJeU3UVIT
         aZpXToDuR8xhUC4KiU0aEfvHLlj0fNWXx9TfRu9/OVLaQE2VB/lgldL2UQLTAiDBwlwh
         ZjUHu7WRzL8tRxyu12hnMqiWR/+B89bBdsf5bjncF1PJ9ksva/0Do8lw+PwPdVKrUnlc
         DGny1Ka3A5V8FcKfM+f+GgxgHxWuj3tjtT4VQyMQxbXPU0oJ22ITi+dIqm0KmDtS5NZy
         my/+QumC73JHUwLXRE4zlvDWr8Y055LXEoQuzhbNZpe2G+uM19dOb+F2RPdRvkmok/Ja
         EgtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=QKRYlJrhw8iekdWI9lVQpJJ5VEtwYxStEwrWhfWnYAo=;
        fh=rhXBpbHgb7sNZuZpjeexfaR9VHJMNYmK/GML+KG0Wzo=;
        b=Bb/ZEDH+EhO96BE0pBIi+d8PUvqxiMcLYYOc+ZpriJcYcPbzN6+HLBFrO67W/ooIQV
         Ok9Z1yW4U6OCQq5uDbvmQStlK1ADDTN3YrMFlXe4FtT4UR00fmB8vngdqwK1Sn9kS4oH
         PBcd9gMjlQmu21woWyGKDiGEhlB1/pbVspo+buMUSmDEPyzlOqMhHIjXwfIrtUVAm4Jp
         kV8zCgf/rJLnoI+o21UsMZGK5T7zaG2GExDQqBD53Q8CZBftpn3IuboBCFgT16YXmSVH
         UiTm4nOwlyE6IRaUtyGVgsBC67D7V6lF5DP+Ah/hIykvymxaWOc8mDH6aWbr4ViK6/e+
         SuAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d15-20020adfe84f000000b0032d648564adsi2564383wrn.1036.2023.10.12.02.22.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Oct 2023 02:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100006.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S5kcP4Ss0z688d6;
	Thu, 12 Oct 2023 17:19:49 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 10:22:54 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Thu, 12 Oct 2023 10:22:54 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Gavin Shan <gshan@redhat.com>, Salil Mehta <salil.mehta@opnsrc.net>,
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
	"rafael@kernel.org" <rafael@kernel.org>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng
 (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V5 8/9] physmem: Add helper function to destroy CPU
 AddressSpace
Thread-Topic: [PATCH V5 8/9] physmem: Add helper function to destroy CPU
 AddressSpace
Thread-Index: AQHZ/Hu2W97dHDuZJkS1Rvdlsfl3xbBFLG+AgAAJLgCAAAPWAIAAqJuQ
Date: Thu, 12 Oct 2023 09:22:54 +0000
Message-ID: <4ffab3f51cb4460bb36d4c923e3c3c9a@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
 <20231011194355.15628-9-salil.mehta@huawei.com>
 <69098d56-8b68-2734-ef40-7338386d7fa9@redhat.com>
 <e73217f7-e6c2-81e7-0174-54ef575ebbce@opnsrc.net>
 <b8c13adb-ce1e-41fc-daa0-4aa31bf5f7a0@redhat.com>
In-Reply-To: <b8c13adb-ce1e-41fc-daa0-4aa31bf5f7a0@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.35.158]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 6SmJaadMcrX+

PiBGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwg
T2N0b2JlciAxMiwgMjAyMyAxOjE4IEFNDQo+IFRvOiBTYWxpbCBNZWh0YSA8c2FsaWwubWVodGFA
b3Buc3JjLm5ldD47IFNhbGlsIE1laHRhDQo+IDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgcWVt
dS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFybUBub25nbnUub3JnDQo+IENjOiBtYXpAa2VybmVs
Lm9yZzsgamVhbi1waGlsaXBwZUBsaW5hcm8ub3JnOyBKb25hdGhhbiBDYW1lcm9uDQo+IDxqb25h
dGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBscGllcmFsaXNpQGtlcm5lbC5vcmc7DQo+IHBldGVy
Lm1heWRlbGxAbGluYXJvLm9yZzsgcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsNCj4gaW1h
bW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3LmpvbmVzQGxpbnV4LmRldjsgZGF2aWRAcmVkaGF0LmNv
bTsNCj4gcGhpbG1kQGxpbmFyby5vcmc7IGVyaWMuYXVnZXJAcmVkaGF0LmNvbTsgb2xpdmVyLnVw
dG9uQGxpbnV4LmRldjsNCj4gcGJvbnppbmlAcmVkaGF0LmNvbTsgbXN0QHJlZGhhdC5jb207IHdp
bGxAa2VybmVsLm9yZzsgcmFmYWVsQGtlcm5lbC5vcmc7DQo+IGFsZXguYmVubmVlQGxpbmFyby5v
cmc7IGxpbnV4QGFybWxpbnV4Lm9yZy51azsNCj4gZGFycmVuQG9zLmFtcGVyZWNvbXB1dGluZy5j
b207IGlsa2thQG9zLmFtcGVyZWNvbXB1dGluZy5jb207DQo+IHZpc2hudUBvcy5hbXBlcmVjb21w
dXRpbmcuY29tOyBrYXJsLmhldWJhdW1Ab3JhY2xlLmNvbTsNCj4gbWlndWVsLmx1aXNAb3JhY2xl
LmNvbTsgemh1a2VxaWFuIDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5nDQo+
IChDKSA8d2FuZ3hpb25nZmVuZzJAaHVhd2VpLmNvbT47IHdhbmd5YW5hbiAoWSkgPHdhbmd5YW5h
bjU1QGh1YXdlaS5jb20+Ow0KPiBqaWFrZXJuZWwyQGdtYWlsLmNvbTsgbWFvYmlib0Bsb29uZ3Nv
bi5jbjsgbGl4aWFuZ2xhaUBsb29uZ3Nvbi5jbjsgTGludXhhcm0NCj4gPGxpbnV4YXJtQGh1YXdl
aS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjUgOC85XSBwaHlzbWVtOiBBZGQgaGVscGVy
IGZ1bmN0aW9uIHRvIGRlc3Ryb3kgQ1BVDQo+IEFkZHJlc3NTcGFjZQ0KPiANCj4gSGkgU2FsaWws
DQo+IA0KPiBPbiAxMC8xMi8yMyAxMDowNCwgU2FsaWwgTWVodGEgd3JvdGU6DQo+ID4gT24gMTIv
MTAvMjAyMyAwMDozMSwgR2F2aW4gU2hhbiB3cm90ZToNCj4gPj4gT24gMTAvMTIvMjMgMDU6NDMs
IFNhbGlsIE1laHRhIHdyb3RlOg0KPiANCj4gWy4uLl0NCj4gDQo+ID4+PiArdm9pZCBjcHVfYWRk
cmVzc19zcGFjZV9kZXN0cm95KENQVVN0YXRlICpjcHUsIGludCBhc2lkeCkNCj4gPj4+ICt7DQo+
ID4+PiArwqDCoMKgIENQVUFkZHJlc3NTcGFjZSAqY3B1YXM7DQo+ID4+PiArDQo+ID4+PiArwqDC
oMKgIGFzc2VydChhc2lkeCA8IGNwdS0+bnVtX2FzZXMpOw0KPiA+Pj4gK8KgwqDCoCBhc3NlcnQo
YXNpZHggPT0gMCB8fCAha3ZtX2VuYWJsZWQoKSk7DQo+ID4+PiArwqDCoMKgIGFzc2VydChjcHUt
PmNwdV9hc2VzKTsNCj4gPj4+ICsNCj4gPj4NCj4gPj4gVGhlIHR3byBhc3NlcnRzIG9uIEBhc2lk
eCBhbmQgQGNwdS0+Y3B1X2FzZXMgY2FuIGJlIGNvbWJpbmVkDQo+ID4+IHRvIG9uZSBzbyB0aGF0
IHRoZXNlIDMgYXNzZXJ0cyBjYW4gYmUgY29tYmluZWQgdG8gdHdvLg0KPiA+Pg0KPiA+PiDCoMKg
wqDCoMKgwqDCoCAvKiBPbmx5IG9uZSBhZGRyZXNzIHNwYWNlIGlzIHN1cHBvcnRlZCBieSBLVk0g
Ki8NCj4gPj4gwqDCoMKgwqDCoMKgwqAgYXNzZXJ0KGFzaWR4ID09IDAgfHwgIWt2bV9lbmFibGVk
KCkpOw0KPiA+PiDCoMKgwqDCoMKgwqDCoCBhc3NlcnQoYXNpZHggPj0gMCAmJiBhc2lkeCA8IGNw
dS0+Y3B1X2FzZXNfY291bnQpDQo+ID4NCj4gPiBXZSBjYW4gZG8gdGhhdC4NCj4gPg0KPiA+IEkg
YW0gbm90IGluIGZhdm9yIHRvIHJlbW92ZcKgICdhc3NlcnQoY3B1LT5jcHVfYXNlcyk7JyBhcyB0
aGlzIGNhbiBzYXZlDQo+IGxvdCBvZiBkZWJ1Z2dpbmcuDQo+ID4NCj4gDQo+IE9rLCBJdCdzIGZp
bmUgdG8ga2VlcCAnYXNzZXJ0KGNwdS0+Y3B1X2FzZXMpJywgYnV0ICdhc3NlcnQoYXNpZHggPj0g
MCknIGlzDQo+IHN0aWxsIG5lZWRlZD8gRm9yIGV4YW1wbGUsIHRoZSB3cm9uZyBjaHVuayBvZiBt
ZW1vcnkgd2lsbCBiZSByZWxlYXNlIHdoZW4NCj4gQGFzaWR4IGlzIHNtYWxsZXIgdGhhbiB6ZXJv
LCB3aGljaCBpcyBvdXQtb2YtYm91bmQgdG8gQGNwdS0+Y3B1X2FzZXNbXQ0KDQpZZXMsIG9mIGNv
dXJzZSwgd2UgY2FuIGtlZXAgdGhhdC4NCg0KVGhhbmtzDQpTYWxpbC4NCg0K
