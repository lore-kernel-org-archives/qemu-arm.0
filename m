Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F557C5B572
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Aug 2026 00:28:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ww7fQ-0002P0-Ur; Mon, 17 Aug 2026 20:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1ww7fA-0002Lw-HY
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 20:26:44 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1ww7f8-0004JE-LP
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 20:26:44 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-495c49f8eccso2421076b6e.3
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 17:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787012801; x=1787617601; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o2a6IXsiDbZ/0CBkIqTm2FceuhAWaYu7It2PAHMINzs=;
 b=QTVg1BUfSagwbT2l/Hc3ZCLpp0XHeT0xqnonV7R87bQFTUkRZgKT8Ukkk1OuVNWrCP
 eS/Wl6+V6cxh/ByeX+zElaZvwUgAqLxS3sGOnO0et+3SLSr+F33LYhcM0H5efnb1e4CP
 yRBKhmxww56WlrdsqHJnZK4eEAcBaDXo/PyGFiBJZFh+oqDtB2Yjvgxplb2C5UMPtgpV
 j77I1LULTyeYd3LRLgeR9Pr4eNZ+vYIUe/bBDfsvluKLOkUlukAOw9jcw5Z1TjOYYwUL
 WAgDDfUgJSoMzWcvMbGkeOg/k+kRgqTnHo1hdFrWCpUdtH+K8KH6pxj8C0ArimWPa8tB
 WxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787012801; x=1787617601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=o2a6IXsiDbZ/0CBkIqTm2FceuhAWaYu7It2PAHMINzs=;
 b=ax0uzREBNHKnbgo/OyrGyIHUaqlqp2e54asZoE62OYXqeqG6yLR3ix9qFv/G7w30Yq
 1xzZyzKHofitN/d7HduQRiLTxsERJmYrb3jE7YRpsiE+BSNWJP0LkCmP+lEnSkGqWiQl
 QVqAQwuaHXVuUB9K92TdJHwj6fPcqvfuqhDz6XVP3NQJZPaWMB9Y/ySTjYRJr2QCnqnN
 NbhQFvD3wiBk1Uud2WNbi0Ae7x9dhMq2ojJxDzknS0fwdMcFu7xD7HnFnZ5ZQfIMWkKv
 zJbxZHlqkzF9t/vvenmE+EVhXy5S11FsR3+lT6oxI/tR4OzuiKOKK0g+e0iXNv3cnCRx
 KPhA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoFMh4op+BI2bvuoJ2qp1JgV+ymdOCS3HmNshXB+XzOggpzDrAezb0iUJhlOmtXHqLaEmSx8NNaUw==@nongnu.org
X-Gm-Message-State: AOJu0YyqSHa/k56ksrR0xsdEJMpGZcLhn3hdzHpzqK86t+bdxKgI9p9o
 sDGBF91tn8qlENQvSohNvGmUxz70Xk15XxDQ37d+2eo9lcJ0fFgtp5L0
X-Gm-Gg: AR+sD114mHc5gBIwK6uxSDQ7WwAF1XQesXjun5SvQ4pAge3kTLriDeHrtYpEW/LPmO/
 14+Cxe/09PrakZrs8keAQxnM067hJGWKcnMXpkVCfsD01jy1Fyv5oswTRNI5L05lgdqWICWGzRT
 sdWLM77XPOPvBjV+K4+F0sD9mGErk1JJVhuZZF1qj8Z3Z+IOyDVcXcrv2grwAMYIKqOvwuusV0i
 tM5Fg+be8mv7A8XzSngP7fV0rBtMaoNLxw0gRE9eAre0Hz9S2YN5OrLTgJi0ykOex1e8nv/IQVP
 dEy3QGQWfnaaMddx+G76rFLYIHnHzanGLSmDf5rsCizJBW9tEvHwTAqJSonE6TG85juq7wkXjZ9
 Td4NlgZh1Oh9MaOPVa3NtvR1QkKN7ZG/IplUYA0PGzTaev25YmU60QvTo/NdET2g1h1AckM1tp6
 Ft2PHW/TD2LaYuzXXv1Q5721TOKKZ5Gs8XonkBqToCgrcTNyCMf9kwDAv+15r6B/I/Us+s95b3i
 GR/761Q4NTT+J3e/gbGwg==
X-Received: by 2002:a05:6808:d47:b0:4a4:c623:4c0b with SMTP id
 5614622812f47-4b2412b98eamr25701640b6e.4.1787012801384; 
 Mon, 17 Aug 2026 17:26:41 -0700 (PDT)
Received: from LAPTOP-86EU4LQA.home.local ([23.124.244.239])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4b2960dfc9bsm1715165b6e.14.2026.08.17.17.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 17:26:40 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Simon Xu <simonxhy0404@gmail.com>, Owen Giles <owen.giles@hpe.com>,
 Robert Elliott <elliott@hpe.com>
Subject: [PATCH v3 8/9] hw/misc/mps2-fpgaio.c: add GPIOALT2 register
Date: Mon, 17 Aug 2026 19:26:28 -0500
Message-ID: <20260818002629.172827-9-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818002629.172827-1-simonxhy0404@gmail.com>
References: <20260818002629.172827-1-simonxhy0404@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add GPIOALT2 register for new an555 board.
Implement register access as RW with LOG_UNIMP for writes.
Add "has-gpioalt2" property to make each board configurable.
Add gpioalt2 vmstate subsection for device state migration.

Reviewed-by: Owen Giles <owen.giles@hpe.com>
Reviewed-by: Robert Elliott <elliott@hpe.com>
Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
Message-Id: <20260805153005.9989-10-simonxhy0404@gmail.com>
---
v2 -> v3
    Move this patch to be before the add mps3-an555 patch
    Add gpioalt2 field to new vmstate subsection
        mps2_fpgaio_gpioalt2_vmstate for migration
    Add needed_gpioalt2 function for vmstate subsection
    Set fpgaio_has_gpioalt2 to false for all existing models
---
 hw/arm/mps2-tz.c              |  6 ++++++
 hw/misc/mps2-fpgaio.c         | 35 +++++++++++++++++++++++++++++++++++
 include/hw/misc/mps2-fpgaio.h |  2 ++
 3 files changed, 43 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index d6d178642b..79f53a0d09 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -122,6 +122,7 @@ struct MPS2TZMachineClass {
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
     bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
     bool fpgaio_has_dbgctrl; /* Does FPGAIO have DBGCTRL register? */
+    bool fpgaio_has_gpioalt2; /* Does FPGAIO have GPIOALT2 register? */
     int numirq; /* Number of external interrupts */
     int uart_overflow_irq; /* number of the combined UART overflow IRQ */
     uint32_t init_svtor; /* init-svtor setting for SSE */
@@ -494,6 +495,7 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
     qdev_prop_set_uint32(DEVICE(fpgaio), "num-leds", mmc->fpgaio_num_leds);
     qdev_prop_set_bit(DEVICE(fpgaio), "has-switches", mmc->fpgaio_has_switches);
     qdev_prop_set_bit(DEVICE(fpgaio), "has-dbgctrl", mmc->fpgaio_has_dbgctrl);
+    qdev_prop_set_bit(DEVICE(fpgaio), "has-gpioalt2", mmc->fpgaio_has_gpioalt2);
     sysbus_realize(SYS_BUS_DEVICE(fpgaio), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
 }
@@ -1350,6 +1352,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, const void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->fpgaio_has_dbgctrl = false;
+    mmc->fpgaio_has_gpioalt2 = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
@@ -1384,6 +1387,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, const void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->fpgaio_has_dbgctrl = false;
+    mmc->fpgaio_has_gpioalt2 = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
@@ -1418,6 +1422,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, const void *data)
     mmc->fpgaio_num_leds = 10;
     mmc->fpgaio_has_switches = true;
     mmc->fpgaio_has_dbgctrl = false;
+    mmc->fpgaio_has_gpioalt2 = false;
     mmc->numirq = 95;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
@@ -1457,6 +1462,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, const void *data)
     mmc->fpgaio_num_leds = 10;
     mmc->fpgaio_has_switches = true;
     mmc->fpgaio_has_dbgctrl = true;
+    mmc->fpgaio_has_gpioalt2 = false;
     mmc->numirq = 96;
     mmc->uart_overflow_irq = 48;
     mmc->init_svtor = 0x00000000;
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index da78cb6070..208f9fd60f 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -31,6 +31,7 @@
 REG32(LED0, 0)
 REG32(DBGCTRL, 4)
 REG32(BUTTON, 8)
+REG32(GPIOALT2, 0xc)
 REG32(CLK1HZ, 0x10)
 REG32(CLK100HZ, 0x14)
 REG32(COUNTER, 0x18)
@@ -142,6 +143,9 @@ static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
          */
         r = 0;
         break;
+    case A_GPIOALT2:
+        r = s->gpioalt2;
+        break;
     case A_PRESCALE:
         r = s->prescale;
         break;
@@ -210,6 +214,14 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
                       "MPS2 FPGAIO: DBGCTRL unimplemented\n");
         s->dbgctrl = value;
         break;
+    case A_GPIOALT2:
+        if (!s->has_gpioalt2) {
+            goto bad_offset;
+        }
+        qemu_log_mask(LOG_UNIMP,
+                      "MPS2 FPGAIO: GPIOALT2 unimplemented\n");
+        s->gpioalt2 = value;
+        break;
     case A_PRESCALE:
         resync_counter(s);
         s->prescale = value;
@@ -301,6 +313,24 @@ static void mps2_fpgaio_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static bool needed_gpioalt2(void *opaque)
+{
+    MPS2FPGAIO *s = MPS2_FPGAIO(opaque);
+
+    return s->has_gpioalt2;
+}
+
+static const VMStateDescription mps2_fpgaio_gpioalt2_vmstate = {
+    .name = "mps2-fpgaio/gpioalt2",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = needed_gpioalt2,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT32(gpioalt2, MPS2FPGAIO),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription mps2_fpgaio_vmstate = {
     .name = "mps2-fpgaio",
     .version_id = 3,
@@ -317,6 +347,10 @@ static const VMStateDescription mps2_fpgaio_vmstate = {
         VMSTATE_INT64(pscntr_sync_ticks, MPS2FPGAIO),
         VMSTATE_END_OF_LIST()
     },
+    .subsections = (const VMStateDescription * const []) {
+        &mps2_fpgaio_gpioalt2_vmstate,
+        NULL
+    }
 };
 
 static const Property mps2_fpgaio_properties[] = {
@@ -326,6 +360,7 @@ static const Property mps2_fpgaio_properties[] = {
     DEFINE_PROP_UINT32("num-leds", MPS2FPGAIO, num_leds, 2),
     DEFINE_PROP_BOOL("has-switches", MPS2FPGAIO, has_switches, false),
     DEFINE_PROP_BOOL("has-dbgctrl", MPS2FPGAIO, has_dbgctrl, false),
+    DEFINE_PROP_BOOL("has-gpioalt2", MPS2FPGAIO, has_gpioalt2, false),
 };
 
 static void mps2_fpgaio_class_init(ObjectClass *klass, const void *data)
diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index edd9f23121..7512686616 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -40,11 +40,13 @@ struct MPS2FPGAIO {
     uint32_t num_leds;
     bool has_switches;
     bool has_dbgctrl;
+    bool has_gpioalt2;
 
     uint32_t led0;
     uint32_t prescale;
     uint32_t misc;
     uint32_t dbgctrl;
+    uint32_t gpioalt2;
 
     /* QEMU_CLOCK_VIRTUAL time at which counter and pscntr were last synced */
     int64_t pscntr_sync_ticks;
-- 
2.53.0


