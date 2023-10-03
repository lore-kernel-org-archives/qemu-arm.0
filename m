Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1907290ejb;
        Tue, 3 Oct 2023 04:43:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVk+ymgd/uuuWZgjxXAApIpWBSIyE3us8zSo5QPYtinqbDCa5TXddeJICN3Yps2MLLk53v
X-Received: by 2002:a05:6000:1c7:b0:31f:f11b:8b68 with SMTP id t7-20020a05600001c700b0031ff11b8b68mr10963788wrx.71.1696333428059;
        Tue, 03 Oct 2023 04:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696333428; cv=none;
        d=google.com; s=arc-20160816;
        b=mqhGL23420/Wt9A81UXzWnmZJ8areFmavgxjecdsZD/l5Jhc/bZMPt9UoBMLMVroZU
         hDqqBLJJ00x93ydEWMTmxAfzvn60jtOCW39+xTVMDX+HLUZBtn18b9MSQBSavDyuUFy2
         guOo3eSVpXEdW9ph+YA6H+78TMpMWhBd9+TdK10ekwL14hTvaFRDOtzWCKbQRTW4rGvH
         jQvKSkDOOClnSwB3MVe27lWFuWdlzkRMKHX/1j3i4BWtHO9BOBWN2CgBNUwllA+5KfFG
         J1eiJ3bRMJUCNhNcP/XmXBOHFAVfQbz7/mZB1zEdQWNOzNUeEs//ITBSfJCdAIS5+Lcl
         Ddpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=vbsAD10xdHDeSnzNICu67D+48qmMW92W7+YswoQJWoY=;
        fh=DCV4KZOcuvUG/wve9C1kSJ4RRlBk9KClkYRBzQw+8ow=;
        b=lcoEgfOvPUD7R9iD5NiVIYvL7uy7iqx+7TUEVTDRAfJeqJhsxdkaCBeVh9J/klg+PI
         jYl7f1mnw3bxLyYyujyBkKpWVJxwtar+itfodZUhV7rrGed0sit8DYRp/IrpKkxM600f
         1NE8x0nOu7Xvljf4wLZB/X8FdU6Ru5Y7ZdpQZaf8qcryDS457By0OCrqvOVMpfhWnYlZ
         sMIFbyPHYx7RZC2azAHeJzQjQSJRffhVVB9UufbTTohNHVlUBxfpolK0N/OfQe9AM8L3
         Zc70U+YuWuP+pNFjavX3IAjZk+tA2NMBDe4Zbe2zjTELjsfDaH0ceoiXSZKm498qHN0q
         QvTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id o8-20020a5d4748000000b0032172b9eebcsi693606wrs.584.2023.10.03.04.43.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100003.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0GBq14Nzz6K5nM;
	Tue,  3 Oct 2023 19:42:11 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100003.china.huawei.com (7.191.160.210) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:43:46 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:43:46 +0100
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
Subject: RE: [PATCH V2 06/10] hw/acpi: Update GED _EVT method AML with cpu
 scan
Thread-Topic: [PATCH V2 06/10] hw/acpi: Update GED _EVT method AML with cpu
 scan
Thread-Index: AQHZ8zQk6MAP2ANe7ES6Fefhb3Wj6LA3JOcAgADSWNA=
Date: Tue, 3 Oct 2023 11:43:46 +0000
Message-ID: <efa6db58fc564941aeb827d9dc753a7f@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-7-salil.mehta@huawei.com>
 <810a4999-9954-55f0-9408-b86b36e9e18b@redhat.com>
In-Reply-To: <810a4999-9954-55f0-9408-b86b36e9e18b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: ilqjCANwxSfn

PiBGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBP
Y3RvYmVyIDMsIDIwMjMgMToxMSBBTQ0KPiBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1
YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtDQo+IGFybUBub25nbnUub3Jn
DQo+IENjOiBtYXpAa2VybmVsLm9yZzsgamVhbi1waGlsaXBwZUBsaW5hcm8ub3JnOyBKb25hdGhh
biBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBscGllcmFsaXNpQGtl
cm5lbC5vcmc7DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcmljaGFyZC5oZW5kZXJzb25A
bGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3LmpvbmVzQGxpbnV4LmRl
djsgZGF2aWRAcmVkaGF0LmNvbTsNCj4gcGhpbG1kQGxpbmFyby5vcmc7IGVyaWMuYXVnZXJAcmVk
aGF0LmNvbTsgb2xpdmVyLnVwdG9uQGxpbnV4LmRldjsNCj4gcGJvbnppbmlAcmVkaGF0LmNvbTsg
bXN0QHJlZGhhdC5jb207IHdpbGxAa2VybmVsLm9yZzsgcmFmYWVsQGtlcm5lbC5vcmc7DQo+IGFs
ZXguYmVubmVlQGxpbmFyby5vcmc7IGxpbnV4QGFybWxpbnV4Lm9yZy51azsNCj4gZGFycmVuQG9z
LmFtcGVyZWNvbXB1dGluZy5jb207IGlsa2thQG9zLmFtcGVyZWNvbXB1dGluZy5jb207DQo+IHZp
c2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBrYXJsLmhldWJhdW1Ab3JhY2xlLmNvbTsNCj4g
bWlndWVsLmx1aXNAb3JhY2xlLmNvbTsgc2FsaWwubWVodGFAb3Buc3JjLm5ldDsgemh1a2VxaWFu
DQo+IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5nIChDKSA8d2FuZ3hpb25n
ZmVuZzJAaHVhd2VpLmNvbT47DQo+IHdhbmd5YW5hbiAoWSkgPHdhbmd5YW5hbjU1QGh1YXdlaS5j
b20+OyBqaWFrZXJuZWwyQGdtYWlsLmNvbTsNCj4gbWFvYmlib0Bsb29uZ3Nvbi5jbjsgbGl4aWFu
Z2xhaUBsb29uZ3Nvbi5jbjsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggVjIgMDYvMTBdIGh3L2FjcGk6IFVwZGF0ZSBHRUQgX0VWVCBtZXRob2Qg
QU1MIHdpdGggY3B1DQo+IHNjYW4NCj4gDQo+IE9uIDkvMzAvMjMgMTA6MTksIFNhbGlsIE1laHRh
IHdyb3RlOg0KPiA+IE9TUE0gZXZhbHVhdGVzIF9FVlQgbWV0aG9kIHRvIG1hcCB0aGUgZXZlbnQu
IFRoZSBjcHUgaG90cGx1ZyBldmVudA0KPiBldmVudHVhbGx5DQo+ID4gcmVzdWx0cyBpbiBzdGFy
dCBvZiB0aGUgY3B1IHNjYW4uIFNjYW4gZmlndXJlcyBvdXQgdGhlIGNwdSBhbmQgdGhlIGtpbmQN
Cj4gb2YNCj4gPiBldmVudChwbHVnL3VucGx1ZykgYW5kIG5vdGlmaWVzIGl0IGJhY2sgdG8gdGhl
IGd1ZXN0Lg0KPiA+DQo+ID4gVGhlIGNoYW5nZSBpbiB0aGlzIHBhdGNoIHVwZGF0ZXMgdGhlIEdF
RCBBTUwgX0VWVCBtZXRob2Qgd2l0aCB0aGUgY2FsbCB0bw0KPiA+IFxcX1NCLkNQVVMuQ1NDTiB3
aGljaCB3aWxsIGRvIGFib3ZlLg0KPiA+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBLZXFpYW4gWmh1
IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogS2VxaWFuIFpodSA8
emh1a2VxaWFuMUBodWF3ZWkuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxz
YWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KPiA+IC0tLQ0KPiA+ICAgaHcvYWNwaS9nZW5lcmljX2V2
ZW50X2RldmljZS5jIHwgNCArKysrDQo+ID4gICBpbmNsdWRlL2h3L2FjcGkvY3B1X2hvdHBsdWcu
aCAgfCAyICsrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+
IA0KPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCg0KVGhhbmtz
DQpTYWxpbC4NCg0K
