Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4970376wrt;
        Mon, 15 Oct 2018 14:27:17 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61X5h7M+BBRgCxBoEiriKJ3Txyj2Bx2ckToc24xRnjQqSAsgUKhi463hJN7QQETbVtYcyH2
X-Received: by 2002:a37:1885:: with SMTP id 5-v6mr17786916qky.275.1539638837612;
        Mon, 15 Oct 2018 14:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539638837; cv=none;
        d=google.com; s=arc-20160816;
        b=MRUSNrDnrjScR2dG7e8HZmMVJ0/vlSX8J888nrOeMlELkeTLfllKlWbnY3m35XxoTg
         MV/cp4z3reb3UvV280IIpQaTNsy1r/JD+XLw7V7rzcWu6vKVOBRMrI+/Mvwif9f5Z+tV
         j1zQQYjGdjwbGvAhn2K/0W1sf3YC7IKbFGOfOnNlgcfXIUtAqlZvipBEnvXiBMZbAUyq
         Ba8wW8C7atfObTbFRHU18mf9iBrNXhDEuDXr2135JgDdGYdrhPiguZfsvdXPfMrEVLRo
         /5AqLP2Y03HyM6D/1pdrWzi8e2Pm2ILOkTrwtUA+A0oABqNYtHfCcwbeZyXpJvJOgT1s
         rWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from;
        bh=2/N6KbZEiumZcwY0dDRGOfQH+ayRpU/3F0aBGIiwquM=;
        b=N420iqw49JHCiLYq7jFdbZDLE8wbjdNyXb5poj5iBs60dOfaw88HEmsjiRpowJabvH
         FQwA5MzAWcAB4MxPVot3TkKVacfG5QrUR8aVp8Hgl4iqfiTaqJbjjQZl+zxihwE8DSBW
         qd3FxZlSxN5Eku5VoqOX/GV4yDXRZ2wayI983adWc4Bh1uAxXOTw2WR20pv6N2rlAM/3
         E5KjzhGOn5BOee4m54yB29pfSHIQZ1bYydF4FYuvmrpvPYJXP6Xtu7es/2Mwzc5GINYW
         Jr+tq4EMbDXWbbx26Rib3cvFpurCHKZCfdIEvEfGDUZJor64Za8wcRYtfWioHf84yMk2
         kMUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i50si720128qvh.71.2018.10.15.14.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 14:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCAOT-0002Wd-1F
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 17:27:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stewart.Hildebrand@dornerworks.com>)
	id 1gCAO0-0002WD-SS
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 17:26:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stewart.Hildebrand@dornerworks.com>)
	id 1gCAO0-0001Ct-07
	for qemu-devel@nongnu.org; Mon, 15 Oct 2018 17:26:48 -0400
Received: from mail.dornerworks.com ([12.207.209.150]:42433
	helo=webmail.dornerworks.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stewart.Hildebrand@dornerworks.com>)
	id 1gCANu-00013Z-F9; Mon, 15 Oct 2018 17:26:42 -0400
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH] hw/arm/boot: Increase compliance with kernel arm64 boot
	protocol.
Thread-Index: AdRkyzsaagNMJ8GXSq2USPRWdR9FZg==
Date: Mon, 15 Oct 2018 21:26:39 +0000
Message-ID: <40eb19fb56b24e10a5eaa99ccb78aff6@dornerworks.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.14.152]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 12.207.209.150
Subject: [Qemu-devel] [PATCH] hw/arm/boot: Increase compliance with kernel
 arm64 boot protocol.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Julien Grall <julien.grall@arm.com>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WtY6QNyJnCIi

IlRoZSBJbWFnZSBtdXN0IGJlIHBsYWNlZCB0ZXh0X29mZnNldCBieXRlcyBmcm9tIGEgMk1CIGFs
aWduZWQgYmFzZQ0KYWRkcmVzcyBhbnl3aGVyZSBpbiB1c2FibGUgc3lzdGVtIFJBTSBhbmQgY2Fs
bGVkIHRoZXJlLiINCg0KRm9yIHRoZSB2aXJ0IGJvYXJkLCB3ZSB3cml0ZSBvdXIgc3RhcnR1cCBi
b290bG9hZGVyIGF0IHRoZSB2ZXJ5DQpib3R0b20gb2YgUkFNLCBzbyB0aGF0IGJpdCBjYW4ndCBi
ZSB1c2VkIGZvciB0aGUgaW1hZ2UuIFRvIGF2b2lkDQpvdmVybGFwIGluIGNhc2UgdGhlIGltYWdl
IHJlcXVlc3RzIHRvIGJlIGxvYWRlZCBhdCBhbiBvZmZzZXQNCnNtYWxsZXIgdGhhbiBvdXIgYm9v
dGxvYWRlciwgd2UgaW5jcmVtZW50IHRoZSBsb2FkIG9mZnNldCB0byB0aGUNCm5leHQgMk1CLg0K
DQpUaGlzIGZpeGVzIGEgYm9vdCBmYWlsdXJlIGZvciBYZW4gQUFyY2g2NC4NCg0KU2lnbmVkLW9m
Zi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29ya3Mu
Y29tPg0KLS0tDQogaHcvYXJtL2Jvb3QuYyB8IDEwICsrKysrKysrKysNCiAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvaHcvYXJtL2Jvb3QuYyBiL2h3L2Fy
bS9ib290LmMNCmluZGV4IDIwYzcxZDdkOTYuLjU1OWRkYmNkNTMgMTAwNjQ0DQotLS0gYS9ody9h
cm0vYm9vdC5jDQorKysgYi9ody9hcm0vYm9vdC5jDQpAQCAtOTE5LDYgKzkxOSwxNiBAQCBzdGF0
aWMgdWludDY0X3QgbG9hZF9hYXJjaDY0X2ltYWdlKGNvbnN0IGNoYXIgKmZpbGVuYW1lLCBod2Fk
ZHIgbWVtX2Jhc2UsDQogICAgICAgICBtZW1jcHkoJmhkcnZhbHMsIGJ1ZmZlciArIEFSTTY0X1RF
WFRfT0ZGU0VUX09GRlNFVCwgc2l6ZW9mKGhkcnZhbHMpKTsNCiAgICAgICAgIGlmIChoZHJ2YWxz
WzFdICE9IDApIHsNCiAgICAgICAgICAgICBrZXJuZWxfbG9hZF9vZmZzZXQgPSBsZTY0X3RvX2Nw
dShoZHJ2YWxzWzBdKTsNCisNCisgICAgICAgICAgICAvKiBGb3IgdGhlIHZpcnQgYm9hcmQsIHdl
IHdyaXRlIG91ciBzdGFydHVwICJib290bG9hZGVyIiBhdCB0aGUgdmVyeQ0KKyAgICAgICAgICAg
ICAqIGJvdHRvbSBvZiBSQU0sIHNvIHRoYXQgYml0IGNhbid0IGJlIHVzZWQgZm9yIHRoZSBpbWFn
ZS4gVG8gYXZvaWQNCisgICAgICAgICAgICAgKiBvdmVybGFwIGluIGNhc2UgdGhlIGltYWdlIHJl
cXVlc3RzIHRvIGJlIGxvYWRlZCBhdCBhbiBvZmZzZXQNCisgICAgICAgICAgICAgKiBzbWFsbGVy
IHRoYW4gb3VyIGJvb3Rsb2FkZXIsIHdlIGluY3JlbWVudCB0aGUgbG9hZCBvZmZzZXQgdG8gdGhl
DQorICAgICAgICAgICAgICogbmV4dCAyTUIuDQorICAgICAgICAgICAgICovDQorICAgICAgICAg
ICAgaWYgKGtlcm5lbF9sb2FkX29mZnNldCA8IEZJWFVQX01BWCkgew0KKyAgICAgICAgICAgICAg
ICBrZXJuZWxfbG9hZF9vZmZzZXQgKz0gMiA8PCAyMDsNCisgICAgICAgICAgICB9DQogICAgICAg
ICB9DQogICAgIH0NCiANCi0tIA0KMi4xNy4xDQo=
