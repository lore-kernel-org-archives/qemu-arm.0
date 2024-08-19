Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp2059106njf;
        Mon, 19 Aug 2024 05:59:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5jQctNsdXEDy9EXlXi6RJTZL0zMv/VIEgKum6DIOUjiFeynTWNAt9DL/6fBZSNNRdsmBil5Q+1R7bfzbOdWPp79cp7c5w
X-Google-Smtp-Source: AGHT+IFGIcxALyuE/Qj3bGB6ma7Y0cdpVY2YjrTqglPEIX3xID9T/1ZWCeCSBxwi1VgB2tx/Ctb0
X-Received: by 2002:ad4:5894:0:b0:6bf:7ae1:9a8f with SMTP id 6a1803df08f44-6bf7ae19b89mr171801986d6.19.1724072389524;
        Mon, 19 Aug 2024 05:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724072387; cv=none;
        d=google.com; s=arc-20160816;
        b=OfDWt8MbOvyEmXfvR8YRmWPWOZAZ/c6dHbVZP6hTzyZwS7Bkp/u25x5v4fqnQV0se5
         xv9pC+W9nM2oQqdvEu58uRuWvHPMEG0B35gLnDB7rTQMRZnv/pwlaRLJI/K/9xDJJ+G2
         NgdnR0U4WqOVBg1qS+YtPYN74aywumXxDGOfWvoreiPzM+6XawvgnBcyUiTOqlbYwS00
         O04rC2I+n2jKFksstKYRFPgZYeSGQqLn0n+Zo1u3x8MfzTUSP8PzuANH5XoXyJ+QunpC
         eqZCEzLMN/huv6wEsdkVeEGHNtgl2VA95dVa0yFUyguFp4OfVgfbh02mfyv3R5wozEsG
         fXcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=dXcmYJ1Ud2gg7DI9kLxtcV64oSabFMi9OonSaz8HxVY=;
        fh=iwz5zzZl5kqbGUPc+7neqYAiJxC5LBdxf4wiB2I9RHw=;
        b=d852UuvTyuShOnQ1MHKLxNHcQ0YsNSodq2mwjKde/zySJPwb6TmU1sofqJVQiJHpmD
         muDbpkWOWdgL25VJGG4vycoKlacXRxkBIPyo0istcC00ecey7Xe6ViJS5VDdT/np/adU
         f8Bo6O7vK2vjCCfCElZ4LUfVG7D3fG+bORjFAQJoXLkRD4hRz2XljPhFZFyQTgMjXS6P
         Aw2JhmmQqBbS/Y/FJg2VuK/q3J3kwU+7D98q9Tb5Zg59xLugxJGCvP61sfSlo4cLlbyZ
         FQdgiD0hMvIipTaDDqrSRKbryyozK0JHBwpQS8bVxadmzihwQJmG5y6fEIzHr45eocZc
         KIvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bf6ff28dc0si101826976d6.545.2024.08.19.05.59.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2024 05:59:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WnXfc1NJkz6LDKS;
	Mon, 19 Aug 2024 20:56:40 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C552140CB1;
	Mon, 19 Aug 2024 20:59:43 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 13:59:42 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Mon, 19 Aug 2024 13:59:42 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>, "maz@kernel.org"
	<maz@kernel.org>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "karl.heubaum@oracle.com"
	<karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "shahuang@redhat.com"
	<shahuang@redhat.com>, "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm
	<linuxarm@huawei.com>
Subject: RE: [PATCH RFC V3 24/29] target/arm: Add support of *unrealize*
 ARMCPU during vCPU Hot-unplug
Thread-Topic: [PATCH RFC V3 24/29] target/arm: Add support of *unrealize*
 ARMCPU during vCPU Hot-unplug
Thread-Index: AQHavev6H7OxF7zZK02qabf2MUOdZrIqaJGS///y5oCAABNygIAEhE9Q
Date: Mon, 19 Aug 2024 12:59:42 +0000
Message-ID: <8cfd576d650c43128e9f1015827ab66a@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-25-salil.mehta@huawei.com>
 <87v800wkb1.fsf@draig.linaro.org>
 <CAFEAcA9A9Oq0nURkiLNWZNC=P7KQGyr8TjjfOmEq+squwF+xog@mail.gmail.com>
 <CAFEAcA99RF2tY-9DfhdkCxrR=ayEjJYKEQ4xZSn3BBrXdOjU_Q@mail.gmail.com>
In-Reply-To: <CAFEAcA99RF2tY-9DfhdkCxrR=ayEjJYKEQ4xZSn3BBrXdOjU_Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.151.47]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TUID: d9TiCXNyH9oX

PiAgRnJvbTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiAgU2Vu
dDogRnJpZGF5LCBBdWd1c3QgMTYsIDIwMjQgNjowMCBQTQ0KPiAgVG86IEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gIA0KPiAgT24gRnJpLCAxNiBBdWcgMjAyNCBhdCAx
Njo1MCwgUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPg0KPiAgd3JvdGU6
DQo+ICA+IFdlIHNob3VsZG4ndCBuZWVkIHRvIGV4cGxpY2l0bHkgY2FsbCBjcHVfYWRkcmVzc19z
cGFjZV9kZXN0cm95KCkgZnJvbQ0KPiAgPiBhIHRhcmdldC1zcGVjaWZpYyB1bnJlYWxpemUgYW55
d2F5OiB3ZSBjYW4gZG8gaXQgYWxsIGZyb20gdGhlIGJhc2UNCj4gID4gY2xhc3MgKGFuZCBJIHRo
aW5rIHRoaXMgd291bGQgZml4IHNvbWUgbGVha3MgaW4gY3VycmVudCBjb2RlIGZvcg0KPiAgPiB0
YXJnZXRzIHRoYXQgaG90LXVucGx1ZywgdGhvdWdoIEkgc2hvdWxkIGNoZWNrIHRoYXQpLiBPdGhl
cndpc2UgeW91DQo+ICA+IG5lZWQgdG8gZHVwbGljYXRlIGFsbCB0aGUgbG9naWMgZm9yIGZpZ3Vy
aW5nIG91dCB3aGljaCBhZGRyZXNzIHNwYWNlcw0KPiAgPiB3ZSBjcmVhdGVkIGluIHJlYWxpemUs
IHdoaWNoIGlzIGZyYWdpbGUgYW5kIG5vdCBuZWNlc3Nhcnkgd2hlbiBhbGwgd2UNCj4gID4gd2Fu
dCB0byBkbyBpcyAiZGVsZXRlIGV2ZXJ5IGFkZHJlc3Mgc3BhY2UgdGhlIENQVSBvYmplY3QgaGFz
Ig0KPiAgPiBhbmQgd2Ugd2FudCB0byBkbyB0aGF0IGZvciBldmVyeSB0YXJnZXQgYXJjaGl0ZWN0
dXJlIGFsd2F5cy4NCj4gIA0KPiAgSSBoYXZlIGEgcGF0Y2ggdG8gZG8gdGhpcyBub3csIGJ1dCBJ
IG5lZWQgdG8gdGVzdCBpdCBhIGJpdCBtb3JlIGFuZCBjb25maXJtIChvcg0KPiAgZGlzcHJvdmUp
IG15IGh5cG90aGVzaXMgdGhhdCB3ZSdyZSBjdXJyZW50bHkgbGVha2luZyBtZW1vcnkgb24gZXhp
c3RpbmcNCj4gIGFyY2hpdGVjdHVyZXMgd2l0aCB2Q1BVIGhvdC11bnBsdWcgYmVmb3JlIEkgc2Vu
ZCBpdCBvdXQuDQoNCkkgdGhpbmsgeW91IGFyZSByZWZlcnJpbmcgdG8gdGhpcyBwYXRjaD8NCg0K
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1kZXZlbC8yMDIzMDkxODE2MDI1Ny4zMDEyNy05
LXBoaWxtZEBsaW5hcm8ub3JnLw0KDQoNCj4gIA0KPiAgLS0gUE1NDQo=
