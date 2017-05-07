Received: by 10.25.0.198 with SMTP id 189csp1048652lfa;
        Sun, 7 May 2017 11:20:07 -0700 (PDT)
X-Received: by 10.200.34.118 with SMTP id p51mr30844680qtp.124.1494181207478;
        Sun, 07 May 2017 11:20:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t124si1698268qkc.313.2017.05.07.11.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 May 2017 11:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7Qms-0001fi-QJ
	for alex.bennee@linaro.org; Sun, 07 May 2017 14:20:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7Qmk-0001en-0y
	for qemu-arm@nongnu.org; Sun, 07 May 2017 14:19:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1d7Qmi-0008VQ-Ov
	for qemu-arm@nongnu.org; Sun, 07 May 2017 14:19:58 -0400
Received: from mail.kernel.org ([198.145.29.136]:41976)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1d7Qmi-0008V1-GB; Sun, 07 May 2017 14:19:56 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id ACF6E203AE;
	Sun,  7 May 2017 18:19:54 +0000 (UTC)
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4F208203DB;
	Sun,  7 May 2017 18:19:52 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun,  7 May 2017 20:19:38 +0200
Message-Id: <20170507181940.25882-2-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170507181940.25882-1-krzk@kernel.org>
References: <20170507181940.25882-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH v2 1/3] hw/arm/exynos: Move DRAM initialization
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
X-TUID: xKZ53VJ+Gw84

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

