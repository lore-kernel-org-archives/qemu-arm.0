Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp100084njc;
        Wed, 19 Mar 2025 02:28:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpmiwzpj4/B3gVW+i27AXLB7U1cs6lEjwm8tFoqY1b/1Y8eDs9hlaeOVGPfKxnEKxvE2krMKSPBQ9Zcw==@linaro.org
X-Google-Smtp-Source: AGHT+IG/8YID05Jn2P3N5i8Bmz8KexSDIAk7MuznzzVQdapGQUkgzHmrMrWbG1uSygxe+Fb2tbkl
X-Received: by 2002:a05:600c:3490:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-43d4379395amr15923445e9.9.1742376527188;
        Wed, 19 Mar 2025 02:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742376527; cv=none;
        d=google.com; s=arc-20240605;
        b=Vtvhfu8cqhqt0pQWgvY6QCeGesV0Wj7WXURrwu5LNOsSJkFk/cEvHZGfTHwtI6CTUo
         t4CIcdOT+YSZUqLcJFqRDa3WfgDDEujNMBMzNrxNTLpNwexyvxS2zcbCuKlBtjw116Ta
         ixOJeQN0cJbC0wLW+F+QD5mOCDOlS6o7OTRn5uT2es6xONWWtEEnIKfbcy6RshBhB8J9
         ApsHSoD9kSpG/QDBpEKFuTTuJLPl63oC91X3pVaGkJQSmCZK5oMg0HixG6qNCHzAn6i4
         YHeJSCioH6Im9Td1kyHkZ7JjT5UaS07rBl1/d6Y0CFguWk3BCRy70M3GQLIKb/mzWzgt
         f/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=Dyk5aBN0Le6we/p/LbvKMJ034mI7YuXyx28VHTc8Mks=;
        fh=quQrI1lUC8hth4Aqp5X1SRQJYN3ZrDbIwl+kOHoTqkQ=;
        b=i4SmnIjs1QiG1+4Psmh0SO3AdOW/1QslPtMaub2fXNorM8nAy8MU0Z/Usa10OAiGyf
         Sa4MJAWFQWNlXarf/C3WCij4OtzXK0YMvMqLuRs3a4DFjPN22nCHMm1BzAmO0QH54and
         7X2UUG6MBATU1VvupVEvGgJhGtGlFY7dmY4bhPC0qCBmnVsKSCrZE5DcGChZHaBeyk0C
         PwXhd+91QRx376ezxo0aCVqVB98kVW9rSFwmFoptDE450+JgCgAXzXCv0dDT0Uex1n3c
         RBcp7LB8knx81pVORitTBDOYuGceeA28/BWVEALMovPJwhsJAoi+7UvCPyqCz1Na2Hpw
         u/4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-395c7ee9a1asi12437617f8f.16.2025.03.19.02.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 02:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tupj3-0000W7-Mr; Wed, 19 Mar 2025 05:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tupid-0000Ov-Fe; Wed, 19 Mar 2025 05:28:15 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tupiZ-0004rv-K1; Wed, 19 Mar 2025 05:28:11 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZHjwF2mjxz6LCdH;
 Wed, 19 Mar 2025 17:24:45 +0800 (CST)
Received: from frapeml100006.china.huawei.com (unknown [7.182.85.201])
 by mail.maildlp.com (Postfix) with ESMTPS id D2F0E14050C;
 Wed, 19 Mar 2025 17:28:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100006.china.huawei.com (7.182.85.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Mar 2025 10:28:03 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Wed, 19 Mar 2025 10:28:03 +0100
To: Donald Dutile <ddutile@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "nathanc@nvidia.com"
 <nathanc@nvidia.com>, "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH v2 04/20] hw/arm/virt: Add support for smmuv3-accel
Thread-Topic: [RFC PATCH v2 04/20] hw/arm/virt: Add support for smmuv3-accel
Thread-Index: AQHbko9X7BBFIVL5UECoP8opJSgSfrN5ejaAgADCxNA=
Date: Wed, 19 Mar 2025 09:28:02 +0000
Message-ID: <af88234294a04ca3bfa8a4fed99cca25@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-5-shameerali.kolothum.thodi@huawei.com>
 <82e44777-8f14-428c-9614-c521e4836fce@redhat.com>
In-Reply-To: <82e44777-8f14-428c-9614-c521e4836fce@redhat.com>
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
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1Lg6s9/qClT+

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG9uYWxkIER1dGlsZSA8
ZGR1dGlsZUByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAxOCwgMjAyNSAxMDo1
MCBQTQ0KPiBUbzogU2hhbWVlcmFsaSBLb2xvdGh1bSBUaG9kaQ0KPiA8c2hhbWVlcmFsaS5rb2xv
dGh1bS50aG9kaUBodWF3ZWkuY29tPjsgcWVtdS1hcm1Abm9uZ251Lm9yZzsNCj4gcWVtdS1kZXZl
bEBub25nbnUub3JnDQo+IENjOiBlcmljLmF1Z2VyQHJlZGhhdC5jb207IHBldGVyLm1heWRlbGxA
bGluYXJvLm9yZzsgamdnQG52aWRpYS5jb207DQo+IG5pY29saW5jQG52aWRpYS5jb207IGJlcnJh
bmdlQHJlZGhhdC5jb207IG5hdGhhbmNAbnZpZGlhLmNvbTsNCj4gbW9jaHNAbnZpZGlhLmNvbTsg
c21vc3RhZmFAZ29vZ2xlLmNvbTsgTGludXhhcm0NCj4gPGxpbnV4YXJtQGh1YXdlaS5jb20+OyBX
YW5nemhvdSAoQikgPHdhbmd6aG91MUBoaXNpbGljb24uY29tPjsNCj4gamlhbmdrdW5rdW4gPGpp
YW5na3Vua3VuQGh1YXdlaS5jb20+OyBKb25hdGhhbiBDYW1lcm9uDQo+IDxqb25hdGhhbi5jYW1l
cm9uQGh1YXdlaS5jb20+OyB6aGFuZ2ZlaS5nYW9AbGluYXJvLm9yZw0KPiBTdWJqZWN0OiBSZTog
W1JGQyBQQVRDSCB2MiAwNC8yMF0gaHcvYXJtL3ZpcnQ6IEFkZCBzdXBwb3J0IGZvciBzbW11djMt
DQo+IGFjY2VsDQo+IA0KPiANCj4gRG9lc24ndCB0aGlzIGNvbW1pdCBiZWNvbWUgbW9vdCwgaWYg
YWNjZWwgYmVjb21lcyBhbiBzbW11djMgb3B0aW9uIHZzDQo+IHNlcGFyYXRlIGRldmljZSBvYmpl
Y3QgYWx0b2dldGhlciwgZHluYW1pY2FsbHkgYWRkZWQgaWYgYSBwZGV2IGlzIGF0dGFjaGVkDQo+
IHRvIGEgaG9zdCBTTU1VdjMgdGhhdCBoYXMgYWNjZWwgZmVhdHVyZShzKT8NCj4gDQo+IEJsb2Nr
aW5nIHcvdmlydGlvLWlvbW11IGZhbGxzIHVuZGVyIHRoZSBzYW1lIHNpdHVhdGlvbiBtZW50aW9u
ZWQgaW4gMDMvMjANCj4gd3J0IG1peGluZyBlbXVsYXRlZCAmIHBoeXNpY2FsIGRldmljZXMgb24g
dGhlIHNhbWUgc21tdXYzLg0KDQpZZXMsIHRoaXMgcGF0Y2ggbWlnaHQgY2hhbmdlIG9uY2Ugd2Ug
bW92ZSB0byAiLWRldmljZSBzbW11djMsIGFjY2VsPW9uIiB2ZXJzaW9uLg0KDQpUaGFua3MsDQpT
aGFtZWVyDQo=
