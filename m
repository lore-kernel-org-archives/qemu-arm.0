Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp544913njb;
        Thu, 4 Jul 2024 04:43:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3fBsHFdAomVO8ImA0AFdYB6EZ/Al4H22IOpKbomcCZ7gkk8CKU3VvySsolihCPhsKReUJ/pwTSW9QeShtBL+kOzCyt4Yp
X-Google-Smtp-Source: AGHT+IFwqIrlKoLJxdAh1pv8G7ALo+4tKTF9VH9se89Yjk1UjXxlGc3JPwBUKGUh3oBTjkxNy5pi
X-Received: by 2002:a2e:a58a:0:b0:2ee:6a72:f006 with SMTP id 38308e7fff4ca-2ee8ed8c709mr12500421fa.21.1720093434535;
        Thu, 04 Jul 2024 04:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720093434; cv=none;
        d=google.com; s=arc-20160816;
        b=XgrL9g4OP250WDj/nJyIeRr7TrXQ3NKiROqaKEK0MaQ88q1C4Y8/iLxWg5WmPnahBR
         4GCCnBX6M2LVA20kg6hlV0VeaIgG+tBvnzLpkuHr8oXgVQAMlS75rQP8R0RxK5dMguKG
         dP6uCuiUEVBRo2WuDqOSX/ZDOsjpek0KXxqanO3QDTOpA0JxzNrDxeDnA3KX5uJPoatl
         U5LV7FzkKWYqaiSoCzNzbLhQB+V9GycXgNRIMdO1ht2pUvREBFFxxQNRsE6ZFO0fD6bf
         lYtd8MDe6OjYhHbPAt64s2RjbSHeAvv1m55GnSivCZ5B8Bzswtrfoi0o1yG5tl+UNY+I
         r3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=OyCvEtkCBga0IZwo97+F7xwuyW/g3qxNWiw3FxVkALQ=;
        fh=Ctp4jd3nYrlcAwvTClASZfqoxQ+z3q/rWeIqmFvoM94=;
        b=Eu9vPSKs5fuTH6Xscx7R9gYNGDok7d0zvlhepSWF3DEh53E3wItr5tS2E9TD/QjpBe
         oMAGoUewsjPldJJ654hhUxVzxHns20pBrWsU66zqaOmYKLA9KAOUmwwVbFyG47awySIN
         VJgKvXwrkLAcl1lAFJUv9VDJxkIxHXy1BPKup7Rh42xlDAWGJPz1xkW+nXMv3ZfPoou4
         yJNFbs5z887UsWuzqWWAMxJxPWpu0XqPcUMCsdR+3NkFDo0qZAmaPEXo5nx7Z84ZdTit
         iKesYT5/SY+YJd3OsXA5/c3N5OtY483+SLxkzV7+qC9DWFyI5guh77Hy7Pb1SRV8zGff
         pnJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-36796c60b5csi1532075f8f.90.2024.07.04.04.43.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2024 04:43:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WFF9g1gQYz6K99n;
	Thu,  4 Jul 2024 19:41:59 +0800 (CST)
Received: from lhrpeml100003.china.huawei.com (unknown [7.191.160.210])
	by mail.maildlp.com (Postfix) with ESMTPS id 51A5B140B63;
	Thu,  4 Jul 2024 19:43:53 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100003.china.huawei.com (7.191.160.210) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 4 Jul 2024 12:43:52 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Thu, 4 Jul 2024 12:43:52 +0100
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
	Shaoqin Huang <shahuang@redhat.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: RE: [PATCH V13 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Topic: [PATCH V13 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Index: AQHauNIRAeRMruTFh0K+ZTjTNpSYCbHl+vuAgACeIgA=
Date: Thu, 4 Jul 2024 11:43:52 +0000
Message-ID: <5539e63ff2e8409f94edf210ad9d7a21@huawei.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
 <20240607115649.214622-4-salil.mehta@huawei.com>
 <D2GF5O8SP4Q8.38I35G35K74OG@gmail.com>
In-Reply-To: <D2GF5O8SP4Q8.38I35G35K74OG@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.159.88]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: 1u+Uvz3lY0B9

SEkgTmljaywNCg0KPiAgRnJvbTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4N
Cj4gIFNlbnQ6IFRodXJzZGF5LCBKdWx5IDQsIDIwMjQgNDowMyBBTQ0KPiAgVG86IFNhbGlsIE1l
aHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnOw0KPiAg
cWVtdS1hcm1Abm9uZ251Lm9yZw0KPiAgDQo+ICBPbiBGcmkgSnVuIDcsIDIwMjQgYXQgOTo1NiBQ
TSBBRVNULCBTYWxpbCBNZWh0YSB3cm90ZToNCj4gID4gQEAgLTQwMCw2ICs0MTEsMTIgQEAgc3Rh
dGljIHZvaWQgYWNwaV9nZWRfaW5pdGZuKE9iamVjdCAqb2JqKQ0KPiAgPiAgICAgIG1lbW9yeV9y
ZWdpb25faW5pdF9pbygmZ2VkX3N0LT5yZWdzLCBvYmosICZnZWRfcmVnc19vcHMsIGdlZF9zdCwN
Cj4gID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgVFlQRV9BQ1BJX0dFRCAiLXJlZ3MiLCBB
Q1BJX0dFRF9SRUdfQ09VTlQpOw0KPiAgPiAgICAgIHN5c2J1c19pbml0X21taW8oc2JkLCAmZ2Vk
X3N0LT5yZWdzKTsNCj4gID4gKw0KPiAgPiArICAgIG1lbW9yeV9yZWdpb25faW5pdCgmcy0+Y29u
dGFpbmVyX2NwdWhwLCBPQkpFQ1QoZGV2KSwgImNwdWhwDQo+ICBjb250YWluZXIiLA0KPiAgPiAr
ICAgICAgICAgICAgICAgICAgICAgICBBQ1BJX0NQVV9IT1RQTFVHX1JFR19MRU4pOw0KPiAgPiAr
ICAgIHN5c2J1c19pbml0X21taW8oc2JkLCAmcy0+Y29udGFpbmVyX2NwdWhwKTsNCj4gID4gKyAg
ICBjcHVfaG90cGx1Z19od19pbml0KCZzLT5jb250YWluZXJfY3B1aHAsIE9CSkVDVChkZXYpLA0K
PiAgPiArICAgICAgICAgICAgICAgICAgICAgICAgJnMtPmNwdWhwX3N0YXRlLCAwKTsNCj4gID4g
IH0NCj4gIA0KPiAgQ291bGQgdGhlIEFDUEkgcGVyc2lzdGVudCBwcmVzZW5jZSBBUk0gcmVxdWly
ZXMgYmUgYSBwcm9wZXJ0eSBvZiB0aGUgQUNQSQ0KPiAgZGV2aWNlPw0KDQoNCkkgdGhpbmsgaXQg
aXMgbW9yZSBvZiBhIENQVSBwcm9wZXJ0eSByYXRoZXIgdGhhbiBhIEdFRCBkZXZpY2U/IA0KDQoN
Cj4gIA0KPiAgVGhhbmtzLA0KPiAgTmljaw0K
