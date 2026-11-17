Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C364606A884
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Nov 2026 19:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ca2PjarP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xTOus-0007Tf-Jh; Tue, 17 Nov 2026 14:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agarwaljayesh03@gmail.com>)
 id 1xTOuq-0007T3-TZ
 for qemu-arm@nongnu.org; Tue, 17 Nov 2026 14:32:28 -0500
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <agarwaljayesh03@gmail.com>)
 id 1xTOun-0002QO-Sj
 for qemu-arm@nongnu.org; Tue, 17 Nov 2026 14:32:27 -0500
Received: by mail-dy1-x132e.google.com with SMTP id
 5a478bee46e88-380c28f9e35so1466175eec.1
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2026 11:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794943944; x=1795548744; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HmYnR1KqHS4CMsKPXreIVS5wq+3xL0tziKeOsDFzLQs=;
 b=Ca2PjarPTddhWO8yec2GoDIUl3jmKEKE1RdNz9s/DEBKxkBBqAYUrFQHRbyp5RmNzo
 Sxkg9ICI3yBogQv06mVOq3hJvtAwxMF4eMbJz4UNAG+0IAAaIVUURL+uKIFxWJct1sYx
 ZVmJcs9kM5SgLfMVewfaGpiPaH+v2X9a0wRjyjVSfFQMR8xY2XN2gy0Q+PKI+hS0lUkP
 Owdo/uTBMCw6tS0ZgJ18w8fI7AH8mp5xv3/GBS7feuYh4gq6+uZWU30D7K4fbFghSk7I
 GiSpwKIR/hsnv0kX8fqgXe4YBzM0GFsQMUCr7dfqcRuKYUzhEHhGX6cY/f8CCoEkAOFP
 EYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794943944; x=1795548744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HmYnR1KqHS4CMsKPXreIVS5wq+3xL0tziKeOsDFzLQs=;
 b=Cn6gjEtqvHOA35xIQNDj30vKdPwmLzormowtx734X3a9gZjMS2OpchCkVPTf5P9LxI
 xwlR2yE85q6ELlCKKfiHBiY8vRsKfqfcqjjMCQprF7rddHGFKeKukalOQT018KVIREXV
 HNaI7ljHEyvVeUrRpNEtKWumKtgKCuDFOo95VUO8Mn+6IGJA9Jmne65JClBBU9dsh/Z0
 ry3lZ+EHWva0SHs0/sH5oU4DqfVlbsRsOrsQsY1ZkNStE3Qzyr/FJmb0m7CWcQXKhi3g
 AGC8YRDex0DIejsOJOiTFxpVYYjlWrog2Lgx8ynIUNk+AoA5CjoF/mVzALmexlxYWLdm
 lXhw==
X-Forwarded-Encrypted: i=1;
 AL+hErHxXoLzOz6fDfPTEToHkqC77Cu4DiAM82gp55gIsyTocfSXpsRUjh2FM54NeyH9ZzaO4crQyo/xHw==@nongnu.org
X-Gm-Message-State: APuU4Z/EsgCVDLqKs7LjmlUs6XKukfE/9jirBh/BIbRlHqHKRAeCQIcQ
 eSBdA2DAHaZ571WNkCM4tFihjc1L5hJlfN1dpLePgMUjK+d8d/RSbuqg
X-Gm-Gg: AYBFou0gFtvLhh81JsFQ4HQWQ3B6+dH6etB4pRGcD94ljXWUWNM+bAr88ei8Wx0GpFJ
 iLL1Dz6YIaPtibXQS1gEvOLclAgiiaMMgArVMBV56Y/9tVjSb5vDCSEBFM4mmBPNPAkOfw0A+/C
 IWGxZ2zXprdsfVirXU/S1qHKwei99gAYeaM0IXp000W4N89XGyyqe6TgsJzg4XT6U1NpEUPpRqh
 bb7l7ppzHp6A/Rhfm5RzIiQOggWrUmqi4AOGiUxQ4tjZtov9Sn5+RwoaEgiuU48wbfPEgngP84m
 2pNqFp4uflOlvN6gJOAs/viEkdlQ1wUqVUytEimHWXu7HeaxHwiYvdVxIEMWzB1bSUKkR8iHXG8
 1F2W8CLc3jxC1B5wZejoPX9Qut1W2mTQBSfnM/G/VkUUvojuNdYlnqZyMPmy/kNMOM9FZd6fuyq
 cv23F5AYIE3k7PWj74C2McSNfjdKFtAw5N+0XUdkkX7XFtmUIXorh+5/7Wfc7OsDcAKAVf89lQS
 PJ5wNXH/mYw/GEGL71+o/pLkhfNV3vl00XE1XJHBHcymAnlFpDv17XiRg+xlFcOh2R6K1MvZ1Ge
 v0LSvuNaj+TsFwmiVTh2Cgl3RGr0uQ/8lmRWRoR2TvQCBdCWg24h3vD8twREAEyu5efTyCKm4jo
 sCz1+niTrbw==
X-Received: by 2002:a05:701b:4586:20b0:1ab:cbd0:1c96 with SMTP id
 a92af1059eb24-1b53a429876mr2719513c88.4.1794943943468; 
 Tue, 17 Nov 2026 11:32:23 -0800 (PST)
Received: from LinuxMachine.bits-hyderabad.ac.in ([14.98.244.195])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-382a45274aesm159132eec.2.2026.11.17.11.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 11:32:22 -0800 (PST)
From: Jayesh Agarwal <agarwaljayesh03@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org,
 s23adhik@csclub.uwaterloo.ca, Jayesh Agarwal <agarwaljayesh03@gmail.com>
Subject: [PATCH] hw/arm/bcm2838: Route system timer interrupts to GIC
Date: Wed, 18 Nov 2026 01:02:05 +0530
Message-ID: <20261117193205.8236-1-agarwaljayesh03@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132e;
 envelope-from=agarwaljayesh03@gmail.com; helo=mail-dy1-x132e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The system timer interrupts are only routed to the legacy interrupt
controller and not to the GIC, so a guest using the GIC (software that
relies on the system timer interrupts through the GIC, such as bare
metal programs or hobby kernels) never receives them.

A qemu_irq connection follows one output, one input. So also wiring the
timer to the GIC would replace its connection to the legacy controller.

Add a splitter per system-timer interrupt line so that each interrupt
reaches both the legacy controller (output 0 of the splitters) and the
GIC (output 1 of the splitters). The timer channel n goes to GIC SPI
64+n, so channels 0-3 go to SPIs 64-67.

Testing:
The raspi4b machine started in the qtest mode:
	qemu-system-aarch64 -M raspi4b -display none -accel qtest -qtest stdio

Ran following commands:
	irq_intercept_in /machine/soc/peripherals
	readl 0xfe003004
	writel 0xfe00300c 1000
	writel 0xfe003010 2000
	writel 0xfe003014 3000
	writel 0xfe003018 4000
	clock_step 5000000
	readl 0xfe003000

Before the fix:
    clock_step 5000000
    OK 5000000
    readl 0xfe003000
    OK 0x000000000000000f
The alarm fires correctly (status flag outputs 0xf), but no IRQ raise
64-67 reaches the GIC.

After the fix:
    clock_step 5000000
    IRQ raise 64
    IRQ raise 65
    IRQ raise 66
    IRQ raise 67
    OK 5000000
    readl 0xfe003000
    OK 0x000000000000000f
The alarm fires, and all the four channels reached GIC lines 64-67.

Reported-by: Sourojeet Adhikari <s23adhik@csclub.uwaterloo.ca>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jayesh Agarwal <agarwaljayesh03@gmail.com>
---
This was picked up from Sourojeet's earlier patch, here is the link:
https://lore.kernel.org/qemu-devel/3cca4eb3-09d1-4467-81fd-27a5bfe19a3e@csclub.uwaterloo.ca/

 hw/arm/bcm2835_peripherals.c         | 33 ++++++++++++++++++----------
 hw/arm/bcm2838.c                     |  7 ++++++
 include/hw/arm/bcm2835_peripherals.h |  1 +
 include/hw/arm/bcm2838_peripherals.h |  4 ++++
 4 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 558c180df9..f619beba33 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -95,6 +95,14 @@ static void raspi_peripherals_base_init(Object *obj)
     /* SYS Timer */
     object_initialize_child(obj, "systimer", &s->systmr,
                             TYPE_BCM2835_SYSTIMER);
+    /*
+     * One splitter per system-timer interrupt line so that each interrupt
+     * reaches both the legacy controller and the GIC.
+     */
+    for (int n = 0; n < BCM2835_SYSTIMER_COUNT; n++) {
+        object_initialize_child(obj, "systmr-irq-splitter[*]",
+                                &s->systmr_irq_splitter[n], TYPE_SPLIT_IRQ);
+    }
 
     /* UART0 */
     object_initialize_child(obj, "uart0", &s->uart0, TYPE_PL011);
@@ -302,18 +310,19 @@ void bcm_soc_peripherals_common_realize(DeviceState *dev, Error **errp)
     }
     memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systmr), 0));
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 0,
-        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
-                               INTERRUPT_TIMER0));
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 1,
-        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
-                               INTERRUPT_TIMER1));
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 2,
-        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
-                               INTERRUPT_TIMER2));
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 3,
-        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
-                               INTERRUPT_TIMER3));
+    for (n = 0; n < BCM2835_SYSTIMER_COUNT; n++) {
+        qdev_prop_set_uint32(DEVICE(&s->systmr_irq_splitter[n]),
+                "num-lines", 2);
+        if (!qdev_realize(DEVICE(&s->systmr_irq_splitter[n]), NULL, errp)) {
+            return;
+        }
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), n,
+                qdev_get_gpio_in(DEVICE(&s->systmr_irq_splitter[n]), 0));
+        qdev_connect_gpio_out(DEVICE(&s->systmr_irq_splitter[n]), 0,
+                qdev_get_gpio_in_named(DEVICE(&s->ic),
+                    BCM2835_IC_GPU_IRQ,
+                    INTERRUPT_TIMER0 + n));
+    }
 
     /* UART0 */
     qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
index 650b1fe8f4..d151c50f1e 100644
--- a/hw/arm/bcm2838.c
+++ b/hw/arm/bcm2838.c
@@ -188,6 +188,13 @@ static void bcm2838_realize(DeviceState *dev, Error **errp)
     qdev_connect_gpio_out(DEVICE(&ps_base->orgated_i2c_irq_splitter), 1,
                           qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_I2C));
 
+    /* Connect the system timer interrupts to the interrupt controller */
+    for (int n = 0; n < BCM2835_SYSTIMER_COUNT; n++) {
+        int int_n = GIC_SPI_INTERRUPT_SYS_TIMER0 + n;
+        qdev_connect_gpio_out(DEVICE(&ps_base->systmr_irq_splitter[n]), 1,
+                              qdev_get_gpio_in(gicdev, int_n));
+    }
+
     /* Connect VC mailbox to the interrupt controller */
     sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->mboxes), 0,
                        qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_MBOX));
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 4f356f4643..bd41e0de92 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -54,6 +54,7 @@ struct BCMSocPeripheralBaseState {
     qemu_irq irq, fiq;
 
     BCM2835SystemTimerState systmr;
+    SplitIRQ systmr_irq_splitter[BCM2835_SYSTIMER_COUNT];
     BCM2835MphiState mphi;
     UnimplementedDeviceState txp;
     UnimplementedDeviceState armtmr;
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 60bfacdce4..af2d3b2030 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -20,6 +20,10 @@
 /* SPI */
 #define GIC_SPI_INTERRUPT_MBOX         33
 #define GIC_SPI_INTERRUPT_MPHI         40
+#define GIC_SPI_INTERRUPT_SYS_TIMER0   64
+#define GIC_SPI_INTERRUPT_SYS_TIMER1   65
+#define GIC_SPI_INTERRUPT_SYS_TIMER2   66
+#define GIC_SPI_INTERRUPT_SYS_TIMER3   67
 #define GIC_SPI_INTERRUPT_DWC2         73
 #define GIC_SPI_INTERRUPT_DMA_0        80
 #define GIC_SPI_INTERRUPT_DMA_6        86
-- 
2.43.0


