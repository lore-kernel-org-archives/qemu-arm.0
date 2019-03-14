Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp623053wro;
        Thu, 14 Mar 2019 02:41:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzx5lEdG/LJWLTXpd5V43lx0AvlzsoW5HRs9/JwqeG9/U05iY5Ph3HG0H6urfIqHqhdHF6t
X-Received: by 2002:a81:8983:: with SMTP id z125mr10239365ywf.18.1552556476619;
        Thu, 14 Mar 2019 02:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552556476; cv=none;
        d=google.com; s=arc-20160816;
        b=B2ftQ5zUB5Wvq8G0ZOUzGn47UhajBhBHP4SYMvytKqhVZCyxg/msYUNu3RqBKp8ZpZ
         KYyMqrZlqDKqCc0344cTwq49iyNwkQp9rF8dY7w1iTZAhGsxmbWkJwsu8A53Fimz/IIs
         Jrmm8cJd7IrRSqPrGNfQtx4mAyVTqDHtkOra/WXjKaO0I6SfA703VCBjxFUtZn2UGYJB
         SqLvfuVw6N/Zjpa8QKg0SN+EIdckG84WXCWaXpuix+qzmfv0la1E9Tz65vmOEhy9/ttD
         vQ5Mh4heIiVxuYuejqGBC84Crc7dVJeU+U9pWfn7CMtEKHiwp8e3tYt4VCDo3+x/ZVke
         92cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=omOH813TZra6cUDVXASl8GO61bIji4jsWPy8lZw2Gck=;
        b=onpeJMNfmtvmfrhGa7U15Z9ol3AU34X9w12YdiZJeF2oHbyOR1/acekNod1X89UAZ+
         j7LiNLnzEnIhUMXjPDiPdBuds1XQtsrn/jqPwAxO3s1HsOBqXim7kEpT2NyLHieVkjp2
         MUqWQ6AFLBSJhgcFlinVGGy0xrCbknvUGI5dzcqb6/wekiVmZTijoS6rzkJ8ktL/aCpv
         4CHnOXhSWuBGHfcc+7TEf41E9D/7M0kDNquZv7WjVt7IqCk6vryn2gcLIhCKlVULDxtq
         K7a6qXEmh8EqmVMkPSHHwydGlhTPHITEJr/+xZYoyhKqMQTMiUprgb/5cXX1OG/usIcn
         GkhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3si89463ywe.37.2019.03.14.02.41.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 02:41:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:60204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4MrQ-0002ui-QB
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 05:41:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h4MhR-00050Q-QP
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 05:30:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h4MhI-000355-Gp
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 05:30:48 -0400
Received: from cirse-smtp-out.extra.cea.fr ([132.167.192.148]:33374)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amir.charif@cea.fr>)
	id 1h4MhF-00032t-6b; Thu, 14 Mar 2019 05:30:42 -0400
Received: from pisaure.intra.cea.fr (pisaure.intra.cea.fr [132.166.88.21])
	by cirse-sys.extra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0) with
	ESMTP id x2E9UZP4019163; Thu, 14 Mar 2019 10:30:35 +0100
Received: from pisaure.intra.cea.fr (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id A0BC5202921;
	Thu, 14 Mar 2019 10:30:35 +0100 (CET)
Received: from muguet1-smtp-out.intra.cea.fr (muguet1-smtp-out.intra.cea.fr
	[132.166.192.12])
	by pisaure.intra.cea.fr (Postfix) with ESMTP id 8FFAF200BA8;
	Thu, 14 Mar 2019 10:30:35 +0100 (CET)
Received: from excah-b0.intra.cea.fr (excah-b0.intra.cea.fr [132.166.88.85])
	by muguet1-sys.intra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
	with ESMTP id x2E9UZYb012939; Thu, 14 Mar 2019 10:30:35 +0100
Received: from EXDAG0-A1.intra.cea.fr ([fe80::ac4c:b0e6:f68e:69cf]) by
	excah-b0.intra.cea.fr ([fe80::7542:b9de:5cc1:f613%10]) with mapi id
	14.03.0415.000; Thu, 14 Mar 2019 10:30:35 +0100
From: Amir CHARIF <amir.charif@cea.fr>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] Re-evaluate SVE vector length everytime
	ADDVL is executed
Thread-Index: AQHU2arYOZpBZ3+C0kSk8L4TcIfQI6YJsTKAgAEjqrA=
Date: Thu, 14 Mar 2019 09:30:33 +0000
Message-ID: <82FD2C51B435F943BACD9C947966BF2F0A0E3ACA@EXDAG0-A1.intra.cea.fr>
References: <1552488086-4025-1-git-send-email-amir.charif@cea.fr>
	<0d61f67b-26b2-33e0-cf4d-13c7d998eed8@linaro.org>
In-Reply-To: <0d61f67b-26b2-33e0-cf4d-13c7d998eed8@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [132.166.88.106]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-23234.003
x-tm-as-result: No--13.507200-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 132.167.192.148
Subject: Re: [Qemu-devel] [PATCH] Re-evaluate SVE vector length everytime
 ADDVL is executed
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x6VtC1pj9TD9

SGVsbG8sDQpUaGFua3MgZm9yIHlvdXIgYW5zd2VyLg0KDQpUaGUgd3Jvbmcgc2l6ZSB3YXMgZGVm
aW5pdGVseSBiZWluZyBzdG9yZWQgaW4gdGhlIFRCLCBhbmQsIGl0IG9ubHkgYWZmZWN0ZWQgQURE
VkwvUkRWTC9BRERQTCAoaS5lLiBub3QgYWxsIGluc3RydWN0aW9ucyBhcmUgd3JvbmcpLiBIZXJl
IGlzIHdoYXQgSSB0aGluayB3YXMgaGFwcGVuaW5nOg0KDQotIFRoZSBrZXJuZWwgZGlzYWJsZXMg
U1ZFIGluIEVMMCAoWkVOPSAwMSkuDQotIFdoZW4gdGhlIHVzZXIgc3BhY2UgYXBwbGljYXRpb24g
aXMgZW50ZXJlZCwgdGhlIFRCIGNvbnRhaW5pbmcgQUREVkwgaGFzIGl0cyBsZW5ndGggc2V0IHRv
IDAgKDE2IGJ5dGVzKSwgYXMgd2UgYXJlIGluIEVMMCAoc28gc3ZlX2V4Y2VwdGlvbl9lbCE9MCks
IGFuZCBGUCBpcyBlbmFibGVkLg0KLSBBRERWTCBpcyBleGVjdXRlZCAod2l0aG91dCB0cmFwcGlu
Zykgb24gdGhlIGJhc2lzIG9mIHRoZSBjdXJyZW50IGxlbmd0aCAoMTYpLiAoTmVzdGVkIGZ1bmN0
aW9uIGNhbGxzIGluIHRoZSBzYW1lIGNvbnRleHQgd2lsbCBjYXVzZSBhIHRvbiBvZiBBRERWTCBp
bnN0cnVjdGlvbnMgdG8gYmUgZXhlY3V0ZWQgd2l0aCBhIHZlY3NpemUgb2YgMTYuKQ0KLSBUaGUg
bmV4dCBkaWZmZXJlbnQgU1ZFIGluc3RydWN0aW9uIHRyYXBzIGFzIGl0IHNob3VsZCBhbmQgdGhl
IHNpemUgaXMgYWRqdXN0ZWQgZm9yIHRoZSByZXN0IG9mIHRoZSBleGVjdXRpb24gKGJ1dCB0aGUg
c3RhY2sgc3BhY2UgdGhhdCB3YXMgaW5pdGlhbGx5IGFsbG9jYXRlZCBpcyB3cm9uZyBzbyBleGVj
dXRpb24gZmFpbHMpLg0KDQpTbyBhbm90aGVyIGZpeCB3b3VsZCBiZSB0byBhbGxvdyB0aGVzZSBp
bnN0cnVjdGlvbnMgdG8gdHJhcCBieSBjYWxsaW5nIHN2ZV9hY2Nlc3NfY2hlY2soKSwgYXMgaXMg
ZG9uZSB3aXRoIHRoZSByZXN0IG9mIFNWRSBpbnN0cnVjdGlvbnMuDQoNCkknbSBub3QgdGhhdCBm
YW1pbGlhciB3aXRoIHRoZSBpbnN0cnVjdGlvbiBzZXQsIHNvIGNvdWxkIHlvdSBwbGVhc2UgbGV0
IG1lIGtub3cgaWYgaXQgaXMgY29ycmVjdCB0byBjYWxsIHN2ZV9hY2Nlc3NfY2hlY2soKSBpbiB0
aGVzZSBpbnN0cnVjdGlvbnMgPw0KDQpUaGFua3MgaW4gYWR2YW5jZSwNCg0KQmVzdCByZWdhcmRz
LA0KQW1pciANCg0KLS0tLS1NZXNzYWdlIGQnb3JpZ2luZS0tLS0tDQpEZcKgOiBSaWNoYXJkIEhl
bmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4gDQpFbnZvecOpwqA6IG1lcmNy
ZWRpIDEzIG1hcnMgMjAxOSAxNzozNQ0Kw4DCoDogQW1pciBDSEFSSUYgPGFtaXIuY2hhcmlmQGNl
YS5mcj47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KQ2PCoDogcWVtdS1hcm1Abm9uZ251Lm9yZw0K
T2JqZXTCoDogUmU6IFtRZW11LWRldmVsXSBbUEFUQ0hdIFJlLWV2YWx1YXRlIFNWRSB2ZWN0b3Ig
bGVuZ3RoIGV2ZXJ5dGltZSBBRERWTCBpcyBleGVjdXRlZA0KDQpPbiAzLzEzLzE5IDc6NDEgQU0s
IEFtaXIgQ2hhcmlmIHdyb3RlOg0KPiBJbiBzeXN0ZW0gZW11bGF0aW9uIG1vZGUsIHRoZSBrZXJu
ZWwgbWF5IGludGVybmFsbHkgdXNlIDE2LWJ5dGUgdmVjdG9ycy4NCj4gSWYgdGhpcyBzaXplIGlz
IHNhdmVkIGluIHRoZSBEaXNhc0NvbnRleHQgYmVmb3JlIGVudGVyaW5nIGEgdXNlcnNwYWNlIA0K
PiBhcHAgdGhhdCB1c2VzIGhpZ2hlciBTVkUgc2l6ZXMsIHRoZSB3cm9uZyBzaXplIG1heSBiZSBh
bGxvY2F0ZWQgb24gdGhlIA0KPiBzdGFjayByZXN1bHRpbmcgaW4gY29ycnVwdGlvbiAoc2VnZmF1
bHRzIGluIHVzZXIgc3BhY2UpLg0KPiBUaGlzIGZpeCBldmFsdWF0ZXMgdGhlIHZlY3RvciBzaXpl
IGF0IHJ1bnRpbWUgKGFzIG9wcG9zZWQgdG8gDQo+IHRyYW5zbGF0aW9uIHRpbWUpIHRvIGFsd2F5
cyBhbGxvY2F0ZSB0aGUgY29ycmVjdCBzaXplIG9uIHRoZSBzdGFjayAod2hlbiBBRERWTCBpcyB1
c2VkKS4NCg0KVGhpcyBpcyB3cm9uZy4NCg0KSW4gcGFydGljdWxhciwgaWYgdGhlIGNvbXB1dGF0
aW9uIG9mIFZMIGlzIHdyb25nIGZvciBBRERWTCwgaXQgaXMgd3JvbmcgZm9yIGV2ZXJ5IG90aGVy
IFNWRSBpbnN0cnVjdGlvbiBhcyB3ZWxsLiAgTW9zdCBvZiB3aGljaCBjYW5ub3QgaGF2ZSBWTCBj
b21wdXRlZCBhdCBydW50aW1lIGxpa2UgdGhpcy4NCg0KVGhhdCBpcyB3aHkgd2UgYnJlYWsgdGhl
IFRCIGF0IGV2ZXJ5IGNoYW5nZSB0byBWTC4NCg0KV2hlcmUgZG8gd2UgImVudGVyIGEgdXNlcnNw
YWNlIGFwcCIgd2l0aG91dCBicmVha2luZyB0aGUgVEIgYW5kIHJlY29tcHV0aW5nPw0KQXMgZmFy
IGFzIEkga25vdyB0aGlzIG11c3QgaGF2ZSBleGVjdXRlZCBhbiBFUkVUIHRvIHJldHVybiBmcm9t
IEVMMSB0byBFTDAsIHdoaWNoIG1vc3QgZGVmaW5pdGVseSBoYXBwZW5zIGJldHdlZW4gVEJzLCBv
ciBlbHNlIG5vIHN5c3RlbSBjYWxscyB3b3VsZCB3b3JrIGF0IGFsbC4NCg0KRG8geW91IGhhdmUg
YW4gZXhhbXBsZSB0aGF0IHByb3Zva2VzIHRoaXMgZmFpbHVyZT8NCg0KDQpyfg0K
