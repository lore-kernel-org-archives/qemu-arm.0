Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf8ccb0sm5820322a12.30.2025.03.24.03.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:21:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F1B335FB96;
	Mon, 24 Mar 2025 10:21:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 04/11] gdbstub: introduce target independent gdb register helper
Date: Mon, 24 Mar 2025 10:21:35 +0000
Message-Id: <20250324102142.67022-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324102142.67022-1-alex.bennee@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 36ZlayiqYBiM

The current helper.h functions rely on hard coded assumptions about
target endianess to use the tswap macros. We also end up double
swapping a bunch of values if the target can run in multiple endianess
modes. Avoid this by getting the target to pass the endianess and size
via a MemOp and fixing up appropriately.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use unsigned consistently
  - fix some rouge whitespace
  - add typed reg32/64 wrappers
  - pass void * to underlying helper to avoid casting
---
 include/gdbstub/registers.h | 55 +++++++++++++++++++++++++++++++++++++
 gdbstub/gdbstub.c           | 23 ++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 include/gdbstub/registers.h

diff --git a/include/gdbstub/registers.h b/include/gdbstub/registers.h
new file mode 100644
index 0000000000..2220f58efe
--- /dev/null
+++ b/include/gdbstub/registers.h
@@ -0,0 +1,55 @@
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
+ * There are wrapper functions for the common sizes you can use to
+ * keep type checking.
+ *
+ * Returns the number of bytes written to the array.
+ */
+int gdb_get_register_value(MemOp op, GByteArray *buf, void *val);
+
+/**
+ * gdb_get_reg32_value() - type checked wrapper for gdb_get_register_value()
+ * mo: size and endian MemOp
+ * buf: GByteArray to store in target order
+ * val: pointer to uint32_t value in host order
+ */
+static inline int gdb_get_reg32_value(MemOp op, GByteArray *buf, uint32_t *val) {
+    g_assert((op & MO_SIZE) == MO_32);
+    return gdb_get_register_value(op, buf, val);
+}
+
+/**
+ * gdb_get_reg64_value() - type checked wrapper for gdb_get_register_value()
+ * mo: size and endian MemOp
+ * buf: GByteArray to store in target order
+ * val: pointer to uint32_t value in host order
+ */
+static inline int gdb_get_reg64_value(MemOp op, GByteArray *buf, uint64_t *val) {
+    g_assert((op & MO_SIZE) == MO_64);
+    return gdb_get_register_value(op, buf, val);
+}
+
+#endif /* GDB_REGISTERS_H */
+
+
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index b6d5e11e03..e799fdc019 100644
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
 
@@ -551,6 +553,27 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
     return 0;
 }
 
+/*
+ * Target helper function to read value into GByteArray, target
+ * supplies the size and target endianess via the MemOp.
+ */
+int gdb_get_register_value(MemOp op, GByteArray *buf, void *val)
+{
+    unsigned bytes = memop_size(op);
+
+    if (op & MO_BSWAP) {
+        uint8_t *ptr = &((uint8_t *) val)[bytes - 1];
+        for (unsigned i = bytes; i > 0; i--) {
+            g_byte_array_append(buf, ptr--, 1);
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
