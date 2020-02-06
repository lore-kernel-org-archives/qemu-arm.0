Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp824099lfp;
        Wed, 5 Feb 2020 17:34:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqz5gPS6MLkydoR7bR1/i+PoxjtAPX9t7C128AZQRz1q3y5ZAS9C46bHzJKyxSgGXjSNlwnN
X-Received: by 2002:ae9:f81a:: with SMTP id x26mr512650qkh.231.1580952852111;
        Wed, 05 Feb 2020 17:34:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952852; cv=none;
        d=google.com; s=arc-20160816;
        b=Ry0uP8BsYuE0osAVEkj0GaHn25oHqkza7lDIEtTm2pHeh5O0J+F8o0THYY5WG+PwAO
         jsOwWFdEdB1O9pPZdqCOUdHUfNFpBH8z7aPBp4fyHzVcrwhFTAZfVgCkPMfj8GTnX1/W
         ltagBH13HGmsM1a1wQ2plLf9BkPw3jI+KicN1+oz9PTG3iEuuyD00vGP6iOuQ+LvyBL8
         kTuY79H4WM3v8BO9xI+Wozbr97A3QXlEPJBkaggLahJ6i7qiGNYhqyg5VY1OskH1ee8/
         MhinxEZZT6aKnCRIIHpxAJofSwLtw0jDenMmd4/uWAwVPCf5CunNKxw207gNi9o02Jlq
         kHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bj2pLjmxnon+yHpt+3WlsQNgSCFWtNKV2Jq/oi6zYzc=;
        b=VToPCFtNls0mTkFydJOneS4n0uoMQASIj3P/BpE4XeS9w63NrX1H3nGALi6ZOlDf2F
         PXWQsvSmPw5T26U9h5DeiXiAsRB240GT525H2FPAY7PRAr3Rd138sCeKq99TNGkOiKxl
         MUvRW+68tbdklyRvkEkXuCs/LsVLcmGETIK/p/biYHTHrQ+J3aF140LryCTrUaN4qv1N
         guMZa/Pdo1JqjRLGfKsRJecXWCii+3s16J0F+Fd/0Ozito/UY10lWep++/Hu618M45H7
         vigVSUClKak6wMn2SoVkP94IJ0bGfcW5HBnHvEM6+10p/rXmQwU6TQQkFwUt16emHRAV
         xE3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nye+nc8j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si781059qtp.41.2020.02.05.17.34.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:34:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nye+nc8j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izW3X-0003pr-EY
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54379)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVod-0001BW-KS
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoc-00049N-AB
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:47 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37402)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoc-00041K-3A; Wed, 05 Feb 2020 20:18:46 -0500
Received: by mail-wm1-x343.google.com with SMTP id f129so5041247wmf.2;
 Wed, 05 Feb 2020 17:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bj2pLjmxnon+yHpt+3WlsQNgSCFWtNKV2Jq/oi6zYzc=;
 b=Nye+nc8ji+LUoD+HqHEh898XZcqoaNdY5bQe5q2jNmG6KWO/OLLNAL0Mq6UN8IWRef
 HSTiFX9YHmG3prS6i6FPzypakPBA2Io13Sa1AnLVn4Cd/mrjcKmPmePyeBT1AeEBt+AO
 3lvg0H5lpxAQ8LOSoBfJu6rZY0yg7uN9z/9tUfwvpK0NKMIwqcDoznEMWEIdgPFcrzTu
 32rs7if1Avykot7/SS59R/EP4Nu5tQzBj2VlIZNkgYDZax5tO90n++DAXNLQtrlmTenu
 cb1SscE1nxv9ShTPYD+8DnE0uYJfzyYP3ekE7DGBewoMgAx1ldKy6XPhOYlSSjpzVdMZ
 nqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bj2pLjmxnon+yHpt+3WlsQNgSCFWtNKV2Jq/oi6zYzc=;
 b=b51GVn0jIaSj0igmTclU+8Tqr70csH6kWkXaHHl/iMUSdZBjB4WcuBv9zXyOconJJQ
 OMxfMYW0hjJ99K990M8ub4Hfmrxhw1Tara3YYJfwhb9SVKgY9hHDuPjoyzWmPat+dMy3
 LNJ/5u9igZgL5KnmVjie5NFMAuEdDKzZ3/5NfG7cWmv2o4lEbyHge9JdkA3ynQCGbrGl
 cDA2g7UhltY2Zi56nrOf7izsE5Hgm3U3UEWLzyacmyvWKppPXcOkfRGtQQDBSzSqZ6P6
 U+0A+Opn/ASLkMFppEBWsufIAzeUWu0mHNSv4nxO9C5bdrS+aFtQ/gN6EELJcmAJ0rks
 8wuw==
X-Gm-Message-State: APjAAAXobJIpujuei9/x1GAkH9nPn8iEafEnIOdfVLM6vokq1f4IoX2O
 kxku9K7pmgi8kVS1beipu7cpU+0y
X-Received: by 2002:a7b:c1d0:: with SMTP id a16mr582193wmj.175.1580951923906; 
 Wed, 05 Feb 2020 17:18:43 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/30] hw/arm/raspi: Add the Raspberry Pi B+ machine
Date: Thu,  6 Feb 2020 02:17:47 +0100
Message-Id: <20200206011756.2413-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cs2h0i+fVcz3

  $ qemu-system-arm -M raspi1 -serial stdio \
      -kernel raspberrypi/firmware/boot/kernel.img \
      -dtb raspberrypi/firmware/boot/bcm2708-rpi-b.dtb \
      -append 'printk.time=0 earlycon=pl011,0x20201000 console=ttyAMA0'
  [    0.000000] Booting Linux on physical CPU 0x0
  [    0.000000] Linux version 4.19.69+ (dom@buildbot) (gcc version 4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1261 Tue Sep 3 20:21:01 BST 2019
  [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5387d
  [    0.000000] CPU: VIPT aliasing data cache, unknown instruction cache
  [    0.000000] OF: fdt: Machine model: Raspberry Pi Model B
  [    0.000000] earlycon: pl11 at MMIO 0x20201000 (options '')
  [    0.000000] bootconsole [pl11] enabled
  [    0.000000] Memory policy: Data cache writeback
  [    0.000000] cma: Reserved 8 MiB at 0x1b800000
  [    0.000000] random: get_random_bytes called from start_kernel+0x8c/0x49c with crng_init=0
  [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 113680
  [    0.000000] Kernel command line: printk.time=0 earlycon=pl011,0x20201000 console=ttyAMA0
  Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
  Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
  Memory: 434380K/458752K available (6971K kernel code, 635K rwdata, 2080K rodata, 464K init, 797K bss, 16180K reserved, 8192K cma-reserved)
  ...

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 0d1f15e08c..47cc250883 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -334,6 +334,11 @@ static const TypeInfo raspi_machine_types[] = {
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi_machine_class_init,
         .class_data     = (void *)0x9000c1,
+    }, {
+        .name           = MACHINE_TYPE_NAME("raspi1"),
+        .parent         = TYPE_RASPI_MACHINE,
+        .class_init     = raspi_machine_class_init,
+        .class_data     = (void *)0x900032,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi2"),
         .parent         = TYPE_RASPI_MACHINE,
-- 
2.21.1

