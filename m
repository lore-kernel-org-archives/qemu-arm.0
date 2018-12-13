Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp896335wrt;
        Thu, 13 Dec 2018 06:42:23 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vsam6ZsubeTQfNsIYeL1zorQ099OOdDyisAlae7uHCIXw648UlepZmNAxtNy1bwB+BnGeH
X-Received: by 2002:a0c:cc8c:: with SMTP id f12mr23564892qvl.102.1544712143684;
        Thu, 13 Dec 2018 06:42:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544712143; cv=none;
        d=google.com; s=arc-20160816;
        b=HiE7jSR/1FZf/r1ekverxaZsop4fbgjneXeOcB9EwiH2Q4NiLNfigs55UyykabeDCH
         v3AoQNeyxUlqVzRFwS6CaSdRS/vYwj2luMxkp7tDa4IzJB0qQMbohcDufwgiW5xsmtgZ
         KGL0+jUZWWrj5gFfkWv/4gSWCAu6Urh+raN7pX8bpeJ40tAFqrm7U7bkZEhLFaZqXDJg
         yuH1TcG7rsSMvrV2Ml6hAe4aoeox62eC3+NvPJhLsOptnZJNBmr2a/Mu7g8m1yUrCG7I
         lSSTATKNNrHfbl00oyS7JF5mRHFd+qR5y4XPfEz8a2oTVJWDYvBd5BPZ+8efHXp+f7vQ
         sG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:content-language
         :accept-language:message-id:date:thread-index:thread-topic:to:from;
        bh=LqTL1R/jjeF31EBFfxm3/EDee/ioLHHuoGC1aKnszok=;
        b=iIi3GfjQfIM9761t8v4ROKLiQRcfC0XqH9bH08PDFY4cu169kpfDAiQxdDiS6t5DLK
         k6IfTgg3yUv5TMhguMyQy1B3Vrv7+GkVtdCoAlblPCMcAmTp8gP0WcruE8OPhnnfBRs8
         vsTOXiLoxkRgt4lcf0KgjWpjKdwAYPbXrqedcjoQavauGB5guKD0Jpz7sgGab02JtRmL
         uBwA9AAedNmf/AbiR0cpvde1kOZqYMMEj9Lfu8airgLpWfsGH0RJE1MBx9xrK/7wMjIv
         31otVfb55NHEMQPssVwuLDs9PXgePmn0f058ekQB1CVf9GU9bPXEGHvhRbPaO0Ny+j/b
         Gk5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z33si844057qtz.6.2018.12.13.06.42.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Dec 2018 06:42:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gXSBz-0004Cg-8x
	for alex.bennee@linaro.org; Thu, 13 Dec 2018 09:42:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lukas.juenger@rwth-aachen.de>) id 1gXRJH-0007l1-Sg
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 08:45:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lukas.juenger@rwth-aachen.de>) id 1gXRJD-0000bV-Jj
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 08:45:51 -0500
Received: from mail-out-4.itc.rwth-aachen.de ([134.130.5.49]:29989)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lukas.juenger@rwth-aachen.de>)
	id 1gXRJD-0000Xh-5l
	for qemu-arm@nongnu.org; Thu, 13 Dec 2018 08:45:47 -0500
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2B2DwD4YRJc/5sagoZjg0hTgWgxg3KZf?=
	=?us-ascii?q?YZEj0UMASyEWYJrIjgSAQMBAQIBAQJtHQuFZhFXASICJgIEMBUSBIU1AaZ+gS+?=
	=?us-ascii?q?FQINigQ6BC4sxghaDdYgzglcCoQ8HAoEWU5AIgU0BiCmHU4kuj3QCAgICCQIUg?=
	=?us-ascii?q?V0hgVZNJIM8gW8BAQE0F44dQYFZiwgBgR4BAQ?=
X-IPAS-Result: =?us-ascii?q?A2B2DwD4YRJc/5sagoZjg0hTgWgxg3KZfYZEj0UMASyEWYJ?=
	=?us-ascii?q?rIjgSAQMBAQIBAQJtHQuFZhFXASICJgIEMBUSBIU1AaZ+gS+FQINigQ6BC4sxg?=
	=?us-ascii?q?haDdYgzglcCoQ8HAoEWU5AIgU0BiCmHU4kuj3QCAgICCQIUgV0hgVZNJIM8gW8?=
	=?us-ascii?q?BAQE0F44dQYFZiwgBgR4BAQ?=
X-IronPort-AV: E=Sophos;i="5.56,349,1539640800"; d="scan'208";a="26970273"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
	by mail-in-4.itc.rwth-aachen.de with ESMTP; 13 Dec 2018 14:45:44 +0100
Received: from rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156) by
	rwthex-s2-b.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1531.3; Thu, 13 Dec 2018 14:45:43 +0100
Received: from rwthex-w1-a.rwth-ad.de ([fe80::fd01:de75:d684:fb97]) by
	rwthex-w1-a.rwth-ad.de ([fe80::fd01:de75:d684:fb97%21]) with mapi id
	15.01.1531.007; Thu, 13 Dec 2018 14:45:43 +0100
From: =?utf-8?B?SsO8bmdlciwgTHVrYXM=?= <lukas.juenger@rwth-aachen.de>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: Warning when DTB memory nodes are noped
Thread-Index: AQHUkuokGdkltnCK5UG4Rt5c5tsoXw==
Date: Thu, 13 Dec 2018 13:45:43 +0000
Message-ID: <1544708743.4811.30.camel@rwth-aachen.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.226.91.156]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF29451DA2735645B76649741B6BA103@rwth-ad.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.130.5.49
X-Mailman-Approved-At: Thu, 13 Dec 2018 09:42:18 -0500
Subject: [Qemu-arm] Warning when DTB memory nodes are noped
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QS6xYYrD/pZO

SGkgYWxsLA0KDQpJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBhbGwgbWVtb3J5IG5vZGVzIGNv
bnRhaW5lZCBpbiBhIERUQiBwYXNzZWQNCnZpYSB0aGUgLWR0YiBvcHRpb24gYXJlIG5vcGVkIGlu
IGh3L2FybS9ib290LmM6NTU2LTU2OC4NCkkgZGlkIG5vdCBleHBlY3QgdGhpcyB0byBoYXBwZW4g
YW5kIG9ubHkgZmlndXJlZCBpdCBvdXQgYnkgZGVidWdnaW5nDQp0aGUga2VybmVsLg0KRG8geW91
IHRoaW5rIGEgd2FybmluZyBzaG91bGQgYmUgaXNzdWVkIGlmIGEgRFRCIGNvbnRhaW5zIG1lbW9y
eQ0KcmVnaW9ucyB0aGF0IGFyZSBub3BlZD8NCg0KQmVzdCByZWdhcmRzLA0KTHVrYXM=
