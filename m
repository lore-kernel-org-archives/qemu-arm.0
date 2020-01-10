Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1177108lff;
        Fri, 10 Jan 2020 12:43:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqxf04TzL88P+pJ/MnZr15h/BpDDFRi4D9FkhEttvz9hEZY2mAfCASCiOHmp/8nvZJh5gTWV
X-Received: by 2002:ac8:602:: with SMTP id d2mr307290qth.245.1578688999676;
        Fri, 10 Jan 2020 12:43:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578688999; cv=none;
        d=google.com; s=arc-20160816;
        b=xqwe4hhTDz9ovGi+gE4aOUwUTcQwQrHbEFy3SBtUTyqGuqf6wCSoS4IZFW26LlLiZZ
         b5bs4b1QzBzHxoX4vi04wcL/UpxvzqARsvJU3nMLRUUw5ZjSHsmUYe4lzY/E57wRW+om
         a9IdhOHNSyNB4FjqzE42TU5yhtmidWvHQvWb1lq1QxmMN6adHhee7O6tVErkY7OEsHzb
         zSsKTT8r06aHROv+Bk7gRt+98naapbgwbEmuxvSYeoTbaVLMwqi4VRLT/FYfOv7kkKXW
         bmEEo7XP2xshP11rjVTXfnZb7JnDXL9Arh4MsLbssVXci0F755G7VdYvHio+ci1DJ5LV
         f9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=kJL6D43Lk44GZABLgzICULfdZGP31GnZA6iTy8OUmgw=;
        b=PIajJazCOatzpUJY9YqiMGQzaqy8EZyx3oduk6gCyvi0yDreNwFdaF6FzP3RyZAzHp
         bOa6zNtfehaYcBzQsJ6iuY+XD/vjivT+k1DGUMUlEdVYqjjebWsZteBVbFX/RDyDNRGD
         uUNf6p1jhCHazVImQzw92vsnKUaqOS2EFCLPmI9DtgA95/C8GjiXJRogmQfsFxWxcybH
         IO/dW/l7Ssjzd9d4jEo4f/xMdhFfmyU+lM5nPTWpcysAO4Cnv8PI3cTaJoo31fCRx6lv
         bc9ADx2w7k2xyk2lsy/VQyfbC66W7V7IxC7VxXDxhcMOfQyMphxZEynHPJJGCZnUX2Fz
         KJjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BsCNWbxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si1783911qtr.106.2020.01.10.12.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 12:43:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BsCNWbxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iq17m-0005Sx-GZ
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 15:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33808)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iq14W-0000bk-5g
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 15:39:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iq14U-00078O-Tr
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 15:39:56 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45075)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iq14U-00076A-NW; Fri, 10 Jan 2020 15:39:54 -0500
Received: by mail-pf1-x441.google.com with SMTP id 2so1657503pfg.12;
 Fri, 10 Jan 2020 12:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kJL6D43Lk44GZABLgzICULfdZGP31GnZA6iTy8OUmgw=;
 b=BsCNWbxRViMev+a4DX4+9xeUa52wF6S1322fYGoJDlQzZsEJ3l+GxXET57BfH3m+8R
 fwaS13ZcNn1CWoMdPojoFz1kZ8rKizegtU/0iAbVzdWHFtGB/2Si0mD/mkFzHnf23OgI
 psisQthE6QJm2Ep7sCFEfjWyfTR6wIF02zYwDeOIJ3Pjzn6+5OgS7tYVGd504DGtORAq
 eDjU4OquxYOMgCkMU3vatfjLBE0DxSCc9tWtH+H5gEMRrcrqaEOpuYbaJNuuooUMGnu/
 xmBd6VkAR/z3H41BSpgqN1f3vVDFdlO4TKU/6AZ9uViwd2+cMXOzoDR6zjxfSmxNz4L8
 ocjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=kJL6D43Lk44GZABLgzICULfdZGP31GnZA6iTy8OUmgw=;
 b=CmQ1su3Y8XWskNIu2NKim+Z4XdOvxoW8XUOAKH/cAPxzi6L0AomfQEnwzim45JJ+vd
 VuY7QOLu64CfkYdMACUTN5zYUFsAKGUQdk33JopGoefUnsc/TnuIjoXG65KJ/EJZBRyJ
 JBClb09LqG8P/B64edmtGaZJf9MXHSDAi6t7cdt96OdlCvraQGF0jWx26xIzrXZtPs8a
 zHtKp7oeLzkifLxcEP+a2y3ZREA4b5HJQjP20JbJTLEVGDSRz68erJ8VnocCG6MFqF3d
 4cE1dkl6z06wGG7rRRpbCfYvLcuu73qNRwExh1hyHSKK+sBF925loMTbNvR6NC0fECYo
 LuXg==
X-Gm-Message-State: APjAAAVW0B6lvQeTxhrM94gNiImX5v9p95kC867SjL63G0o7BEyv4XrV
 8SGQRcEhWJhe/b6ho+EVL80=
X-Received: by 2002:a62:788a:: with SMTP id t132mr6234013pfc.134.1578688793976; 
 Fri, 10 Jan 2020 12:39:53 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id d3sm3826240pfn.113.2020.01.10.12.39.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Jan 2020 12:39:53 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>
Subject: [PATCH 6/6] hw/arm/exynos4210: Connect serial port DMA busy signals
 with pl330
Date: Fri, 10 Jan 2020 12:39:42 -0800
Message-Id: <20200110203942.5745-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110203942.5745-1-linux@roeck-us.net>
References: <20200110203942.5745-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z9xmcQddJM47

The Exynos4210 serial driver uses an interrupt line to signal if receive
data is available. Connect that interrupt with the DMA controller's
'peripheral busy' gpio pin.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/exynos4210.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index c7b5c587b1..498d79ebb2 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -166,8 +166,8 @@ static uint64_t exynos4210_calc_affinity(int cpu)
     return (0x9 << ARM_AFF1_SHIFT) | cpu;
 }
 
-static void pl330_create(uint32_t base, qemu_irq irq, int nreq, int nevents,
-                         int width)
+static DeviceState *pl330_create(uint32_t base, qemu_irq irq, int nreq,
+                                 int nevents, int width)
 {
     SysBusDevice *busdev;
     DeviceState *dev;
@@ -191,6 +191,7 @@ static void pl330_create(uint32_t base, qemu_irq irq, int nreq, int nevents,
     for (i = 0; i < nevents; i++) {
         sysbus_connect_irq(busdev, i + 1, irq); /* event irq lines */
     }
+    return dev;
 }
 
 static void exynos4210_realize(DeviceState *socdev, Error **errp)
@@ -199,7 +200,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     MemoryRegion *system_mem = get_system_memory();
     qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
     SysBusDevice *busdev;
-    DeviceState *dev;
+    DeviceState *dev, *uart[4], *pl330[3];
     int i, n;
 
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
@@ -385,19 +386,19 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 
 
     /*** UARTs ***/
-    exynos4210_uart_create(EXYNOS4210_UART0_BASE_ADDR,
+    uart[0] = exynos4210_uart_create(EXYNOS4210_UART0_BASE_ADDR,
                            EXYNOS4210_UART0_FIFO_SIZE, 0, serial_hd(0),
                   s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_GRP, 0)]);
 
-    exynos4210_uart_create(EXYNOS4210_UART1_BASE_ADDR,
+    uart[1] = exynos4210_uart_create(EXYNOS4210_UART1_BASE_ADDR,
                            EXYNOS4210_UART1_FIFO_SIZE, 1, serial_hd(1),
                   s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_GRP, 1)]);
 
-    exynos4210_uart_create(EXYNOS4210_UART2_BASE_ADDR,
+    uart[2] = exynos4210_uart_create(EXYNOS4210_UART2_BASE_ADDR,
                            EXYNOS4210_UART2_FIFO_SIZE, 2, serial_hd(2),
                   s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_GRP, 2)]);
 
-    exynos4210_uart_create(EXYNOS4210_UART3_BASE_ADDR,
+    uart[3] = exynos4210_uart_create(EXYNOS4210_UART3_BASE_ADDR,
                            EXYNOS4210_UART3_FIFO_SIZE, 3, serial_hd(3),
                   s->irq_table[exynos4210_get_irq(EXYNOS4210_UART_INT_GRP, 3)]);
 
@@ -445,12 +446,24 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
             s->irq_table[exynos4210_get_irq(28, 3)]);
 
     /*** DMA controllers ***/
-    pl330_create(EXYNOS4210_PL330_BASE0_ADDR,
-                 s->irq_table[exynos4210_get_irq(21, 0)], 32, 32, 32);
-    pl330_create(EXYNOS4210_PL330_BASE1_ADDR,
-                 s->irq_table[exynos4210_get_irq(21, 1)], 32, 32, 32);
-    pl330_create(EXYNOS4210_PL330_BASE2_ADDR,
-                 s->irq_table[exynos4210_get_irq(20, 1)], 1, 31, 64);
+    pl330[0] = pl330_create(EXYNOS4210_PL330_BASE0_ADDR,
+                            s->irq_table[exynos4210_get_irq(21, 0)],
+                            32, 32, 32);
+    pl330[1] = pl330_create(EXYNOS4210_PL330_BASE1_ADDR,
+                            s->irq_table[exynos4210_get_irq(21, 1)],
+                            32, 32, 32);
+    pl330[2] = pl330_create(EXYNOS4210_PL330_BASE2_ADDR,
+                            s->irq_table[exynos4210_get_irq(20, 1)],
+                            1, 31, 64);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(uart[0]), 1,
+                       qdev_get_gpio_in(pl330[0], 15));
+    sysbus_connect_irq(SYS_BUS_DEVICE(uart[1]), 1,
+                       qdev_get_gpio_in(pl330[1], 15));
+    sysbus_connect_irq(SYS_BUS_DEVICE(uart[2]), 1,
+                       qdev_get_gpio_in(pl330[0], 17));
+    sysbus_connect_irq(SYS_BUS_DEVICE(uart[3]), 1,
+                       qdev_get_gpio_in(pl330[1], 17));
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
-- 
2.17.1

