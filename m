Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1900376ejb;
        Tue, 3 Oct 2023 04:30:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHz0i/z9boSOCxFLF0Q8rpaNPvTxzDVLi3D+YuC8+pfb65WsV004UdkFLrzzrfb/kYiLAQ
X-Received: by 2002:a05:600c:218f:b0:405:3a3d:6f42 with SMTP id e15-20020a05600c218f00b004053a3d6f42mr12559483wme.39.1696332606383;
        Tue, 03 Oct 2023 04:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696332606; cv=none;
        d=google.com; s=arc-20160816;
        b=0EUyzxqoPB4038QTzUsNkeqSqNMMoHE35lBRggZ55dAYPCG34hbt7UHgWrbT2XJCja
         Rl/mF+tqDotOXJpwpnJnxZIcOYMXGBWRWbMXWD2fsRJZoR+tdry2+9TBLsZMuma1I69c
         LxgfFd8mBvOaigTnaY0PIXBHauOOb5V+QG2hiKiAZ7WuI+Q/XO7iIC/hjgIXVMcBj3OY
         XLmTQ0HNFPWqIeXE0kXp7Qbz/xq+uJn8B/VuGT47jc5fvDvV4ZYfX3/i7drkIrIryzl2
         vYyC+T3AGE1ipDgeyvKFevYSE1HoJ8tSCZ8Ie8UfwO5nU/Ki92FmI6XauNI8YhEM6/RF
         c6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=Q2QmOzyTofJnR4ptS8JFgbg2YQ0MfgiUx6B70qBZxf4=;
        fh=DCV4KZOcuvUG/wve9C1kSJ4RRlBk9KClkYRBzQw+8ow=;
        b=jElJ4YwCqFt4W1m6aTc5gB3B8qPIcq7uHcitbD1oeCF8nDABRvfOg2VB8TZdHIG08G
         ovkBnfZ4f8i6Qu2tuNp52MrXsCyrXcsXAGk067LLnPrhxWEycstE1K46qDewNLVn1707
         hzADT0MkP/ELg4bV9t+E5G35JzAp3ifxPPwcpkeUCQBy69laWgwtBNyZQzH0OtjcNCZs
         /UJnxi38X/Tx3B2uAtiGOz3ZKYTd6uqWnYGtZCqxcveVmcHidjp9YU9hzcpfZ7kZkSqd
         J+FOC90G6ETGNIwDfnrYPPvlfSfBF4c9IAk95GIwxT8I13xfSzq2mAR+74tw/lfFT+HX
         ec3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id h5-20020adffa85000000b00317b03aef4asi666880wrr.467.2023.10.03.04.30.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 04:30:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500002.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0Fv11dDpz6K63Q;
	Tue,  3 Oct 2023 19:28:29 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 12:30:04 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 12:30:04 +0100
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
Subject: RE: [PATCH V2 04/10] hw/acpi: Init GED framework with cpu hotplug
 events
Thread-Topic: [PATCH V2 04/10] hw/acpi: Init GED framework with cpu hotplug
 events
Thread-Index: AQHZ8zQN9sMvHl8IPkGIhb6MBPCp2bA3GT4AgADaL0A=
Date: Tue, 3 Oct 2023 11:30:04 +0000
Message-ID: <07c35f510f1e484e9f600b4418cc49ee@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-5-salil.mehta@huawei.com>
 <2e4705a5-3c24-ae6a-e030-b3d5f4f2e37a@redhat.com>
In-Reply-To: <2e4705a5-3c24-ae6a-e030-b3d5f4f2e37a@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: uqXlI4joc5Ju

PiBGcm9tOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBP
Y3RvYmVyIDMsIDIwMjMgMTI6MjkgQU0NCj4gVG86IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBo
dWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LQ0KPiBhcm1Abm9uZ251Lm9y
Zw0KPiBDYzogbWF6QGtlcm5lbC5vcmc7IGplYW4tcGhpbGlwcGVAbGluYXJvLm9yZzsgSm9uYXRo
YW4gQ2FtZXJvbg0KPiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsgbHBpZXJhbGlzaUBr
ZXJuZWwub3JnOw0KPiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IHJpY2hhcmQuaGVuZGVyc29u
QGxpbmFyby5vcmc7DQo+IGltYW1tZWRvQHJlZGhhdC5jb207IGFuZHJldy5qb25lc0BsaW51eC5k
ZXY7IGRhdmlkQHJlZGhhdC5jb207DQo+IHBoaWxtZEBsaW5hcm8ub3JnOyBlcmljLmF1Z2VyQHJl
ZGhhdC5jb207IG9saXZlci51cHRvbkBsaW51eC5kZXY7DQo+IHBib256aW5pQHJlZGhhdC5jb207
IG1zdEByZWRoYXQuY29tOyB3aWxsQGtlcm5lbC5vcmc7IHJhZmFlbEBrZXJuZWwub3JnOw0KPiBh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnOyBsaW51eEBhcm1saW51eC5vcmcudWs7DQo+IGRhcnJlbkBv
cy5hbXBlcmVjb21wdXRpbmcuY29tOyBpbGtrYUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOw0KPiB2
aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsga2FybC5oZXViYXVtQG9yYWNsZS5jb207DQo+
IG1pZ3VlbC5sdWlzQG9yYWNsZS5jb207IHNhbGlsLm1laHRhQG9wbnNyYy5uZXQ7IHpodWtlcWlh
bg0KPiA8emh1a2VxaWFuMUBodWF3ZWkuY29tPjsgd2FuZ3hpb25nZmVuZyAoQykgPHdhbmd4aW9u
Z2ZlbmcyQGh1YXdlaS5jb20+Ow0KPiB3YW5neWFuYW4gKFkpIDx3YW5neWFuYW41NUBodWF3ZWku
Y29tPjsgamlha2VybmVsMkBnbWFpbC5jb207DQo+IG1hb2JpYm9AbG9vbmdzb24uY247IGxpeGlh
bmdsYWlAbG9vbmdzb24uY247IExpbnV4YXJtIDxsaW51eGFybUBodWF3ZWkuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIFYyIDA0LzEwXSBody9hY3BpOiBJbml0IEdFRCBmcmFtZXdvcmsgd2l0
aCBjcHUgaG90cGx1Zw0KPiBldmVudHMNCj4gDQo+IE9uIDkvMzAvMjMgMTA6MTksIFNhbGlsIE1l
aHRhIHdyb3RlOg0KPiA+IEFDUEkgR0VEKGFzIGRlc2NyaWJlZCBpbiB0aGUgQUNQSSA2LjIgc3Bl
YykgY2FuIGJlIHVzZWQgdG8gZ2VuZXJhdGUgQUNQSQ0KPiBldmVudHMNCj4gPiB3aGVuIE9TUE0v
Z3Vlc3QgcmVjZWl2ZXMgYW4gaW50ZXJydXB0IGxpc3RlZCBpbiB0aGUgX0NSUyBvYmplY3Qgb2Yg
R0VELg0KPiBPU1BNDQo+ID4gdGhlbiBtYXBzIG9yIGRlbXVsdGlwbGV4ZXMgdGhlIGV2ZW50IGJ5
IGV2YWx1YXRpbmcgX0VWVCBtZXRob2QuDQo+ID4NCj4gPiBUaGlzIGNoYW5nZSBhZGRzIHRoZSBz
dXBwb3J0IG9mIGNwdSBob3RwbHVnIGV2ZW50IGluaXRpYWxpemF0aW9uIGluIHRoZQ0KPiA+IGV4
aXN0aW5nIEdFRCBmcmFtZXdvcmsuDQo+ID4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IEtlcWlhbiBa
aHUgPHpodWtlcWlhbjFAaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLZXFpYW4gWmh1
IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FsaWwgTWVodGEg
PHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gICBody9hY3BpL2dlbmVyaWNf
ZXZlbnRfZGV2aWNlLmMgICAgICAgICB8IDggKysrKysrKysNCj4gPiAgIGluY2x1ZGUvaHcvYWNw
aS9nZW5lcmljX2V2ZW50X2RldmljZS5oIHwgNSArKysrKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspDQo+ID4NCj4gDQo+IFJldmlld2VkLWJ5OiBHYXZpbiBTaGFuIDxn
c2hhbkByZWRoYXQuY29tPg0KDQpUaGFua3MNClNhbGlsLg0KDQo=
