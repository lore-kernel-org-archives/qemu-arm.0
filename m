Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1426501ejb;
        Mon, 2 Oct 2023 09:20:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4xKbVhGTbNg0jVBSsyuZi55SfGNkjeEQ9gt8VJFwc0Kiev7OUwzTcSz9MgHy4012R3jLi
X-Received: by 2002:a05:6830:3443:b0:6bc:8afe:8a15 with SMTP id b3-20020a056830344300b006bc8afe8a15mr9388435otu.38.1696263657660;
        Mon, 02 Oct 2023 09:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696263657; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3hTNHAnmjmWBKoShV/K6mJC5K9LnKaEXumba4f0jeu9LlcXMeZjZqGSXXoOzcGoYf
         9kK/ZSkhaZVxm60HpaCZUESaSiXfsH0fOcZL1cOcU3QLm26zwwO/IXt0VNidLEzEzGUC
         SU7ETT7RVbSF2zQlwpDhJLtr1Swojl2BdRj+bzqhoNoWjSUNLSmRssnxpP8BFY6HP7zn
         aRgpUFTzPBaisgMd61TVsQ0DlfUVEtYlMd3CByqKseshUeay4rZYnXJINEFNiLKSnM5q
         dIbg2P3pSf0rE1zC2se479hfkRqo7SOIDblg6W8kM8nSpmkma4PyKfMJg+kfiRW3xzIC
         5ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=QCOl2xdTFQxeRuCY03abvHh93+oD49JMfDUY5nttDi8=;
        fh=hdkuu+IAzV9F5cEyPWpdhkV3n0hGx3syql0LHe616n0=;
        b=YbtivmBCkaCQGIVTDau9AXDUR7rqECaBQo/gc0vBhon0nt8RjGWTyhlVFQyXOWMaSQ
         EpWTsRMHwRDVFl+PdZuorCzZDRDZ9fwiYBqP/0z7S8KlCsU3a9DbbbtjCVMQHLt4w+iI
         B31jzD2XKKfnyfi0EWGEnBu9wUYUJkzmQpeGcMoKw+VIGAplKk4Z2w2RsVcecIW5XAbb
         hieDk9FVtnMTx32V/fqrUHnxsTwr3UcBi3euE6R69T+xCH7NGZBonBYl1zM92dyQuKJU
         5p+zTaLA/iIiBao85dAJtM1i66vmsc4blRaSl+9woJO+t3+bUK3mueJRTc2uFJ+XDCLm
         zqhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id n1-20020a63f801000000b00577549e67b9si28159776pgh.589.2023.10.02.09.20.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 09:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RzmQh41WCz67T1b;
	Tue,  3 Oct 2023 00:20:44 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100001.china.huawei.com (7.191.160.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 2 Oct 2023 17:20:51 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 2 Oct 2023 17:20:51 +0100
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
Subject: RE: [PATCH RFC V2 05/37] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Topic: [PATCH RFC V2 05/37] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Index: AQHZ8GEwrapt1GmS5EiUapT/WSViBbAuLKKAgAiJSTA=
Date: Mon, 2 Oct 2023 16:20:51 +0000
Message-ID: <2a1d9be1afb54290b6b0e4a54711e030@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-6-salil.mehta@huawei.com>
 <d58c51d2-53e4-3873-7c87-c6ccc3025ed9@redhat.com>
In-Reply-To: <d58c51d2-53e4-3873-7c87-c6ccc3025ed9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.33.168]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: RB5IPm3vfs6B

SGkgR2F2aW4sDQoNCj4gRnJvbTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4NCj4gU2Vu
dDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjcsIDIwMjMgNzo1MiBBTQ0KPiBUbzogU2FsaWwgTWVo
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
aXhpYW5nbGFpQGxvb25nc29uLmNuDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggUkZDIFYyIDA1LzM3
XSBhY2NlbC9rdm06IEV4dHJhY3QgY29tbW9uIEtWTSB2Q1BVDQo+IHtjcmVhdGlvbixwYXJraW5n
fSBjb2RlDQo+IA0KPiBIaSBTYWxpbCwNCj4gDQo+IE9uIDkvMjYvMjMgMjA6MDQsIFNhbGlsIE1l
aHRhIHdyb3RlOg0KPiA+IEtWTSB2Q1BVIGNyZWF0aW9uIGlzIGRvbmUgb25jZSBkdXJpbmcgdGhl
IGluaXRpYWxpemF0aW9uIG9mIHRoZSBWTSB3aGVuIFFlbXUNCj4gPiB0aHJlYWRzIGFyZSBzcGF3
bmVkLiBUaGlzIGlzIGNvbW1vbiB0byBhbGwgdGhlIGFyY2hpdGVjdHVyZXMuIElmIHRoZSBhcmNo
aXRlY3R1cmUNCj4gPiBzdXBwb3J0cyB2Q1BVIGhvdC17dW59cGx1ZyB0aGVuIHRoaXMgS1ZNIHZD
UFUgY3JlYXRpb24gY291bGQgYmUgZGVmZXJyZWQgdG8NCj4gPiBsYXRlciBwb2ludCBhcyB3ZWxs
LiBTb21lIGFyY2hpdGVjdHVyZXMgbWlnaHQgaW4gYW55IGNhc2UgY3JlYXRlIEtWTSB2Q1BVcyBm
b3INCj4gPiB0aGUgeWV0LXRvLWJlIHBsdWdnZWQgdkNQVXMgKGkuZS4gUW9NIE9iamVjdCAmIHRo
cmVhZCBkb2VzIG5vdCBleGlzdHMpIGR1cmluZyBWTQ0KPiA+IGluaXQgdGltZSBhbmQgcGFyayB0
aGVtLg0KPiA+DQo+ID4gSG90LXVucGx1ZyBvZiB2Q1BVIHJlc3VsdHMgaW4gZGVzdHJ1Y3Rpb24g
b2YgdGhlIHZDUFUgb2JqZWN0cyBpbiBRT00gYnV0DQo+ID4gdGhlIEtWTSB2Q1BVIG9iamVjdHMg
aW4gdGhlIEhvc3QgS1ZNIGFyZSBub3QgZGVzdHJveWVkIGFuZCB0aGVpciByZXByZXNlbnRhdGl2
ZQ0KPiA+IEtWTSB2Q1BVIG9iamVjdHMgaW4gUWVtdSBhcmUgcGFya2VkLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogU2FsaWwgTWVodGEgPHNhbGlsLm1laHRhQGh1YXdlaS5jb20+DQo+ID4gLS0t
DQo+ID4gICBhY2NlbC9rdm0va3ZtLWFsbC5jICB8IDYxICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tDQo+ID4gICBpbmNsdWRlL3N5c2VtdS9rdm0uaCB8ICAyICsr
DQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygt
KQ0KPiA+DQo+IA0KPiBUaGUgbW9zdCBpbXBvcnRhbnQgcG9pbnQgc2VlbXMgbWlzc2VkIGluIHRo
ZSBjb21taXQgbG9nOiBUaGUgS1ZNIHZDUFUgb2JqZWN0cywNCj4gaW5jbHVkaW5nIHRob3NlIGhv
dHBsdWdnYWJsZSBvYmplY3RzLCBuZWVkIHRvIGJlIGluIHBsYWNlIGJlZm9yZSBpbi1ob3N0IEdJ
Q3YzDQo+IGlzIGluaXRpYWxpemVkLiBTbyB3ZSBuZWVkIGV4cG9zZSBrdm1fY3JlYXRlX3ZjcHUo
KSB0byBtYWtlIHRob3NlIEtWTSB2Q1BVDQo+IG9iamVjdHMgaW4gcGxhY2UsIGV2ZW4gZm9yIHRo
b3NlIG5vbi1wcmVzZW50IHZDUFVzLg0KDQoNClRoaXMgaXMgYSBwYXRjaCBjb21tb24gdG8gYWxs
IGFyY2hpdGVjdHVyZXMuIFRoZSBwb2ludCB5b3UgYXJlIG1ha2luZyBpcyBzcGVjaWZpYw0KdG8g
dGhlIEFSTSBhcmNoaXRlY3R1cmUuIFRoaXMgcGF0Y2ggaXMgbm93IHBhcnQgb2YgdGhlIGNvbW1v
biBwYXRjaC1zZXQuIEhlcmUsDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwv
MjAyMzA5MzAwMDE5MzMuMjY2MC0xLXNhbGlsLm1laHRhQGh1YXdlaS5jb20vDQoNCg0KPiANCj4g
PiBkaWZmIC0tZ2l0IGEvYWNjZWwva3ZtL2t2bS1hbGwuYyBiL2FjY2VsL2t2bS9rdm0tYWxsLmMN
Cj4gPiBpbmRleCA3YjNkYThkYzNhLi44NmU5YzllYTYwIDEwMDY0NA0KPiA+IC0tLSBhL2FjY2Vs
L2t2bS9rdm0tYWxsLmMNCj4gPiArKysgYi9hY2NlbC9rdm0va3ZtLWFsbC5jDQo+ID4gQEAgLTEz
Nyw2ICsxMzcsNyBAQCBzdGF0aWMgUWVtdU11dGV4IGttbF9zbG90c19sb2NrOw0KPiA+ICAgI2Rl
ZmluZSBrdm1fc2xvdHNfdW5sb2NrKCkgIHFlbXVfbXV0ZXhfdW5sb2NrKCZrbWxfc2xvdHNfbG9j
aykNCj4gPg0KPiA+ICAgc3RhdGljIHZvaWQga3ZtX3Nsb3RfaW5pdF9kaXJ0eV9iaXRtYXAoS1ZN
U2xvdCAqbWVtKTsNCj4gPiArc3RhdGljIGludCBrdm1fZ2V0X3ZjcHUoS1ZNU3RhdGUgKnMsIHVu
c2lnbmVkIGxvbmcgdmNwdV9pZCk7DQo+ID4NCj4gPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1f
cmVzYW1wbGVfZmRfcmVtb3ZlKGludCBnc2kpDQo+ID4gICB7DQo+ID4gQEAgLTMyMCwxMSArMzIx
LDUxIEBAIGVycjoNCj4gPiAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICAgfQ0KPiA+DQo+ID4gK3Zv
aWQga3ZtX3BhcmtfdmNwdShDUFVTdGF0ZSAqY3B1KQ0KPiA+ICt7DQo+ID4gKyAgICB1bnNpZ25l
ZCBsb25nIHZjcHVfaWQgPSBjcHUtPmNwdV9pbmRleDsNCj4gPiArICAgIHN0cnVjdCBLVk1QYXJr
ZWRWY3B1ICp2Y3B1Ow0KPiA+ICsNCj4gPiArICAgIHZjcHUgPSBnX21hbGxvYzAoc2l6ZW9mKCp2
Y3B1KSk7DQo+ID4gKyAgICB2Y3B1LT52Y3B1X2lkID0gdmNwdV9pZDsNCj4gDQo+ICAgICAgICAg
dmNwdS0+dmNwdV9pZCA9IGNwdS0+Y3B1X2luZGV4Ow0KPiANCj4gQHZjcHVfaWQgY2FuIGJlIGRy
b3BwZWQuDQoNCg0KWWVzLCBhZ3JlZWQuDQoNClRoYW5rcw0KU2FsaWwuDQoNCj4gDQo+ID4gKyAg
ICB2Y3B1LT5rdm1fZmQgPSBjcHUtPmt2bV9mZDsNCj4gPiArICAgIFFMSVNUX0lOU0VSVF9IRUFE
KCZrdm1fc3RhdGUtPmt2bV9wYXJrZWRfdmNwdXMsIHZjcHUsIG5vZGUpOw0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICtpbnQga3ZtX2NyZWF0ZV92Y3B1KENQVVN0YXRlICpjcHUpDQo+ID4gK3sNCj4gPiAr
ICAgIHVuc2lnbmVkIGxvbmcgdmNwdV9pZCA9IGNwdS0+Y3B1X2luZGV4Ow0KPiA+ICsgICAgS1ZN
U3RhdGUgKnMgPSBrdm1fc3RhdGU7DQo+ID4gKyAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAg
IERQUklOVEYoImt2bV9jcmVhdGVfdmNwdVxuIik7DQo+ID4gKw0KPiA+ICsgICAgLyogY2hlY2sg
aWYgdGhlIEtWTSB2Q1BVIGFscmVhZHkgZXhpc3QgYnV0IGlzIHBhcmtlZCAqLw0KPiA+ICsgICAg
cmV0ID0ga3ZtX2dldF92Y3B1KHMsIGt2bV9hcmNoX3ZjcHVfaWQoY3B1KSk7DQo+ID4gKyAgICBp
ZiAocmV0ID4gMCkgew0KPiA+ICsgICAgICAgIGdvdG8gZm91bmQ7DQo+ID4gKyAgICB9DQo+ID4g
Kw0KPiA+ICsgICAgLyogY3JlYXRlIGEgbmV3IEtWTSB2Y3B1ICovDQo+ID4gKyAgICByZXQgPSBr
dm1fdm1faW9jdGwocywgS1ZNX0NSRUFURV9WQ1BVLCAodm9pZCAqKXZjcHVfaWQpOw0KPiA+ICsg
ICAgaWYgKHJldCA8IDApIHsNCj4gPiArICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICAgfQ0K
PiA+ICsNCj4gPiArZm91bmQ6DQo+ID4gKyAgICBjcHUtPnZjcHVfZGlydHkgPSB0cnVlOw0KPiA+
ICsgICAgY3B1LT5rdm1fZmQgPSByZXQ7DQo+ID4gKyAgICBjcHUtPmt2bV9zdGF0ZSA9IHM7DQo+
ID4gKyAgICBjcHUtPmRpcnR5X3BhZ2VzID0gMDsNCj4gPiArICAgIGNwdS0+dGhyb3R0bGVfdXNf
cGVyX2Z1bGwgPSAwOw0KPiA+ICsNCj4gPiArICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0K
PiANCj4gVGhlIGZvdW5kIHRhZyBjYW4gYmUgZHJvcHBlZC4gQGNwdSBjYW4gYmUgaW5pdGlhbGl6
ZWQgaWYgdkNQVSBmZCBpcyBmb3VuZA0KPiBhbmQgdGhlbiBiYWlsIGVhcmx5Lg0KDQpZZXMsIFRo
aXMgcGF0Y2ggaGFzIGJlZW4gcmVmYWN0b3JlZCBhbmQgZm91bmQgaGFzIGJlZW4gZHJvcHBlZC4g
DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvMjAyMzA5MzAwMDE5MzMuMjY2
MC0xLXNhbGlsLm1laHRhQGh1YXdlaS5jb20vDQoNCg0KVGhhbmtzDQpTYWxpbC4NCg0KDQo=
