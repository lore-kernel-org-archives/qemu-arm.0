Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3331047ejc;
        Fri, 29 Sep 2023 08:24:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBTU9VrBmu0rC05eiw/bdmiwOPGjT3lKOEBvZX9asqav0fjw9jT3QJ91+eL+J2Dp0di3kb
X-Received: by 2002:adf:e848:0:b0:31a:dbd1:bf6 with SMTP id d8-20020adfe848000000b0031adbd10bf6mr3855411wrn.68.1696001075014;
        Fri, 29 Sep 2023 08:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696001074; cv=none;
        d=google.com; s=arc-20160816;
        b=SKoOoFPd6Jqwo7l+M9xVJtaWt8oo1LXMKnDDFv3CnoIYXlvAUCFdn0s2Sq2rL1bbvI
         pJP/NJIKx21Fyz6hkOYfAlEo8JMNDjLsZZdgtAWeuq6vvYCNzhIde7OnedkztBnWmmYo
         kN5/OnPgfOH9K4RpOu043ZCVHTKTxLNLJwupMaiXozul4SavQMUe6drCPfcOeerXz4xv
         JM7gvfWvl11zHNwDhEDKtoySwZyWSFpcmYmadKXyUs23FOFd6uiBKIVLDbxSRP87gBXK
         gRIQRaeBhKcitnwkek+eUTcfEG5ajXWjeDvkoxHG0JdRCMoXwnCUGOzp3MaqLM42nsho
         NpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=VcwyDXMZc8FaU1oYEO/4rwxOFigsEaVAdQxrYetsACk=;
        fh=JAq87W6Xz6xK/ErqMBJV5GYr0T4cJ3zSiVlGsuDdrsk=;
        b=Har+qRPRNjMRZ7g2X1G2HN35iMxgkp2mKxB1UQiWQS5QClDUZn9aho//mlbArLfBU6
         VR4ZsMb0grfpVdpR0bs1Ay+xCE2HqwUA7V9d0XnID+czkoaPQXY/o5A9H38JAKQ9yDAX
         M1KK3UVUSk5dIduq5pAY7KeQ11DRmqKBxKufjwp35ZQPOXybFTCaGEfhThuYw1uCiST5
         Ai2yBSDsu2RHxzcZtPz4sNNmveduEhN6pAHqjZJ+v6wXMFqaGSo2GLDeH0BBbwtbToly
         Wz+CHT5xZRDcpp95a64Uo86qXvJiMg4DhDfoT429q9lyIb5jD+50E9BCX9DbpEq82S47
         LO3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id o3-20020a5d4083000000b003258934a26fsi825825wrp.321.2023.09.29.08.24.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 08:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100002.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RxvHd64lyz6K5wV;
	Fri, 29 Sep 2023 23:23:09 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100002.china.huawei.com (7.191.160.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 29 Sep 2023 16:24:33 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Fri, 29 Sep 2023 16:24:33 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
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
Subject: RE: [PATCH 2/9] hw/acpi: Move CPU ctrl-dev MMIO region len macro to
 common header file
Thread-Topic: [PATCH 2/9] hw/acpi: Move CPU ctrl-dev MMIO region len macro to
 common header file
Thread-Index: AQHZ8tLJJIl+B/+qMUmeGMQVzk0ZFLAxxP4AgAAnTzA=
Date: Fri, 29 Sep 2023 15:24:33 +0000
Message-ID: <e88bb1347b11400cb093f93553313c30@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
	<20230929124304.13672-3-salil.mehta@huawei.com> <8734yxoz4j.fsf@linaro.org>
In-Reply-To: <8734yxoz4j.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.156.153]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: +Hi3VMf9aCjz

PiBGcm9tOiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZy
aWRheSwgU2VwdGVtYmVyIDI5LCAyMDIzIDM6MDMgUE0NCj4gVG86IFNhbGlsIE1laHRhIDxzYWxp
bC5tZWh0YUBodWF3ZWkuY29tPg0KPiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWFy
bUBub25nbnUub3JnOyBtYXpAa2VybmVsLm9yZzsgamVhbi0NCj4gcGhpbGlwcGVAbGluYXJvLm9y
ZzsgSm9uYXRoYW4gQ2FtZXJvbiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsNCj4gbHBp
ZXJhbGlzaUBrZXJuZWwub3JnOyBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7DQo+IHJpY2hhcmQu
aGVuZGVyc29uQGxpbmFyby5vcmc7IGltYW1tZWRvQHJlZGhhdC5jb207IGFuZHJldy5qb25lc0Bs
aW51eC5kZXY7DQo+IGRhdmlkQHJlZGhhdC5jb207IHBoaWxtZEBsaW5hcm8ub3JnOyBlcmljLmF1
Z2VyQHJlZGhhdC5jb207DQo+IG9saXZlci51cHRvbkBsaW51eC5kZXY7IHBib256aW5pQHJlZGhh
dC5jb207IG1zdEByZWRoYXQuY29tOw0KPiB3aWxsQGtlcm5lbC5vcmc7IGdzaGFuQHJlZGhhdC5j
b207IHJhZmFlbEBrZXJuZWwub3JnOw0KPiBsaW51eEBhcm1saW51eC5vcmcudWs7IGRhcnJlbkBv
cy5hbXBlcmVjb21wdXRpbmcuY29tOw0KPiBpbGtrYUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyB2
aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsNCj4ga2FybC5oZXViYXVtQG9yYWNsZS5jb207
IG1pZ3VlbC5sdWlzQG9yYWNsZS5jb207IHNhbGlsLm1laHRhQG9wbnNyYy5uZXQ7DQo+IHpodWtl
cWlhbiA8emh1a2VxaWFuMUBodWF3ZWkuY29tPjsgd2FuZ3hpb25nZmVuZyAoQykNCj4gPHdhbmd4
aW9uZ2ZlbmcyQGh1YXdlaS5jb20+OyB3YW5neWFuYW4gKFkpIDx3YW5neWFuYW41NUBodWF3ZWku
Y29tPjsNCj4gamlha2VybmVsMkBnbWFpbC5jb207IG1hb2JpYm9AbG9vbmdzb24uY247IGxpeGlh
bmdsYWlAbG9vbmdzb24uY247IExpbnV4YXJtDQo+IDxsaW51eGFybUBodWF3ZWkuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIDIvOV0gaHcvYWNwaTogTW92ZSBDUFUgY3RybC1kZXYgTU1JTyBy
ZWdpb24gbGVuIG1hY3JvDQo+IHRvIGNvbW1vbiBoZWFkZXIgZmlsZQ0KPiANCj4gDQo+IFNhbGls
IE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPiB3cml0ZXM6DQo+IA0KPiA+IENQVSBjdHJs
LWRldiBNTUlPIHJlZ2lvbiBsZW5ndGggY291bGQgYmUgdXNlZCBpbiBBQ1BJIEdFRCBhbmQgdmFy
aW91cw0KPiBvdGhlcg0KPiA+IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBwbGFjZXMuIE1vdmUgQUNQ
SV9DUFVfSE9UUExVR19SRUdfTEVOIG1hY3JvIHRvIG1vcmUNCj4gPiBhcHByb3ByaWF0ZSBjb21t
b24gaGVhZGVyIGZpbGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWxpbCBNZWh0YSA8c2Fs
aWwubWVodGFAaHVhd2VpLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFs
ZXguYmVubmVlQGxpbmFyby5vcmc+DQoNClRoYW5rcw0KU2FsaWwuDQoNCg==
