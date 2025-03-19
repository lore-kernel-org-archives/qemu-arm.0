Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3ae04a94sm28486135e9.0.2025.03.19.11.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 11:22:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 64E795FA87;
	Wed, 19 Mar 2025 18:22:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH 02/10] gdbstub: introduce target independent gdb register helper
Date: Wed, 19 Mar 2025 18:22:47 +0000
Message-Id: <20250319182255.3096731-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319182255.3096731-1-alex.bennee@linaro.org>
References: <20250319182255.3096731-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8iXzbFwz7b9L

The current helper.h functions rely on hard coded assumptions about
target endianess to use the tswap macros. We also end up double
swapping a bunch of values if the target can run in multiple endianess
modes. Avoid this by getting the target to pass the endianess and size
via a MemOp and fixing up appropriately.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/gdbstub/registers.h | 30 ++++++++++++++++++++++++++++++
 gdbstub/gdbstub.c           | 22 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 include/gdbstub/registers.h

diff --git a/include/gdbstub/registers.h b/include/gdbstub/registers.h
new file mode 100644
index 0000000000..4abc7a6ae7
--- /dev/null
+++ b/include/gdbstub/registers.h
@@ -0,0 +1,30 @@
+/*
+ * GDB Common Register Helpers
+ *
+ * Copyright (c) 2025 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef GDB_REGISTERS_H
+#define GDB_REGISTERS_H
+
+#include "exec/memop.h"
+
+/**
+ * gdb_get_register_value() - get register value for gdb
+ * mo: size and endian MemOp
+ * buf: GByteArray to store in target order
+ * val: pointer to value in host order
+ *
+ * This replaces the previous legacy read functions with a single
+ * function to handle all sizes. Passing @mo allows the target mode to
+ * be taken into account and avoids using hard coded tswap() macros.
+ *
+ * Returns the number of bytes written to the array.
+ */
+int gdb_get_register_value(MemOp op, GByteArray *buf, uint8_t *val);
+
+#endif /* GDB_REGISTERS_H */
+
+
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 282e13e163..3d7b1028e4 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -32,6 +32,7 @@
 #include "exec/gdbstub.h"
 #include "gdbstub/commands.h"
 #include "gdbstub/syscalls.h"
+#include "gdbstub/registers.h"
 #ifdef CONFIG_USER_ONLY
 #include "accel/tcg/vcpu-state.h"
 #include "gdbstub/user.h"
@@ -45,6 +46,7 @@
 #include "system/runstate.h"
 #include "exec/replay-core.h"
 #include "exec/hwaddr.h"
+#include "exec/memop.h"
 
 #include "internals.h"
 
@@ -551,6 +553,26 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
     return 0;
 }
 
+/*
+ * Target helper function to read value into GByteArray, target
+ * supplies the size and target endianess via the MemOp.
+ */
+int gdb_get_register_value(MemOp op, GByteArray *buf, uint8_t *val)
+{
+    size_t bytes = memop_size(op);
+
+    if (op & MO_BSWAP) {
+        for ( int i = bytes ; i > 0; i--) {
+            g_byte_array_append(buf, &val[i - 1], 1);
+        };
+    } else {
+        g_byte_array_append(buf, val, bytes);
+    }
+
+    return bytes;
+}
+
+
 static void gdb_register_feature(CPUState *cpu, int base_reg,
                                  gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
                                  const GDBFeature *feature)
-- 
2.39.5
