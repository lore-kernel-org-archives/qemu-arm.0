Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4955313wrq;
        Tue, 19 Jun 2018 03:23:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIt06IbMXUFomSZ2wmTT9e/Vzvev09D+qore4LKVIk40trHueJHDEdDj1bDSGCj1s/HZn8B
X-Received: by 2002:a37:7101:: with SMTP id m1-v6mr13245787qkc.19.1529403817632;
        Tue, 19 Jun 2018 03:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529403817; cv=none;
        d=google.com; s=arc-20160816;
        b=VGMDwhABYAN2ivVLAx152c7GPBRbMt/iw2nGBBu3/o+YyZH26fGugQiBZyYFVucLTz
         3ukRafBcunuKbhEiyQqNGvCZzZRApZbzR6PQKw1GJ6KZv7sHGEc337/z6YYO825F9Q3G
         P7N0S1V0W9FzgbOagSMa9RyRc2uh/h1SomWj7SpE5msj25lYXpJX30fCCmYEqx/2xUPk
         OkKssJGLlXZppuzoGPuoprnAksUq3Jh17wpHYht1qA5aOuFgD74AT1OETgJUwdiH9NnW
         k+nOH2jGxAESOaYvbBSkpX+l465qDL1gnVeBElD5XAPK2haxfwtWQElWzw7wsocQGM4O
         fxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:date:to
         :from:resent-from:content-transfer-encoding:mime-version:message-id
         :in-reply-to:resent-message-id:resent-date
         :arc-authentication-results;
        bh=4h377E1KVMWxGFlIu8PKJhVm4PGkMis1dHCs7QBCJp4=;
        b=zjQh3JrOVptSQJ8o7LAZngbPB6znO8bQUNTRpiXhfAqg5mme6Mzq2DxIEhTeA6d2BR
         3ZzRXvTjM6OIGhoj+BPR676VbPsxFEhWSG5MNr5WHV5RlSFOXqVGZMviui/t8f0f5qcT
         f542N+Jq4pqUvKS5e4OI28yyl1OMHSIA4jL6tpCozXZmMITrEKjFq+3ImlnsyBF6I/Qw
         ATIAbGAss6m06TY+4yoxRW9phekZxbUr1U4432LhQv3x+JPfb4MyhCZtHs0xoHfpO3w2
         cxna/msCwfZst1+5N8Q0n4IqCnxfO0HVs7iG77GikevkV/Su2ecZhYzjUZoj1ivsxjJ+
         2wLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1-v6si2408628qtc.6.2018.06.19.03.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jun 2018 03:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVDnV-0006dR-4K
	for alex.bennee@linaro.org; Tue, 19 Jun 2018 06:23:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fVDnJ-0006b2-U7
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 06:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <no-reply@patchew.org>) id 1fVDnG-0006xY-60
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 06:23:25 -0400
Resent-Date: Tue, 19 Jun 2018 06:23:25 -0400
Resent-Message-Id: <E1fVDnG-0006xY-60@eggs.gnu.org>
Received: from sender-of-o51.zoho.com ([135.84.80.216]:21082)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <no-reply@patchew.org>)
	id 1fVDnF-0006wW-T1
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 06:23:22 -0400
Received: from [172.17.0.2] (23.253.156.214 [23.253.156.214]) by
	mx.zohomail.com with SMTPS id 1529401067426266.6846863897173;
	Tue, 19 Jun 2018 02:37:47 -0700 (PDT)
In-Reply-To: <20180619075821.9884-1-zhengxiang9@huawei.com>
Message-ID: <152940106681.783.5655246929665863685@d39dc562802a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: zhengxiang9@huawei.com
Date: Tue, 19 Jun 2018 02:37:47 -0700 (PDT)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 135.84.80.216
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: fix a segmentation
 fault due to illegal memory access
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
Cc: peter.maydell@linaro.org, xiang.zheng@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com, famz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BAqpy3D4Pfk8

SGksCgpUaGlzIHNlcmllcyBmYWlsZWQgYnVpbGQgdGVzdCBvbiBzMzkweCBob3N0LiBQbGVhc2Ug
ZmluZCB0aGUgZGV0YWlscyBiZWxvdy4KCk4vQS4gSW50ZXJuYWwgZXJyb3Igd2hpbGUgcmVhZGlu
ZyBsb2cgZmlsZQoKCgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hl
dyBbaHR0cDovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVlZGJhY2sgdG8gcGF0
Y2hldy1kZXZlbEByZWRoYXQuY29t

