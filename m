Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c8f3a0c33sm3824158a12.82.2024.06.12.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:35:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5FD225F93C;
	Wed, 12 Jun 2024 16:35:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mark Burton <mburton@qti.qualcomm.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-arm@nongnu.org,
	Alexander Graf <agraf@csgraf.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marco Liebel <mliebel@qti.qualcomm.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	qemu-ppc@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cameron Esfahani <dirty@apple.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 2/9] gdbstub: move enums into separate header
Date: Wed, 12 Jun 2024 16:35:01 +0100
Message-Id: <20240612153508.1532940-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240612153508.1532940-1-alex.bennee@linaro.org>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5Ms80UbJ+W8/

This is an experiment to further reduce the amount we throw into the
exec headers. It might not be as useful as I initially thought because
just under half of the users also need gdbserver_start().

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h    |  9 ---------
 include/gdbstub/enums.h   | 21 +++++++++++++++++++++
 accel/hvf/hvf-accel-ops.c |  2 +-
 accel/kvm/kvm-all.c       |  2 +-
 accel/tcg/tcg-accel-ops.c |  2 +-
 gdbstub/user.c            |  1 +
 monitor/hmp-cmds.c        |  3 ++-
 system/vl.c               |  1 +
 target/arm/hvf/hvf.c      |  2 +-
 target/arm/hyp_gdbstub.c  |  2 +-
 target/arm/kvm.c          |  2 +-
 target/i386/kvm/kvm.c     |  2 +-
 target/ppc/kvm.c          |  2 +-
 target/s390x/kvm/kvm.c    |  2 +-
 14 files changed, 34 insertions(+), 19 deletions(-)
 create mode 100644 include/gdbstub/enums.h

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 008a92198a..1bd2c4ec2a 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -1,15 +1,6 @@
 #ifndef GDBSTUB_H
 #define GDBSTUB_H
 
-#define DEFAULT_GDBSTUB_PORT "1234"
-
-/* GDB breakpoint/watchpoint types */
-#define GDB_BREAKPOINT_SW        0
-#define GDB_BREAKPOINT_HW        1
-#define GDB_WATCHPOINT_WRITE     2
-#define GDB_WATCHPOINT_READ      3
-#define GDB_WATCHPOINT_ACCESS    4
-
 typedef struct GDBFeature {
     const char *xmlname;
     const char *xml;
diff --git a/include/gdbstub/enums.h b/include/gdbstub/enums.h
new file mode 100644
index 0000000000..c4d54a1d08
--- /dev/null
+++ b/include/gdbstub/enums.h
@@ -0,0 +1,21 @@
+/*
+ * gdbstub enums
+ *
+ * Copyright (c) 2024 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef GDBSTUB_ENUMS_H
+#define GDBSTUB_ENUMS_H
+
+#define DEFAULT_GDBSTUB_PORT "1234"
+
+/* GDB breakpoint/watchpoint types */
+#define GDB_BREAKPOINT_SW        0
+#define GDB_BREAKPOINT_HW        1
+#define GDB_WATCHPOINT_WRITE     2
+#define GDB_WATCHPOINT_READ      3
+#define GDB_WATCHPOINT_ACCESS    4
+
+#endif /* GDBSTUB_ENUMS_H */
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index b2a37a2229..ac08cfb9f3 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -52,7 +52,7 @@
 #include "qemu/main-loop.h"
 #include "exec/address-spaces.h"
 #include "exec/exec-all.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/enums.h"
 #include "sysemu/cpus.h"
 #include "sysemu/hvf.h"
 #include "sysemu/hvf_int.h"
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 009b49de44..5680cd157e 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -27,7 +27,7 @@
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
 #include "hw/s390x/adapter.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/enums.h"
 #include "sysemu/kvm_int.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpus.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1433e38f40..3c19e68a79 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -35,7 +35,7 @@
 #include "exec/exec-all.h"
 #include "exec/hwaddr.h"
 #include "exec/tb-flush.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/enums.h"
 
 #include "hw/core/cpu.h"
 
diff --git a/gdbstub/user.c b/gdbstub/user.c
index edeb72efeb..e34b58b407 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -18,6 +18,7 @@
 #include "exec/gdbstub.h"
 #include "gdbstub/syscalls.h"
 #include "gdbstub/user.h"
+#include "gdbstub/enums.h"
 #include "hw/core/cpu.h"
 #include "trace.h"
 #include "internals.h"
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index ea79148ee8..067152589b 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -15,8 +15,9 @@
 
 #include "qemu/osdep.h"
 #include "exec/address-spaces.h"
-#include "exec/gdbstub.h"
 #include "exec/ioport.h"
+#include "exec/gdbstub.h"
+#include "gdbstub/enums.h"
 #include "monitor/hmp.h"
 #include "qemu/help_option.h"
 #include "monitor/monitor-internal.h"
diff --git a/system/vl.c b/system/vl.c
index a3eede5fa5..cfcb674425 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -68,6 +68,7 @@
 #include "sysemu/numa.h"
 #include "sysemu/hostmem.h"
 #include "exec/gdbstub.h"
+#include "gdbstub/enums.h"
 #include "qemu/timer.h"
 #include "chardev/char.h"
 #include "qemu/bitmap.h"
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 45e2218be5..ef9bc42738 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -33,7 +33,7 @@
 #include "trace/trace-target_arm_hvf.h"
 #include "migration/vmstate.h"
 
-#include "exec/gdbstub.h"
+#include "gdbstub/enums.h"
 
 #define MDSCR_EL1_SS_SHIFT  0
 #define MDSCR_EL1_MDE_SHIFT 15
diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index ebde2899cd..f120d55caa 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -12,7 +12,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internals.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/enums.h"
 
 /* Maximum and current break/watch point counts */
 int max_hw_bps, max_hw_wps;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7cf5cf31de..70f79eda33 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -31,7 +31,7 @@
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "exec/address-spaces.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/enums.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "qapi/visitor.h"
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 912f5d5a6b..a666129f41 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -38,7 +38,7 @@
 #include "hyperv.h"
 #include "hyperv-proto.h"
 
-#include "exec/gdbstub.h"
+#include "gdbstub/enums.h"
 #include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
 #include "qemu/ratelimit.h"
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 005f2239f3..2c3932200b 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -39,7 +39,7 @@
 #include "migration/qemu-file-types.h"
 #include "sysemu/watchdog.h"
 #include "trace.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/enums.h"
 #include "exec/memattrs.h"
 #include "exec/ram_addr.h"
 #include "sysemu/hostmem.h"
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 1b494ecc20..94181d9281 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -40,7 +40,7 @@
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
 #include "sysemu/device_tree.h"
-#include "exec/gdbstub.h"
+#include "gdbstub/enums.h"
 #include "exec/ram_addr.h"
 #include "trace.h"
 #include "hw/s390x/s390-pci-inst.h"
-- 
2.39.2
