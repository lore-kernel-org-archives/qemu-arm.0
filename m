Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8673CC531D0
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Jul 2026 23:12:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnlX9-0003ib-Bb; Sat, 25 Jul 2026 19:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnlX3-0003h4-0R
 for qemu-arm@nongnu.org; Sat, 25 Jul 2026 19:11:49 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnlX0-0005j7-QT
 for qemu-arm@nongnu.org; Sat, 25 Jul 2026 19:11:48 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-5c3163a88a1so45540e0c.3
 for <qemu-arm@nongnu.org>; Sat, 25 Jul 2026 16:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785021105; x=1785625905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Rww7YfQ1WxkCJQmecJPYaSnIoUwIyure2gI4fgprYWc=;
 b=segqUeNxQXJYi0Yn7UEznANjGF31pdDQ0bwAQU99Cp3ZrSOdeVdE/hQ5OynesqJMLj
 znWw1EtlD51Wp4mVIO3ZTpm3OwsCw3VEqBgk8eMH6Y0Hq177ClStl/pU3jovgJOJIyTg
 lRGNtC2ceBJhvcXCDVHj0r9UT2tID6qErdnl9CyebvzxYzF74b+mlQExyuAtC0sGmeb/
 je9cyvKL3pXIqLsrcFy1KRkpvl/ZSbUihwtIphkAtSKrffkf6vYilPYxsjyFf1sjet6h
 1Ycc58wimnumqC970KjhG5I7U2j9wXDzzCR/KzBC4oKDC5hdbvIKQRrtiTexE5UViDRj
 3JLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785021105; x=1785625905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Rww7YfQ1WxkCJQmecJPYaSnIoUwIyure2gI4fgprYWc=;
 b=Zt/IBZvSMmEHc6/AAH4dNA3Uir8IYhWj19paf88WcMnwYDVgZoqF266YuIH6WR/5Y3
 iE3xc9+tUjJDG8v8VsPcces0KnX4WxYpYQzucVSKnI+wOmwzMIlHJt84YY86DFwCjXs6
 eJfRB+B2BAejWjneg8Wx0KZC4I30DHfGAI02VB+rb2NZQHpZZ1MSo2+aBBYG5eXGvqvv
 nG4CRZGzMPRQPMcR3NV2P7MSExt6y/7PM98llO0Sk1+HrECadZOeNVmsMUpeLhLmGDEp
 MVD4HswzDm90BPd9mzfpjGP1ALUBuXMyPavc8hp/8+Q1YwDh8TTrODepcefFzop9XBjA
 fGCQ==
X-Gm-Message-State: AOJu0YwDktDoaV9Ar+zYzmdCm0rzgb8exza///+bzslVomRWuPjllnOT
 y6TrGJQ+F6jZlzbNDedyOEvjDKUnpWTHXFFOPnFM6p0e9SYeXnCgtYgLbqYBrg==
X-Gm-Gg: AR+sD11HqbRxSTMlM+zRhaH9fLYNSJwxTHEyB9t6074KlLe942ZcfHC+6XvvjN1x2AV
 izG+7zAn35n5KnYvPkGCpJWAcSg+3c3vJ8C7TgM2ppeI/uUMJ+zpL/q0WuYjz/MjsGTTCZbNKIP
 d6KLJF285RWw5LR2ScxP2llIdDXlmsUcst15UTPcpGI8gNKP+iRTAdcIyTr6rl9da9isT9AHi7+
 Nqagnl/gH/9BY0YknekY3JTqBrWFvySKl72LnGDE1WwJEClSGynMd0J1mApkvzRKnhMgpzuZv07
 fj+MWe1fOvR4FPwiL03QT2IbLo+Prgth2jVzTlX1o8lSVLo45oYRE8ESYrI/rjPJ0V4v/bqaFa3
 klYXIQGu54Xpuoc5AWFPt4WsX6KY6OFl8cFwNGnncfCOB+YRwIJNSIJwwFnRorxmGCF1CvbDwnK
 pNQemO3wIHfrp1atIfbjV2rmIf7ezji6eG
X-Received: by 2002:a05:6122:65a4:b0:5bf:b500:c4f4 with SMTP id
 71dfb90a1353d-5c306bb3b3amr1528561e0c.2.1785021105607; 
 Sat, 25 Jul 2026 16:11:45 -0700 (PDT)
Received: from localhost.localdomain ([146.71.8.128])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5c30549516csm2907015e0c.6.2026.07.25.16.11.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jul 2026 16:11:44 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jason Wang <jasowangio@gmail.com>, Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH 1/2] hw/misc/bcm2835_powermgt: implement a real watchdog timer
Date: Sat, 25 Jul 2026 19:11:41 -0400
Message-ID: <20260725231142.61663-2-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260725231142.61663-1-marcelomanzo@gmail.com>
References: <20260725231142.61663-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=marcelomanzo@gmail.com; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The RSTC register's write-config bits (0x30) being set to the
"full reset" value (0x20) does not mean "reset now" -- it arms the
hardware watchdog so that a reset happens if the WDOG countdown
register is not refreshed before it expires. The previous
implementation treated any such RSTC write as an immediate reset,
regardless of the WDOG value.

This is dormant on older/lighter userspace (nothing in Bullseye's
default boot touches these registers this way), but modern systemd
(observed with Debian 13/Trixie's systemd 257) writes to RSTC as part
of routine early-boot watchdog probing. With the old code, this fires
an immediate reset a few seconds into boot; combined with -no-reboot
this looks exactly like a QEMU crash (clean exit, no panic, no guest
reboot message) with the last log line being the RSTC/WDOG write.

Fix this by actually implementing the watchdog as a QEMUTimer: writes
to RSTC/WDOG (re)compute the timeout from the WDOG register (in units
of 1/65536 s, per the real hardware) and arm a timer for that many
nanoseconds out; only when the timer actually fires do we request a
system reset or shutdown, matching real hardware behavior. Clearing
the write-config bits or the WDOG value disarms the timer, and reset
disarms it too.

Verified against real Raspberry Pi OS images under the patched
raspi4b machine: Bullseye (5.15) and Bookworm (6.12) never exercised
this path either way; Trixie (6.18, systemd 257) no longer crashes at
boot and reaches a working login/SSH state.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 hw/misc/bcm2835_powermgt.c         | 49 +++++++++++++++++++++++-------
 include/hw/misc/bcm2835_powermgt.h |  2 ++
 2 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/hw/misc/bcm2835_powermgt.c b/hw/misc/bcm2835_powermgt.c
index 3ec7abad0e..d90b9a0c3e 100644
--- a/hw/misc/bcm2835_powermgt.c
+++ b/hw/misc/bcm2835_powermgt.c
@@ -19,10 +19,40 @@
 #define PASSWORD_MASK 0xff000000
 
 #define R_RSTC 0x1c
-#define V_RSTC_RESET 0x20
+#define V_RSTC_WRCFG_MASK 0x30
+#define V_RSTC_FULL_RESET 0x20
 #define R_RSTS 0x20
 #define V_RSTS_POWEROFF 0x555 /* Linux uses partition 63 to indicate halt. */
 #define R_WDOG 0x24
+#define V_WDOG_TIME_MASK 0xfffff
+#define WDOG_TICKS_PER_SECOND 65536
+
+static void bcm2835_powermgt_expire(void *opaque)
+{
+    BCM2835PowerMgtState *s = opaque;
+
+    if ((s->rsts & 0xfff) == V_RSTS_POWEROFF) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    } else {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+    }
+}
+
+static void bcm2835_powermgt_update_wdog(BCM2835PowerMgtState *s)
+{
+    uint64_t timeout_ns;
+
+    if ((s->rstc & V_RSTC_WRCFG_MASK) != V_RSTC_FULL_RESET ||
+        s->wdog == 0) {
+        timer_del(s->wdog_timer);
+        return;
+    }
+
+    timeout_ns = muldiv64(s->wdog, NANOSECONDS_PER_SECOND,
+                          WDOG_TICKS_PER_SECOND);
+    timer_mod(s->wdog_timer,
+              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + timeout_ns);
+}
 
 static uint64_t bcm2835_powermgt_read(void *opaque, hwaddr offset,
                                       unsigned size)
@@ -70,13 +100,7 @@ static void bcm2835_powermgt_write(void *opaque, hwaddr offset,
     switch (offset) {
     case R_RSTC:
         s->rstc = value;
-        if (value & V_RSTC_RESET) {
-            if ((s->rsts & 0xfff) == V_RSTS_POWEROFF) {
-                qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
-            } else {
-                qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
-            }
-        }
+        bcm2835_powermgt_update_wdog(s);
         break;
     case R_RSTS:
         qemu_log_mask(LOG_UNIMP,
@@ -84,9 +108,8 @@ static void bcm2835_powermgt_write(void *opaque, hwaddr offset,
         s->rsts = value;
         break;
     case R_WDOG:
-        qemu_log_mask(LOG_UNIMP,
-                      "bcm2835_powermgt_write: WDOG\n");
-        s->wdog = value;
+        s->wdog = value & V_WDOG_TIME_MASK;
+        bcm2835_powermgt_update_wdog(s);
         break;
 
     default:
@@ -113,6 +136,7 @@ static const VMStateDescription vmstate_bcm2835_powermgt = {
         VMSTATE_UINT32(rstc, BCM2835PowerMgtState),
         VMSTATE_UINT32(rsts, BCM2835PowerMgtState),
         VMSTATE_UINT32(wdog, BCM2835PowerMgtState),
+        VMSTATE_TIMER_PTR(wdog_timer, BCM2835PowerMgtState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -124,6 +148,8 @@ static void bcm2835_powermgt_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &bcm2835_powermgt_ops, s,
                           TYPE_BCM2835_POWERMGT, 0x200);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+    s->wdog_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                 bcm2835_powermgt_expire, s);
 }
 
 static void bcm2835_powermgt_reset(DeviceState *dev)
@@ -134,6 +160,7 @@ static void bcm2835_powermgt_reset(DeviceState *dev)
     s->rstc = 0x00000102;
     s->rsts = 0x00001000;
     s->wdog = 0x00000000;
+    timer_del(s->wdog_timer);
 }
 
 static void bcm2835_powermgt_class_init(ObjectClass *klass, const void *data)
diff --git a/include/hw/misc/bcm2835_powermgt.h b/include/hw/misc/bcm2835_powermgt.h
index fb0740c01e..d1903a9cce 100644
--- a/include/hw/misc/bcm2835_powermgt.h
+++ b/include/hw/misc/bcm2835_powermgt.h
@@ -12,6 +12,7 @@
 #define BCM2835_POWERMGT_H
 
 #include "hw/core/sysbus.h"
+#include "qemu/timer.h"
 #include "qom/object.h"
 
 #define TYPE_BCM2835_POWERMGT "bcm2835-powermgt"
@@ -24,6 +25,7 @@ struct BCM2835PowerMgtState {
     uint32_t rstc;
     uint32_t rsts;
     uint32_t wdog;
+    QEMUTimer *wdog_timer;
 };
 
 #endif
-- 
2.47.1


