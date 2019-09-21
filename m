Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp631754wrp;
        Sat, 21 Sep 2019 06:24:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUDVib3aEtkkZ7PCz8TDN8UPJAk5ao3klKgt4Wy2fAMo8XO6YCadfFEGSXSqpgdLW1w04d
X-Received: by 2002:a17:906:eb92:: with SMTP id mh18mr23412270ejb.298.1569072246932;
        Sat, 21 Sep 2019 06:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569072246; cv=none;
        d=google.com; s=arc-20160816;
        b=FNWyKGHdqHNQ0fwUDDc8ySnL6EOx2bwDEt2RCN5/UqHNh5Ib0nIsFwwdbQA6L+NQ62
         Wo35TTkpSVDCfXDdD+J8ntyXrGQv12ossH08TX8lhSLyLQ0Id8tvePGUK9YG8WaM77lA
         AXUO2mXnGFJgup7A9bbZ5p43BSL7Jsp53xLdiD2tM2uUZl2nwSmMIhgjYJ9SilSWacWI
         yWBAcM0usqNUDvefBhMjwtFORZlwHGAUZelRkukCbFyWylRIXE+dWOuWovWQ66ViPgcg
         gxUU6VUhOneN2v3Yt34IIyaInIscCjk073DL2a3LEoVo0JM9Uwh2qfQNE/pKNDTsaKFA
         1/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=13n4A6DxDtV/X9n2r3QanJu1abRwTXkLtLSDDNnZL5c=;
        b=wOK6IRYb6ZiH5+CKb08go8okdV3oTUTpHYQ61c6f/tjALHwVE34ybggDkOzPQtxMm6
         dBFbqT0QdXfPTo1hPoIGsxXNGhrV6IEqCZpR9sVZrA3pql9rdw5p9rv/sao+sidrSnGW
         CY3X9n565In6wfa7J6SjaKgrD40RvSdjspA2COjD4AVzSZtWs/qR1IHxfryukv3o1gwb
         FrHtf7l18Rp6S4GI9+l2Q0Se164Eyu8aWr3U4d8Mzn4z4cP99OzMTs3HW3ucZawhZXh3
         E3DKkwKz+wsa+B9qohLDDu1yMvtVeJ9SQRyHYHJkyMtR9Uuh+dKVWbm7kVOymeejjIOn
         CtUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o25si2437286ejc.361.2019.09.21.06.24.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Sep 2019 06:24:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBfMr-0005al-S3
	for alex.bennee@linaro.org; Sat, 21 Sep 2019 09:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Stewart.Hildebrand@dornerworks.com>)
 id 1iBfMh-0005Zb-Sx
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 09:23:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Stewart.Hildebrand@dornerworks.com>)
 id 1iBfMg-0001mQ-S4
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 09:23:55 -0400
Received: from mail.dornerworks.com ([12.207.209.150]:35801
 helo=webmail.dornerworks.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <Stewart.Hildebrand@dornerworks.com>)
 id 1iBfMe-0001kO-MN; Sat, 21 Sep 2019 09:23:52 -0400
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, "Peter
 Maydell" <peter.maydell@linaro.org>, Esteban Bosse <estebanbosse@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Pekka Enberg <penberg@iki.fi>,
 =?utf-8?B?Wm9sdMOhbiBCYWxkYXN6dGk=?= <bztemail@gmail.com>
Subject: RE: [Qemu-arm] [RFC PATCH 00/14] hw/arm: Add the Raspberry Pi 4B
Thread-Topic: [Qemu-arm] [RFC PATCH 00/14] hw/arm: Add the Raspberry Pi 4B
Thread-Index: AQHVY0TkMHB97Y0/60qxJoIoRMQ4KKc2NZsg
Date: Sat, 21 Sep 2019 13:25:36 +0000
Message-ID: <e27f5b1a3e92494086340831c3c8513c@dornerworks.com>
References: <20190904171315.8354-1-f4bug@amsat.org>
In-Reply-To: <20190904171315.8354-1-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.139.46]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 12.207.209.150
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5xkusYTs4ggT

T24gV2VkbmVzZGF5LCBTZXB0ZW1iZXIgNCwgMjAxOSAxOjEzIFBNLCBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSB3cm90ZToNCj5Fc3RlYmFuIHdyb3RlIG1lIG92ZXIgdGhlIHdlZWtlbmQgYXNraW5n
IGFib3V0IHJhc3BpNCBwcm9ncmVzcy4NCj5JIGNsZWFuZWQgdXAgbXkgcGF0Y2hlcy9ub3RlcyB0
byBwYXNzIGhpbS4gT3RoZXIgaGVscCBpcyBhbHNvIHdlbGNvbWVkIDopDQo+SSBnb3Qgc2NhcmVk
IHRyeWluZyB0byB1bmRlcnN0YW5kIGhvdyB0byB1c2UgdGhlIEdJQywgYW5kIHdpcmUgdGhlIHZh
cmlvdXMNCj5JUlFzLg0KPg0KPk1vc3QgaW1wb3J0YW50IG5vdGVzIGFib3V0IHRlc3RpbmcgYXJl
IGluIHBhdGNoICMxMjoNCj4iQWRkIHRoZSBCQ00yODM4IHdoaWNoIHVzZXMgYSBHSUN2MiINCj4N
Cj5Ob3QgbXVjaCB3b3JrcyB5ZXQsIGl0IG9ubHkgcnVucyBhIGJpdCB1bnRpbCBjb25maWd1cmlu
ZyB0aGUgR0lDLg0KPg0KPmJyYW5jaCBwdXNoZWQgYXQgaHR0cHM6Ly9naXRsYWIuY29tL3BoaWxt
ZC9xZW11L2NvbW1pdHMvcmFzcGk0X3dpcA0KPg0KPlJlZ2FyZHMsDQo+DQo+UGhpbC4NCg0KSXQg
c2VlbXMgdXBzdHJlYW0gbGludXggbWF5IGJlIGFkb3B0aW5nIHRoZSBCQ00yNzExIG5hbWluZyBj
b252ZW50aW9uIFsxXSwgdGhvdWdoIGl0IGRvZXNuJ3QgbG9vayBsaWtlIHRoZSBzZXJpZXMgWzFd
IGhhcyBiZWVuIGNvbW1pdHRlZCB5ZXQuIFRoZSBTb0MgbmFtZSBpbiBkb2N1bWVudGF0aW9uIGlz
IEJDTTI3MTEgWzJdLiBJIGhhdmUgbm8gb3BpbmlvbiBvbiB3aGljaCBuYW1pbmcgY29udmVudGlv
biB0aGUgUUVNVSBjb21tdW5pdHkgYWRvcHRzLCBJIHNpbXBseSB3YW50ZWQgdG8gcGFzcyBhbG9u
ZyB0aGlzIG9ic2VydmF0aW9uLg0KDQotU3Rldw0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9jb3Zlci8xMTA5MjYxMy8NClsyXSBodHRwczovL3d3dy5yYXNwYmVycnlwaS5vcmcv
ZG9jdW1lbnRhdGlvbi9oYXJkd2FyZS9yYXNwYmVycnlwaS9iY20yNzExL1JFQURNRS5tZA0K
