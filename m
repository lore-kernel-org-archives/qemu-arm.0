Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s4-20020adff804000000b002c705058773sm135258wrp.74.2023.03.02.11.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 11:08:48 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 773D71FFBF;
	Thu,  2 Mar 2023 19:08:47 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Laurent Vivier <laurent@vivier.eu>,
	nicolas.eder@lauterbach.com,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	qemu-s390x@nongnu.org,
	Stafford Horne <shorne@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Marek Vasut <marex@denx.de>,
	Greg Kurz <groug@kaod.org>,
	Song Gao <gaosong@loongson.cn>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-riscv@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	mads@ynddal.dk,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	Taylor Simpson <tsimpson@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 07/26] includes: move tb_flush into its own header
Date: Thu,  2 Mar 2023 19:08:27 +0000
Message-Id: <20230302190846.2593720-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302190846.2593720-1-alex.bennee@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Dokd4afMrACp

This aids subsystems (like gdbstub) that want to trigger a flush
without pulling target specific headers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - actually include the header and rename to tb-flush.h
  - better kerneldoc style comment for the function
v4
  - update MAINTAINERS
---
 MAINTAINERS                 |  1 +
 include/exec/exec-all.h     |  1 -
 include/exec/tb-flush.h     | 26 ++++++++++++++++++++++++++
 linux-user/user-internals.h |  1 +
 accel/stubs/tcg-stub.c      |  1 +
 accel/tcg/tb-maint.c        |  1 +
 accel/tcg/translate-all.c   |  1 +
 cpu.c                       |  1 +
 gdbstub/gdbstub.c           |  2 ++
 hw/ppc/spapr_hcall.c        |  1 +
 plugins/core.c              |  1 +
 plugins/loader.c            |  2 +-
 target/alpha/sys_helper.c   |  1 +
 target/riscv/csr.c          |  1 +
 14 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 include/exec/tb-flush.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 76662969d7..234800e3dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -136,6 +136,7 @@ F: docs/devel/decodetree.rst
 F: docs/devel/tcg*
 F: include/exec/cpu*.h
 F: include/exec/exec-all.h
+F: include/exec/tb-flush.h
 F: include/exec/helper*.h
 F: include/sysemu/cpus.h
 F: include/sysemu/tcg.h
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e09254333d..ad9eb6067b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -677,7 +677,6 @@ void tb_invalidate_phys_addr(target_ulong addr);
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
-void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
diff --git a/include/exec/tb-flush.h b/include/exec/tb-flush.h
new file mode 100644
index 0000000000..d92d06565b
--- /dev/null
+++ b/include/exec/tb-flush.h
@@ -0,0 +1,26 @@
+/*
+ * tb-flush prototype for use by the rest of the system.
+ *
+ * Copyright (c) 2022 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef _TB_FLUSH_H_
+#define _TB_FLUSH_H_
+
+/**
+ * tb_flush() - flush all translation blocks
+ * @cs: CPUState (must be valid, but treated as anonymous pointer)
+ *
+ * Used to flush all the translation blocks in the system. Sometimes
+ * it is simpler to flush everything than work out which individual
+ * translations are now invalid and ensure they are not called
+ * anymore.
+ *
+ * tb_flush() takes care of running the flush in an exclusive context
+ * if it is not already running in one. This means no guest code will
+ * run until this complete.
+ */
+void tb_flush(CPUState *cs);
+
+#endif /* _TB_FLUSH_H_ */
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 3576da413f..9333db4f51 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -20,6 +20,7 @@
 
 #include "exec/user/thunk.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "qemu/log.h"
 
 extern char *exec_path;
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 96af23dc5d..813695b402 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -11,6 +11,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/tb-flush.h"
 #include "exec/exec-all.h"
 
 void tb_flush(CPUState *cpu)
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index efefa08ee1..7246c1c46b 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -22,6 +22,7 @@
 #include "exec/cputlb.h"
 #include "exec/log.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/translate-all.h"
 #include "sysemu/tcg.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4b5abc0f44..7096e68406 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -47,6 +47,7 @@
 #include "exec/cputlb.h"
 #include "exec/translate-all.h"
 #include "exec/translator.h"
+#include "exec/tb-flush.h"
 #include "qemu/bitmap.h"
 #include "qemu/qemu-print.h"
 #include "qemu/main-loop.h"
diff --git a/cpu.c b/cpu.c
index 2e9f931249..e6abc6c76c 100644
--- a/cpu.c
+++ b/cpu.c
@@ -36,6 +36,7 @@
 #include "exec/replay-core.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/translate-all.h"
 #include "exec/log.h"
 #include "hw/core/accel-cpu.h"
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index ef506faa8e..abb1777e73 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -47,6 +47,8 @@
 #include "semihosting/semihost.h"
 #include "exec/exec-all.h"
 #include "exec/replay-core.h"
+#include "exec/tb-flush.h"
+#include "exec/hwaddr.h"
 
 #include "internals.h"
 
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 925ff523cc..ec4def62f8 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -8,6 +8,7 @@
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "helper_regs.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/spapr.h"
diff --git a/plugins/core.c b/plugins/core.c
index e04ffa1ba4..04632886b9 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -24,6 +24,7 @@
 #include "exec/cpu-common.h"
 
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
diff --git a/plugins/loader.c b/plugins/loader.c
index 88c30bde2d..809f3f9b13 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -29,7 +29,7 @@
 #include "qemu/plugin.h"
 #include "qemu/memalign.h"
 #include "hw/core/cpu.h"
-#include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/boards.h"
 #endif
diff --git a/target/alpha/sys_helper.c b/target/alpha/sys_helper.c
index 25f6cb8894..c83c92dd4c 100644
--- a/target/alpha/sys_helper.c
+++ b/target/alpha/sys_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "exec/helper-proto.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..74c64d4902 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -25,6 +25,7 @@
 #include "time_helper.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "exec/tb-flush.h"
 #include "sysemu/cpu-timers.h"
 #include "qemu/guest-random.h"
 #include "qapi/error.h"
-- 
2.39.2
