Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp2050122ejb;
        Mon, 9 Oct 2023 08:34:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc6Zq6+6lRE0sBQPdFVGbCs6BQYCyqsnU/D23DhfnGWLhylwpMHmlx3ICkzj3l/ewIjuQP
X-Received: by 2002:a1c:4c09:0:b0:401:b204:3b97 with SMTP id z9-20020a1c4c09000000b00401b2043b97mr14961981wmf.4.1696865684909;
        Mon, 09 Oct 2023 08:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696865684; cv=none;
        d=google.com; s=arc-20160816;
        b=Kvyua3FInTkwOobkpzVt75Dc5XwbxRz57HX1vWpCN9uku5hN2yQQIzncMI3/ujvQQG
         KargU1WuLI24UT4fLzLknYmg+y329N1stD8+SGhpZHz0HSHqByJTVioh5IireRWBxKnq
         jnNRQh2HMYPMUepefWE5GX7KvNsqmP9lNa/wjye8i1SiuKnyPd6KPoq2r/j67DPm/rpn
         mG8r1VlKIrW2aF1lnOJDYxuQqqn29LRCN6J1n2cvpeHUQaL/yCIb5X6GIv0RlJQQRk5M
         bsklPp8esp7NynhNnYZWW6eZGXaPBVHveZtlL2pCTBS8KwItqajdF2zXsUc2tHZ9wXU1
         Assg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=22zoRLbM3QSnY7xnPK/YJrMDbph8re5rWfbAVMTGfQ8=;
        fh=Kb2Gcs7VD5wSTmDinyryIWwdRPJCIlRG79qMBRsDV+8=;
        b=AOoMR/EIA9LlLOXvqaLvpzmJ1m9GsBNZnhm46RZ5Vw/pbPUpHcUjrlpDC19reSfVuZ
         qSx5dSxqbidURXq2skHO/RBjZ/MKiREiZn0/02vVmFplQX0dXX2jGjypCWoNMZFTgXvq
         AdF5IkYWnuGtUqFsWH7+zz9brQMKsZwnD8+Hf+10U8ml0N0jeRG4hzW/TmajRv68OzxQ
         hDmLMCIZgjKaW2KTCXMA1UnOXj8oRdrNYBqY2xWEuYknFSDQVCbeyNuH0YmxR081Z7z4
         HPqZTegmGldpVD18GTIqIVqpPxobfBDhAg0Dyi7dS5t3arMviarQ3xqWdZYlz9DLBfub
         wjOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id u36-20020a05600c4d2400b004064629e742si6419504wmp.5.2023.10.09.08.34.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 08:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100006.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S430x4bLbz67V3m;
	Mon,  9 Oct 2023 23:31:45 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100006.china.huawei.com (7.191.160.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 16:34:43 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 9 Oct 2023 16:34:43 +0100
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
Subject: RE: [PATCH V3 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Topic: [PATCH V3 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Index: AQHZ+qPnrJn3/z1SYEi9OUvIaCcfXrBBUAWAgAAepOCAAAAuAIAAHeyg///1vICAABGbcA==
Date: Mon, 9 Oct 2023 15:34:42 +0000
Message-ID: <feb5459ddf5d463587353185a334780f@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
 <20231009112812.10612-2-salil.mehta@huawei.com>
 <a02eae26-6018-6f5c-1b82-e6061544022b@redhat.com>
 <63f8e47efcd045b1b8481f6fd427c4b1@huawei.com>
 <ae2e0fc1-7967-2bae-e4fa-b4d886ba4671@redhat.com>
 <0c972e213f9a46c3a595dc7f933046aa@huawei.com>
 <792f9f38-6031-1269-109e-941d2ecaddf9@redhat.com>
In-Reply-To: <792f9f38-6031-1269-109e-941d2ecaddf9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.154.91]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: b+6vLAHxYm2E

PiBGcm9tOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBPY3RvYmVyIDksIDIwMjMgNDoyMSBQTQ0KPiBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1l
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
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMDEvMTBdIGFjY2VsL2t2bTogRXh0cmFjdCBjb21tb24g
S1ZNIHZDUFUNCj4ge2NyZWF0aW9uLHBhcmtpbmd9IGNvZGUNCj4gDQo+ID4NCj4gPj4NCj4gPj4g
a3ZtX3ByZWNyZWF0ZV92Y3B1DQo+ID4NCj4gPiBwcmUtY3JlYXRpb24gaXMgdmVyeSBtdWNoIHNw
ZWNpZmljIHRvIEFSTSByaWdodCBub3cuIEkgYW0gbm90IHN1cmUNCj4gPiBpZiBpdCBpcyByaWdo
dCB0byBoYXZlIGFuIEFQSSB3aXRoIHRoaXMgbmFtZSBpbiB0aGUgY29kZSB3aGljaCBpcw0KPiA+
IGNvbW1vbiB0byBvdGhlciBhcmNoaXRlY3R1cmVzLg0KPiANCj4gSSBkb24ndCBsaWtlIGV4cG9z
aW5nIHRoZSBjb25jZXB0IG9mICJwYXJraW5nIiBDUFVzIGV4dGVybmFsbHksIHdoaWNoIGlzDQo+
IHNvIGZhciBoYW5kbGVkIGNvbXBsZXRlbHkgaW50ZXJuYWxseS4NCg0KDQpJIHVuZGVyc3RhbmQg
eW91ciBwb2ludCBvZiB2aWV3LiBUaGVyZSBpcyBhIHN1YnRsZSBkaWZmZXJlbmNlIGluIHRoZQ0K
d2F5IHBhcmtpbmcgbG9naWMgaGFzIGJlZW4gdXNlZCB0aWxsIG5vdywgc2F5IGluIHg4NiB3b3Js
ZCBhbmQgaG93IGl0DQppcyBiZWluZyB1c2VkIGluIHRoZSBBUk0gaW4gdGhlIFJGQyBwYXRjaGVz
IGJlaW5nIHByb3Bvc2VkLiBBRkFJQ1MsIGluDQp4ODYgd29ybGQgd2UgaGF2ZSBhIGxpYmVydHkg
dG8gZGVsYXkgdGhlIGNyZWF0aW9uIG9mIHRoZSB2Q1BVcyBpbiBLVk0NCmZvciB0aGUgZmlyc3Qg
dGltZSBidXQgb25jZSB0aGV5IGFyZSBjcmVhdGVkIGNhbm5vdCBiZSBkZXN0cm95ZWQgaW4gdGhl
DQpLVk0gc28gYXJlICh1bilwYXJrZWQgZm9yIHN1YnNlcXVlbnQgdXNlIGR1cmluZyBob3QodW4p
cGx1Zy4NCg0KQmVjYXVzZSBvZiB0aGUgQVJNIENQVSBhcmNoaXRlY3R1cmUgbGltaXRhdGlvbnMg
YW5kIHRoYXQgb2YgR0lDLCB3ZQ0KYXJlIG5vdCBhbGxvd2VkIHRvIGRvIHRoaXMuIEhlbmNlLCB3
ZSBoYXZlIHRvIHByZS1jcmVhdGUgYWxsIHRoZQ0KS1ZNIHZDUFVzIGFuZCBzaXplIFZHSUMgZHVy
aW5nIGluaXRpYWxpemF0aW9uLiBTaW5jZSBzb21lIG9mIHRoZQ0KS1ZNIHZDUFVzIHdvbnQgaGF2
ZSBhbnkgUU9NIENQVSBvYmplY3RzIGJlY2F1c2UgdGhleSBhcmUNCid5ZXQtdG8tYmUtcGx1Z2dl
ZCcgc28gbmVlZCB0byBiZSBwYXJrZWQuIEhlbmNlLCB3ZSByZXF1aXJlIHRoYXQNCmNvbW1vbiBw
YXJraW5nIGxvZ2ljLg0KDQoNCg0KPiANCj4gWy4uLl0NCj4gDQo+ID4NCj4gPg0KPiA+PiBrdm1f
Y3JlYXRlX3ZjcHUNCj4gPj4ga3ZtX2Rlc3Ryb3lfdmNwdQ0KPiA+Pg0KPiA+PiBPbmUgY291bGQg
ZXZlbiBtYWtlIGt2bV9jcmVhdGVfdmNwdSgpIGZhaWwgb24gQVJNIGlmIHRoZSBWQ1BVIGhhc24n
dA0KPiA+PiBiZWVuIHByZS1jcmVhdGVkLg0KPiA+DQo+ID4gUmlnaHQgbm93LCB3ZSBhYm9ydCB0
aGUgQ1BVIGluaXRpYWxpemF0aW9uIHByb2Nlc3MgaWYgdGhpcyBoYXBwZW5zLiBJDQo+ID4gYW0g
cGxhbm5pbmcgdG8gY2hhbmdlIGFib3J0KCkgaW50byAnZmF0YWxfZXJyb3InIGluIFJGQyBWMyB0
aG91Z2guDQo+ID4NCj4gPg0KPiA+DQo+ID4+DQo+ID4+IE9yIGRpZCBJIGdldCBpdCBhbGwgd3Jv
bmc/IDopDQo+ID4NCj4gPiBJIHdvbid0IHNheSB0aGF0IGl0IGlzIGp1c3QgYW5vdGhlciBwb2lu
dCBvZiB2aWV3IHdoaWNoIGlzIGFic29sdXRlbHkNCj4gPiBmaW5lLiBCdXQgSSB3b3VsZCBsaWtl
IHRvIHN0aWNrIHRvIGN1cnJlbnQgQVBJcy4NCj4gDQo+IE5vIHJlYWxseSBzdHJvbmcgb3Bpbmlv
biwgSSB3b3VsZG4ndCBkbyBpdCB0aGF0IHdheS4gSSdsbCBsZXQgb3RoZXJzDQo+IGNoaW1lIGlu
IGlmIHRoZXkgaGF2ZSBhbiBvcGluaW9uLg0KDQpPaywgVGhhbmtzLg0KDQpTYWxpbC4NCg==
