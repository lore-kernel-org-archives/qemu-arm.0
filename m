Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9852698wrx;
        Sat, 9 Mar 2019 13:40:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqybwtCYwdvvFvcDBIYw0mBJUICDAeanH8xtZEeWONof5OCTNoWTVmoj5IVj2POCuMuVSUbc
X-Received: by 2002:a25:6dd4:: with SMTP id i203mr21099177ybc.440.1552167648168;
        Sat, 09 Mar 2019 13:40:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 127si748959ybo.297.2019.03.09.13.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Mar 2019 13:40:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2ji3-0002js-Lm
	for alex.bennee@linaro.org; Sat, 09 Mar 2019 16:40:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h2jhq-0002j3-Vf
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 16:40:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1h2jhq-00018P-4w
	for qemu-arm@nongnu.org; Sat, 09 Mar 2019 16:40:34 -0500
Resent-Date: Sat, 09 Mar 2019 16:40:34 -0500
Resent-Message-Id: <E1h2jhq-00018P-4w@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1h2jhn-00014Z-RA; Sat, 09 Mar 2019 16:40:32 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1552167607; cv=none; d=zoho.com; s=zohoarc; 
	b=cvqB+KjPdhW/Evkr8Jc/ZWOKG6oKNkXNoq6Ztgbb481+JM7bL7kLPA4EdYc1PrOvpA6thjhuRZoY0UVySlz5nAargCLFHnPiZ6qNQaW4CqZ1hLUfpOJyKQDbZTsVgPwO2lf015NA8IlYb49+AS/h0fGThjKx8/aAbZYGfH317Ko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1552167607;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
	bh=nNIyf7HpPmCWBpt5lco48z9LI1A6mFHuuk6XbozTDho=; 
	b=dftLJV3T09yF2O4Q/Io90E/37vOY83I9DGLsrJzH7lFQ7t2OKdrcxRo7G7GqPG6irnrx/bZpnCZiw9OyAbPxzU9hL7wEIDg5R5Z2Jsixc8YTICKtcEBxEq1AfMIDF1vf7Nw0yPP7ZDR4zxsWS9ER+ghNappgaSHubnSNlMLfThM=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
	spf=pass  smtp.mailfrom=no-reply@patchew.org;
	dmarc=pass header.from=<no-reply@patchew.org>
	header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1552167605726712.9184570019435;
	Sat, 9 Mar 2019 13:40:05 -0800 (PST)
Message-ID: <155216760406.8146.5929094742377229921@6acff2cf482b>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: thuth@redhat.com
Date: Sat, 9 Mar 2019 13:40:05 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 00/29] Kconfig dependencies
 for ARM machines
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
Reply-To: qemu-devel@nongnu.org
Cc: fam@euphon.net, yang.zhong@intel.com, peter.maydell@linaro.org,
	philmd@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bvYL7i39p/r6

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNTUxOTY4MzM0LTE4OTgyLTEt
Z2l0LXNlbmQtZW1haWwtdGh1dGhAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWls
ZWQgdGhlIGRvY2tlci1taW5nd0BmZWRvcmEgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRl
c3RpbmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2Vy
IGluc3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBU
RVNUIFNDUklQVCBCRUdJTiA9PT0KIyEvYmluL2Jhc2gKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1p
bmd3QGZlZG9yYSBTSE9XX0VOVj0xIEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQg
PT09CgogIENDICAgICAgaHcvdXNiL2Rldi13YWNvbS5vCiAgQ0MgICAgICBody91c2IvZGV2LXN0
b3JhZ2UubwpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3RtcC9xZW11LXRlc3Qvc3JjL2h3L3RwbS90
cG1fZW11bGF0b3IuYzozNzoKL3RtcC9xZW11LXRlc3Qvc3JjL2h3L3RwbS90cG1faW9jdGwuaDox
MToxMDogZmF0YWwgZXJyb3I6IHN5cy91aW8uaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQog
I2luY2x1ZGUgPHN5cy91aW8uaD4KICAgICAgICAgIF5+fn5+fn5+fn5+CmNvbXBpbGF0aW9uIHRl
cm1pbmF0ZWQuCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5v
cmcvbG9ncy8xNTUxOTY4MzM0LTE4OTgyLTEtZ2l0LXNlbmQtZW1haWwtdGh1dGhAcmVkaGF0LmNv
bS90ZXN0aW5nLmRvY2tlci1taW5nd0BmZWRvcmEvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdl
bmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQ
bGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

