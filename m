Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1174406lff;
        Fri, 10 Jan 2020 12:40:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxkXFrhV6mx3nlhK4flrCfo3sQEEeq21AMFNyOWMcuZmSgiJq9Ab3if9nyL+NVyJtdA9D22
X-Received: by 2002:ad4:4354:: with SMTP id q20mr503505qvs.103.1578688811160;
        Fri, 10 Jan 2020 12:40:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578688811; cv=none;
        d=google.com; s=arc-20160816;
        b=uQ5TPBHdcP2pqJZl5yQ4qm2MTz4P8B+9pKauRwZCyFg1/5jz4MJy9zkZFAgRnACD19
         uhfEL9VUi/9MguKk93eUhHe+/FkxxkIeffkmLVJIXy2pDFrTN9DLdBA/xo3tdQbeXo0k
         FdAuaGP0e46UlVWuieAir9g2l/QrYl5JKw1fDBY6z2gSR9lbKF8+WXVcHUU75UyIqQBP
         lJiv0ig8px7GWPl/aOZYKNbo47v28586rFQimOsPwXcupaB9+w+90W0NY8lEyLCf05IL
         bsAf79ECD7NJDbODmrqvXJSkCkeDcU6/2Z3IevRwdbRjBRBBtpJ9RAZ8DbH9zuFSRKhD
         dVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=TOSNnijAQMtdjCsblYsegVxJcxGmgJnr/faVUnc8a1A=;
        b=xj/C4wis9H/uCmmhJGF7VYGtobXojym3M3yrNet1SkcxA3UpaXAzVMpODKHMIR7THm
         L0tXxn0tNI2Oz1nzEHjtgYXmyVawPbSHmin1xQfW190rA5SJibBAGfSjK76vcgPkx7mk
         N80M+jQWa8XySSwPKCT0G0KlYAjbLOmw+iR3GbLBsMyYMKm884ZQe60BguHH4zk76Wi5
         +EVKpk+is7dMJ04vC5NiYPW1erfzJwaN0PB89bHHwmXtCgLwi+VE+8AzpgC61L+/x+rh
         MQXIx7z6wg91GkqTsEHdUyatkJblvev5RYEX0IuvH4NsmDaXZyCG2WXTERL8pavmAODu
         QvCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rMroP8xm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12si1870365qvq.58.2020.01.10.12.40.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 12:40:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rMroP8xm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iq14k-0000VK-3P
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 15:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iq14Q-0000Sg-Gd
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 15:39:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iq14P-0006s1-CR
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 15:39:50 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:36187)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iq14P-0006py-6Z; Fri, 10 Jan 2020 15:39:49 -0500
Received: by mail-pg1-x542.google.com with SMTP id k3so1526931pgc.3;
 Fri, 10 Jan 2020 12:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TOSNnijAQMtdjCsblYsegVxJcxGmgJnr/faVUnc8a1A=;
 b=rMroP8xmQOYDdZIXfGna6r4cgo0YjguFLZOzo1yt4TEKGCLiCCtnSMsXWogTm+oA7X
 NEhfUVuKfJoLngpiUOPCJ8Pwmi37bSUSqanwX11AAfUhN8ytFSTSkTkBFZLXKlKvhTR/
 HOjckg2z3chOWKlYLvRPjmODIW48sYwivvYmIabWNnRlgixTXlCfK0Jc6baD/UvuTg+1
 YJ+ZhIK/IrWAFkWNdfYA/kzZMa4xmgn8kMxDAsb1OhDXhIAyVH9tdJ6HHAPP88uxfzKA
 CT3F+f3jUAniCEtGK0hgv8wbEyuVo4UOY5Dbg9c6SMGyw0B3Yp5iJoeae9VrfLnDBOh2
 LBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=TOSNnijAQMtdjCsblYsegVxJcxGmgJnr/faVUnc8a1A=;
 b=bPus9H/toerYr71bXOW/ZQmF9Twn2H6FOpn2t1OaSH14ecQNBrUAQZ4umGTjagRy3D
 VCDKHjtK0tWy1PCtGPC7HMOaxCIxvBbs/DR9ic9WXi+7z4xE9fvvzrOfHKuc/UZmrPpj
 ydsx5ZRQ4UsBSxNa+druaVX8XJcU3w8XoqGXL8w7se0V2Mlz1blKsLEjP08tSBPez+Pi
 Z7raIp9pwT48PQNXlbUC4MfuBpheL4soDg4kQ9paiQ0olMKK75c6FQtNDe5TFXIEaERR
 uCpHepodR3JCCRtfgR70H+Q0AaWlyN5jJz5ucq+knwizyxkq8tc4UMmxqJA0SFE8nZmS
 F7mg==
X-Gm-Message-State: APjAAAWjC9a3q5pqcf0PrmR+qR0NnyOI0wd9SanT57bMD+ZzxoSOfYd+
 9XIx0ImnoP5JX5fOos0Kqd0=
X-Received: by 2002:a63:358a:: with SMTP id c132mr6712499pga.286.1578688788334; 
 Fri, 10 Jan 2020 12:39:48 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id s7sm3960148pjk.22.2020.01.10.12.39.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Jan 2020 12:39:47 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>
Subject: [PATCH 2/6] hw/arm/exynos4210: Fix DMA initialization
Date: Fri, 10 Jan 2020 12:39:38 -0800
Message-Id: <20200110203942.5745-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110203942.5745-1-linux@roeck-us.net>
References: <20200110203942.5745-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-TUID: DEnJLUsKwo97

First parameter to exynos4210_get_irq() is not the SPI port number,
but the interrupt group number. Interrupt groups are 20 for mdma
and 21 for pdma. Interrupts are not inverted. Controllers support 32
events (pdma) or 31 events (mdma). Events must all be routed to a single
interrupt line. Set other parameters as documented in Exynos4210 datasheet,
section 8 (DMA controller).

Fixes: 59520dc65e ("hw/arm/exynos4210: Add DMA support for the Exynos4210")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/exynos4210.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 77fbe1baab..c7b5c587b1 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -166,17 +166,31 @@ static uint64_t exynos4210_calc_affinity(int cpu)
     return (0x9 << ARM_AFF1_SHIFT) | cpu;
 }
 
-static void pl330_create(uint32_t base, qemu_irq irq, int nreq)
+static void pl330_create(uint32_t base, qemu_irq irq, int nreq, int nevents,
+                         int width)
 {
     SysBusDevice *busdev;
     DeviceState *dev;
+    int i;
 
     dev = qdev_create(NULL, "pl330");
+    qdev_prop_set_uint8(dev, "num_events", nevents);
+    qdev_prop_set_uint8(dev, "num_chnls",  8);
     qdev_prop_set_uint8(dev, "num_periph_req",  nreq);
+
+    qdev_prop_set_uint8(dev, "wr_cap", 4);
+    qdev_prop_set_uint8(dev, "wr_q_dep", 8);
+    qdev_prop_set_uint8(dev, "rd_cap", 4);
+    qdev_prop_set_uint8(dev, "rd_q_dep", 8);
+    qdev_prop_set_uint8(dev, "data_width", width);
+    qdev_prop_set_uint16(dev, "data_buffer_dep", width);
     qdev_init_nofail(dev);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(busdev, 0, base);
-    sysbus_connect_irq(busdev, 0, irq);
+    sysbus_connect_irq(busdev, 0, irq);         /* abort irq line */
+    for (i = 0; i < nevents; i++) {
+        sysbus_connect_irq(busdev, i + 1, irq); /* event irq lines */
+    }
 }
 
 static void exynos4210_realize(DeviceState *socdev, Error **errp)
@@ -432,11 +446,11 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 
     /*** DMA controllers ***/
     pl330_create(EXYNOS4210_PL330_BASE0_ADDR,
-                 qemu_irq_invert(s->irq_table[exynos4210_get_irq(35, 1)]), 32);
+                 s->irq_table[exynos4210_get_irq(21, 0)], 32, 32, 32);
     pl330_create(EXYNOS4210_PL330_BASE1_ADDR,
-                 qemu_irq_invert(s->irq_table[exynos4210_get_irq(36, 1)]), 32);
+                 s->irq_table[exynos4210_get_irq(21, 1)], 32, 32, 32);
     pl330_create(EXYNOS4210_PL330_BASE2_ADDR,
-                 qemu_irq_invert(s->irq_table[exynos4210_get_irq(34, 1)]), 1);
+                 s->irq_table[exynos4210_get_irq(20, 1)], 1, 31, 64);
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
-- 
2.17.1

