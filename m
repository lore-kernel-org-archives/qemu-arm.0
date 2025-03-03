Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2686296njb;
        Mon, 3 Mar 2025 07:23:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXsCf0PbIPnKraDFLttAERsetTZ9E4ny4Sbl3oGDCsLxGx/6qCQNWfe3u5OpatYMAYoR3z4OFtsUVRow==@linaro.org
X-Google-Smtp-Source: AGHT+IGAdirE2enlF8/F7gQptMbDrWj1+C2lYz75VesJoJPZ8B8hDq0+720q+mFZpsP1UytKyVYJ
X-Received: by 2002:a05:620a:4088:b0:7c0:bc63:7b76 with SMTP id af79cd13be357-7c39c64d631mr2453592685a.36.1741015385382;
        Mon, 03 Mar 2025 07:23:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741015385; cv=none;
        d=google.com; s=arc-20240605;
        b=f88/HaxfcSSOc5JnY4bKCow2ruCnm5fq7+JgWHJ0A6tBToaJ7W+bMP71WBvlsuOINd
         p2RorUQLGVKJ148gGvh59zmNj2Dsp/qDYVQdtO/LUDCCeqwpWl3QPiaFCRN4ci9WyiBQ
         MpUDVrCNzr/IoRZwgq1y2qO8CqQXcPEp/jYJkS4vF98C7yd0k9B63R7lr2+CbhjlaoSZ
         sXgIvcqrC6NNmGX7cE6GseZ6/UFEqk0wW0TwGbjQ8xS3gAmORNBmktmknCVV9l//MzwL
         wDT4MpVAnWbJ2DXsbmlxiGmPSBla6Mdr9ctZqvJBqTIZ4IZu7C13V5ZXnirFkDm9HDgf
         nCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=fSB1UloIy/RWky7ZhqgBESntYsX1eXW1zQ28ZxznUto=;
        fh=4YOhO6KN08aRrdiU784eUvNkbTs/LxF3rH+Mj/SWrwc=;
        b=j0ADAkvAtQ6JE8Ffj6K7A3bYTEQzoqGARKtLaURKia4wt5D0B4DKMPIQJmU2JlS7G2
         U72CFmmUGicklV7Q08eU5tzaA5EHRm0c3sq3OGy/hEFAgQx4GbH0zajHriCQKqMuUkzr
         Zp84NgYMl8m4ZyUgeJvEOsosHxgtHwljr8sOff/mckBlgAQwnX3HGQu+btiqacUUu8fD
         IkfvZ1nwABQodr0mvtxA+J+yx0sX76y6O9bBqnTIbF0oCk2rd4wWADBYiCIm+9BQV9lO
         uUHFp0Hzdbq/xsYgHjWliiJso3w2idEJDrSC7Rlz1129ITArTQ4aiXgSv7nq2u8u43up
         8CDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3b72b8848si274334485a.598.2025.03.03.07.23.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 07:23:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp7cx-0004BA-Tt; Mon, 03 Mar 2025 10:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tp7ca-000491-0p; Mon, 03 Mar 2025 10:22:20 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tp7cP-0004aS-Nr; Mon, 03 Mar 2025 10:22:13 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z62XR3mXbz6H7Kh;
 Mon,  3 Mar 2025 23:19:03 +0800 (CST)
Received: from frapeml100007.china.huawei.com (unknown [7.182.85.133])
 by mail.maildlp.com (Postfix) with ESMTPS id E5F2E140A86;
 Mon,  3 Mar 2025 23:21:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100007.china.huawei.com (7.182.85.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Mar 2025 16:21:57 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 3 Mar 2025 16:21:57 +0100
To: Nicolin Chen <nicolinc@nvidia.com>
CC: Eric Auger <eric.auger@redhat.com>, "ddutile@redhat.com"
 <ddutile@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Jason
 Gunthorpe" <jgg@nvidia.com>, =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?=
 <berrange@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Topic: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Thread-Index: AQHbMeB0+Q5BEZc9JkeH/U6Jz+dF4rLkOMCAgAAM2QCAAAz2gIAEhqeggCVVAYCAI176AIAE12cAgAGBGYCAAGn5AIACTjRQgAB/1ACAJxm5oA==
Date: Mon, 3 Mar 2025 15:21:57 +0000
Message-ID: <48e3ac70f9fb4867a9ef835c22d4fda8@huawei.com>
References: <Z1wh69_gZ9izr1iU@redhat.com> <Z1wsslDnwlth3A8+@nvidia.com>
 <CAFEAcA8TW2RKyFnh-TZRpfaKfZipHD5TZy_hymUr41GJ4rs4xA@mail.gmail.com>
 <329445b2f68a47269292aefb34584375@huawei.com>
 <Z39Ugx2M+FRFVVpB@Asurada-Nvidia>
 <f4e64a3a-5c1d-49f2-ac72-b84ecd353c9d@redhat.com>
 <Z6EQENkHJy7TrkYy@Asurada-Nvidia>
 <77f736f6-9ef9-462b-916e-c8cfff279044@redhat.com>
 <Z6KsAE9wnjWU0xMs@Asurada-Nvidia>
 <8224c38797344d1a9c0f453774925db3@huawei.com>
 <Z6UGVP3olKvakHUh@Asurada-Nvidia>
In-Reply-To: <Z6UGVP3olKvakHUh@Asurada-Nvidia>
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
 RCVD_IN_MSPIKE_H2=-0.01, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
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
X-TUID: 5ze/x45fgGBT

SGkgTmljb2xpbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaWNv
bGluIENoZW4gPG5pY29saW5jQG52aWRpYS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFy
eSA2LCAyMDI1IDY6NTggUE0NCj4gVG86IFNoYW1lZXJhbGkgS29sb3RodW0gVGhvZGkgPHNoYW1l
ZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT4NCj4gQ2M6IEVyaWMgQXVnZXIgPGVyaWMu
YXVnZXJAcmVkaGF0LmNvbT47IGRkdXRpbGVAcmVkaGF0LmNvbTsgUGV0ZXINCj4gTWF5ZGVsbCA8
cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNv
bT47DQo+IERhbmllbCBQLiBCZXJyYW5nw6kgPGJlcnJhbmdlQHJlZGhhdC5jb20+OyBxZW11LWFy
bUBub25nbnUub3JnOw0KPiBxZW11LWRldmVsQG5vbmdudS5vcmc7IExpbnV4YXJtIDxsaW51eGFy
bUBodWF3ZWkuY29tPjsgV2FuZ3pob3UNCj4gKEIpIDx3YW5nemhvdTFAaGlzaWxpY29uLmNvbT47
IGppYW5na3Vua3VuIDxqaWFuZ2t1bmt1bkBodWF3ZWkuY29tPjsNCj4gSm9uYXRoYW4gQ2FtZXJv
biA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsNCj4gemhhbmdmZWkuZ2FvQGxpbmFyby5v
cmcNCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMC81XSBody9hcm0vdmlydDogQWRkIHN1cHBv
cnQgZm9yIHVzZXItY3JlYXRhYmxlDQo+IG5lc3RlZCBTTU1VdjMNCj4gDQpbLi5dDQoNCj4gPiBP
bmUgb2YgdGhlIGZlZWRiYWNrIEkgcmVjZWl2ZWQgb24gbXkgc2VyaWVzIHdhcyB0byByZW5hbWUg
ImFybS1zbW11djMtDQo+IG5lc3RlZCINCj4gPiB0byAiYXJtLXNtbXV2My1hY2NlbCIgYW5kIHBv
c3NpYmx5IHJlbmFtZSBmdW5jdGlvbiBuYW1lcyB0byBpbmNsdWRlDQo+ICJhY2NlbCcgYXMgd2Vs
bA0KPiA+IGFuZCBtb3ZlIHRob3NlIGZ1bmN0aW9ucyB0byBhIHNlcGFyYXRlICJzbW11djMtYWNj
ZWwuYyIgZmlsZS4gSSBzdXBwb3NlDQo+IHRoYXQgYXBwbGllcyB0bw0KPiA+IHRoZSAiIEFkZCBI
VyBhY2NlbGVyYXRlZCBuZXN0aW5nIHN1cHBvcnQgZm9yIGFybSBTTU1VdjMiIHNlcmllcyBhcw0K
PiB3ZWxsLg0KPiA+DQo+ID4gSXMgdGhhdCBmaW5lIHdpdGggeW91Pw0KPiANCj4gT2gsIG5vIHBy
b2JsZW0uIElmIHlvdSB3YW50IHRvIHJlbmFtZSB0aGUgd2hvbGUgdGhpbmcsIHBsZWFzZSBmZWVs
DQo+IGZyZWUuIEkgZG8gc2VlIHRoZSBuYW1pbmcgY29uZmxpY3QgYmV0d2VlbiB0aGUgIm5lc3Rl
ZCIgc3RhZ2UgYW5kDQo+IHRoZSAibmVzdGVkIiBIVyBmZWF0dXJlLCB3aGljaCBhcmUgYm90aCBz
dXBwb3J0ZWQgYnkgdGhlIHZTTU1VIG5vdy4NCg0KSSBhbSB3b3JraW5nIG9uIHRoZSBhYm92ZSBu
b3cgYW5kIGhhdmUgcXVpY2sgcXVlc3Rpb24gdG8geW918J+Yii4NCg0KTG9va2luZyBhdCB0aGUg
c21tdV9kZXZfYXR0YWNoX3Zpb21tdSgpIGZuIGhlcmVbMF0sDQppdCBhcHBlYXJzIHRvIGRvIHRo
ZSBmb2xsb3dpbmc6DQoNCjEuIEFsbG9jIGEgczJfaHdwdCBpZiBub3QgYWxsb2NhdGVkIGFscmVh
ZHkgYW5kIGF0dGFjaCBpdC4NCjIuIEFsbG9jYXRlIGFib3J0IGFuZCBieXBhc3MgaHdwdA0KMy4g
QXR0YWNoIGJ5cGFzcyBod3B0Lg0KDQpJIGRpZG4ndCBnZXQgd2h5IHdlIGFyZSBkb2luZyB0aGUg
c3RlcCAzIGhlcmUuIFRvIG1lIGl0IGxvb2tzIGxpa2UsDQp3aGVuIHdlIGF0dGFjaCB0aGUgczJf
aHdwdChpZSwgdGhlIG5lc3RlZCBwYXJlbnQgZG9tYWluIGF0dGFjaCksIA0KdGhlIGtlcm5lbCB3
aWxsIGRvLA0KDQphcm1fc21tdV9hdHRhY2hfZGV2KCkNCiAgYXJtX3NtbXVfbWFrZV9zMl9kb21h
aW5fc3RlKCkNCg0KSXQgYXBwZWFycyB0aHJvdWdoIHN0ZXAgMywgd2UgYWNoaWV2ZSB0aGUgc2Ft
ZSB0aGluZyBhZ2Fpbi4NCg0KT3IgaXQgaXMgcG9zc2libGUgSSBtaXNzZWQgc29tZXRoaW5nIG9i
dmlvdXMgaGVyZS4NCg0KUGxlYXNlIGxldCBtZSBrbm93Lg0KDQpUaGFua3MsDQpTaGFtZWVyDQoN
ClswXSBodHRwczovL2dpdGh1Yi5jb20vbmljb2xpbmMvcWVtdS9ibG9iL3dpcC9mb3Jfc2hhbWVl
cl8wMjA0MjAyNS9ody9hcm0vc21tdS1jb21tb24uYyNMOTEwQzEzLUw5MTBDMzUNCg0KDQo=
