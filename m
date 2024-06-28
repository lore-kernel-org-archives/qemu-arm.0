Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf6339bsm76915266b.80.2024.06.28.05.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:43:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9FB815F7A1;
	Fri, 28 Jun 2024 13:43:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH 17/23] target/arm: Make some MTE helpers widely available
Date: Fri, 28 Jun 2024 13:42:52 +0100
Message-Id: <20240628124258.832466-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628124258.832466-1-alex.bennee@linaro.org>
References: <20240628124258.832466-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FfWB9dsehgGX

From: Gustavo Romero <gustavo.romero@linaro.org>

Make the MTE helpers allocation_tag_mem_probe, load_tag1, and store_tag1
available to other subsystems.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240628050850.536447-6-gustavo.romero@linaro.org>
---
 target/arm/tcg/mte_helper.h | 66 +++++++++++++++++++++++++++++++++++++
 target/arm/tcg/mte_helper.c | 45 ++++---------------------
 2 files changed, 73 insertions(+), 38 deletions(-)
 create mode 100644 target/arm/tcg/mte_helper.h

diff --git a/target/arm/tcg/mte_helper.h b/target/arm/tcg/mte_helper.h
new file mode 100644
index 0000000000..1f471fb69b
--- /dev/null
+++ b/target/arm/tcg/mte_helper.h
@@ -0,0 +1,66 @@
+/*
+ * ARM MemTag operation helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef TARGET_ARM_MTE_H
+#define TARGET_ARM_MTE_H
+
+#include "exec/mmu-access-type.h"
+
+/**
+ * allocation_tag_mem_probe:
+ * @env: the cpu environment
+ * @ptr_mmu_idx: the addressing regime to use for the virtual address
+ * @ptr: the virtual address for which to look up tag memory
+ * @ptr_access: the access to use for the virtual address
+ * @ptr_size: the number of bytes in the normal memory access
+ * @tag_access: the access to use for the tag memory
+ * @probe: true to merely probe, never taking an exception
+ * @ra: the return address for exception handling
+ *
+ * Our tag memory is formatted as a sequence of little-endian nibbles.
+ * That is, the byte at (addr >> (LOG2_TAG_GRANULE + 1)) contains two
+ * tags, with the tag at [3:0] for the lower addr and the tag at [7:4]
+ * for the higher addr.
+ *
+ * Here, resolve the physical address from the virtual address, and return
+ * a pointer to the corresponding tag byte.
+ *
+ * If there is no tag storage corresponding to @ptr, return NULL.
+ *
+ * If the page is inaccessible for @ptr_access, or has a watchpoint, there are
+ * three options:
+ * (1) probe = true, ra = 0 : pure probe -- we return NULL if the page is not
+ *     accessible, and do not take watchpoint traps. The calling code must
+ *     handle those cases in the right priority compared to MTE traps.
+ * (2) probe = false, ra = 0 : probe, no fault expected -- the caller guarantees
+ *     that the page is going to be accessible. We will take watchpoint traps.
+ * (3) probe = false, ra != 0 : non-probe -- we will take both memory access
+ *     traps and watchpoint traps.
+ * (probe = true, ra != 0 is invalid and will assert.)
+ */
+uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
+                                  uint64_t ptr, MMUAccessType ptr_access,
+                                  int ptr_size, MMUAccessType tag_access,
+                                  bool probe, uintptr_t ra);
+
+/**
+ * load_tag1 - Load 1 tag (nibble) from byte
+ * @ptr: The tagged address
+ * @mem: The tag address (packed, 2 tags in byte)
+ */
+int load_tag1(uint64_t ptr, uint8_t *mem);
+
+/**
+ * store_tag1 - Store 1 tag (nibble) into byte
+ * @ptr: The tagged address
+ * @mem: The tag address (packed, 2 tags in byte)
+ * @tag: The tag to be stored in the nibble
+ */
+void store_tag1(uint64_t ptr, uint8_t *mem, int tag);
+
+#endif /* TARGET_ARM_MTE_H */
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index a50d576294..9d2ba287ee 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -29,6 +29,7 @@
 #include "hw/core/tcg-cpu-ops.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
+#include "mte_helper.h"
 
 
 static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
@@ -50,42 +51,10 @@ static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
     return tag;
 }
 
-/**
- * allocation_tag_mem_probe:
- * @env: the cpu environment
- * @ptr_mmu_idx: the addressing regime to use for the virtual address
- * @ptr: the virtual address for which to look up tag memory
- * @ptr_access: the access to use for the virtual address
- * @ptr_size: the number of bytes in the normal memory access
- * @tag_access: the access to use for the tag memory
- * @probe: true to merely probe, never taking an exception
- * @ra: the return address for exception handling
- *
- * Our tag memory is formatted as a sequence of little-endian nibbles.
- * That is, the byte at (addr >> (LOG2_TAG_GRANULE + 1)) contains two
- * tags, with the tag at [3:0] for the lower addr and the tag at [7:4]
- * for the higher addr.
- *
- * Here, resolve the physical address from the virtual address, and return
- * a pointer to the corresponding tag byte.
- *
- * If there is no tag storage corresponding to @ptr, return NULL.
- *
- * If the page is inaccessible for @ptr_access, or has a watchpoint, there are
- * three options:
- * (1) probe = true, ra = 0 : pure probe -- we return NULL if the page is not
- *     accessible, and do not take watchpoint traps. The calling code must
- *     handle those cases in the right priority compared to MTE traps.
- * (2) probe = false, ra = 0 : probe, no fault expected -- the caller guarantees
- *     that the page is going to be accessible. We will take watchpoint traps.
- * (3) probe = false, ra != 0 : non-probe -- we will take both memory access
- *     traps and watchpoint traps.
- * (probe = true, ra != 0 is invalid and will assert.)
- */
-static uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
-                                         uint64_t ptr, MMUAccessType ptr_access,
-                                         int ptr_size, MMUAccessType tag_access,
-                                         bool probe, uintptr_t ra)
+uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
+                                  uint64_t ptr, MMUAccessType ptr_access,
+                                  int ptr_size, MMUAccessType tag_access,
+                                  bool probe, uintptr_t ra)
 {
 #ifdef CONFIG_USER_ONLY
     uint64_t clean_ptr = useronly_clean_ptr(ptr);
@@ -287,7 +256,7 @@ uint64_t HELPER(addsubg)(CPUARMState *env, uint64_t ptr,
     return address_with_allocation_tag(ptr + offset, rtag);
 }
 
-static int load_tag1(uint64_t ptr, uint8_t *mem)
+int load_tag1(uint64_t ptr, uint8_t *mem)
 {
     int ofs = extract32(ptr, LOG2_TAG_GRANULE, 1) * 4;
     return extract32(*mem, ofs, 4);
@@ -321,7 +290,7 @@ static void check_tag_aligned(CPUARMState *env, uint64_t ptr, uintptr_t ra)
 }
 
 /* For use in a non-parallel context, store to the given nibble.  */
-static void store_tag1(uint64_t ptr, uint8_t *mem, int tag)
+void store_tag1(uint64_t ptr, uint8_t *mem, int tag)
 {
     int ofs = extract32(ptr, LOG2_TAG_GRANULE, 1) * 4;
     *mem = deposit32(*mem, ofs, 4, tag);
-- 
2.39.2
