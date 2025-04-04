Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp5086982njd;
        Fri, 4 Apr 2025 15:35:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYRh8LBdTEEZcGlwXJ7ZdcQEOF5gI+KLtM3CBJN3qt4T2nxviRPxbEY/KiW4PjkRqwOfwwkMGN89p7jg==@linaro.org
X-Received: by 2002:a05:600c:444b:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-43ecf8f2a65mr43854055e9.15.1743806159101;
        Fri, 04 Apr 2025 15:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743806159; cv=none;
        d=google.com; s=arc-20240605;
        b=OWR8zWZWoFP6vv06+UH19FKzcBAjAJMlqqDnCXIl0QBtV1M/k2pE6DktMSmxL+4Wv8
         0q0F62NcqVuy8UC2bdfyZWsPxh9XUhxdL2hevWmkv4BJ4XO9uDBkDW6CFdaj+hiYR3Ya
         p5si4NpMTYyaer3JODS5G/C5w9Qj1KtVK1ov8+J6nLTOP98AgNQyGWRsz3jMNRVFL0XH
         dNx50Jr7KDpjGDSq40xBMOwO1PKWAKx+S+LbaTebA5DSBFuHY7CjkKJb3IKSMjsNQScs
         CVS+KFtJpi5lKnbkXccKQUTKfg/WiBIxrqv7XyaQYhj2fEsWOfZaaOaLoFXEpQV7b6tT
         4S8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=irY319rrs0XiticUklqQmS8GpxuelJZIzQiKhO4KKuc=;
        fh=p7chR2xjYGnJfhK8jJkW6xo6peHCQRkf2wjrpq2O5oE=;
        b=RXf/PxQ1sA1iPVfZ/DB7r2GiNTSAGRXSgrsEPLWkDPhCbhNRgghhewqylyJ9Wk8ikL
         H+KZj2RwOvXXlgNaGuCgauDk3yTm0G3ad1iz+2icoT6R4vPXTSuxlRDCVRiBYWbI7bsb
         XjnaupgOg1BrUyhZSsfIrWubql9GtaQutjdzMk0wQx13/+4kiraDPd4a9JXUjJ+MzlzR
         hinhCkII9m9QeiF8k9DGZypCN2PA17Yl4YTjuLyn6uTfMI1d7d4mZtz7NFQPPywSZ/BW
         /CC7AhrDMVgOSOQmmDQeG0KrxeX7F2DY6u/GtGFJt56iLPiJY0xT9k1hfafb1GmNG3An
         aJ1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jd602sN+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec2c5f4cfsor20997065e9.8.2025.04.04.15.35.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Apr 2025 15:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jd602sN+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743806158; x=1744410958; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irY319rrs0XiticUklqQmS8GpxuelJZIzQiKhO4KKuc=;
        b=Jd602sN+LUa/GWOhKqboNKYDQx3jLbN2Mk/Ea5k4aRN7zOLjoSxxbYQXfPoFrmXL0L
         7zm2UhgFTATwD5nogFrk4u7L8lrLmtPczz47CLWabTG8jPQwQOiMPVBf7SU4WZlB+y+/
         P0QfsYsnsdUdwJzQoq87K377BPcgVEcQqEMrmmdLvt7HiJZpwq1VhfPGcDVR6G5kAEnd
         UF36nD0dYdU7M+9WWV4mIEzu9q2MzbvzCvs1e4em39e3tVHhrLb8Wjasi9tnBgOwnk6P
         nvIF/1FQhIpuaypKzZNHEzUMCDH+vTtDgSYkA/8UK1QEvn9FH+66K+aRi06RLEsUUhvt
         xv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806158; x=1744410958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irY319rrs0XiticUklqQmS8GpxuelJZIzQiKhO4KKuc=;
        b=nlFwwadRF4WaiOCxDCqRziv/ZB7yzCYBXYWoDOMgCY6sJVtD0UHKOyH2UK+1ZTRErV
         r+Y/JDm4eX07ibEVqZ+RF0YSEgdejyxKpP4tdgzO6dBmQluMou6meIg+BXimZvx0he2E
         gNsmlhvt9QVTzZK9oK+XX7KKF+qCRa0tErPmwV60xT1r9LN7vbAHwc92UveoGq8TTrSs
         ulV+Ao9DWfglYy/RFEVQo7vbTnpS1ROkHctVBd7ecMJnEEp0NmHVHKh8WTMWzfNJmlkl
         WTJWszEnHOMZX0i5w9g0gPNzkBdcWtP03RLnplnfiTRcdJzqym30Mns4258J3wLpwY/O
         brBw==
X-Forwarded-Encrypted: i=1; AJvYcCWOyaJ5tRJane0XRE2cyxdvyMRMBcJcRnr2z8hVmsM6BScpaVHiV8mq8D2gZIbOpGiToHszHLrMA/xTpg==@linaro.org
X-Gm-Message-State: AOJu0YwUIlUjLZrxaHo67HemMU8pw5LaTJP6o6DaQnvoSaTbyoR2oSpv
	O2x7kSFJATNp8155nhKJeh6DL8VMxSOOcHkeT60msYqyrws/Ws1xZ+HNJP/Kd+j7nA==
X-Gm-Gg: ASbGncsMiHS95dYRCRSs8qp85TXTVPjREyL4ysl4I2vYd+UHQtlPeRYCKGk/QLm9CWD
	XeSPjtXEzgzlKFEg9l5ZG6hBlEI1vWJJfdqB1IbKCRk3HgWY8mMb7BrWx+CVeD40B2RL6DMlTPA
	Km+WHYrq6HbrhUmTPWUSV7Ba7SDiawBEzPZCcfamGpIVrHjZLG4q8vMYHNVcIeubO4160MnrTBQ
	jp9yIhmPzPfcsSpKwOAT06f+fmU5Vhp26KYcwWO3xWXqg6pnqqdRH5Uurgmvo7zi0c1SE09kQ7x
	oM8YwErwzwzUS9+VLRnBQzcEzaa3yTs7kH6Q5ZTk3Mz9qvweeowaZsx/Oju0ITGV322/ej14WAI
	CLzloukdeQiwu7hUGfy7sQCTx
X-Google-Smtp-Source: AGHT+IF/jjUKdx0KdUxc/kwq/otGXJ5PU/qkVJ+SY7vkDXE6rIZxtPtl78453GN+ygbobgGg0ImKQQ==
X-Received: by 2002:a05:600c:1c07:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-43ecf84287dmr44903905e9.4.1743806158410;
        Fri, 04 Apr 2025 15:35:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342827fsm57617575e9.6.2025.04.04.15.35.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Apr 2025 15:35:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 7/9] target/arm/mte: Restrict MTE declarations
Date: Sat,  5 Apr 2025 00:35:19 +0200
Message-ID: <20250404223521.38781-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250404223521.38781-1-philmd@linaro.org>
References: <20250404223521.38781-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AUaDbVlm9pK7

Move MTE declarations out of "internals.h" to TCG "mte.h".
Include "mte.h" when necessary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h             | 121 --------------------
 target/arm/tcg/mte.h               | 124 ++++++++++++++++++++
 target/arm/tcg/sve_ldst_internal.h |   1 +
 target/arm/tcg/helper-a64.c        |   1 +
 target/arm/tcg/mte.c               | 175 +++++++++++++++++++++++++++++
 target/arm/tcg/mte_helper.c        | 160 +-------------------------
 target/arm/tcg/sve_helper.c        |   1 +
 target/arm/tcg/translate-a64.c     |   1 +
 target/arm/tcg/translate-sve.c     |   1 +
 target/arm/tcg/meson.build         |   1 +
 10 files changed, 306 insertions(+), 280 deletions(-)
 create mode 100644 target/arm/tcg/mte.c

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 0728e5c5348..5e549b95e14 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1624,127 +1624,6 @@ FIELD(PREDDESC, OPRSZ, 0, 6)
 FIELD(PREDDESC, ESZ, 6, 2)
 FIELD(PREDDESC, DATA, 8, 24)
 
-/*
- * The SVE simd_data field, for memory ops, contains either
- * rd (5 bits) or a shift count (2 bits).
- */
-#define SVE_MTEDESC_SHIFT 5
-
-/* Bits within a descriptor passed to the helper_mte_check* functions. */
-FIELD(MTEDESC, MIDX,  0, 4)
-FIELD(MTEDESC, TBI,   4, 2)
-FIELD(MTEDESC, TCMA,  6, 2)
-FIELD(MTEDESC, WRITE, 8, 1)
-FIELD(MTEDESC, ALIGN, 9, 3)
-FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - SVE_MTEDESC_SHIFT - 12)  /* size - 1 */
-
-bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
-uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
-
-/**
- * mte_mops_probe: Check where the next MTE failure is for a FEAT_MOPS operation
- * @env: CPU env
- * @ptr: start address of memory region (dirty pointer)
- * @size: length of region (guaranteed not to cross a page boundary)
- * @desc: MTEDESC descriptor word (0 means no MTE checks)
- * Returns: the size of the region that can be copied without hitting
- *          an MTE tag failure
- *
- * Note that we assume that the caller has already checked the TBI
- * and TCMA bits with mte_checks_needed() and an MTE check is definitely
- * required.
- */
-uint64_t mte_mops_probe(CPUARMState *env, uint64_t ptr, uint64_t size,
-                        uint32_t desc);
-
-/**
- * mte_mops_probe_rev: Check where the next MTE failure is for a FEAT_MOPS
- *                     operation going in the reverse direction
- * @env: CPU env
- * @ptr: *end* address of memory region (dirty pointer)
- * @size: length of region (guaranteed not to cross a page boundary)
- * @desc: MTEDESC descriptor word (0 means no MTE checks)
- * Returns: the size of the region that can be copied without hitting
- *          an MTE tag failure
- *
- * Note that we assume that the caller has already checked the TBI
- * and TCMA bits with mte_checks_needed() and an MTE check is definitely
- * required.
- */
-uint64_t mte_mops_probe_rev(CPUARMState *env, uint64_t ptr, uint64_t size,
-                            uint32_t desc);
-
-/**
- * mte_check_fail: Record an MTE tag check failure
- * @env: CPU env
- * @desc: MTEDESC descriptor word
- * @dirty_ptr: Failing dirty address
- * @ra: TCG retaddr
- *
- * This may never return (if the MTE tag checks are configured to fault).
- */
-void mte_check_fail(CPUARMState *env, uint32_t desc,
-                    uint64_t dirty_ptr, uintptr_t ra);
-
-/**
- * mte_mops_set_tags: Set MTE tags for a portion of a FEAT_MOPS operation
- * @env: CPU env
- * @dirty_ptr: Start address of memory region (dirty pointer)
- * @size: length of region (guaranteed not to cross page boundary)
- * @desc: MTEDESC descriptor word
- */
-void mte_mops_set_tags(CPUARMState *env, uint64_t dirty_ptr, uint64_t size,
-                       uint32_t desc);
-
-static inline int allocation_tag_from_addr(uint64_t ptr)
-{
-    return extract64(ptr, 56, 4);
-}
-
-/* Return true if tbi bits mean that the access is checked.  */
-static inline bool tbi_check(uint32_t desc, int bit55)
-{
-    return (desc >> (R_MTEDESC_TBI_SHIFT + bit55)) & 1;
-}
-
-/* Return true if tcma bits mean that the access is unchecked.  */
-static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
-{
-    /*
-     * We had extracted bit55 and ptr_tag for other reasons, so fold
-     * (ptr<59:55> == 00000 || ptr<59:55> == 11111) into a single test.
-     */
-    bool match = ((ptr_tag + bit55) & 0xf) == 0;
-    bool tcma = (desc >> (R_MTEDESC_TCMA_SHIFT + bit55)) & 1;
-    return tcma && match;
-}
-
-/*
- * For TBI, ideally, we would do nothing.  Proper behaviour on fault is
- * for the tag to be present in the FAR_ELx register.  But for user-only
- * mode, we do not have a TLB with which to implement this, so we must
- * remove the top byte.
- */
-static inline uint64_t useronly_clean_ptr(uint64_t ptr)
-{
-#ifdef CONFIG_USER_ONLY
-    /* TBI0 is known to be enabled, while TBI1 is disabled. */
-    ptr &= sextract64(ptr, 0, 56);
-#endif
-    return ptr;
-}
-
-static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
-{
-#ifdef CONFIG_USER_ONLY
-    int64_t clean_ptr = sextract64(ptr, 0, 56);
-    if (tbi_check(desc, clean_ptr < 0)) {
-        ptr = clean_ptr;
-    }
-#endif
-    return ptr;
-}
-
 /* Values for M-profile PSR.ECI for MVE insns */
 enum MVEECIState {
     ECI_NONE = 0, /* No completed beats */
diff --git a/target/arm/tcg/mte.h b/target/arm/tcg/mte.h
index 1f471fb69b1..ecb0fc76b03 100644
--- a/target/arm/tcg/mte.h
+++ b/target/arm/tcg/mte.h
@@ -9,7 +9,24 @@
 #ifndef TARGET_ARM_MTE_H
 #define TARGET_ARM_MTE_H
 
+#include "qemu/bitops.h"
 #include "exec/mmu-access-type.h"
+#include "tcg/tcg-gvec-desc.h"
+#include "hw/registerfields.h"
+
+/*
+ * The SVE simd_data field, for memory ops, contains either
+ * rd (5 bits) or a shift count (2 bits).
+ */
+#define SVE_MTEDESC_SHIFT 5
+
+/* Bits within a descriptor passed to the helper_mte_check* functions. */
+FIELD(MTEDESC, MIDX,  0, 4)
+FIELD(MTEDESC, TBI,   4, 2)
+FIELD(MTEDESC, TCMA,  6, 2)
+FIELD(MTEDESC, WRITE, 8, 1)
+FIELD(MTEDESC, ALIGN, 9, 3)
+FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - SVE_MTEDESC_SHIFT - 12)  /* size - 1 */
 
 /**
  * allocation_tag_mem_probe:
@@ -63,4 +80,111 @@ int load_tag1(uint64_t ptr, uint8_t *mem);
  */
 void store_tag1(uint64_t ptr, uint8_t *mem, int tag);
 
+bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
+uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
+
+/**
+ * mte_mops_probe: Check where the next MTE failure is for a FEAT_MOPS operation
+ * @env: CPU env
+ * @ptr: start address of memory region (dirty pointer)
+ * @size: length of region (guaranteed not to cross a page boundary)
+ * @desc: MTEDESC descriptor word (0 means no MTE checks)
+ * Returns: the size of the region that can be copied without hitting
+ *          an MTE tag failure
+ *
+ * Note that we assume that the caller has already checked the TBI
+ * and TCMA bits with mte_checks_needed() and an MTE check is definitely
+ * required.
+ */
+uint64_t mte_mops_probe(CPUARMState *env, uint64_t ptr, uint64_t size,
+                        uint32_t desc);
+
+/**
+ * mte_mops_probe_rev: Check where the next MTE failure is for a FEAT_MOPS
+ *                     operation going in the reverse direction
+ * @env: CPU env
+ * @ptr: *end* address of memory region (dirty pointer)
+ * @size: length of region (guaranteed not to cross a page boundary)
+ * @desc: MTEDESC descriptor word (0 means no MTE checks)
+ * Returns: the size of the region that can be copied without hitting
+ *          an MTE tag failure
+ *
+ * Note that we assume that the caller has already checked the TBI
+ * and TCMA bits with mte_checks_needed() and an MTE check is definitely
+ * required.
+ */
+uint64_t mte_mops_probe_rev(CPUARMState *env, uint64_t ptr, uint64_t size,
+                            uint32_t desc);
+
+/**
+ * mte_check_fail: Record an MTE tag check failure
+ * @env: CPU env
+ * @desc: MTEDESC descriptor word
+ * @dirty_ptr: Failing dirty address
+ * @ra: TCG retaddr
+ *
+ * This may never return (if the MTE tag checks are configured to fault).
+ */
+void mte_check_fail(CPUARMState *env, uint32_t desc,
+                    uint64_t dirty_ptr, uintptr_t ra);
+
+/**
+ * mte_mops_set_tags: Set MTE tags for a portion of a FEAT_MOPS operation
+ * @env: CPU env
+ * @dirty_ptr: Start address of memory region (dirty pointer)
+ * @size: length of region (guaranteed not to cross page boundary)
+ * @desc: MTEDESC descriptor word
+ */
+void mte_mops_set_tags(CPUARMState *env, uint64_t dirty_ptr, uint64_t size,
+                       uint32_t desc);
+
+static inline int allocation_tag_from_addr(uint64_t ptr)
+{
+    return extract64(ptr, 56, 4);
+}
+
+/* Return true if tbi bits mean that the access is checked.  */
+static inline bool tbi_check(uint32_t desc, int bit55)
+{
+    return (desc >> (R_MTEDESC_TBI_SHIFT + bit55)) & 1;
+}
+
+/* Return true if tcma bits mean that the access is unchecked.  */
+static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
+{
+    /*
+     * We had extracted bit55 and ptr_tag for other reasons, so fold
+     * (ptr<59:55> == 00000 || ptr<59:55> == 11111) into a single test.
+     */
+    bool match = ((ptr_tag + bit55) & 0xf) == 0;
+    bool tcma = (desc >> (R_MTEDESC_TCMA_SHIFT + bit55)) & 1;
+    return tcma && match;
+}
+
+/*
+ * For TBI, ideally, we would do nothing.  Proper behaviour on fault is
+ * for the tag to be present in the FAR_ELx register.  But for user-only
+ * mode, we do not have a TLB with which to implement this, so we must
+ * remove the top byte.
+ */
+static inline uint64_t useronly_clean_ptr(uint64_t ptr)
+{
+#ifdef CONFIG_USER_ONLY
+    /* TBI0 is known to be enabled, while TBI1 is disabled. */
+    ptr &= sextract64(ptr, 0, 56);
+#endif
+    return ptr;
+}
+
+static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
+{
+#ifdef CONFIG_USER_ONLY
+    int64_t clean_ptr = sextract64(ptr, 0, 56);
+    if (tbi_check(desc, clean_ptr < 0)) {
+        ptr = clean_ptr;
+    }
+#endif
+    return ptr;
+}
+
 #endif /* TARGET_ARM_MTE_H */
diff --git a/target/arm/tcg/sve_ldst_internal.h b/target/arm/tcg/sve_ldst_internal.h
index f2243daf370..a201f6b0393 100644
--- a/target/arm/tcg/sve_ldst_internal.h
+++ b/target/arm/tcg/sve_ldst_internal.h
@@ -21,6 +21,7 @@
 #define TARGET_ARM_SVE_LDST_INTERNAL_H
 
 #include "accel/tcg/cpu-ldst.h"
+#include "mte.h"
 
 /*
  * Load one element into @vd + @reg_off from @host.
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 08d8f63ffea..bcd116e2a16 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -41,6 +41,7 @@
 #include "user/page-protection.h"
 #endif
 #include "vec_internal.h"
+#include "mte.h"
 
 /* C2.4.7 Multiply and divide */
 /* special cases for 0 and LLONG_MIN are mandated by the standard */
diff --git a/target/arm/tcg/mte.c b/target/arm/tcg/mte.c
new file mode 100644
index 00000000000..d80465b08e9
--- /dev/null
+++ b/target/arm/tcg/mte.c
@@ -0,0 +1,175 @@
+/*
+ * ARM v8.5-MemTag Operations
+ *
+ * Copyright (c) 2020 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "exec/exec-all.h"
+#include "exec/target_page.h"
+#ifdef CONFIG_USER_ONLY
+#include "user/cpu_loop.h"
+#include "user/page-protection.h"
+#else
+#include "system/memory.h"
+#include "system/ram_addr.h"
+#endif
+#include "exec/tlb-flags.h"
+#include "accel/tcg/cpu-ops.h"
+#include "cpu.h"
+#include "mte.h"
+
+uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
+                                  uint64_t ptr, MMUAccessType ptr_access,
+                                  int ptr_size, MMUAccessType tag_access,
+                                  bool probe, uintptr_t ra)
+{
+#ifdef CONFIG_USER_ONLY
+    uint64_t clean_ptr = useronly_clean_ptr(ptr);
+    int flags = page_get_flags(clean_ptr);
+    uint8_t *tags;
+    uintptr_t index;
+
+    assert(!(probe && ra));
+
+    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
+        if (probe) {
+            return NULL;
+        }
+        cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_access,
+                              !(flags & PAGE_VALID), ra);
+    }
+
+    /* Require both MAP_ANON and PROT_MTE for the page. */
+    if (!(flags & PAGE_ANON) || !(flags & PAGE_MTE)) {
+        return NULL;
+    }
+
+    tags = page_get_target_data(clean_ptr);
+
+    index = extract32(ptr, LOG2_TAG_GRANULE + 1,
+                      TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
+    return tags + index;
+#else
+    CPUTLBEntryFull *full;
+    MemTxAttrs attrs;
+    int in_page, flags;
+    hwaddr ptr_paddr, tag_paddr, xlat;
+    MemoryRegion *mr;
+    ARMASIdx tag_asi;
+    AddressSpace *tag_as;
+    void *host;
+
+    /*
+     * Probe the first byte of the virtual address.  This raises an
+     * exception for inaccessible pages, and resolves the virtual address
+     * into the softmmu tlb.
+     *
+     * When RA == 0, this is either a pure probe or a no-fault-expected probe.
+     * Indicate to probe_access_flags no-fault, then either return NULL
+     * for the pure probe, or assert that we received a valid page for the
+     * no-fault-expected probe.
+     */
+    flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
+                              ra == 0, &host, &full, ra);
+    if (probe && (flags & TLB_INVALID_MASK)) {
+        return NULL;
+    }
+    assert(!(flags & TLB_INVALID_MASK));
+
+    /* If the virtual page MemAttr != Tagged, access unchecked. */
+    if (full->extra.arm.pte_attrs != 0xf0) {
+        return NULL;
+    }
+
+    /*
+     * If not backed by host ram, there is no tag storage: access unchecked.
+     * This is probably a guest os bug though, so log it.
+     */
+    if (unlikely(flags & TLB_MMIO)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Page @ 0x%" PRIx64 " indicates Tagged Normal memory "
+                      "but is not backed by host ram\n", ptr);
+        return NULL;
+    }
+
+    /*
+     * Remember these values across the second lookup below,
+     * which may invalidate this pointer via tlb resize.
+     */
+    ptr_paddr = full->phys_addr | (ptr & ~TARGET_PAGE_MASK);
+    attrs = full->attrs;
+    full = NULL;
+
+    /*
+     * The Normal memory access can extend to the next page.  E.g. a single
+     * 8-byte access to the last byte of a page will check only the last
+     * tag on the first page.
+     * Any page access exception has priority over tag check exception.
+     */
+    in_page = -(ptr | TARGET_PAGE_MASK);
+    if (unlikely(ptr_size > in_page)) {
+        flags |= probe_access_full(env, ptr + in_page, 0, ptr_access,
+                                   ptr_mmu_idx, ra == 0, &host, &full, ra);
+        assert(!(flags & TLB_INVALID_MASK));
+    }
+
+    /* Any debug exception has priority over a tag check exception. */
+    if (!probe && unlikely(flags & TLB_WATCHPOINT)) {
+        int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
+        assert(ra != 0);
+        cpu_check_watchpoint(env_cpu(env), ptr, ptr_size, attrs, wp, ra);
+    }
+
+    /* Convert to the physical address in tag space.  */
+    tag_paddr = ptr_paddr >> (LOG2_TAG_GRANULE + 1);
+
+    /* Look up the address in tag space. */
+    tag_asi = attrs.secure ? ARMASIdx_TagS : ARMASIdx_TagNS;
+    tag_as = cpu_get_address_space(env_cpu(env), tag_asi);
+    mr = address_space_translate(tag_as, tag_paddr, &xlat, NULL,
+                                 tag_access == MMU_DATA_STORE, attrs);
+
+    /*
+     * Note that @mr will never be NULL.  If there is nothing in the address
+     * space at @tag_paddr, the translation will return the unallocated memory
+     * region.  For our purposes, the result must be ram.
+     */
+    if (unlikely(!memory_region_is_ram(mr))) {
+        /* ??? Failure is a board configuration error. */
+        qemu_log_mask(LOG_UNIMP,
+                      "Tag Memory @ 0x%" HWADDR_PRIx " not found for "
+                      "Normal Memory @ 0x%" HWADDR_PRIx "\n",
+                      tag_paddr, ptr_paddr);
+        return NULL;
+    }
+
+    /*
+     * Ensure the tag memory is dirty on write, for migration.
+     * Tag memory can never contain code or display memory (vga).
+     */
+    if (tag_access == MMU_DATA_STORE) {
+        ram_addr_t tag_ra = memory_region_get_ram_addr(mr) + xlat;
+        cpu_physical_memory_set_dirty_flag(tag_ra, DIRTY_MEMORY_MIGRATION);
+    }
+
+    return memory_region_get_ram_ptr(mr) + xlat;
+#endif
+}
+
+int load_tag1(uint64_t ptr, uint8_t *mem)
+{
+    int ofs = extract32(ptr, LOG2_TAG_GRANULE, 1) * 4;
+    return extract32(*mem, ofs, 4);
+}
+
+/* For use in a non-parallel context, store to the given nibble.  */
+void store_tag1(uint64_t ptr, uint8_t *mem, int tag)
+{
+    int ofs = extract32(ptr, LOG2_TAG_GRANULE, 1) * 4;
+    *mem = deposit32(*mem, ofs, 4, tag);
+}
+
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index b70f23e2047..4ab9b858e12 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -1,5 +1,5 @@
 /*
- * ARM v8.5-MemTag Operations
+ * ARM v8.5-MemTag helpers
  *
  * Copyright (c) 2020 Linaro, Ltd.
  *
@@ -23,16 +23,9 @@
 #include "internals.h"
 #include "exec/exec-all.h"
 #include "exec/target_page.h"
-#ifdef CONFIG_USER_ONLY
-#include "user/cpu_loop.h"
-#include "user/page-protection.h"
-#else
-#include "system/ram_addr.h"
-#endif
 #include "accel/tcg/cpu-ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/tlb-flags.h"
-#include "accel/tcg/cpu-ops.h"
 #include "accel/tcg/getpc.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
@@ -58,144 +51,6 @@ static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
     return tag;
 }
 
-uint8_t *allocation_tag_mem_probe(CPUARMState *env, int ptr_mmu_idx,
-                                  uint64_t ptr, MMUAccessType ptr_access,
-                                  int ptr_size, MMUAccessType tag_access,
-                                  bool probe, uintptr_t ra)
-{
-#ifdef CONFIG_USER_ONLY
-    uint64_t clean_ptr = useronly_clean_ptr(ptr);
-    int flags = page_get_flags(clean_ptr);
-    uint8_t *tags;
-    uintptr_t index;
-
-    assert(!(probe && ra));
-
-    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
-        if (probe) {
-            return NULL;
-        }
-        cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_access,
-                              !(flags & PAGE_VALID), ra);
-    }
-
-    /* Require both MAP_ANON and PROT_MTE for the page. */
-    if (!(flags & PAGE_ANON) || !(flags & PAGE_MTE)) {
-        return NULL;
-    }
-
-    tags = page_get_target_data(clean_ptr);
-
-    index = extract32(ptr, LOG2_TAG_GRANULE + 1,
-                      TARGET_PAGE_BITS - LOG2_TAG_GRANULE - 1);
-    return tags + index;
-#else
-    CPUTLBEntryFull *full;
-    MemTxAttrs attrs;
-    int in_page, flags;
-    hwaddr ptr_paddr, tag_paddr, xlat;
-    MemoryRegion *mr;
-    ARMASIdx tag_asi;
-    AddressSpace *tag_as;
-    void *host;
-
-    /*
-     * Probe the first byte of the virtual address.  This raises an
-     * exception for inaccessible pages, and resolves the virtual address
-     * into the softmmu tlb.
-     *
-     * When RA == 0, this is either a pure probe or a no-fault-expected probe.
-     * Indicate to probe_access_flags no-fault, then either return NULL
-     * for the pure probe, or assert that we received a valid page for the
-     * no-fault-expected probe.
-     */
-    flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
-                              ra == 0, &host, &full, ra);
-    if (probe && (flags & TLB_INVALID_MASK)) {
-        return NULL;
-    }
-    assert(!(flags & TLB_INVALID_MASK));
-
-    /* If the virtual page MemAttr != Tagged, access unchecked. */
-    if (full->extra.arm.pte_attrs != 0xf0) {
-        return NULL;
-    }
-
-    /*
-     * If not backed by host ram, there is no tag storage: access unchecked.
-     * This is probably a guest os bug though, so log it.
-     */
-    if (unlikely(flags & TLB_MMIO)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "Page @ 0x%" PRIx64 " indicates Tagged Normal memory "
-                      "but is not backed by host ram\n", ptr);
-        return NULL;
-    }
-
-    /*
-     * Remember these values across the second lookup below,
-     * which may invalidate this pointer via tlb resize.
-     */
-    ptr_paddr = full->phys_addr | (ptr & ~TARGET_PAGE_MASK);
-    attrs = full->attrs;
-    full = NULL;
-
-    /*
-     * The Normal memory access can extend to the next page.  E.g. a single
-     * 8-byte access to the last byte of a page will check only the last
-     * tag on the first page.
-     * Any page access exception has priority over tag check exception.
-     */
-    in_page = -(ptr | TARGET_PAGE_MASK);
-    if (unlikely(ptr_size > in_page)) {
-        flags |= probe_access_full(env, ptr + in_page, 0, ptr_access,
-                                   ptr_mmu_idx, ra == 0, &host, &full, ra);
-        assert(!(flags & TLB_INVALID_MASK));
-    }
-
-    /* Any debug exception has priority over a tag check exception. */
-    if (!probe && unlikely(flags & TLB_WATCHPOINT)) {
-        int wp = ptr_access == MMU_DATA_LOAD ? BP_MEM_READ : BP_MEM_WRITE;
-        assert(ra != 0);
-        cpu_check_watchpoint(env_cpu(env), ptr, ptr_size, attrs, wp, ra);
-    }
-
-    /* Convert to the physical address in tag space.  */
-    tag_paddr = ptr_paddr >> (LOG2_TAG_GRANULE + 1);
-
-    /* Look up the address in tag space. */
-    tag_asi = attrs.secure ? ARMASIdx_TagS : ARMASIdx_TagNS;
-    tag_as = cpu_get_address_space(env_cpu(env), tag_asi);
-    mr = address_space_translate(tag_as, tag_paddr, &xlat, NULL,
-                                 tag_access == MMU_DATA_STORE, attrs);
-
-    /*
-     * Note that @mr will never be NULL.  If there is nothing in the address
-     * space at @tag_paddr, the translation will return the unallocated memory
-     * region.  For our purposes, the result must be ram.
-     */
-    if (unlikely(!memory_region_is_ram(mr))) {
-        /* ??? Failure is a board configuration error. */
-        qemu_log_mask(LOG_UNIMP,
-                      "Tag Memory @ 0x%" HWADDR_PRIx " not found for "
-                      "Normal Memory @ 0x%" HWADDR_PRIx "\n",
-                      tag_paddr, ptr_paddr);
-        return NULL;
-    }
-
-    /*
-     * Ensure the tag memory is dirty on write, for migration.
-     * Tag memory can never contain code or display memory (vga).
-     */
-    if (tag_access == MMU_DATA_STORE) {
-        ram_addr_t tag_ra = memory_region_get_ram_addr(mr) + xlat;
-        cpu_physical_memory_set_dirty_flag(tag_ra, DIRTY_MEMORY_MIGRATION);
-    }
-
-    return memory_region_get_ram_ptr(mr) + xlat;
-#endif
-}
-
 static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
                                    uint64_t ptr, MMUAccessType ptr_access,
                                    int ptr_size, MMUAccessType tag_access,
@@ -268,12 +123,6 @@ uint64_t HELPER(addsubg)(CPUARMState *env, uint64_t ptr,
     return address_with_allocation_tag(ptr + offset, rtag);
 }
 
-int load_tag1(uint64_t ptr, uint8_t *mem)
-{
-    int ofs = extract32(ptr, LOG2_TAG_GRANULE, 1) * 4;
-    return extract32(*mem, ofs, 4);
-}
-
 uint64_t HELPER(ldg)(CPUARMState *env, uint64_t ptr, uint64_t xt)
 {
     int mmu_idx = arm_env_mmu_index(env);
@@ -301,13 +150,6 @@ static void check_tag_aligned(CPUARMState *env, uint64_t ptr, uintptr_t ra)
     }
 }
 
-/* For use in a non-parallel context, store to the given nibble.  */
-void store_tag1(uint64_t ptr, uint8_t *mem, int tag)
-{
-    int ofs = extract32(ptr, LOG2_TAG_GRANULE, 1) * 4;
-    *mem = deposit32(*mem, ofs, 4, tag);
-}
-
 /* For use in a parallel context, atomically store to the given nibble.  */
 static void store_tag1_parallel(uint64_t ptr, uint8_t *mem, int tag)
 {
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 87b6b4b3e64..19b09d9f33f 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -35,6 +35,7 @@
 #ifdef CONFIG_USER_ONLY
 #include "user/page-protection.h"
 #endif
+#include "mte.h"
 
 
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 43408c71bbd..c320501c507 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -25,6 +25,7 @@
 #include "arm_ldst.h"
 #include "semihosting/semihost.h"
 #include "cpregs.h"
+#include "mte.h"
 
 static TCGv_i64 cpu_X[32];
 static TCGv_i64 cpu_pc;
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index d23be477b4d..7f91874abd2 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -21,6 +21,7 @@
 #include "translate.h"
 #include "translate-a64.h"
 #include "fpu/softfloat.h"
+#include "mte.h"
 
 
 typedef void GVecGen2sFn(unsigned, uint32_t, uint32_t,
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index dd12ccedb18..72750d57a7d 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -34,6 +34,7 @@ arm_ss.add(files(
   'hflags.c',
   'iwmmxt_helper.c',
   'm_helper.c',
+  'mte.c',
   'mve_helper.c',
   'neon_helper.c',
   'op_helper.c',
-- 
2.47.1
