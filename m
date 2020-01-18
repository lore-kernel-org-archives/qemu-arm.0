Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp622131lff;
        Sat, 18 Jan 2020 08:45:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOnfnjIjrke9TpmW/IXjx4PDt4vyX8SP3YrGJ0DfL91X+SsOaKP57MckbhSW3/fK7xS2Nm
X-Received: by 2002:a05:6402:12d2:: with SMTP id k18mr9870904edx.253.1579365927410;
        Sat, 18 Jan 2020 08:45:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579365927; cv=none;
        d=google.com; s=arc-20160816;
        b=LxY5vLf0Ip+ziCI/UkLt0vQsY0/+HH2cPOrYdlTKBOAnOoMRJ358MXa+kk8ArTeJl8
         agfEpGySiSas0acdzOcdtMPspmTlKXwIPtr+PVvVg7QxUFnGTUsmnIAFOQujNUCfs3PU
         hcjsUB2zMFi8zWPqGYpYgn4MJcr9+zK5+JxnKgOzmvlzQH50q0d0EthE0jXqfMR+yCkf
         qDKJrJwng98uIYBSDj2+epUyLBIG8eP+Oosv3blibc0sNIvia7A6oKFLUXr8pF3XwyhB
         JkGNmo6H012Z9exGkB8pdsaQl0IDAZF0JPeLXRA+qvEzGGh39/nCCznLGJy+p7Kjn1e/
         D8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=c40RYyx9s3sT53ibofaJCji2c/+rsUXzNeVTcJNsgco=;
        b=UMY5DlklfQUR55VOoGHMoc14UOH88gqf7RD7mGUj6iB/pW1W2QdXI+XgN/Hbmhg+CB
         tmu0uFd06YMOV/A+Q9ucdVlXXf4oPCcLFpR540sZUQ1UBv4wewtiQ98f0EXhYhriRQ4r
         yd+F4ICpvpHdFEGTPL9dVyrnRnG/NLJXvcBb/TQgdSufkYs3c8+qy6W6wQMBdRJ5GmYd
         8S14CFJKvLYwzFeIxA43v+JmB3m9FAl6yLobkRJZePmlPACueD+auBhTbYlqQq8ETpS4
         m2GGtFgMyN7yMAYbnp+ohw6KZXmxsU++TRteLS2x97KQbY5WwEyMmjXDP/40I7Iy8IZf
         sMFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EeHUOeT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si19416553edc.546.2020.01.18.08.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 08:45:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EeHUOeT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isrDx-0007rB-Hk
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 11:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1isrBP-0004CQ-6k
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 11:42:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1isrBN-0002Eh-Q8
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 11:42:47 -0500
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:42604)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1isrBN-0002EM-Lv; Sat, 18 Jan 2020 11:42:45 -0500
Received: by mail-yb1-xb41.google.com with SMTP id c8so7090726ybk.9;
 Sat, 18 Jan 2020 08:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c40RYyx9s3sT53ibofaJCji2c/+rsUXzNeVTcJNsgco=;
 b=EeHUOeT2ynvb0l0grMvGxJrogdt9ELUZXqy2G53G0bdUVaA5MnPZUddKpKkETVEOiA
 dp27F0lP9yffDhKHJ2PGYN62NgcjWau/QGhQ85l/car79urFv6Da18CjmnMwKusgFrlh
 wojq6hHOm3cIpkHXRrYXtgYQb8Vt15Opjbsby0qZsyFNS6ToIaLZrSvm2gd0xR6LTNj3
 2HFsaO+YmSYBOdnYOhpzHdczsKAhh3L6+1vNY//o224EC1o4OxTdedpQy4/78PPGGXns
 RgKcL2WFmpNWxSGh6UaP7vk3Hjnpq2KW3cvbRj/9b2LSLBLXWFrWFoRyCQrVL57J95lI
 tADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=c40RYyx9s3sT53ibofaJCji2c/+rsUXzNeVTcJNsgco=;
 b=THLvVfFDvJ8hdOpKBaBpbKAoqojtaErBMCE47l8X0SfDWR0M0XVHiy2Yk5adeZD3Ic
 IZjvEx3YhGyjXnEBQQ2Xd1WFfJjWmXWuDKdJ0iNeOhR49kUbZ9gSiGmDUMGhsPrLNPSY
 NKdQByZqWXZHTmJ8E2qz42qyaBcZv8UNte9jV6zCv7POqAsNTGR5g7xIq/gM5MHSy75a
 Pcks6L3l3k5Uc1VjxoRv9jzSeb1WFMxe6N3EVWjC8et0Kk6hQUCNw5gll24RoEdZAOz8
 Cd+58737NabFfl45i3Fq0kQyaCWXf6OlX/taZr274Hb2bGMThLwVFAXhuoNgGgiBNJ9K
 +tQg==
X-Gm-Message-State: APjAAAW8lBI+GYjsA+WB1ubgVlYJpKPZAj1ztHm7COzVBrD8hJO9vCuj
 Kcs4b+XoTqOnGehSppnYK18=
X-Received: by 2002:a25:d297:: with SMTP id j145mr32024675ybg.44.1579365765171; 
 Sat, 18 Jan 2020 08:42:45 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id n8sm13263285ywh.75.2020.01.18.08.42.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 Jan 2020 08:42:44 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 7/7] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
Date: Sat, 18 Jan 2020 08:42:29 -0800
Message-Id: <20200118164229.22539-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200118164229.22539-1-linux@roeck-us.net>
References: <20200118164229.22539-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RWjXiGAzkNtL

The Exynos4210 serial driver uses an interrupt line to signal if receive
data is available. Connect that interrupt with the DMA controller's
'peripheral busy' gpio pin to stop the DMA if there is no more receive
data available. Without this patch, receive DMA runs wild and fills the
entire receive DMA buffer with invalid data. 

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
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
index 76c0e2a3e8..6b050bb5c9 100644
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
-                 s->irq_table[exynos4210_get_irq(21, 0)], 32, 30, 32);
-    pl330_create(EXYNOS4210_PL330_BASE1_ADDR, &s->pl330_irq_orgate[1],
-                 s->irq_table[exynos4210_get_irq(21, 1)], 32, 30, 32);
-    pl330_create(EXYNOS4210_PL330_BASE2_ADDR, &s->pl330_irq_orgate[2],
-                 s->irq_table[exynos4210_get_irq(20, 1)], 1, 30, 64);
+    pl330[0] = pl330_create(EXYNOS4210_PL330_BASE0_ADDR,
+                            &s->pl330_irq_orgate[0],
+                            s->irq_table[exynos4210_get_irq(21, 0)],
+                            32, 30, 32);
+    pl330[1] = pl330_create(EXYNOS4210_PL330_BASE1_ADDR,
+                            &s->pl330_irq_orgate[1],
+                            s->irq_table[exynos4210_get_irq(21, 1)],
+                            32, 30, 32);
+    pl330[2] = pl330_create(EXYNOS4210_PL330_BASE2_ADDR,
+                            &s->pl330_irq_orgate[2],
+                            s->irq_table[exynos4210_get_irq(20, 1)],
+                            1, 30, 64);
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

