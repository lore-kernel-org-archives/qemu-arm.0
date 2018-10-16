Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6041581wrt;
        Tue, 16 Oct 2018 08:06:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62N+oRj65vltHPVMKJMxpY4wZomU4cXtTLnDisgsQnyHMPGd75VFfr1uLta2exIdj+MYkAv
X-Received: by 2002:aed:3983:: with SMTP id m3-v6mr21575615qte.164.1539702408433;
        Tue, 16 Oct 2018 08:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539702408; cv=none;
        d=google.com; s=arc-20160816;
        b=XH34/w7rlCZh3fCaEn7rwz/Ru+cbzLb6cbJBR2C3dnokC4IH99+HODDNRF8dmZrakn
         9YCXlgfSjtQvTp2zOCVTt1aD6jO21bD3DnVfi6yH2sSVowZBmPnk4iTr1llAHEewKoXl
         dd4B8ZtGaGtmV4WhjRF/sG5avRNZ7/4icZ80lpA8/j+lWFEaUTw+gsNFfkcghxRmPdEV
         uzLQ7wyfma1DcO9lRzyT1NRhjJFPXW0cryBIBrsL5KKhWI6xb20QLCkmBoaeVlaIKHuN
         lpRjECK8/J+QAj1LyEey0EVfOF7yepwBBQQeJV93XMvyRpdMXjtz1Rfl01qaiyO7kMpz
         jGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from;
        bh=zEB/aG8qLrP+bmBgEwTGWoh0NL0OArygL2tF01t0WAY=;
        b=P/K1Z2MoNQseLoVn4mb+Slh/smBC7PhYyQEZF11V2pxXLWHF5MnCS5cC0NJQ6J6ilv
         ZqVraKPyl+hy6/cI2HOyDDvGsn39VT/1EShWRza1opADeHQwUNPcTXk5xWYj0GQ9pQTT
         Eb0EPdXkCeu9EiCl9I9DuoRbHL6lWa6TdUtCfyMk5C15nj9JRoq9/XV5LTt8gJUDwyxH
         DaaS5ydNAF05YDMZzk5IynGIF13iJefj2sdcNksfp6yBeW6gx+FlCWvGBu9tknstaf4X
         58dA43u43B3eolSiK4tE9FZnHixd3AX9GRfAsj5XKRvIOAv1/uOMZQHL6LhFyT2WHOjd
         +S7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z141-v6si9108029qkb.38.2018.10.16.08.06.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 08:06:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCQvn-0003KT-Vk
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 11:06:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stewart.Hildebrand@dornerworks.com>)
	id 1gCQvd-0003J8-ER
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 11:06:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Stewart.Hildebrand@dornerworks.com>)
	id 1gCQvY-0002HV-3g
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 11:06:37 -0400
Received: from mail.dornerworks.com ([12.207.209.150]:39067
	helo=webmail.dornerworks.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Stewart.Hildebrand@dornerworks.com>)
	id 1gCQvX-0002Bi-N0; Tue, 16 Oct 2018 11:06:31 -0400
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH v2] hw/arm/boot: Increase compliance with kernel arm64
	boot protocol
Thread-Index: AdRlXuhcD7hargCPSzOdhzFRhAX+6w==
Date: Tue, 16 Oct 2018 15:06:29 +0000
Message-ID: <b8a89518794b4436af0c151ed10de4fa@dornerworks.com>
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
Subject: [Qemu-arm] [PATCH v2] hw/arm/boot: Increase compliance with kernel
 arm64 boot protocol
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Julien Grall <julien.grall@arm.com>,
	=?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4XVYPvXOrg4g

IlRoZSBJbWFnZSBtdXN0IGJlIHBsYWNlZCB0ZXh0X29mZnNldCBieXRlcyBmcm9tIGEgMk1CIGFs
aWduZWQgYmFzZQ0KYWRkcmVzcyBhbnl3aGVyZSBpbiB1c2FibGUgc3lzdGVtIFJBTSBhbmQgY2Fs
bGVkIHRoZXJlLiINCg0KRm9yIHRoZSB2aXJ0IGJvYXJkLCB3ZSB3cml0ZSBvdXIgc3RhcnR1cCBi
b290bG9hZGVyIGF0IHRoZSB2ZXJ5DQpib3R0b20gb2YgUkFNLCBzbyB0aGF0IGJpdCBjYW4ndCBi
ZSB1c2VkIGZvciB0aGUgaW1hZ2UuIFRvIGF2b2lkDQpvdmVybGFwIGluIGNhc2UgdGhlIGltYWdl
IHJlcXVlc3RzIHRvIGJlIGxvYWRlZCBhdCBhbiBvZmZzZXQNCnNtYWxsZXIgdGhhbiBvdXIgYm9v
dGxvYWRlciwgd2UgaW5jcmVtZW50IHRoZSBsb2FkIG9mZnNldCB0byB0aGUNCm5leHQgMk1CLg0K
DQpUaGlzIGZpeGVzIGEgYm9vdCBmYWlsdXJlIGZvciBYZW4gQUFyY2g2NC4NCg0KU2lnbmVkLW9m
Zi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29ya3Mu
Y29tPg0KLS0tDQpDaGFuZ2VzIHYxIC0+IHYyOg0KLSB1c2UgS2lCL01pQiBtYWNyb3MgZm9yIHJl
YWRhYmlsaXR5IChzdWdnZXN0ZWQgYnkgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kpLCBoZW5jZSB0
aGUgYWRkaXRpb25hbCAjaW5jbHVkZQ0KLSBkZWZpbmUgYW4gdXBwZXIgYm91bmQgZm9yIHRoZSBi
b290bG9hZGVyIHNpemUgc2luY2UgVEVYVF9PRkZTRVQgaGFzIHRvIGJlIHBhZ2UgYWxpZ25lZCBh
bnl3YXkgKHN1Z2dlc3RlZCBieSBBbmRyZSBQcnp5d2FyYSkNCi0gYWRkIGFzc2VydCgpIGluIHdy
aXRlX2Jvb3Rsb2FkZXIoKSB0byBtYWtlIHN1cmUgd2Ugc3RheSBiZWxvdyB0aGUgNEsgbWF4IChz
dWdnZXN0ZWQgYnkgUGV0ZXIgTWF5ZGVsbCkNCi0tLQ0KIGh3L2FybS9ib290LmMgfCAxNSArKysr
KysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0t
Z2l0IGEvaHcvYXJtL2Jvb3QuYyBiL2h3L2FybS9ib290LmMNCmluZGV4IDIwYzcxZDdkOTYuLmE2
NzVhNjAyYmMgMTAwNjQ0DQotLS0gYS9ody9hcm0vYm9vdC5jDQorKysgYi9ody9hcm0vYm9vdC5j
DQpAQCAtMjQsNiArMjQsNyBAQA0KICNpbmNsdWRlICJxZW11L2NvbmZpZy1maWxlLmgiDQogI2lu
Y2x1ZGUgInFlbXUvb3B0aW9uLmgiDQogI2luY2x1ZGUgImV4ZWMvYWRkcmVzcy1zcGFjZXMuaCIN
CisjaW5jbHVkZSAicWVtdS91bml0cy5oIg0KIA0KIC8qIEtlcm5lbCBib290IHByb3RvY29sIGlz
IHNwZWNpZmllZCBpbiB0aGUga2VybmVsIGRvY3MNCiAgKiBEb2N1bWVudGF0aW9uL2FybS9Cb290
aW5nIGFuZCBEb2N1bWVudGF0aW9uL2FybTY0L2Jvb3RpbmcudHh0DQpAQCAtMzYsNiArMzcsOCBA
QA0KICNkZWZpbmUgQVJNNjRfVEVYVF9PRkZTRVRfT0ZGU0VUICAgIDgNCiAjZGVmaW5lIEFSTTY0
X01BR0lDX09GRlNFVCAgICAgICAgICA1Ng0KIA0KKyNkZWZpbmUgQk9PVExPQURFUl9NQVhfU0la
RSAgICAgICAgICg0ICogS2lCKQ0KKw0KIEFkZHJlc3NTcGFjZSAqYXJtX2Jvb3RfYWRkcmVzc19z
cGFjZShBUk1DUFUgKmNwdSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3Qgc3RydWN0IGFybV9ib290X2luZm8gKmluZm8pDQogew0KQEAgLTE4NCw2ICsxODcsOCBA
QCBzdGF0aWMgdm9pZCB3cml0ZV9ib290bG9hZGVyKGNvbnN0IGNoYXIgKm5hbWUsIGh3YWRkciBh
ZGRyLA0KICAgICAgICAgY29kZVtpXSA9IHRzd2FwMzIoaW5zbik7DQogICAgIH0NCiANCisgICAg
YXNzZXJ0KChsZW4gKiBzaXplb2YodWludDMyX3QpKSA8IEJPT1RMT0FERVJfTUFYX1NJWkUpOw0K
Kw0KICAgICByb21fYWRkX2Jsb2JfZml4ZWRfYXMobmFtZSwgY29kZSwgbGVuICogc2l6ZW9mKHVp
bnQzMl90KSwgYWRkciwgYXMpOw0KIA0KICAgICBnX2ZyZWUoY29kZSk7DQpAQCAtOTE5LDYgKzky
NCwxNiBAQCBzdGF0aWMgdWludDY0X3QgbG9hZF9hYXJjaDY0X2ltYWdlKGNvbnN0IGNoYXIgKmZp
bGVuYW1lLCBod2FkZHIgbWVtX2Jhc2UsDQogICAgICAgICBtZW1jcHkoJmhkcnZhbHMsIGJ1ZmZl
ciArIEFSTTY0X1RFWFRfT0ZGU0VUX09GRlNFVCwgc2l6ZW9mKGhkcnZhbHMpKTsNCiAgICAgICAg
IGlmIChoZHJ2YWxzWzFdICE9IDApIHsNCiAgICAgICAgICAgICBrZXJuZWxfbG9hZF9vZmZzZXQg
PSBsZTY0X3RvX2NwdShoZHJ2YWxzWzBdKTsNCisNCisgICAgICAgICAgICAvKiBGb3IgdGhlIHZp
cnQgYm9hcmQsIHdlIHdyaXRlIG91ciBzdGFydHVwICJib290bG9hZGVyIiBhdCB0aGUgdmVyeQ0K
KyAgICAgICAgICAgICAqIGJvdHRvbSBvZiBSQU0sIHNvIHRoYXQgYml0IGNhbid0IGJlIHVzZWQg
Zm9yIHRoZSBpbWFnZS4gVG8gYXZvaWQNCisgICAgICAgICAgICAgKiBvdmVybGFwIGluIGNhc2Ug
dGhlIGltYWdlIHJlcXVlc3RzIHRvIGJlIGxvYWRlZCBhdCBhbiBvZmZzZXQNCisgICAgICAgICAg
ICAgKiBzbWFsbGVyIHRoYW4gb3VyIGJvb3Rsb2FkZXIsIHdlIGluY3JlbWVudCB0aGUgbG9hZCBv
ZmZzZXQgdG8gdGhlDQorICAgICAgICAgICAgICogbmV4dCAyTUIuDQorICAgICAgICAgICAgICov
DQorICAgICAgICAgICAgaWYgKGtlcm5lbF9sb2FkX29mZnNldCA8IEJPT1RMT0FERVJfTUFYX1NJ
WkUpIHsNCisgICAgICAgICAgICAgICAga2VybmVsX2xvYWRfb2Zmc2V0ICs9IDIgKiBNaUI7DQor
ICAgICAgICAgICAgfQ0KICAgICAgICAgfQ0KICAgICB9DQogDQotLSANCjIuMTcuMQ0K
