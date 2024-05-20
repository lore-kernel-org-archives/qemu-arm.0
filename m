Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1376449ejb;
        Mon, 20 May 2024 04:27:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYL5bvvlzY5lYQuNv5WSv0sJ/4eZb4WcPKBtVulPaHPZrAELUXktOMij2sc4+BsxU2CAikv0d1a4uSPOoEcTNFDkFZWFO7
X-Google-Smtp-Source: AGHT+IHcl6OUdRU72MEjwcCyLqMSNLDIt2z/BpPghww3xr1VTb0J4aA+HZUNWNbKN7DlbUT6URxk
X-Received: by 2002:a05:600c:470f:b0:41b:285:8417 with SMTP id 5b1f17b1804b1-41fead6dc93mr202844985e9.40.1716204462448;
        Mon, 20 May 2024 04:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716204462; cv=none;
        d=google.com; s=arc-20160816;
        b=ZR5IE8SIkrV8HFfqaLvBicLrIIXbQfsuRL5yc1Va1cu4GrVwuVFqbUQMUIhapnuCnL
         r7/Rkr9iR02e3UiBJwmnQzGAFN9+Tk/ePvrwU7hFSHF1V2ZXIizB6MbuO8P9ehOrOY0M
         GA1yl8Q6LpN5RCGWakuaeKG+1kWG4h50OayJQ4SAOwW+Yy4sDmcPmzOwS+SLeyNAqE+Q
         lJyAA7FV9fyVB2eHCA6ywQvHsZqNspQejUmA/6Fsy+PsbEtRKVxe1M1+NfbD1J6GctjB
         6rZqvhYkARhjqTF1VZVt/SVYdDjeL4sfH/IVMEIsihU3Byp1a51u2SPH2kA3UNaS7VZz
         G1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=cwc1AEfJXtbbuY6Dr1CgJS22NYNoX01EWdHNCe3HT8Y=;
        fh=oA8Sg+ZUpvRlZGMzEQydWETcyLsuqDK5ZfZPUqVv4kM=;
        b=Z5JxWZBJCojpd1PlrumTiEOKHsdlq3nZTmGXzEv7n7FEgNTMQRnL0i5hOjbPgu4Kik
         Qb32SP3Qi9fOf7aBboVR78POfzGapgM3wAOZsA8B414D4Ee9rUomnphq6IHEkh4g4AWd
         RBkj8xz6vrtaThmHTTHX1xk6bqyUHks/xI4lHBr52On537J3mlJHoUt0hEdBAIy3fomi
         BJhJeOU8tLHmWBUi1Af+sdK0UEpWnskt7Ru4GlDESt4CDka4PW3CGqglkiOa6Gx6v4+0
         8PcGN5FuH2PjFf4SPRzFWbTQ2t4jIp5IICLSmC4cwndSULc8mwjRfTKGdswzmGUuTRNL
         TtLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-41fd4d1f805si31559655e9.191.2024.05.20.04.27.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2024 04:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VjZz205J3z67G9M;
	Mon, 20 May 2024 19:26:54 +0800 (CST)
Received: from lhrpeml100005.china.huawei.com (unknown [7.191.160.25])
	by mail.maildlp.com (Postfix) with ESMTPS id DFBEF140B67;
	Mon, 20 May 2024 19:27:40 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100005.china.huawei.com (7.191.160.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 12:27:40 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Mon, 20 May 2024 12:27:40 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Nicholas Piggin <npiggin@gmail.com>, "qemu-devel@nongnu.org"
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
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
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
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, Linuxarm
	<linuxarm@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	Shaoqin Huang <shahuang@redhat.com>
Subject: RE: [PATCH V9 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Topic: [PATCH V9 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Index: AQHaqjCk+Krm+sEOpEGrtSE0xbsEKbGfs2mAgABBGrA=
Date: Mon, 20 May 2024 11:27:40 +0000
Message-ID: <e02713782ae34f6caad43283b9608e5e@huawei.com>
References: <20240519210620.228342-1-salil.mehta@huawei.com>
 <20240519210620.228342-2-salil.mehta@huawei.com>
 <D1EBDKJQ19G2.7K7FS8Z9BA5D@gmail.com>
In-Reply-To: <D1EBDKJQ19G2.7K7FS8Z9BA5D@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.174.235]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: EPiGp8LeZySN

PiAgRnJvbTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4NCj4gIFNlbnQ6IE1v
bmRheSwgTWF5IDIwLCAyMDI0IDk6MDQgQU0NCj4gIA0KPiAgT24gTW9uIE1heSAyMCwgMjAyNCBh
dCA3OjA2IEFNIEFFU1QsIFNhbGlsIE1laHRhIHdyb3RlOg0KPiAgPiBLVk0gdkNQVSBjcmVhdGlv
biBpcyBkb25lIG9uY2UgZHVyaW5nIHRoZSB2Q1BVIHJlYWxpemF0aW9uIHdoZW4gUWVtdQ0KPiAg
PiB2Q1BVIHRocmVhZCBpcyBzcGF3bmVkLiBUaGlzIGlzIGNvbW1vbiB0byBhbGwgdGhlIGFyY2hp
dGVjdHVyZXMgYXMgb2Ygbm93Lg0KPiAgPg0KPiAgPiBIb3QtdW5wbHVnIG9mIHZDUFUgcmVzdWx0
cyBpbiBkZXN0cnVjdGlvbiBvZiB0aGUgdkNQVSBvYmplY3QgaW4gUU9NDQo+ICA+IGJ1dCB0aGUg
Y29ycmVzcG9uZGluZyBLVk0gdkNQVSBvYmplY3QgaW4gdGhlIEhvc3QgS1ZNIGlzIG5vdCBkZXN0
cm95ZWQNCj4gID4gYXMgS1ZNIGRvZXNuJ3Qgc3VwcG9ydCB2Q1BVIHJlbW92YWwuIFRoZXJlZm9y
ZSwgaXRzIHJlcHJlc2VudGF0aXZlIEtWTQ0KPiAgPiB2Q1BVIG9iamVjdC9jb250ZXh0IGluIFFl
bXUgaXMgcGFya2VkLg0KPiAgPg0KPiAgPiBSZWZhY3RvciBhcmNoaXRlY3R1cmUgY29tbW9uIGxv
Z2ljIHNvIHRoYXQgc29tZSBBUElzIGNvdWxkIGJlIHJldXNlZA0KPiAgPiBieSB2Q1BVIEhvdHBs
dWcgY29kZSBvZiBzb21lIGFyY2hpdGVjdHVyZXMgbGlrZXMgQVJNLCBMb29uZ3NvbiBldGMuDQo+
ICA+IFVwZGF0ZSBuZXcvb2xkIEFQSXMgd2l0aCB0cmFjZSBldmVudHMgaW5zdGVhZCBvZiBEUFJJ
TlRGLiBObyBmdW5jdGlvbmFsDQo+ICBjaGFuZ2UgaXMgaW50ZW5kZWQgaGVyZS4NCj4gIA0KDQpb
Li4uXQ0KDQp2b2lkIGt2bV9wYXJrX3ZjcHUoQ1BVU3RhdGUgKmNwdSkNCj4gID4gK3sNCj4gID4g
KyAgICBzdHJ1Y3QgS1ZNUGFya2VkVmNwdSAqdmNwdTsNCj4gID4gKw0KPiAgPiArICAgIHRyYWNl
X2t2bV9wYXJrX3ZjcHUoY3B1LT5jcHVfaW5kZXgsIGt2bV9hcmNoX3ZjcHVfaWQoY3B1KSk7DQo+
ICA+ICsNCj4gID4gKyAgICB2Y3B1ID0gZ19tYWxsb2MwKHNpemVvZigqdmNwdSkpOw0KPiAgPiAr
ICAgIHZjcHUtPnZjcHVfaWQgPSBrdm1fYXJjaF92Y3B1X2lkKGNwdSk7DQo+ICA+ICsgICAgdmNw
dS0+a3ZtX2ZkID0gY3B1LT5rdm1fZmQ7DQo+ICA+ICsgICAgUUxJU1RfSU5TRVJUX0hFQUQoJmt2
bV9zdGF0ZS0+a3ZtX3BhcmtlZF92Y3B1cywgdmNwdSwgbm9kZSk7IH0NCj4gIA0KPiAgQ291bGQg
eW91IG1vdmUga3ZtX2dldF92Y3B1IHVwIGhlcmUgc28gaXQncyBuZXh0IHRvIGt2bV9wYXJrX3Zj
cHUsIGFuZA0KPiAgdGhlbiB5b3UgZG9uJ3QgbmVlZCB0byBmb3J3YXJkIGRlY2xhcmUgaXQuIENh
bGwgaXQga3ZtX3VucGFya192Y3B1KCkgZm9yDQo+ICBzeW1tZXRyeSB3aXRoIHBhcmsuDQoNCg0K
c29ycnkgSSBtaXNzZWQgdGhpcyBwYXJ0IGVhcmxpZXIgYW5kIFBoaWwgYWxzbyBzdWdnZXN0ZWQg
dGhlIHNhbWUuIFllcywgSSBjYW4uDQoNCg0KVGhhbmtzDQpTYWxpbC4NCg0KPiAgDQo+ICBUaGFu
a3MsDQo+ICBOaWNrDQo=
