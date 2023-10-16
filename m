Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3067937ejc;
        Mon, 16 Oct 2023 03:09:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgsldoSkx+uhdlJjBMIryYtliJ+CuyfX4y5QuLc/psOqg/ChCU5KPVP5O/jGyRuhtpOzd8
X-Received: by 2002:a05:6a20:914e:b0:15d:42d5:6cb5 with SMTP id x14-20020a056a20914e00b0015d42d56cb5mr32716032pzc.28.1697450953994;
        Mon, 16 Oct 2023 03:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697450953; cv=none;
        d=google.com; s=arc-20160816;
        b=rkG/AUIYeBlC0YJfy2FMlYSXqTYzetx6lZSVmApmUGdd8fiviMOgdz0k506mbNdXlo
         kXPr02RVGSBQilpQHk/gonanbIrB3WK1qUc+FfLiuoGVP1uyqEsgz+unjwd5uXCTwaMc
         iAUdf6sT6JNKbYvqGKn+9/rDpcdG+MdLGLW/zqq5SRlAXjLDd106bQgjjQFmrq21d6bj
         8J+m5gtZ43BMLsWDaxE7AyhD+RJJDLDPv4TjCbYkb/tydtia5Cr6yVUqvshzI1WApRp1
         80KoFcz6Ks0rmP+GKrLJkIEnMmnEh33HfAo1ZdXpCaSTDibJtIOrELwdMVYLRqocgwwa
         w3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=O5QV4MbZRKuOccbK9kPN8JaifrETp+bJnjbnRFD6T6o=;
        fh=WFKiYQ0ahdra82bC/XG1W++R922uaSCu9viexCDasTE=;
        b=zyJ9g66COJ855gkn0QfhxC8DDbAnbNhQpFjoj02+k0jPdj7y9b5tqjYf23YrZGU3Ke
         K1XuGHsTowWKEWlfClO2gWejYgECnrWRKLWXBHyHxwrd3rTrVWdvJMuz2FxFTl/ZuhQc
         8lSQdya+fLgH/GP3K7JXFTpKAodgOKKXSdxVWXWuhCaZ1h66Q7ztYENaFZ7ewDH4bMII
         G/er8UeG+hfir3tMIGZe52pEdLcyMj+XsGaNxCkFlAYvTupNeKJtCwGNV5mMiiJq9FSC
         ZqpMnpQ4IXc1j0fKargp99DntQA0eYe/dNSSXOr8nCTc3rvaKPEeojcrV3BmJM7FJvem
         w4dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id pt11-20020a17090b3d0b00b0027740192bc9si5973076pjb.152.2023.10.16.03.09.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Oct 2023 03:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S8CVw3jyxz6K8tb;
	Mon, 16 Oct 2023 18:08:40 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100001.china.huawei.com (7.191.160.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 16 Oct 2023 11:09:08 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 16 Oct 2023 11:09:08 +0100
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
Thread-Index: AQHZ/cNQxAxt9PC9FEqdNAxyY88QobBH2dQAgARWpID///LWgIAAEfmw
Date: Mon, 16 Oct 2023 10:09:08 +0000
Message-ID: <5e838e6c4f454e08a0077c99262be846@huawei.com>
References: <20231013105129.25648-1-salil.mehta@huawei.com>
 <4764CF47-47CA-4685-805C-BBE6310BE164@oracle.com>
 <187d0a24a81b4f1abbb23795325073ea@huawei.com>
 <D78AD548-0934-48E3-957A-E5123D9E7F4C@oracle.com>
In-Reply-To: <D78AD548-0934-48E3-957A-E5123D9E7F4C@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.147.12]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: pYUEKhhHqxlA

PiBGcm9tOiBNaWd1ZWwgTHVpcyA8bWlndWVsLmx1aXNAb3JhY2xlLmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBPY3RvYmVyIDE2LCAyMDIzIDExOjAyIEFNDQo+IFRvOiBTYWxpbCBNZWh0YSA8c2FsaWwu
bWVodGFAaHVhd2VpLmNvbT4NCj4gDQo+IEhpIFNhbGlsLA0KPiANCj4gPiBPbiAxNiBPY3QgMjAy
MywgYXQgMDk6NTIsIFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPiB3cm90ZToN
Cj4gPg0KPiA+IEhpIE1pZ3VlbCwNCj4gPg0KPiA+PiBGcm9tOiBNaWd1ZWwgTHVpcyA8bWlndWVs
Lmx1aXNAb3JhY2xlLmNvbT4NCj4gPj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDEzLCAyMDIzIDU6
MzQgUE0NCj4gPj4gVG86IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPg0KDQpb
Li4uXQ0KDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjYgMC85XSBBZGQgYXJjaGl0ZWN0dXJl
IGFnbm9zdGljIGNvZGUgdG8gc3VwcG9ydCB2Q1BVDQo+ID4+IEhvdHBsdWcNCj4gPj4NCj4gPj4g
SGkgU2FsaWwsDQo+ID4+DQo+ID4+PiBPbiAxMyBPY3QgMjAyMywgYXQgMTA6NTEsIFNhbGlsIE1l
aHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPiB3cm90ZToNCj4gPj4+DQo+ID4+PiBWaXJ0dWFs
IENQVSBob3RwbHVnIHN1cHBvcnQgaXMgYmVpbmcgYWRkZWQgYWNyb3NzIHZhcmlvdXMNCj4gPj4g
YXJjaGl0ZWN0dXJlc1sxXVszXS4NCj4gPj4+IFRoaXMgc2VyaWVzIGFkZHMgdmFyaW91cyBjb2Rl
IGJpdHMgY29tbW9uIGFjcm9zcyBhbGwgYXJjaGl0ZWN0dXJlczoNCj4gPg0KPiA+IFsuLi5dDQo+
ID4NCj4gPj4gSSB0ZXN0ZWQgaXQgZm9yIEFybTY0LCBtYWtlIGNoZWNrLCBib290L3JlYm9vdCwg
bGl2ZSBtaWdyYXRpb24gYW5kIGZvdW5kIG5vDQo+ID4+IGlzc3VlcywNCj4gPj4gc28gZm9yIHRo
aXMsIHBsZWFzZSBmZWVsIGZyZWUgdG8gYWRkOg0KPiA+Pg0KPiA+PiBUZXN0ZWQtYnk6IE1pZ3Vl
bCBMdWlzIDxtaWd1ZWwubHVpc0BvcmFjbGUuY29tPg0KPiA+DQo+ID4gR3JlYXQuIE1hbnkgdGhh
bmtzIGZvciB0aGUgY29uZmlybWF0aW9uLg0KPiA+DQo+ID4gSSBndWVzcyB5b3UgYXJlIHJlcGVh
dGluZyB0aGUgc2FtZSBmb3IgeDg2IGFzIHdlbGw/DQo+ID4NCj4gDQo+IFlvdSBhcmUgd2VsY29t
ZSENCj4gDQo+IEFic29sdXRlbHksIEnigJltIHJlcGVhdGluZyB0aG9zZSBzYW1lIHRlc3RzIGZv
ciB4ODYuDQoNCkJyaWxsaWFudC4gVGhhbmtzIGZvciBwcm9hY3RpdmVseSB0YWtpbmcgdGhpcyB1
cC4NCg0KU2FsaWwuDQoNCg==
