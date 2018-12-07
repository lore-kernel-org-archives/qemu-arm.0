Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp206372wrt;
        Fri, 7 Dec 2018 00:20:22 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XXJBt36z+VxxBXLh442J5wrytJxfb8UMM07ipBiBQ5u8JTGfLlJZU9ORE1YWhIkNQp5SPr
X-Received: by 2002:ac8:21ce:: with SMTP id 14mr1100416qtz.306.1544170822477;
        Fri, 07 Dec 2018 00:20:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544170822; cv=none;
        d=google.com; s=arc-20160816;
        b=xNyMC9uZki3PCs4jvWdcpKNgJbXNQPkkX3SJkbD002saEtc3LY/aHrU8ad1E7w0aem
         uH6Gqz9n6JEhyN6On6RYdrhlw0/eaU4+37PH94Peq6Ts6K+hJGl1kh02kZNqaJR+teE3
         2/I3wteP3ZcRLP1t4o4ToTRB7eVIZIRBGHTexz4G1zQ79nerJ0MO1JFa40QHWhp7i0Rh
         btxb7qF3Z4boitZzgniGMbT2YIeeHGblXsDogOwE0b8GRAMtkWo9MEptCJLbimESNkCn
         V23+e06P9TfcKZI7DXa79Ty/Y3Vj+5eZ6CZnDTxh6Pn1892CaoX9ujMU2XOICUT2SLhA
         H99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=739q9E5W1FEhp/q4YCs9lIecJ0eD0QKYQ2Pwn/+MfgI=;
        b=heHRZ9oTkg+If9EUWzyiv5+uaa/wm6U3e+nME7OUwONyf0a5Ff9y7G79+G9NtWXVp4
         AISkT+LW/y9T1DpuaqADDxCLwrYIIqvd+GnqwjVe65IP5DMiPC1MvC8zVtL16HdGkoIW
         jOX/s0WnMK8bPsMWj6e/my5oGxNRJeY6s+t/KGOtIzHHJwnU2j8QcEljCgQkrqgfx/Xm
         CdJj4Z/48AkrecsiAqKPKL8kOboQhpa79xFC3+6JOwpo2UQVm8X0QGUsJgNBj8o79m7E
         fGxF/J2XCFtYyPZUI+THVq5507jKWhOfzWd6EXlHwtNUZqVTiT2R4OewDDh5nAvQ34CQ
         KD8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a76si1941621qka.92.2018.12.07.00.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 00:20:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVBN0-00085z-0S
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 03:20:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gVBMl-00085s-HN
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 03:20:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gVBMi-00082B-07
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 03:20:07 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:44756 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gVBMh-0007xb-HP
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 03:20:03 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 6BE154AEB0D965C67274;
	Fri,  7 Dec 2018 16:19:55 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wB78Jmw4073564;
	Fri, 7 Dec 2018 16:19:48 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018120716202695-15320534 ;
	Fri, 7 Dec 2018 16:20:26 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org
Date: Fri, 7 Dec 2018 16:41:50 +0800
Message-Id: <1544172110-76526-1-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-12-07 16:20:27,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-12-07 16:19:33,
	Serialize complete at 2018-12-07 16:19:33
X-MAIL: mse01.zte.com.cn wB78Jmw4073564
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH] hw/watchdog/wdt_i6300esb : remove a unnecessary
 comment
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nGNc1G5rpxuC

The registered memory region of i6300esb is not suitable for coalesced
mmio, because a write for the region may trigger an immediate action
and can't be delayed.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/watchdog/wdt_i6300esb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index 7b59469..1c6eddf 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -449,7 +449,6 @@ static void i6300esb_realize(PCIDevice *dev, Error **errp)
     memory_region_init_io(&d->io_mem, OBJECT(d), &i6300esb_ops, d,
                           "i6300esb", 0x10);
     pci_register_bar(&d->dev, 0, 0, &d->io_mem);
-    /* qemu_register_coalesced_mmio (addr, 0x10); ? */
 }
 
 static void i6300esb_exit(PCIDevice *dev)
-- 
1.8.3.1

