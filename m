Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1278864njc;
        Thu, 20 Mar 2025 15:30:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNa8tknlJVtZIhW7ELxxFTc3cz8k4hS9GR8vjqD+f8xZYKGsBCkw6vo+E6Z3NzpdkvwsVYxJN8Cd0Y6g==@linaro.org
X-Received: by 2002:a17:902:ecd0:b0:223:325c:89de with SMTP id d9443c01a7336-22780c5467fmr14876335ad.1.1742509816667;
        Thu, 20 Mar 2025 15:30:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509816; cv=none;
        d=google.com; s=arc-20240605;
        b=lwVeKEf99OrvOIJFl3arid5W2AYrOQIY63JaQSGEFteC3/tVIiy+BQJ2GhOgIgZKGG
         RrtJXYmPRvaU6E9ENlmRreNJb3vA9OGC4nnnfGKu2tMskk9+ZVunTi3qg53AfTNk0B8g
         66j9wU+9T+/dZMNIEOU8hHpiCOVHae30Ho5l2ovrWjHwb79DaHOtuO5Rf+ZAa3tUJ36r
         LZc9ag1Wnb65l6/U6ww4GnpRY6pNOc+4hf9n5y1ceWWEpYDDIg8qMibNlWTWAdHu10UT
         1NyV9ZChsGud5HyzJM3UI9DWYsmuoWiXVks2OBssN/FxV2CT5PA2YMdB10R3RTuCN/uL
         8NqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7atg1QNlMwiRcOtfC+g1XTGtA+tIvR9K19RwCptDexg=;
        fh=ka7OvCsTEjOWnxzA3vee7+wVexYQSsQ14lsmZMDsblE=;
        b=VrBhkUV66j0v1LNWfV2LNvKrx/lSPVoTIIMvQ4YlG5tH7PI108FLsKFXdBgQzTbX54
         vhMV19lYONCBZffusf70mC9PUSUJ9kCWLcup0svG+Dq8qN7+8xpyT08s4GnN5YgC6PaX
         /edIbgW/L4LNFhkMID9SmdkQEWa83Cucrlme5L1MkJAH5NxQiUq3rxyoV0yBEayIJ/Tq
         uNg/iaihJGSlIA63kKUpbcdkgaOSa6TRtWL3qcBBhVAFOoQf9Ur78T84e81ogY+VX0mp
         1/2MNXkAqE8cKwDt33hnz0+GlrFFodHMyZ/cnM/AoQ0+xrcLE6W7j3nYJh3o93T3bs6O
         n7jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YfywnDd6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f3b807sor3897495ad.2.2025.03.20.15.30.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YfywnDd6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509816; x=1743114616; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7atg1QNlMwiRcOtfC+g1XTGtA+tIvR9K19RwCptDexg=;
        b=YfywnDd6sv/ychmPKHWZhgprgRWou/+FlMAvEHByXR/2mBoFsTTLurI8vBY22Lz3oF
         sLKjuEKIqFy0uM75kFpemhGBhiy1ferd6qDdZNh7fhiCzS8n3HdJ6ELpP/h17AdstIge
         HFaz8hNICkY+nj5+8ZltFrZ1MbuuAMMEJy+7QGD4DR6xl66sfULhBFum8ibefPse/Svg
         6LqGDQ0PbyQo0YKJrki8UBtgPzsmIDlj6nmABIw6fHbYC8L+k/LxgsVADf8VnF/7jxoR
         CZ+1djjuZN4iNGQQ09F4vvnoPQFRxmUyToaOkbh/EjAUpRisj4lIWg3XJfX5VDZKv8BO
         8y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509816; x=1743114616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7atg1QNlMwiRcOtfC+g1XTGtA+tIvR9K19RwCptDexg=;
        b=qKpeaMd++8NPd/3OAPqSrGeYkKnYiWKdvXVR4gX2sBY+ELc4QYHmbI+Y44jp31wB5n
         eEOSMxhE2MpEBYYCQbVBEtngZCUVIzR0HyApaPZWpQ7fxW8RL9deHlFML0B4b3IwpAOI
         4sWygMl4yhAS1ZRipGugKjbTYwi/vyrpj/1OerBDbuGD72vZJ0v4hQQzUkahrqieVeuy
         NfpdSTTEnvEDecp5BoJf/1/T85wiZe8gFNqdgWdTntYgjrClSLb1aezhOBue3gleDzV8
         WJQ5kANa8FMxkWWyc648lyCzgqiTimz41MFg8cy8EFNBfMy9w1egFxrS/GtdfkOtNu8I
         h1QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYu9JGeDY1hcsAEhALCc3IdMERNJMLBzOvzEjSYNM6FeJm1CXIFFS5iHTRllb7u3KwF5084KnUZNGTGg==@linaro.org
X-Gm-Message-State: AOJu0YwUZWFF9dqDNv3QvXYBwn1c+Npl3o4qXQgdcsOhswCjdJOsmcsA
	3XiOH0vnUq985MqS5HrCjelJwSulZL2tAq8UkzoMsKrKd86rYZSlWglQp3F+RyQCgw==
X-Gm-Gg: ASbGncvtScDok18MpeeCrnHlv+OEB9LXgJsZuvH+P8rKDRJ9yBcgbR80Bc6Ef54uaez
	4iQ16YhK2DZVdtbobYmlUGAESB9lH1xcsoVjYhxOIhOs+YGXrcq/ILYXyaQRtWPsnu/N+dod5gB
	bIfFIys9rbxU+P7sQPo34sdEnpleC99U1mTcqexkPtl52RPgLxWjaANhDVR6oicIsnDd3qyToMx
	cXNrh1SZ6dk2Eu0zIqgRDfHCDSKrf02QehZGE/3amSou/KMYo5VQ5b8hff1jYdJyoWkYowJUQXI
	RKS3BkIlfLW3jFVMV9CntDblMB1c/9dEnN4Qor/gqD8E
X-Google-Smtp-Source: AGHT+IFhrj0Ju18mZ4zB7Xxugx+gQPBMv57HUAn1z52UjX2P86odC+k4hNfGzhAwTQWLPYDhPHuNiQ==
X-Received: by 2002:a17:902:e951:b0:224:11fc:40c0 with SMTP id d9443c01a7336-22780c54e1amr15128535ad.11.1742509816076;
        Thu, 20 Mar 2025 15:30:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:15 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 02/30] exec/cpu-all: extract tlb flags defines to exec/tlb-flags.h
Date: Thu, 20 Mar 2025 15:29:34 -0700
Message-Id: <20250320223002.2915728-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8iwRMCFnsloV

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h               | 63 --------------------
 include/exec/tlb-flags.h             | 87 ++++++++++++++++++++++++++++
 accel/tcg/cputlb.c                   |  1 +
 accel/tcg/user-exec.c                |  1 +
 semihosting/uaccess.c                |  1 +
 target/arm/ptw.c                     |  1 +
 target/arm/tcg/helper-a64.c          |  1 +
 target/arm/tcg/mte_helper.c          |  1 +
 target/arm/tcg/sve_helper.c          |  1 +
 target/i386/tcg/system/excp_helper.c |  1 +
 target/riscv/op_helper.c             |  1 +
 target/riscv/vector_helper.c         |  1 +
 target/s390x/tcg/mem_helper.c        |  1 +
 target/sparc/mmu_helper.c            |  1 +
 14 files changed, 99 insertions(+), 63 deletions(-)
 create mode 100644 include/exec/tlb-flags.h

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 013fcc9412a..d2895fb55b1 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -36,69 +36,6 @@ CPUArchState *cpu_copy(CPUArchState *env);
 
 #include "cpu.h"
 
-#ifdef CONFIG_USER_ONLY
-
-/*
- * Allow some level of source compatibility with softmmu.  We do not
- * support any of the more exotic features, so only invalid pages may
- * be signaled by probe_access_flags().
- */
-#define TLB_INVALID_MASK    (1 << (TARGET_PAGE_BITS_MIN - 1))
-#define TLB_MMIO            (1 << (TARGET_PAGE_BITS_MIN - 2))
-#define TLB_WATCHPOINT      0
-
-#else
-
-/*
- * Flags stored in the low bits of the TLB virtual address.
- * These are defined so that fast path ram access is all zeros.
- * The flags all must be between TARGET_PAGE_BITS and
- * maximum address alignment bit.
- *
- * Use TARGET_PAGE_BITS_MIN so that these bits are constant
- * when TARGET_PAGE_BITS_VARY is in effect.
- *
- * The count, if not the placement of these bits is known
- * to tcg/tcg-op-ldst.c, check_max_alignment().
- */
-/* Zero if TLB entry is valid.  */
-#define TLB_INVALID_MASK    (1 << (TARGET_PAGE_BITS_MIN - 1))
-/* Set if TLB entry references a clean RAM page.  The iotlb entry will
-   contain the page physical address.  */
-#define TLB_NOTDIRTY        (1 << (TARGET_PAGE_BITS_MIN - 2))
-/* Set if TLB entry is an IO callback.  */
-#define TLB_MMIO            (1 << (TARGET_PAGE_BITS_MIN - 3))
-/* Set if TLB entry writes ignored.  */
-#define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 4))
-/* Set if the slow path must be used; more flags in CPUTLBEntryFull. */
-#define TLB_FORCE_SLOW      (1 << (TARGET_PAGE_BITS_MIN - 5))
-
-/*
- * Use this mask to check interception with an alignment mask
- * in a TCG backend.
- */
-#define TLB_FLAGS_MASK \
-    (TLB_INVALID_MASK | TLB_NOTDIRTY | TLB_MMIO \
-    | TLB_FORCE_SLOW | TLB_DISCARD_WRITE)
-
-/*
- * Flags stored in CPUTLBEntryFull.slow_flags[x].
- * TLB_FORCE_SLOW must be set in CPUTLBEntry.addr_idx[x].
- */
-/* Set if TLB entry requires byte swap.  */
-#define TLB_BSWAP            (1 << 0)
-/* Set if TLB entry contains a watchpoint.  */
-#define TLB_WATCHPOINT       (1 << 1)
-/* Set if TLB entry requires aligned accesses.  */
-#define TLB_CHECK_ALIGNED    (1 << 2)
-
-#define TLB_SLOW_FLAGS_MASK  (TLB_BSWAP | TLB_WATCHPOINT | TLB_CHECK_ALIGNED)
-
-/* The two sets of flags must not overlap. */
-QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & TLB_SLOW_FLAGS_MASK);
-
-#endif /* !CONFIG_USER_ONLY */
-
 /* Validate correct placement of CPUArchState. */
 QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
 QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
diff --git a/include/exec/tlb-flags.h b/include/exec/tlb-flags.h
new file mode 100644
index 00000000000..c371ae77602
--- /dev/null
+++ b/include/exec/tlb-flags.h
@@ -0,0 +1,87 @@
+/*
+ * TLB flags definition
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef TLB_FLAGS_H
+#define TLB_FLAGS_H
+
+#include "exec/cpu-defs.h"
+
+#ifdef CONFIG_USER_ONLY
+
+/*
+ * Allow some level of source compatibility with softmmu.  We do not
+ * support any of the more exotic features, so only invalid pages may
+ * be signaled by probe_access_flags().
+ */
+#define TLB_INVALID_MASK    (1 << (TARGET_PAGE_BITS_MIN - 1))
+#define TLB_MMIO            (1 << (TARGET_PAGE_BITS_MIN - 2))
+#define TLB_WATCHPOINT      0
+
+#else
+
+/*
+ * Flags stored in the low bits of the TLB virtual address.
+ * These are defined so that fast path ram access is all zeros.
+ * The flags all must be between TARGET_PAGE_BITS and
+ * maximum address alignment bit.
+ *
+ * Use TARGET_PAGE_BITS_MIN so that these bits are constant
+ * when TARGET_PAGE_BITS_VARY is in effect.
+ *
+ * The count, if not the placement of these bits is known
+ * to tcg/tcg-op-ldst.c, check_max_alignment().
+ */
+/* Zero if TLB entry is valid.  */
+#define TLB_INVALID_MASK    (1 << (TARGET_PAGE_BITS_MIN - 1))
+/* Set if TLB entry references a clean RAM page.  The iotlb entry will
+   contain the page physical address.  */
+#define TLB_NOTDIRTY        (1 << (TARGET_PAGE_BITS_MIN - 2))
+/* Set if TLB entry is an IO callback.  */
+#define TLB_MMIO            (1 << (TARGET_PAGE_BITS_MIN - 3))
+/* Set if TLB entry writes ignored.  */
+#define TLB_DISCARD_WRITE   (1 << (TARGET_PAGE_BITS_MIN - 4))
+/* Set if the slow path must be used; more flags in CPUTLBEntryFull. */
+#define TLB_FORCE_SLOW      (1 << (TARGET_PAGE_BITS_MIN - 5))
+
+/*
+ * Use this mask to check interception with an alignment mask
+ * in a TCG backend.
+ */
+#define TLB_FLAGS_MASK \
+    (TLB_INVALID_MASK | TLB_NOTDIRTY | TLB_MMIO \
+    | TLB_FORCE_SLOW | TLB_DISCARD_WRITE)
+
+/*
+ * Flags stored in CPUTLBEntryFull.slow_flags[x].
+ * TLB_FORCE_SLOW must be set in CPUTLBEntry.addr_idx[x].
+ */
+/* Set if TLB entry requires byte swap.  */
+#define TLB_BSWAP            (1 << 0)
+/* Set if TLB entry contains a watchpoint.  */
+#define TLB_WATCHPOINT       (1 << 1)
+/* Set if TLB entry requires aligned accesses.  */
+#define TLB_CHECK_ALIGNED    (1 << 2)
+
+#define TLB_SLOW_FLAGS_MASK  (TLB_BSWAP | TLB_WATCHPOINT | TLB_CHECK_ALIGNED)
+
+/* The two sets of flags must not overlap. */
+QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & TLB_SLOW_FLAGS_MASK);
+
+#endif /* !CONFIG_USER_ONLY */
+
+#endif /* TLB_FLAGS_H */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 613f919fffb..b2db49e305e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -34,6 +34,7 @@
 #include "qemu/error-report.h"
 #include "exec/log.h"
 #include "exec/helper-proto-common.h"
+#include "exec/tlb-flags.h"
 #include "qemu/atomic.h"
 #include "qemu/atomic128.h"
 #include "tb-internal.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index ebc7c3ecf54..667c5e03543 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -21,6 +21,7 @@
 #include "disas/disas.h"
 #include "exec/vaddr.h"
 #include "exec/exec-all.h"
+#include "exec/tlb-flags.h"
 #include "tcg/tcg.h"
 #include "qemu/bitops.h"
 #include "qemu/rcu.h"
diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index a9578911669..cb64725a37c 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -11,6 +11,7 @@
 #include "exec/cpu-all.h"
 #include "exec/cpu-mmu-index.h"
 #include "exec/exec-all.h"
+#include "exec/tlb-flags.h"
 #include "semihosting/uaccess.h"
 
 void *uaccess_lock_user(CPUArchState *env, target_ulong addr,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 43309003486..8d4e9e07a94 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -12,6 +12,7 @@
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
+#include "exec/tlb-flags.h"
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 9244848efed..fa79d19425f 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -31,6 +31,7 @@
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "exec/tlb-flags.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
 #include "fpu/softfloat.h"
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 80164a80504..888c6707547 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -31,6 +31,7 @@
 #endif
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
+#include "exec/tlb-flags.h"
 #include "accel/tcg/cpu-ops.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index d786b4b1118..e3bed77b48e 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -23,6 +23,7 @@
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
 #include "exec/helper-proto.h"
+#include "exec/tlb-flags.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg.h"
diff --git a/target/i386/tcg/system/excp_helper.c b/target/i386/tcg/system/excp_helper.c
index 6876329de21..b0b74df72fd 100644
--- a/target/i386/tcg/system/excp_helper.c
+++ b/target/i386/tcg/system/excp_helper.c
@@ -22,6 +22,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/cputlb.h"
 #include "exec/page-protection.h"
+#include "exec/tlb-flags.h"
 #include "tcg/helper-tcg.h"
 
 typedef struct TranslateParams {
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 0d4220ba93b..8208bec078a 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -25,6 +25,7 @@
 #include "exec/cputlb.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
+#include "exec/tlb-flags.h"
 #include "trace.h"
 
 /* Exceptions processing helpers */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 7773df6a7c7..ff05390baef 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/page-protection.h"
 #include "exec/helper-proto.h"
+#include "exec/tlb-flags.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "internals.h"
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 8187b917ba1..0ff2e10d816 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -29,6 +29,7 @@
 #include "exec/cputlb.h"
 #include "exec/page-protection.h"
 #include "exec/cpu_ldst.h"
+#include "exec/tlb-flags.h"
 #include "accel/tcg/cpu-ops.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 4a0cedd9e21..cce3046b694 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -23,6 +23,7 @@
 #include "exec/cputlb.h"
 #include "exec/cpu-mmu-index.h"
 #include "exec/page-protection.h"
+#include "exec/tlb-flags.h"
 #include "qemu/qemu-print.h"
 #include "trace.h"
 
-- 
2.39.5
