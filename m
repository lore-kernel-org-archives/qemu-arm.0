Received: by 10.25.0.198 with SMTP id 189csp663709lfa;
        Sat, 6 May 2017 08:26:32 -0700 (PDT)
X-Received: by 10.200.48.221 with SMTP id w29mr11360754qta.54.1494084392864;
        Sat, 06 May 2017 08:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494084392; cv=none;
        d=google.com; s=arc-20160816;
        b=BjdFZvZWIalGHjG1OVqNefGJBwDHs8X8DfPlflUoDeakiatISAjmW0wQ9KBOSzMWFc
         JJFPpuvbYLPLM1IqONXIGHqNOUYxBzNjQDxSCZymEIrpiMItX3r4g1GkQGjRdKtFCG6g
         cADN6o6SUBa7AVbF/p2LzlR2U8KjvVpdAct6hJ2I1SJGBusW9tvTdAMNnxtFDEjdMuFt
         m9QfYgybEY7sG2Xp4l2pxeH/SH9dQG/YgNTAiJg0VLgwMzncnj+spSRKvYmWRAZ46Rx5
         /ohKwZA2K992HlvdoD2fCrvfn/VrvbW2mMZbFcMLgSiVmynoVV3E+EYljrmV5ludVHRd
         FVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=RlMzKUU3Mg36HmaBJyH4L1SMyjLAaqqJH9PshgIA5eg=;
        b=0CLTQqbecdcZrhIwWnMFYaBy35iNWSaKTXZEW6Mb1P5UALmmy1bYJ4XrNUQ1BLFKSB
         xJlnWMoOjFNUbUytF18caDqRHaJd9TArkglEANuPzpFs0hCHPvRWNVPv4PqM1gJTkf8c
         P/8nYcW7YZt2Wg84wgyRYJTDMI1ov8Rm59wN5r3bZPf/4pDCJp7rgNV+rfiZ+AU276rw
         fbW7IOmNAWPoFI9XZ0CLY4JKLhGNjznxHy6H0odKJXiuncZ96WYtetsXRQtzLshLZMyQ
         jlfuKcObtptIAelImfAYPJXRo92bQ2iKxuXx3RU+nkuWiG7A0Xq7wSLxQ2m91K3UFYtd
         6uDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u10si7646163qta.278.2017.05.06.08.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 May 2017 08:26:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d71bK-0008QV-2e
	for alex.bennee@linaro.org; Sat, 06 May 2017 11:26:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d71ZR-0007Mq-Dd
	for qemu-devel@nongnu.org; Sat, 06 May 2017 11:24:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d71ZQ-0002uK-IA
	for qemu-devel@nongnu.org; Sat, 06 May 2017 11:24:33 -0400
Received: from mail.kernel.org ([198.145.29.136]:48096)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1d71ZO-0002tk-1t; Sat, 06 May 2017 11:24:30 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 3B30B203A0;
	Sat,  6 May 2017 15:24:28 +0000 (UTC)
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1E77D203AB;
	Sat,  6 May 2017 15:24:25 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat,  6 May 2017 17:24:14 +0200
Message-Id: <20170506152414.8704-4-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170506152414.8704-1-krzk@kernel.org>
References: <20170506152414.8704-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-devel] [PATCH 3/3] hw/arm/exynos: QOM-ify the SoC
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vkpH36cnD5/8

Convert the Exynos4210 SoC code into a QOM model which is a preferred
approach instead of directly initializing SoC-related devices from the
board file.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/arm/exynos4210.c         | 18 +++++++++++++++---
 hw/arm/exynos4_boards.c     |  9 ++++++---
 include/hw/arm/exynos4210.h |  8 ++++++--
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 27a7bf28a5a9..034fc8be9d76 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -160,9 +160,10 @@ static uint64_t exynos4210_calc_affinity(int cpu)
     return mp_affinity;
 }
 
-Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
+static void exynos4210_init(Object *obj)
 {
-    Exynos4210State *s = g_new(Exynos4210State, 1);
+    MemoryRegion *system_mem = get_system_memory();
+    Exynos4210State *s = EXYNOS4210(obj);
     qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
     SysBusDevice *busdev;
     ObjectClass *cpu_oc;
@@ -402,6 +403,17 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
 
     sysbus_create_simple(TYPE_EXYNOS4210_EHCI, EXYNOS4210_EHCI_BASE_ADDR,
             s->irq_table[exynos4210_get_irq(28, 3)]);
+}
+
+static const TypeInfo exynos4210_type_info = {
+    .name = TYPE_EXYNOS4210,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(Exynos4210State),
+    .instance_init = exynos4210_init,
+};
 
-    return s;
+static void exynos4210_register_types(void)
+{
+    type_register_static(&exynos4210_type_info);
 }
+type_init(exynos4210_register_types)
diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 6240b26839cd..5e7c6b562ae2 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -58,7 +58,7 @@ typedef enum Exynos4BoardType {
 } Exynos4BoardType;
 
 typedef struct Exynos4BoardState {
-    Exynos4210State *soc;
+    Exynos4210State soc;
     MemoryRegion dram0_mem;
     MemoryRegion dram1_mem;
 } Exynos4BoardState;
@@ -162,7 +162,10 @@ exynos4_boards_init_common(MachineState *machine,
     exynos4_boards_init_ram(s, get_system_memory(),
                             exynos4_board_ram_size[board_type]);
 
-    s->soc = exynos4210_init(get_system_memory());
+    object_initialize(&s->soc, sizeof(s->soc), TYPE_EXYNOS4210);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
+                              &error_abort);
+    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fatal);
 
     return s;
 }
@@ -180,7 +183,7 @@ static void smdkc210_init(MachineState *machine)
                                                       EXYNOS4_BOARD_SMDKC210);
 
     lan9215_init(SMDK_LAN9118_BASE_ADDR,
-            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(37, 1)]));
+            qemu_irq_invert(s->soc.irq_table[exynos4210_get_irq(37, 1)]));
     arm_load_kernel(ARM_CPU(first_cpu), &exynos4_board_binfo);
 }
 
diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 098a69ec73d3..116eae62756b 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -29,6 +29,10 @@
 #include "exec/memory.h"
 #include "target/arm/cpu-qom.h"
 
+#define TYPE_EXYNOS4210 "exynos4210"
+#define EXYNOS4210(obj) \
+    OBJECT_CHECK(Exynos4210State, (obj), TYPE_EXYNOS4210)
+
 #define EXYNOS4210_NCPUS                    2
 
 #define EXYNOS4210_DRAM0_BASE_ADDR          0x40000000
@@ -85,6 +89,8 @@ typedef struct Exynos4210Irq {
 } Exynos4210Irq;
 
 typedef struct Exynos4210State {
+    DeviceState parent_obj;
+
     ARMCPU *cpu[EXYNOS4210_NCPUS];
     Exynos4210Irq irqs;
     qemu_irq *irq_table;
@@ -101,8 +107,6 @@ typedef struct Exynos4210State {
 void exynos4210_write_secondary(ARMCPU *cpu,
         const struct arm_boot_info *info);
 
-Exynos4210State *exynos4210_init(MemoryRegion *system_mem);
-
 /* Initialize exynos4210 IRQ subsystem stub */
 qemu_irq *exynos4210_init_irq(Exynos4210Irq *env);
 
-- 
2.9.3

