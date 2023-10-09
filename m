Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1980839ejb;
        Mon, 9 Oct 2023 06:49:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOkI5+koth7wOAJZV38KtCIWsdjqUUpXgxxWCmANtCy14GgiAYVvs/bN4S31X9SzY/uisY
X-Received: by 2002:a5d:65c4:0:b0:321:4c58:7722 with SMTP id e4-20020a5d65c4000000b003214c587722mr13217779wrw.69.1696859374232;
        Mon, 09 Oct 2023 06:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696859374; cv=none;
        d=google.com; s=arc-20160816;
        b=J0QtEA++E56gyW6H3bBaxYeITT162JqCZ2+MltureTf0wfhQ7HBsxtnPlpp2scHst3
         YsM30lxx5MWcYrUWppR6oXB38Cage5BXZgPm64l6gKi8R5evKYCR2daW44uyuBGNyyaY
         07p/wtVLrsHPH8wP+vMbDMNnzjff/BefkmSZfopzijXWqU+EJCQ/vPTIbVv42fPQpJS+
         yl0Z3tlDtZ2bMFyWJNqdyU1e/yGgPIl2reMTC52PxiB7suAHro4d2W75WyoNS0fR3eZS
         wbeR/8MpCcmW1wo6WHG1hWszEBbkDJBkyxp4A62E/Xnfsw6UiQUiPabaZizyrnR22ciP
         CSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=u/BiKmLjgscJuB3h2JLrAhlXSTOk6XowEEGLCrcyxnE=;
        fh=Kb2Gcs7VD5wSTmDinyryIWwdRPJCIlRG79qMBRsDV+8=;
        b=S9FHEFR/AewjcOhPet33sBGL5eGQoFpscLp81R1Z/8E4qFME05KznifzQxyjDdTbx1
         bJH8wWYit4WMmJok4uC1AcwqReI7PHf2FrDjuphvV59CtTF1dXl+8v+y5wTNV0AYkdYK
         wrNbQK5E55Wh5mtWP6KFQ2YkxvBC4ApPrSFmIJsRIhY8ctTCcYiCOkmbqxrbCDYMKosr
         v1Na9baoCTUHXO9N6KBD4bbhyYotXdWEWFKjxrb9kenHgWDQ7ucmVqZQWYoF0csch8QN
         TvUr1KorQLL2e/FUBmgTBgqTUf4X+mcojoZGpneQo7zDIDKmPj7up+lwtKJjBEXZnsws
         HNNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id i11-20020a5d55cb000000b0031f91266e67si3569815wrw.309.2023.10.09.06.49.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 06:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500002.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S40hp1157z6K5xy;
	Mon,  9 Oct 2023 21:47:38 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 14:49:32 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 9 Oct 2023 14:49:32 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: David Hildenbrand <david@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
CC: "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "philmd@linaro.org"
	<philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
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
Subject: RE: [PATCH V3 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Thread-Topic: [PATCH V3 03/10] hw/acpi: Add ACPI CPU hotplug init stub
Thread-Index: AQHZ+qP+4EmuUazzyEe6jhCYlq8By7BBUIQAgAAoLOA=
Date: Mon, 9 Oct 2023 13:49:32 +0000
Message-ID: <08840ea0a68e46b1a9d98d1e3544f43b@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
 <20231009112812.10612-4-salil.mehta@huawei.com>
 <8a80612f-07d3-6302-31f9-232d9ce393a1@redhat.com>
In-Reply-To: <8a80612f-07d3-6302-31f9-232d9ce393a1@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.154.91]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: 0tMfeC9s/Q0p

PiBGcm9tOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBPY3RvYmVyIDksIDIwMjMgMToyMyBQTQ0KPiBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1l
aHRhQGh1YXdlaS5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHFlbXUtDQo+IGFybUBub25n
bnUub3JnDQo+IENjOiBtYXpAa2VybmVsLm9yZzsgamVhbi1waGlsaXBwZUBsaW5hcm8ub3JnOyBK
b25hdGhhbiBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBscGllcmFs
aXNpQGtlcm5lbC5vcmc7DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgcmljaGFyZC5oZW5k
ZXJzb25AbGluYXJvLm9yZzsNCj4gaW1hbW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3LmpvbmVzQGxp
bnV4LmRldjsgcGhpbG1kQGxpbmFyby5vcmc7DQo+IGVyaWMuYXVnZXJAcmVkaGF0LmNvbTsgb2xp
dmVyLnVwdG9uQGxpbnV4LmRldjsgcGJvbnppbmlAcmVkaGF0LmNvbTsNCj4gbXN0QHJlZGhhdC5j
b207IHdpbGxAa2VybmVsLm9yZzsgZ3NoYW5AcmVkaGF0LmNvbTsgcmFmYWVsQGtlcm5lbC5vcmc7
DQo+IGFsZXguYmVubmVlQGxpbmFyby5vcmc7IGxpbnV4QGFybWxpbnV4Lm9yZy51azsNCj4gZGFy
cmVuQG9zLmFtcGVyZWNvbXB1dGluZy5jb207IGlsa2thQG9zLmFtcGVyZWNvbXB1dGluZy5jb207
DQo+IHZpc2hudUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBrYXJsLmhldWJhdW1Ab3JhY2xlLmNv
bTsNCj4gbWlndWVsLmx1aXNAb3JhY2xlLmNvbTsgc2FsaWwubWVodGFAb3Buc3JjLm5ldDsgemh1
a2VxaWFuDQo+IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5nIChDKSA8d2Fu
Z3hpb25nZmVuZzJAaHVhd2VpLmNvbT47DQo+IHdhbmd5YW5hbiAoWSkgPHdhbmd5YW5hbjU1QGh1
YXdlaS5jb20+OyBqaWFrZXJuZWwyQGdtYWlsLmNvbTsNCj4gbWFvYmlib0Bsb29uZ3Nvbi5jbjsg
bGl4aWFuZ2xhaUBsb29uZ3Nvbi5jbjsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMDMvMTBdIGh3L2FjcGk6IEFkZCBBQ1BJIENQVSBob3Rw
bHVnIGluaXQgc3R1Yg0KPiANCj4gT24gMDkuMTAuMjMgMTM6MjgsIFNhbGlsIE1laHRhIHdyb3Rl
Og0KPiA+IEFDUEkgQ1BVIGhvdHBsdWcgcmVsYXRlZCBpbml0aWFsaXphdGlvbiBzaG91bGQgb25s
eSBoYXBwZW4gaWYNCj4gQUNQSV9DUFVfSE9UUExVRw0KPiA+IHN1cHBvcnQgaGFzIGJlZW4gZW5h
YmxlZCBmb3IgcGFydGljdWxhciBhcmNoaXRlY3R1cmUuIEFkZA0KPiBjcHVfaG90cGx1Z19od19p
bml0KCkNCj4gPiBzdHViIHRvIGF2b2lkIGNvbXBpbGF0aW9uIGJyZWFrLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IEpvbmF0aGFuIENhbWVyb24gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4N
Cj4gPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gPiAtLS0N
Cj4gPiAgIGh3L2FjcGkvYWNwaS1jcHUtaG90cGx1Zy1zdHViLmMgfCA2ICsrKysrKw0KPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3
L2FjcGkvYWNwaS1jcHUtaG90cGx1Zy1zdHViLmMgYi9ody9hY3BpL2FjcGktY3B1LWhvdHBsdWct
DQo+IHN0dWIuYw0KPiA+IGluZGV4IDNmYzRiMTRjMjYuLmM2YzYxYmI5Y2QgMTAwNjQ0DQo+ID4g
LS0tIGEvaHcvYWNwaS9hY3BpLWNwdS1ob3RwbHVnLXN0dWIuYw0KPiA+ICsrKyBiL2h3L2FjcGkv
YWNwaS1jcHUtaG90cGx1Zy1zdHViLmMNCj4gPiBAQCAtMTksNiArMTksMTIgQEAgdm9pZCBsZWdh
Y3lfYWNwaV9jcHVfaG90cGx1Z19pbml0KE1lbW9yeVJlZ2lvbg0KPiAqcGFyZW50LCBPYmplY3Qg
Km93bmVyLA0KPiA+ICAgICAgIHJldHVybjsNCj4gPiAgIH0NCj4gPg0KPiA+ICt2b2lkIGNwdV9o
b3RwbHVnX2h3X2luaXQoTWVtb3J5UmVnaW9uICphcywgT2JqZWN0ICpvd25lciwNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgIENQVUhvdHBsdWdTdGF0ZSAqc3RhdGUsIGh3YWRkciBiYXNl
X2FkZHIpDQo+ID4gK3sNCj4gPiArICAgIHJldHVybjsNCj4gPiArfQ0KPiANCj4gV2hpbGUgYXQg
aXQsIGNhbiB3ZSBwcmVmaXggdGhhdCBmdW5jdGlvbiB3aXRoIGFjcGk/DQoNCkkgY2FuIGRvIHRo
YXQgYnV0IGl0IGhhcyB0byBiZSBkb25lIGF0IG90aGVyIHBsYWNlcyBhcyB3ZWxsDQpzdWNoIGFz
IGluIGh3L2FjcGkvY3B1X2hvdHBsdWcuYyA8YWNwaV9zd2l0Y2hfdG9fbW9kZXJuX2NwaHAoKT4N
Cg0KSG9wZSB0aGlzIGlzIG5vdCBhbiBleHRyYW5lb3VzIGNoYW5nZSB0byB0aGlzIHBhdGNoLXNl
dD8NCg0KVGhhbmtzDQpTYWxpbC4NCg0KDQoNCg==
