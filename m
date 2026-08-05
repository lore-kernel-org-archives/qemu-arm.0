Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E870C55174
	for <qemu-arm@archiver.kernel.org>; Wed,  5 Aug 2026 15:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wrdZh-0005tE-Sh; Wed, 05 Aug 2026 11:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wrdZZ-0005pp-SZ
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 11:30:27 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wrdZV-0007et-Lr
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 11:30:24 -0400
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-495c63c4141so656803b6e.2
 for <qemu-arm@nongnu.org>; Wed, 05 Aug 2026 08:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785943819; x=1786548619; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fU96bK353k5ADv3CzrrtydkHbKOwXgwzsqMVSvU+exo=;
 b=gISDWt2D5HE+I4am/QWlUJXU5nxmaqig2VEP43pgS1WDbjF7GJBSMh7M/Zv/Nyyjg5
 IuN7Vcise94j8XZKqNkFcrMmNESyHAlYqzHh6pxfakw4q+sLQDQqvv/wYLiYbHutui4o
 GjMhUXi5j4yXaiCCQCL0WAmNpEodSOYc8EM44QUrx4iD/9vGON53Thb0dBtQFtOEBaKl
 wxBT19EvlZWfGkun3gHu+hVhrH6V93XB/Kg6JNb8vV32CLq/5aBUMlbw0cRmcwA/dPuE
 mznZxerSWmhRWSqQGlxiTtM/d/Vmf1jh2pWWO8WBjK9vZwL6ynX7Yy2iYB3wLtHU43Wd
 Bb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785943819; x=1786548619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fU96bK353k5ADv3CzrrtydkHbKOwXgwzsqMVSvU+exo=;
 b=AYARZlq+f1aa2Jhb67wX15xGR0VdL3gaq1d+1jowE3Ym69E6YJgKjijomy68tr1SH5
 LS1j4EXYaY2SPCpHTjc8lHViUW8FfEpdizOmgimZF5gba85M4BvzEgvPCs6hoE+7Rpl7
 oRIhRAVMZCJtBPb7dxs5041bNu0gRyqI4pqAe0BRTJmVbF8ZY7TDRwk96JpN8NUl5QMI
 WOFxK/HR9EPOvJkdRnslV9liA2wiHzvw4qXy2dT9jpwFzhHe7Dn9qfYX+o/3jHeHTDW5
 kK7mIvrw8BHwYu5Be4pxnmN0Bd7z2zDTM/ciRDQ8v0b62F1wRTOZw1hqMF/Id4Wx9cNS
 o00w==
X-Gm-Message-State: AOJu0Yy8iyPAkwYnbgQ7L1DhH7118zoyCt+9VpaQ/29/s0t29cX/JoKa
 EE5A/9K18vSZZw4bgngHpmQzixjeFJip/0Vm17/9Ea8GH/sBX1npUYzF
X-Gm-Gg: AR+sD115kdWylhKafvvHTjRXHcdkbhVJkTl2Lcj/oWXaIdMv26B5seUUC52QUyg2RML
 ekyQxwwbuN0JwIAOwrz9+bfuIlbe6Zy8gBmzU9U0FQ6kJF+lcXBKRFt1WQJ6VMlXutgiBg8mcOJ
 D6fWfxsq5myhHy0c3xHu6UDYuZy40odZSsELVnRXRnD0VuurjfqagXYITm0PI7uBvELoBpR98q/
 /uJcwr2z0P9me4ijmaHCaIQaqJptlVq0cgM7Qji9CmV4yJdoxcy8q2cAlHsaN5aaPeQFSNcLRVt
 cStnCuvQMVxrQL+YSxZYOH1yP0blKviyvViTmLgr7UoZwiuIPJA1FopqlK1DMMU8oKMHL6o1Zvk
 KLKAhRg99nrvh4dOwUkniKjPmH1c8EwgyA/13NKny9AtLeNwSgeo7wz7R/usjFXKG4rii1EInqj
 LrAryPo24mku2TYNNvu/nWuprxUVSaLdOGrLHElhsHnkt8F1HAz4o/61kSVu8W7rlJ8ygFK1nAQ
 MFOnUQxQYjV
X-Received: by 2002:a05:6808:2227:b0:495:d7ec:b6ae with SMTP id
 5614622812f47-4afae16981emr4950546b6e.16.1785943818680; 
 Wed, 05 Aug 2026 08:30:18 -0700 (PDT)
Received: from HPE-2MQ6131DV6.ams.hpecorp.net ([170.85.99.9])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4afae75ce1bsm2185614b6e.15.2026.08.05.08.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 08:30:18 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Owen Giles <owen.giles@hpe.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Robert Elliott <elliott@hpe.com>, Simon Xu <simonxhy0404@gmail.com>
Subject: [PATCH v2 9/9] hw/misc/mps2-fpgaio.c: add GPIOALT2 register
Date: Wed,  5 Aug 2026 10:30:05 -0500
Message-ID: <20260805153005.9989-10-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805153005.9989-1-simonxhy0404@gmail.com>
References: <20260805153005.9989-1-simonxhy0404@gmail.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Owen Giles <owen.giles@hpe.com>
Reviewed-by: Robert Elliott <elliott@hpe.com>
Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
---
 hw/arm/mps2-tz.c              |  7 +++++++
 hw/misc/mps2-fpgaio.c         | 13 +++++++++++++
 include/hw/misc/mps2-fpgaio.h |  2 ++
 3 files changed, 22 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 2cb461ca71..d9f64880f8 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -131,6 +131,7 @@ struct MPS2TZMachineClass {
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
     bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
     bool fpgaio_has_dbgctrl; /* Does FPGAIO have DBGCTRL register? */
+    bool fpgaio_has_gpioalt2; /* Does FPGAIO have GPIOALT2 register? */
     int numirq; /* Number of external interrupts */
     int uart_overflow_irq; /* number of the combined UART overflow IRQ */
     uint32_t init_svtor; /* init-svtor setting for SSE */
@@ -515,6 +516,7 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
     qdev_prop_set_uint32(DEVICE(fpgaio), "num-leds", mmc->fpgaio_num_leds);
     qdev_prop_set_bit(DEVICE(fpgaio), "has-switches", mmc->fpgaio_has_switches);
     qdev_prop_set_bit(DEVICE(fpgaio), "has-dbgctrl", mmc->fpgaio_has_dbgctrl);
+    qdev_prop_set_bit(DEVICE(fpgaio), "has-gpioalt2", mmc->fpgaio_has_gpioalt2);
     sysbus_realize(SYS_BUS_DEVICE(fpgaio), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
 }
@@ -1433,6 +1435,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, const void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->fpgaio_has_dbgctrl = false;
+    mmc->fpgaio_has_gpioalt2 = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
@@ -1467,6 +1470,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, const void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->fpgaio_has_dbgctrl = false;
+    mmc->fpgaio_has_gpioalt2 = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
@@ -1501,6 +1505,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, const void *data)
     mmc->fpgaio_num_leds = 10;
     mmc->fpgaio_has_switches = true;
     mmc->fpgaio_has_dbgctrl = false;
+    mmc->fpgaio_has_gpioalt2 = false;
     mmc->numirq = 95;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
@@ -1540,6 +1545,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, const void *data)
     mmc->fpgaio_num_leds = 10;
     mmc->fpgaio_has_switches = true;
     mmc->fpgaio_has_dbgctrl = true;
+    mmc->fpgaio_has_gpioalt2 = false;
     mmc->numirq = 96;
     mmc->uart_overflow_irq = 48;
     mmc->init_svtor = 0x00000000;
@@ -1575,6 +1581,7 @@ static void mps3tz_an555_class_init(ObjectClass *oc, const void *data)
     mmc->fpgaio_num_leds = 10;
     mmc->fpgaio_has_switches = true;
     mmc->fpgaio_has_dbgctrl = true;
+    mmc->fpgaio_has_gpioalt2 = true;
     mmc->numirq = 96;
     mmc->uart_overflow_irq = 48;
     mmc->init_svtor = 0x00000000;
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index da78cb6070..6696384a25 100644
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
@@ -326,6 +338,7 @@ static const Property mps2_fpgaio_properties[] = {
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


