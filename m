Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q15sm19377088wrr.58.2021.03.08.05.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 05:57:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AA54A1FF7E;
	Mon,  8 Mar 2021 13:51:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PULL 17/18] semihosting: Move include/hw/semihosting/ -> include/semihosting/
Date: Mon,  8 Mar 2021 13:51:03 +0000
Message-Id: <20210308135104.24903-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Gr11yugivgDr

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We want to move the semihosting code out of hw/ in the next patch.

This patch contains the mechanical steps, created using:

  $ git mv include/hw/semihosting/ include/
  $ sed -i s,hw/semihosting,semihosting, $(git grep -l hw/semihosting)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210226131356.3964782-2-f4bug@amsat.org>
Message-Id: <20210305135451.15427-2-alex.bennee@linaro.org>

diff --git a/include/hw/semihosting/console.h b/include/semihosting/console.h
similarity index 100%
rename from include/hw/semihosting/console.h
rename to include/semihosting/console.h
diff --git a/include/hw/semihosting/semihost.h b/include/semihosting/semihost.h
similarity index 100%
rename from include/hw/semihosting/semihost.h
rename to include/semihosting/semihost.h
diff --git a/gdbstub.c b/gdbstub.c
index 3ee40479b6..e51e33cc70 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -49,7 +49,7 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "exec/exec-all.h"
 #include "sysemu/replay.h"
 
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 9afc0b427b..26e7b1bd9f 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -58,7 +58,7 @@
 #include "qemu/error-report.h"
 #include "hw/misc/empty_slot.h"
 #include "sysemu/kvm.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "hw/mips/cps.h"
 #include "hw/qdev-clock.h"
 
diff --git a/hw/semihosting/arm-compat-semi.c b/hw/semihosting/arm-compat-semi.c
index 23c6e3edcb..94950b6c56 100644
--- a/hw/semihosting/arm-compat-semi.c
+++ b/hw/semihosting/arm-compat-semi.c
@@ -34,9 +34,9 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "hw/semihosting/semihost.h"
-#include "hw/semihosting/console.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/semihost.h"
+#include "semihosting/console.h"
+#include "semihosting/common-semi.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
 #ifdef CONFIG_USER_ONLY
diff --git a/hw/semihosting/config.c b/hw/semihosting/config.c
index 9807f10cb0..3548e0f627 100644
--- a/hw/semihosting/config.c
+++ b/hw/semihosting/config.c
@@ -22,7 +22,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "chardev/char.h"
 #include "sysemu/sysemu.h"
 
diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
index 9b4fee9260..c9ebd6fdd0 100644
--- a/hw/semihosting/console.c
+++ b/hw/semihosting/console.c
@@ -17,8 +17,8 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "hw/semihosting/semihost.h"
-#include "hw/semihosting/console.h"
+#include "semihosting/semihost.h"
+#include "semihosting/console.h"
 #include "exec/gdbstub.h"
 #include "exec/exec-all.h"
 #include "qemu/log.h"
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 7c42f65706..ee72a1c20f 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -22,7 +22,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "qemu/guest-random.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 #include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index cadfb7fa43..989d03cd89 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -22,7 +22,7 @@
 #include "qemu.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index 9665dabb09..6767f941e8 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -23,7 +23,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "elf.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 
 void cpu_loop(CPURISCVState *env)
 {
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index c0015ee7f6..82013b8b48 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -12,7 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "hw/semihosting/console.h"
+#include "semihosting/console.h"
 #include "qemu.h"
 #include <termios.h>
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 10bd8a10a3..ac06dfbae0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -108,7 +108,7 @@
 #include "qapi/opts-visitor.h"
 #include "qapi/clone-visitor.h"
 #include "qom/object_interfaces.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "crypto/init.h"
 #include "sysemu/replay.h"
 #include "qapi/qapi-events-run-state.h"
diff --git a/stubs/semihost.c b/stubs/semihost.c
index 1d8b37f7b2..1b30f38b03 100644
--- a/stubs/semihost.c
+++ b/stubs/semihost.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "qemu/option.h"
 #include "qemu/error-report.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "sysemu/sysemu.h"
 
 /* Empty config */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e1a3b9421..d763f376c6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -22,7 +22,7 @@
 #include "exec/exec-all.h"
 #include <zlib.h> /* For crc32 */
 #include "hw/irq.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
@@ -34,7 +34,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 731c435c00..d63ae465e1 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -21,7 +21,7 @@
 #include "qemu/qemu-print.h"
 #include "exec/exec-all.h"
 #include <zlib.h> /* For crc32 */
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "qemu/range.h"
@@ -31,7 +31,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 #endif
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b23a8975d5..6d002e2c63 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -28,7 +28,7 @@
 #include "internals.h"
 #include "qemu/host-utils.h"
 
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "exec/gen-icount.h"
 
 #include "exec/helper-proto.h"
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1653cca1aa..62b1c2081b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -29,7 +29,7 @@
 #include "qemu/log.h"
 #include "qemu/bitops.h"
 #include "arm_ldst.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
diff --git a/target/lm32/helper.c b/target/lm32/helper.c
index 7c52ae76d6..01cc3c53a5 100644
--- a/target/lm32/helper.c
+++ b/target/lm32/helper.c
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "qemu/host-utils.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "exec/log.h"
 
 bool lm32_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 202498deb5..730cdf7744 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -21,7 +21,7 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 
 #if defined(CONFIG_USER_ONLY)
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index bf70c77295..bd4dca571f 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -31,7 +31,7 @@
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-clock.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "fpu_helper.h"
 
diff --git a/target/mips/mips-semi.c b/target/mips/mips-semi.c
index 898251aa02..6de60fa6dd 100644
--- a/target/mips/mips-semi.c
+++ b/target/mips/mips-semi.c
@@ -22,8 +22,8 @@
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
 #include "exec/softmmu-semi.h"
-#include "hw/semihosting/semihost.h"
-#include "hw/semihosting/console.h"
+#include "semihosting/semihost.h"
+#include "semihosting/console.h"
 
 typedef enum UHIOp {
     UHI_exit = 1,
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 70891c37cd..0b6d82d228 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29,7 +29,7 @@
 #include "exec/translator.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 
 #include "target/mips/trace.h"
 #include "trace-tcg.h"
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 57c97bde3c..53be8398e9 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -26,7 +26,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "exec/helper-proto.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 
 #if defined(CONFIG_USER_ONLY)
 
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 2f43939fb6..83a6bcfad0 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -24,7 +24,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
-#include "hw/semihosting/common-semi.h"
+#include "semihosting/common-semi.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
diff --git a/target/unicore32/helper.c b/target/unicore32/helper.c
index 54c26871fe..704393c27f 100644
--- a/target/unicore32/helper.c
+++ b/target/unicore32/helper.c
@@ -14,7 +14,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
-#include "hw/semihosting/console.h"
+#include "semihosting/console.h"
 
 #undef DEBUG_UC32
 
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 944a157747..0ae4efc48a 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -37,7 +37,7 @@
 #include "qemu/log.h"
 #include "qemu/qemu-print.h"
 #include "exec/cpu_ldst.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "exec/translator.h"
 
 #include "exec/helper-proto.h"
diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
index 25f57a6500..79f2b043f2 100644
--- a/target/xtensa/xtensa-semi.c
+++ b/target/xtensa/xtensa-semi.c
@@ -29,7 +29,7 @@
 #include "cpu.h"
 #include "chardev/char-fe.h"
 #include "exec/helper-proto.h"
-#include "hw/semihosting/semihost.h"
+#include "semihosting/semihost.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
 
diff --git a/MAINTAINERS b/MAINTAINERS
index b54a22475b..99e9874fd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3243,7 +3243,7 @@ Semihosting
 M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/semihosting/
-F: include/hw/semihosting/
+F: include/semihosting/
 
 Multi-process QEMU
 M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
-- 
2.20.1
