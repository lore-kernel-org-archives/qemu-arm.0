Received: by 10.223.150.237 with SMTP id u100csp4139908wrb;
        Fri, 10 Nov 2017 11:54:31 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZT7ScWaIELDcfGBLJ351ID8fX6BYy9ttspTYtO0pCr1qjfFcb79eUguDTYO1/a6JWz7vZ6
X-Received: by 10.129.155.130 with SMTP id s124mr1138721ywg.302.1510343671569;
        Fri, 10 Nov 2017 11:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510343671; cv=none;
        d=google.com; s=arc-20160816;
        b=s16ZHzElfkF9w7obl7i5pKL+ToDcT+VUPDige4tnXLQtx6fyoOotkpHRXqLGS6BOR1
         Dkvoti0E+9vXC6FftENVVYSCBkw+a3rAJXUvgHk08CV6DBEJlfEjEpuvewS87euzO24S
         gOyTfC3jbnKtrMaTbmEFbTTTNUBQyox3Ompg0ldGEMxcC7xLLz3j+1UHUlKgzU4ZAP9f
         se73esFKXgUsxkVgNuAqZxo1IxKDEgJvBNxiQhBM5f1+CP+SBUOU+uT+1z3ZPUaaMXAF
         wePzInDMPeq2fGaiZpox2/KTXuZSyRt6vUo6L6Y6V9OgZdjZ6HguwMia+iJuMAeNgZ6E
         70Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=1WJxFes6qCeE2SEUWYxFgDeT8yPJTnixP/FPXmUHqww=;
        b=RLsmx2q7Ii3rwsQodVYFALjzoHqPI/VBR02dvEuLlc/cUyOxIp8U7kqXhFGyh9Jqsr
         WSfuSnUqfNYuP7AejhxkE+jPmmd++23xcizq0YO1E/tObhGbha5ESRyrHHv0Qlejj7WE
         7IOF2nBAV9WaUm1pXtMZEuD+qwNTfi5DWQXWAg9gyXvDRR2ihH04ogMAdGrco2AI87iH
         D3BHI4uDByOz9K0ZxDmuojp9MhQDUbcukG5C2MqehYdvPV7Bcln8ZePonWcl+o8Cvb3c
         2sPcb8VLnzGChV9NtWIbrxCiA0k0YTFJzL5UmJSAsCMKz+Pis1vr4S5oQOOJWAF0c/sO
         tgEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=fq4k7iGi;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=al9aSeZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j76si2266186ybj.469.2017.11.10.11.54.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 11:54:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=fq4k7iGi;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=al9aSeZh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDFNn-0005k3-01
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 14:54:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFNA-0005Li-40
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFN6-0006Bl-BE
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:41847)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eDFN6-0006BQ-4p; Fri, 10 Nov 2017 14:53:48 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id AD487212AD;
	Fri, 10 Nov 2017 14:53:47 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 10 Nov 2017 14:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=1WJxFes6qCeE2S
	EUWYxFgDeT8yPJTnixP/FPXmUHqww=; b=fq4k7iGi+OTZUSvvWJ3nNqL1f49eb5
	rsh7DM8mifl5QkSP5Nfhese3IKy1CXCBIH3id5/8qmBrW7SjoNzCcOpWKorBG8Sz
	vUqTwWCr+qiYdgFpgVHwdDuC56pYWaJbv3rSc3XZYiBU/xhNUb7e6J/516Te9vQv
	0MGwgz7lq3pto=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=1WJxFes6qCeE2SEUWYxFgDeT8yPJTnixP/FPXmUHqww=; b=al9aSeZh
	cMCOAOGsP4uniVlE7Q/p9HBtT//S6aNm7spm8+bGL3E+i83fIOrt8qPcXNz7FsEc
	kolWScVLoyFO9M3KkYj2QpSOkdjrY/cIi1T0/ax6OfYMoWn9IKnfZcIhi3xUppZy
	H9Sue/kTqwaNzO0g/8NZVkJeVsdlNP7lpric/OTkwALEa5wlOKOrKvyjwqSjWKbG
	MLesdK08YTGzfT/OgW8fIhgu1dA85xpCPKqVse4yzKuRSwQEPRTkm/Nu19elOR8N
	rsPpGCHRXxRRHyhoWjEzYIzQ/BzCDH0Bv6nGoMbS6tPiUBcZp9ytXWLHaxnR0XYh
	AS5/Le0L2mKwCA==
X-ME-Sender: <xms:ywMGWsrJQ1gI1M1F_gpkwmt6CMgv61_Vw8fcetQj8VoDp0CQEcc3jQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 762BD24631;
	Fri, 10 Nov 2017 14:53:47 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 Nov 2017 14:53:46 -0500
Message-Id: <1510343626-25861-6-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510343626-25861-1-git-send-email-cota@braap.org>
References: <1510343626-25861-1-git-send-email-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-arm] [PATCH for 2.11 5/5] hw: add .min_cpus and .default_cpus
 fields to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9MttdD6ptoPx

max_cpus needs to be an upper bound on the number of vCPUs
initialized; otherwise TCG region initialization breaks.

Some boards initialize a hard-coded number of vCPUs, which is not
captured by the global max_cpus and therefore breaks TCG initialization.
Fix it by adding the .min_cpus field to machine_class.

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
 include/hw/boards.h     |  5 +++++
 hw/arm/exynos4_boards.c | 12 ++++--------
 hw/arm/raspi.c          |  2 ++
 hw/arm/xlnx-zcu102.c    |  2 ++
 vl.c                    | 21 ++++++++++++++++++---
 5 files changed, 31 insertions(+), 11 deletions(-)

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
index 190eb69..9631a53 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -189,6 +189,7 @@ static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
     mc->units_per_default_bus = 1;
     mc->ignore_memory_transaction_failures = true;
     mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
+    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
 }
 
 static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
@@ -246,6 +247,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
     mc->units_per_default_bus = 1;
     mc->ignore_memory_transaction_failures = true;
     mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
+    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
 }
 
 static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
diff --git a/vl.c b/vl.c
index ec29909..7372424 100644
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
@@ -4327,9 +4327,24 @@ int main(int argc, char **argv, char **envp)
         exit(0);
     }
 
+    /* machine_class: default to UP */
+    machine_class->max_cpus = machine_class->max_cpus ?: 1;
+    machine_class->min_cpus = machine_class->min_cpus ?: 1;
+    machine_class->default_cpus = machine_class->default_cpus ?: 1;
+
+    /* default to machine_class->default_cpus */
+    smp_cpus = machine_class->default_cpus;
+    max_cpus = machine_class->default_cpus;
+
     smp_parse(qemu_opts_find(qemu_find_opts("smp-opts"), NULL));
 
-    machine_class->max_cpus = machine_class->max_cpus ?: 1; /* Default to UP */
+    /* sanity-check smp_cpus and max_cpus against machine_class */
+    if (smp_cpus < machine_class->min_cpus) {
+        error_report("Invalid SMP CPUs %d. The min CPUs "
+                     "supported by machine '%s' is %d", smp_cpus,
+                     machine_class->name, machine_class->min_cpus);
+        exit(1);
+    }
     if (max_cpus > machine_class->max_cpus) {
         error_report("Invalid SMP CPUs %d. The max CPUs "
                      "supported by machine '%s' is %d", max_cpus,
-- 
2.7.4

