Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp320283njc;
        Thu, 14 Nov 2024 05:27:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUGtS9h7Wpt6hoql3LZ+rq5I/4u8IS4HQyVzw+moPQ7U/u+2mrLBa5aOybANUB8j4jE7mrDei0jcDtg0w==@linaro.org
X-Google-Smtp-Source: AGHT+IFwD7Br3sccT0bT+5NamtupY0HlrDp/2wRWY1+mrfwvVQVp4SsbJXS568+yPxUJqJ7k6xB9
X-Received: by 2002:a05:6808:188d:b0:3d2:18c1:bf35 with SMTP id 5614622812f47-3e7aae038b9mr11255998b6e.33.1731590862410;
        Thu, 14 Nov 2024 05:27:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731590862; cv=none;
        d=google.com; s=arc-20240605;
        b=g4TVRLXrKz5MqUUkEQD3ehvhd1nz4u/cICzHo3tGPZXSf6D6SUk4llppTYeXdclZHd
         6pb3iOxS6/Oku0OeBl+Pd7keo23jRNmM47cwQl2N8fjPwW9shxy4n60cVLzi2DfI7vjT
         jFwCiFCfUgzZTvJ1xM+0x+QaC5Xvt1E7fRdB4CJaG9Nz25RPlM/cdcldu3/Bb8XSWlLq
         whJM9ri0Bglf9+q6rC3NjMt0InKYaw5weBJ2p1AMe93Dtit0yGNG/xGT6Gy0DATtfvKK
         r4l8rDxwKj60dTeRKsXl4I5ZH6f9VUdWkwQMHwAmZUbpKJ4a4V3aFjyRAzn9dIyOKu4u
         5Efw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=ysqamzRfGiYqndeynmpuqf2Z6ziYs6lvSQ7qw8N2oek=;
        fh=9DqYCFHKnmQ5+VgCN0UIIIa1J2fwcFK/sgrwSCMoxxU=;
        b=Nc6HVmCBjzBQsXgebTlWADjzZmF4ITsLebuKu2wRf2GJUv9Eaut4nY52DDBfdgb92/
         Whqvnb6dPRrjbqu4HAKG/LQhnCnmcWz8V2m0TqrScEISpeIx8OnxnkXCYlIMNQp0tCIz
         /cHFjbV26NTCFhEYsll8VW+t5L7x7K+EuK2jbqCfByPCIOKg8U/VoH5SlRm+lQSogRNP
         rlFqQn/n6zBUaziGrUp51eES5RWlaX2LzxPtN8H78je87RcxRGNOyRuKgL872Hy0z5ej
         DMyXD10JcxTee11PplPyxxdAdG1GMtR2TfHxrwKEAW4kuhN5PEIovzxfoGGvGvYEagXU
         w1VQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3ee9a3b57si11491246d6.453.2024.11.14.05.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 05:27:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBZsg-0001pN-9z; Thu, 14 Nov 2024 08:27:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tBZsd-0001oe-I9; Thu, 14 Nov 2024 08:27:27 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tBZsb-000813-5S; Thu, 14 Nov 2024 08:27:27 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xq1852nW1z6K67D;
 Thu, 14 Nov 2024 21:24:05 +0800 (CST)
Received: from frapeml100007.china.huawei.com (unknown [7.182.85.133])
 by mail.maildlp.com (Postfix) with ESMTPS id 0793C140257;
 Thu, 14 Nov 2024 21:27:18 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100007.china.huawei.com (7.182.85.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 14:27:17 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 14 Nov 2024 14:27:17 +0100
To: "eric.auger@redhat.com" <eric.auger@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
Thread-Topic: [RFC PATCH 2/5] hw/arm/smmuv3: Add initial support for SMMUv3
 Nested device
Thread-Index: AQHbMeWSJ83HnnIr30KCqoK78hZMsLK1adCAgAEJZ8D///pdgIAAXtkg
Date: Thu, 14 Nov 2024 13:27:17 +0000
Message-ID: <32c27b0eba83476e99abf1e68ae127e3@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-3-shameerali.kolothum.thodi@huawei.com>
 <00e8a5d6-c926-44bb-8d11-dab4ddc4820d@redhat.com>
 <7a3b6dcb5db349f5a7e718784ef46c97@huawei.com>
 <991e3963-245e-41af-b128-431520c7d4e3@redhat.com>
In-Reply-To: <991e3963-245e-41af-b128-431520c7d4e3@redhat.com>
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
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.69, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: IyRZfaIxRwhw

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFcmljIEF1
Z2VyIDxlcmljLmF1Z2VyQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAx
NCwgMjAyNCA4OjQyIEFNDQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpDQo+IDxzaGFt
ZWVyYWxpLmtvbG90aHVtLnRob2RpQGh1YXdlaS5jb20+OyBxZW11LWFybUBub25nbnUub3JnOw0K
PiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsg
amdnQG52aWRpYS5jb207IG5pY29saW5jQG52aWRpYS5jb207DQo+IGRkdXRpbGVAcmVkaGF0LmNv
bTsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdlaS5jb20+OyBXYW5nemhvdSAoQikNCj4gPHdhbmd6
aG91MUBoaXNpbGljb24uY29tPjsgamlhbmdrdW5rdW4gPGppYW5na3Vua3VuQGh1YXdlaS5jb20+
Ow0KPiBKb25hdGhhbiBDYW1lcm9uIDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+Ow0KPiB6
aGFuZ2ZlaS5nYW9AbGluYXJvLm9yZw0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAyLzVdIGh3
L2FybS9zbW11djM6IEFkZCBpbml0aWFsIHN1cHBvcnQgZm9yDQo+IFNNTVV2MyBOZXN0ZWQgZGV2
aWNlDQoNCg0KPiA+PiB3aHkgZGlkIHlvdSBjaG9vc2Ugbm90IHVzaW5nIHRoZSBQTEFURk9STSBC
VVMgaW5mcmEgd2hpY2ggZG9lcyB0aGF0DQo+ID4+IGtpbmQgb2YgYmluZGluZyBhdXRvbWF0aWNh
bGx5IChhbHNvIGl0IHByb3Zpc2lvbnMgZm9yIGRlZGljYXRlZCBNTUlPcw0KPiBhbmQNCj4gPj4g
SVJRcykuIEF0IGxlYXN0IHlvdSB3b3VsZCBuZWVkIHRvIGp1c3RpZnkgaW4gdGhlIGNvbW1pdCBt
c2cgSSB0aGluaw0KPiA+IEJlY2F1c2UgSSB3YXMgbm90ICBzdXJlIGhvdyB0byBkbyB0aGlzIGJp
bmRpbmcgb3RoZXJ3aXNlLiBJIGNvdWxkbid0IGZpbmQNCj4gPiBhbnkgc3VjaCBwcmVjZWRlbmNl
ICBmb3IgYSAgZHluYW1pYyBwbGF0Zm9ybSBidXMgZGV2IGJpbmRpbmcNCj4gPiBNTUlPcy9JUlFz
KE1heSBiZSBJIGRpZG4ndCBsb29rIGhhcmQpLiBJIG1lbnRpb25lZCBpdCBpbiBjb3ZlciBsZXR0
ZXIuDQo+ID4NCj4gPiBDb3VsZCB5b3UgcGxlYXNlIGdpdmUgbWUgc29tZSBwb2ludGVycy9leGFt
cGxlIGZvciB0aGlzPyBJIHdpbGwgYWxzbw0KPiA+IHRha2UgYW5vdGhlciBsb29rLg0KPiB2Zmlv
IHBsYXRmb3JtIHVzZXJzIHN1Y2ggYXV0b21hdGljIGJpbmRpbmcgKGhvd2V2ZXIgeW91IG11c3Qg
Y2hlY2sgdGhhdA0KPiB2ZmlvIHBsYXRmb3JtIGJ1cyBtbWlvIGFuZCBpcnEgc3BhY2UgaXMgbGFy
Z2UgZW5vdWdoIGZvciB5b3VyIG5lZWRzKS4NCj4gDQo+IHRoZSBiaW5kaW5nIGlzIHRyYW5zcGFy
ZW50bHkgaGFuZGxlZCBieQ0KPiDCoMKgwqAgaWYgKHZtcy0+cGxhdGZvcm1fYnVzX2Rldikgew0K
PiDCoMKgwqDCoMKgwqDCoCBpZiAoZGV2aWNlX2lzX2R5bmFtaWNfc3lzYnVzKG1jLCBkZXYpKSB7
DQo+IA0KPiBwbGF0Zm9ybV9idXNfbGlua19kZXZpY2UoUExBVEZPUk1fQlVTX0RFVklDRSh2bXMt
DQo+ID5wbGF0Zm9ybV9idXNfZGV2KSwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNZU19CVVNfREVWSUNF
KGRldikpOw0KPiDCoMKgwqDCoMKgwqDCoCB9DQo+IMKgwqDCoCB9DQoNCkFoLi5JIHNlZS4gSSBt
aXNzZWQgdGhhdCBpdCBkb2VzIHRoYXQgdHJhbnNwYXJlbnRseS4gIEFuZCB1c2UgDQpwbGF0Zm9y
bV9idXNfZ2V0X21taW9fYWRkcigpIGZvciByZXRyaWV2aW5nIGl0IGZvciBBQ1BJL0RUIHNpbWls
YXIgdG8gd2hhdCBUUE0NCmRldmljZSBpcyBkb2luZy4NCg0KU28gd2UgZG9uJ3QgbmVlZCBzcGVj
aWZpYyBlbnRyaWVzIGZvciB0aGlzIGRldmljZSBpbiBtZW1tYXAvaXJxbWFwLg0KDQpJIHdpbGwg
Z2l2ZSBpdCBhIHRyeS4NCg0KVGhhbmtzLA0KU2hhbWVlci4NCg0KDQo=
