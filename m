Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp4528694njc;
        Thu, 21 Nov 2024 01:46:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXIAlnTY+KUKLvP4usIVOr63+sPJ97bh03LGYkLghgAZh/oIB4lh35IuanwxzpI/h5JT1XygJk+NIO74g==@linaro.org
X-Google-Smtp-Source: AGHT+IEdzw4ChYK8NJIXVUXRe1AFx6klufif83/BF3eSnNv3Jd4As59rPHgEdErrbBanOmazMM6L
X-Received: by 2002:ac8:5a44:0:b0:463:5cd7:ddd3 with SMTP id d75a77b69052e-464775e6304mr59070351cf.11.1732182410990;
        Thu, 21 Nov 2024 01:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732182410; cv=none;
        d=google.com; s=arc-20240605;
        b=fD0p8qbiEThoJ1GZwBa1SdBe14+/vL4ytLruWynPe452DZdUju43fY3SNhi4QfDRv+
         8GdXN1S4sWAeimrSXmTcoNBuEwOF4Z79l+SK983RwZmro6LoPmBGd6JA6wAe+k2IrX4Y
         F9m5QBn0T/Yotf5tIioE7qoGHgkEboKzIMTwZJkAaFCF0MES+9AQIQZumkZT3bMTYPKb
         GIs11LszUjNWlAtGZw0q7l2Ca27MM/X763k9h3RFWsrSaKY9pWM4WXZBIZk/hTMPAz8X
         rIFSz0FDRC0HQfUpikfumB8+xTK8xdcbBEi+RYTARZfXK4v8TmKAVNlRuCRUIgTqjK1X
         ydMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=RfDotoqQmOyT+VhNN5iD7s99AbQJTUUPrrYL74JpzKs=;
        fh=9DqYCFHKnmQ5+VgCN0UIIIa1J2fwcFK/sgrwSCMoxxU=;
        b=ITqUL30hS0vycjebmcIS3HqAdDaXSkcuS5OB1ECx8eNrWM9NQFIzI6hTT0vloKk458
         Y70Rgsj3BCQSZZoUIEJMYriLb2Unc+dbm3RJFFLgbqzK0WpWkM7xBzJUTbxoT1p8uu0k
         tgYUHFpncWdnKSLh7PGDci9xhmKi6PgFfV2ncEf/G8iTrgxwLL8DbHQPZnzSny5snFSU
         Crp8fNWkltq78uIEJqCGmu3p/3ENuc6L9i4Dnx213rn3Bl05bf9mEfeNMMNCdq1K7ASP
         7k8M3/MD8dVUDN2NUxVInkrPr3gO1S32L06OpfHA8hGu6e51jPBHn35UrfOgMQuecfv+
         o37g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4646a63db74si43644701cf.525.2024.11.21.01.46.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2024 01:46:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tE3lm-0006kt-2E; Thu, 21 Nov 2024 04:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tE3lb-0006ke-7H; Thu, 21 Nov 2024 04:46:27 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tE3lY-000408-16; Thu, 21 Nov 2024 04:46:26 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XvCvR41fdz6K6lP;
 Thu, 21 Nov 2024 17:42:43 +0800 (CST)
Received: from frapeml500006.china.huawei.com (unknown [7.182.85.219])
 by mail.maildlp.com (Postfix) with ESMTPS id AA580140DAF;
 Thu, 21 Nov 2024 17:46:17 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500006.china.huawei.com (7.182.85.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 10:46:16 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 21 Nov 2024 10:46:16 +0100
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
Thread-Index: AQHbMd3CYnIzOIz3QUan4PDL8HOdprK8zVGAgAAjLhCAABtdAIAAIywQgAAmhYCAAus70IAAGD4AgAAU00CAARvsAA==
Date: Thu, 21 Nov 2024 09:46:16 +0000
Message-ID: <c14feb2934a0478180635bbdb27d5e53@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-5-shameerali.kolothum.thodi@huawei.com>
 <1dcea5ca-806f-4f51-8b13-faf5d62eb086@redhat.com>
 <efb9fb7fb0f04d92b7776cdbc474585d@huawei.com>
 <48bb0455-7c2e-4cc6-aa15-ebe4311d8430@redhat.com>
 <0803ec1a010a46b9811543e1044c3176@huawei.com>
 <aafc5fba-8d68-4796-a846-265362e7acac@redhat.com>
 <30ff8ac9ee9b4012aa6962c86ac06375@huawei.com>
 <41a67d4e-f7b8-4586-8d52-c32df400b675@redhat.com>
 <e13f2e9c0a6341e8b25b7945bc7bf413@huawei.com>
In-Reply-To: <e13f2e9c0a6341e8b25b7945bc7bf413@huawei.com>
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
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: QV7YHRobcXXY

SGkgRXJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaGFtZWVy
YWxpIEtvbG90aHVtIFRob2RpDQo+IFNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMjAsIDIwMjQg
NDoyNiBQTQ0KPiBUbzogJ2VyaWMuYXVnZXJAcmVkaGF0LmNvbScgPGVyaWMuYXVnZXJAcmVkaGF0
LmNvbT47IHFlbXUtDQo+IGFybUBub25nbnUub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4g
Q2M6IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZzsgamdnQG52aWRpYS5jb207IG5pY29saW5jQG52
aWRpYS5jb207DQo+IGRkdXRpbGVAcmVkaGF0LmNvbTsgTGludXhhcm0gPGxpbnV4YXJtQGh1YXdl
aS5jb20+OyBXYW5nemhvdSAoQikNCj4gPHdhbmd6aG91MUBoaXNpbGljb24uY29tPjsgamlhbmdr
dW5rdW4gPGppYW5na3Vua3VuQGh1YXdlaS5jb20+Ow0KPiBKb25hdGhhbiBDYW1lcm9uIDxqb25h
dGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+Ow0KPiB6aGFuZ2ZlaS5nYW9AbGluYXJvLm9yZw0KPiBT
dWJqZWN0OiBSRTogW1JGQyBQQVRDSCA0LzVdIGh3L2FybS92aXJ0LWFjcGktYnVpbGQ6IEJ1aWxk
IElPUlQgd2l0aA0KPiBtdWx0aXBsZSBTTU1VIG5vZGVzDQo+IA0KPiA+ID4gSSB0aGluayBJIGhh
dmUgYW4gaWRlYSB3aHkgdGhlIGhvdCBhZGQgd2FzIG5vdCB3b3JraW5nLg0KPiA+ID4NCj4gPiA+
IFdoZW4gd2UgaGF2ZSB0aGUgUENJZSB0b3BvbG9neSBhcyBzb21ldGhpbmcgbGlrZSBiZWxvdywN
Cj4gPiA+DQo+ID4gPiAtZGV2aWNlIHB4Yi1wY2llLGlkPXBjaWUuMSxidXNfbnI9OCxidXM9cGNp
ZS4wIFwgLWRldmljZQ0KPiA+ID4gcGNpZS1yb290LXBvcnQsaWQ9cGNpZS5wb3J0MSxidXM9cGNp
ZS4xLGNoYXNzaXM9MSBcIC1kZXZpY2UNCj4gPiA+IHBjaWUtcm9vdC1wb3J0LGlkPXBjaWUucG9y
dDIsYnVzPXBjaWUuMSxjaGFzc2lzPTIgXCAtZGV2aWNlDQo+ID4gPiBhcm0tc21tdXYzLW5lc3Rl
ZCxpZD1zbW11djEscGNpLWJ1cz1wY2llLjEgXCAuLi4NCj4gPiA+DQo+ID4gPiBUaGUgY3VycmVu
dCBJT1JUIGdlbmVyYXRpb24gaW5jbHVkZXMgdGhlIHBjaWUtcm9vdC1wb3J0IGRldiBpZHMgYWxz
bw0KPiA+ID4gaW4gdGhlIFNNTVV2MyBub2RlIGlkbWFwcy4NCj4gPiA+DQo+ID4gPiBIZW5jZSwg
d2hlbiBHdWVzdCBrZXJuZWwgbG9hZHMsIHBjaWVwb3J0IGlzIGFsc28gYmVoaW5kIHRoZSBTTU1V
djMuDQo+ID4gPg0KPiA+ID4gWyAgICAxLjQ2NjY3MF0gcGNpZXBvcnQgMDAwMDo2NDowMC4wOiBB
ZGRpbmcgdG8gaW9tbXUgZ3JvdXAgMQ0KPiA+ID4gLi4uDQo+ID4gPiBbICAgIDEuNDQ4MjA1XSBw
Y2llcG9ydCAwMDAwOjY0OjAxLjA6IEFkZGluZyB0byBpb21tdSBncm91cCAyDQo+ID4NCj4gPiBC
dXQgaXQgc2hvdWxkIGJlIHRoZSBzYW1lIHdpdGhvdXQgbXVsdGktaW5zdGFudGlhdGlvbiwgbm8/
IEkgd291bGQNCj4gPiBoYXZlIGV4cGVjdGVkIHRoaXMgYXMgbm9ybWFsLiBIYXMgeW91IHRlc3Rl
ZCBob3QtcGx1ZyB3aXRob3V0IHRoZQ0KPiA+IHNlcmllcyBsYXRlcmx5PyBEbyB5b3UgaGF2ZSB0
aGUgc2FtZSBwYj8NCj4gDQo+IFRoYXQgaXMgYSBnb29kIHF1ZXN0aW9uLiBJIHdpbGwgZ2l2ZSBp
dCBhIHRyeSBzb29uIGFuZCB1cGRhdGUuDQoNCkkgdHJpZWQgaG90IGFkZCB3aXRoIHRoZSBjdXJy
ZW50IFNNTVV2Myhpb21tdT1zbW11djMpIGFuZCBob3QgYWRkDQp3b3JrcyB3aGVuIEkgYWRkZWQg
YSB2aXJ0aW8gZGV2IHRvIHBjaWUtcm9vdC1wb3J0IGNvbm5lY3RlZCB0byBhIHB4Yi1wY2llLg0K
DQpBbmQgbm93IEkgdGhpbmsgSSBrbm93KGhvcGVmdWxseSkgdGhlIHJlYXNvbiB3aHkgaXQgaXMg
bm90IHdvcmtpbmcgd2l0aA0Kc21tdXYzLW5lc3RlZCBjYXNlLiBJIHRoaW5rIHRoZSByb290IGNh
dXNlIGlzIHRoaXMgY29tbWl0IGhlcmUsDQoNCihzZXJpZXM6ICIgY292ZXItbGV0dGVyOiBBZGQg
SFcgYWNjZWxlcmF0ZWQgbmVzdGluZyBzdXBwb3J0IGZvciBhcm0gU01NVXYzIikNCmh0dHBzOi8v
Z2l0aHViLmNvbS9oaXNpbGljb24vcWVtdS9jb21taXQvOWIyMWYyODU5NWNlZjdiMTEwMGFlMTMw
OTc0NjA1ZjM1N2VmNzVkMw0KDQpUaGlzIGNoYW5nZXMgdGhlIHdheSBhZGRyZXNzIHNwYWNlIGlz
IHJldHVybmVkIGZvciB0aGUgZGV2aWNlcy4NCg0Kc3RhdGljIEFkZHJlc3NTcGFjZSAqc21tdV9m
aW5kX2FkZF9hcyhQQ0lCdXMgKmJ1cywgdm9pZCAqb3BhcXVlLCBpbnQgZGV2Zm4pDQp7DQogICAg
U01NVVN0YXRlICpzID0gb3BhcXVlOw0KICAgIFNNTVVQY2lCdXMgKnNidXMgPSBzbW11X2dldF9z
YnVzKHMsIGJ1cyk7DQogICAgU01NVURldmljZSAqc2RldiA9IHNtbXVfZ2V0X3NkZXYocywgc2J1
cywgYnVzLCBkZXZmbik7DQoNCiAgICAvKiBSZXR1cm4gdGhlIHN5c3RlbSBhcyBpZiB0aGUgZGV2
aWNlIHVzZXMgc3RhZ2UtMiBvbmx5ICovDQogICAgaWYgKHMtPm5lc3RlZCAmJiAhc2Rldi0+czFf
aHdwdCkgew0KICAgICAgICByZXR1cm4gJnNkZXYtPmFzX3N5c21lbTsNCiAgICB9IGVsc2Ugew0K
ICAgICAgICByZXR1cm4gJnNkZXYtPmFzOw0KICAgIH0NCn0NCg0KSWYgd2UgaGF2ZSBlbnRyaWVz
IGluIHRoZSBTTU1VdjMgaWRtYXAgZm9yIGJ1czpkZXZmbiwgdGhlbiBJIHRoaW5rIHdlIHNob3Vs
ZA0KcmV0dXJuIElPTU1VIGFkZHJlc3Mgc3BhY2UgaGVyZS4gQnV0IHRoZSBsb2dpYyBhYm92ZSBy
ZXR1cm5zIHN5c21lbQ0KYWRkcmVzcyBzcGFjZSBmb3IgYW55dGhpbmcgb3RoZXIgdGhhbiB2Zmlv
L2lvbW11ZmQgZGV2aWNlcy4gDQoNClRoZSBob3QgYWRkIHdvcmtzIHdoZW4gSSBoYWNrZWQgdGhl
IGxvZ2ljIHRvIHJldHVybiBJT01NVSBhZGRyZXNzIHNwYWNlDQpmb3IgcGNpZSByb290IHBvcnQg
ZGV2aWNlcy4NCg0KQ291bGQgeW91IHBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGUgY29tbWl0IGFi
b3ZlIGFuZCBsZXQgbWUga25vdyBpZiB0aGlzDQppbmRlZWQgY291bGQgYmUgdGhlIHByb2JsZW0/
DQoNClRoYW5rcywNClNoYW1lZXINCg0KDQoNCg0KDQoNCg==
