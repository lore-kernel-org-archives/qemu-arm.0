Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4807340lfq;
        Tue, 29 Sep 2020 11:04:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRoMNeq9BHnWC/vM3PaEcFLwAPksLmtgfvpX2Nnpjd8xDNjsCGELoFkrgW1Pwu7TkqgBZJ
X-Received: by 2002:a25:2596:: with SMTP id l144mr7753048ybl.510.1601402698541;
        Tue, 29 Sep 2020 11:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601402698; cv=none;
        d=google.com; s=arc-20160816;
        b=jLfKpU5NbCyK3a0iap7sYd+XmHVvfh1XNqtxMFo4MjHhb6ZCKHHTo6ZJC0/QpxB3gf
         rwarHM3MLHdjPAt6vN6FSxYaE2pgqQV43Paa/CBiBj+4yOSUnv4Ha1Rd9QhUeuXvL3IU
         FvJ9yWZV0mK8sXljEEqXlQh3NiDiJnAtk6M9TlpL9HLefZZj6qfaPyk1UJXARiyQ4hp/
         vlBbT6C8Kq7YWvdfFnSh/vat+D9wIrTvEJPuhl1EUKr5ow5rruizNPuUaSaW6FXdCg+1
         5aEfx+0rqCPf6SRPs289B9FvSzlNiOJMkZyAIxOWiwWVHmnzvSARSUFNCr6rIYxyCaj4
         WQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=l8bONhdGbziQlwjl9jYixDrEw+GXvMswNoRw86NDcpc=;
        b=hdt88SxonClX8xR92HI7CSgdsgcXm8S0l+OSMJ14G9incP14UqWadRzPYY/SOsOkKq
         xGarZCloArTRenCFT2rPqQbLdcQpQVKe5vi97tGGQzL3euAIC5E7ES+MvVLcvFebzIbN
         nOfNcPo7J26udRJnsTT3DEmEKD3jentqJoUVqN7VurV/W36f/hPHVq6HKx2V3OjgWOt8
         HW/7XwgnDg0J00t2WChveJb0fbt5vWf5IxHiQXVPHW8ns6Q9WR9/GePk3FTB/W+umnHD
         2/8ZAtJJdcZO4HIO2xFN4Itwk2Cq2JaS+8inAh0l+egosqaudJIf1ZnvAf5XibsfVaGg
         s1hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JAbLwXwj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si4286611ybe.422.2020.09.29.11.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 11:04:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JAbLwXwj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNJzl-0006tm-QI
	for alex.bennee@linaro.org; Tue, 29 Sep 2020 14:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kNJz7-0006o0-On
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 14:04:17 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:37861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kNJz4-0001LV-De
 for qemu-arm@nongnu.org; Tue, 29 Sep 2020 14:04:17 -0400
Received: by mail-qk1-x744.google.com with SMTP id 16so5247469qkf.4
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2020 11:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=l8bONhdGbziQlwjl9jYixDrEw+GXvMswNoRw86NDcpc=;
 b=JAbLwXwj2Kn0VbQ+YHAJ5JCOfTXCEUCUGCv3vWLGFwJGKS/7bnkS7qdGB7w7bRUzSr
 ZDswSPHcQud+5gkhL+2Hw+jcNqN/4HoNSOrVt5rCdfEhZguR0qr80Cw18KsnbBJCkHRS
 ox7ZBMX4RVd2q7zeh8/XytDGVIQe8GznKdPh02r+X8Y6q4cfTrKdKO5F6LJS6DpXqRBe
 Li0knGGDJP4RkVQlhsNUTFPD7SgD/5k/+/acwGnpm/HcV7E40Fvthumf3fvBcLDv1VPj
 xV+oQ1Kdvp4T8zvtb2QkmUFadEF3xUioPc8bOnLKoTQM1mfKQ4Z0DuGczeosKnz83zMq
 QDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=l8bONhdGbziQlwjl9jYixDrEw+GXvMswNoRw86NDcpc=;
 b=O/Yvg52CkVDF22lPqdWp+eUP8wKToWAnGmcGN4br/l47RV2DgZEM16f0mZZzXcgRfj
 9fgNLge+jx3AEGXdcpDAaHjXWnKizIOIJJTVVu9iqtUQ/NRtxk/dA9qKTIExmAYoJ9h9
 yFJmMLri98A7efxKbKLJdshWuKh7SacHExXRojVsI5l+Bcq7i8sn3JUd+yo0T5Lad+NS
 MunzOH35JzV10S/YfMNO8heToMiUTFD3aPkY9OLYs1n3lCJUXA9/HAo4gYdAr45GVUPr
 ljkn2Dzis5MdHe6SYVXh7bCke/ZjSOWi0gTim796RDsSBujQgnliu6AGsIFbS/UN3VTR
 b/dA==
X-Gm-Message-State: AOAM531XmZjGR5dVuukk++b/3VDAz4CUBdwaRVGXj64SZ+lKfeRBNFXJ
 +0XjLs3E+uBNcf800CUyUaqJkw==
X-Received: by 2002:a37:9e8d:: with SMTP id h135mr2084194qke.493.1601402653283; 
 Tue, 29 Sep 2020 11:04:13 -0700 (PDT)
Received: from master.hitronhub.home ([2607:fea8:e2a0:e950::661])
 by smtp.googlemail.com with ESMTPSA id n7sm6600337qtf.27.2020.09.29.11.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 11:04:12 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v2 1/2] hw/watchdog: Implement SBSA watchdog device
Date: Tue, 29 Sep 2020 14:04:09 -0400
Message-Id: <20200929180410.33058-2-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200929180410.33058-1-shashi.mallela@linaro.org>
References: <20200929180410.33058-1-shashi.mallela@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::744;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x744.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FYH3UypHzZv+

Generic watchdog device model has been implemented as per ARM BSAv0.9

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/Kconfig                      |   1 +
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/wdt_sbsa_gwdt.c         | 344 ++++++++++++++++++++++++++++
 include/hw/watchdog/wdt_sbsa_gwdt.h |  68 ++++++
 5 files changed, 418 insertions(+)
 create mode 100644 hw/watchdog/wdt_sbsa_gwdt.c
 create mode 100644 include/hw/watchdog/wdt_sbsa_gwdt.h

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f303c6bead25..6b97e64595d3 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -210,6 +210,7 @@ config SBSA_REF
     select PL031 # RTC
     select PL061 # GPIO
     select USB_EHCI_SYSBUS
+    select WDT_SBSA_GWDT
 
 config SABRELITE
     bool
diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
index 293209b291d6..94ac0d5b76b1 100644
--- a/hw/watchdog/Kconfig
+++ b/hw/watchdog/Kconfig
@@ -17,3 +17,7 @@ config WDT_DIAG288
 
 config WDT_IMX2
     bool
+
+config WDT_SBSA_GWDT
+    bool
+    default y if SBSA_REF
\ No newline at end of file
diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
index 9b8725e64288..a9a23307acfe 100644
--- a/hw/watchdog/meson.build
+++ b/hw/watchdog/meson.build
@@ -5,3 +5,4 @@ softmmu_ss.add(when: 'CONFIG_WDT_IB700', if_true: files('wdt_ib700.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files('wdt_diag288.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c'))
 softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
+softmmu_ss.add(when: 'CONFIG_WDT_SBSA_GWDT', if_true: files('wdt_sbsa_gwdt.c'))
diff --git a/hw/watchdog/wdt_sbsa_gwdt.c b/hw/watchdog/wdt_sbsa_gwdt.c
new file mode 100644
index 000000000000..c435882aae62
--- /dev/null
+++ b/hw/watchdog/wdt_sbsa_gwdt.c
@@ -0,0 +1,344 @@
+/*
+ * Generic watchdog device model for SBSA
+ *
+ * Copyright Linaro.org 2020
+ *
+ * Authors:
+ *  Shashi Mallela <shashi.mallela@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/reset.h"
+#include "sysemu/watchdog.h"
+#include "hw/watchdog/wdt_sbsa_gwdt.h"
+#include "qemu/timer.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+static WatchdogTimerModel model = {
+    .wdt_name = TYPE_WDT_SBSA_GWDT,
+    .wdt_description = "sbsa_gwdt device for sbsa_ref platform",
+};
+
+static const VMStateDescription vmstate_sbsa_gwdt = {
+    .name = "vmstate_sbsa_gwdt",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_TIMER_PTR(timer, SBSA_GWDTState),
+        VMSTATE_BOOL(enabled, SBSA_GWDTState),
+        VMSTATE_BOOL(ws0, SBSA_GWDTState),
+        VMSTATE_BOOL(ws1, SBSA_GWDTState),
+        VMSTATE_UINT32(wrr, SBSA_GWDTState),
+        VMSTATE_UINT32(wcs, SBSA_GWDTState),
+        VMSTATE_UINT32(worl, SBSA_GWDTState),
+        VMSTATE_UINT32(woru, SBSA_GWDTState),
+        VMSTATE_UINT32(wcvl, SBSA_GWDTState),
+        VMSTATE_UINT32(wcvu, SBSA_GWDTState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static uint64_t sbsa_gwdt_rread(void *opaque, hwaddr addr, unsigned int size)
+{
+    uint32_t ret;
+
+    if (addr == SBSA_GWDT_WRR) {
+        /* watch refresh read has no effect and returns 0 */
+        ret = 0;
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "bad address in refresh frame read :"
+                        " 0x%x\n", (int)addr);
+    }
+    return ret;
+}
+
+static uint64_t sbsa_gwdt_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+    uint32_t ret = 0;
+
+    switch (addr) {
+    case SBSA_GWDT_WCS:
+        ret = s->wcs;
+        break;
+    case SBSA_GWDT_WOR:
+        ret = s->worl;
+        break;
+    case SBSA_GWDT_WORU:
+         ret = s->woru;
+         break;
+    case SBSA_GWDT_WCV:
+        ret = s->wcvl;
+        break;
+    case SBSA_GWDT_WCVU:
+        ret = s->wcvu;
+        break;
+    case SBSA_GWDT_W_IIDR:
+        ret = s->id;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "bad address in control frame read :"
+                        " 0x%x\n", (int)addr);
+    }
+    return ret;
+}
+
+static void sbsa_gwdt_update_timer(SBSA_GWDTState *s, bool refresh,
+                                   bool expired)
+{
+    uint64_t timeout = 0;
+
+    if (s->enabled) {
+        if ((refresh) || (expired && !s->ws0)) {
+            /*
+             * Extract the upper 16 bits from woru & 32 bits from worl
+             * registers to construct the 48 bit offset value
+             */
+            timeout = s->woru & SBSA_GWDT_WOR_MASK;
+            timeout <<= 32;
+            timeout |= s->worl;
+            timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+            /* store the current timeout value into compare registers */
+            s->wcvu = timeout >> 32;
+            s->wcvl = timeout;
+        } else {
+            timeout = s->wcvu;
+            timeout <<= 32;
+            timeout |= s->wcvl;
+            timeout += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        }
+
+        if (!s->ws0) {
+            timer_del(s->timer);
+            timer_mod(s->ptimer,
+                       timeout * NANOSECONDS_PER_SECOND);
+        } else {
+            timer_del(s->ptimer);
+            timer_mod(s->timer,
+                       timeout * NANOSECONDS_PER_SECOND);
+        }
+    } else {
+        timer_del(s->ptimer);
+        timer_del(s->timer);
+    }
+}
+
+static void sbsa_gwdt_rwrite(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size) {
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+
+    if (offset == SBSA_GWDT_WRR) {
+        s->wrr = data;
+        s->wcs &= ~SBSA_GWDT_WCS_WS0;
+        s->wcs &= ~SBSA_GWDT_WCS_WS1;
+        s->ws0 = false;
+        s->ws1 = false;
+        sbsa_gwdt_update_timer(s, true , false);
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "bad address in refresh frame write :"
+                        " 0x%x\n", (int)offset);
+    }
+}
+
+static void sbsa_gwdt_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size) {
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+    bool enable;
+
+    switch (offset) {
+    case SBSA_GWDT_WCS:
+        enable = data & SBSA_GWDT_WCS_EN;
+        if (enable) {
+            s->wcs |= SBSA_GWDT_WCS_EN;
+            s->enabled = true;
+        } else {
+            s->wcs &= ~SBSA_GWDT_WCS_EN;
+            s->enabled = false;
+            s->ws0 = false;
+            s->ws1 = false;
+        }
+        sbsa_gwdt_update_timer(s, false, false);
+        break;
+
+    case SBSA_GWDT_WOR:
+        s->worl = data;
+        /*
+         * TODO:- setting woru to 0 and triggering update timer(below) is a
+         * temporary workaround to handle current linux driver which is
+         * based on earlier version of BSA specification.Once the linux
+         * driver is updated to BSA v0.9 will remove these next 2 lines.
+         */
+        s->woru = 0;
+        sbsa_gwdt_update_timer(s, true , false);
+        break;
+
+    case SBSA_GWDT_WORU:
+        s->woru = data;
+        sbsa_gwdt_update_timer(s, true , false);
+        break;
+
+    case SBSA_GWDT_WCV:
+        s->wcvl = data;
+        break;
+
+    case SBSA_GWDT_WCVU:
+        s->wcvu = data;
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "bad address in control frame write :"
+                " 0x%x\n", (int)offset);
+    }
+    return;
+}
+
+static void wdt_sbsa_gwdt_reset(DeviceState *dev)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(dev);
+
+    timer_del(s->ptimer);
+    timer_del(s->timer);
+
+    s->enabled = false;
+    s->ws0 = false;
+    s->ws1 = false;
+    s->wcs &= ~SBSA_GWDT_WCS_EN;
+    s->wcs &= ~SBSA_GWDT_WCS_WS0;
+    s->wcs &= ~SBSA_GWDT_WCS_WS1;
+    s->wcvl = 0;
+    s->wcvu = 0;
+    s->worl = 0;
+    s->woru = 0;
+    s->id = SBSA_GWDT_ID;
+}
+
+static void sbsa_gwdt_reset(void *opaque)
+{
+    DeviceState *sbsa_gwdt = opaque;
+
+    wdt_sbsa_gwdt_reset(sbsa_gwdt);
+}
+
+static void sbsa_gwdt_timer_sysinterrupt(void *opaque)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(opaque);
+
+    s->wcs |= SBSA_GWDT_WCS_WS0;
+    s->ws0 = true;
+    qemu_set_irq(s->irq, 1);
+    sbsa_gwdt_update_timer(s, false, true);
+}
+
+static void sbsa_gwdt_timer_sysreset(void *dev)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(dev);
+    s->wcs |= SBSA_GWDT_WCS_WS1;
+    s->ws1 = true;
+    qemu_log_mask(CPU_LOG_RESET, "Watchdog timer expired.\n");
+    /*
+     * Reset the watchdog only if the guest gets notified about
+     * expiry. watchdog_perform_action() may temporarily relinquish
+     * the BQL; reset before triggering the action to avoid races with
+     * sbsa_gwdt instructions.
+     */
+    switch (get_watchdog_action()) {
+    case WATCHDOG_ACTION_DEBUG:
+    case WATCHDOG_ACTION_NONE:
+    case WATCHDOG_ACTION_PAUSE:
+        break;
+    default:
+        wdt_sbsa_gwdt_reset(dev);
+    }
+    watchdog_perform_action();
+}
+
+static const MemoryRegionOps sbsa_gwdt_rops = {
+    .read = sbsa_gwdt_rread,
+    .write = sbsa_gwdt_rwrite,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static const MemoryRegionOps sbsa_gwdt_ops = {
+    .read = sbsa_gwdt_read,
+    .write = sbsa_gwdt_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static void wdt_sbsa_gwdt_realize(DeviceState *dev, Error **errp)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->rmmio, OBJECT(dev),
+                          &sbsa_gwdt_rops, s,
+                          "sbsa_gwdt.refresh",
+                          SBSA_GWDT_RMMIO_SIZE);
+
+    memory_region_init_io(&s->cmmio, OBJECT(dev),
+                          &sbsa_gwdt_ops, s,
+                          "sbsa_gwdt.control",
+                          SBSA_GWDT_CMMIO_SIZE);
+
+    sysbus_init_mmio(sbd, &s->rmmio);
+    sysbus_init_mmio(sbd, &s->cmmio);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    qemu_register_reset(sbsa_gwdt_reset, s);
+
+    s->ptimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sbsa_gwdt_timer_sysinterrupt,
+            dev);
+    s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sbsa_gwdt_timer_sysreset,
+                dev);
+}
+
+static void wdt_sbsa_gwdt_unrealize(DeviceState *dev)
+{
+    SBSA_GWDTState *s = SBSA_GWDT(dev);
+
+    timer_del(s->ptimer);
+    timer_free(s->ptimer);
+
+    timer_del(s->timer);
+    timer_free(s->timer);
+}
+
+static void wdt_sbsa_gwdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = wdt_sbsa_gwdt_realize;
+    dc->unrealize = wdt_sbsa_gwdt_unrealize;
+    dc->reset = wdt_sbsa_gwdt_reset;
+    dc->hotpluggable = false;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->vmsd = &vmstate_sbsa_gwdt;
+}
+
+static const TypeInfo wdt_sbsa_gwdt_info = {
+    .class_init = wdt_sbsa_gwdt_class_init,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .name  = TYPE_WDT_SBSA_GWDT,
+    .instance_size  = sizeof(SBSA_GWDTState),
+};
+
+static void wdt_sbsa_gwdt_register_types(void)
+{
+    watchdog_add_model(&model);
+    type_register_static(&wdt_sbsa_gwdt_info);
+}
+
+type_init(wdt_sbsa_gwdt_register_types)
diff --git a/include/hw/watchdog/wdt_sbsa_gwdt.h b/include/hw/watchdog/wdt_sbsa_gwdt.h
new file mode 100644
index 000000000000..8044646fa62d
--- /dev/null
+++ b/include/hw/watchdog/wdt_sbsa_gwdt.h
@@ -0,0 +1,68 @@
+#ifndef WDT_SBSA_GWDT_H
+#define WDT_SBSA_GWDT_H
+
+#include "qemu/bitops.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+
+#define TYPE_WDT_SBSA_GWDT "sbsa_gwdt"
+#define SBSA_GWDT(obj) \
+    OBJECT_CHECK(SBSA_GWDTState, (obj), TYPE_WDT_SBSA_GWDT)
+#define SBSA_GWDT_CLASS(klass) \
+    OBJECT_CLASS_CHECK(SBSA_GWDTClass, (klass), TYPE_WDT_SBSA_GWDT)
+#define SBSA_GWDT_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(SBSA_GWDTClass, (obj), TYPE_WDT_SBSA_GWDT)
+
+/* SBSA Generic Watchdog register definitions */
+/* refresh frame */
+#define SBSA_GWDT_WRR       0x000
+
+/* control frame */
+#define SBSA_GWDT_WCS       0x000
+#define SBSA_GWDT_WOR       0x008
+#define SBSA_GWDT_WORU      0x00C
+#define SBSA_GWDT_WCV       0x010
+#define SBSA_GWDT_WCVU      0x014
+
+/* Watchdog Interface Identification Register */
+#define SBSA_GWDT_W_IIDR    0xFCC
+
+/* Watchdog Control and Status Register Bits */
+#define SBSA_GWDT_WCS_EN    BIT(0)
+#define SBSA_GWDT_WCS_WS0   BIT(1)
+#define SBSA_GWDT_WCS_WS1   BIT(2)
+
+#define SBSA_GWDT_WOR_MASK  0x0000FFFF
+
+/* Watchdog Interface Identification Register definition*/
+#define SBSA_GWDT_ID        0x1043B
+
+/* 2 Separate memory regions for each of refresh & control register frames */
+#define SBSA_GWDT_RMMIO_SIZE 0x1000
+#define SBSA_GWDT_CMMIO_SIZE 0x1000
+
+typedef struct SBSA_GWDTState {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion rmmio;
+    MemoryRegion cmmio;
+    qemu_irq irq;
+
+    QEMUTimer *ptimer, *timer;
+
+    uint32_t id;
+    uint32_t wrr;
+    uint32_t wcs;
+    uint32_t worl;
+    uint32_t woru;
+    uint32_t wcvl;
+    uint32_t wcvu;
+    bool enabled;
+    bool ws0, ws1;
+
+    /*< public >*/
+} SBSA_GWDTState;
+
+#endif /* WDT_SBSA_GWDT_H */
-- 
2.18.4

