Received: by 10.223.150.237 with SMTP id u100csp159119wrb;
        Fri, 3 Nov 2017 11:49:17 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+T8jqybYa8S8DpxwEGvK1eF34mNWIoJL2kR+lJacsaarQzxU86ot3KXJPdAewjcX9U2PN3I
X-Received: by 10.37.186.200 with SMTP id a8mr5063444ybk.56.1509734957212;
        Fri, 03 Nov 2017 11:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509734957; cv=none;
        d=google.com; s=arc-20160816;
        b=TDxf0jLHp0vSRNpc/E/uVWyxGWK/Fmy4n5zoDIqHbU5d1fTRd/y8lr3vLglvaIJNWy
         70gMAbkVNpGngPTeO3OQDPJLy/MktyBx3opYsa+lEvPdHu4DcBKjC/Pl4ltRKYiEbu3j
         snAYWNWDyJ7ZfVPNHQ9yVxxKrbVyw9Z4z1v0DcN8b3H+F1qaGuuucNC1WC2cpGWkFzSQ
         LZvjlYbyL1PWDPZUisxLE/m8DiuNyOGuL8z58LF5i0VrgDbq/RQGCQChGfuFCnt6bk35
         dgI7sxzZ5WCJgnP3X7MilgFDune9Q/5/KwKFnll2pypcwcYTEt2RpxrhxHN3+Qrg7L1d
         sWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=R35HrC6qbDhAOdRUlj9bkRNpYbO4HDZFssnO7YAZ6QY=;
        b=aiFUoIQRBrbRS5391lIbf51qn8F2l0/9iQrXAFUstkQewzVIOnkiykm56rWVfQexes
         lJHjqkl9mDrfJLsleAdf5h9H32qJfUFp0vNBO7dzN0BN8uz2tlD9EuXglDn7ldZjmXzf
         V/pBCN78XFpIkR4QC0zNryiHd1nXMaQK3eF9lMDQ6tLVkHevvhzXxrf8LEfb/pjjX/aU
         +PTJytQ1UAUVxv4LpUDEaYoQ6eXY11VIUFcIXCHX8/A0Fwf8wzTMRfPfeZzFqF34ShSx
         7aIPFevqIvPCNtunEgV1E+ipo6esMDHo7I7YRHD3QF1O4c9+myfefhzNQ8uWIvTj9Kie
         6aGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=XiE8/g+z;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=NPec+E0d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g189si1545598ybg.9.2017.11.03.11.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 11:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=XiE8/g+z;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=NPec+E0d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAh1o-0000TM-LE
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 14:49:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eAh0J-0007xP-3R
	for qemu-devel@nongnu.org; Fri, 03 Nov 2017 14:47:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eAh0H-0005zb-PE
	for qemu-devel@nongnu.org; Fri, 03 Nov 2017 14:47:43 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:59897)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eAh0B-0005sw-Tt; Fri, 03 Nov 2017 14:47:36 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id ED5872068B;
	Fri,  3 Nov 2017 14:47:33 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 03 Nov 2017 14:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=R35HrC6qbDhAOdRUlj9bkRNpYbO4HDZFssnO7Y
	AZ6QY=; b=XiE8/g+zoPhv2KoSQa4aOCoAIdEME4i90rJunSgf9nGfQQd0U2qAEc
	gal3ijnykZqmoZtZbcsY0mSIBSU7j62viq0US+3arPu/z9tKAcI1GMOitKGpqq5S
	NYJPQX35YiqA8htXgc4bYArYUPLYrEAqkKYFUo3PyQ/zzuvQ9O9wk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=R35HrC6qbDhAOdRUl
	j9bkRNpYbO4HDZFssnO7YAZ6QY=; b=NPec+E0dWSLt/eRZV9iqV/TaHg5ORsodS
	fX8UuXbXBhykYAy6NfADY2iW1XbioxLWO1LyINZ8SK/UBNzH++PO6c/LyuSdXTv7
	7R49B+bUunYCd1HV5d6NsMZXpAhGxyqZN6LTyQ+m3zYCjOUMlcXHlMnjiPuARHec
	CaW9VAD5Hr0Ttrfs97ySOFQsix6cT4df7yu1TOVgKtfOtB2EeLAy7Go9wjdSVueQ
	yEn/wKbFYYleFKhZ3IFId9gbdV0rsL8axpJEub4Pc0aGgN/0fTwVH3YYQmj5j6Si
	Rh1GXUEheXOWrZ/0q4aQhRJuof6eRxQQMxC3IyygSTZbTYL37ZZjg==
X-ME-Sender: <xms:xbn8WWhzHWtKgqGxDpS3XffbiYQdaNtFJPc-sZKg5ZeZT53NYI37bg>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id AD63F7E17C;
	Fri,  3 Nov 2017 14:47:33 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Fri,  3 Nov 2017 14:47:33 -0400
Message-Id: <1509734853-3014-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-devel] [PATCH] hw: add .min_cpus and .default_cpus fields to
 machine_class
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: strMlpp+5Fyr

max_cpus needs to be an upper bound on the number of vCPUs
initialized; otherwise TCG region initialization breaks.

Some boards initialize a hard-coded number of vCPUs, which is not
captured by the global max_cpus. Fix it by adding the .min_cpus
field to machine_class.

This commit also changes some user-facing behaviour: we now die if
-smp is below this hard-coded vCPU minimum instead of silently
ignoring the passed -smp value (sometimes announcing this by printing
a warning). However, the introduction of .default_cpus lessens the
likelihood that users will notice this: if -smp isn't set, we now
assign the value in .default_cpus to both smp_cpus and max_cpus. IOW,
if a user does not set -smp, they always get a correct number of vCPUs.

This change fixes 3468b59 ("tcg: enable multiple TCG contexts in
softmmu", 2017-10-24), which broke TCG initialization for some
ARM boards.

Fixes: 3468b59e18b179bc63c7ce934de912dfa9596122
Reported-by: Thomas Huth <thuth@redhat.com>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 hw/arm/exynos4_boards.c | 12 ++++--------
 hw/arm/raspi.c          |  2 ++
 hw/arm/xlnx-zcu102.c    |  5 +++++
 include/hw/boards.h     |  5 +++++
 vl.c                    | 28 +++++++++++++++++++++++++---
 5 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index f1441ec..750162c 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -27,7 +27,6 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/qtest.h"
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "hw/arm/arm.h"
@@ -129,13 +128,6 @@ exynos4_boards_init_common(MachineState *machine,
                            Exynos4BoardType board_type)
 {
     Exynos4BoardState *s = g_new(Exynos4BoardState, 1);
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
-
-    if (smp_cpus != EXYNOS4210_NCPUS && !qtest_enabled()) {
-        error_report("%s board supports only %d CPU cores, ignoring smp_cpus"
-                     " value",
-                     mc->name, EXYNOS4210_NCPUS);
-    }
 
     exynos4_board_binfo.ram_size = exynos4_board_ram_size[board_type];
     exynos4_board_binfo.board_id = exynos4_board_id[board_type];
@@ -189,6 +181,8 @@ static void nuri_class_init(ObjectClass *oc, void *data)
     mc->desc = "Samsung NURI board (Exynos4210)";
     mc->init = nuri_init;
     mc->max_cpus = EXYNOS4210_NCPUS;
+    mc->min_cpus = EXYNOS4210_NCPUS;
+    mc->default_cpus = EXYNOS4210_NCPUS;
     mc->ignore_memory_transaction_failures = true;
 }
 
@@ -205,6 +199,8 @@ static void smdkc210_class_init(ObjectClass *oc, void *data)
     mc->desc = "Samsung SMDKC210 board (Exynos4210)";
     mc->init = smdkc210_init;
     mc->max_cpus = EXYNOS4210_NCPUS;
+    mc->min_cpus = EXYNOS4210_NCPUS;
+    mc->default_cpus = EXYNOS4210_NCPUS;
     mc->ignore_memory_transaction_failures = true;
 }
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 5941c9f..cd5fa8c 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -167,6 +167,8 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
     mc->max_cpus = BCM2836_NCPUS;
+    mc->min_cpus = BCM2836_NCPUS;
+    mc->default_cpus = BCM2836_NCPUS;
     mc->default_ram_size = 1024 * 1024 * 1024;
     mc->ignore_memory_transaction_failures = true;
 };
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index e2d15a1..395d1b5 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -185,6 +185,9 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_IDE;
     mc->units_per_default_bus = 1;
     mc->ignore_memory_transaction_failures = true;
+    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
+    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
+    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
 }
 
 static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
@@ -241,6 +244,8 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
     mc->units_per_default_bus = 1;
     mc->ignore_memory_transaction_failures = true;
     mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
+    mc->min_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
+    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
 }
 
 static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 191a5b3..62f160e 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -102,6 +102,9 @@ typedef struct {
 
 /**
  * MachineClass:
+ * @max_cpus: maximum number of CPUs supported. Default: 1
+ * @min_cpus: minimum number of CPUs supported. Default: 1
+ * @default_cpus: number of CPUs instantiated if none are specified. Default: 1
  * @get_hotplug_handler: this function is called during bus-less
  *    device hotplug. If defined it returns pointer to an instance
  *    of HotplugHandler object, which handles hotplug operation
@@ -167,6 +170,8 @@ struct MachineClass {
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
     int max_cpus;
+    int min_cpus;
+    int default_cpus;
     unsigned int no_serial:1,
         no_parallel:1,
         use_virtcon:1,
diff --git a/vl.c b/vl.c
index ec29909..3ca5ee8 100644
--- a/vl.c
+++ b/vl.c
@@ -160,8 +160,8 @@ Chardev *virtcon_hds[MAX_VIRTIO_CONSOLES];
 Chardev *sclp_hds[MAX_SCLP_CONSOLES];
 int win2k_install_hack = 0;
 int singlestep = 0;
-int smp_cpus = 1;
-unsigned int max_cpus = 1;
+int smp_cpus;
+unsigned int max_cpus;
 int smp_cores = 1;
 int smp_threads = 1;
 int acpi_enabled = 1;
@@ -4330,12 +4330,34 @@ int main(int argc, char **argv, char **envp)
     smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
 
     machine_class->max_cpus = machine_class->max_cpus ?: 1; /* Default to UP */
+    machine_class->min_cpus = machine_class->min_cpus ?: 1;
+    machine_class->default_cpus = machine_class->default_cpus ?: 1;
+
+    /* if -smp is not set, default to mc->default_cpus */
+    if (!smp_cpus) {
+        smp_cpus = machine_class->default_cpus;
+        max_cpus = machine_class->default_cpus;
+    }
+
+    /* sanity-check smp_cpus and max_cpus */
+    if (smp_cpus < machine_class->min_cpus) {
+        error_report("Invalid SMP CPUs %d. The min CPUs "
+                     "supported by machine '%s' is %d", smp_cpus,
+                     machine_class->name, machine_class->min_cpus);
+        exit(1);
+    }
     if (max_cpus > machine_class->max_cpus) {
-        error_report("Invalid SMP CPUs %d. The max CPUs "
+        error_report("Invalid max SMP CPUs %d. The max CPUs "
                      "supported by machine '%s' is %d", max_cpus,
                      machine_class->name, machine_class->max_cpus);
         exit(1);
     }
+    if (max_cpus < machine_class->min_cpus) {
+        error_report("Invalid max SMP CPUs %d. The min CPUs "
+                     "supported by machine '%s' is %d", max_cpus,
+                     machine_class->name, machine_class->min_cpus);
+        exit(1);
+    }
 
     /*
      * Get the default machine options from the machine if it is not already
-- 
2.7.4

