Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1453487lfq;
        Thu, 8 Oct 2020 08:40:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztOu06K0LXqawZn1oD8xflsvo67+s4uBJ7b8Y6W4TI9k1IFn8OqfX7w77PScjvdP0ApBwP
X-Received: by 2002:a25:dc13:: with SMTP id y19mr11776711ybe.405.1602171624954;
        Thu, 08 Oct 2020 08:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602171624; cv=none;
        d=google.com; s=arc-20160816;
        b=QXUEVa5Yfq+zvqc/Y1Cg7zs98yl+qtzGEGpGoiIhXbltOefYxHXRLqn4qzSFwy7esf
         ZANK/jwxcR7yqa8UNWeDfTdifNbI/E0rqR91JWlIKRxMWltPN0w04qaa+2kRBqDaNhJs
         IVfpCFIxLt63WURyLD4nQu9buM28CzZ0fO9H8UGifga/0oal2Psw0NdrOpbSaOESLcbB
         2QEld3GiuE8f0p7LKS8yl6biKEv0jRUvYloDYRYjfKH7DIrIkPAmeq8ojJAivU7PZ3vA
         JDQoq9eqKY6EVdqF8cJFeWGR2mrJxUbNshlhkvGv/EtvSOcmW7vLvCAmf3U3ivnRl17O
         grYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=dG7UJrG8UAY6Js3lT4bf3yGpOd/fIh8fJChauXg3fuU=;
        b=r8UIhxAltSDj2++BOlpdPurg8p+etNFSu9Ij3cvMtUKTI1rD2E82XgJPiVdS/PfXrn
         ekF3l4spDMv2Pt0cJTQERwSe/APuhJDYtM0Jb15MD2cGBj2b9YkpDpokYIO4Rg9mU64+
         sfvZoVAqMtovundK7AIgp3BunkVaMvc+ofyXkOd8gBf+yL6wrjs70MG4Z8vfsYRopscs
         OItO2SUFx1qgyt5dkDK5TLHSK4NlMhebQeUEOE+50BQwu8WSi0HWOCapoPm6FYMGVsRM
         X/hE7f9pf3oJHd7zZuwqdOXlx2dZOnq3qe0Smq9lTuN2/YkcPzncI6vVjAnT9tEwgyYa
         DcJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F7vkkyOP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4si4872316ybl.323.2020.10.08.08.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 08:40:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F7vkkyOP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQY1o-0006rg-AR
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 11:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kQXyz-0004Mk-EJ
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 11:37:29 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:35690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kQXyw-0000Vn-SM
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 11:37:29 -0400
Received: by mail-qt1-x843.google.com with SMTP id o21so5454987qtp.2
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 08:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dG7UJrG8UAY6Js3lT4bf3yGpOd/fIh8fJChauXg3fuU=;
 b=F7vkkyOPX2xImbdStGNnpFjV00Ilawa/kCLVuV4DzJDXeKAY8XZRAW7c/U6r4aI2AG
 sbR67hgHI3EIIhg8gkKFOgfpgJyGHPDDcrKpyo63TtMLWzxVfq69gcbqOBJdYmi32zmA
 QN2EOR465MhzUi8c5uX5P7CortnMKHF80PjAbblbBXSGxB9PwJglHnYYHKdmWCG0I6FR
 5hvk4HvCA31fYd3BMdPAe3xsGjr4rHzLjgapc5SAsbeMc06Ebee4A5qO85LYWP8bD1Lt
 FpkxWmv6hsDpc2NLRgP6q0G4rJtX9VyQmvXndjPldIfoeYAIP51ve/uaI7Eqca0QtveX
 4SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dG7UJrG8UAY6Js3lT4bf3yGpOd/fIh8fJChauXg3fuU=;
 b=UsJo6TDehCiQ0dJQM9rqRwhwNuS18zT7Gn96HpuSrNon4CG9VHsbWNpMJM1MuM1c+D
 nSXgBEoO+kcT703RyX0lKJvmGBZRrZoQoiWdHZqp1wI2HLzm9nFpIq/PiA0/RMpxiGno
 dliXeJkf+B0Pbd+0yQLqTaACbMNmj6OCqXJKYybld8hiRTLsTnIYrTEgYeTf4Z/dHAfo
 gHTNb1Lx8rodatpVlYLmJIv9y1Y3Q8R3wW1H4d4+XlOSvMfMTXqL6p+wXSONmQUAbUBp
 /imzjOfpWYXZgblz8y1dX0/ExSEvppioXuNmeRWPWyqcnm/SRiWZ+kLUL94i4HPYIHzu
 fcig==
X-Gm-Message-State: AOAM530uePNOgWA48kUERwzbzHVTWYDvZOhvZzUYIv7/b8HLf2ZPbNTu
 ks2Mp4gg+QA09lljEfdF5P7J0A==
X-Received: by 2002:ac8:4e4e:: with SMTP id e14mr9148002qtw.49.1602171443242; 
 Thu, 08 Oct 2020 08:37:23 -0700 (PDT)
Received: from master.ht.home ([2607:fea8:e2a0:e950::d884])
 by smtp.googlemail.com with ESMTPSA id t186sm4170533qkf.48.2020.10.08.08.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 08:37:22 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v4 2/2] hw/arm/sbsa-ref: add SBSA watchdog device
Date: Thu,  8 Oct 2020 11:37:18 -0400
Message-Id: <20201008153718.20143-3-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20201008153718.20143-1-shashi.mallela@linaro.org>
References: <20201008153718.20143-1-shashi.mallela@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::843;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qt1-x843.google.com
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
X-TUID: R4IN3DONFEc/

Included the newly implemented SBSA generic watchdog device model into
SBSA platform

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
---
 hw/arm/sbsa-ref.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9c3a893bedfd..2e0d161c56d7 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -30,6 +30,7 @@
 #include "exec/hwaddr.h"
 #include "kvm_arm.h"
 #include "hw/arm/boot.h"
+#include "hw/arm/fdt.h"
 #include "hw/block/flash.h"
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
@@ -40,6 +41,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/usb.h"
 #include "hw/char/pl011.h"
+#include "hw/watchdog/wdt_sbsa_gwdt.h"
 #include "net/net.h"
 #include "qom/object.h"
 
@@ -64,6 +66,9 @@ enum {
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
     SBSA_SECURE_EC,
+    SBSA_GWDT,
+    SBSA_GWDT_REFRESH,
+    SBSA_GWDT_CONTROL,
     SBSA_SMMU,
     SBSA_UART,
     SBSA_RTC,
@@ -104,6 +109,8 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
+    [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
+    [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
     [SBSA_UART] =               { 0x60000000, 0x00001000 },
     [SBSA_RTC] =                { 0x60010000, 0x00001000 },
     [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
@@ -133,6 +140,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_SECURE_UART_MM] = 9,
     [SBSA_AHCI] = 10,
     [SBSA_EHCI] = 11,
+    [SBSA_GWDT] = 12,
 };
 
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
@@ -141,6 +149,30 @@ static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
+static void create_wdt_fdt(SBSAMachineState *sms)
+{
+    char *nodename;
+    const char compat[] = "arm,sbsa-gwdt";
+
+    hwaddr rbase = sbsa_ref_memmap[SBSA_GWDT_REFRESH].base;
+    hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
+    int irq = sbsa_ref_irqmap[SBSA_GWDT];
+
+    nodename = g_strdup_printf("/watchdog@%" PRIx64, rbase);
+    qemu_fdt_add_subnode(sms->fdt, nodename);
+
+    qemu_fdt_setprop(sms->fdt, nodename, "compatible",
+                             compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
+                                 2, rbase, 2, SBSA_GWDT_RMMIO_SIZE,
+                                 2, cbase, 2, SBSA_GWDT_CMMIO_SIZE);
+    qemu_fdt_setprop_cells(sms->fdt, nodename, "interrupts",
+                                GIC_FDT_IRQ_TYPE_PPI, irq,
+                                GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop_cell(sms->fdt, nodename, "timeout-sec", 30);
+    g_free(nodename);
+}
+
 /*
  * Firmware on this machine only uses ACPI table to load OS, these limited
  * device tree nodes are just to let firmware know the info which varies from
@@ -219,6 +251,7 @@ static void create_fdt(SBSAMachineState *sms)
 
         g_free(nodename);
     }
+    create_wdt_fdt(sms);
 }
 
 #define SBSA_FLASH_SECTOR_SIZE (256 * KiB)
@@ -447,6 +480,20 @@ static void create_rtc(const SBSAMachineState *sms)
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
@@ -730,6 +777,8 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_rtc(sms);
 
+    create_wdt(sms);
+
     create_gpio(sms);
 
     create_ahci(sms);
-- 
2.18.4

