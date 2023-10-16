Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3059408ejc;
        Mon, 16 Oct 2023 02:52:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5o2A1p0HuEi3HKhOJFEugRdOAh8JM5xvcHfvonDKA6MBlKDo8cr5S8/VnANyEnU6P4L51
X-Received: by 2002:a05:600c:3657:b0:405:7400:1e3d with SMTP id y23-20020a05600c365700b0040574001e3dmr28947913wmq.32.1697449975176;
        Mon, 16 Oct 2023 02:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697449975; cv=none;
        d=google.com; s=arc-20160816;
        b=Jb/k1atTKVlAVEkmCyp5CqOmluNLNRkud44bMyYRPV1O+8EQu1kqnadKX1HELze9jI
         360YPU7WCJvQXhoVAh4W0LfwRQAvMdVLA24NEd2TYzohyXpi+QATKFwk6Km5j71XP+99
         WEFzJQIfhOIl784P8408G/WtItIm7Rv4pY7WBq2qcyreJyX/2hQ4VuJpQQlgxbkmxdDe
         lQRNvk4iB4vF4btX9uANuvsb5w6h0g+okx2XTp4tIg54FSSkNLSzwPQ332pkQnVCDl1+
         3TMVFKzXv3o4P/lTGtAJXXpx4SDgB0Zzkivu84r172evY0ci+JK03VOKEauq43EA78MW
         5zpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=nc9h+KW1iWdC7jN6u3zUlY9UOeKqrfTjKy0wVPGZXJQ=;
        fh=WFKiYQ0ahdra82bC/XG1W++R922uaSCu9viexCDasTE=;
        b=g0CTaue/SxKO8mHY6HTl5MUiZMuzr2gH2FG/S1PIh/yJiqtsK9w3yKzvNKSUQVjRak
         /roq/qJ446hIUokTz1gHtVIynyAqHVgb1pp4HjiypDvLLv3WwNbUdfVAwfj6F1JhrIGk
         YAxsJ6nFKdaduIuOPmHSpFHpa45xEiOol+pDcn1Rm/nWbLUUsolLEMjSnT+32lV5Xir/
         Zftz9pvcI/dz1AMH0OVznWxMRbPcHlwloMituSi/iQ8L07tRCToIp9kCsbXeUfPmohWJ
         1bLF+b0ww9mJdoJckMuVW/NlbYq9Ggam6O0M47t8E2Zv6MRHGPZpsK/dpqznvbcvzMrN
         FQaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id bi25-20020a05600c3d9900b00401b2d94ee3si2439350wmb.60.2023.10.16.02.52.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2023 02:52:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500004.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S8C4x4jVpz6J9yf;
	Mon, 16 Oct 2023 17:49:37 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 16 Oct 2023 10:52:53 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 16 Oct 2023 10:52:53 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Miguel Luis <miguel.luis@oracle.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, Marc Zyngier <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, "Richard
 Henderson" <richard.henderson@linaro.org>, "imammedo@redhat.com"
	<imammedo@redhat.com>, "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
	"david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
	<philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>, Karl Heubaum
	<karl.heubaum@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V6 0/9] Add architecture agnostic code to support vCPU
 Hotplug
Thread-Topic: [PATCH V6 0/9] Add architecture agnostic code to support vCPU
 Hotplug
Thread-Index: AQHZ/cNQxAxt9PC9FEqdNAxyY88QobBH2dQAgARWpIA=
Date: Mon, 16 Oct 2023 09:52:53 +0000
Message-ID: <187d0a24a81b4f1abbb23795325073ea@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
 <4764CF47-47CA-4685-805C-BBE6310BE164@oracle.com>
In-Reply-To: <4764CF47-47CA-4685-805C-BBE6310BE164@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.147.12]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 34tige55WSGA

SGkgTWlndWVsLA0KDQo+IEZyb206IE1pZ3VlbCBMdWlzIDxtaWd1ZWwubHVpc0BvcmFjbGUuY29t
Pg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMTMsIDIwMjMgNTozNCBQTQ0KPiBUbzogU2FsaWwg
TWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+IENjOiBxZW11LWRldmVsQG5vbmdudS5v
cmc7IHFlbXUtYXJtQG5vbmdudS5vcmc7IE1hcmMgWnluZ2llcg0KPiA8bWF6QGtlcm5lbC5vcmc+
OyBqZWFuLXBoaWxpcHBlQGxpbmFyby5vcmc7IEpvbmF0aGFuIENhbWVyb24NCj4gPGpvbmF0aGFu
LmNhbWVyb25AaHVhd2VpLmNvbT47IGxwaWVyYWxpc2lAa2VybmVsLm9yZzsgUGV0ZXIgTWF5ZGVs
bA0KPiA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgUmljaGFyZCBIZW5kZXJzb24NCj4gPHJp
Y2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+OyBpbWFtbWVkb0ByZWRoYXQuY29tOw0KPiBhbmRy
ZXcuam9uZXNAbGludXguZGV2OyBkYXZpZEByZWRoYXQuY29tOyBwaGlsbWRAbGluYXJvLm9yZzsN
Cj4gZXJpYy5hdWdlckByZWRoYXQuY29tOyBvbGl2ZXIudXB0b25AbGludXguZGV2OyBwYm9uemlu
aUByZWRoYXQuY29tOw0KPiBtc3RAcmVkaGF0LmNvbTsgd2lsbEBrZXJuZWwub3JnOyBnc2hhbkBy
ZWRoYXQuY29tOyByYWZhZWxAa2VybmVsLm9yZzsNCj4gYWxleC5iZW5uZWVAbGluYXJvLm9yZzsg
bGludXhAYXJtbGludXgub3JnLnVrOw0KPiBkYXJyZW5Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbTsg
aWxra2FAb3MuYW1wZXJlY29tcHV0aW5nLmNvbTsNCj4gdmlzaG51QG9zLmFtcGVyZWNvbXB1dGlu
Zy5jb207IEthcmwgSGV1YmF1bSA8a2FybC5oZXViYXVtQG9yYWNsZS5jb20+Ow0KPiBzYWxpbC5t
ZWh0YUBvcG5zcmMubmV0OyB6aHVrZXFpYW4gPHpodWtlcWlhbjFAaHVhd2VpLmNvbT47IHdhbmd4
aW9uZ2ZlbmcNCj4gKEMpIDx3YW5neGlvbmdmZW5nMkBodWF3ZWkuY29tPjsgd2FuZ3lhbmFuIChZ
KSA8d2FuZ3lhbmFuNTVAaHVhd2VpLmNvbT47DQo+IGppYWtlcm5lbDJAZ21haWwuY29tOyBtYW9i
aWJvQGxvb25nc29uLmNuOyBsaXhpYW5nbGFpQGxvb25nc29uLmNuOyBMaW51eGFybQ0KPiA8bGlu
dXhhcm1AaHVhd2VpLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWNiAwLzldIEFkZCBhcmNo
aXRlY3R1cmUgYWdub3N0aWMgY29kZSB0byBzdXBwb3J0IHZDUFUNCj4gSG90cGx1Zw0KPiANCj4g
SGkgU2FsaWwsDQo+IA0KPiA+IE9uIDEzIE9jdCAyMDIzLCBhdCAxMDo1MSwgU2FsaWwgTWVodGEg
PHNhbGlsLm1laHRhQGh1YXdlaS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gVmlydHVhbCBDUFUgaG90
cGx1ZyBzdXBwb3J0IGlzIGJlaW5nIGFkZGVkIGFjcm9zcyB2YXJpb3VzDQo+IGFyY2hpdGVjdHVy
ZXNbMV1bM10uDQo+ID4gVGhpcyBzZXJpZXMgYWRkcyB2YXJpb3VzIGNvZGUgYml0cyBjb21tb24g
YWNyb3NzIGFsbCBhcmNoaXRlY3R1cmVzOg0KDQoNClsuLi5dDQoNCg0KPiBJIHRlc3RlZCBpdCBm
b3IgQXJtNjQsIG1ha2UgY2hlY2ssIGJvb3QvcmVib290LCBsaXZlIG1pZ3JhdGlvbiBhbmQgZm91
bmQgbm8NCj4gaXNzdWVzLA0KPiBzbyBmb3IgdGhpcywgcGxlYXNlIGZlZWwgZnJlZSB0byBhZGQ6
DQo+IA0KPiBUZXN0ZWQtYnk6IE1pZ3VlbCBMdWlzIDxtaWd1ZWwubHVpc0BvcmFjbGUuY29tPg0K
DQpHcmVhdC4gTWFueSB0aGFua3MgZm9yIHRoZSBjb25maXJtYXRpb24uIA0KDQpJIGd1ZXNzIHlv
dSBhcmUgcmVwZWF0aW5nIHRoZSBzYW1lIGZvciB4ODYgYXMgd2VsbD8NCg0KU2FsaWwuDQo=
