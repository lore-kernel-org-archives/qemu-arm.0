Received: by 10.25.0.23 with SMTP id 23csp27164lfa;
        Fri, 2 Jun 2017 09:46:49 -0700 (PDT)
X-Received: by 10.237.34.246 with SMTP id q51mr9407908qtc.39.1496422009830;
        Fri, 02 Jun 2017 09:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496422009; cv=none;
        d=google.com; s=arc-20160816;
        b=NH1VQV0IqYDmCdBNGWwK1ud8Hvy8TXdjLEQGod4GLjRbCQXGYTMzgmlPC6glBfgKZp
         +u6kf0QCo7JfuVbNyU24pgr+VYJj4qTqPyANpT8KbISg002yD1+3ZG8hDPlRWqAUnZ6i
         nGLaIx8PFtHpVH5eQD42uBOvEE/RMftmSgolEPL9RAnwKka+yAU7R6tqR37oV8b3aUj9
         3wfWF3I4KW4lauJ4SFHDFAlxb9kJdvn112ioWtLug+ZRz/IZ3AGINDMVFrO6JSM0QJVU
         pimH4RxQlL5q/6nbAxfeKp0GjciaQK6/X9EeixDwQ1/o7gjZLot819x+agbkMuTpWKam
         ijSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=U+R7cfGmtTu2FIwgBbygPMdZl0MkiU8ZFslLOz0soC0=;
        b=ryrVJsaYrJ0GT1oziTpVRj/4Ok/Wg8x0J7F51Av34wOs+HesNV8nJRj1Esqcu0nlzT
         rFeXZ8qv2yS6aQcDRryDipwHXFgcBL6k9xITyKrI3LiABiVbkl6ZMz2AamlaPVWR0XGt
         kcfq9f15W13vxPUxZb2L7T7qerDIEwpBu6IhL976O1hqKuYS9cs+rvYF303aGKW4pN2i
         yrIqrIsqHyYbRTlgXmGHAyqwVu+yGRPJG/fQo5Qkps0T6nW1KGc4l9GoEhGijvRdhUNe
         Tz+cm9jJEatI5eWU66PpdXofSj6a6WfZHuT9Jd4YKZUqaNXElUt7dIQ+dr9B1LlBwZOR
         h3qg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3si24551927qkg.314.2017.06.02.09.46.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 09:46:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGpio-0002Lj-Ry
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 12:46:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZB-0001EQ-3L
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZ4-0007fG-Vd
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:36:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:53898)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dGpZ4-0007ea-LY; Fri, 02 Jun 2017 12:36:42 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 35C3723A24;
	Fri,  2 Jun 2017 16:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35C3723A24
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  2 Jun 2017 18:36:14 +0200
Message-Id: <20170602163618.6369-5-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170602163618.6369-1-krzk@kernel.org>
References: <20170602162857.6065-1-krzk@kernel.org>
	<20170602163618.6369-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v4 5/9] hw/arm/exynos: Move DRAM initialization
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
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EBoqKAc/o4XE

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

