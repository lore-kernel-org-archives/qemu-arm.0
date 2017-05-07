Received: by 10.25.0.198 with SMTP id 189csp932086lfa;
        Sun, 7 May 2017 04:36:32 -0700 (PDT)
X-Received: by 10.55.40.226 with SMTP id o95mr19168513qko.312.1494156991997;
        Sun, 07 May 2017 04:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494156991; cv=none;
        d=google.com; s=arc-20160816;
        b=AkuNXI/wADx8DXSRbIAcw4OPA89oOV4l5sEZrVlX8lGs8FXy5XhckCA70ET8iIldgd
         ohRTCGJYJsZ3BSDCrTHjtbx+YzivFo2sU8HrrflzX6h60jC+kRU8ZEvHkbSbU0LgZMwM
         EZ+cI1eiJs3GwulLw8G+WV/+PbtrwCA7mtpwn11T5TJJgtbx4R8CAP/JtSgfQ6TgThRD
         0l+EJorGqwlkYfLy5KbRZxKQwHDCcHQ5hdlMSey+Up3gQh6WndsiSunNwTB+5yc1dgQm
         nz9LdE31EYXW/G9sELDtbyVFg/GZT7HKVNqDuF9hdon4AOAMlfGgKnnbzS7kJ8PS0rMJ
         aQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=zB6Qg9BxxafzF1aJu2qJ2rkaM2tcH+ZpJEStp/X2fa4=;
        b=x0UUlygzT3xCpfWXn3NKohFzq6rCDln+ctfqtu2c6u2Hi8AObkiYh2h20gqZqk0cfr
         VPp1huSVNzE/Oq6pfUTlK8qFy8TmGsaBMZyTDpzLs2I4ElH9VEgGUQEDsMR0KgOHk8S2
         k2+/ICIsxjZzTouKxjZX1dvhgarO/HQ2eSFzkCabtEifCEXGRPHav9biyx0UpF2K9Prn
         pkXESLc7zZVHHageSfi3282kJyCIbZppUfOrzpf3QiH1slyAejKxEhbbe0rD1PGXSp+t
         Jbx2tFibVquz1G/BhsBUm5V4WeV07aAmCcn97GdnoZunxkoQOG0Z49SIraYnRpJEBD20
         N9gg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m17si9496530qki.34.2017.05.07.04.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 May 2017 04:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7KUH-0007zv-2b
	for alex.bennee@linaro.org; Sun, 07 May 2017 07:36:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7KTn-0007gx-O0
	for qemu-arm@nongnu.org; Sun, 07 May 2017 07:36:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7KTm-0004X2-Kw
	for qemu-arm@nongnu.org; Sun, 07 May 2017 07:35:59 -0400
Received: from mail.kernel.org ([198.145.29.136]:56278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1d7KTm-0004WI-D0; Sun, 07 May 2017 07:35:58 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 9F7F420392;
	Sun,  7 May 2017 11:35:56 +0000 (UTC)
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9348220373;
	Sun,  7 May 2017 11:35:54 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun,  7 May 2017 13:35:40 +0200
Message-Id: <20170507113540.8687-4-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170507113540.8687-1-krzk@kernel.org>
References: <20170507113540.8687-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH 3/3] hw/arm/exynos: Add support for system
 poweroff
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jpaLQU0dYfmg

On all Exynos-based boards, the system powers down itself by driving
PS_HOLD signal low.  Handle writing to respective PMU register to fix
power off failure:

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

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/misc/exynos4210_pmu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
index 63a8ccd35559..2046e6313f10 100644
--- a/hw/misc/exynos4210_pmu.c
+++ b/hw/misc/exynos4210_pmu.c
@@ -26,6 +26,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "sysemu/sysemu.h"
 
 #ifndef DEBUG_PMU
 #define DEBUG_PMU           0
@@ -397,6 +398,12 @@ typedef struct Exynos4210PmuState {
     uint32_t reg[PMU_NUM_OF_REGISTERS];
 } Exynos4210PmuState;
 
+static void exynos4210_pmu_poweroff(void)
+{
+    PRINT_DEBUG("QEMU PMU: PS_HOLD bit down, powering off\n");
+    qemu_system_shutdown_request();
+}
+
 static uint64_t exynos4210_pmu_read(void *opaque, hwaddr offset,
                                     unsigned size)
 {
@@ -428,6 +435,13 @@ static void exynos4210_pmu_write(void *opaque, hwaddr offset,
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

