Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp784559njc;
        Thu, 13 Mar 2025 01:26:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUlkTQz8JBHXjqLVFhkO3eLfFEe/lm45K4SppYCZj4To2BQbrP301+PKwMZLvC6AvMRV5C0vCN7Htb/Sg==@linaro.org
X-Google-Smtp-Source: AGHT+IHxGAW4N2/4M5+lEvzRdu/74ZpqONpL9cWu6Z3n4jZgcBcM7kBvloFLbv02VKiUBk1i8y7C
X-Received: by 2002:a05:620a:4381:b0:7c5:6742:764b with SMTP id af79cd13be357-7c567427b5dmr1252377985a.31.1741854418887;
        Thu, 13 Mar 2025 01:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741854418; cv=none;
        d=google.com; s=arc-20240605;
        b=k/jl5BaWrpK862KGzMP7EXFdkR+HYJC5SmYUJ1ZjTiaSupOlV2Hu7u4aXOSwUt37op
         yl0q7gvS4JULhYeB00t8K0cqjVttHRhmAsN71pAsj0HrtiWXdfiV5hAPQ6G7EYx6R5rF
         Xc8Lz6iAIfQWN+vRmxW6oebbICss5zzRDNNPoxuPmf2EE+ONFF8MmnxvVSKytt4Ja0Ei
         JM8uttbnba9TbrhnULbqNYwrNCfJdKzz42+Ge4HHNQpGc+9Hjetb60qCXMQaiyHec8iX
         bb0iQdzxLshRpAYvF7cjKfPi4EEsMOWT9h3yLgyGR1VekQbCbbzIsqr62gnTLtHi2SUw
         h57A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=stG+7rjOuZhUdGJg+fJ1DrN9Oz5GZ3aEYlII+v21hY4=;
        fh=O6X2BWEQtTCF1UGIaMMuTYtr58ukGNU/CQyZ48iW9Cs=;
        b=eug+JTRcioBwEqlITWXHv2wGC8WbrqzV6yGXXL5X98ifid0CmukxTbITagEIemwsc7
         B3/Uage2zsblSlfqHijAq/peELyAmbYQ2OsxPabvl/Hjrkikcz+bhEpm/HpQ9/0BnVQi
         rTJDBoF88yfLdqDSExkZAv3XnnNGS9cs1AOG8IEsXYHpvtOHGN/QMf8b6meV9n4Thwu5
         s/Z+T7gpQRLYWjA8dge9ptd4q9Bkg1zCkBJgBktBLVj0vL99WC85ZQ451bvJ+1mblyFr
         2aij448dVwvxliM1L6oc/tcsOdn55XwUUJpPmCM0qSt911A7IapY3BS9dyM/UHWhuGvJ
         0mqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573cac738si123763885a.296.2025.03.13.01.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Mar 2025 01:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tsdtl-0000YC-Jv; Thu, 13 Mar 2025 04:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tsdtj-0000Xq-Mx; Thu, 13 Mar 2025 04:26:35 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tsdth-0002jM-JM; Thu, 13 Mar 2025 04:26:35 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZD0pX1Rrcz67Y2h;
 Thu, 13 Mar 2025 16:21:56 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
 by mail.maildlp.com (Postfix) with ESMTPS id 5D05E140CB1;
 Thu, 13 Mar 2025 16:26:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500005.china.huawei.com (7.182.85.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Mar 2025 09:26:27 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 13 Mar 2025 09:26:27 +0100
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, "smostafa@google.com"
 <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, "zhangfei.gao@linaro.org"
 <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH v2 04/20] hw/arm/virt: Add support for smmuv3-accel
Thread-Topic: [RFC PATCH v2 04/20] hw/arm/virt: Add support for smmuv3-accel
Thread-Index: AQHbko9X7BBFIVL5UECoP8opJSgSfrNvkyYAgAAR74D///hiAIAAEm+A///xm4CAACG5AIAAAI4AgAD5XnA=
Date: Thu, 13 Mar 2025 08:26:27 +0000
Message-ID: <f4381814d71841a185ced57dfc4f4c62@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-5-shameerali.kolothum.thodi@huawei.com>
 <547f961e-380c-4ffe-8b8b-3e9d543aa702@redhat.com>
 <58c9c37876c64584b0c7961ec61696a3@huawei.com>
 <5b29ea01-1b86-4b48-a769-14986751a0f1@redhat.com>
 <5d894a546d3f4081ac2cfe98bd2ea612@huawei.com>
 <fb28c228-0c78-4412-ba91-a62cb4351793@redhat.com>
 <8490942b9428411e858a62a80ea12530@huawei.com>
 <df336b78-5a0f-450a-8d3c-95326f5eb9a0@redhat.com>
In-Reply-To: <df336b78-5a0f-450a-8d3c-95326f5eb9a0@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9VqHGyWl+gSI

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFcmljIEF1
Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMTIs
IDIwMjUgNjozMSBQTQ0KPiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaQ0KPiA8c2hhbWVl
cmFsaS5rb2xvdGh1bS50aG9kaUBodWF3ZWkuY29tPjsgcWVtdS1hcm1Abm9uZ251Lm9yZzsNCj4g
cWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc7IGpn
Z0BudmlkaWEuY29tOyBuaWNvbGluY0BudmlkaWEuY29tOw0KPiBkZHV0aWxlQHJlZGhhdC5jb207
IGJlcnJhbmdlQHJlZGhhdC5jb207IG5hdGhhbmNAbnZpZGlhLmNvbTsNCj4gbW9jaHNAbnZpZGlh
LmNvbTsgc21vc3RhZmFAZ29vZ2xlLmNvbTsgTGludXhhcm0NCj4gPGxpbnV4YXJtQGh1YXdlaS5j
b20+OyBXYW5nemhvdSAoQikgPHdhbmd6aG91MUBoaXNpbGljb24uY29tPjsNCj4gamlhbmdrdW5r
dW4gPGppYW5na3Vua3VuQGh1YXdlaS5jb20+OyBKb25hdGhhbiBDYW1lcm9uDQo+IDxqb25hdGhh
bi5jYW1lcm9uQGh1YXdlaS5jb20+OyB6aGFuZ2ZlaS5nYW9AbGluYXJvLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1JGQyBQQVRDSCB2MiAwNC8yMF0gaHcvYXJtL3ZpcnQ6IEFkZCBzdXBwb3J0IGZvciBz
bW11djMtDQo+IGFjY2VsDQo+IA0KPiBIaSBTaGFtZWVyLA0KPiANCj4gDQo+ID4+Pj4+IFRoYW5r
cyBmb3IgdGFraW5nIGEgbG9vay4gSSBhbSBqdXN0IGp1bXBpbmcgb24gdGhpcyBvbmUgZm9yIG5v
dy4NCj4gPj4+Pj4gWWVzLCB0aGVyZSB3ZXJlIGRpc2N1c3Npb25zIGFyb3VuZCB0aGF0LiBCdXQg
SSB3YXMgbm90IHN1cmUgd2UNCj4gPj4+Pj4gY29uY2x1ZGVkIG9uIGRlcHJlY2F0aW5nIHRoZSBt
YWNoaW5lIG9wdGlvbi4gU28gaWYgSSBnZXQgeW91DQo+ID4+Pj4+IGNvcnJlY3RseSB0aGUgaWRl
YSBpcywNCj4gPj4+Pj4NCj4gPj4+Pj4gaWYgd2UgaGF2ZSwNCj4gPj4+Pj4gLWRldmljZSBzbW11
djMgaXQgd2lsbCBpbnN0YW50aWF0ZSB0aGUgY3VycmVudCBtYWNoaW5lIHdpZGUgc21tdXYzDQo+
ID4+Pj4+IGFuZCBmb3IgLWRldmljZSBzbW11djMsYWNjZWwgdGhpcyBkZXZpY2U/DQo+ID4+Pj4g
eWVzIHRoYXQgd291bGQgYmUgbXkgcHJlZmVyZW5jZS4NCj4gPj4+IE9rLiBJIHdpbGwgbG9vayBp
bnRvIHRoYXQgaW4gbXkgbmV4dCByZXNwaW4uIEEgcXVpY2sgcXVlc3Rpb24uIERvZXMNCj4gPj4+
IHFlbXUgREVWSUNFIG1vZGVsIHN1cHBvcnQgdGhlIGRpZmZlcmVudGlhdGlvbiBsaWtlIGFib3Zl
IGVhc2lseT8gT3INCj4gd2UNCj4gPj4+IGhhdmUgdG8gbWFuYWdlIGl0IHdpdGggcHJvcGVydGll
cz8NCj4gPj4gTm90IHN1cmUgaWYgSSB1bmRlcnN0YW5kIHlvdSBxdWVzdGlvbi4gSSBtZWFudCBp
dCBjYW4gYmUgYSBib29sZWFuDQo+IGRldmljZQ0KPiA+PiBwcm9wZXJ0eSAoREVGSU5FX1BST1Bf
Qk9PTCkgc21tdXYzLGFjY2VsPW9uDQo+ID4+DQo+ID4+IE5vPw0KPiA+IFJpZ2h0LiBNeSBxdWVy
eSB3YXMgbW9yZSBhYm91dCBhbnkgaGlkZGVuIFFlbXUgbWFnaWMgdG8gaGF2ZSBkZXZpY2UNCj4g
aW5zdGFudGlhdGlvbg0KPiA+IHNpbWlsYXIgdG8gd2hhdCB3ZSBoYXZlIGF0IHRoZSBtb21lbnQg
ZXZlbiB0aG91Z2ggd2UgbmFtZSBib3RoDQo+IGRldmljZXMgInNtbXV2MyIuDQo+ID4NCj4gPiBU
aGF0IHdheSBJIGNhbiBrZWVwIG11Y2ggb2YgdGhlIGNvZGUgcmF0aGVyIHRoYW4gY2hlY2tpbmcg
ImFjY2VsIg0KPiBwcm9wZXJ0eQ0KPiA+IGluIFNNTVV2MyBjb2RlIGFuZCByZWRpcmVjdGluZyBj
YWxscy4gQnV0IGxvb2tzIGxpa2Ugbm90Lg0KPiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGFueSBz
dWNoIGEgdHJpY2suDQo+IA0KPiBIYXZpbmcgdGhlIGxlZ2FjeSBkZXZpY2UgKHdpdGhvdXQgYWNj
ZWwpIG9ubHkgaW5zdGFudGlhYmxlIHdpdGggdGhlIHZpcnQNCj4gbWFjaGluZSBvcHRpb24gYW5k
IHRoZSBuZXcgYWNjZWxlcmF0ZWQgb25lIG9ubHkgaW5zdGFudGlhYmxlIHdpdGggYQ0KPiAtZGV2
aWNlIG9wdGlvbiBsb29rcyBzdHJhbmdlIHRvIG1lLiBCeSB0aGUgd2F5IHRoZXkgbW9kZWwgdGhl
IHNhbWUNCj4gZGV2aWNlIHNvIEkgdGhpbmsgaXQgbWFrZXMgbW9yZSBzZW5zZSB0byB1c2UgdGhl
IHNhbWUgZGV2aWNlIHdpdGggYW4NCj4gb3B0aW9uLg0KDQpPay4gV2lsbCBhZGRyZXNzIHRoYXQg
aW4gdGhlIG5leHQgcmVzcGluLg0KDQo+IEFsc28gZG8geW91IHNlZSBhbnl0aGluZyB0aGF0IHdv
dWxkIHByZXZlbnQgdGhlIGFjY2VsZXJhdGlvbiBlbmhhbmNlZA0KPiBkZXZpY2UgZnJvbSBiZWlu
ZyBhYmxlIHRvIHRyYW5zbGF0ZSBlbXVsYXRlZCBkZXZpY2VzIGFzIHdlbGwuIElkZWFsbHkNCj4g
dGhlIHNtbXUgZGV2aWNlIHNob3VsZCByZWFjdCBkaWZmZXJlbnRseSBkZXBlbmRpbmcgb24gdGhl
IGRldmljZSB3aGljaA0KPiBpcyB0cmFuc2xhdGVkLiBJIHRoaW5rIGl0IHdvcmtlZCB3aXRoIHRo
ZSBvcmlnaW5hbCBpbXBsZW1lbnRhdGlvbiBhcyBmYXINCj4gYXMgSSByZW1lbWJlci4NCg0KWWVz
LCBzbW11djMtYWNjZWwgd29ya3Mgd2l0aCBlbXVsYXRlZCBkZXZpY2VzIGFzIHdlbGwuIEN1cnJl
bnRseSB0aGUgb25seQ0KbGltaXRhdGlvbiBpcywgd2Ugc2hvdWxkIGhhdmUgYXQgbGVhc3Qgb25l
IHZmaS1wY2kgZGV2IGNvbGQgcGx1Z2dlZCBhcyBtZW50aW9uZWQNCmluIHRoZSBjb3ZlciBsZXR0
ZXIuIEhvcGVmdWxseSB3ZSB3aWxsIGJlIGFibGUgdG8gcmVzb2x2ZSB0aGF0IHJlc3RyaWN0aW9u
IHNvb24uDQoNClRoYW5rcywNClNoYW1lZXINCg0K
