Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id z10-20020adfec8a000000b0022afe4fb459sm14283990wrn.51.2022.09.26.06.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 06:39:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C3A0A1FFB8;
	Mon, 26 Sep 2022 14:39:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	mads@ynddal.dk,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 01/11] hw: encode accessing CPU index in MemTxAttrs
Date: Mon, 26 Sep 2022 14:38:54 +0100
Message-Id: <20220926133904.3297263-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926133904.3297263-1-alex.bennee@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 60Q+aYsbmHyG

We currently have hacks across the hw/ to reference current_cpu to
work out what the current accessing CPU is. This breaks in some cases
including using gdbstub to access HW state. As we have MemTxAttrs to
describe details about the access lets extend it to mention if this is
a CPU access and which one it is.

There are a number of places we need to fix up including:

  CPU helpers directly calling address_space_*() fns
  models in hw/ fishing the data out of current_cpu
  hypervisors offloading device emulation to QEMU

I'll start addressing some of these in following patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use separate field cpu_index
  - bool for requester_is_cpu
v3
  - switch to enum MemTxRequesterType
  - move helper #define to patch
  - revert to overloading requester_id
  - mention hypervisors in commit message
  - drop cputlb tweaks, they will move to target specific code
---
 include/exec/memattrs.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..0fb5f29d25 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -14,6 +14,15 @@
 #ifndef MEMATTRS_H
 #define MEMATTRS_H
 
+/*
+ * Where the memory transaction comes from
+ */
+typedef enum MemTxRequesterType {
+    MEMTXATTRS_CPU,
+    MEMTXATTRS_MSI,
+} MemTxRequesterType;
+
+
 /* Every memory transaction has associated with it a set of
  * attributes. Some of these are generic (such as the ID of
  * the bus master); some are specific to a particular kind of
@@ -43,7 +52,9 @@ typedef struct MemTxAttrs {
      * (see MEMTX_ACCESS_ERROR).
      */
     unsigned int memory:1;
-    /* Requester ID (for MSI for example) */
+    /* Requester type (e.g. CPU or PCI MSI) */
+    MemTxRequesterType requester_type:2;
+    /* Requester ID */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
@@ -66,6 +77,10 @@ typedef struct MemTxAttrs {
  */
 #define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
 
+/* Helper for setting a basic CPU sourced transaction */
+#define MEMTXATTRS_CPU(id) ((MemTxAttrs) \
+                            {.requester_type = MEMTXATTRS_CPU, .requester_id = id})
+
 /* New-style MMIO accessors can indicate that the transaction failed.
  * A zero (MEMTX_OK) response means success; anything else is a failure
  * of some kind. The memory subsystem will bitwise-OR together results
-- 
2.34.1
