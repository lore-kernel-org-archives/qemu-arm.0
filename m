Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p20sm8680500wmq.10.2021.06.04.09.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:02:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 06CC91FFD0;
	Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif@nuviainc.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH  v16 58/99] target/arm: move kvm-const.h, kvm.c, kvm64.c, kvm_arm.h to kvm/
Date: Fri,  4 Jun 2021 16:52:31 +0100
Message-Id: <20210604155312.15902-59-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: s8s9VQ572oNV

From: Claudio Fontana <cfontana@suse.de>

and adapt the code including the header references,
and trace-events / trace.h

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build                       | 2 +-
 target/arm/cpu.h                  | 2 +-
 target/arm/{ => kvm}/kvm-consts.h | 0
 target/arm/{ => kvm}/kvm_arm.h    | 0
 target/arm/kvm/trace.h            | 1 +
 target/arm/trace.h                | 1 -
 hw/arm/sbsa-ref.c                 | 2 +-
 hw/arm/virt-acpi-build.c          | 2 +-
 hw/arm/virt.c                     | 2 +-
 hw/arm/xlnx-versal.c              | 2 +-
 hw/arm/xlnx-zynqmp.c              | 2 +-
 hw/cpu/a15mpcore.c                | 2 +-
 hw/intc/arm_gic_kvm.c             | 2 +-
 hw/intc/arm_gicv3_its_kvm.c       | 2 +-
 hw/intc/arm_gicv3_kvm.c           | 2 +-
 target/arm/cpu-sysemu.c           | 2 +-
 target/arm/cpu.c                  | 2 +-
 target/arm/cpu32.c                | 2 +-
 target/arm/cpu64.c                | 2 +-
 target/arm/{ => kvm}/kvm.c        | 0
 target/arm/{ => kvm}/kvm64.c      | 0
 target/arm/machine.c              | 2 +-
 target/arm/monitor.c              | 2 +-
 target/arm/tcg/sysemu/tcg-cpu.c   | 1 -
 MAINTAINERS                       | 2 +-
 target/arm/kvm/meson.build        | 4 ++++
 target/arm/{ => kvm}/trace-events | 0
 target/arm/meson.build            | 3 +--
 28 files changed, 24 insertions(+), 22 deletions(-)
 rename target/arm/{ => kvm}/kvm-consts.h (100%)
 rename target/arm/{ => kvm}/kvm_arm.h (100%)
 create mode 100644 target/arm/kvm/trace.h
 delete mode 100644 target/arm/trace.h
 rename target/arm/{ => kvm}/kvm.c (100%)
 rename target/arm/{ => kvm}/kvm64.c (100%)
 create mode 100644 target/arm/kvm/meson.build
 rename target/arm/{ => kvm}/trace-events (100%)

diff --git a/meson.build b/meson.build
index eb22030571..e2a22984b8 100644
--- a/meson.build
+++ b/meson.build
@@ -1859,8 +1859,8 @@ if have_system or have_user
   trace_events_subdirs += [
     'accel/tcg',
     'hw/core',
-    'target/arm',
     'target/arm/tcg',
+    'target/arm/kvm',
     'target/hppa',
     'target/i386',
     'target/i386/kvm',
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e528873ed3..f57fa9b9f5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -20,7 +20,7 @@
 #ifndef ARM_CPU_H
 #define ARM_CPU_H
 
-#include "kvm-consts.h"
+#include "kvm/kvm-consts.h"
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
diff --git a/target/arm/kvm-consts.h b/target/arm/kvm/kvm-consts.h
similarity index 100%
rename from target/arm/kvm-consts.h
rename to target/arm/kvm/kvm-consts.h
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm/kvm_arm.h
similarity index 100%
rename from target/arm/kvm_arm.h
rename to target/arm/kvm/kvm_arm.h
diff --git a/target/arm/kvm/trace.h b/target/arm/kvm/trace.h
new file mode 100644
index 0000000000..c688745b90
--- /dev/null
+++ b/target/arm/kvm/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-target_arm_kvm.h"
diff --git a/target/arm/trace.h b/target/arm/trace.h
deleted file mode 100644
index 60372d8e26..0000000000
--- a/target/arm/trace.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "trace/trace-target_arm.h"
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 43c19b4923..38ac4ca2cd 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -28,7 +28,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "exec/hwaddr.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "hw/arm/boot.h"
 #include "hw/block/flash.h"
 #include "hw/boards.h"
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 60fe2e65a7..bfd7f58eec 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -51,7 +51,7 @@
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "sysemu/tpm.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 840758666d..4573c3daf5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -63,7 +63,7 @@
 #include "hw/intc/arm_gic.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/irq.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "hw/firmware/smbios.h"
 #include "qapi/visitor.h"
 #include "qapi/qapi-visit-common.h"
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index fb776834f7..d42e19ab5a 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -18,7 +18,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "hw/arm/boot.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/xlnx-versal.h"
 
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 3597e8db4d..0af49c713a 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -23,7 +23,7 @@
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 
 #define GIC_NUM_SPI_INTR 160
 
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 774ca9987a..670d07a98c 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -25,7 +25,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/kvm.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 
 static void a15mp_priv_set_irq(void *opaque, int irq, int level)
 {
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 7d2a13273a..9b45b3cad4 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -24,7 +24,7 @@
 #include "qemu/module.h"
 #include "migration/blocker.h"
 #include "sysemu/kvm.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "gic_internal.h"
 #include "vgic_common.h"
 #include "qom/object.h"
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index b554d2ede0..5322e1bcaf 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -25,7 +25,7 @@
 #include "hw/qdev-properties.h"
 #include "sysemu/runstate.h"
 #include "sysemu/kvm.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "migration/blocker.h"
 #include "qom/object.h"
 
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 96c7e8b80c..086b0ba0d3 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -26,7 +26,7 @@
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "gicv3_internal.h"
 #include "vgic_common.h"
 #include "migration/blocker.h"
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 2d3fe4f643..26467c640b 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -24,7 +24,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "sysemu/hw_accel.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "sysemu/tcg.h"
 #include "tcg/tcg-cpu.h"
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 192700fe8f..9b81cbe386 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,7 +39,7 @@
 #endif
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 #include "cpu-mmu.h"
diff --git a/target/arm/cpu32.c b/target/arm/cpu32.c
index a6ba91ae08..56f02ca891 100644
--- a/target/arm/cpu32.c
+++ b/target/arm/cpu32.c
@@ -37,7 +37,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 #include "cpu-mmu.h"
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7cd73ae0b6..f5ead76374 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -31,7 +31,7 @@
 #include "hw/loader.h"
 #endif
 #include "sysemu/kvm.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
 #include "cpregs.h"
diff --git a/target/arm/kvm.c b/target/arm/kvm/kvm.c
similarity index 100%
rename from target/arm/kvm.c
rename to target/arm/kvm/kvm.c
diff --git a/target/arm/kvm64.c b/target/arm/kvm/kvm64.c
similarity index 100%
rename from target/arm/kvm64.c
rename to target/arm/kvm/kvm64.c
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 2982e8d7f4..595ab94237 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -3,7 +3,7 @@
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "internals.h"
 #include "migration/cpu.h"
 #include "cpregs.h"
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 80c64fa355..0c72bf7c31 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -22,7 +22,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/boards.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qapi/qobject-input-visitor.h"
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index 2c395f47e7..6ab49ba614 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -39,7 +39,6 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
-#include "kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 #include "cpu-mmu.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 1ff68116b0..24e55954d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -373,7 +373,7 @@ ARM KVM CPUs
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
-F: target/arm/kvm.c
+F: target/arm/kvm/kvm.c
 
 MIPS KVM CPUs
 M: Huacai Chen <chenhuacai@kernel.org>
diff --git a/target/arm/kvm/meson.build b/target/arm/kvm/meson.build
new file mode 100644
index 0000000000..e92010fa3f
--- /dev/null
+++ b/target/arm/kvm/meson.build
@@ -0,0 +1,4 @@
+arm_ss.add(when: 'CONFIG_KVM', if_true: files(
+  'kvm.c',
+  'kvm64.c',
+))
diff --git a/target/arm/trace-events b/target/arm/kvm/trace-events
similarity index 100%
rename from target/arm/trace-events
rename to target/arm/kvm/trace-events
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 8d0c12b2fc..448e94861f 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -11,8 +11,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c',
@@ -38,6 +36,7 @@ arm_user_ss.add(files(
 ))
 
 subdir('tcg')
+subdir('kvm')
 
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
-- 
2.20.1
