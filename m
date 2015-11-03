Received: by 10.182.105.169 with SMTP id gn9csp1646887obb;
        Mon, 2 Nov 2015 20:31:42 -0800 (PST)
X-Received: by 10.140.238.204 with SMTP id j195mr36133473qhc.53.1446525102342;
        Mon, 02 Nov 2015 20:31:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l136si21213600qhl.14.2015.11.02.20.31.42
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 02 Nov 2015 20:31:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZtTG1-0003Fm-Vr
	for alex.bennee@linaro.org; Mon, 02 Nov 2015 23:31:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZtTFO-0002MQ-23
	for qemu-devel@nongnu.org; Mon, 02 Nov 2015 23:31:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZtTFM-0000Hi-Tk
	for qemu-devel@nongnu.org; Mon, 02 Nov 2015 23:31:01 -0500
Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233]:33127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZtTFM-0000HW-Je; Mon, 02 Nov 2015 23:31:00 -0500
Received: by pabfh17 with SMTP id fh17so6860026pab.0;
	Mon, 02 Nov 2015 20:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RtR6K80+GmA9lAXOH4Fn8/Y+KvX9HN5hYifyku7TKo8=;
	b=ncxV/rf2W6ZGRe9hIX0TisAQL3b604yiKXpsjoY6OWSKSVNy/Af/OsLflgp31rCtpq
	D7T75EdUkF8udvWBequYLs8wTUICRLYh+4GSSHMxQ87ExgobptuEJtKY0AYvXl2MieLQ
	+yRMZNboqvWmhB+v2Rvx75+3AWBrgHObgnauME9O62Mv4aJhD4ywvnPpXDOFQnNzlmHC
	Ofxumy7Tbnt2VGRvulUATnUW7bFm2uK7KVwBQGgBBBJ53VYaEJp/RKhSdHV7ZcVKK8va
	nfwmf9I+d3dgHrLaWyqPlX0hHIiIZZgEKmUf3fK8NlOiX7Ez3qGcboBSYwjfesic0S5H
	9m0Q==
X-Received: by 10.68.217.73 with SMTP id ow9mr31502357pbc.167.1446525060221;
	Mon, 02 Nov 2015 20:31:00 -0800 (PST)
Received: from localhost.localdomain (mobile-166-171-251-070.mycingular.net.
	[166.171.251.70]) by smtp.gmail.com with ESMTPSA id
	ey2sm26830137pbd.77.2015.11.02.20.30.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Nov 2015 20:30:59 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Nov 2015 20:30:37 -0800
Message-Id: <7c00b99113acb1bf62e78f7a71a14eb3b9221ca3.1446428067.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446428067.git.crosthwaite.peter@gmail.com>
References: <cover.1446428067.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1446428067.git.crosthwaite.peter@gmail.com>
References: <cover.1446428067.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::233
Cc: robh@kernel.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org, linux@roeck-us.net, peter.maydell@linaro.org
Subject: [Qemu-devel] [PATCH for-2.5 v3 3/3] arm: highbank: Implement PSCI
	and dummy monitor
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Hw4ATQ/wCtkK

Firstly, enable monitor mode and PSCI, both are which are features of
this board.

In addition to PSCI, this board also uses SMC for cache maintainence
ops. This means we need a secure monitor to catch these and nop them.
Use the ARM boot board-setup feature to implement this. All traps to
monitor mode implement the nop.

As a KVM CPU cannot run in secure mode, do not do the board-setup if
not running TCG. Report a warning explaining the limitation is this
case.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
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

 hw/arm/highbank.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index f2e248b..30e8054 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -32,10 +32,52 @@
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
@@ -241,16 +283,13 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
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
@@ -371,6 +410,16 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     highbank_binfo.loader_start = 0;
     highbank_binfo.write_secondary_boot = hb_write_secondary;
     highbank_binfo.secondary_cpu_reset_hook = hb_reset_secondary;
+    if (tcg_enabled()) {
+        highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
+        highbank_binfo.write_board_setup = hb_write_board_setup;
+        highbank_binfo.secure_board_setup = true;
+    } else {
+        error_report("WARNING: TCG unavailable - "
+                     "unable to load built-in Monitor support.\n"
+                     "Some guests (such as Linux) may not boot\n");
+    }
+
     arm_load_kernel(ARM_CPU(first_cpu), &highbank_binfo);
 }
 
-- 
1.9.1

