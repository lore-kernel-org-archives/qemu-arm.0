Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4589517lfm;
        Tue, 30 Jun 2020 18:23:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqbUlyAihNWSBfylnC2sXMl3zlgy2oqXU7nzkFtWIlc3RUNUbDWFOqM5i6s7xg6jDceCHl
X-Received: by 2002:a25:aaa9:: with SMTP id t38mr37278640ybi.312.1593566625628;
        Tue, 30 Jun 2020 18:23:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593566625; cv=none;
        d=google.com; s=arc-20160816;
        b=qMTckEoRmHQWv6O5JoaxQ0xvOPFw0qV/3JwzgcSGt8aloFVPphPEi1SgSCJjjAn0HO
         thp43xcFBx7zlHh7ukDzE7tzDnbSumBmqdU9ttb9nt62ie1cUlb2VMIyURqTss3HQdfy
         x83E9JGtgTvix5qyW5RIkesF/+VoF09LMiOxHSZ/qesDASJGhTYHG6jLvdD1ovpiKuT0
         Hdw3YLLH4twlyKKGBqy9bVMz0f+/7jPhMdNV7cpAmW9uW+QflVluyuHlxHaiGobE9sfm
         FAhk05WMtoiTYqIlrMQMkaI7SD6Sh19sYDfZVhQTitqPsYn1NXEIjebkhDFZHLlZ6O4e
         EwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=v1bclBmCGavRMcxT4zRgjgdaDdAfVzXVJcSo7FlxGoY=;
        b=gULHFgghZvmt90uZTALMQLHOLpXYxpbGX7EoakUxue7IeT2xjyec/7HtGAv5bgC7hk
         800tsNAAXMZ9oEOgHxLxJmDTqiywuANQRBhSSOLh5/iH82GSgdivXfW9PD6aK/UK0RPd
         pybxECiaFhMLaHxU0ONYpLvn6Q6fuRH+2H7knf+v1KwyYdYtrvpyoGcbQyiqmGpow3LJ
         60clLpalD5nsZBuHFTb9nIQ56F3gOkMiQtBjGfYHfpNqMfuGLaAw5uXRdQtFXDahZHvO
         FBlaZ800vXzJxu976O5WlFsT+aXaODYGWRIiKIlWMsVwvsbsphY/VCd4LtutsOyM3Y6y
         pWtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k186si4481891ybf.383.2020.06.30.18.23.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 18:23:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqRTV-0002G2-34
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 21:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ryan_chen@aspeedtech.com>)
 id 1jqRTM-0002Fo-7t
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 21:23:36 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:64418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ryan_chen@aspeedtech.com>)
 id 1jqRTJ-0005NJ-9n
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 21:23:35 -0400
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 06119450070585;
 Wed, 1 Jul 2020 09:09:04 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Wed, 1 Jul
 2020 09:22:49 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Wed, 1 Jul 2020 09:22:49 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Erik Smit <erik.lucas.smit@gmail.com>
Subject: RE: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
Thread-Topic: hw/misc/aspeed_scu: 5d971f9e breaks Supermicro AST2400
Thread-Index: AQHWT0IluBL17ijHoESHjeZzLp9Qxajx7Vfw
Date: Wed, 1 Jul 2020 01:22:49 +0000
Message-ID: <b3480de1dece41ed80091feba584c500@TWMBX02.aspeed.com>
References: <CA+MHfoubt1g2FzcjTw3a0vNr7X2T8Jb+nYoc4_x=Z2TP51afKg@mail.gmail.com>
 <a7acba46-5a9a-5dd2-71c6-7e4586485823@amsat.org>
 <CA+MHfot6FdS2yT0mEsCW36bCfwy-WY-1KPQ-KDfYBKzTy=Gd7w@mail.gmail.com>
 <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
In-Reply-To: <CACPK8Xdqr+EufMgooCY=D+Vt98qu11YTHE5Fzi5+xqX=wKReeQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.2.87]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 06119450070585
Received-SPF: none client-ip=211.20.114.71;
 envelope-from=ryan_chen@aspeedtech.com; helo=twspam01.aspeedtech.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 21:23:21
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2FlAvmAZmts3

SGVsbG8gSm9lbCwNCglNb3N0IHJlZ2lzdGVyIGlzIG5vdCBzdXBwb3J0IGJ5dGUgYWNjZXNzLCBp
dCBuZWVkIHRvIHJlZmVyIHRoZSBkYXRhc2hlZXQgZGVzY3JpcHQgZWFjaCBhcmVhLiBbY2hhcHRl
ciA6IEFSTSBBZGRyZXNzIFNwYWNlIE1hcHBpbmddDQoNClJ5YW4gQ2hlbg0KDQpUZWwgOiA4ODYt
My01NzUxMTg1IGV4dDo4ODU3DQoNCioqKioqKioqKioqKiogRW1haWwgQ29uZmlkZW50aWFsaXR5
IE5vdGljZSAqKioqKioqKioqKioqKioqKioqKg0K5YWN6LKs6IGy5piOOg0K5Zug5oeJ5YCL5Lq6
6LOH5paZ5L+d6K235rOV5pa96KGMLOacrOS/oeS7tijmiJblhbbpmYTku7Yp5Y+v6IO95YyF5ZCr
5qmf5a+G6LOH6KiK77yM5Lim5Y+X5rOV5b6L5L+d6K2344CC5aaCIOWPsOerr+mdnuaMh+WumuS5
i+aUtuS7tuiAhe+8jOiri+S7pembu+WtkOmDteS7tumAmuefpeacrOmbu+WtkOmDteS7tuS5i+eZ
vOmAgeiAhSwg5Lim6KuL56uL5Y2z5Yiq6Zmk5pys6Zu75a2Q6YO15Lu25Y+K5YW26ZmE5Lu25ZKM
6Yq35q+A5omA5pyJ6KSH5Y2w5Lu244CC6Kyd6Kyd5oKo55qE5ZCI5L2cIQ0KDQpESVNDTEFJTUVS
Og0KVGhpcyBtZXNzYWdlIChhbmQgYW55IGF0dGFjaG1lbnRzKSBtYXkgY29udGFpbiBsZWdhbGx5
IHByaXZpbGVnZWQgYW5kL29yIG90aGVyIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbi4gSWYgeW91
IGhhdmUgcmVjZWl2ZWQgaXQgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSBy
ZXBseSBlLW1haWwgYW5kIGltbWVkaWF0ZWx5IGRlbGV0ZSB0aGUgZS1tYWlsIGFuZCBhbnkgYXR0
YWNobWVudHMgd2l0aG91dCBjb3B5aW5nIG9yIGRpc2Nsb3NpbmcgdGhlIGNvbnRlbnRzLiBUaGFu
ayB5b3UuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKb2VsIFN0YW5sZXkg
W21haWx0bzpqb2VsQGptcy5pZC5hdV0gDQpTZW50OiBXZWRuZXNkYXksIEp1bHkgMSwgMjAyMCA4
OjU0IEFNDQpUbzogRXJpayBTbWl0IDxlcmlrLmx1Y2FzLnNtaXRAZ21haWwuY29tPjsgUnlhbiBD
aGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQpDYzogUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPGY0YnVnQGFtc2F0Lm9yZz47IG9wZW4gbGlzdDpBU1BFRUQgQk1DcyA8cWVtdS1hcm1Abm9u
Z251Lm9yZz47IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+OyBBbmRyZXcgSmVmZmVy
eSA8YW5kcmV3QGFqLmlkLmF1Pg0KU3ViamVjdDogUmU6IGh3L21pc2MvYXNwZWVkX3NjdTogNWQ5
NzFmOWUgYnJlYWtzIFN1cGVybWljcm8gQVNUMjQwMA0KDQpPbiBUdWUsIDMwIEp1biAyMDIwIGF0
IDE1OjMyLCBFcmlrIFNtaXQgPGVyaWsubHVjYXMuc21pdEBnbWFpbC5jb20+IHdyb3RlOg0KPg0K
PiBIaSBQaGlsaXBwZSwNCj4NCj4gT24gVHVlLCAzMCBKdW4gMjAyMCBhdCAxNzoyOSwgUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBIaSBF
cmlrLA0KPiA+DQo+ID4gT24gNi8zMC8yMCA1OjExIFBNLCBFcmlrIFNtaXQgd3JvdGU6DQo+ID4g
PiBIZWxsbywNCj4gPiA+DQo+ID4gPiA1ZDk3MWY5ZSBtZW1vcnk6IFJldmVydCAibWVtb3J5OiBh
Y2NlcHQgbWlzbWF0Y2hpbmcgc2l6ZXMgaW4gDQo+ID4gPiBtZW1vcnlfcmVnaW9uX2FjY2Vzc192
YWxpZCIgYnJlYWtzIFN1cGVybWljcm8gQVNUMjQwMCB1LWJvb3QuDQo+ID4gPiBTdXBlcm1pY3Jv
IEFTVDI1MDAgdS1ib290IGlzIGZpbmUuDQo+ID4gPg0KPiA+ID4gVGhlIHUtYm9vdCB0cmllcyB0
byBtYWtlIGEgMi1ieXRlIHJlYWQgZnJvbSBhZGRyZXNzIDB4ODQsIGJ1dCANCj4gPiA+IGFzcGVl
ZF9hc3QyNDAwX3NjdV9vcHMgaGFzIG1pbl9hY2Nlc3MgPSA0LiBXaGVuIEkgY2hhbmdlIA0KPiA+
ID4gbWluX2FjY2VzcyB0bw0KPiA+ID4gMiBvciByZXZlcnQgYWJvdmUgY29tbWl0LCB1LWJvb3Qg
Ym9vdHMgYWdhaW4uDQo+ID4gPg0KPiA+ID4gSXMgY2hhbmdpbmcgbWluX2FjY2VzcyB0byAyIHRo
ZSByaWdodCB3YXkgdG8gZml4IHRoaXM/DQoNClJ5YW4sIGRvIGFsbCBhZGRyZXNzZXMgb24gdGhl
IEFTVDI0MDAncyBBUEIgcmVzcG9uZCB0byBzaW5nbGUgYnl0ZSBhY2Nlc3Nlcz8NCg0KPiA+DQo+
ID4gSWYgeW91IGhhdmUgYWNjZXNzIHRvIHRoZSBkYXRhc2hlZXQgYW5kIGNhbiB2ZXJpZnksIHRo
ZW4geWVzLg0KPiA+IEVsc2UgSSBzdXBwb3NlIEPDqWRyaWMsIEFuZHJldyBvciBKb2VsIGNhbiBj
aGVjayBmb3IgeW91Lg0KPg0KPiBJIGRvIG5vdCBoYXZlIGEgZGF0YXNoZWV0LiBBc3BlZWQgc2Vl
bXMgcXVpdGUgcGlja3kgYWJvdXQgc2hhcmluZyB0aGlzIA0KPiBhbmQgSSdtIGp1c3QgYSByYW5k
b20gcmVzZWFyY2hlci4NCg0KRXJpaywgY2FuIHlvdSBwb2ludCB1cyB0byB0aGUgaW1hZ2UgeW91
J3JlIHVzaW5nPw0KDQpXaGF0IGlzIHRoZSBjb21tYW5kIGxpbmUgYXJlIHlvdSB0ZXN0aW5nIHdp
dGg/DQoNCkhhcHB5IHRvIGZpeCB0aGUgbW9kZWwgdG8gc3VwcG9ydCByYW5kb20gZmlybXdhcmVz
LCBhcyBsb25nIGFzIHRoZSBmaXggaXMgY29ycmVjdCBmb3Igb3RoZXIgKG9wZW4gc291cmNlKSBm
aXJtd2FyZXMuDQoNCj4NCj4gQmVzdCByZWdhcmRzLA0KPg0KPiBFcmlrIFNtaXQNCg==
