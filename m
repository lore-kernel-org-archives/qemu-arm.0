Received: by 10.182.105.169 with SMTP id gn9csp1007792obb;
        Sun, 8 Nov 2015 23:12:31 -0800 (PST)
X-Received: by 10.140.170.131 with SMTP id q125mr10708235qhq.84.1447053151858;
        Sun, 08 Nov 2015 23:12:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g52si499893qge.104.2015.11.08.23.12.31
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 23:12:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvgcx-0001hc-Gj
	for alex.bennee@linaro.org; Mon, 09 Nov 2015 02:12:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvgbY-0007Yc-Gz
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 02:11:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvgbX-0008Fc-8K
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 02:11:04 -0500
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:32787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZvgbU-0008EZ-If; Mon, 09 Nov 2015 02:11:00 -0500
Received: by pabfh17 with SMTP id fh17so190159813pab.0;
	Sun, 08 Nov 2015 23:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=UClpTEurHTbvqDxMo+hJX5vtC5WuH93J2Kg1r67ai1c=;
	b=LTl1Mi1eXJmGtF9MsKV2btUjkB9+LOzZaCLG98UH8mNwTuaPt1r3AVXrKwlYWpdsBB
	xYx93WSxBDhVSdZeSZvIrkR8BbDRL7uCOGqUI3zNhmRMh2ZcaNhd16RjzTQmOWbtcKZK
	43SwA/qL0r9UqjoqR5117zyXFWe23nnsZSW76PS+uFAk0wxhdPoQSuQXCAstYJ/o9b6K
	tuhcSACPq+bFSLpyXijloqseQnW5Oh7Zds79YFMgbJAbL2UWXrjIaWyjqddMJx+8SsoF
	kwnBoRa2yBV2ZnoKZErS1tqPh0IWxWLXRFlXidmDBMT0L8oOojD/al/yrBgy3XpA1LIh
	haRg==
X-Received: by 10.68.244.199 with SMTP id xi7mr15008887pbc.87.1447053060101;
	Sun, 08 Nov 2015 23:11:00 -0800 (PST)
Received: from localhost.localdomain (mobile-166-171-248-219.mycingular.net.
	[166.171.248.219]) by smtp.gmail.com with ESMTPSA id
	vl1sm14294818pbc.31.2015.11.08.23.10.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 23:10:59 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 23:10:34 -0800
Message-Id: <0fd0d12f0fa666c86616c89447861a70dbe27312.1447007690.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447007690.git.crosthwaite.peter@gmail.com>
References: <cover.1447007690.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1447007690.git.crosthwaite.peter@gmail.com>
References: <cover.1447007690.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::234
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, linux@roeck-us.net,
	robh@kernel.org
Subject: [Qemu-arm] [PATCH for-2.5 v4 3/3] arm: highbank: Implement PSCI and
	dummy monitor
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PkcSSB1fIo0A

Firstly, enable monitor mode and PSCI, both of which are features of
this board.

In addition to PSCI, this board also uses SMC for cache maintenance
ops. This means we need a secure monitor to catch these and nop them.
Use the ARM boot board-setup feature to implement this. The SMC trap
implements the needed nop while all other traps will pen the CPU.

As a KVM CPU cannot run in secure mode, do not do the board-setup if
not running TCG. Report a warning explaining the limitation in this
case.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
Changed since v3:
Commit message typos.
Changed tcg_enabled() check to kvm_enabled()
Reworded error_report() message.
clarified non-smc trap behaviour in commit message
Changed since v2:
Change to spinlock/movs trap table and drop fallthrough (PMM review)
Do not do board-setup if KVM is enabled. Issue a warning.
Changed since v1:
fallthrough all of trap table to nop implementation
use movw for table address
leave loader at 0
Move MVBAR (and blob to non-zero)
Split nop implementation from MVBAR setup
set secure boot for board
implement NS switch in blob
Changed since RFC:
Use bootloader callback to load blob.
Change "firmware" to "board-setup" for consistency.
Tweak commit message.

 hw/arm/highbank.c | 70 +++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index f2e248b..85ae69e 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -22,6 +22,7 @@
 #include "hw/devices.h"
 #include "hw/loader.h"
 #include "net/net.h"
+#include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "sysemu/block-backend.h"
@@ -32,10 +33,52 @@
 #define SMP_BOOT_REG            0x40
 #define MPCORE_PERIPHBASE       0xfff10000
 
+#define MVBAR_ADDR              0x200
+
 #define NIRQ_GIC                160
 
 /* Board init.  */
 
+/* MVBAR_ADDR is limited by precision of movw */
+
+QEMU_BUILD_BUG_ON(MVBAR_ADDR >= (1 << 16));
+
+#define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
+                        extract32((x), 12,  4) << 16)
+
+static void hb_write_board_setup(ARMCPU *cpu,
+                                 const struct arm_boot_info *info)
+{
+    int n;
+    uint32_t board_setup_blob[] = {
+        /* MVBAR_ADDR */
+        /* Default unimplemented and unused vectors to spin. Makes it
+         * easier to debug (as opposed to the CPU running away).
+         */
+        0xeafffffe, /* notused1: b notused */
+        0xeafffffe, /* notused2: b notused */
+        0xe1b0f00e, /* smc: movs pc, lr - exception return */
+        0xeafffffe, /* prefetch_abort: b prefetch_abort */
+        0xeafffffe, /* data_abort: b data_abort */
+        0xeafffffe, /* notused3: b notused3 */
+        0xeafffffe, /* irq: b irq */
+        0xeafffffe, /* fiq: b fiq */
+#define BOARD_SETUP_ADDR (MVBAR_ADDR + 8 * sizeof(uint32_t))
+        0xe3000000 + ARMV7_IMM16(MVBAR_ADDR), /* movw r0, MVBAR_ADDR */
+        0xee0c0f30, /* mcr p15, 0, r0, c12, c0, 1 - set MVBAR */
+        0xee110f11, /* mrc p15, 0, r0, c1 , c1, 0 - get SCR */
+        0xe3810001, /* orr r0, #1 - set NS */
+        0xee010f11, /* mcr p15, 0, r0, c1 , c1, 0 - set SCR */
+        0xe1600070, /* smc - go to monitor mode to flush NS change */
+        0xe12fff1e, /* bx lr - return to caller */
+    };
+    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
+        board_setup_blob[n] = tswap32(board_setup_blob[n]);
+    }
+    rom_add_blob_fixed("board-setup", board_setup_blob,
+                       sizeof(board_setup_blob), MVBAR_ADDR);
+}
+
 static void hb_write_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     int n;
@@ -241,16 +284,13 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         cpuobj = object_new(object_class_get_name(oc));
         cpu = ARM_CPU(cpuobj);
 
-        /* By default A9 and A15 CPUs have EL3 enabled.  This board does not
-         * currently support EL3 so the CPU EL3 property is disabled before
-         * realization.
-         */
-        if (object_property_find(cpuobj, "has_el3", NULL)) {
-            object_property_set_bool(cpuobj, false, "has_el3", &err);
-            if (err) {
-                error_report_err(err);
-                exit(1);
-            }
+        object_property_set_int(cpuobj, QEMU_PSCI_CONDUIT_SMC,
+                                "psci-conduit", &error_abort);
+
+        if (n) {
+            /* Secondary CPUs start in PSCI powered-down state */
+            object_property_set_bool(cpuobj, true,
+                                     "start-powered-off", &error_abort);
         }
 
         if (object_property_find(cpuobj, "reset-cbar", NULL)) {
@@ -371,6 +411,16 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     highbank_binfo.loader_start = 0;
     highbank_binfo.write_secondary_boot = hb_write_secondary;
     highbank_binfo.secondary_cpu_reset_hook = hb_reset_secondary;
+    if (!kvm_enabled()) {
+        highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
+        highbank_binfo.write_board_setup = hb_write_board_setup;
+        highbank_binfo.secure_board_setup = true;
+    } else {
+        error_report("WARNING: cannot load built-in Monitor support "
+                     "if KVM is enabled. Some guests (such as Linux) "
+                     "may not boot.");
+    }
+
     arm_load_kernel(ARM_CPU(first_cpu), &highbank_binfo);
 }
 
-- 
1.9.1

