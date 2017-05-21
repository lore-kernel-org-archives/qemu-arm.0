Received: by 10.103.124.15 with SMTP id x15csp1047726vsc;
        Sun, 21 May 2017 08:31:01 -0700 (PDT)
X-Received: by 10.200.46.10 with SMTP id r10mr17034405qta.290.1495380660941;
        Sun, 21 May 2017 08:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495380660; cv=none;
        d=google.com; s=arc-20160816;
        b=KQ5YhvxddA1bB4jhPfGbV9nR1ADPKGdUnuhQ4nYNXyEEfS18RyM9v4VOsJRMpf5tsF
         4mJPeTPoLaLki/Ko+Z70CQeYdMx1rOEn/f5onIA7fdD6Pq/wvZSzmz4IrmVgJN1Lvmsq
         SeMkP831MlkpCh97EJtVN3T9g7sL+AIfmhvhpQcn3JjYyAIaE2FjPd222EIIojeahLp7
         JoKe7kozXm8I6142tZ7R3QUh2pQFLR+AcN0KTpvYbn61/pJTyNsAXzwGRB47PZ0Lkq8H
         5/SBvE5TlD7xAFwJr9spUI74EKLaES8E2IROVW2DenxTWpNj4RpYCn/jUaCHhIlsiUtq
         93dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=U+R7cfGmtTu2FIwgBbygPMdZl0MkiU8ZFslLOz0soC0=;
        b=h2qQ2kdipHkipgfpOB3Kk2Q31wGSknjJG4rVWntfkfHcCTK7kN2u2hW6wc0aBqbjMM
         gJDA6ba9YZuqoCE9d4mfgTwFEsflEnwGjLhvvBki+ySGBRzaC78UXsX/lFew0tkwgfNQ
         KEbP8C0yq6CE7wInJ41I0pvZeeA3j/S0t6o0mMuM9JUDb65CofKAMukiLLC+1383cp9r
         qKG7C/daQe7vPmlKsncpnwEosozCanZ+mrF1ntie4yi4ALnX9E/5KPSszhehY2mN1D/O
         Z9Ej7t7CeFnXa6GgTLGmiY06BfLCs3EIfoItTVHfQDwUe00kBMXJujRtn9qPrgqo2ohD
         Pi0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e18si15570062qka.66.2017.05.21.08.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 May 2017 08:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCSou-0002x4-AT
	for alex.bennee@linaro.org; Sun, 21 May 2017 11:31:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo9-0002Qw-SF
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo8-0007Gx-4z
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:49724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dCSo7-0007GO-TC; Sun, 21 May 2017 11:30:12 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 67D60239B0;
	Sun, 21 May 2017 15:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D60239B0
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 21 May 2017 17:29:44 +0200
Message-Id: <20170521152949.15338-7-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170521152949.15338-1-krzk@kernel.org>
References: <20170521152949.15338-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v3 06/11] hw/arm/exynos: Move DRAM initialization
 next boards
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
X-TUID: xS6DPfSVKwIW

Before QOM-ifying the Exynos4 SoC model, move the DRAM initialization
from exynos4210.c to exynos4_boards.c because DRAM is board specific,
not SoC.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/exynos4210.c         | 20 +-----------------
 hw/arm/exynos4_boards.c     | 50 ++++++++++++++++++++++++++++++++++++++-=
------
 include/hw/arm/exynos4210.h |  5 +----
 3 files changed, 45 insertions(+), 30 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 960f27e45a36..0da877f8db0a 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -160,13 +160,11 @@ static uint64_t exynos4210_calc_affinity(int cpu)
     return mp_affinity;
 }
=20
-Exynos4210State *exynos4210_init(MemoryRegion *system_mem,
-        unsigned long ram_size)
+Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
 {
     int i, n;
     Exynos4210State *s =3D g_new(Exynos4210State, 1);
     qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
-    unsigned long mem_size;
     DeviceState *dev;
     SysBusDevice *busdev;
     ObjectClass *cpu_oc;
@@ -299,22 +297,6 @@ Exynos4210State *exynos4210_init(MemoryRegion *syste=
m_mem,
     memory_region_add_subregion(system_mem, EXYNOS4210_IRAM_BASE_ADDR,
                                 &s->iram_mem);
=20
-    /* DRAM */
-    mem_size =3D ram_size;
-    if (mem_size > EXYNOS4210_DRAM_MAX_SIZE) {
-        memory_region_init_ram(&s->dram1_mem, NULL, "exynos4210.dram1",
-                mem_size - EXYNOS4210_DRAM_MAX_SIZE, &error_fatal);
-        vmstate_register_ram_global(&s->dram1_mem);
-        memory_region_add_subregion(system_mem, EXYNOS4210_DRAM1_BASE_AD=
DR,
-                &s->dram1_mem);
-        mem_size =3D EXYNOS4210_DRAM_MAX_SIZE;
-    }
-    memory_region_init_ram(&s->dram0_mem, NULL, "exynos4210.dram0", mem_=
size,
-                           &error_fatal);
-    vmstate_register_ram_global(&s->dram0_mem);
-    memory_region_add_subregion(system_mem, EXYNOS4210_DRAM0_BASE_ADDR,
-            &s->dram0_mem);
-
    /* PMU.
     * The only reason of existence at the moment is that secondary CPU b=
oot
     * loader uses PMU INFORM5 register as a holding pen.
diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 4853c318023c..6240b26839cd 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -22,6 +22,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -56,6 +57,12 @@ typedef enum Exynos4BoardType {
     EXYNOS4_NUM_OF_BOARDS
 } Exynos4BoardType;
=20
+typedef struct Exynos4BoardState {
+    Exynos4210State *soc;
+    MemoryRegion dram0_mem;
+    MemoryRegion dram1_mem;
+} Exynos4BoardState;
+
 static int exynos4_board_id[EXYNOS4_NUM_OF_BOARDS] =3D {
     [EXYNOS4_BOARD_NURI]     =3D 0xD33,
     [EXYNOS4_BOARD_SMDKC210] =3D 0xB16,
@@ -96,9 +103,34 @@ static void lan9215_init(uint32_t base, qemu_irq irq)
     }
 }
=20
-static Exynos4210State *exynos4_boards_init_common(MachineState *machine=
,
-                                                   Exynos4BoardType boar=
d_type)
+static void exynos4_boards_init_ram(Exynos4BoardState *s,
+                                    MemoryRegion *system_mem,
+                                    unsigned long ram_size)
+{
+    unsigned long mem_size =3D ram_size;
+
+    if (mem_size > EXYNOS4210_DRAM_MAX_SIZE) {
+        memory_region_init_ram(&s->dram1_mem, NULL, "exynos4210.dram1",
+                               mem_size - EXYNOS4210_DRAM_MAX_SIZE,
+                               &error_fatal);
+        vmstate_register_ram_global(&s->dram1_mem);
+        memory_region_add_subregion(system_mem, EXYNOS4210_DRAM1_BASE_AD=
DR,
+                                    &s->dram1_mem);
+        mem_size =3D EXYNOS4210_DRAM_MAX_SIZE;
+    }
+
+    memory_region_init_ram(&s->dram0_mem, NULL, "exynos4210.dram0", mem_=
size,
+                           &error_fatal);
+    vmstate_register_ram_global(&s->dram0_mem);
+    memory_region_add_subregion(system_mem, EXYNOS4210_DRAM0_BASE_ADDR,
+                                &s->dram0_mem);
+}
+
+static Exynos4BoardState *
+exynos4_boards_init_common(MachineState *machine,
+                           Exynos4BoardType board_type)
 {
+    Exynos4BoardState *s =3D g_new(Exynos4BoardState, 1);
     MachineClass *mc =3D MACHINE_GET_CLASS(machine);
=20
     if (smp_cpus !=3D EXYNOS4210_NCPUS && !qtest_enabled()) {
@@ -127,8 +159,12 @@ static Exynos4210State *exynos4_boards_init_common(M=
achineState *machine,
             machine->kernel_cmdline,
             machine->initrd_filename);
=20
-    return exynos4210_init(get_system_memory(),
-            exynos4_board_ram_size[board_type]);
+    exynos4_boards_init_ram(s, get_system_memory(),
+                            exynos4_board_ram_size[board_type]);
+
+    s->soc =3D exynos4210_init(get_system_memory());
+
+    return s;
 }
=20
 static void nuri_init(MachineState *machine)
@@ -140,11 +176,11 @@ static void nuri_init(MachineState *machine)
=20
 static void smdkc210_init(MachineState *machine)
 {
-    Exynos4210State *s =3D exynos4_boards_init_common(machine,
-                                                    EXYNOS4_BOARD_SMDKC2=
10);
+    Exynos4BoardState *s =3D exynos4_boards_init_common(machine,
+                                                      EXYNOS4_BOARD_SMDK=
C210);
=20
     lan9215_init(SMDK_LAN9118_BASE_ADDR,
-            qemu_irq_invert(s->irq_table[exynos4210_get_irq(37, 1)]));
+            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(37, 1)]=
));
     arm_load_kernel(ARM_CPU(first_cpu), &exynos4_board_binfo);
 }
=20
diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index d9e08014d6ff..098a69ec73d3 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -93,8 +93,6 @@ typedef struct Exynos4210State {
     MemoryRegion iram_mem;
     MemoryRegion irom_mem;
     MemoryRegion irom_alias_mem;
-    MemoryRegion dram0_mem;
-    MemoryRegion dram1_mem;
     MemoryRegion boot_secondary;
     MemoryRegion bootreg_mem;
     I2CBus *i2c_if[EXYNOS4210_I2C_NUMBER];
@@ -103,8 +101,7 @@ typedef struct Exynos4210State {
 void exynos4210_write_secondary(ARMCPU *cpu,
         const struct arm_boot_info *info);
=20
-Exynos4210State *exynos4210_init(MemoryRegion *system_mem,
-        unsigned long ram_size);
+Exynos4210State *exynos4210_init(MemoryRegion *system_mem);
=20
 /* Initialize exynos4210 IRQ subsystem stub */
 qemu_irq *exynos4210_init_irq(Exynos4210Irq *env);
--=20
2.9.3

