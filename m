Received: by 10.25.0.23 with SMTP id 23csp27215lfa;
        Fri, 2 Jun 2017 09:46:56 -0700 (PDT)
X-Received: by 10.237.33.220 with SMTP id m28mr9366628qtc.33.1496422016246;
        Fri, 02 Jun 2017 09:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496422016; cv=none;
        d=google.com; s=arc-20160816;
        b=pEKbZ1KuHC6G+5SEYDN5jJwzAu+TEiGV1tRmsWwojDJX1mP4O5EZ2/XSQ2S1J48CWc
         xUG0ecG6O5XY/Qtd8x4bwDvJ+xb7i5RMt7Ln6t8LY32iVAJkBhn14an7V5QSzIT3DMSo
         zsqnP9y+FXOtlN7qPKnCNpmSHDnBDGY7PQYSIja7kuGgUeTjOlo+Y+j3M+xM+G0BzeU+
         txvKcloDiAtiCau4scOkDkKC0dhtpbgvEaKf6by8fv3obKkjdwtEi+cTzML0ufzgGfnX
         jXUDYK68ZEwG7JU2ham/VLT7uWC16jsG+nLxQuQ6sJ/DIN80VtDX1EPz9U7QcA5vsARW
         Zw1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=1JdfibF9UQ3Pfh4DxON2GCBZJUN2Au70F+f0iErwkfQ=;
        b=wwed8QWPCtAJb/X+/nOTuTQJ+VCAG0zUsLk3F6A/GZuWtocBoFT1U5X+J6wdL6u9jX
         sbABb/2yF7CSOvIdsqs62ihm4BeTiUja+H4TUO8s6qGIuOi8fxvA6vodKDco3/p1leyR
         rwaQudHZCRVfMXsGDqcbCBMiznKtAnM3agvAFyGO1CsK3SdevgI0rspNuT4ljzy8e/Q2
         pqNhE5SX+KtX9PREfxATpi9+7nyoLOZ+T543xIlCyMbQoGX6lZY1ToHO/LNDSaJIFrkl
         U1sLeGtM6/g08x5t7pMssuuA/Pcw4rfcWCNtGLdEvFWBa4vGM+1Lqb03JVlXvCk91L9s
         ujag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 1si23074222qkn.263.2017.06.02.09.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 09:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGpiv-0002S8-HH
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 12:46:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZD-0001HP-Cu
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZC-0007kr-Bb
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53954)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dGpZC-0007k7-1S; Fri, 02 Jun 2017 12:36:50 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9568A23A25;
	Fri,  2 Jun 2017 16:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9568A23A25
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  2 Jun 2017 18:36:18 +0200
Message-Id: <20170602163618.6369-9-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170602163618.6369-1-krzk@kernel.org>
References: <20170602162857.6065-1-krzk@kernel.org>
	<20170602163618.6369-1-krzk@kernel.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v4 9/9] hw/misc/exynos4210_pmu: Add support for
 system poweroff
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EoFudu18fXxL

On all Exynos-based boards, the system powers down itself by driving
PS_HOLD signal low - eight bit in PS_HOLD_CONTROL register of PMU.
Handle writing to respective PMU register to fix power off failure:

    reboot: Power down
    Unable to poweroff system
    shutdown: 31 output lines suppressed due to ratelimiting
    Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000000

    CPU: 0 PID: 1 Comm: shutdown Not tainted 4.11.0-rc8 #846
    Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
    [<c031050c>] (unwind_backtrace) from [<c030ba6c>] (show_stack+0x10/0x14)
    [<c030ba6c>] (show_stack) from [<c05b2800>] (dump_stack+0x88/0x9c)
    [<c05b2800>] (dump_stack) from [<c03d3140>] (panic+0xdc/0x268)
    [<c03d3140>] (panic) from [<c0343614>] (do_exit+0xa90/0xab4)
    [<c0343614>] (do_exit) from [<c035f2dc>] (SyS_reboot+0x164/0x1d0)
    [<c035f2dc>] (SyS_reboot) from [<c0307c80>] (ret_fast_syscall+0x0/0x3c)

Additionally the initial value of PS_HOLD has to be changed because
recent Linux kernel (v4.12-rc1) uses regmap cache for this access.
When the register is kept at reset value, the kernel will not issue a
write to it.  Usually the bootloader sets the eight bit of PS_HOLD high
so mimic its existence here.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/exynos4210_pmu.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
index 63a8ccd35559..0d7b64c5b3a3 100644
--- a/hw/misc/exynos4210_pmu.c
+++ b/hw/misc/exynos4210_pmu.c
@@ -26,6 +26,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "sysemu/sysemu.h"
 
 #ifndef DEBUG_PMU
 #define DEBUG_PMU           0
@@ -350,7 +351,11 @@ static const Exynos4210PmuReg exynos4210_pmu_regs[] = {
     {"PAD_RETENTION_MMCB_OPTION", PAD_RETENTION_MMCB_OPTION, 0x00000000},
     {"PAD_RETENTION_EBIA_OPTION", PAD_RETENTION_EBIA_OPTION, 0x00000000},
     {"PAD_RETENTION_EBIB_OPTION", PAD_RETENTION_EBIB_OPTION, 0x00000000},
-    {"PS_HOLD_CONTROL", PS_HOLD_CONTROL, 0x00005200},
+    /*
+     * PS_HOLD_CONTROL: reset value and manually toggle high the DATA bit.
+     * DATA bit high, set usually by bootloader, keeps system on.
+     */
+    {"PS_HOLD_CONTROL", PS_HOLD_CONTROL, 0x00005200 | BIT(8)},
     {"XUSBXTI_CONFIGURATION", XUSBXTI_CONFIGURATION, 0x00000001},
     {"XUSBXTI_STATUS", XUSBXTI_STATUS, 0x00000001},
     {"XUSBXTI_DURATION", XUSBXTI_DURATION, 0xFFF00000},
@@ -397,6 +402,12 @@ typedef struct Exynos4210PmuState {
     uint32_t reg[PMU_NUM_OF_REGISTERS];
 } Exynos4210PmuState;
 
+static void exynos4210_pmu_poweroff(void)
+{
+    PRINT_DEBUG("QEMU PMU: PS_HOLD bit down, powering off\n");
+    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+}
+
 static uint64_t exynos4210_pmu_read(void *opaque, hwaddr offset,
                                     unsigned size)
 {
@@ -428,6 +439,13 @@ static void exynos4210_pmu_write(void *opaque, hwaddr offset,
             PRINT_DEBUG_EXTEND("%s <0x%04x> <- 0x%04x\n", reg_p->name,
                     (uint32_t)offset, (uint32_t)val);
             s->reg[i] = val;
+            if ((offset == PS_HOLD_CONTROL) && ((val & BIT(8)) == 0)) {
+                /*
+                 * We are interested only in setting data bit
+                 * of PS_HOLD_CONTROL register to indicate power off request.
+                 */
+                exynos4210_pmu_poweroff();
+            }
             return;
         }
         reg_p++;
-- 
2.9.3

