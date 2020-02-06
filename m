Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1322656lfp;
        Thu, 6 Feb 2020 03:30:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxLuvc0whm6NNKlxRuNp3MJ15SbrHhLVRFmy9zg9plHHLMW+vZ5thkuAHu8GqYSyMcjO//m
X-Received: by 2002:a37:b83:: with SMTP id 125mr2063960qkl.107.1580988631519;
        Thu, 06 Feb 2020 03:30:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580988631; cv=none;
        d=google.com; s=arc-20160816;
        b=Mam30X4HSzz+XC6MSNq5LWpsv6fLisj0c4h3eph9W3aukTrmW6uF5ghM2CWJxtUJTd
         T5WHrlSLJ0uOwt/OfdvkjVU6izXuSIO0E5zBX+qFTNvnon7/BhxfNSSCRY9zcvFEdHwd
         YdV8FTwyNVyjzNodUuupueFHmlBJm662q0LZvvThYuWUDnxgkup7y7bHeKdWAxcfsr2C
         UHapnZ4hhLgV6HesCqLhacQtlxWodNtli4Q+4rxL4iruw1h0An6sWNUDL75gPq42XAHY
         b3fBbA7Df27bqV7muMyB7ymnCgZJ+VMiGRNAKA12RntHKe/XmYoGw94dwwpPYoPfhfT5
         uL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=tIOT4ABFhR3b9oPuZF5z12HvS4yU/SdFUNyzNRiUAhs=;
        b=NzD5p1pr3af3EGkWnJfytP0hZ5Dng0Hfh/YpVMlPlXst0GVe4i9BiAzv8LEi+1yFox
         Ktbr8KK1vYlknP+Bayy0quryoxKIFvpkG2hZuJIeG0znwP9y/kkJ5FRnM6lQqz1Bi0Go
         uvNHNC4stu1zX93wyA+2xS5o5QDeVPlDRn7hmNsYYtqtLiOP1COzICzODC6LKs4fYIyG
         dfVnrZ59PPlkonTV5zrNzpk1a3e+u+KIsC4KYVc2c6xkwCFLalVmawwXfpgbZfRwmFwI
         uSGqLwtouYkW+eMCJ4lNTkn0+djfRSJAm/oZV99NkLL2GT9kDxJrEP0m8vqyo/MZSMXn
         zPbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j33si1306677qtb.46.2020.02.06.03.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 03:30:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izfMc-0000vY-Sg
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 06:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1izfKi-0007Lj-36
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:28:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1izfKf-0005ao-Sy
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:28:31 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2073 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1izfKd-0004tr-38; Thu, 06 Feb 2020 06:28:27 -0500
Received: from lhreml707-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 232C216FF5E7B22F61CA;
 Thu,  6 Feb 2020 11:28:23 +0000 (GMT)
Received: from lhreml707-chm.china.huawei.com (10.201.108.56) by
 lhreml707-cah.china.huawei.com (10.201.108.48) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 6 Feb 2020 11:28:22 +0000
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml707-chm.china.huawei.com (10.201.108.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Thu, 6 Feb 2020 11:28:22 +0000
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.1713.004; Thu, 6 Feb 2020 11:28:22 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: RE: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
Thread-Topic: [PATCH v2 1/7] exec: Fix for qemu_ram_resize() callback
Thread-Index: AQHVzV43w2nN4JnxQEOUTwT8NpSKx6gLQ1MAgAAWtoCAACc+AIABYS3wgAAIyYCAAR1e4IAAFJiAgAAHflA=
Date: Thu, 6 Feb 2020 11:28:22 +0000
Message-ID: <e97fa28c653044b8bab66aeca2374682@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-2-shameerali.kolothum.thodi@huawei.com>
 <20200204162320.67e5d353@redhat.com>
 <74eaaa45-0d20-9a21-fbf8-6d29deb248eb@redhat.com>
 <4ce41554-8b8e-dbb5-5fe9-43af09950f23@redhat.com>
 <8e0b2c762e914c64bebfab5fc7441661@huawei.com>
 <133f274e-e942-7008-93d2-8edb1bc4d7ae@redhat.com>
 <52fff289cca14874ad493fc25806fe3d@huawei.com>
 <f041380c-afcb-f8d8-89db-8f48c7b46767@redhat.com>
In-Reply-To: <f041380c-afcb-f8d8-89db-8f48c7b46767@redhat.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zyKVreEiNiaX

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGF2aWQgSGlsZGVuYnJh
bmQgW21haWx0bzpkYXZpZEByZWRoYXQuY29tXQ0KPiBTZW50OiAwNiBGZWJydWFyeSAyMDIwIDEw
OjU2DQo+IFRvOiBTaGFtZWVyYWxpIEtvbG90aHVtIFRob2RpIDxzaGFtZWVyYWxpLmtvbG90aHVt
LnRob2RpQGh1YXdlaS5jb20+Ow0KPiBJZ29yIE1hbW1lZG92IDxpbWFtbWVkb0ByZWRoYXQuY29t
Pg0KPiBDYzogcGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnOyB4aWFvZ3Vhbmdyb25nLmVyaWNAZ21h
aWwuY29tOw0KPiBtc3RAcmVkaGF0LmNvbTsgc2hhbm5vbi56aGFvc2xAZ21haWwuY29tOyBxZW11
LWRldmVsQG5vbmdudS5vcmc7DQo+IHh1d2VpIChPKSA8eHV3ZWk1QGh1YXdlaS5jb20+OyBMaW51
eGFybSA8bGludXhhcm1AaHVhd2VpLmNvbT47DQo+IGVyaWMuYXVnZXJAcmVkaGF0LmNvbTsgcWVt
dS1hcm1Abm9uZ251Lm9yZzsgbGVyc2VrQHJlZGhhdC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAxLzddIGV4ZWM6IEZpeCBmb3IgcWVtdV9yYW1fcmVzaXplKCkgY2FsbGJhY2sNCg0KWy4u
Ll0NCiANCj4gPiByb290QHVidW50dTovIyBjYXQgL2Rldi9wbWVtDQo+ID4gcG1lbTAgIHBtZW0x
DQo+ID4NCj4gPiBGcm9tIHRoZSBsb2dzLCBpdCBsb29rcyBsaWtlIHRoZSByYW1fbG9hZF9wcmVj
b3B5KCkgLS0+IHFlbXVfcmFtX3Jlc2l6ZSgpIGlzDQo+IG5vdA0KPiA+IGNhbGxlZCBhcyBsZW5n
dGggPT0gdXNlZF9sZW5ndGggYW5kIGJvdGggc2VlbXMgdG8gYmUgcGFnZSBhbGlnbmVkIHZhbHVl
cy4NCj4gPiBBbmQgZnJvbQ0KPiBodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11L2Jsb2IvbWFz
dGVyL21pZ3JhdGlvbi9yYW0uYyNMMzQyMQ0KPiA+IHFlbXVfcmFtX3Jlc2l6ZSgpIGlzIGNhbGxl
ZCB3aXRoIGxlbmd0aCBpZiBsZW5ndGggIT0gdXNlZF9sZW5ndGguDQo+IA0KPiBBc3N1bWUgb24g
eW91ciBzb3VyY2UsIHRoZSBvbGQgc2l6ZSBpcyAxMjM0NSBieXRlcy4gU28gMTYzODQgYWxpZ25l
ZCB1cA0KPiAoNCBwYWdlcykuDQo+IA0KPiBBc3N1bWUgb24geW91ciB0YXJnZXQsIHRoZSBuZXcg
c2l6ZSBpcyAxMjM0NTYgYnl0ZXMsIHNvIDEyNjk3NiBhbGlnbmVkDQo+IHVwICgzMSBwYWdlcyku
DQo+IA0KPiBJZiB5b3UgbWlncmF0ZSBmcm9tIHNvdXJjZSB0byBkZXN0aW5hdGlvbiwgdGhlIG1p
Z3JhdGlvbiBjb2RlIHdvdWxkDQo+IHJlc2l6ZSB0byAxNjM4NCwgYWx0aG91Z2ggdGhlICJhY3R1
YWwgc2l6ZSIgaXMgMTIzNDUuIFRoZSBjYWxsYmFjayB3aWxsDQo+IGJlIGNhbGxlZCB3aXRoIHRo
ZSBhbGlnbmVkIHNpemUsIG5vdCB0aGUgYWN0dWFsIHNpemUuIFNhbWUgdGhlIG90aGVyIHdheQ0K
PiBhcm91bmQuIFRoYXQncyB3aGF0J3MgaW5jb25zaXN0ZW50IElNSE8uDQoNClRoYW5rcy4gWW91
IGFyZSByaWdodC4gSSBkaWRu4oCZdCBjb25zaWRlciB0aGUgY2FzZSB3aGVyZSB0aGUgdGFyZ2V0
IGNhbiBiZQ0KY29uZmlndXJlZCB3aXRoIGEgbGFyZ2VyIG51bWJlciBvZiBkZXZpY2VzIHRoYW4g
dGhlIHNvdXJjZS4gSSBjYW4gcmVwbGljYXRlDQp0aGUgc2NlbmFyaW8gbm93LA0KDQpTb3VyY2U6
DQoNCmZ3X2NmZ19hZGRfZmlsZV9jYWxsYmFjazogZmlsZW5hbWUgZXRjL2Jvb3QtZmFpbC13YWl0
IHNpemUgMHg0DQpmd19jZmdfYWRkX2ZpbGVfY2FsbGJhY2s6IGZpbGVuYW1lIGV0Yy9hY3BpL252
ZGltbS1tZW0gc2l6ZSAweDEwMDANCmZ3X2NmZ19hZGRfZmlsZV9jYWxsYmFjazogZmlsZW5hbWUg
ZXRjL2FjcGkvdGFibGVzIHNpemUgMHg2MjEwDQoNClRhcmdldDoNCnJhbV9sb2FkX3ByZWNvcHk6
IFJhbSBibGsgbWVtMSBsZW5ndGggMHg0MDAwMDAwMCB1c2VkX2xlbmd0aCAweDQwMDAwMDAwDQpy
YW1fbG9hZF9wcmVjb3B5OiBSYW0gYmxrIHZpcnQuZmxhc2gwIGxlbmd0aCAweDQwMDAwMDAgdXNl
ZF9sZW5ndGggMHg0MDAwMDAwDQpyYW1fbG9hZF9wcmVjb3B5OiBSYW0gYmxrIHZpcnQuZmxhc2gx
IGxlbmd0aCAweDQwMDAwMDAgdXNlZF9sZW5ndGggMHg0MDAwMDAwDQpyYW1fbG9hZF9wcmVjb3B5
OiBSYW0gYmxrIC9yb21AZXRjL2FjcGkvdGFibGVzIGxlbmd0aCAweDcwMDAgdXNlZF9sZW5ndGgg
MHg4MDAwDQpmd19jZmdfbW9kaWZ5X2ZpbGU6IGZpbGVuYW1lIGV0Yy9hY3BpL3RhYmxlcyBsZW4g
MHg3MDAwDQoNClRhcmdldCB1cGRhdGVzIEZXQ2ZnRW50cnkgd2l0aCBhIHBhZ2UgYWxpZ25lZCBz
aXplIDooLiBJIHdpbGwgbG9vayBpbnRvIHRoaXMgYW5kIHNlZSBob3cNCndlIGNhbiBzb2x2ZSB0
aGlzLiBBbnkgcG9pbnRlcnMgd2VsY29tZS4NCg0KQ2hlZXJzLA0KU2hhbWVlcg0K
