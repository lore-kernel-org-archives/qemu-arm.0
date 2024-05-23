Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp949913ejb;
        Thu, 23 May 2024 03:01:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSng5n/h5B3Ts5DZK2eiJeIL5vGXQLD/AeMrin+L02EaWkaEXLAKsRyGm2R3UzgwYBFmvi1edh1n2eLbUbuhnHG/9Q31MY
X-Google-Smtp-Source: AGHT+IEWzOgYq29Io4kk+IHtlhBEasbH60BpBDTbgbBvHoKBVNte/PPPR+66a+TU5MtmGepWJiYs
X-Received: by 2002:a2e:9796:0:b0:2e7:bc7:b6ea with SMTP id 38308e7fff4ca-2e94948746bmr25886371fa.14.1716458469814;
        Thu, 23 May 2024 03:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716458469; cv=none;
        d=google.com; s=arc-20160816;
        b=KnJX2o1QfxNdJKCDK7BiHxeDJ3q0ayEI/OLqpWYGffsKobPWV4+mB7hGs2jvwH/Vg5
         Y6JguPEQjmBQUL3CnXWJMoZRN337Z/m0tr5hiCrsETBlqgf2Zqj9SsRebJnSC1QN3Opl
         Am6xee3kO9RO8nb7A9rrp1wSJ8edfyzcRFa7IDGHqA808zkP+ZxQwtZwipcgm0GrXiCs
         06iGrVrvaMyP3Fy0iPP9S4Hrbk6bele7GkzFG0EC55NT3NRXd+16Oie5Owt7O5SxcQ3l
         LD+1D/ytwgtQhZVBotDoD+phWsaq+QM2vs/UnSdz1CPLJEtGMq3dRqACSJRR8Uu7Uigq
         vkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=jj/201mjQXz6ezPIdER03xedHtgAJhIoEnAALPxdXRI=;
        fh=ovFBilhUm31sQrh9oC7ooTc9mVz4iodCuTnYiZDDjDA=;
        b=a9/9hhRJz09zcCI5bBdHJX4IVjFFBM6TydebiosOH2lnVphvvIFI/CpOu5Ba5jQDZW
         31lHGfaqXjCYYCwv7OMds2H7X6zMaaIjgw7Qa/qyJPqY0TX1yQ+6274UzRhKMHI29gh1
         4ylcTfdl6I9+UnfllpJSkvakdciqehZhKa3/sBFCyDyeruhnsmb/W7B/Q+K1p1GAkrS9
         9FQUt3E0ZATqWALQ2MgMmRZN1meV+piCf3Vg0L2v9E9txlODbHyOJJHpQGOBxJTOGd4X
         HNrmIJi0YsBXhb80oJ22HU35AaFm5J78f8SkmSaxODGceWMN/EHSnxRWWgndMh6GGZG4
         PKLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42100ee8048si8697965e9.34.2024.05.23.03.01.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2024 03:01:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VlNrB2QXVz67lTC;
	Thu, 23 May 2024 17:57:14 +0800 (CST)
Received: from lhrpeml100001.china.huawei.com (unknown [7.191.160.183])
	by mail.maildlp.com (Postfix) with ESMTPS id A8FA61400CA;
	Thu, 23 May 2024 18:01:08 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100001.china.huawei.com (7.191.160.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 11:01:08 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Thu, 23 May 2024 11:01:08 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, "qemu-devel@nongnu.org"
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
	"npiggin@gmail.com" <npiggin@gmail.com>, Linuxarm <linuxarm@huawei.com>,
	Shaoqin Huang <shahuang@redhat.com>
Subject: RE: [PATCH V11 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Topic: [PATCH V11 1/8] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Index: AQHarIy1xqvYHVQ4NECnyJL8JKGWMLGkVUEAgABBiDA=
Date: Thu, 23 May 2024 10:01:08 +0000
Message-ID: <97e51bc928ad470180c836ce60ae14fe@huawei.com>
References: <20240522211111.232114-1-salil.mehta@huawei.com>
 <20240522211111.232114-2-salil.mehta@huawei.com>
 <a5f3d78e-cfed-441f-9c56-e3e78fa5edee@linux.ibm.com>
In-Reply-To: <a5f3d78e-cfed-441f-9c56-e3e78fa5edee@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.156.123]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: 66Ck08umneLh

PiAgRnJvbTogSGFyc2ggUHJhdGVlayBCb3JhIDxoYXJzaHBiQGxpbnV4LmlibS5jb20+DQo+ICBT
ZW50OiBUaHVyc2RheSwgTWF5IDIzLCAyMDI0IDg6MDUgQU0NCj4gIA0KPiAgSGkgU2FsaWwsDQo+
ICANCj4gIE9uIDUvMjMvMjQgMDI6NDEsIFNhbGlsIE1laHRhIHdyb3RlOg0KPiAgPiArdm9pZCBr
dm1fcGFya192Y3B1KENQVVN0YXRlICpjcHUpOw0KPiAgPiArDQo+ICA+ICsvKioNCj4gID4gKyAq
IGt2bV91bnBhcmtfdmNwdSAtIHVucGFyayBRRU1VIEtWTSB2Q1BVIGNvbnRleHQNCj4gID4gKyAq
IEBzOiBLVk0gU3RhdGUNCj4gID4gKyAqIEBjcHU6IEFyY2hpdGVjdHVyZSB2Q1BVIElEIG9mIHRo
ZSBwYXJrZWQgdkNQVQ0KPiAgDQo+ICBzL0BjcHUvQHZjcHVpZCA/DQoNCg0KVGhhbmtzLiBXaWxs
IGZpeCB0aGlzLg0KDQpDaGVlcnMNClNhbGlsLg0KDQoNCj4gIA0KPiAgVGhhbmtzDQo+ICBIYXJz
aA0KPiAgPiArICoNCj4gID4gKyAqIEByZXR1cm5zOiBLVk0gZmQNCj4gID4gKyAqLw0KPiAgPiAr
aW50IGt2bV91bnBhcmtfdmNwdShLVk1TdGF0ZSAqcywgdW5zaWduZWQgbG9uZyB2Y3B1X2lkKTsN
Cj4gID4gICAjZW5kaWYgLyogS1ZNX0NQVVNfSCAqLw0K
