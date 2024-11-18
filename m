Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2515677njc;
        Mon, 18 Nov 2024 03:45:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8ubUDddTt3vm9/MOL8AXtSlBcmjEVnav5A2m7NrUlleCsm2Tast8NhX5euumIC+NJ8ZdpVzIDPX6PKw==@linaro.org
X-Google-Smtp-Source: AGHT+IGUK2g1UTbcv9bdFYqzsuL7/DU6rMdb4F2lXyDuowh1teAY4HLgmnC5aaj7uq+c5aHkHAAX
X-Received: by 2002:a05:620a:29d2:b0:7b1:48d2:f174 with SMTP id af79cd13be357-7b3622dd50emr1192438685a.34.1731930306850;
        Mon, 18 Nov 2024 03:45:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731930306; cv=none;
        d=google.com; s=arc-20240605;
        b=axFUz5RXyaIxLsdkXArMfx2GBHOmDdp1B2Nddyn28zf6u5gtn+GLz1Kx7MVyxN4p87
         PDGFgbXVf+fzEe+1UzEo2bh6+FrrkjZFHHs4tFKpvIsc8vv+lHim9fkSi4Zb6x/JylMz
         Xw6/rsWomry18isPcpK5i/Rl7es0APLG5LVd4UTnuz/YW1QJsY8TCVeXDjxulmsIOaAh
         60sEIWIeI2Qz22VNwSzHhrpfuda5fnVmcMvV6uzKUtcK+VaVJRUFM1p10+Sc0NVMjrxb
         5DKs39Wd3uoOTlV1UlwoSUyPR5Hb5cv2o87WmFDyTz2PxxyaJEHtbAzRVo9zI10P00ym
         LnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=0OjRi5U7U5TYT+3NpZMHKwXFYAww4ThgQmEbHOuCe3U=;
        fh=9DqYCFHKnmQ5+VgCN0UIIIa1J2fwcFK/sgrwSCMoxxU=;
        b=TF8xlFVT2PuTCwJq4dVZxRHLcRAIR9c9OHqP+ztE8fOxi5taqdQmmHv6P5IuYbK6xF
         B32tr3l3kmP8bxHd+/nQ0yLT5xvKNLaVjZ0JACI37AAQbBbUWan9kSL00S9RSGwL9EJi
         9Uy8jKTaIECYl2extQnFiBvfVGyJS6cBrBbBb9dBMHAJqf0034JExfylVHFGmh4IsVFN
         RjMdXlaEs0bf0rjZzea89cK1YsF6okY2Ht3OOgEtN0MZ0Lm6cnqGPWPhJYOhm2zFYkSk
         NO3Sj8kw/kz7FWDZCfxT8oYUYeRHHUD62sgoCYAZmA8m46i1iBHFsgMw5u6VLS1p0uLo
         PgwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4635aaeaa8dsi108721451cf.374.2024.11.18.03.45.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 03:45:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tD0Bh-0005xR-3t; Mon, 18 Nov 2024 06:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tD0Be-0005wr-1u; Mon, 18 Nov 2024 06:44:59 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tD0Bb-0003CL-PC; Mon, 18 Nov 2024 06:44:57 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XsQlH0VqBz6LD8Y;
 Mon, 18 Nov 2024 19:44:27 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
 by mail.maildlp.com (Postfix) with ESMTPS id 717651403A1;
 Mon, 18 Nov 2024 19:44:46 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500005.china.huawei.com (7.182.85.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 12:44:46 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 18 Nov 2024 12:44:46 +0100
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH 4/5] hw/arm/virt-acpi-build: Build IORT with multiple
 SMMU nodes
Thread-Topic: [RFC PATCH 4/5] hw/arm/virt-acpi-build: Build IORT with multiple
 SMMU nodes
Thread-Index: AQHbMd3CYnIzOIz3QUan4PDL8HOdprK8zVGAgAAjLhA=
Date: Mon, 18 Nov 2024 11:44:46 +0000
Message-ID: <efb9fb7fb0f04d92b7776cdbc474585d@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-5-shameerali.kolothum.thodi@huawei.com>
 <1dcea5ca-806f-4f51-8b13-faf5d62eb086@redhat.com>
In-Reply-To: <1dcea5ca-806f-4f51-8b13-faf5d62eb086@redhat.com>
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
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
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
X-TUID: dyn42yr8enRx

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXJpYyBBdWdlciA8ZXJp
Yy5hdWdlckByZWRoYXQuY29tPg0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDE4LCAyMDI0IDEw
OjAyIEFNDQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpDQo+IDxzaGFtZWVyYWxpLmtv
bG90aHVtLnRob2RpQGh1YXdlaS5jb20+OyBxZW11LWFybUBub25nbnUub3JnOw0KPiBxZW11LWRl
dmVsQG5vbmdudS5vcmcNCj4gQ2M6IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgamdnQG52aWRp
YS5jb207IG5pY29saW5jQG52aWRpYS5jb207DQo+IGRkdXRpbGVAcmVkaGF0LmNvbTsgTGludXhh
cm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+OyBXYW5nemhvdSAoQikNCj4gPHdhbmd6aG91MUBoaXNp
bGljb24uY29tPjsgamlhbmdrdW5rdW4gPGppYW5na3Vua3VuQGh1YXdlaS5jb20+Ow0KPiBKb25h
dGhhbiBDYW1lcm9uIDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+Ow0KPiB6aGFuZ2ZlaS5n
YW9AbGluYXJvLm9yZw0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCA0LzVdIGh3L2FybS92aXJ0
LWFjcGktYnVpbGQ6IEJ1aWxkIElPUlQgd2l0aA0KPiBtdWx0aXBsZSBTTU1VIG5vZGVzDQo+IA0K
DQo+ID4gICAgICAvKiBOdW1iZXIgb2YgSU9SVCBOb2RlcyAqLw0KPiA+IEBAIC0zNDIsMTAgKzM1
Niw5IEBAIGJ1aWxkX2lvcnQoR0FycmF5ICp0YWJsZV9kYXRhLCBCSU9TTGlua2VyDQo+ICpsaW5r
ZXIsIFZpcnRNYWNoaW5lU3RhdGUgKnZtcykNCj4gPiAgICAgIC8qIEdJQyBJVFMgSWRlbnRpZmll
ciBBcnJheSAqLw0KPiA+ICAgICAgYnVpbGRfYXBwZW5kX2ludF9ub3ByZWZpeCh0YWJsZV9kYXRh
LCAwIC8qIE1BRFQgdHJhbnNsYXRpb25faWQgKi8sDQo+IDQpOw0KPiA+DQo+ID4gLSAgICBpZiAo
dm1zLT5pb21tdSA9PSBWSVJUX0lPTU1VX1NNTVVWMykgew0KPiA+IC0gICAgICAgIGludCBpcnEg
PSAgdm1zLT5pcnFtYXBbVklSVF9TTU1VXSArIEFSTV9TUElfQkFTRTsNCj4gPiArICAgIGZvciAo
aSA9IDA7IGkgPCBudW1fc21tdXM7IGkrKykgew0KPiA+ICsgICAgICAgIHNtbXVfb2Zmc2V0W2ld
ID0gdGFibGVfZGF0YS0+bGVuIC0gdGFibGUudGFibGVfb2Zmc2V0Ow0KPiA+DQo+IEkgd291bGQg
aGF2ZSBleHBlY3RlZCBjaGFuZ2VzIGluIHRoZSBzbW11IGlkbWFwIGhhcyB3ZWxsLiBJZiBhIGdp
dmVuDQo+IFNNTVUgaW5zdGFuY2Ugbm93IHByb3RlY3RzIGEgZ2l2ZW4gYnVzIGhpZXJhcmNoeSBz
aG91bGRuJ3QgaXQgYmUNCj4gcmVmbGVjdGVkIGluIGEgZGlmZmVyZW50aWF0ZWQgU01NVSBpZG1h
cCBmb3IgZWFjaCBvZiB0aGVtIChSSUQgc3Vic2V0IG9mDQo+IFNNTVUtPnBjaS1idXMgbWFwcGlu
ZyB0byBhIHNwZWNpZmljIElPUlQgU01NVSBub2RlKT8gSG93IGlzIGl0IGRvbmUNCj4gY3VycmVu
dGx5Pw0KDQpJIHRob3VnaHQgdGhhdCBzbW11X2lkbWFwcyB3aWxsIGJlIGhhbmRsZWQgYnkgdGhp
cyA/DQoNCm9iamVjdF9jaGlsZF9mb3JlYWNoX3JlY3Vyc2l2ZShvYmplY3RfZ2V0X3Jvb3QoKSwN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlvcnRfaG9zdF9icmlkZ2Vz
LCBzbW11X2lkbWFwcyk7DQoNCkJ1dCBpdCBpcyBwb3NzaWJsZSB0aGF0LCB0aGVyZSBpcyBhIGJ1
ZyBpbiB0aGlzIElPUlQgZ2VuZXJhdGlvbiBoZXJlIGFzIEkgYW0gbm90DQphYmxlIHRvIGhvdCBh
ZGQgIGRldmljZXMuIEl0IGxvb2tzIGxpa2UgdGhlIHBjaWVocCBpbnRlcnJ1cHQgaXMgbm90IGdl
bmVyYXRlZC9yZWNlaXZlZA0KZm9yIHNvbWUgcmVhc29uLiBOaWNvbGluWzBdIGlzIHN1c3BlY3Rp
bmcgdGhlIG1pbi9tYXggYnVzIHJhbmdlIGluDQppb3J0X2hvc3RfYnJpZGdlcygpIG1heSBub3Qg
bGVhdmUgZW5vdWdoIHJhbmdlcyBmb3IgaG90IGFkZCBsYXRlci4NCg0KQ29sZCBwbHVnZ2luZyBk
ZXZpY2VzIHRvIGRpZmZlcmVudCBTTU1VdjMvcGNpZS1weGIgc2VlbXMgdG8gYmUgYWxyaWdodC4N
Cg0KSSB3aWxsIGRlYnVnIHRoYXQgc29vbi4NCg0KVGhhbmtzLA0KU2hhbWVlcg0KWzBdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvWnpQZDFGJTJGVUEyTUtNYndsQEFzdXJhZGEt
TnZpZGlhLw0KDQoNCg==
