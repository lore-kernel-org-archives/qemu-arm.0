Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10482018wrt;
        Thu, 6 Dec 2018 03:07:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WxThes3tHiBkSF3ttQtWjvvJgZA4D9bFQZa4aMeBt/ZZnGoAVYfh56ahtSahhQb1Zx5tUI
X-Received: by 2002:a37:3692:: with SMTP id d140mr25143616qka.108.1544094474517;
        Thu, 06 Dec 2018 03:07:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544094474; cv=none;
        d=google.com; s=arc-20160816;
        b=aZTGcslZaXQEerPwgFkYnGUJRMbi6DedwQREOEc1MMRGuOwiHsLfIVQGNQJGe8rWKc
         Mo/FVuP+Cp1Hu5SXWWLDYDLyehHlZ/c6/kkflvbh9JppwnhW8qubWoFqnYYsTgDysJ0S
         Zw5eGOg6fK3c2dhVDHolE3SlumlNjv+nEmWmmWSVOO6D1+kBMo5OuIMdHdQs7amUmeJD
         VNczZwaMyDnypZVcklJ6glP5WB9sEtmgonNbfH8LDmMVKkjbqeo9L3UoZ2CMME3GVAPy
         uXaqDwYl8/XfdauQrA/2Ds6NkewQ511etCi+sqiVyOLJ58mjqgTd/Cnd+T103qrrItsP
         K91g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=SnBZ/s7P4nE9iEzhSGolzJNQakKvrmAFM9bW/C74H3E=;
        b=FXfIjPMe5ura1Ulb8mUNsRW74VGLl1cvduF0P8QbgyZiveLQJTsElQsfYdQvqX4k65
         QQX2FJi54c4/bOgPcTYvCuAhinP+n9u82lJggyCAcXRzbc9Nj6FXMjjbq3+O3uLcb4e0
         jYXLBmRT2K8c/2d9mVZNPpaxdTHjdWxqDuSpLZTx8DdKQC3wOyd9pofdeBQm+MaJbx68
         gMKpjNePahMkV/SKOAC8UL3gVGL0HsRBYr0kvNFEvUsrM+Jeolfpv4lbNSuBIGSl3jXl
         UrKDBQpaio21O7bNms57VIe5WOr5HjiZByfVI9ZB0o61FTzI8+QMxGaUsA3B5RSnV8sY
         ip0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p45si23786qtk.294.2018.12.06.03.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 03:07:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUrVa-0006c9-0n
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 06:07:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUrSJ-0002xI-Rm
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 06:04:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gUrSF-0000EZ-Pb
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 06:04:31 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:41304 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gUrSF-00009A-6w; Thu, 06 Dec 2018 06:04:27 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id F03C8FA7DAA4FE236D88;
	Thu,  6 Dec 2018 19:04:13 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB6B41gJ072809;
	Thu, 6 Dec 2018 19:04:01 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120619043239-15124402 ;
	Thu, 6 Dec 2018 19:04:32 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Thu, 6 Dec 2018 19:25:59 +0800
Message-Id: <1544095560-70807-5-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
References: <1544095560-70807-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-06 19:04:32,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-06 19:03:49,
	Serialize complete at 2018-12-06 19:03:49
X-MAIL: mse01.zte.com.cn wB6B41gJ072809
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V12 4/5] hw/arm/virt: Use the pvpanic pci device
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PQ0sgwd+z88A

Add pvpanic device in arm virt machine config file.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 default-configs/arm-softmmu.mak | 1 +
 1 file changed, 1 insertion(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 2420491..50345df 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -159,3 +159,4 @@ CONFIG_PCI_DESIGNWARE=y
 CONFIG_STRONGARM=y
 CONFIG_HIGHBANK=y
 CONFIG_MUSICPAL=y
+CONFIG_PVPANIC=y
-- 
1.8.3.1

