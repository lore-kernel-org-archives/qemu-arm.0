Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5431986lfp;
        Mon, 17 Feb 2020 13:08:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqzf2qUCv2S6eIcN/Ikwonk17rgWV18gckYgGzU4tooKnmjyo+fDYllesKv9SfpWj0biWTly
X-Received: by 2002:a05:620a:ce5:: with SMTP id c5mr15683448qkj.49.1581973718697;
        Mon, 17 Feb 2020 13:08:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581973718; cv=none;
        d=google.com; s=arc-20160816;
        b=eA/IwEx+3XVA9u/iMCyo9/OKEbBzIRJLe3bfre8tMqyV4HeZXjt6mRX45r6DYxi5Om
         OkfKSVDc9rnZLP68VbsLlsfL8pa2KpWtWAxchm5k7m86iEppo2dbnzw2HlKiYGhgdPTK
         e2EYia3W14W79WqsAmVb3Dc1W+SVCIuE16+n8wzvIEIJleyibUMIMML/cwOnbqyEQzE4
         Bs/Aifelh/ZfbJKNwfqDugafIa3Ic3NT4ibx4zGzocaTuc0zCSB166DdfKbyT5Dzmwuf
         SLdv09JsIvi35D5ko48zAkWXqlpw2sWEIe3UxNtSkJe1LaPdNEhiRq+RRqmmx6pdTCLW
         drsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=4W8ac1dYsXHMdhBg8YUpwrP/cAv1a4OAvhptQKJ56As=;
        b=uPMaJnFypvwW82NfaB8rCcLDE9i7IhL60jlg7LnSnM4cZ/wm07aI50uvE5j2AOrwjO
         3II8MPci/RJ1qjq+g7OROar559+R+0fwjpAGncFG9jDfDu5q/w0j7xlOtQjmZ1urGLdx
         PoYfKEN45xBYoB5ZCG6q5OTViB7wJXhofhlZJe7BhbXy2dWxbNoupgTN558hOVCv/NEk
         ONDpz3p1ShehUAGto4z6AvttKFUBxNKWs/oB3IDisn1667B7zhIXAQly5Utarvvv1Nhf
         lhrU0JjVf8jqgVKOlYeBpqD2hgODpw0Xj/AsnJ5QojIs2ORQAfZ1MIKoMysXQB02QR/S
         5DXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BfXdRVPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si841652qtg.228.2020.02.17.13.08.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 13:08:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BfXdRVPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3nd8-0002FG-3r
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 16:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41199)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j3nd0-0002F2-5L
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 16:08:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j3ncy-000886-VZ
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 16:08:29 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34434)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j3ncy-00087J-Nx; Mon, 17 Feb 2020 16:08:28 -0500
Received: by mail-pf1-x442.google.com with SMTP id i6so9552213pfc.1;
 Mon, 17 Feb 2020 13:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=4W8ac1dYsXHMdhBg8YUpwrP/cAv1a4OAvhptQKJ56As=;
 b=BfXdRVPRawhRZquebRHNooYXxntVh8rTF5sB17PRyYahYualveqfXII9RDCBqcxdha
 OfyqxZcCzYDQg/uL/5csxoIfDq7m0KX7L4Q8SHNScqHlWJQFd1mkNpyio0t8Ks1Y665v
 KJbVlnwzl24+VPTp2QSSdJp84YdDiFzbSHiWPApgNUZtz0KM+F1b+QQjCJlK8UbtJYL8
 8s/E9xLMRjLZ0x53Fh2D/0pC7hJF7+I/hFGojFipSkQVIiwxM6O55VLqErzQ55Rkt0TD
 ZFa/HK8NJE+KOAqNXtlJgVYJJErDjftASR7z2/BEoOniNeCV76FVglrDNDkrwtGjiYT7
 pORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=4W8ac1dYsXHMdhBg8YUpwrP/cAv1a4OAvhptQKJ56As=;
 b=sV+yFJTQMCkmuKnoMpQ0uSl0xYRYMi2sJqouGNOzQp0bT8UHxbs3xQoRajLU/kP/TI
 +3yKeFxt4x96Kd2/uvfLQ+SyCNHgVSHU0ne3ygaa6P4SPet1Ke8mR34I0p9IE0SHh0Du
 pAlsWw1ZidDHHEgL0olAHwmgiInhv9kWGcjVrb9QDAD15qGUj2iAVbDz/F8vqBshwsBs
 DcbeXWNoTnoI6PeuetdsyWW0xVbnSpF1vRE8sC0e2gXwl11A899x8yv52A+PrI1yLwjw
 79e86dym81v9zuf0UI0EbkzzfR4DrE+Dcc0zv1Vrbo1g013o4jw0TAyvE97FaTqnrR4C
 iLoA==
X-Gm-Message-State: APjAAAXrvc/oN+N4xWeF9dOWtY88SIocdxrEilAj8LDWZNKvnEZ1o3GW
 z7kV2VUY0mTKp3DabMQrVuc=
X-Received: by 2002:aa7:84cd:: with SMTP id x13mr18955649pfn.130.1581973707334; 
 Mon, 17 Feb 2020 13:08:27 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q187sm1292509pfq.185.2020.02.17.13.08.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Feb 2020 13:08:26 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] mainstone: Make providing flash images non-mandatory
Date: Mon, 17 Feb 2020 13:08:24 -0800
Message-Id: <20200217210824.18513-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xPYjQvvfKblv

Up to now, the mainstone machine only boots if two flash images are
provided. This is not really necessary; the machine can boot from initrd
or from SD without it. At the same time, having to provide dummy flash
images is a nuisance and does not add any real value. Make it optional.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/mainstone.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index b01ce3ce08..6e64dfab50 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -138,19 +138,10 @@ static void mainstone_common_init(MemoryRegion *address_space_mem,
     /* There are two 32MiB flash devices on the board */
     for (i = 0; i < 2; i ++) {
         dinfo = drive_get(IF_PFLASH, 0, i);
-        if (!dinfo) {
-            if (qtest_enabled()) {
-                break;
-            }
-            error_report("Two flash images must be given with the "
-                         "'pflash' parameter");
-            exit(1);
-        }
-
         if (!pflash_cfi01_register(mainstone_flash_base[i],
                                    i ? "mainstone.flash1" : "mainstone.flash0",
                                    MAINSTONE_FLASH,
-                                   blk_by_legacy_dinfo(dinfo),
+                                   dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                    sector_len, 4, 0, 0, 0, 0, be)) {
             error_report("Error registering flash memory");
             exit(1);
-- 
2.17.1

