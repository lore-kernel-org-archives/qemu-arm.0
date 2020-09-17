Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp286135lfq;
        Wed, 16 Sep 2020 22:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRyEWHlpe022gaoeB09HMoQKXPShNhIT0uv3It7NIJF6xYXKwQXmacA73EtHoFC5ECNoGY
X-Received: by 2002:a25:98c2:: with SMTP id m2mr41493610ybo.125.1600321797079;
        Wed, 16 Sep 2020 22:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600321797; cv=none;
        d=google.com; s=arc-20160816;
        b=qIqrh0lXuf3jD9UYABYYdWeV6xxcuiOXlO52x5fwZoUQmEHyVL3OMHBtYBte49iKWx
         bA0SCiCRw7qtJwPGuK35JNn3xl4PXijnzjALJR7e0Uzl0ZDjgMnMS66gBjCauI7e5GQH
         VOtqlh0BSvP7l5dVCLQH8F0WSnUJRzBtRMtugJP/MpIWVLCM+3VFDA74As3mGePVm5AZ
         NGIaQgUpUwcOOz6xJRLTAaAbR+3Bc9dMbPLOpm/7RLMN83eT9257+qhAcqpndJUbdpl2
         HXuaP+mrsF35fT0YynO7LthfnUrZFdCJuG/SYTw6cTfrNI7Yb0Sc4kppcFoJ07MgidIa
         axdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=DqDKoQwNkMgwNiII6koW7WAt+N02vTRA6ZvDd9Zl7gI=;
        b=Q8ol/LPydzl7K2ycNzPu0pmshb7Dm4XkfBt4fDBKZhFLWXcNMNth85cBMFH1VfoY+a
         Ggi9NeZQb3qVBcoqO1ypg3EbIN+WHQIcVdjOdKyHOVSlIJYvwilKDu4jw35HHiF1YjC2
         Iwe/9aeAoybWPv1Vw0+bNZKg8Wb5/yffhsHqBj/SxzT9argjkrI8ck1o9ozseFJ90gDL
         fP+CXd6wR48vde7dYZxocUWcdSXOwxcXq1d2RUPQ9mCKuc//JHsn2QmutSADO9XY/mUD
         Wvpd++DNME4ilDIfa88BFGgCZ7PRprHWcHYrw2XopohkVBi+PBSythw7DH9kL+z8hnCN
         Tr2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PuiXC/Bv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 77si4030814ybe.208.2020.09.16.22.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 22:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PuiXC/Bv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kImns-00023O-F1
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 01:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kIjaL-0007nk-2I
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 22:23:45 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:45758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kIjaI-0001dw-E0
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 22:23:44 -0400
Received: by mail-qk1-x743.google.com with SMTP id o5so698805qke.12
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2020 19:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=DqDKoQwNkMgwNiII6koW7WAt+N02vTRA6ZvDd9Zl7gI=;
 b=PuiXC/BveEHMe+X5F/tl0J5Yakvo9wiheevltu9UipbPOPOPuwMX4i/mhfcuiL/F2l
 bQ9tc7HylM7ElDosAfgxYyo0XGhn9BAe/W0Z9NUubGspk09Ddub0zVR4K+B5OujMQFAH
 1ufW8vkSkSzrRosp/6jMSYLBCvHl6IAJrPkaRIjCEyP81fCClzaQAGVoK/Dom5Lr0y5H
 v6zgjIlmDkYsKWpLv8an5ULWtqkn4/EvCZJVQoKqMyOGugqk1oQj7dULG7rSnsHw/K7u
 tvvgCMAWm8+xrStT20nY90DTLKBVcrUfMWO8sJYtSVjRHHbD+hasNj2PIo7YoLc/FFH5
 JgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DqDKoQwNkMgwNiII6koW7WAt+N02vTRA6ZvDd9Zl7gI=;
 b=P05j5Nk4sxLOGh39v4az95vM+iZc3X08MVip6Gn0kAHTunPFkGhc+8oq697n33RRpD
 2OZ5K4EVKonSfCpwPDC/qkZIsDCJNYK4fP2IGEGhul14IQThK+kRpS2EK36A15cuGWpP
 vhNoVr92bmDC3wprqq8/yyqev6gX4i13YqTVMHnaCqU37j3PVGuKUuBpuDmEUD7ipVHw
 NJanT6jJZiLrzW3zf6fapudsN9my+FIJcRrflhoP3xIq5FGkqnnFuWcFbAYgjkmnOlJ9
 L0KJFYSR6zvtJ0vGEhvQx5eWD4UE8MpBuY7YDt3+1it1OQeofPxIJtSEgFokqk72WTyt
 cdEw==
X-Gm-Message-State: AOAM531VtDqYmTAtoxXUh1QYzGCNbsQsvOWvhECP6Bj8eZClnkx4LrBW
 NAydkVJXiqNZjJ589digJBYy1A==
X-Received: by 2002:a37:9f57:: with SMTP id i84mr26250716qke.101.1600309420876; 
 Wed, 16 Sep 2020 19:23:40 -0700 (PDT)
Received: from master.hitronhub.home ([2607:fea8:e2a0:e950::661])
 by smtp.googlemail.com with ESMTPSA id r34sm21630784qtr.18.2020.09.16.19.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 19:23:40 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH] Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Date: Wed, 16 Sep 2020 22:23:38 -0400
Message-Id: <20200917022338.49056-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x743.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 17 Sep 2020 01:49:48 -0400
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6bdYhV0Xxetv

hw/watchdog: Implement generic watchdog device model as per ARM BSAv0.9
hw/arm/sbsa-ref : Include SBSA watchdog device in sbsa-ref platform

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/Kconfig                      |   1 +
 hw/arm/sbsa-ref.c                   |  23 ++
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/wdt_sbsa_gwdt.c         | 343 ++++++++++++++++++++++++++++
 include/hw/watchdog/wdt_sbsa_gwdt.h |  68 ++++++
 6 files changed, 440 insertions(+)
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
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index ac68b4640d0d..652079a12e37 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -40,6 +40,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/usb.h"
 #include "hw/char/pl011.h"
+#include "hw/watchdog/wdt_sbsa_gwdt.h"
 #include "net/net.h"
 #include "qom/object.h"
 
@@ -64,6 +65,9 @@ enum {
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
     SBSA_SECURE_EC,
+    SBSA_GWDT,
+    SBSA_GWDT_REFRESH,
+    SBSA_GWDT_CONTROL,
     SBSA_SMMU,
     SBSA_UART,
     SBSA_RTC,
@@ -111,6 +115,8 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
+    [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
+    [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
     [SBSA_UART] =               { 0x60000000, 0x00001000 },
     [SBSA_RTC] =                { 0x60010000, 0x00001000 },
     [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
@@ -140,6 +146,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_SECURE_UART_MM] = 9,
     [SBSA_AHCI] = 10,
     [SBSA_EHCI] = 11,
+    [SBSA_GWDT] = 12,
 };
 
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
@@ -454,6 +461,20 @@ static void create_rtc(const SBSAMachineState *sms)
     sysbus_create_simple("pl031", base, qdev_get_gpio_in(sms->gic, irq));
 }
 
+static void create_wdt(const SBSAMachineState *sms)
+{
+    hwaddr rbase = sbsa_ref_memmap[SBSA_GWDT_REFRESH].base;
+    hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
+    DeviceState *dev = qdev_new(TYPE_WDT_SBSA_GWDT);
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+    int irq = sbsa_ref_irqmap[SBSA_GWDT];
+
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, rbase);
+    sysbus_mmio_map(s, 1, cbase);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(sms->gic, irq));
+}
+
 static DeviceState *gpio_key_dev;
 static void sbsa_ref_powerdown_req(Notifier *n, void *opaque)
 {
@@ -737,6 +758,8 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_rtc(sms);
 
+    create_wdt(sms);
+
     create_gpio(sms);
 
     create_ahci(sms);
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
index 000000000000..eb3be0862cf1
--- /dev/null
+++ b/hw/watchdog/wdt_sbsa_gwdt.c
@@ -0,0 +1,343 @@
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
+        fprintf(stderr, "bad address in refresh frame read : 0x%x\n",
+                      (int)addr);
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
+        fprintf(stderr, "bad address in control frame read : 0x%x\n",
+                         (int)addr);
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
+        fprintf(stderr, "bad address in refresh frame write : 0x%x\n",
+                        (int)offset);
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
+        fprintf(stderr, "bad address in control frame write : 0x%x\n",
+                (int)offset);
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

