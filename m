Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1359330ejb;
        Mon, 20 May 2024 03:55:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXiT9H9wWpnDRH8U78IlXnxf9hFpZZB6yqeColGaS/oBqijLjKQZfMNIc93LK7zolw5UtHsAteY3ukk4BHSyewQKXwEjXl5
X-Google-Smtp-Source: AGHT+IF2U1oRjzDAFiXhw1gWEqPwYWp9yfL3ka2DzwHLQ3Q3luTW3HupY/DXCcKjDrEOML+vTtnb
X-Received: by 2002:adf:f791:0:b0:34d:9066:dd81 with SMTP id ffacd0b85a97d-3504a955ad7mr27021770f8f.47.1716202515324;
        Mon, 20 May 2024 03:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716202515; cv=none;
        d=google.com; s=arc-20160816;
        b=mJREO3oMPYKSgIVGEddRRr2M698TUFEB7u87jEvINWY3eoMWqbGhkyjuDPFlJDr4yw
         hwNhSxdS9xhHkEGclQOnkEqt7jYJuVUm5lt4S/mgHGEBwKAXfpfuF7q9GSnTkQ/LrBhJ
         2GWXRUzeMl5sJ3z8uUPB5geXCbxNlL8tSwFiINKIj609gBFVFdUT4dYruUso+l4jR3gd
         sSxIyrCg5eL3QOUAdUk9U7x6nGebNt1jShENMtgIJMLYbrH8UmRvKl7Mv6uOIeJ3mARZ
         8TjvFhHQAesE5LIezT8HVimYrwjvi7wgkSKpdJar+5j5X3XwqtUSsSXu0YTB9GCXn9gn
         WWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=R/9LbjHJjcq2pBMXxWxSQf9lYwed4bRCWUlwMIB4nZ4=;
        fh=aHAXn5ULFh3z7g8FRbmqCv/v2U7g/I2GswevBF/9Qlw=;
        b=l8mvAwqF6ZTxlAigM/z5iZM6VLGP2z7OACwkALf8S2Z0Erh+dWUZD3MqfjpHV97BjN
         KdOxzisYvY75Z20aJcpE7z24ppHCX01jS0RdLHgnn13prp+JWSaIfHmQl6oiVFabJVrh
         oJxYD68HaE3GchjusRZ5W+nnMTEsgdXbV/ZsYCZM1HpSiPqN0tHGyiuo4Zoa2sUOm0lf
         tYCKeaASiiAX9xjt7b4vMKnxT00YJupt3Gr3guBZPFJnxYWZNqn4OIb290M11hBQtsWw
         LGOrnmPgQckJ0VSefuPuuIye1/8DKeAz+VEgriMypaD96vc4mrawMCpCh1xaAEbmkioT
         /ATQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-354b7655e33si2912107f8f.652.2024.05.20.03.55.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2024 03:55:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VjZB91nPzz6J67Z;
	Mon, 20 May 2024 18:51:29 +0800 (CST)
Received: from lhrpeml100005.china.huawei.com (unknown [7.191.160.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 26D871400D4;
	Mon, 20 May 2024 18:55:14 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100005.china.huawei.com (7.191.160.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 11:55:13 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Mon, 20 May 2024 11:55:13 +0100
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
	<linuxarm@huawei.com>, Shaoqin Huang <shahuang@redhat.com>
Subject: RE: [PATCH V9 6/8] physmem: Add helper function to destroy CPU
 AddressSpace
Thread-Topic: [PATCH V9 6/8] physmem: Add helper function to destroy CPU
 AddressSpace
Thread-Index: AQHaqjDkHC86gPbskES/QKJueu2z1rGft5QAgAA7LuA=
Date: Mon, 20 May 2024 10:55:13 +0000
Message-ID: <46d1577dc27a4012bb90d9871d03fabe@huawei.com>
References: <20240519210620.228342-1-salil.mehta@huawei.com>
 <20240519210620.228342-7-salil.mehta@huawei.com>
 <D1EBOZTRN8SZ.Q9F4CFDZ8VYW@gmail.com>
In-Reply-To: <D1EBOZTRN8SZ.Q9F4CFDZ8VYW@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.174.235]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: TbTVPOH6fYgW

PiAgRnJvbTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4NCj4gIFNlbnQ6IE1v
bmRheSwgTWF5IDIwLCAyMDI0IDk6MTkgQU0NCj4gIA0KPiAgT24gTW9uIE1heSAyMCwgMjAyNCBh
dCA3OjA2IEFNIEFFU1QsIFNhbGlsIE1laHRhIHdyb3RlOg0KPiAgPiBWaXJ0dWFsIENQVSBIb3Qt
dW5wbHVnIGxlYWRzIHRvIHVucmVhbGl6YXRpb24gb2YgYSBDUFUgb2JqZWN0LiBUaGlzDQo+ICA+
IGFsc28gaW52b2x2ZXMgZGVzdHJ1Y3Rpb24gb2YgdGhlIENQVSBBZGRyZXNzU3BhY2UuIEFkZCBj
b21tb24gZnVuY3Rpb24NCj4gID4gdG8gaGVscCBkZXN0cm95IHRoZSBDUFUgQWRkcmVzc1NwYWNl
Lg0KPiAgDQo+ICBQYXRjaGVzIDYsNyBzZWVtIG9rYXkgdG8gbWUuIEkgd291bGQgbGlrZSB0byBz
ZWUgYSBzZXJpZXMgd2hlcmUgdGhleSBnZXQNCj4gIHVzZWQuIFdvdWxkIGl0IGJlIHBvc3NpYmxl
IHRvIGluY2x1ZGUgYXQgbGVhc3QgYSBUQ0cgdXNlciBpbiB5b3VyIHNlcmllcz8gVGhhdA0KPiAg
d291bGQgbWFrZSBpdCBlYXNpZXIgdG8gcmV2aWV3IGFuZCB0ZXN0Lg0KDQoNCklmIHlvdSB3aXNo
IHRvIHBsYXkgdGhlbiB5b3UgY2FuIHVzZSBiZWxvdyByZXBvc2l0b3J5IHdoaWNoIGlzIFY4IHZl
cnNpb24gb2YNCmFyY2hpdGVjdHVyZSBhZ25vc3RpYyBwYXRjaC1zZXQgcGx1cyBhcmNoaXRlY3R1
cmUgZGVwZW5kZW50IHBhdGNoLXNldA0Kc3RhY2tlZCB1cCB0b2dldGhlci4gVGhpcyBlZmZlY3Rp
dmVseSBSRkMgVjIgcmVhcnJhbmdlZCB3aXRoIGNsZWFyIHNlcGFyYXRpb24NCm9mIGFyY2ggYWdu
b3N0aWMgYW5kIHNwZWNpZmljIHBhcnRzIGFuZCBzb21lIHJldmlldyBjb21tZW50cyBpbmNvcnBv
cmF0ZWQuDQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9zYWxpbC1tZWh0YS9xZW11L2NvbW1pdHMvdmly
dC1jcHVocC1hcm12OC9yZmMtdjMtcmMxLw0KDQoNCkl0IGhhcyBUQ0cgYnV0IGl0IGhhcyBzb21l
IGlzc3VlcyBhbmQgaGVuY2Ugd2UgaGF2ZSBkaXNhYmxlZCBpdCBmb3Igbm93LiBXZSBhcmUNCndv
cmtpbmcgdG8gZml4IGl0Lg0KDQoNClRoYW5rcw0KU2FsaWwuDQoNCj4gIA0KPiAgVGhhbmtzLA0K
PiAgTmljaw0K
