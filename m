Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1793853wro;
        Fri, 15 Mar 2019 02:09:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx47FEroa3AViNNeiu1bfUjRecoJx4YYpxV9ILUnvj7UnUfw+FUbZct0onYfGw7tu4Q6fiQ
X-Received: by 2002:a1c:7610:: with SMTP id r16mr1301546wmc.139.1552640964625;
        Fri, 15 Mar 2019 02:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552640964; cv=none;
        d=google.com; s=arc-20160816;
        b=sjQJvpws9Zfy5e6kMoefqff6/syhj+3T9GRuyxHuluiSxxhziuOAKKhIrMRu4so1Ku
         r3GdFR0Yeg+jn1F6Ouh5dO/teZKJdRLpN9U/AJW7q6VDc3Is8+xPrFcQ+roDkKtrUp9T
         drlmHsU6hqpk7BM36+/B4ep6ERS7KMw7HCqD2r5LYaX4CbmAvxDyB2sHmpNEy77GDxSL
         FD72PSTmFHwhRnZGj+0hHAkC8qqlKPqKp+3qEYcIWKqfegfrJNRzSdIeQo+L/pGRgLlh
         8Rzl+G+t8THdAyoUuxLujusUDFWDs+yFlMSpDf5Yl3cVzRfaj5FLyGNI2vsC9DZq2Hh6
         lV7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=xXxJx005tBeHjvgY47fMN8Plx5Cy+3EXCOnW9dPWF1E=;
        b=SdqYQqRE2nlkCJL/WRkVLbErAp9w8lMei1mqO++EwPiMs0cq1UtVwUSAmfEATWspik
         t0JAHUJPm4x+JuDVTjf14sC1ZvVGBpFw66gviSE6AroR0dPM1W39iFUW7C1n6aZcQiXE
         umVqRH71dO6zxTT9dugSit72ujN9KC45B21M/zmwpBO3ZGTBLuSRtGF2lOSJoMwpmcer
         8hHFuY4W+VblplzXogfUxf1kFYzo/GnXeRdJ9UHbpvKKIZylbHLaW8easG8NyVwGCB+X
         WED3wItnM/OSJvdfl6AmKybbssUm5rt4Jw+RcrwTP5eWFhpjzdWk5RX8GBkQgcnw07kE
         tkSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si957128wrm.381.2019.03.15.02.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Mar 2019 02:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4iqB-0005X7-Mt
	for alex.bennee@linaro.org; Fri, 15 Mar 2019 05:09:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h4imi-0002nd-Ge
	for qemu-arm@nongnu.org; Fri, 15 Mar 2019 05:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amir.charif@cea.fr>) id 1h4iXc-00035v-0k
	for qemu-arm@nongnu.org; Fri, 15 Mar 2019 04:50:12 -0400
Received: from cirse-smtp-out.extra.cea.fr ([132.167.192.148]:54018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amir.charif@cea.fr>)
	id 1h4iXa-00033b-D8; Fri, 15 Mar 2019 04:50:10 -0400
Received: from pisaure.intra.cea.fr (pisaure.intra.cea.fr [132.166.88.21])
	by cirse-sys.extra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0) with
	ESMTP id x2F8o8S5014653; Fri, 15 Mar 2019 09:50:08 +0100
Received: from pisaure.intra.cea.fr (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 17081200E39;
	Fri, 15 Mar 2019 09:50:08 +0100 (CET)
Received: from muguet2-smtp-out.intra.cea.fr (muguet2-smtp-out.intra.cea.fr
	[132.166.192.13])
	by pisaure.intra.cea.fr (Postfix) with ESMTP id 06058200BED;
	Fri, 15 Mar 2019 09:50:08 +0100 (CET)
Received: from EXCAH-A0.intra.cea.fr (excah-a0.intra.cea.fr [132.166.88.74])
	by muguet2-sys.intra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
	with ESMTP id x2F8o7Mc007528; Fri, 15 Mar 2019 09:50:07 +0100
Received: from EXDAG0-A1.intra.cea.fr ([fe80::ac4c:b0e6:f68e:69cf]) by
	EXCAH-A0.intra.cea.fr ([fe80::446e:fe1a:2892:9de1%10]) with mapi id
	14.03.0415.000; Fri, 15 Mar 2019 09:50:07 +0100
From: Amir CHARIF <amir.charif@cea.fr>
To: Eric Blake <eblake@redhat.com>
Thread-Topic: [Qemu-devel] [Qemu-arm] [PATCH] Check access permission to
	ADDVL/ADDPL/RDVL
Thread-Index: AQHU2oPAVV4bhfmSXUy5Fj09QORyA6YLTsyAgAAD1oCAAAKdAIABDYGw
Date: Fri, 15 Mar 2019 08:50:06 +0000
Message-ID: <82FD2C51B435F943BACD9C947966BF2F0A0E5CD0@EXDAG0-A1.intra.cea.fr>
References: <1552579248-31025-1-git-send-email-amir.charif@cea.fr>
	<CAFEAcA8dGr6gPGUcLhMqWKoC7aS40A4NssqFzHiKu0XhRKyE_Q@mail.gmail.com>
	<4daad4a8-93bc-05bc-1dfc-5652da3168bd@linaro.org>
	<6c85b09f-9c72-579a-5e63-7c5624311b18@redhat.com>
In-Reply-To: <6c85b09f-9c72-579a-5e63-7c5624311b18@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [132.166.88.106]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-23234.003
x-tm-as-result: No--12.344500-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 132.167.192.148
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Check access permission to
 ADDVL/ADDPL/RDVL
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VjZwm7gbYSwo

VGhhbmtzIEVyaWMsIGhhcHB5IHRvIGpvaW4gXl4gDQoNCi0tLS0tTWVzc2FnZSBkJ29yaWdpbmUt
LS0tLQ0KRGXCoDogRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+IA0KRW52b3nDqcKgOiBq
ZXVkaSAxNCBtYXJzIDIwMTkgMTg6NDQNCsOAwqA6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJk
LmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5h
cm8ub3JnPjsgQW1pciBDSEFSSUYgPGFtaXIuY2hhcmlmQGNlYS5mcj4NCkNjwqA6IHFlbXUtYXJt
IDxxZW11LWFybUBub25nbnUub3JnPjsgUUVNVSBEZXZlbG9wZXJzIDxxZW11LWRldmVsQG5vbmdu
dS5vcmc+DQpPYmpldMKgOiBSZTogW1FlbXUtZGV2ZWxdIFtRZW11LWFybV0gW1BBVENIXSBDaGVj
ayBhY2Nlc3MgcGVybWlzc2lvbiB0byBBRERWTC9BRERQTC9SRFZMDQoNCk9uIDMvMTQvMTkgMTI6
MzQgUE0sIFJpY2hhcmQgSGVuZGVyc29uIHdyb3RlOg0KPiBPbiAzLzE0LzE5IDEwOjIxIEFNLCBQ
ZXRlciBNYXlkZWxsIHdyb3RlOg0KPj4gUmljaGFyZCwgQW1pciAtLSBpdCBsb29rcyBsaWtlIHlv
dSBib3RoIHNlbnQgZXhhY3RseSB0aGUgc2FtZSBwYXRjaCANCj4+IGF0IHByZXR0eSBtdWNoIGV4
YWN0bHkgdGhlIHNhbWUgdGltZS4gQW55IHByZWZlcmVuY2VzIGZvciB3aG9zZSANCj4+IHZlcnNp
b24gSSBhcHBseSA/IDotKQ0KPj4NCj4+IHRoYW5rcw0KPj4gLS0gUE1NDQo+IA0KPiBIYWguICBC
aXQgb2YgbWlzY29tbXVuaWNhdGlvbiB0aGVyZS4gIE1pZ2h0IGFzIHdlbGwgYXBwbHkgQW1pcidz
IGFuZCANCj4gaGF2ZSBteQ0KPiBSZXZpZXdlZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hh
cmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQoNCkdyZWF0IG1pbmRzIHRoaW5rIGFsaWtlIQ0KDQpN
eSBwZXJzb25hbCBwcmVmZXJlbmNlLCBpZiBpdCBjb3VudHMgZm9yIGFueXRoaW5nLCBpcyB0byBh
cHBseSBBbWlyJ3MgcGF0Y2gsIGJlY2F1c2UgaXQncyBhbHdheXMgbmljZSB0byBoYXZlIGZpcnN0
LXRpbWUgY29udHJpYnV0b3JzIGFkZGVkIGluIGEgcmVsZWFzZS4gIFdlbGNvbWUgdG8gdGhlIGNv
bW11bml0eSwgQW1pciENCg0KLS0NCkVyaWMgQmxha2UsIFByaW5jaXBhbCBTb2Z0d2FyZSBFbmdp
bmVlcg0KUmVkIEhhdCwgSW5jLiAgICAgICAgICAgKzEtOTE5LTMwMS0zMjI2DQpWaXJ0dWFsaXph
dGlvbjogIHFlbXUub3JnIHwgbGlidmlydC5vcmcNCg==
