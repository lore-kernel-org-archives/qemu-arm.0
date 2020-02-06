Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1258386lfp;
        Thu, 6 Feb 2020 02:20:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqzGLwqo4lOF+NfBG22G7cu4WDcy+rnG9I52b4EzlbNFgpIUtfB5UxRC/GU+/ku3TQrg6cGq
X-Received: by 2002:ad4:42aa:: with SMTP id e10mr1663861qvr.92.1580984436016;
        Thu, 06 Feb 2020 02:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580984436; cv=none;
        d=google.com; s=arc-20160816;
        b=K9i/649FM7hQ8ZKK3KbrIe+nLQYTTLINNQC78X7r0RP6FwjZ7ePF/b+CE3oePj2pP2
         p2fhWPBDhgTrWYm0dxcBT1G2m8f5rFnhyLgZ81gD7Lc24Vz3D27yyKKTRS7LzhtxTbFK
         ED6j3ygaao5kcG2XbHBtJ0apXXfIJvJKthByio+b5SH7krko9mdn6cLUyiRuW1r3267D
         jFf/muLrYGLiW5bwJRfJE6GJ6sN7RJDCjqkVIJNUm8gqB4NTo3brz665ygMAaEjBIOAD
         05oGCMIkKtLV4cyB0cHVzOcwVL4jhMV3mzzssQSa49c0bflKMEJy88Ufkxlb3H837UxU
         8NeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=3Lk/2Sczbjy5ot7kmiqHVLXqWG6y04+4K5eGMdB8IMo=;
        b=GCF9pStw8RZYHjUpEzSvWqRQlQXSTUGcOu0mHo7gfswHJbHqetlznWy82PvT0hRnks
         dbAA+1+s9JGHJUJZr4utuG2EUwTopkGL5alHyAFbUWnzZr9SiIVR/uFUu60BDrJ13XmZ
         2mos5d+zaxWxPLseX00C3SXZZ9lRJ/NX/0ZJMg9o8OpdRuQft2BQT4k/zEvVBdVI5sDM
         qz0C/B0LFnSql7u/yLjQul/DsZZji8bo9LpgWBdcvp1LDnXYZw7pP3Vd6oS0cbkvx12b
         GZ1M1JurwJe0YFVLCONdrdGdIMvdb8ZaMfGvO6IGyUc7g6aEw1yMiIdNc2QAW4pl5mp1
         yMvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb20si1218996qvb.212.2020.02.06.02.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 02:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izeGx-0001cj-BO
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 05:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55424)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1izeGW-0001Jh-Hz
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 05:20:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1izeGU-0007ux-OL
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 05:20:08 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2072 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1izeGU-0007Uc-F8; Thu, 06 Feb 2020 05:20:06 -0500
Received: from lhreml706-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 1F7654AFFDFE987AFBF2;
 Thu,  6 Feb 2020 10:20:01 +0000 (GMT)
Received: from lhreml705-chm.china.huawei.com (10.201.108.54) by
 lhreml706-cah.china.huawei.com (10.201.108.47) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 6 Feb 2020 10:20:00 +0000
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml705-chm.china.huawei.com (10.201.108.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Thu, 6 Feb 2020 10:20:00 +0000
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.1713.004; Thu, 6 Feb 2020 10:20:00 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: RE: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
Thread-Topic: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
Thread-Index: AQHVzV43w2nN4JnxQEOUTwT8NpSKx6gLQ1MAgAAWtoCAACc+AIABYS3wgAAIyYCAAR1e4A==
Date: Thu, 6 Feb 2020 10:20:00 +0000
Message-ID: <52fff289cca14874ad493fc25806fe3d@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-2-shameerali.kolothum.thodi@huawei.com>
 <20200204162320.67e5d353@redhat.com>
 <74eaaa45-0d20-9a21-fbf8-6d29deb248eb@redhat.com>
 <4ce41554-8b8e-dbb5-5fe9-43af09950f23@redhat.com>
 <8e0b2c762e914c64bebfab5fc7441661@huawei.com>
 <133f274e-e942-7008-93d2-8edb1bc4d7ae@redhat.com>
In-Reply-To: <133f274e-e942-7008-93d2-8edb1bc4d7ae@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 185.176.76.210
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wfXFQiF7BIyC

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGF2aWQgSGlsZGVuYnJh
bmQgW21haWx0bzpkYXZpZEByZWRoYXQuY29tXQ0KPiBTZW50OiAwNSBGZWJydWFyeSAyMDIwIDE2
OjQxDQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtvbG90aHVt
LnRob2RpQGh1YXdlaS5jb20+Ow0KPiBJZ29yIE1hbW1lZG92IDxpbWFtbWVkb0ByZWRoYXQuY29t
Pg0KPiBDYzogcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyB4aWFvZ3Vhbmdyb25nLmVyaWNAZ21h
aWwuY29tOw0KPiBtc3RAcmVkaGF0LmNvbTsgc2hhbm5vbi56aGFvc2xAZ21haWwuY29tOyBxZW11
LWRldmVsQG5vbmdudS5vcmc7DQo+IHh1d2VpIChPKSA8eHV3ZWk1QGh1YXdlaS5jb20+OyBMaW51
eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT47DQo+IGVyaWMuYXVnZXJAcmVkaGF0LmNvbTsgcWVt
dS1hcm1Abm9uZ251Lm9yZzsgbGVyc2VrQHJlZGhhdC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAxLzddIGV4ZWM6IEZpeCBmb3IgcWVtdV9yYW1fcmVzaXplKCkgY2FsbGJhY2sNCj4gDQo+
ID4+IE9oLCBhbmQgb25lIG1vcmUgcmVhc29uIHdoeSB0aGUgcHJvcG9zYWwgaW4gdGhpcyBwYXRj
aCBpcyBpbmNvbnNpc3RlbnQ6DQo+ID4+DQo+ID4+IFdoZW4gbWlncmF0aW5nIHJlc2l6YWJsZSBt
ZW1vcnkgcmVnaW9ucyAoUkFNX1NBVkVfRkxBR19NRU1fU0laRSkNCj4gd2UNCj4gPj4gc3RvcmUg
dGhlIGJsb2NrLT51c2VkX2xlbmd0aCAocmFtX3NhdmVfc2V0dXAoKSkgYW5kIHVzZSB0aGF0IHZh
bHVlIHRvDQo+ID4+IHJlc2l6ZSB0aGUgcmVnaW9uIG9uIHRoZSB0YXJnZXQgKHJhbV9sb2FkX3By
ZWNvcHkoKSAtPiBxZW11X3JhbV9yZXNpemUoKSkuDQo+ID4+DQo+ID4+IFRoaXMgd2lsbCBiZSB0
aGUgdmFsdWUgdGhlIGNhbGxiYWNrIHdpbGwgYmUgY2FsbGVkIHdpdGguIFBhZ2UgYWxpZ25lZC4N
Cj4gPj4NCj4gPg0KPiA+IFNvcnJ5LCBJIGRpZG7igJl0IHF1aXRlIGdldCB0aGF0IHBvaW50IGFu
ZCBub3Qgc3VyZSBob3cgInJlcV9sZW5ndGgiIGFwcHJvYWNoDQo+ID4gd2lsbCBhZmZlY3QgdGhl
IG1pZ3JhdGlvbi4NCj4gDQo+IFRoZSBpc3N1ZSBpcyB0aGF0IG9uIG1pZ3JhdGlvbiwgeW91IHdp
bGwgbG9zZSB0aGUgc3ViLXBhZ2Ugc2l6ZSBlaXRoZXINCj4gd2F5LiBTbyB5b3VyIGNhbGxiYWNr
IHdpbGwgYmUgY2FsbGVkDQo+IC0gb24gdGhlIG1pZ3JhdGlvbiBzb3VyY2Ugd2l0aCBhIHN1Yi1w
YWdlIHNpemUgKHZpYQ0KPiAgIG1lbW9yeV9yZWdpb25fcmFtX3Jlc2l6ZSgpIGZyb20gZS5nLiwg
aHcvaTM4Ni9hY3BpLWJ1aWxkLmMpDQo+IC0gb24gdGhlIG1pZ3JhdGlvbiB0YXJnZXQgd2l0aCBh
IHBhZ2UtYWxpZ25lZCBzaXplICh2aWENCj4gICBxZW11X3JhbV9yZXNpemUoKSBmcm9tIG1pZ3Jh
dGlvbi9yYW0uYykNCj4gDQo+IFNvIHRoaXMgaXMgaW5jb25zaXN0ZW50LCBlc3BlY2lhbGx5IHdo
ZW4gbWlncmF0aW5nLg0KDQpUaGFua3MgZm9yIGV4cGxhaW5pbmcuIEkgdHJpZWQgdG8gYWRkIHNv
bWUgZGVidWcgcHJpbnRzIHRvIGZ1cnRoZXIgdW5kZXJzdGFuZA0Kd2hhdCBhY3R1YWxseSBoYXBw
ZW5zIGR1cmluZyBtaWdyYXRpb24gY2FzZS4NCg0KR3Vlc3Qtc291cmNlIHdpdGggaW5pdGlhbCBv
bmUgbnZkaW1tDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQoNCi1vYmplY3QgbWVtb3J5LWJhY2tlbmQtcmFtLGlkPW1lbTEsc2l6ZT0xRyBcDQot
ZGV2aWNlIG52ZGltbSxpZD1kaW1tMSxtZW1kZXY9bWVtMSBcDQoNCmZ3X2NmZ19hZGRfZmlsZV9j
YWxsYmFjazogZmlsZW5hbWUgZXRjL2Jvb3QtZmFpbC13YWl0IHNpemUgMHg0DQpmd19jZmdfYWRk
X2ZpbGVfY2FsbGJhY2s6IGZpbGVuYW1lIGV0Yy9hY3BpL252ZGltbS1tZW0gc2l6ZSAweDEwMDAN
CmZ3X2NmZ19hZGRfZmlsZV9jYWxsYmFjazogZmlsZW5hbWUgZXRjL2FjcGkvdGFibGVzIHNpemUg
MHg1NWY0DQpmd19jZmdfYWRkX2ZpbGVfY2FsbGJhY2s6IGZpbGVuYW1lIGV0Yy90YWJsZS1sb2Fk
ZXIgc2l6ZSAweGQwMA0KZndfY2ZnX2FkZF9maWxlX2NhbGxiYWNrOiBmaWxlbmFtZSBldGMvdHBt
L2xvZyBzaXplIDB4MA0KZndfY2ZnX2FkZF9maWxlX2NhbGxiYWNrOiBmaWxlbmFtZSBldGMvYWNw
aS9yc2RwIHNpemUgMHgyNA0KZndfY2ZnX2FkZF9maWxlX2NhbGxiYWNrOiBmaWxlbmFtZSBldGMv
c21iaW9zL3NtYmlvcy10YWJsZXMgc2l6ZSAweDEwNA0KZndfY2ZnX2FkZF9maWxlX2NhbGxiYWNr
OiBmaWxlbmFtZSBldGMvc21iaW9zL3NtYmlvcy1hbmNob3Igc2l6ZSAweDE4DQpmd19jZmdfbW9k
aWZ5X2ZpbGU6IGZpbGVuYW1lIGJvb3RvcmRlciBsZW4gMHgwDQpmd19jZmdfYWRkX2ZpbGVfY2Fs
bGJhY2s6IGZpbGVuYW1lIGJvb3RvcmRlciBzaXplIDB4MA0KZndfY2ZnX21vZGlmeV9maWxlOiBm
aWxlbmFtZSBiaW9zLWdlb21ldHJ5IGxlbiAweDANCmZ3X2NmZ19hZGRfZmlsZV9jYWxsYmFjazog
ZmlsZW5hbWUgYmlvcy1nZW9tZXRyeSBzaXplIDB4MA0KZndfY2ZnX21vZGlmeV9maWxlOiBmaWxl
bmFtZSBldGMvYWNwaS90YWJsZXMgbGVuIDB4NTVmNA0KZndfY2ZnX21vZGlmeV9maWxlOiBmaWxl
bmFtZSBldGMvYWNwaS9yc2RwIGxlbiAweDI0DQpmd19jZmdfbW9kaWZ5X2ZpbGU6IGZpbGVuYW1l
IGV0Yy90YWJsZS1sb2FkZXIgbGVuIDB4ZDAwDQouLi4uDQoNCmhvdCBhZGQgYW5vdGhlciBudmRp
bW0gZGV2aWNlLA0KDQoocWVtdSkgb2JqZWN0X2FkZCBtZW1vcnktYmFja2VuZC1yYW0saWQ9bWVt
MixzaXplPTFHDQoocWVtdSkgZGV2aWNlX2FkZCBudmRpbW0saWQ9ZGltbTIsbWVtZGV2PW1lbTIN
Cg0KDQpyb290QHVidW50dTovIyBjYXQgL2Rldi9wbWVtDQpwbWVtMCAgcG1lbTENCg0KR3Vlc3Qt
dGFyZ2V0IHdpdGggdHdvIG52ZGltbXMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQoNCi1vYmplY3QgbWVtb3J5LWJhY2tlbmQtcmFtLGlkPW1lbTEsc2l6
ZT0xRyBcDQotZGV2aWNlIG52ZGltbSxpZD1kaW1tMSxtZW1kZXY9bWVtMSBcDQotb2JqZWN0IG1l
bW9yeS1iYWNrZW5kLXJhbSxpZD1tZW0yLHNpemU9MUcgXA0KLWRldmljZSBudmRpbW0saWQ9ZGlt
bTIsbWVtZGV2PW1lbTIgXA0KDQpmd19jZmdfYWRkX2ZpbGVfY2FsbGJhY2s6IGZpbGVuYW1lIGV0
Yy9ib290LWZhaWwtd2FpdCBzaXplIDB4NA0KZndfY2ZnX2FkZF9maWxlX2NhbGxiYWNrOiBmaWxl
bmFtZSBldGMvYWNwaS9udmRpbW0tbWVtIHNpemUgMHgxMDAwDQpmd19jZmdfYWRkX2ZpbGVfY2Fs
bGJhY2s6IGZpbGVuYW1lIGV0Yy9hY3BpL3RhYmxlcyBzaXplIDB4NTZhYw0KZndfY2ZnX2FkZF9m
aWxlX2NhbGxiYWNrOiBmaWxlbmFtZSBldGMvdGFibGUtbG9hZGVyIHNpemUgMHhkMDANCmZ3X2Nm
Z19hZGRfZmlsZV9jYWxsYmFjazogZmlsZW5hbWUgZXRjL3RwbS9sb2cgc2l6ZSAweDANCmZ3X2Nm
Z19hZGRfZmlsZV9jYWxsYmFjazogZmlsZW5hbWUgZXRjL2FjcGkvcnNkcCBzaXplIDB4MjQNCmZ3
X2NmZ19hZGRfZmlsZV9jYWxsYmFjazogZmlsZW5hbWUgZXRjL3NtYmlvcy9zbWJpb3MtdGFibGVz
IHNpemUgMHgxMDQNCmZ3X2NmZ19hZGRfZmlsZV9jYWxsYmFjazogZmlsZW5hbWUgZXRjL3NtYmlv
cy9zbWJpb3MtYW5jaG9yIHNpemUgMHgxOA0KZndfY2ZnX21vZGlmeV9maWxlOiBmaWxlbmFtZSBi
b290b3JkZXIgbGVuIDB4MA0KZndfY2ZnX2FkZF9maWxlX2NhbGxiYWNrOiBmaWxlbmFtZSBib290
b3JkZXIgc2l6ZSAweDANCmZ3X2NmZ19tb2RpZnlfZmlsZTogZmlsZW5hbWUgYmlvcy1nZW9tZXRy
eSBsZW4gMHgwDQpmd19jZmdfYWRkX2ZpbGVfY2FsbGJhY2s6IGZpbGVuYW1lIGJpb3MtZ2VvbWV0
cnkgc2l6ZSAweDANCg0KDQpJbml0aWF0ZSBtaWdyYXRpb24gU291cmNlIC0tPiBUYXJnZXQsDQoN
CnJhbV9sb2FkX3ByZWNvcHk6IFJhbSBibGsgbWFjaC12aXJ0LnJhbSBsZW5ndGggMHgxMDAwMDAw
MDAgdXNlZF9sZW5ndGggMHgxMDAwMDAwMDANCnJhbV9sb2FkX3ByZWNvcHk6IFJhbSBibGsgbWVt
MSBsZW5ndGggMHg0MDAwMDAwMCB1c2VkX2xlbmd0aCAweDQwMDAwMDAwDQpyYW1fbG9hZF9wcmVj
b3B5OiBSYW0gYmxrIG1lbTIgbGVuZ3RoIDB4NDAwMDAwMDAgdXNlZF9sZW5ndGggMHg0MDAwMDAw
MA0KcmFtX2xvYWRfcHJlY29weTogUmFtIGJsayB2aXJ0LmZsYXNoMCBsZW5ndGggMHg0MDAwMDAw
IHVzZWRfbGVuZ3RoIDB4NDAwMDAwMA0KcmFtX2xvYWRfcHJlY29weTogUmFtIGJsayB2aXJ0LmZs
YXNoMSBsZW5ndGggMHg0MDAwMDAwIHVzZWRfbGVuZ3RoIDB4NDAwMDAwMA0KcmFtX2xvYWRfcHJl
Y29weTogUmFtIGJsayAvcm9tQGV0Yy9hY3BpL3RhYmxlcyBsZW5ndGggMHg2MDAwIHVzZWRfbGVu
Z3RoIDB4NjAwMA0KcmFtX2xvYWRfcHJlY29weTogUmFtIGJsayAwMDAwOjAwOjAxLjAvdmlydGlv
LW5ldC1wY2kucm9tIGxlbmd0aCAweDQwMDAwIHVzZWRfbGVuZ3RoIDB4NDAwMDANCnJhbV9sb2Fk
X3ByZWNvcHk6IFJhbSBibGsgL3JvbUBldGMvdGFibGUtbG9hZGVyIGxlbmd0aCAweDEwMDAgdXNl
ZF9sZW5ndGggMHgxMDAwDQpyYW1fbG9hZF9wcmVjb3B5OiBSYW0gYmxrIC9yb21AZXRjL2FjcGkv
cnNkcCBsZW5ndGggMHgxMDAwIHVzZWRfbGVuZ3RoIDB4MTAwMA0KDQoNCnJvb3RAdWJ1bnR1Oi8j
IGNhdCAvZGV2L3BtZW0NCnBtZW0wICBwbWVtMSAgDQoNCkZyb20gdGhlIGxvZ3MsIGl0IGxvb2tz
IGxpa2UgdGhlIHJhbV9sb2FkX3ByZWNvcHkoKSAtLT4gcWVtdV9yYW1fcmVzaXplKCkgaXMgbm90
DQpjYWxsZWQgYXMgbGVuZ3RoID09IHVzZWRfbGVuZ3RoIGFuZCBib3RoIHNlZW1zIHRvIGJlIHBh
Z2UgYWxpZ25lZCB2YWx1ZXMuDQpBbmQgZnJvbSBodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11
L2Jsb2IvbWFzdGVyL21pZ3JhdGlvbi9yYW0uYyNMMzQyMQ0KcWVtdV9yYW1fcmVzaXplKCkgaXMg
Y2FsbGVkIHdpdGggbGVuZ3RoIGlmIGxlbmd0aCAhPSB1c2VkX2xlbmd0aC4NCg0KT2YgY291cnNl
IG15IGtub3dsZWRnZSBvbiBRZW11IG1pZ3JhdGlvbiBpcyB2ZXJ5IGxpbWl0ZWQgYW5kIG1heWJl
IEkgYW0NCm1pc3Npbmcgc29tZXRoaW5nIGhlcmUuIEJ1dCBJIGFtIHRyeWluZyB0byBzZWUgdW5k
ZXIgd2hhdCBjaXJjdW1zdGFuY2VzIA0KcWVtdV9yYW1fcmVzaXplKCkgd2lsbCBnZXQgaW52b2tl
ZCB3aXRoIGEgcGFnZSBhbGlnbmVkIHNpemUgdGhhdCB3aWxsIGJlIGRpZmZlcmVudA0KdG8gdGhl
IHNpemUgdXNlZCBpbiB0aGUgRldDZmdFbnRyeSAuIFBsZWFzZSBsZXQgbWUga25vdywNCg0KTXVj
aCBhcHByZWNpYXRlZCwNClNoYW1lZXINCg0KPiBJcyB0aGVyZSBhIHdheSB0byBnZXQgYWNjZXNz
IHRvIHRoZSBzdWItcGFnZSBzaXplIHdpdGhvdXQgcGFzc2luZyBpdA0KPiB0aHJvdWdoIHRoZSBj
YWxsYmFjaz8NCj4gDQo+IExpa2UgaW4gZndfY2ZnX21vZGlmeV9maWxlKCkgZG8gc29tZSBmYW5j
eSBsb29rdXAgYW5kIHVzZSB0aGUgc3ViLXBhZ2UNCj4gc2l6ZSBpbnN0ZWFkIG9mIHRoZSBwYXNz
ZWQgc2l6ZT8gKG1pZ2h0IGhhdmUgdG8gYmUgc3RvcmVkIHNvbWV3aGVyZSBhbmQNCj4gcmVmZXRj
aGVkIC0gYW5kIG1pZ3JhdGVkKQ0KPiANCj4gLS0NCj4gVGhhbmtzLA0KPiANCj4gRGF2aWQgLyBk
aGlsZGVuYg0KDQo=
