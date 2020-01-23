Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp239149lfp;
        Wed, 22 Jan 2020 21:28:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqwl+jZh7oYCaGhD4J7Ekyh3FfOlqsjKVtQMbFYDmWi4YHCUQLoBuEU+lNGwcOFmSRhLUPqx
X-Received: by 2002:a17:906:958e:: with SMTP id r14mr5515985ejx.228.1579757326004;
        Wed, 22 Jan 2020 21:28:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579757326; cv=none;
        d=google.com; s=arc-20160816;
        b=TpP0naOHduWUzxXybYoF0A3xRUwKrFJs+YjBOYMx/45hgfRvFCT/KXarzZq1LAgQgW
         XRwdNEfbbUrELh+o7BhyGanhbpIPr5bLMHkRHny1+NraaNkkHv9HKBhNMOfiEub+G7+q
         PjEYs80xYbxYymxYFxFgiqkK50TcQhWY0BQtLFWJG3LGkdjuMjhM6h7J4/n3D0Wg8QZ/
         PKjNHywo5btV9+nsvQC8DyX8/aafrh+PcEj495dD4Qp6TpzJAKN7DS9bpNVPravhHGKg
         sUpcExgjvMuwaNHN1gepPoOKapITM3/wbYtYP/AIx+MRpEy+TvEOfHomXxsTKZwL8Vxx
         5hLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Oy0EqnYWKgS4fwlYZEHmZQjkUTPPZJZv4+tAwcK76b8=;
        b=k0BpnN3uQpin4Dn93sQ2tlQe/xd2cPtysWueyQc3h1NQXtr30/fN0drzaKLMrszo0C
         PSK2Tik1ASADRZBPAai22Czi1LiOYmySuCOufQIWqlM1VOV1DB+Uepv67OpwVE+H3WpO
         DJyT7KM2yQaDIOmQYc7S+lhP/tITu2sMHAHkg7vBjEc86+apfOYxfDfCD8juXExvAtbx
         twcbNe+EtQE4Y4mhIz/jygXb414fJv8O/NM90///yTMmvP7KwGjlVfGodWfzYL14a7Ky
         RECJ7Hxp6pqGRMLOXCLTa1R0wgVpSs+d9bqr8qOHF8+xMCPk2096zTxUdSdSUZ+D7ddA
         oEgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eaIE3MtH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si288600eju.472.2020.01.22.21.28.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jan 2020 21:28:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eaIE3MtH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iuV2q-0008Rv-K9
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 00:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iuV0F-0004rn-N4
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 00:26:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iuV0D-0001qk-M3
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 00:26:03 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:35346)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iuV0B-0001pg-Re; Thu, 23 Jan 2020 00:26:00 -0500
Received: by mail-pj1-x1044.google.com with SMTP id s7so710941pjc.0;
 Wed, 22 Jan 2020 21:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Oy0EqnYWKgS4fwlYZEHmZQjkUTPPZJZv4+tAwcK76b8=;
 b=eaIE3MtHrz3tQbQ7YvL14KQVzwyyOAQ6GP7t5Das0HRUlNzHLp/BqcbVcY2L4mRNUq
 iKpaHk8Q0R64cE8jIGsIbwTZ1bOTSc7XUgPjacX98rcyRiHA+se2/1LfQvbyJPJnKZ9e
 ORWbbutA44kLF72LntbjbAWzwcD3vGORYVkGagr3ETLjlwtrenb776G0CgFqaw55T2qW
 Kn/9gPKSIjFC/1kqYgt7XNA6SojjvFilB2UGY4K/pmW6vVVF2sk9AxzdLwNoXraXlPAx
 C6YeHHuJxhemeg7a5pkAIckmbrlZZukEO7TdrxUtnKPkY7tOYETibshQyrsqJNbMyPq3
 NYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Oy0EqnYWKgS4fwlYZEHmZQjkUTPPZJZv4+tAwcK76b8=;
 b=sYL7kKPJozYpGeibbYCi5tdufMzageoAd04zi74Ct7g7H7gctYLjF1A6uJFInauhJC
 RByDrS8uNQp7bUvgX6z25IHWdRU2VZshKRrmAItPpjkUebavhaPRNW+AOv0gCU/iZX+/
 W/I3Irpw3yt2T5QrjWTqXIiqhzF68/WBr9Pe6pgXl2vba40RCaMrwkwUHGCaGLSawBBa
 cXtZKb+Wdryn4/24IpESOyU5mKgJX9K4qr17ZYakqvyERUmArONFkiFTnWwSc3Ep4/NK
 hlD4ZxB1xnOIk8Fw8h4GLzriHK7jhSF9cIQQNBlvMea3Ms83+ZvwH24jD/yij8bE337r
 mbdw==
X-Gm-Message-State: APjAAAV82zAH42lov1qDnZ16dAUDVsLbGfSAu9B/BVl0ekuQMAEPQkEI
 spOpsbzFFBei9I/PWiJk4ld2Qq+d
X-Received: by 2002:a17:90b:8c6:: with SMTP id
 ds6mr2383792pjb.111.1579757158969; 
 Wed, 22 Jan 2020 21:25:58 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id z130sm919829pgz.6.2020.01.22.21.25.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Jan 2020 21:25:58 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 8/8] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
Date: Wed, 22 Jan 2020 21:25:40 -0800
Message-Id: <20200123052540.6132-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123052540.6132-1-linux@roeck-us.net>
References: <20200123052540.6132-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yFzMrNfToJfW

The Exynos4210 serial driver uses an interrupt line to signal if receive
data is available. Connect that interrupt with the DMA controller's
'peripheral busy' gpio pin to stop the DMA if there is no more receive
data available. Without this patch, receive DMA runs wild and fills the
entire receive DMA buffer with invalid data.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Added Reviewed-by: tag
    Context changes due to increase in number of interrupt lines

v2: Context changes; improved description
    This patch has an outstanding review comment, suggesting that
    uart and pl330 device states should be kept in Exynos4210State.
    I did not address this comment for a number of reasons.
    It looks like the problem is hypothetical, the problem may
    apply to all devices created in exynos4210_realize(), and I am
    not sure I understand what would need to be done to fix
    the problem for good (ie for all devices created in the same
    function which have the same problem). Overall, I think that
    handling this situation would be better left for a separate patch.

 hw/arm/exynos4210.c | 42 +++++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 7701a3fa8b..59a27bdd68 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -166,8 +166,8 @@ static uint64_t exynos4210_calc_affinity(int cpu)
     return (0x9 << ARM_AFF1_SHIFT) | cpu;
 }
 
-static void pl330_create(uint32_t base, qemu_or_irq *orgate, qemu_irq irq,
-                         int nreq, int nevents, int width)
+static DeviceState *pl330_create(uint32_t base, qemu_or_irq *orgate,
+                                 qemu_irq irq, int nreq, int nevents, int width)
 {
     SysBusDevice *busdev;
     DeviceState *dev;
@@ -196,6 +196,7 @@ static void pl330_create(uint32_t base, qemu_or_irq *orgate, qemu_irq irq,
         sysbus_connect_irq(busdev, i, qdev_get_gpio_in(DEVICE(orgate), i));
     }
     qdev_connect_gpio_out(DEVICE(orgate), 0, irq);
+    return dev;
 }
 
 static void exynos4210_realize(DeviceState *socdev, Error **errp)
@@ -204,7 +205,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     MemoryRegion *system_mem = get_system_memory();
     qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
     SysBusDevice *busdev;
-    DeviceState *dev;
+    DeviceState *dev, *uart[4], *pl330[3];
     int i, n;
 
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
@@ -390,19 +391,19 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 
 
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
 
@@ -450,12 +451,27 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
             s->irq_table[exynos4210_get_irq(28, 3)]);
 
     /*** DMA controllers ***/
-    pl330_create(EXYNOS4210_PL330_BASE0_ADDR, &s->pl330_irq_orgate[0],
-                 s->irq_table[exynos4210_get_irq(21, 0)], 32, 32, 32);
-    pl330_create(EXYNOS4210_PL330_BASE1_ADDR, &s->pl330_irq_orgate[1],
-                 s->irq_table[exynos4210_get_irq(21, 1)], 32, 32, 32);
-    pl330_create(EXYNOS4210_PL330_BASE2_ADDR, &s->pl330_irq_orgate[2],
-                 s->irq_table[exynos4210_get_irq(20, 1)], 1, 31, 64);
+    pl330[0] = pl330_create(EXYNOS4210_PL330_BASE0_ADDR,
+                            &s->pl330_irq_orgate[0],
+                            s->irq_table[exynos4210_get_irq(21, 0)],
+                            32, 32, 32);
+    pl330[1] = pl330_create(EXYNOS4210_PL330_BASE1_ADDR,
+                            &s->pl330_irq_orgate[1],
+                            s->irq_table[exynos4210_get_irq(21, 1)],
+                            32, 32, 32);
+    pl330[2] = pl330_create(EXYNOS4210_PL330_BASE2_ADDR,
+                            &s->pl330_irq_orgate[2],
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
 
 static void exynos4210_init(Object *obj)
-- 
2.17.1

