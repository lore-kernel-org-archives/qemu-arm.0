Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5183301wrt;
        Mon, 15 Oct 2018 18:19:49 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61kOeNuvXNCzvQeWDpF4uv5rOPJsMCL9YzWsOmQ7MhBuUcz/Q6OI5MgJu7IKcG9kaISQJ7B
X-Received: by 2002:a0c:c487:: with SMTP id u7mr7611828qvi.152.1539652789009;
        Mon, 15 Oct 2018 18:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539652789; cv=none;
        d=google.com; s=arc-20160816;
        b=ThDqhfC2DSt+nkmPVMnEzrJlyRbBQl25eoFfklXprTUycIMl+665ckNwE6yiBY1T+I
         nDMgTJnQxSyQWXGfIO9XCBsJ4IxjS1A8gnYOk4Tekf3KkzTMzQ0gNJEe7sCBVGRbj+M3
         g/K8XjTYnnQAdT9nAC5BHBy68eT5iCSW6dM5sneYXJPLYrRISursxlDmm5vaWNHGprBK
         NFHQcAQGnAuuiiA9AoqyncrRgDrDo452Brlp17ldcWKFvRpvLuXoWSmFAug4ksWyFR7m
         SkEc5jXvPfYEhzRk2F9FYz5CPeyUy3j9ucoHXInvx/KUsUiF9pm22NOTLXnF17rAjcaD
         lUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=+uueUBtSJJ6uRbXp45Co/wWY+z85Jr0ECIW43YEqX7M=;
        b=zmcJMUDBZkPJGmY6VzoBGlbgZ8DDQ+wlWxbpHzCJAEeUAZfeODxAp7sPXQ474+0v39
         AlUw8nS6Wtz1a/U2BQKqg+RTsGzDv/z2NO0c6CRkG5YCBjTpgiB+UHgY/6a3XDgxf6uv
         s5U9Z/PnLli477XsAVV1+ycA6heTBmFuhWH6C7jxqLnlAMNRP3XGR9YfpIDHMlTwFQAd
         RO/J1iFnouOg4j+SQ1AfxmxkRPwacdI8DpFJ4BGNKjtReA9qH0D4RAnzBSX0EKg5upcO
         ePhXgZWDxAnMpIOSENSfrE6KL1j4R7EtTXWAqLdaOdX2G3bgOcOX13RgMeRLQPo0NlLC
         10GA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c14si2405798qvs.101.2018.10.15.18.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 18:19:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCE1U-0002Go-Ge
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 21:19:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stewart.Hildebrand@dornerworks.com>)
	id 1gCE1N-0002Gi-Pa
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 21:19:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stewart.Hildebrand@dornerworks.com>)
	id 1gCE1K-0002qO-LU
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 21:19:41 -0400
Received: from mail.dornerworks.com ([12.207.209.150]:47934
	helo=webmail.dornerworks.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stewart.Hildebrand@dornerworks.com>)
	id 1gCE1K-0002nv-Dc; Mon, 15 Oct 2018 21:19:38 -0400
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] hw/arm/boot: Increase compliance with
	kernel arm64 boot protocol.
Thread-Index: AdRkyzsaagNMJ8GXSq2USPRWdR9FZgAKXksAAAMCg5A=
Date: Tue, 16 Oct 2018 01:19:35 +0000
Message-ID: <65e2edeee9d94a288938da9cec4b16bb@dornerworks.com>
References: <40eb19fb56b24e10a5eaa99ccb78aff6@dornerworks.com>
	<73dcea68-2342-63b7-9691-a151f00a42e8@redhat.com>
In-Reply-To: <73dcea68-2342-63b7-9691-a151f00a42e8@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.56.164]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 12.207.209.150
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/boot: Increase
 compliance with kernel arm64 boot protocol.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Julien Grall <julien.grall@arm.com>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hi+IV+JC5kWg

SGkgUGhpbGlwcGUsDQoNCk9uIE1vbmRheSwgT2N0b2JlciAxNSwgMjAxOCA2OjA1IFBNLCBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToNCj4gSGkgU3Rld2FydCwNCj4gDQo+IE9uIDE1LzEw
LzIwMTggMjM6MjYsIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToNCj4gPiArICAgICAgICAgICAg
LyogRm9yIHRoZSB2aXJ0IGJvYXJkLCB3ZSB3cml0ZSBvdXIgc3RhcnR1cCAiYm9vdGxvYWRlciIg
YXQgdGhlIHZlcnkNCj4gPiArICAgICAgICAgICAgICogYm90dG9tIG9mIFJBTSwgc28gdGhhdCBi
aXQgY2FuJ3QgYmUgdXNlZCBmb3IgdGhlIGltYWdlLiBUbyBhdm9pZA0KPiA+ICsgICAgICAgICAg
ICAgKiBvdmVybGFwIGluIGNhc2UgdGhlIGltYWdlIHJlcXVlc3RzIHRvIGJlIGxvYWRlZCBhdCBh
biBvZmZzZXQNCj4gPiArICAgICAgICAgICAgICogc21hbGxlciB0aGFuIG91ciBib290bG9hZGVy
LCB3ZSBpbmNyZW1lbnQgdGhlIGxvYWQgb2Zmc2V0IHRvIHRoZQ0KPiA+ICsgICAgICAgICAgICAg
KiBuZXh0IDJNQi4NCj4gPiArICAgICAgICAgICAgICovDQo+ID4gKyAgICAgICAgICAgIGlmIChr
ZXJuZWxfbG9hZF9vZmZzZXQgPCBGSVhVUF9NQVgpIHsNCj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFu
ZCBob3cgdGhpcyBpcyByZWxhdGVkIHRvIEZJWFVQX01BWC4uLg0KDQpZb3UncmUgcmlnaHQsIG15
IGFwb2xvZ2llcywgaXQncyBub3QgZGlyZWN0bHkgcmVsYXRlZC4NCndyaXRlX2Jvb3Rsb2FkZXIo
KSBjYWxjdWxhdGVzIHRoZSBzaXplIG9mIHRoZSBib290bG9hZGVyIGxpa2Ugc286DQogICAgbGVu
ID0gMDsNCiAgICB3aGlsZSAoaW5zbnNbbGVuXS5maXh1cCAhPSBGSVhVUF9URVJNSU5BVE9SKSB7
DQogICAgICAgIGxlbisrOw0KICAgIH0NCg0KVGhlIHNpemUgb2YgdGhlIGJvb3Rsb2FkZXIgdGhl
biB3b3VsZCBiZSBsZW4gKiBzaXplb2YodWludDMyX3QpDQoNCkl0IHdvdWxkIGJlIG5pY2Ugbm90
IHRvIGhhdmUgdG8gcmVwZWF0IHRoYXQgbG9naWMgaW4gbG9hZF9hYXJjaDY0X2ltYWdlKCkuIEkn
bGwgc2VuZCBvdXQgYSB2MiBhZnRlciBJIHRha2Ugc29tZSB0aW1lIHRvIHdyYXAgbXkgaGVhZCBh
cm91bmQgaXQuLi4NCiANCj4gDQo+ID4gKyAgICAgICAgICAgICAgICBrZXJuZWxfbG9hZF9vZmZz
ZXQgKz0gMiA8PCAyMDsNCj4gDQo+IFlvdSBjYW4gdXNlICs9IDIgKiBNaUI7IHdoaWNoIGlzIGVh
c2llciB0byByZXZpZXcuDQoNCk9LLCBJIHdpbGwgaW5jbHVkZSB0aGlzIGluIHYyLg0K
