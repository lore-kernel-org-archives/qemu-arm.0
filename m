Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp953248wrp;
        Thu, 14 Feb 2019 05:05:17 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaATTuydtzGf7luQRNssO4RYfxyBXJEWIblHEdgsyFtZaa1KBq3K304Gjkv4i9O8eNG87sS
X-Received: by 2002:a81:1701:: with SMTP id 1mr2813607ywx.56.1550149517771;
        Thu, 14 Feb 2019 05:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149517; cv=none;
        d=google.com; s=arc-20160816;
        b=zJDfh7pXH8nhJfoA9k4algl7C3hVH9l793TIMoOi3oFRduQKfuSitzGNpFurTw4Gzo
         UxvKH1og/Vmp1a5C1mDD+dAEKeTg2Odc3JcUEbmrQ+ElbPAPOXfxtVVH/3xn1CZvyrhs
         EtZMD74CihfYtHwzU0R0upfB//iRKbDkxlJ9miRosj0tuM6laxSIbXafZj41rfgE4ERr
         uaR5ltARrKARLuwbp2vGtt/NRVAV1klexvJLuWJb0uT9nrIzP7tV5TTMY/THCezb8VYR
         KMlTSwDBSyzBryqmp0qogAqZ56qYNEzceWAWoBofL8g0cIaHd3q2xHq0Zeqvz5ySUBOP
         QsEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fPHjh0vcD+s+CvwW5rloGqyfYyS+yolZGFn/O41zExg=;
        b=IeeWkcsN1rqEfhmLcU5GT8ylabZ/BiOn0YTT0th8vx10G1sN0rTZz1tY1TiOm3nX8w
         J5k6z8ouyFU1xMcupsSxY/VvCQaFO//9JrVIdl3qG+fn614yDB8vDbN6jJnr0980ddB2
         KvGC67p3GS6sJ9RvKEonnVLyK4drRqZ6e+xCdeH3FLHU7vTsQOhK2l8MzoQtPojWxcIY
         y2FL1t9K61ommBdLDONUiDBt6ot+jM2syEbBxtugRYSjr1WmzLbyGRe/YsAd8SaSe9hv
         odTLBiU2ngGHPOCT1PNDr0SHnWPJTI6waaryoY0BkAuj9P72FX8gRXjiJJjbpdNCO0L+
         YYjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CJ2gk9o8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j187si1308918ybj.177.2019.02.14.05.05.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:05:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CJ2gk9o8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGhZ-0005T8-5e
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:05:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeP-0002tV-Ka
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 08:02:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGUe-000718-5G
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:57 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36896)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGUc-0006hr-6o
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:54 -0500
Received: by mail-wr1-x442.google.com with SMTP id c8so6346678wrs.4
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 04:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fPHjh0vcD+s+CvwW5rloGqyfYyS+yolZGFn/O41zExg=;
	b=CJ2gk9o8AkB2+K7FMlmN4yNzeVcbZiMH7mupkS/ToqRV/qSeSkfCjD1ukhP3NVht8t
	xm/0A2aKXV4l+y5d8PVh0rGCdfb1JYgjfWCVggo4X9KC8b/Dp9EoiLGAhTQS1qTQnRDg
	R+ZA+4aQjPORvrvpR4vrC2yyaIhsRoK8g2dDqDUCgAP2UiXKLyS4yyCgG+GCRkC+1/9z
	JqGYkUzOnkj4su8bx/SqyP5O3bhYiGMOc1TfhVio8JIU+VEPIzThjQBQw1tfwOsA7AWT
	3sCsEnBtdAGVJm1DHVEqj+XekOiD8Ni5w7lvQp/W6sc8vODqe1tiEBWmLRDPkXUtPkZb
	bq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fPHjh0vcD+s+CvwW5rloGqyfYyS+yolZGFn/O41zExg=;
	b=AojW+Q8QW47NTqnCYZlYPidPfGWM77KWaiB/ihBMNv9rd7F05VdyjmPMrJUrD5tAwS
	4FlqFyZXouosKdQrxAPFva9wjBEDh12JzW6n7S1ACbR7Iuouz+t90aF8N1U9+1deXgao
	aJuhkx5P/hllvFgLFbk6Ryfe+hCqv8ZIjYg3pl6lAqPNLZjK/nVkmb96pGoYTcSbRR3m
	h5WMEiTuq9y6K5yR1N0/owVr8i6oYAonEbq2Byf1ws8KiYAk112cfM501Wd7jbkwO+zi
	t6cKAoaKwQZMGO3G+U4cT0ZCZnJafEjKJtILtVvVF008mrxLSt67hSyyTMLF7e9iiDMJ
	jF9A==
X-Gm-Message-State: AHQUAubEP1xlyE9IhSsItpEFsVg5P1Fl0exY7qFMDRFxYld89m5OeypV
	xuuzT/E22reTm1JVT83QC1jIKFhgRNoBNw==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr2644877wrp.150.1550148684789; 
	Thu, 14 Feb 2019 04:51:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:51:06 +0000
Message-Id: <20190214125107.22178-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 13/14] hw/arm/musca: Wire up PL031 RTC
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /r/z6nnOmIsf

Wire up the PL031 RTC for the Musca board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musca.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 5fadac8c09b..ec8dfee1964 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -30,6 +30,7 @@
 #include "hw/misc/tz-mpc.h"
 #include "hw/misc/tz-ppc.h"
 #include "hw/misc/unimp.h"
+#include "hw/timer/pl031.h"
 
 #define MUSCA_NUMIRQ_MAX 96
 #define MUSCA_PPC_MAX 3
@@ -73,7 +74,7 @@ typedef struct {
     UnimplementedDeviceState spi;
     UnimplementedDeviceState scc;
     UnimplementedDeviceState timer;
-    UnimplementedDeviceState rtc;
+    PL031State rtc;
     UnimplementedDeviceState pvt;
     UnimplementedDeviceState sdio;
     UnimplementedDeviceState gpio;
@@ -98,6 +99,14 @@ typedef struct {
  */
 #define SYSCLK_FRQ 40000000
 
+static qemu_irq get_sse_irq_in(MuscaMachineState *mms, int irqno)
+{
+    /* Return a qemu_irq which will signal IRQ n to all CPUs in the SSE. */
+    assert(irqno < MUSCA_NUMIRQ_MAX);
+
+    return qdev_get_gpio_in(DEVICE(&mms->cpu_irq_splitter[irqno]), 0);
+}
+
 /*
  * Most of the devices in the Musca board sit behind Peripheral Protection
  * Controllers. These data structures define the layout of which devices
@@ -265,6 +274,17 @@ static MemoryRegion *make_mpc(MuscaMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(mpc), 0);
 }
 
+static MemoryRegion *make_rtc(MuscaMachineState *mms, void *opaque,
+                              const char *name, hwaddr size)
+{
+    PL031State *rtc = opaque;
+
+    sysbus_init_child_obj(OBJECT(mms), name, rtc, sizeof(mms->rtc), TYPE_PL031);
+    object_property_set_bool(OBJECT(rtc), true, "realized", &error_fatal);
+    sysbus_connect_irq(SYS_BUS_DEVICE(rtc), 0, get_sse_irq_in(mms, 39));
+    return sysbus_mmio_get_region(SYS_BUS_DEVICE(rtc), 0);
+}
+
 static MemoryRegion *make_musca_a_devs(MuscaMachineState *mms, void *opaque,
                                        const char *name, hwaddr size)
 {
@@ -287,7 +307,7 @@ static MemoryRegion *make_musca_a_devs(MuscaMachineState *mms, void *opaque,
         { "i2c1", make_unimp_dev, &mms->i2c[1], 0x5000, 0x1000 },
         { "i2s", make_unimp_dev, &mms->i2s, 0x6000, 0x1000 },
         { "pwm0", make_unimp_dev, &mms->pwm[0], 0x7000, 0x1000 },
-        { "rtc", make_unimp_dev, &mms->rtc, 0x8000, 0x1000 },
+        { "rtc", make_rtc, &mms->rtc, 0x8000, 0x1000 },
         { "qspi", make_unimp_dev, &mms->qspi, 0xa000, 0x1000 },
         { "timer", make_unimp_dev, &mms->timer, 0xb000, 0x1000 },
         { "scc", make_unimp_dev, &mms->scc, 0xc000, 0x1000 },
@@ -447,7 +467,7 @@ static void musca_init(MachineState *machine)
                 { "spi", make_unimp_dev, &mms->spi, 0x4010a000, 0x1000 },
                 { "scc", make_unimp_dev, &mms->scc, 0x5010b000, 0x1000 },
                 { "timer", make_unimp_dev, &mms->timer, 0x4010c000, 0x1000 },
-                { "rtc", make_unimp_dev, &mms->rtc, 0x4010d000, 0x1000 },
+                { "rtc", make_rtc, &mms->rtc, 0x4010d000, 0x1000 },
                 { "pvt", make_unimp_dev, &mms->pvt, 0x4010e000, 0x1000 },
                 { "sdio", make_unimp_dev, &mms->sdio, 0x4010f000, 0x1000 },
             },
-- 
2.20.1

