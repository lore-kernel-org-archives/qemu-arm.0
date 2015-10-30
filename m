Received: by 10.182.105.169 with SMTP id gn9csp909443obb;
        Thu, 29 Oct 2015 22:36:24 -0700 (PDT)
X-Received: by 10.140.104.104 with SMTP id z95mr7323020qge.75.1446183382384;
        Thu, 29 Oct 2015 22:36:22 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l89si4528956qki.93.2015.10.29.22.36.22
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 29 Oct 2015 22:36:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zs2MP-0006U9-Vx
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 01:36:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LU-0005Lf-NJ
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zs2LT-0002QZ-Jy
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 01:35:24 -0400
Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236]:35434)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Zs2LT-0002QG-CT; Fri, 30 Oct 2015 01:35:23 -0400
Received: by pasz6 with SMTP id z6so63140305pas.2;
	Thu, 29 Oct 2015 22:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=iCbs1GsuKCxVrSh5KNerZ3P2+uJu3bBHeqSL0E2QV6k=;
	b=WNTjuosi3hJLmZE7Qc5eR3P9v4h8Y1LiUp1lVxlY31aCzJ6QCPzYPUhSX6fdAI/Pvv
	JbIH2zt3V38wayDtbY2unPHaBUyiQXsJG+WT/JtiSfTfuncvPY20eblRUi0BdBdZVZLt
	qUZhNzo6r54iX5bkWGJ+Op6QkOuo42RqbK+WAyen8M6bYVewGEyCHpBzew6nWoAdnXWN
	LSvCYtbILrOl5FdYm6ucK/OZOnajX57S+qNY7bL00eIQK11hWkK5RmcYymkudAZOeuEq
	nO8M6Hj6I9dynh5KHVqJiykAYdtnjIzW942+Cm/ioR8togiS/dEAWelkzRCQofRzsFwm
	fcZw==
X-Received: by 10.68.139.2 with SMTP id qu2mr6433262pbb.135.1446183322974;
	Thu, 29 Oct 2015 22:35:22 -0700 (PDT)
Received: from pcrost-box.hsd1.ca.comcast.net
	(c-24-130-130-137.hsd1.ca.comcast.net. [24.130.130.137])
	by smtp.gmail.com with ESMTPSA id
	yi8sm5604313pab.22.2015.10.29.22.35.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Oct 2015 22:35:22 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Oct 2015 22:35:00 -0700
Message-Id: <f017d14547e267df4421a64533230297a2225fed.1446182614.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::236
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org, linux@roeck-us.net, robh@kernel.org
Subject: [Qemu-devel] [PATCH v2 5/5] arm: highbank: Implement PSCI and dummy
	monitor
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
X-TUID: YfvfPz/xIp8e

Firstly, enable monitor mode and PSCI, both are which are features of
this board.

In addition to PSCI, this board also uses SMC for cache maintainence
ops. This means we need a secure monitor to catch these and nop them.
Use the ARM boot board-setup feature to implement this. All traps to
monitor mode implement the nop.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
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

 hw/arm/highbank.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 56 insertions(+), 10 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index be04b27..f3578a3 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -32,10 +32,55 @@
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
+        0xe320f000, /* nop */
+        0xe320f000, /* nop */
+        0xe320f000, /* nop */
+        0xe320f000, /* nop */
+        0xe320f000, /* nop */
+        0xe320f000, /* nop */
+        0xe320f000, /* nop */
+        0xe320f000, /* nop */
+#define ERET_ADDR (MVBAR_ADDR + 8 * sizeof(uint32_t))
+        0xe58fe008, /* save lr */
+        0xe8dfc000, /* exception return */
+        0,
+        0,
+        0, /* exception return link will end up here */
+#define BOARD_SETUP_ADDR (ERET_ADDR + 5 * sizeof(uint32_t))
+        0xe3000000 + ARMV7_IMM16(MVBAR_ADDR), /* movw r0, MVBAR_ADDR */
+        0xee0c0f30, /* mcr p15, 0, r0, c12, c0, 1 - set mvbar */
+        0xee110f11, /* mrc p15, 0, r0, c1 , c1, 0 - get scr */
+        0xe3810001, /* orr r0, #1 - set NS */
+        0xee010f11, /* mcr p15, 0, r0, c1 , c1, 0 - set scr */
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
@@ -248,16 +293,13 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
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
@@ -378,6 +420,10 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     highbank_binfo.loader_start = 0;
     highbank_binfo.write_secondary_boot = hb_write_secondary;
     highbank_binfo.secondary_cpu_reset_hook = hb_reset_secondary;
+    highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
+    highbank_binfo.write_board_setup = hb_write_board_setup;
+    highbank_binfo.secure_board_setup = true;
+
     arm_load_kernel(ARM_CPU(first_cpu), &highbank_binfo);
 }
 
-- 
1.9.1

