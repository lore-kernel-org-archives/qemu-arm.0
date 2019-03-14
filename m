Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1113886wro;
        Thu, 14 Mar 2019 10:36:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyAry3+bo1L6NBfsUWROqA7OTVRJGyEz3E4uYeMRlysZNsGZ00hNW1vagj3VZOtRvNHWgaf
X-Received: by 2002:a81:7c45:: with SMTP id x66mr23540340ywc.3.1552584994490;
        Thu, 14 Mar 2019 10:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552584994; cv=none;
        d=google.com; s=arc-20160816;
        b=kDHD9UzJYQNsLgvx3gGMAfprRTl+EK7YHEP+VjVwPe19j8tCIfnvw/u9eW3MdEhZ84
         oSl0cND0yDrptd7JSPeUNQyw3o04cUMafdjNMgg0MW+IQ7G+txix72cmbs+HIE4lJkuw
         kotjKA4ZuuNHatJKMoBu/EgFInKdZDhAYrI8NAqKw6J02fBD8Aniv8JlUoX4mulqtwI1
         oBASg3MaLk8c+Tm1a0+sGb+ZNcgpgR6PAuGenZeeadsc8JvzlQtWTJe9Ue3IISJhCQLf
         0xkKp8nWZnmN5imayWmZUkrxnHi3TS7Jsbrl1d1XNJIPNup6HbkM9E40iQlbDC5zJbKH
         LD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=kk/F4jiu3qv8riq/x6lSqUR5q+STlEIyY8iPyv7IHxk=;
        b=RahI4eHbCcBS0OYPLCysTPdDmZQJOV1r4zyaLdvqNHiIhAwVbiH70qMhXd/FKI3o+i
         YBXslNIpbE5+tNMUl4SrQeyLLVevoNoj+LZeX1PQp+TzAZf2C7eB+d5vs5BlMII2eEhf
         TPnEVh3u+T/M1v/MsvGaGDMAY0BzCNXQKEZqTDEMDo3fSqabyCIawa1Wj5+TPGHyioe/
         oMWsyG9h+VmlYQjbWADd65x4WOcuCAhIq/RD3TqPN0Cat9vmeDmdo5mUE87s4UUIn0Em
         VAqz/MIA1XGLEdXj5U/g1Ej1So6HlTRLuHOdODs8xz+WXu3Jm0uPon5bluwvApYPz296
         74PA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l81si4420400ybb.487.2019.03.14.10.36.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 10:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:42614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4UHR-0007yV-TR
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 13:36:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h4UGi-0007ev-5b
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 13:35:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h4UGf-0005W9-MT
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 13:35:47 -0400
Received: from oxalide-smtp-out.extra.cea.fr ([132.168.224.13]:59594)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amir.charif@cea.fr>)
	id 1h4UGU-0005Cg-3i; Thu, 14 Mar 2019 13:35:35 -0400
Received: from pisaure.intra.cea.fr (pisaure.intra.cea.fr [132.166.88.21])
	by oxalide-sys.extra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
	with ESMTP id x2EHZGxh156614; Thu, 14 Mar 2019 18:35:16 +0100
Received: from pisaure.intra.cea.fr (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 23DDA207BF7;
	Thu, 14 Mar 2019 18:35:16 +0100 (CET)
Received: from muguet2-smtp-out.intra.cea.fr (muguet2-smtp-out.intra.cea.fr
	[132.166.192.13])
	by pisaure.intra.cea.fr (Postfix) with ESMTP id 0FFB02064FA;
	Thu, 14 Mar 2019 18:35:16 +0100 (CET)
Received: from EXCAH-A3.intra.cea.fr (excah-a3.intra.cea.fr [132.166.88.77])
	by muguet2-sys.intra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
	with ESMTP id x2EHZFvQ029062; Thu, 14 Mar 2019 18:35:16 +0100
Received: from EXDAG0-A1.intra.cea.fr ([fe80::ac4c:b0e6:f68e:69cf]) by
	EXCAH-A3.intra.cea.fr ([fe80::60de:a77e:427d:f7e6%10]) with mapi id
	14.03.0415.000; Thu, 14 Mar 2019 18:35:15 +0100
From: Amir CHARIF <amir.charif@cea.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH for-4.0] target/arm: Add sve_access_check
	to ADDVL, ADDPL, RDVL
Thread-Index: AQHU2oOb8BRpE/x/yEuoxO4AJVjEJKYLXNYg///1HICAABEYkA==
Date: Thu, 14 Mar 2019 17:35:14 +0000
Message-ID: <82FD2C51B435F943BACD9C947966BF2F0A0E3C00@EXDAG0-A1.intra.cea.fr>
References: <20190314163259.3058-1-richard.henderson@linaro.org>
	<82FD2C51B435F943BACD9C947966BF2F0A0E3BBF@EXDAG0-A1.intra.cea.fr>
	<CAFEAcA8r7sH-Gseo7bwnf332L6602CZOru88YNWxiCJRuK65+A@mail.gmail.com>
In-Reply-To: <CAFEAcA8r7sH-Gseo7bwnf332L6602CZOru88YNWxiCJRuK65+A@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [132.166.88.106]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-23234.003
x-tm-as-result: No--11.593200-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 132.168.224.13
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.0] target/arm: Add
 sve_access_check to ADDVL, ADDPL, RDVL
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jDHBxINvqYr5

T2theSwgSSB1bmRlc3RhbmQuDQoNClRoYW5rIHlvdSBhbmQgc29ycnkgZm9yIHRoZSBvdmVycmVh
Y3Rpb24sDQoNCkNoZWVycywNCkFtaXINCg0KLS0tLS1NZXNzYWdlIGQnb3JpZ2luZS0tLS0tDQpE
ZcKgOiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+IA0KRW52b3nDqcKg
OiBqZXVkaSAxNCBtYXJzIDIwMTkgMTg6MzINCsOAwqA6IEFtaXIgQ0hBUklGIDxhbWlyLmNoYXJp
ZkBjZWEuZnI+DQpDY8KgOiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGlu
YXJvLm9yZz47IHFlbXUtYXJtQG5vbmdudS5vcmc7IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KT2Jq
ZXTCoDogUmU6IFtRZW11LWRldmVsXSBbUEFUQ0ggZm9yLTQuMF0gdGFyZ2V0L2FybTogQWRkIHN2
ZV9hY2Nlc3NfY2hlY2sgdG8gQUREVkwsIEFERFBMLCBSRFZMDQoNCk9uIFRodSwgMTQgTWFyIDIw
MTkgYXQgMTc6MjIsIEFtaXIgQ0hBUklGIDxhbWlyLmNoYXJpZkBjZWEuZnI+IHdyb3RlOg0KPg0K
PiBJIGRvbid0IHJlYWxseSBrbm93IGhvdyBpdCB1c3VhbGx5IHdvcmtzIGhlcmUgYnV0IG1heSBJ
IGFzayB3aHkgeW91IGFyZSB0dXJuaW5nIG15IHBhdGNoIGludG8geW91ciBvd24gYW5kIHB1dHRp
bmcgbWUgYXMgYSByZXBvcnRlciA/IEFyZSB5b3UgYWxsb3dlZCB0byBkbyB0aGF0ID8/DQo+IEkg
ZGlkIG5vdCBqdXN0IHJlcG9ydCBhIGJ1ZywgSSBhY3R1YWxseSBwcm92aWRlZCB0aGUgZml4IGFu
ZCBzdWJtaXR0ZWQgYSBwYXRjaCwgeW91IGNhbiBzZWUgaGVyZSB0aGF0IGl0J3MgdGltZXN0YW1w
ZWQgcHJpb3IgdG8geW91cnMgKGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8gKSwgSSB3YXMgd2Fp
dGluZyBmb3IgeW91ciByZXBseSB0byBzZW5kIGl0IHRvIHRoZSBtYWlsaW5nIGxpc3QsIHNvIGlz
IGl0IGZhaXIgdGhhdCB5b3VycyBpcyB0aGUgb25lIGdldHRpbmcgcmV2aWV3ZWQgPw0KDQpZb3Vy
IGVtYWlscyBjcm9zc2VkIGluIHRoZSBwb3N0LCBzbyB0byBzcGVhayAtLSB5b3VycyBpcyB0aW1l
c3RhbXBlZCAxNjowMCBidXQgbG9va2luZyBhdCB0aGUgUmVjZWl2ZWQgaGVhZGVycyAjIFJlY2Vp
dmVkOiBmcm9tIGFtaXItVmlydHVhbEJveC5pbnRyYS5jZWEuZnIgIyAoaXMyMzMxNzYtZG9jay5p
bnRyYS5jZWEuZnIgWzEwLjguMzUuMTI2XSkgYnkgIyBtdWd1ZXQyLXN5cy5pbnRyYS5jZWEuZnIg
KDguMTQuNy84LjE0LjcvQ0VBbmV0LUludGVybmV0LW91dC00LjApDQojIHdpdGggRVNNVFAgaWQg
eDJFR1k5V04wMDMzNjc7IFRodSwgMTQgTWFyIDIwMTkgMTc6MzQ6MDkgKzAxMDANCg0KYW4gZW1h
aWwgc3lzdGVtIHNhdCBvbiBpdCBmb3IgaGFsZiBhbiBob3VyOyBhbmQgdGhlbiBpdCB0b29rDQox
MCBvciAxNSBtaW51dGVzIHRvIGdldCB0aHJvdWdoIHRoZSBRRU1VIG1haWxpbmcgbGlzdCBpbmZy
YXN0cnVjdHVyZSwgc28gYnkgdGhlIHRpbWUgUmljaGFyZCBjb3VsZCBoYXZlIHNlZW4geW91ciBl
bWFpbCBoZSB3b3VsZCBoYXZlIGFscmVhZHkgc2VudCBoaXMgdmVyc2lvbi4NCg0KVGhpcyBkb2Vz
IGhhcHBlbiBmcm9tIHRpbWUgdG8gdGltZSwgYmVjYXVzZSBlbWFpbCBpc24ndCBpbnN0YW50YW5l
b3VzLiBSaWNoYXJkJ3MgaGFwcGVuZWQgdG8gZ2V0IHJldmlldyBmaXJzdCBiZWNhdXNlIGhlIGNj
J2Qgc29tZSBwZW9wbGUgd2hvIG1pZ2h0IHdhbnQgdG8gcmV2aWV3IGl0LCB3aGljaCB0ZW5kcyB0
byBicmluZyBpdCB0byB0aGVpciBhdHRlbnRpb24gbW9yZS4NCg0KSSdtIGhhcHB5IHRvIGFwcGx5
IHlvdXIgdmVyc2lvbi4NCg0KdGhhbmtzDQotLSBQTU0NCg==
