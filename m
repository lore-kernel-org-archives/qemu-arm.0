Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp29440ejb;
        Wed, 31 May 2023 15:35:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Tg8agyTjPCQLmdNg7Nsh1OF3clAJv0i8Nkw8G+EKSskq9GUuM86t/14y6RuCAVXWTPp2G
X-Received: by 2002:a05:6214:2305:b0:5dd:5c8d:866f with SMTP id gc5-20020a056214230500b005dd5c8d866fmr16826208qvb.23.1685572502480;
        Wed, 31 May 2023 15:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685572502; cv=none;
        d=google.com; s=arc-20160816;
        b=nEbjaOYldqbJP2bBg2guT4wq/qkh7ALkI+ZwXKEOS3x8MVGvfPKRs4wqFJV7/0EsFu
         cLfxxLa9TsrHEkKexuOVMR6zAiSI360anLqdZarTuwNZS9RZxqcA/bkZFZmpz96nAiLB
         RjUbv2bGAvjRRHEYBWYsHoMjPRdQEJQ4940JPlW6ZcaIa71yyQlibDXEzFTJEvDP8Ozf
         NWyRDTgBEeg9auPOVOMDUNlAT9sF+Lh1JlZvBHgf0n3Cb879CDUZrMQxJeIb6wuWc1HU
         E72nouNsfk/9TJVf/RCQFjje3VzCSjFsD0LLzqlMr18grvASSke/5FOL967ghAdX7d4R
         VrPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LTOXUlsQg1I2uqXYz0kosQk6IYoXK5LW0X8kOF6ZClA=;
        b=LRVmivH9qppIZQ0gDtW0TdBiQN9MK0TepSD5hEmL2WdY/DL6S/kjlHfCuRyuYMDihh
         e4kUEvInuhplW0+M5Tu4ty2BCVpW8sPOF/qXv7SaTFy24csEbEzWG/aiZoW8UAH37dxP
         rS150QwBTzEnI94bL5qvQnYmL5zVmRd/HKA0/plawMUX48Vk62aWPSMLW0xGuPAasrPq
         0WqXANugIrp3qypSqMKg3Oiu+ynax+7UJK8B/h4P9uVT7ZXTQiMxiftn/j8UdKbaxABF
         ZMAmS6OO83OJA+9Zef4kWCjEwUtZpADpbPepjmY+pjHNJ2RrUda92lJmzxxOCxw6vIlL
         ZQUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iywQId/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020ad45c68000000b0062616ba5397si6554127qvh.99.2023.05.31.15.35.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 15:35:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="iywQId/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4UOk-0004h3-DX; Wed, 31 May 2023 18:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4UOe-0004bw-NX
 for qemu-arm@nongnu.org; Wed, 31 May 2023 18:34:24 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4UOc-00058d-Ox
 for qemu-arm@nongnu.org; Wed, 31 May 2023 18:34:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30c2bd52f82so152770f8f.3
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 15:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685572461; x=1688164461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LTOXUlsQg1I2uqXYz0kosQk6IYoXK5LW0X8kOF6ZClA=;
 b=iywQId/zgdVpx4dU8E0e4lromH4P+JTUbk0BQ59h6naJGrfSNCnL2bOf43uZQv5KUb
 sfiLpBWYhKvuhsbUiiwklvGZN1Y7MoAmDbzOKLN61mco/lzCQElfRrcgnHQerjVuUQI8
 UEbpWYu1F4jgzR+IPwLIpnB5M6uVSEMQpoPe76Zw7K6Msm7ktZ2LIErGo9ryptq00px5
 njvc8d0J7tkUneUZYKnDeT7l2UVxAbPxag3O32+KElUAR/9Ijm6fkiSaaLqW2Hk9rck5
 aHK/TCjYIfzw6C/L7PI3rwe+Pvm6qYsFVE6e291JK5dsIJ2QFCRAvoULTlzD3mHDuytq
 xFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685572461; x=1688164461;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LTOXUlsQg1I2uqXYz0kosQk6IYoXK5LW0X8kOF6ZClA=;
 b=ljAHFsmybvB1tgf5MfjA/ajP5e5fNCWrVSZcObsSJ04Q8QbCfc87z2iQxK5lFjYB/+
 Fs8NuMc3gwagVy0HPTxl3uI5XbYCeylfObpFQ2pkNV34fF2CMKrcdCPxQOxQ1qHqU4QL
 5N78KkMAFFnOdCKGmGHe97k0sYg+WPKuuT/gnuhtN/W2DjrVOctaoM7jaNHlajaGurHt
 DitGvc6jVckrkeEdEr2pKXKTdakmFng5p9GTaoyo76bu1npjhTy7bzHxL7U/9rGRHAoq
 PBAXFHxYnyQXXdC8xYxaqVwTOISKdcJakZAQUrvhD/zsWOlF5q6wkhbmazmVa0+TKmql
 GiPg==
X-Gm-Message-State: AC+VfDwp4+WR414d47Ll537jjrpaJyISEiNmuBM2toYIlHwOJTAlG+bj
 lw8AYWx7COgxJau8YqA2RT/NUA==
X-Received: by 2002:adf:fd8a:0:b0:306:492c:cdd8 with SMTP id
 d10-20020adffd8a000000b00306492ccdd8mr382231wrr.15.1685572461397; 
 Wed, 31 May 2023 15:34:21 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4c42000000b0030af15d7e41sm8110254wrt.4.2023.05.31.15.34.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 15:34:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/7] hw: Simplify using sysbus_init_irqs() [manual]
Date: Thu,  1 Jun 2023 00:33:41 +0200
Message-Id: <20230531223341.34827-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531223341.34827-1-philmd@linaro.org>
References: <20230531223341.34827-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EVt2wOPbj4rx

Audit the sysbus_init_irq() calls and manually convert
to sysbus_init_irqs() when a loop is involved.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/loongarch_extioi.c | 3 +--
 hw/intc/omap_intc.c        | 3 +--
 hw/pci-host/gpex.c         | 2 +-
 hw/timer/renesas_tmr.c     | 9 +++------
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
index db941de20e..c579636215 100644
--- a/hw/intc/loongarch_extioi.c
+++ b/hw/intc/loongarch_extioi.c
@@ -275,8 +275,7 @@ static void loongarch_extioi_instance_init(Object *obj)
     LoongArchExtIOI *s = LOONGARCH_EXTIOI(obj);
     int cpu, pin;
 
-    sysbus_init_irqs(SYS_BUS_DEVICE(dev), s->irq, EXTIOI_IRQS);
-
+    sysbus_init_irqs(dev, s->irq, EXTIOI_IRQS);
     qdev_init_gpio_in(DEVICE(obj), extioi_setirq, EXTIOI_IRQS);
 
     for (cpu = 0; cpu < EXTIOI_CPUS; cpu++) {
diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index 647bf324a8..f324b640e3 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -627,8 +627,7 @@ static void omap2_intc_init(Object *obj)
 
     s->level_only = 1;
     s->nbanks = 3;
-    sysbus_init_irq(sbd, &s->parent_intr[0]);
-    sysbus_init_irq(sbd, &s->parent_intr[1]);
+    sysbus_init_irqs(sbd, s->parent_intr, ARRAY_SIZE(s->parent_intr));
     qdev_init_gpio_in(dev, omap_set_intr_noedge, s->nbanks * 32);
     memory_region_init_io(&s->mmio, obj, &omap2_inth_mem_ops, s,
                           "omap2-intc", 0x1000);
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index a6752fac5e..7b46e3e36e 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -128,8 +128,8 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
         sysbus_init_mmio(sbd, &s->io_ioport);
     }
 
+    sysbus_init_irqs(sbd, s->irq, GPEX_NUM_IRQS);
     for (i = 0; i < GPEX_NUM_IRQS; i++) {
-        sysbus_init_irq(sbd, &s->irq[i]);
         s->irq_num[i] = -1;
     }
 
diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
index c15f654738..dd2929d6e7 100644
--- a/hw/timer/renesas_tmr.c
+++ b/hw/timer/renesas_tmr.c
@@ -428,17 +428,14 @@ static void rtmr_init(Object *obj)
 {
     SysBusDevice *d = SYS_BUS_DEVICE(obj);
     RTMRState *tmr = RTMR(obj);
-    int i;
 
     memory_region_init_io(&tmr->memory, OBJECT(tmr), &tmr_ops,
                           tmr, "renesas-tmr", 0x10);
     sysbus_init_mmio(d, &tmr->memory);
 
-    for (i = 0; i < ARRAY_SIZE(tmr->ovi); i++) {
-        sysbus_init_irq(d, &tmr->cmia[i]);
-        sysbus_init_irq(d, &tmr->cmib[i]);
-        sysbus_init_irq(d, &tmr->ovi[i]);
-    }
+    sysbus_init_irqs(d, tmr->cmia, ARRAY_SIZE(tmr->cmia));
+    sysbus_init_irqs(d, tmr->cmib, ARRAY_SIZE(tmr->cmib));
+    sysbus_init_irqs(d, tmr->ovi, ARRAY_SIZE(tmr->ovi));
     timer_init_ns(&tmr->timer[0], QEMU_CLOCK_VIRTUAL, timer_event0, tmr);
     timer_init_ns(&tmr->timer[1], QEMU_CLOCK_VIRTUAL, timer_event1, tmr);
 }
-- 
2.38.1

