Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp354327njc;
        Wed, 12 Mar 2025 08:47:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXf5H9G4dsTSyQ/eX0GzDWo6qsJjsnpvbtTGXv4QhAL6adiluEkAaxMKCA2ctQL9E6hSaTfpFwfBqcffA==@linaro.org
X-Google-Smtp-Source: AGHT+IHmIz34gXkeujnlHnT7VUOXerZ7CzK4FtxP19GlAAlvHtZZWIhbT0a3ew8HWCznmkc18j6S
X-Received: by 2002:a05:6214:2421:b0:6e8:8934:337e with SMTP id 6a1803df08f44-6e90068453amr355214936d6.38.1741794462139;
        Wed, 12 Mar 2025 08:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741794462; cv=none;
        d=google.com; s=arc-20240605;
        b=P8rd1/+INj2xPJxZAYO5YgIv/g+Ml4I6p/uJN6X5P5viSF50XkypEXQY4oyXBwcXMO
         h+lzwz6LzbSOIw9zNCfRtExFhdwxkuzAiaviC7hXoMVscxECqysm0NYBlvyI7VPbdTXK
         7EzG3+4Gk+aO2+omFJ7cryTjZU8PVRlkcQrhYy79t4kVQWjPx1rRIUzQhfqaDrYPEjZD
         sjYjgCPAsAK10rI/HqXFTWvrrOPGRVl2qYI6ZTdKqEU9pUWKjrl51Cs2SSVIlqWXXsY+
         1SrAajdeSJWpiyMCuRKjS6CInubDxCN3sskRvBbvfa5O1mO4+CXJF7OOkhCqUsLe8E02
         LWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=BlaSNu1+VYQyvQLvVdWvgUDa782IwXtEudpEhWDboHE=;
        fh=O6X2BWEQtTCF1UGIaMMuTYtr58ukGNU/CQyZ48iW9Cs=;
        b=Nc+ZuXI6MiSsGoKWWW/Hu0sinnIB3vsqgKuxF1lSkdREbTGPN3BmotOvKH3H78tYIE
         CbtWAc3Daho5XY8lz0uOC50ApDgJ4rZs1WdBOsvzMSqeRK5MoxIC0ebiVKGBOZmmyZde
         WSBzPOdpzcaLRecsZNpThMfAR3CLy59LmwT8efDfDHLtpJcj/rYm2d3iDdBVB32Um7wK
         cCErsT03NOsne5T+48Kh6A+x7nEu06BBOU6kaqoO6jNBeXgUnO4T2sMXciLXr9VxEfnE
         BoWpGzcY38TUHQ9V8h/NrUntjRePzGcROHPS9/oum+yxFVktbC49ilA5k9gr4zhfMlbd
         1CiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f707cd17si135120996d6.12.2025.03.12.08.47.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 08:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsOIL-00084T-1f; Wed, 12 Mar 2025 11:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tsOI3-00082A-H1; Wed, 12 Mar 2025 11:46:39 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tsOHz-0004ch-FG; Wed, 12 Mar 2025 11:46:38 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZCZcf240Lz6FBgK;
 Wed, 12 Mar 2025 23:41:54 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
 by mail.maildlp.com (Postfix) with ESMTPS id 3C2B0140113;
 Wed, 12 Mar 2025 23:46:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500005.china.huawei.com (7.182.85.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Mar 2025 16:46:23 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Wed, 12 Mar 2025 16:46:22 +0100
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
Thread-Index: AQHbko9X7BBFIVL5UECoP8opJSgSfrNvkyYAgAAR74A=
Date: Wed, 12 Mar 2025 15:46:22 +0000
Message-ID: <58c9c37876c64584b0c7961ec61696a3@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-5-shameerali.kolothum.thodi@huawei.com>
 <547f961e-380c-4ffe-8b8b-3e9d543aa702@redhat.com>
In-Reply-To: <547f961e-380c-4ffe-8b8b-3e9d543aa702@redhat.com>
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
X-TUID: Ix3K8n9ME/Q7

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBxZW11LWRl
dmVsLQ0KPiBib3VuY2VzK3NoYW1lZXJhbGkua29sb3RodW0udGhvZGk9aHVhd2VpLmNvbUBub25n
bnUub3JnIDxxZW11LQ0KPiBkZXZlbC1ib3VuY2VzK3NoYW1lZXJhbGkua29sb3RodW0udGhvZGk9
aHVhd2VpLmNvbUBub25nbnUub3JnPiBPbg0KPiBCZWhhbGYgT2YgRXJpYyBBdWdlcg0KPiBTZW50
OiBXZWRuZXNkYXksIE1hcmNoIDEyLCAyMDI1IDM6MzYgUE0NCj4gVG86IFNoYW1lZXJhbGkgS29s
b3RodW0gVGhvZGkNCj4gPHNoYW1lZXJhbGkua29sb3RodW0udGhvZGlAaHVhd2VpLmNvbT47IHFl
bXUtYXJtQG5vbmdudS5vcmc7DQo+IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogcGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnOyBqZ2dAbnZpZGlhLmNvbTsgbmljb2xpbmNAbnZpZGlhLmNvbTsN
Cj4gZGR1dGlsZUByZWRoYXQuY29tOyBiZXJyYW5nZUByZWRoYXQuY29tOyBuYXRoYW5jQG52aWRp
YS5jb207DQo+IG1vY2hzQG52aWRpYS5jb207IHNtb3N0YWZhQGdvb2dsZS5jb207IExpbnV4YXJt
DQo+IDxsaW51eGFybUBodWF3ZWkuY29tPjsgV2FuZ3pob3UgKEIpIDx3YW5nemhvdTFAaGlzaWxp
Y29uLmNvbT47DQo+IGppYW5na3Vua3VuIDxqaWFuZ2t1bmt1bkBodWF3ZWkuY29tPjsgSm9uYXRo
YW4gQ2FtZXJvbg0KPiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPjsgemhhbmdmZWkuZ2Fv
QGxpbmFyby5vcmcNCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggdjIgMDQvMjBdIGh3L2FybS92
aXJ0OiBBZGQgc3VwcG9ydCBmb3Igc21tdXYzLQ0KPiBhY2NlbA0KPiANCj4gSGkgU2hhbWVlciwN
Cj4gDQo+IA0KPiBPbiAzLzExLzI1IDM6MTAgUE0sIFNoYW1lZXIgS29sb3RodW0gd3JvdGU6DQo+
ID4gQWxsb3cgY29sZC1wbHVnIHNtbXV2My1hY2NlbCB0byB2aXJ0IElmIHRoZSBtYWNoaW5lIHdp
ZGUgc21tdXYzDQo+ID4gaXMgbm90IHNwZWNpZmllZC4NCj4gPg0KPiA+IE5vIEZEVCBzdXBwb3J0
IGlzIGFkZGVkIGZvciBub3cuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGFtZWVyIEtvbG90
aHVtDQo+IDxzaGFtZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+DQo+ID4gLS0tDQo+
ID4gIGh3L2FybS92aXJ0LmMgICAgICAgICB8IDEyICsrKysrKysrKysrKw0KPiA+ICBody9jb3Jl
L3N5c2J1cy1mZHQuYyAgfCAgMSArDQo+ID4gIGluY2x1ZGUvaHcvYXJtL3ZpcnQuaCB8ICAxICsN
Cj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvaHcvYXJtL3ZpcnQuYyBiL2h3L2FybS92aXJ0LmMNCj4gPiBpbmRleCA0YTVhOTY2NmU5
Li44NGEzMjNkYTU1IDEwMDY0NA0KPiA+IC0tLSBhL2h3L2FybS92aXJ0LmMNCj4gPiArKysgYi9o
dy9hcm0vdmlydC5jDQo+ID4gQEAgLTczLDYgKzczLDcgQEANCj4gPiAgI2luY2x1ZGUgInFvYmpl
Y3QvcWxpc3QuaCINCj4gPiAgI2luY2x1ZGUgInN0YW5kYXJkLWhlYWRlcnMvbGludXgvaW5wdXQu
aCINCj4gPiAgI2luY2x1ZGUgImh3L2FybS9zbW11djMuaCINCj4gPiArI2luY2x1ZGUgImh3L2Fy
bS9zbW11djMtYWNjZWwuaCINCj4gPiAgI2luY2x1ZGUgImh3L2FjcGkvYWNwaS5oIg0KPiA+ICAj
aW5jbHVkZSAidGFyZ2V0L2FybS9jcHUtcW9tLmgiDQo+ID4gICNpbmNsdWRlICJ0YXJnZXQvYXJt
L2ludGVybmFscy5oIg0KPiA+IEBAIC0yOTExLDYgKzI5MTIsMTYgQEAgc3RhdGljIHZvaWQNCj4g
dmlydF9tYWNoaW5lX2RldmljZV9wbHVnX2NiKEhvdHBsdWdIYW5kbGVyICpob3RwbHVnX2RldiwN
Cj4gPiAgICAgICAgICAgICAgcGxhdGZvcm1fYnVzX2xpbmtfZGV2aWNlKFBMQVRGT1JNX0JVU19E
RVZJQ0Uodm1zLQ0KPiA+cGxhdGZvcm1fYnVzX2RldiksDQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBTWVNfQlVTX0RFVklDRShkZXYpKTsNCj4gPiAgICAgICAgICB9
DQo+ID4gKyAgICAgICAgaWYgKG9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldiksIFRZUEVf
QVJNX1NNTVVWM19BQ0NFTCkpDQo+IHsNCj4gPiArICAgICAgICAgICAgaWYgKHZtcy0+aW9tbXUg
PT0gVklSVF9JT01NVV9TTU1VVjMpIHsNCj4gbWF5YmUganVzdCBjaGVjayB3aGV0aGVyIGl0IGlz
ICE9IFZJUlRfSU9NTVVfTk9ORT8NCj4gPiArICAgICAgICAgICAgICAgIGVycm9yX3NldGcoZXJy
cCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgImlvbW11PXNtbXV2MyBpcyBhbHJl
YWR5IHNwZWNpZmllZC4gY2FuJ3QgY3JlYXRlDQo+IHNtbXV2My1hY2NlbCBkZXYiKTsNCj4gSSB3
b3VsZCBjbGVhcmx5IHN0YXRlICJpb21tdT1zbW11djMgdmlydCBtYWNoaW5lIG9wdGlvbiBpcyBh
bHJlYWR0IHNldCINCj4gYW5kIHVzZSBhbiBlcnJvciBoaW50IHRvIHNheSBib3RoIGFyZSBub3Qg
Y29tcGF0aWJsZS4NCj4gPiArICAgICAgICAgICAgICAgIHJldHVybjsNCj4gPiArICAgICAgICAg
ICAgfQ0KPiA+ICsgICAgICAgICAgICBpZiAodm1zLT5pb21tdSAhPSBWSVJUX0lPTU1VX1NNTVVW
M19BQ0NFTCkgew0KPiA+ICsgICAgICAgICAgICAgICAgdm1zLT5pb21tdSA9IFZJUlRfSU9NTVVf
U01NVVYzX0FDQ0VMOw0KPiANCj4gSSBrbm93IHRoZXJlIHdlcmUgcXVpdGUgYSBsb3Qgb2YgZGlj
dXNzaW9ucyBvbiB0aGUgMXN0IG11bHRpDQo+IGluc3RhbnRpYXRpb24gc2VyaWVzIHJlbGF0ZWQg
dG8gdGhlIHdheSB3ZSBpbnN0YW5hdGlhdGUgdGhhdCBkZXZpY2UgYW5kDQo+IG1heWJlIEkgbWlz
c2VkIHNvbWUgYmxvY2tlcnMgYnV0IHdoeSB3b3VsZG4ndCB3ZSBhbGxvdyB0aGUgaW5zdGFudGlh
dGlvbg0KPiBvZiB0aGUgbGVnYWN5IHNtbXUgZGV2aWNlIHdpdGggLWRldmljZSB0b28uIEkgdGhp
bmsgdGhpcyB3b3VsZCBiZQ0KPiBzaW1wbGVyIGZvciBsaWJ2aXJ0IGFuZCB3ZSB3b3VsZCBzb21l
aG93IGRlcHJlY2F0ZSB0aGUgbWFjaGluZSBvcHRpb24NCj4gbWV0aG9kPyB3b3VsZCB0aGF0IG1h
a2UgYSBwcm9ibGVtIGlmIHlvdSB3ZXJlIHRvIHVzZSAtZGV2aWNlIHNtbXUsYWNjZWwNCj4gb3Ig
c29tZXRoaW5nIGFsaWtlPw0KDQpUaGFua3MgZm9yIHRha2luZyBhIGxvb2suIEkgYW0ganVzdCBq
dW1waW5nIG9uIHRoaXMgb25lIGZvciBub3cuICBZZXMsIHRoZXJlDQp3ZXJlIGRpc2N1c3Npb25z
IGFyb3VuZCB0aGF0LiBCdXQgSSB3YXMgbm90IHN1cmUgd2UgY29uY2x1ZGVkIG9uIGRlcHJlY2F0
aW5nDQp0aGUgbWFjaGluZSBvcHRpb24uIFNvIGlmIEkgZ2V0IHlvdSBjb3JyZWN0bHkgdGhlIGlk
ZWEgaXMsDQoNCmlmIHdlIGhhdmUsIA0KLWRldmljZSBzbW11djMgaXQgd2lsbCBpbnN0YW50aWF0
ZSB0aGUgY3VycmVudCBtYWNoaW5lIHdpZGUgc21tdXYzIGFuZCBmb3INCi1kZXZpY2Ugc21tdXYz
LGFjY2VsIHRoaXMgZGV2aWNlPw0KDQpUaGFua3MsDQpTaGFtZWVyDQo=
