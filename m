Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2396906njc;
        Mon, 24 Mar 2025 21:59:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUf5TDq3TnIIRPWzGTDgn9EQyggUu3AS9gGZZzv5GGFJkSHRYO/C05By322W5kLsAxBU1wy17phuFU3nA==@linaro.org
X-Received: by 2002:a17:902:e550:b0:223:2630:6b82 with SMTP id d9443c01a7336-22780c50cbcmr312749945ad.10.1742878763451;
        Mon, 24 Mar 2025 21:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878763; cv=none;
        d=google.com; s=arc-20240605;
        b=WZPKxy/HjuaKKqI7YqC7lJG9nnUJ7yHT0MtXJDGE9yiX+Lhuk5g4i+V40/PiXDsR42
         KyzZvXl0XnIvBP/JRjYf1qJvf42eQUrDNjJzA6drQxYOLQF3wd5MJ/FtSa81GCXbztbU
         Ye6o6/lXUmRi6eY1LuB27iRyvmrQpyD6Qmop5GffvfQZCCfH4ou3RU9kA0/27BQee5zu
         wSTSnBam9qjE504w7EvaQ4oEuHmLrHghzMSQTfWfc299sS+LCqx66Mh5UwPw7fmZDaTj
         /C/tfAu9txGMp8ov0Bgh0XG6HcBvLKvBK3+hE3xzH7SaQLBokN783GwCi9itra50Qr6D
         XLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5F5Dzae+RyDol+flZMgGIl7VK6PFPHMGXCHLqJN/jSE=;
        fh=q6gCU0IfqOrruszzfDopFQWuZi+B2hCRaaEm+ygkqVo=;
        b=EanK94PuKZ1JEhACS3kvH1RRKKspFYLUSfz0CL3+tLZzMo0pbJMuIakrXEvPWcGDS8
         BTM+jrVCNzW3pzPx1hlfuPbc3MNLUEKYwadqsegKM2FmIkAPD+fOeTPhuD75MPsd8Si7
         kM6OULhjlCONBlo+ej2X9kQXngNNRPgUOoQTgSu0LzSMRI//A3aA0WWOZpzi0eCOmdM/
         /M1X9kz9oqunRZ7Ykp6ctmyb3mQjeALiZYValzzVYHCuk2k8uHpIdcPbfiHEt/Rp7Ete
         12036ZPXB97ASFlHdsG7PwJcLi8gYOvO8NFS2Q6xKxYdlP1V07fnidnEe+FjyI5FHqbN
         Sh0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fE+17yXC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f25e9csor49202795ad.10.2025.03.24.21.59.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fE+17yXC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878763; x=1743483563; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F5Dzae+RyDol+flZMgGIl7VK6PFPHMGXCHLqJN/jSE=;
        b=fE+17yXCwbsGJg1vQZo4L4mLpVusPRVCe5VELSNrMo2j4PxjUTe1kWULLZEv4HEA6Q
         h7hesruPtcPbvV2xEDQxH/8qM8jbFl5SjKuvogHcnKTne3n9jrdELgxV/cSMQ8gWfV8M
         OWnRWFwK1ZXaxObj6rgGruszZZURb8sxmguKcmkI7r1UZybOz/8y8SJdZ3aV90shkHWq
         817OtEZAg5NlVhZ1EybqySRHCMTsFIbkxhpHZ/YcyN7ZZxgNbelJj3s4G4ED+DkDjWkV
         O/bYjYLg3n23/0OkCEq4Hd2IRUou5QL70W4neGOBbQ1sb01SipUf/K9e5DLT1d/FRD9u
         Zsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878763; x=1743483563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5F5Dzae+RyDol+flZMgGIl7VK6PFPHMGXCHLqJN/jSE=;
        b=JMukWNLTlcq3Q8bXXxKNEOdSzhK7KgaMPLv4LR3k7k8iPtoJjbx7kK+8FuE3pR1tjj
         mCMqU7JRjCe2kayEDqSzhk1cV3/2zY8oR1aqv9eSCuPLNkTHziqA8LQQ9Qn+iOYoReKf
         VHxUz+T6Z3nyj5mC4iiBThDbHr4hmcC29P8KVphlNxUpPC3kV/EqEWmOoFBpmR7LYYzt
         +L6AEI2TYgn3yYUu4xoTPteGDH1sCOY7BJXnO66kzGyq9nL/T+kQqug8qBYLZNbHQC9v
         rpbHgGR8nTzKQVQKVFsw0qLZ6q8mtQ9IQYytd5KEO6fp85Oxrbkgf6EWrWtjR/T5lAnp
         IJWw==
X-Forwarded-Encrypted: i=1; AJvYcCWfS1WWrShxtbD6GO4NBWWN+s/yOY1yY+Odena0k2fKxosAf1eytaCM5XBea9E1/6r5GjKOQRxjGWDH6w==@linaro.org
X-Gm-Message-State: AOJu0YzZxY7hnZccLcBow+qLWNKHYGjMR+h6t6n7A+IrIElbrDB/8/E8
	0pVmCOn61YAxLLdDJlcEv04XM0isRoJnRZuZjytDHYUcfZghXwMTlC13dpcWOpADFA==
X-Gm-Gg: ASbGncsFZFejpIHCh5gvQNpC+b+4Dwi5Q8qWg+OQenMwT9g2+TrTdV2tI2WWJRAcmWm
	t1mu4FAP2u9DS2CEsIAdZ9zaqvs1kX2VImR/Ya+dWuIdU8JyDNN96w1G4rwahIZbtNaIfkWkbrm
	TavQ4VCOVnZSNGoLa/+yAhmig5qBCembgdloaD6py7K/CsZZMKIt+tN0ZpeT/Njlk/Csjxs4HLQ
	NC96IesX4Rn7+KntFhEuCA7Z3FGjIChHJ334rr3xZAfGpUjiH/acIjUlg+ONCVdddWkS3JvvJBm
	ZK/eq3kNCYTysSd6+SaY9G9JxQNmp/Bd3YzKliDGBQjm
X-Google-Smtp-Source: AGHT+IH0t6uEZiEjwREkVEMOOv9C57dpUIwXt6vTK/JF30OlSjVJqYS2wxVP5/VT54dMYHTpk3oDTg==
X-Received: by 2002:a17:90b:1f81:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-3030fe6a098mr26719254a91.7.1742878762798;
        Mon, 24 Mar 2025 21:59:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:22 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 01/29] exec/cpu-all: extract tlb flags defines to exec/tlb-flags.h
Date: Mon, 24 Mar 2025 21:58:46 -0700
Message-Id: <20250325045915.994760-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PQaK2MqOgYBC

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 72dc48e58d3..f3d26b6b957 100644
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
index 67b3bafebbe..83978be0603 100644
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
