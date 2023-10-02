Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1220257ejb;
        Mon, 2 Oct 2023 03:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrg42oMlLA7aV9QG2MQzM0LKarGezCLTL+5HDp7440cAWS+DvLZWoB83LtEf6BrWG8PHox
X-Received: by 2002:adf:e54e:0:b0:31a:e744:1297 with SMTP id z14-20020adfe54e000000b0031ae7441297mr9695486wrm.50.1696242466208;
        Mon, 02 Oct 2023 03:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696242466; cv=none;
        d=google.com; s=arc-20160816;
        b=esdrUk6eikSo0WSAXxQ1eeWD7MxuGwDbhJ1O2jQyOVgcNu6yyzAnH96iHmy2HXuS2a
         QZRj7Le/+7mTvLusnhDeodotoyq1QTDjL4aoCYbkLb7DFIGDoDIgLJN3zltcGqJMyf6u
         lDAN5RsPHqQeC0SEBBH0UxG1eVR1gGE+awCC1SYNm1G3RXoURFCjAGKzZX0c2amj9LdA
         eVzSXw0ybdhME1NPOWr2ZhqY6WSvbrg0KP5xKzz3+Ow9a1Dsa9FJY0u9zY8LGQLJPaNf
         zETQ2mLBN57xib/jrM3OHuiuqeAFNp+jKxV9Wn7oO/UzSs7fOfJKGDOCgCakviqlw5D+
         H1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=nv8OXBUuFmIcT/BlO+/0UmenOIJj87/RVrKwSJoX4h0=;
        fh=hdkuu+IAzV9F5cEyPWpdhkV3n0hGx3syql0LHe616n0=;
        b=PBgXgb0CIYnVDHDNsC8EeXb0ozFphO+RiJ1JZFOpGMHFStHEs/Hq3+jzt+qG/Ww7pB
         cYygbCXTlWmSZhsDUDbH5LDkG9YOkjlKBTysqH3/WMv5O6/or25HPCLY4niFDqe6g4zw
         2nbtKgT5Vn76DcbW+vc68hDA99613sBnCcO5UgcnhUMEIpg2Oc/HhgXVj/zu8MME7xjR
         kX2W6M7ZKgsBAAxpXtXNJCFDJtKd1tAXAw/n8HXegFxycDgtooKIpD0pIH0/i4K60yun
         Ex1tObjIaAKVXh0tv0tDo2IKo9VKnJJRXvOeta9DqUkEqsFRD4khrryZ7FPAHZSU4G5w
         isWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id f7-20020adff587000000b003247a9a04b6si6158451wro.570.2023.10.02.03.27.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 03:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100003.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RzcbF2NH4z67kqq;
	Mon,  2 Oct 2023 18:27:37 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100003.china.huawei.com (7.191.160.210) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 2 Oct 2023 11:27:44 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 2 Oct 2023 11:27:44 +0100
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
Subject: RE: [PATCH RFC V2 04/37] arm/virt,target/arm: Machine init time
 change common to vCPU {cold|hot}-plug
Thread-Topic: [PATCH RFC V2 04/37] arm/virt,target/arm: Machine init time
 change common to vCPU {cold|hot}-plug
Thread-Index: AQHZ8GEl17RFLqukJ0mxgmcKIPSj3bAuJqCAgAguIcA=
Date: Mon, 2 Oct 2023 10:27:44 +0000
Message-ID: <aaed4b2e463840e9b41e07c27efedbcd@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-5-salil.mehta@huawei.com>
 <41003807-062f-1121-956e-72e0444e048f@redhat.com>
In-Reply-To: <41003807-062f-1121-956e-72e0444e048f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.33.168]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: prqJv8eZDccr

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjcsIDIwMjMgNzozMCBBTQ0KPiBUbzogU2FsaWwgTWVo
dGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUt
DQo+IGFybUBub25nbnUub3JnDQo+IENjOiBtYXpAa2VybmVsLm9yZzsgamVhbi1waGlsaXBwZUBs
aW5hcm8ub3JnOyBKb25hdGhhbiBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5j
b20+OyBscGllcmFsaXNpQGtlcm5lbC5vcmc7DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsg
cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgYW5k
cmV3LmpvbmVzQGxpbnV4LmRldjsgZGF2aWRAcmVkaGF0LmNvbTsNCj4gcGhpbG1kQGxpbmFyby5v
cmc7IGVyaWMuYXVnZXJAcmVkaGF0LmNvbTsgd2lsbEBrZXJuZWwub3JnOyBhcmRiQGtlcm5lbC5v
cmc7DQo+IG9saXZlci51cHRvbkBsaW51eC5kZXY7IHBib256aW5pQHJlZGhhdC5jb207IG1zdEBy
ZWRoYXQuY29tOw0KPiByYWZhZWxAa2VybmVsLm9yZzsgYm9ybnRyYWVnZXJAbGludXguaWJtLmNv
bTsgYWxleC5iZW5uZWVAbGluYXJvLm9yZzsNCj4gbGludXhAYXJtbGludXgub3JnLnVrOyBkYXJy
ZW5Ab3MuYW1wZXJlY29tcHV0aW5nLmNvbTsNCj4gaWxra2FAb3MuYW1wZXJlY29tcHV0aW5nLmNv
bTsgdmlzaG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb207DQo+IGthcmwuaGV1YmF1bUBvcmFjbGUu
Y29tOyBtaWd1ZWwubHVpc0BvcmFjbGUuY29tOyBzYWxpbC5tZWh0YUBvcG5zcmMubmV0Ow0KPiB6
aHVrZXFpYW4gPHpodWtlcWlhbjFAaHVhd2VpLmNvbT47IHdhbmd4aW9uZ2ZlbmcgKEMpDQo+IDx3
YW5neGlvbmdmZW5nMkBodWF3ZWkuY29tPjsgd2FuZ3lhbmFuIChZKSA8d2FuZ3lhbmFuNTVAaHVh
d2VpLmNvbT47DQo+IGppYWtlcm5lbDJAZ21haWwuY29tOyBtYW9iaWJvQGxvb25nc29uLmNuOyBs
aXhpYW5nbGFpQGxvb25nc29uLmNuDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggUkZDIFYyIDA0LzM3
XSBhcm0vdmlydCx0YXJnZXQvYXJtOiBNYWNoaW5lIGluaXQgdGltZQ0KPiBjaGFuZ2UgY29tbW9u
IHRvIHZDUFUge2NvbGR8aG90fS1wbHVnDQo+IA0KPiBPbiA5LzI2LzIzIDIwOjA0LCBTYWxpbCBN
ZWh0YSB3cm90ZToNCj4gPiBSZWZhY3RvciBhbmQgaW50cm9kdWNlIHRoZSBjb21tb24gbG9naWMg
cmVxdWlyZWQgZHVyaW5nIHRoZQ0KPiBpbml0aWFsaXphdGlvbiBvZg0KPiA+IGJvdGggY29sZCBh
bmQgaG90IHBsdWdnZWQgdkNQVXMuIEFsc28gaW5pdGlhbGl6ZSB0aGUgKmRpc2FibGVkKiBzdGF0
ZSBvZiB0aGUNCj4gPiB2Q1BVcyB3aGljaCBzaGFsbCBiZSB1c2VkIGZ1cnRoZXIgZHVyaW5nIGlu
aXQgcGhhc2VzIG9mIHZhcmlvdXMgb3RoZXIgY29tcG9uZW50cw0KPiA+IGxpa2UgR0lDLCBQTVUs
IEFDUEkgZXRjIGFzIHBhcnQgb2YgdGhlIHZpcnQgbWFjaGluZSBpbml0aWFsaXphdGlvbi4NCg0K
Wy4uLl0NCg0KPiA+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVo
dGFAaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYWxpbCBNZWh0YSA8c2FsaWwubWVo
dGFAaHVhd2VpLmNvbT4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IEtlcWlhbiBaaHUgPHpodWtlcWlh
bjFAaHVhd2VpLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLZXFpYW4gWmh1IDx6aHVrZXFpYW4x
QGh1YXdlaS5jb20+DQo+ID4gUmVwb3J0ZWQtYnk6IEdhdmluIFNoYW4gPGdhdmluLnNoYW5AcmVk
aGF0LmNvbT4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5e
Xl5eXg0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxnc2hhbkByZWRoYXQuY29t
Pg0KDQoNCkFoLiBHcm9zcy4gU29ycnkgYWJvdXQgdGhpcy4gV2lsbCBmaXguDQoNClRoYW5rcw0K
U2FsaWwuDQoNCj4gDQo+ID4gW0dTOiBwb2ludGVkIHRoZSBhc3NlcnRpb24gZHVlIHRvIHdyb25n
IHJhbmdlIGNoZWNrXQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0
YUBodWF3ZWkuY29tPg0KPiA+IC0tLQ0KPiA+ICAgaHcvYXJtL3ZpcnQuYyAgICAgIHwgMTQ5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiA+ICAgdGFyZ2V0
L2FybS9jcHUuYyAgIHwgICA3ICsrKw0KPiA+ICAgdGFyZ2V0L2FybS9jcHU2NC5jIHwgIDE0ICsr
KysrDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDE1NiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkNCj4gPg0KDQo=
