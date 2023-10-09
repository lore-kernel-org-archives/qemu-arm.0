Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp2034842ejb;
        Mon, 9 Oct 2023 08:10:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa5KbbUEqo/EeV5BiJqbNAPcXNve6QeQtZufsKNeM9bru7Y+4EncwpvOL0ROi3GHatUWIU
X-Received: by 2002:a05:600c:b59:b0:401:b1c6:97dc with SMTP id k25-20020a05600c0b5900b00401b1c697dcmr14052123wmr.23.1696864251281;
        Mon, 09 Oct 2023 08:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696864251; cv=none;
        d=google.com; s=arc-20160816;
        b=O73xzdiHbmKbEJ5/j5WqeAODnC1eDt0bMnYNQXhwSJ4B1D4Rjh1N7sTcRvR3IhHOFr
         vyXDj/1tEPM13GgZOcmEtBO6/CKwdEorC9RrrPEhz6rKX+7DUwOP9Er38XIOH6ypHSpz
         YazLV2v6IrLGRHYF/zhwAUSjxEJYet2LTnV12ds8Qh2qF8YHZVpEekZPQEc9Qetlu0Zb
         D3V+ywJhFaDGB9S+J4L9b05XC0RpDNVQqW6n5Mu8L8UOmSwgBfg8ikkZkArbMVfgP795
         jgC4R/9KjYWk5IcSOOe4uxzM0bQ+3VeRM8bqZ/dK8H8nIjpbSd5Nogs9OKg9cdNCWVe7
         VSow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=vadRMrc9CpuCe77yf+qyETXiW2xYbTbxogZ/Vo6ikWg=;
        fh=Kb2Gcs7VD5wSTmDinyryIWwdRPJCIlRG79qMBRsDV+8=;
        b=IeqfpQXx8oInSzRW7cJ5RRgHgdrCmRppcxDK5psQSYqU3EYkQjzWgsT6q44JCY7xat
         MjQt/3Cm/og4p3AKbZ6LzszbRQ4X2JzLJZPkq183sHKN9l+KocLjZxAiCrF1PuAm83FI
         qdpJV7K9ApKVA3gB+/C3XtF9Q1WZsxYWc7gVdmPxJ8bTv+5HwHNDHyV/mVJnOmZaLMau
         bZci42ZH0ids/k3eA0nzPHGjzwgP2u+jeT9az2rU9yx+ux45+H1cz8ZOy85o3creIwar
         1/a+4OI2aWyryxn2lLVzCrpYbpggTTlBXTmveLaZ2RlgptMYFSXlM3ACpzhyveIb+aPH
         yvFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id az41-20020a05600c602900b0040472e7a967si6652518wmb.140.2023.10.09.08.10.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 08:10:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S42VZ2xf4z6K6wg;
	Mon,  9 Oct 2023 23:08:54 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 16:10:49 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 9 Oct 2023 16:10:49 +0100
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
Thread-Index: AQHZ+qPnrJn3/z1SYEi9OUvIaCcfXrBBUAWAgAAepOCAAAAuAIAAHeyg
Date: Mon, 9 Oct 2023 15:10:49 +0000
Message-ID: <0c972e213f9a46c3a595dc7f933046aa@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
	<20231009112812.10612-2-salil.mehta@huawei.com>
	<a02eae26-6018-6f5c-1b82-e6061544022b@redhat.com>
	<63f8e47efcd045b1b8481f6fd427c4b1@huawei.com>
 <ae2e0fc1-7967-2bae-e4fa-b4d886ba4671@redhat.com>
In-Reply-To: <ae2e0fc1-7967-2bae-e4fa-b4d886ba4671@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.154.91]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: aW0JMJAoU1L7

PiBGcm9tOiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBPY3RvYmVyIDksIDIwMjMgMzoxMSBQTQ0KPiBUbzogU2FsaWwgTWVodGEgPHNhbGlsLm1l
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
S1ZNIHZDUFUNCj4ge2NyZWF0aW9uLHBhcmtpbmd9IGNvZGUNCj4gDQo+IE9uIDA5LjEwLjIzIDE1
OjQyLCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gPiBIaSBEYXZpZCwNCj4gPiBUaGFua3MgZm9yIHRo
ZSByZXZpZXcuDQo+ID4NCj4gPj4gRnJvbTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhh
dC5jb20+DQo+ID4+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciA5LCAyMDIzIDE6MjEgUE0NCj4gPj4g
VG86IFNhbGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25n
bnUub3JnOyBxZW11LWFybUBub25nbnUub3JnDQo+ID4+IENjOiBtYXpAa2VybmVsLm9yZzsgamVh
bi1waGlsaXBwZUBsaW5hcm8ub3JnOyBKb25hdGhhbiBDYW1lcm9uDQo+ID4+IDxqb25hdGhhbi5j
YW1lcm9uQGh1YXdlaS5jb20+OyBscGllcmFsaXNpQGtlcm5lbC5vcmc7DQo+ID4+IHBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZzsgcmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsNCj4gPj4gaW1h
bW1lZG9AcmVkaGF0LmNvbTsgYW5kcmV3LmpvbmVzQGxpbnV4LmRldjsgcGhpbG1kQGxpbmFyby5v
cmc7DQo+ID4+IGVyaWMuYXVnZXJAcmVkaGF0LmNvbTsgb2xpdmVyLnVwdG9uQGxpbnV4LmRldjsg
cGJvbnppbmlAcmVkaGF0LmNvbTsNCj4gPj4gbXN0QHJlZGhhdC5jb207IHdpbGxAa2VybmVsLm9y
ZzsgZ3NoYW5AcmVkaGF0LmNvbTsgcmFmYWVsQGtlcm5lbC5vcmc7DQo+ID4+IGFsZXguYmVubmVl
QGxpbmFyby5vcmc7IGxpbnV4QGFybWxpbnV4Lm9yZy51azsNCj4gPj4gZGFycmVuQG9zLmFtcGVy
ZWNvbXB1dGluZy5jb207IGlsa2thQG9zLmFtcGVyZWNvbXB1dGluZy5jb207DQo+ID4+IHZpc2hu
dUBvcy5hbXBlcmVjb21wdXRpbmcuY29tOyBrYXJsLmhldWJhdW1Ab3JhY2xlLmNvbTsNCj4gPj4g
bWlndWVsLmx1aXNAb3JhY2xlLmNvbTsgc2FsaWwubWVodGFAb3Buc3JjLm5ldDsgemh1a2VxaWFu
DQo+ID4+IDx6aHVrZXFpYW4xQGh1YXdlaS5jb20+OyB3YW5neGlvbmdmZW5nIChDKSA8d2FuZ3hp
b25nZmVuZzJAaHVhd2VpLmNvbT47DQo+ID4+IHdhbmd5YW5hbiAoWSkgPHdhbmd5YW5hbjU1QGh1
YXdlaS5jb20+OyBqaWFrZXJuZWwyQGdtYWlsLmNvbTsNCj4gPj4gbWFvYmlib0Bsb29uZ3Nvbi5j
bjsgbGl4aWFuZ2xhaUBsb29uZ3Nvbi5jbjsgTGludXhhcm0NCj4gPGxpbnV4YXJtQGh1YXdlaS5j
b20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjMgMDEvMTBdIGFjY2VsL2t2bTogRXh0cmFj
dCBjb21tb24gS1ZNIHZDUFUNCj4gPj4ge2NyZWF0aW9uLHBhcmtpbmd9IGNvZGUNCj4gPj4NCj4g
Pj4gT24gMDkuMTAuMjMgMTM6MjgsIFNhbGlsIE1laHRhIHdyb3RlOg0KPiA+Pj4gS1ZNIHZDUFUg
Y3JlYXRpb24gaXMgZG9uZSBvbmNlIGR1cmluZyB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIFZN
IHdoZW4gUWVtdQ0KPiA+Pj4gdGhyZWFkIGlzIHNwYXduZWQuIFRoaXMgaXMgY29tbW9uIHRvIGFs
bCB0aGUgYXJjaGl0ZWN0dXJlcy4NCj4gPj4+DQo+ID4+PiBIb3QtdW5wbHVnIG9mIHZDUFUgcmVz
dWx0cyBpbiBkZXN0cnVjdGlvbiBvZiB0aGUgdkNQVSBvYmplY3QgaW4gUU9NIGJ1dCB0aGUNCj4g
Pj4+IGNvcnJlc3BvbmRpbmcgS1ZNIHZDUFUgb2JqZWN0IGluIHRoZSBIb3N0IEtWTSBpcyBub3Qg
ZGVzdHJveWVkIGFuZCBpdHMNCj4gPj4+IHJlcHJlc2VudGF0aXZlIEtWTSB2Q1BVIG9iamVjdC9j
b250ZXh0IGluIFFlbXUgaXMgcGFya2VkLg0KPiA+Pj4NCj4gPj4+IFJlZmFjdG9yIGNvbW1vbiBs
b2dpYyBzbyB0aGF0IHNvbWUgQVBJcyBjb3VsZCBiZSByZXVzZWQgYnkgdkNQVSBIb3RwbHVnIGNv
ZGUuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRh
QGh1YXdlaS5jb20+DQo+ID4+DQo+ID4+IFsuLi5dDQo+ID4+DQo+ID4+Pg0KPiA+Pj4gICAgaW50
IGt2bV9pbml0X3ZjcHUoQ1BVU3RhdGUgKmNwdSwgRXJyb3IgKiplcnJwKQ0KPiA+Pj4gQEAgLTM5
NSwxOSArNDM0LDE0IEBAIGludCBrdm1faW5pdF92Y3B1KENQVVN0YXRlICpjcHUsIEVycm9yICoq
ZXJycCkNCj4gPj4+DQo+ID4+PiAgICAgICAgdHJhY2Vfa3ZtX2luaXRfdmNwdShjcHUtPmNwdV9p
bmRleCwga3ZtX2FyY2hfdmNwdV9pZChjcHUpKTsNCj4gPj4+DQo+ID4+PiAtICAgIHJldCA9IGt2
bV9nZXRfdmNwdShzLCBrdm1fYXJjaF92Y3B1X2lkKGNwdSkpOw0KPiA+Pj4gKyAgICByZXQgPSBr
dm1fY3JlYXRlX3ZjcHUoY3B1KTsNCj4gPj4+ICAgICAgICBpZiAocmV0IDwgMCkgew0KPiA+Pj4g
LSAgICAgICAgZXJyb3Jfc2V0Z19lcnJubyhlcnJwLCAtcmV0LCAia3ZtX2luaXRfdmNwdToga3Zt
X2dldF92Y3B1IGZhaWxlZCAoJWx1KSIsDQo+ID4+PiArICAgICAgICBlcnJvcl9zZXRnX2Vycm5v
KGVycnAsIC1yZXQsDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICJrdm1faW5pdF92
Y3B1OiBrdm1fY3JlYXRlX3ZjcHUgZmFpbGVkICglbHUpIiwNCj4gPj4NCj4gPj4gVW5yZWxhdGVk
IGNoYW5nZS4NCj4gPg0KPiA+DQo+ID4gSXQgaXMgcmVsYXRlZC4gSSB0aGluayB5b3UgbWlzc2Vk
IGt2bV9nZXRfdmNwdSAtPiBrdm1fY3JlYXRlX3ZjcHUgY2hhbmdlDQo+ID4gaW4gdGhlIHN0cmlu
Zy4NCj4gDQo+IEluZGVlZCwgSSBkaWQgOikNCj4gDQo+ID4NCj4gPg0KPiA+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGt2bV9hcmNoX3ZjcHVfaWQoY3B1KSk7DQo+ID4+PiAgICAgICAg
ICAgIGdvdG8gZXJyOw0KPiA+Pj4gICAgICAgIH0NCj4gPj4+DQo+ID4+PiAtICAgIGNwdS0+a3Zt
X2ZkID0gcmV0Ow0KPiA+Pj4gLSAgICBjcHUtPmt2bV9zdGF0ZSA9IHM7DQo+ID4+PiAtICAgIGNw
dS0+dmNwdV9kaXJ0eSA9IHRydWU7DQo+ID4+PiAtICAgIGNwdS0+ZGlydHlfcGFnZXMgPSAwOw0K
PiA+Pj4gLSAgICBjcHUtPnRocm90dGxlX3VzX3Blcl9mdWxsID0gMDsNCj4gPj4+IC0NCj4gPj4+
ICAgICAgICBtbWFwX3NpemUgPSBrdm1faW9jdGwocywgS1ZNX0dFVF9WQ1BVX01NQVBfU0laRSwg
MCk7DQo+ID4+PiAgICAgICAgaWYgKG1tYXBfc2l6ZSA8IDApIHsNCj4gPj4+ICAgICAgICAgICAg
cmV0ID0gbW1hcF9zaXplOw0KPiA+Pj4gZGlmZiAtLWdpdCBhL2FjY2VsL2t2bS90cmFjZS1ldmVu
dHMgYi9hY2NlbC9rdm0vdHJhY2UtZXZlbnRzDQo+ID4+PiBpbmRleCAzOTlhYWViMGVjLi4wOGUy
ZGMyNTNmIDEwMDY0NA0KPiA+Pj4gLS0tIGEvYWNjZWwva3ZtL3RyYWNlLWV2ZW50cw0KPiA+Pj4g
KysrIGIvYWNjZWwva3ZtL3RyYWNlLWV2ZW50cw0KPiA+Pj4gQEAgLTksNiArOSwxMCBAQCBrdm1f
ZGV2aWNlX2lvY3RsKGludCBmZCwgaW50IHR5cGUsIHZvaWQgKmFyZykgImRldiBmZCAlZCwgdHlw
ZSAweCV4LCBhcmcgJXAiDQo+ID4+PiAgICBrdm1fZmFpbGVkX3JlZ19nZXQodWludDY0X3QgaWQs
IGNvbnN0IGNoYXIgKm1zZykgIldhcm5pbmc6IFVuYWJsZSB0byByZXRyaWV2ZSBPTkVSRUcgJSIg
UFJJdTY0ICIgZnJvbSBLVk06ICVzIg0KPiA+Pj4gICAga3ZtX2ZhaWxlZF9yZWdfc2V0KHVpbnQ2
NF90IGlkLCBjb25zdCBjaGFyICptc2cpICJXYXJuaW5nOiBVbmFibGUgdG8gc2V0IE9ORVJFRyAl
IiBQUkl1NjQgIiB0byBLVk06ICVzIg0KPiA+Pj4gICAga3ZtX2luaXRfdmNwdShpbnQgY3B1X2lu
ZGV4LCB1bnNpZ25lZCBsb25nIGFyY2hfY3B1X2lkKSAiaW5kZXg6ICVkIGlkOiAlbHUiDQo+ID4+
PiAra3ZtX2NyZWF0ZV92Y3B1KGludCBjcHVfaW5kZXgsIHVuc2lnbmVkIGxvbmcgYXJjaF9jcHVf
aWQpICJjcmVhdGluZyBLVk0gY3B1OiBjcHVfaW5kZXg6ICVkIGFyY2ggdmNwdS1pZDogJWx1Ig0K
PiA+Pj4gK2t2bV9nZXRfdmNwdSh1bnNpZ25lZCBsb25nIGFyY2hfY3B1X2lkKSAidW5wYXJraW5n
IEtWTSB2Y3B1OiBhcmNoIHZjcHUtaWQ6ICVsdSINCj4gPj4+ICtrdm1fZGVzdHJveV92Y3B1KGlu
dCBjcHVfaW5kZXgsIHVuc2lnbmVkIGxvbmcgYXJjaF9jcHVfaWQpICJkZXN0cm95IHZjcHU6IGNw
dV9pbmRleDogJWQgYXJjaCB2Y3B1LWlkOiAlbHUiDQo+ID4+PiAra3ZtX3BhcmtfdmNwdShpbnQg
Y3B1X2luZGV4LCB1bnNpZ25lZCBsb25nIGFyY2hfY3B1X2lkKSAicGFya2luZyBLVk0gdmNwdTog
Y3B1X2luZGV4OiAlZCBhcmNoIHZjcHUtaWQ6ICVsdSINCj4gPj4NCj4gPj4gSXQncyBhIGJpdCBj
b25mdXNpbmcgdGhhdCB0aGVyZSBpcyBub3cNCj4gPj4NCj4gPj4gMSkgY3JlYXRlIChjcmVhdGUg
bmV3IG9yIHJldHVybiBwYXJrZWQpDQo+ID4+IDIpIGRlc3Ryb3kgKGNsZWFudXAgKyBwYXJrKQ0K
PiA+PiAzKSBwYXJrIChwYXJrIG9ubHkpDQo+ID4+DQo+ID4+IFdoeSB3b3VsZCBvbmUgdXNlIDIp
IGluc3RlYWQgb2YgMykgb3IgdGhlIG90aGVyIHdheSBhcm91bmQ/IEJ1dCBJDQo+ID4+IHN1c3Bl
Y3QgdGhhdCBrdm1fZGVzdHJveV92Y3B1KCkgaXMgb25seSBzdXBwb3NlZCB0byBiZSBhIEtWTS1p
bnRlcm5hbA0KPiA+PiBoZWxwZXIgLi4uDQo+ID4NCj4gPiBrdm1fZGVzdHJveV92Y3B1IGlzIG1v
cmUgdGhhbiBqdXN0IHBhcmtpbmc6DQo+ID4NCj4gPiAxLiBBcmNoIGRlc3Ryb3kgdmNwdQ0KPiA+
IDIuIFVubWFwIGNwdS0+a3ZtX3J1bg0KPiA+IDMuIFBhcmtpbmcgbG9naWMNCj4gPg0KPiA+IFRv
IHN1cHBvcnQgdmlydHVhbCBDUFUgSG90cGx1ZyBvbiBBUk0gcGxhdGZvcm1zIHdlIHByZS1jcmVh
dGUgYWxsDQo+ID4gdGhlIEtWTSB2Q1BVcyBidXQgdGhlaXIgY29ycmVzcG9uZGluZyBRZW11IHRo
cmVhZHMgYXJlIG5vdCBzcGF3bmVkDQo+ID4gKGFuZCBoZW5jZSBjcHUtPmt2bV9ydW4gaXMgbm90
IG1hcHBlZCkuIFVucGx1Z2dlZCB2Q1BVcyByZW1haW5zDQo+ID4gcGFya2VkIGluIHRoZSBsaXN0
LiBIZW5jZSwgb25seSBzdGVwLTMgaXMgcmVxdWlyZWQuDQo+IA0KPiBJSVVDLCB5b3VyIGN1cnJl
bnQgZmxvdyBpcyBnb2luZyB0byBiZQ0KPiANCj4gMSkgQ3JlYXRlDQo+IDIpIFBhcmsNCj4gMykg
Q3JlYXRlIFt3aGljaCBlbmRzIHVwIHJldXNpbmcgdGhlIHBhcmtlZCBWQ1BVXQ0KPiA0KSBEZXN0
cm95IFt3aGVuIHVucGx1Z2dpbmcgdGhlIENQVV0NCg0KDQpJbiB0aGUgQVJNIHNwZWNpZmljIGNv
ZGUsIFllcy4NCg0KIA0KPiBJZiB0aGF0J3MgdGhlIGNhc2UsIHRoYXQgQVBJIHJlYWxseSBpcyBz
dWJvcHRpbWFsLg0KPiANCj4gV2hhdCBzcGVha3MgYWdhaW5zdCBhbiBBUEkgdGhhdCBtb2RlbHMg
MSkgYW5kIDIpIGluIGEgc2luZ2xlIHN0ZXANCg0KDQpBUEkgaXMgZ2VuZXJpYyBhbmQgaXMgcGFy
dCBvZiBhcmNoaXRlY3R1cmUgYWdub3N0aWMgY29kZS4NCg0KDQo+IA0KPiBrdm1fcHJlY3JlYXRl
X3ZjcHUNCg0KcHJlLWNyZWF0aW9uIGlzIHZlcnkgbXVjaCBzcGVjaWZpYyB0byBBUk0gcmlnaHQg
bm93LiBJIGFtIG5vdCBzdXJlDQppZiBpdCBpcyByaWdodCB0byBoYXZlIGFuIEFQSSB3aXRoIHRo
aXMgbmFtZSBpbiB0aGUgY29kZSB3aGljaCBpcw0KY29tbW9uIHRvIG90aGVyIGFyY2hpdGVjdHVy
ZXMuDQoNCg0KPiBrdm1fY3JlYXRlX3ZjcHUNCj4ga3ZtX2Rlc3Ryb3lfdmNwdQ0KPiANCj4gT25l
IGNvdWxkIGV2ZW4gbWFrZSBrdm1fY3JlYXRlX3ZjcHUoKSBmYWlsIG9uIEFSTSBpZiB0aGUgVkNQ
VSBoYXNuJ3QNCj4gYmVlbiBwcmUtY3JlYXRlZC4NCg0KUmlnaHQgbm93LCB3ZSBhYm9ydCB0aGUg
Q1BVIGluaXRpYWxpemF0aW9uIHByb2Nlc3MgaWYgdGhpcyBoYXBwZW5zLiBJDQphbSBwbGFubmlu
ZyB0byBjaGFuZ2UgYWJvcnQoKSBpbnRvICdmYXRhbF9lcnJvcicgaW4gUkZDIFYzIHRob3VnaC4N
Cg0KDQoNCj4gDQo+IE9yIGRpZCBJIGdldCBpdCBhbGwgd3Jvbmc/IDopDQoNCkkgd29uJ3Qgc2F5
IHRoYXQgaXQgaXMganVzdCBhbm90aGVyIHBvaW50IG9mIHZpZXcgd2hpY2ggaXMgYWJzb2x1dGVs
eQ0KZmluZS4gQnV0IEkgd291bGQgbGlrZSB0byBzdGljayB0byBjdXJyZW50IEFQSXMuDQoNCg0K
VGhhbmtzDQpTYWxpbC4NCg0KDQo=
