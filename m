Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp960879wrp;
        Thu, 14 Feb 2019 05:11:36 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaMS2WRtDdPdCnpPT5w0FLbT30rtugrTqzyBjQ/4W4eX3TgxvBWAclDQRQTwuwj1Cyrt36S
X-Received: by 2002:a81:71c5:: with SMTP id m188mr2932773ywc.353.1550149896606;
        Thu, 14 Feb 2019 05:11:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149896; cv=none;
        d=google.com; s=arc-20160816;
        b=04rC/VaUdi/C7/29fGJ0hXrNS0jw3YLN6mZZkpK4oxvF9wy6RnkcFRTU0OWgeAQIXp
         c1mfyM6BqKLWiPyDpptXcqfI9+grOemVZNKr0qRQXD+PubegPgGy2BZpq6euwxC6FhLU
         ARqTTajJIdVxYkgCbJymrOYUTRNifV1deUbAwATrLquaex4pyOer89CRHNCNH0Bns/BR
         BpSk/tCXC/9XlJhG401qyahI556mYjHN0HBpXGWyBonpOQzVrnEXO7nX3eGh/LA0inb2
         by24RylfyhU59k/AHlADbRelzsxO4MVVyOaYnlSXuSFpXsUstKLj2bIYqZGue4G9/8ec
         aZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=7g9zWEgPnQ1/3e/7FE39QU99XF4zWTWG/yRPa1dvYJ4=;
        b=ckXaNQwvPNp0zYLT0v65eRPHhQBIcikUqTHgX81XQN0twmAOu9BFbV9G9MSTpxDHKJ
         O8S6+UYoR5jtGSjDxiMuVq8+Sy50m4tamIPwkHiRmbHF6obW8z3MgkM4Y9SQXCEDX8hG
         WYfItev7bEp42F7OUeG8d3tIV9i07aPu3Ycuesw3Cw9A7aDEcMlXJTMJcsuu514rijdm
         MWWWx7i3O4SWCANtLFUWrRCH19BDZwGS6hKBVq4TD/2Y5MCIaUPhcY47G6fBFEfVvzix
         p4J8BYPOV1nuu2YrbSo8D7aXrEvfp96qhDorTlpRdOG9LPJo8OyGcKfbHjo5YhvDFUny
         JFCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L9Ajd4o6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t124si1281923ywc.232.2019.02.14.05.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:11:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L9Ajd4o6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGng-0002NW-2G
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:11:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeO-0002tY-Nu
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 08:02:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGUe-00072D-JW
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:57 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45219)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGUe-0006jS-A6
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:56 -0500
Received: by mail-wr1-x442.google.com with SMTP id w17so6308075wrn.12
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 04:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7g9zWEgPnQ1/3e/7FE39QU99XF4zWTWG/yRPa1dvYJ4=;
	b=L9Ajd4o6Pgb6p4DcApMyojBNs9E6icveqCja/w7bkw12ndkmgLBvoUw4QhfXU1wvOr
	LQan0eZiJUA5nXl+sFcUbHdHmEaXV2uTteAytSPuM0aHhd+3Z12bK0gtodDpli/kwYEC
	L2S6OHfQsllwdeLRH0kuXwv0x2ARSJxViyFN/cRlsspPzEat+N4j5dthn4dgYbj5SUET
	YdnP8ON+n23dxzaCEP4S+jBkavrftozrRnv+DLHGmq0pJ68nqOh+kOtjLOYScepBHYUv
	Ez7qfNwfEW1wlKz03WmJPP/NSJaBxhpxnHnsXzIrsfVaI7HnhSv+boTtrcn99f6rKLlq
	TcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7g9zWEgPnQ1/3e/7FE39QU99XF4zWTWG/yRPa1dvYJ4=;
	b=Ww8B3LKtn7fSAZgYtYtNvns/CkEdSUj88cqYerqoHoOGJHer0jMqUJYpI5wYLn2y6L
	hpnWeNDZuASwOOHGeVwD2feMbGrFeIJBLxvloYJbRFekZJj6R8plV9qdM4kEiRgqtpRE
	bgfo7e6u/4lh5Q6/hjt9nkyy9kQKlvxQ/jrMn9FKMc5DtwahxnEgdeJVqZ7ZK3r9hg4n
	JMK6IppqxrVcARqQBiYF8LqqVR7z4DvcBH4OgeKa256UpAg1osL8+m68EfZFtdlgswNt
	yhJJHSeFdyq9wV4/TQMbYiM29JT2HvkYy6pJ1CnbybL49utZA85O7ZT7b4cIkkRSUwFL
	eOIQ==
X-Gm-Message-State: AHQUAuZyGq1F97SmRAToyV56KYW+6qDkYvgCPWBGGJUQqCKOnj641mDY
	jdBFtT3XcRAlAWyyy8UPEpOAZJ1SXrBAKA==
X-Received: by 2002:a05:6000:1287:: with SMTP id
	f7mr2882462wrx.203.1550148686149; 
	Thu, 14 Feb 2019 04:51:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:51:07 +0000
Message-Id: <20190214125107.22178-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 14/14] hw/arm/musca: Wire up PL011 UARTs
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
X-TUID: WeLr5/XH1QH4

Wire up the two PL011 UARTs in the Musca board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/musca.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index ec8dfee1964..e9701533d20 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -23,9 +23,11 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
+#include "sysemu/sysemu.h"
 #include "hw/arm/arm.h"
 #include "hw/arm/armsse.h"
 #include "hw/boards.h"
+#include "hw/char/pl011.h"
 #include "hw/core/split-irq.h"
 #include "hw/misc/tz-mpc.h"
 #include "hw/misc/tz-ppc.h"
@@ -69,7 +71,7 @@ typedef struct {
     UnimplementedDeviceState mhu[2];
     UnimplementedDeviceState pwm[3];
     UnimplementedDeviceState i2s;
-    UnimplementedDeviceState uart[2];
+    PL011State uart[2];
     UnimplementedDeviceState i2c[2];
     UnimplementedDeviceState spi;
     UnimplementedDeviceState scc;
@@ -285,6 +287,28 @@ static MemoryRegion *make_rtc(MuscaMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(rtc), 0);
 }
 
+static MemoryRegion *make_uart(MuscaMachineState *mms, void *opaque,
+                               const char *name, hwaddr size)
+{
+    PL011State *uart = opaque;
+    int i = uart - &mms->uart[0];
+    int irqbase = 7 + i * 6;
+    SysBusDevice *s;
+
+    sysbus_init_child_obj(OBJECT(mms), name, uart, sizeof(mms->uart[0]),
+                          TYPE_PL011);
+    qdev_prop_set_chr(DEVICE(uart), "chardev", serial_hd(i));
+    object_property_set_bool(OBJECT(uart), true, "realized", &error_fatal);
+    s = SYS_BUS_DEVICE(uart);
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqbase + 5)); /* combined */
+    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, irqbase + 0)); /* RX */
+    sysbus_connect_irq(s, 2, get_sse_irq_in(mms, irqbase + 1)); /* TX */
+    sysbus_connect_irq(s, 3, get_sse_irq_in(mms, irqbase + 2)); /* RT */
+    sysbus_connect_irq(s, 4, get_sse_irq_in(mms, irqbase + 3)); /* MS */
+    sysbus_connect_irq(s, 5, get_sse_irq_in(mms, irqbase + 4)); /* E */
+    return sysbus_mmio_get_region(SYS_BUS_DEVICE(uart), 0);
+}
+
 static MemoryRegion *make_musca_a_devs(MuscaMachineState *mms, void *opaque,
                                        const char *name, hwaddr size)
 {
@@ -300,8 +324,8 @@ static MemoryRegion *make_musca_a_devs(MuscaMachineState *mms, void *opaque,
     MemoryRegion *container = &mms->container;
 
     const PPCPortInfo devices[] = {
-        { "uart0", make_unimp_dev, &mms->uart[0], 0x1000, 0x1000 },
-        { "uart1", make_unimp_dev, &mms->uart[1], 0x2000, 0x1000 },
+        { "uart0", make_uart, &mms->uart[0], 0x1000, 0x1000 },
+        { "uart1", make_uart, &mms->uart[1], 0x2000, 0x1000 },
         { "spi", make_unimp_dev, &mms->spi, 0x3000, 0x1000 },
         { "i2c0", make_unimp_dev, &mms->i2c[0], 0x4000, 0x1000 },
         { "i2c1", make_unimp_dev, &mms->i2c[1], 0x5000, 0x1000 },
@@ -460,8 +484,8 @@ static void musca_init(MachineState *machine)
                 { "pwm1", make_unimp_dev, &mms->pwm[1], 0x40102000, 0x1000 },
                 { "pwm2", make_unimp_dev, &mms->pwm[2], 0x40103000, 0x1000 },
                 { "i2s", make_unimp_dev, &mms->i2s, 0x40104000, 0x1000 },
-                { "uart0", make_unimp_dev, &mms->uart[0], 0x40105000, 0x1000 },
-                { "uart1", make_unimp_dev, &mms->uart[1], 0x40106000, 0x1000 },
+                { "uart0", make_uart, &mms->uart[0], 0x40105000, 0x1000 },
+                { "uart1", make_uart, &mms->uart[1], 0x40106000, 0x1000 },
                 { "i2c0", make_unimp_dev, &mms->i2c[0], 0x40108000, 0x1000 },
                 { "i2c1", make_unimp_dev, &mms->i2c[1], 0x40109000, 0x1000 },
                 { "spi", make_unimp_dev, &mms->spi, 0x4010a000, 0x1000 },
-- 
2.20.1

