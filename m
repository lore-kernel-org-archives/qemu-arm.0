Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4990751lfp;
        Mon, 17 Feb 2020 03:49:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqwpnAZ+K+JBl5VwN8DutB+jEcNNJFGJJI+hVJg711lUtiiKxyBG22tm4gDEI3D4BDh91Rui
X-Received: by 2002:a37:a8f:: with SMTP id 137mr14280960qkk.435.1581940178537;
        Mon, 17 Feb 2020 03:49:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581940178; cv=none;
        d=google.com; s=arc-20160816;
        b=zvGWjirx/Z+QBL/ZocLhgNcD9pDCYUE+c7ZA9tA76LbW4MNb2NCUpa+Kl/xAOFLX9m
         12sj3yaXAuITY2gFm9IcedCPdSA38IW9JN6XWylJCPlY+d/0BYpSF6un2yMld4+99ywb
         Azr89AtMaCqqkw2IwAC2/j5B6DoIOCH8dovUTtXDwTtzIaDHjHXVDkZMYPMWlpjrXKy7
         RRucQhZJn4Ru9TCeek/ezwXGsN1TgBIi+HczmUhSRM+mgT7QcZlf2HRNPYy6gChXDtMX
         /DYhB3WF8kn/av+6ctE9O2+wlN2iLgC5OZgnmTdeLYax6QNEx5KMllZY7Mt+mMYJ/V3H
         /8nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=e6o40FQDzdl6CfxP9P4N29oFY6w25k3CvNK8SZvDQSU=;
        b=VTu730GocJxRzFe4NcLYxByxog0TOcRZkVqNOPLQINmPufDTMF0mSb+a5wlaNwa6mv
         Wncu7DGaWJx0SSDPOPGu/kGgiDkgskPzxE5BWqBSDtZQQl14NcUF4mDC4TgO4mzSHq+Z
         R/VDoqMTttt58kGz/gVm4HFJvfEoBo2jAVT7Rppb0MHWzD2+sncKOvJoFlTNVPl9f88K
         RAzlTYsCMdNVjt7fREpTAxravER2/3RQLRAjNDK0EvuNF6PLgCFSu5oaZj6RqLVPyeIE
         IGM/LvFXO2jg7Y8YIKLfQ5E/LnVZCbB1l0jfvFEFf3hZvPskYOXlwV8CR0ICT7iORKbt
         erxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kIeub963;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p26si117949qtn.17.2020.02.17.03.49.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 03:49:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kIeub963;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3eu9-0003xC-O9
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 06:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqf-0006t2-R1
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 06:46:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqd-0002cM-Sb
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 06:46:01 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37415)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3eqY-0002Y2-8C; Mon, 17 Feb 2020 06:45:55 -0500
Received: by mail-wm1-x341.google.com with SMTP id a6so18119764wme.2;
 Mon, 17 Feb 2020 03:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e6o40FQDzdl6CfxP9P4N29oFY6w25k3CvNK8SZvDQSU=;
 b=kIeub963KMmxDyr5Sbk+hECgTs5ZIWGNz9Tb72w2oYXCzzU1sNViMWeNMUt8To/dkX
 DwGAHk0hYeN2P9gyjcJFVInGAHOXI8F9LWKpLQ33xkDavUSIURTKCJJBOmQ2/+1FO+Xw
 lEsvJf6u/t2C2OoNhy8KRDEF/cQfdtbjTnYeERk243xrF3SJzN09XyLpzoFGyVOXfi4J
 HzZ0KuNWU7sIV7ebCdE5qdr0jFmDaW5ywTA8SLTHGOiQZ2c032A6O7t33Qec4mP8RW5V
 ONvgTYYHKxsHu/uqTkYETQADCGHehr+2aSfzLPiwNJdPZctnYorkSeeXnBXCBqwQp6UY
 gosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=e6o40FQDzdl6CfxP9P4N29oFY6w25k3CvNK8SZvDQSU=;
 b=iaQL2jnMs/9vp6Ju1BTt/qnvRBSjwhE55fLuqmmaGmaJTZnM6nAS+UdzBkFKYfgiE0
 c5Qxg+BYhWsmfstdJLbz8+jt+LlAk0hjFe4lL+ALz4Q86oIydTTRKmQJQ6XKZu4xqOIx
 CzbZUDsR/FlfW53AULjJg9Nq3ZisZhI739RNmAmpqM2/KYz+pNAsw98D5+nqokyxobQq
 p3B6GmqHm3ALPZ1en2oHG8sYoDektkplyEXbOZNanZ9wZ2/T7Y3nIKKrkano9+7/3UtT
 LAVFORGUdiBH+7H3rDpJQEK2Qjwz5hzEDSAc0czsREbfHuJhQbLn3JySMBTZPtWI79Gu
 Q5Rg==
X-Gm-Message-State: APjAAAX0v6di2vFl6sgrMw8ITl1cKK1HNs5kwP/uL1RtsqY4SvHrngAR
 0EQ6S5ihHLNhSbQiPATxPLhYxeeUUlw=
X-Received: by 2002:a1c:988c:: with SMTP id
 a134mr21058122wme.163.1581939953007; 
 Mon, 17 Feb 2020 03:45:53 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i2sm268149wmb.28.2020.02.17.03.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 03:45:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/13] hw/arm/raspi: Add the Raspberry Pi Zero machine
Date: Mon, 17 Feb 2020 12:45:33 +0100
Message-Id: <20200217114533.17779-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217114533.17779-1-f4bug@amsat.org>
References: <20200217114533.17779-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 82kguOoV1ZGD

Add a Raspberry Pi Zero machine.

  $ qemu-system-arm -M raspi0w -serial stdio \
      -kernel raspberrypi/firmware/boot/kernel.img \
      -dtb raspberrypi/firmware/boot/bcm2708-rpi-zero-w.dtb \
      -append 'printk.time=0 earlycon=pl011,0x20201000 console=ttyAMA0'
  [    0.000000] Booting Linux on physical CPU 0x0
  [    0.000000] Linux version 4.19.69+ (dom@buildbot) (gcc version 4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1261 Tue Sep 3 20:21:01 BST 2019
  [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5387d
  [    0.000000] CPU: VIPT aliasing data cache, unknown instruction cache
  [    0.000000] OF: fdt: Machine model: Raspberry Pi Zero W
  [    0.000000] earlycon: pl11 at MMIO 0x20201000 (options '')
  [    0.000000] bootconsole [pl11] enabled
  [    0.000000] Memory policy: Data cache writeback
  [    0.000000] cma: Reserved 8 MiB at 0x1b800000
  [    0.000000] random: get_random_bytes called from start_kernel+0x8c/0x49c with crng_init=0
  [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 113680
  [    0.000000] Kernel command line: printk.time=0 earlycon=pl011,0x20201000 console=ttyAMA0 root=/dev/mmcblk0 rootwait
  Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
  Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
  Memory: 434380K/458752K available (6971K kernel code, 635K rwdata, 2080K rodata, 464K init, 797K bss, 16180K reserved, 8192K cma-reserved)
  Virtual kernel memory layout:
      vector  : 0xffff0000 - 0xffff1000   (   4 kB)
      fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
      vmalloc : 0xdc800000 - 0xff800000   ( 560 MB)
      lowmem  : 0xc0000000 - 0xdc000000   ( 448 MB)
      modules : 0xbf000000 - 0xc0000000   (  16 MB)
        .text : 0x(ptrval) - 0x(ptrval)   (6973 kB)
        .init : 0x(ptrval) - 0x(ptrval)   ( 464 kB)
        .data : 0x(ptrval) - 0x(ptrval)   ( 636 kB)
         .bss : 0x(ptrval) - 0x(ptrval)   ( 798 kB)
  SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
  ftrace: allocating 25193 entries in 74 pages
  NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
  sched_clock: 32 bits at 1000kHz, resolution 1000ns, wraps every 2147483647500ns
  clocksource: timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275 ns
  bcm2835: system timer (irq = 27)
  Console: colour dummy device 80x30
  ...

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 2d9f4e3085..d59d7c4294 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -324,6 +324,15 @@ static void raspi_machine_class_common_init(MachineClass *mc,
     mc->default_ram_size = board_ram_size(board_rev);
 };
 
+static void raspi0w_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0x9000c1;
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+};
+
 static void raspi1b_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -357,6 +366,10 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo raspi_machine_types[] = {
     {
+        .name           = MACHINE_TYPE_NAME("raspi0w"),
+        .parent         = TYPE_RASPI_MACHINE,
+        .class_init     = raspi0w_machine_class_init,
+    }, {
         .name           = MACHINE_TYPE_NAME("raspi1b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi1b_machine_class_init,
-- 
2.21.1

