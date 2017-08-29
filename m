Received: by 10.223.188.70 with SMTP id a6csp5526392wrh;
        Mon, 28 Aug 2017 23:33:21 -0700 (PDT)
X-Received: by 10.129.121.134 with SMTP id u128mr2953252ywc.146.1503988401856;
        Mon, 28 Aug 2017 23:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503988401; cv=none;
        d=google.com; s=arc-20160816;
        b=Moic44hhps2sXA/wTXJ7AOTfjSm4xjLCh4FmatKftXGzhNQkghWlu8zzpmHBezjasW
         2L3CKaaB+HGQDKboyxxtp3AJPK1v8X9t8yH+VZJUbS4R6/R7+PB2OlVFHRlhZ37Hb5Kj
         Ara5y7tOUaK1X6Xc8DqWtNOp3Ec0PQuAoG88f3kA2CExToZBq6EGIcVku6wak7zst1PQ
         K2uLSy9cZ41mMIOmKX7e1P8vF/hvx6IhDjvV5A761Cx+aEd4ZO+Y9X2+5G0IcQZ4403O
         nOZYDicIt83jL9EV1g5HwfWjAOxxYszfqJZpKcuKbNI3KX/6IrR7jtmKWEWPQ2O5LpYx
         FuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:arc-authentication-results;
        bh=WygGuE75hGJY+LALPYWmJrVfRXFTydLqUf4dZ/iAU2I=;
        b=fNYvSQDBexkn9nalTWRSOh8pYplbNP/J0PzrDUta6hpvuJOJ1o0eSdtNgPggtBRh+L
         5F8oHlvPsdAObZAy4Q56teIserJAEQPz36NHnk7u1cS/pauGWQo7mZeH8U+1ynwqV7vA
         tpUGTgb6D+m55DLYxadgP7+ZA5sBP67vb6+bInCVEHjNmf4GgHkiuzoqHJngMoJiF4np
         lPiDHlXpBl6kXN2zq/9ikKpuyIKR9fankO5K4MUfgMKQaLPo7z8LzvfeVAox+pArViCO
         k0QwK+EUoUARCJjrK0VwYnLSQs1JUOZXQiWvaxjGpsOc3Sb72OaprZobtmRlTW6/6St+
         yBAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QrN91+it;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <bobby.prani@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a1sor1362191ywh.317.2017.08.28.23.33.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Aug 2017 23:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=QrN91+it;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WygGuE75hGJY+LALPYWmJrVfRXFTydLqUf4dZ/iAU2I=;
        b=QrN91+itucKpLJkAivt7GP11uYLZiHHoZGU5udRjbBOcrqJTDwH+1XRNl/CpGShZWK
         3CcpqwF3uqhmgmd0Eq+Z8nJq5FTm7Yv5mIe07vyjuGtGuy6+7XLLSz6dyNXxU34+sutA
         SLWznOegSCTX689ad/Q4SMRv4qC8VhrgO2Xdv4cafFVIt/8gwhXduTMxSay9lsYj1rso
         pU69E3fxORkVfgprCtnbkOYJjVW+DGJRkHF26UiHaX18lNfAV3wkcx5wHGqjW6hu6KSN
         HWAJAZ0elsFJJ5tVx+NRZXhz29e5L55vM1yPUZaTMDHD9upVKnVfKWlxEifNLH7tH+7d
         mwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WygGuE75hGJY+LALPYWmJrVfRXFTydLqUf4dZ/iAU2I=;
        b=nSkZDDK3xaHhxEiff+YCFb5rCFf4AnF6NXi6L/QQuZE97NiWJI+foZtnsGLviyxjcO
         jkvlX9atVDm16DEUK57EdpfhwTQWJL8XiC31IT7o8jUJ14r5lGy9J1v4FdDv0UiuCwi+
         XpS9tJXA+ReX7kTx1403qGEYmsg37ZEJqG+8cix5yWiYUusyn81Q3xcDU62A6kuZ7l4P
         yi52sGD+Z95bwA1gVNwE/hTCKm/ZslpHAMyxFmonh3LtZCCjaOCnMbmF4rrpKb/6CFH6
         oB4Rwag5Z36Qz5i4k4hjwY2Dn0ZDgwukofch9wYNNUEfRlNWlcRu054DGvzS8lN86eWa
         EChQ==
X-Gm-Message-State: AHYfb5gi773V7LSVQ2Uy5pSTje4qLge31BBaxljDb/l/Q1IZ2Ud5GNxQ
	353bXGMwoILKimOanHf0iA==
X-Received: by 10.129.52.3 with SMTP id b3mr2732003ywa.441.1503988401134;
        Mon, 28 Aug 2017 23:33:21 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from localhost.localdomain ([98.192.46.210])
        by smtp.gmail.com with ESMTPSA id x4sm817923ywa.44.2017.08.28.23.33.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Aug 2017 23:33:20 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org (open list:Overall),
	qemu-arm@nongnu.org (open list:AArch64 target)
Cc: qemu-devel@nongnu.org
Subject: [RFC v3 PATCH 5/5] tcg/softmmu: Increase size of TLB caches
Date: Tue, 29 Aug 2017 02:33:13 -0400
Message-Id: <20170829063313.10237-5-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170829063313.10237-1-bobby.prani@gmail.com>
References: <20170829063313.10237-1-bobby.prani@gmail.com>
X-TUID: IkPbIiNNm6KO

This patch increases the number of entries cached in the TLB. I went
over a few architectures to see if increasing it is problematic. Only
armv6 seems to have a limitation that only 8 bits can be used for
indexing these entries. For other architectures, the number of TLB
entries is increased to a 4K-sized cache. The patch also doubles the
number of victim TLB entries.

Some statistics collected from a build benchmark for various cache
sizes is listed below:

| TLB bits\vTLB entires |             8 |            16  |            32 |
|                     8 | 952.94(+0.0%) | 929.99(+2.4%)  | 919.02(+3.6%) |
|                    10 | 898.92(+5.6%) | 886.13(+7.0%)  | 887.03(+6.9%) |
|                    12 | 878.56(+7.8%) | 873.53(+8.3%)* | 875.34(+8.1%) |

The best combination for this workload came out to be 12 bits for the
TLB and a 16 entry vTLB cache.

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 include/exec/cpu-defs.h  | 13 ++++---------
 tcg/aarch64/tcg-target.h |  1 +
 tcg/arm/tcg-target.h     |  1 +
 tcg/i386/tcg-target.h    |  6 ++++++
 tcg/ia64/tcg-target.h    |  1 +
 tcg/mips/tcg-target.h    |  6 ++++++
 tcg/ppc/tcg-target.h     |  1 +
 tcg/s390/tcg-target.h    |  1 +
 tcg/sparc/tcg-target.h   |  1 +
 tcg/tci/tcg-target.h     |  2 ++
 10 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index bc8e7f848d..33b0ac6fe0 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -57,8 +57,8 @@ typedef uint64_t target_ulong;
 #endif
 
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
-/* use a fully associative victim tlb of 8 entries */
-#define CPU_VTLB_SIZE 8
+/* use a fully associative victim tlb of 16 entries */
+#define CPU_VTLB_SIZE 16
 
 #if HOST_LONG_BITS == 32 && TARGET_LONG_BITS == 32
 #define CPU_TLB_ENTRY_BITS 4
@@ -87,14 +87,9 @@ typedef uint64_t target_ulong;
  * could be something like 0xC000 (the offset of the last TLB table) plus
  * 0x18 (the offset of the addend field in each TLB entry) plus the offset
  * of tlb_table inside env (which is non-trivial but not huge).
+ * TODO: rewrite this comment
  */
-#define CPU_TLB_BITS                                             \
-    MIN(8,                                                       \
-        TCG_TARGET_TLB_DISPLACEMENT_BITS - CPU_TLB_ENTRY_BITS -  \
-        (NB_MMU_MODES <= 1 ? 0 :                                 \
-         NB_MMU_MODES <= 2 ? 1 :                                 \
-         NB_MMU_MODES <= 4 ? 2 :                                 \
-         NB_MMU_MODES <= 8 ? 3 : 4))
+#define CPU_TLB_BITS MIN(12, TCG_TARGET_TLB_MAX_INDEX_BITS)
 
 #define CPU_TLB_SIZE (1 << CPU_TLB_BITS)
 
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index b41a248bee..9f4558cd83 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -15,6 +15,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE  4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 24
+#define TCG_TARGET_TLB_MAX_INDEX_BITS 32
 #undef TCG_TARGET_STACK_GROWSUP
 
 typedef enum {
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index a38be15a39..ebe27991f3 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -60,6 +60,7 @@ extern int arm_arch;
 #undef TCG_TARGET_STACK_GROWSUP
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
+#define TCG_TARGET_TLB_MAX_INDEX_BITS 8
 
 typedef enum {
     TCG_REG_R0 = 0,
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 73a15f7e80..456d57115c 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -162,6 +162,12 @@ extern bool have_popcnt;
 # define TCG_AREG0 TCG_REG_EBP
 #endif
 
+#if HOST_LONG_BITS == 32 && TARGET_LONG_BITS == 32
+#define TCG_TARGET_TLB_MAX_INDEX_BITS 28
+#else
+#define TCG_TARGET_TLB_MAX_INDEX_BITS 27
+#endif
+
 static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
 {
 }
diff --git a/tcg/ia64/tcg-target.h b/tcg/ia64/tcg-target.h
index 8f475fe742..35878e20c7 100644
--- a/tcg/ia64/tcg-target.h
+++ b/tcg/ia64/tcg-target.h
@@ -28,6 +28,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE 16
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 21
+#define TCG_TARGET_TLB_MAX_INDEX_BITS 32
 
 typedef struct {
     uint64_t lo __attribute__((aligned(16)));
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index e9558d15bc..0c7c5cf64c 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -39,6 +39,12 @@
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
 #define TCG_TARGET_NB_REGS 32
 
+#if HOST_LONG_BITS == 32 && TARGET_LONG_BITS == 32
+#define TCG_TARGET_TLB_MAX_INDEX_BITS 12
+#else
+#define TCG_TARGET_TLB_MAX_INDEX_BITS 11
+#endif
+
 typedef enum {
     TCG_REG_ZERO = 0,
     TCG_REG_AT,
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 5a092b038a..82e10c9471 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -34,6 +34,7 @@
 #define TCG_TARGET_NB_REGS 32
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 16
+#define TCG_TARGET_TLB_MAX_INDEX_BITS 32
 
 typedef enum {
     TCG_REG_R0,  TCG_REG_R1,  TCG_REG_R2,  TCG_REG_R3,
diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
index dc0e59193c..57f0e22532 100644
--- a/tcg/s390/tcg-target.h
+++ b/tcg/s390/tcg-target.h
@@ -27,6 +27,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE 2
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 19
+#define TCG_TARGET_TLB_MAX_INDEX_BITS 32
 
 typedef enum TCGReg {
     TCG_REG_R0 = 0,
diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
index 4515c9ab48..378d218923 100644
--- a/tcg/sparc/tcg-target.h
+++ b/tcg/sparc/tcg-target.h
@@ -29,6 +29,7 @@
 
 #define TCG_TARGET_INSN_UNIT_SIZE 4
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
+#define TCG_TARGET_TLB_MAX_INDEX_BITS 12
 #define TCG_TARGET_NB_REGS 32
 
 typedef enum {
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 06963288dc..456a4fc4e1 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -40,9 +40,11 @@
 #ifndef TCG_TARGET_H
 #define TCG_TARGET_H
 
+
 #define TCG_TARGET_INTERPRETER 1
 #define TCG_TARGET_INSN_UNIT_SIZE 1
 #define TCG_TARGET_TLB_DISPLACEMENT_BITS 32
+#define TCG_TARGET_TLB_MAX_INDEX_BITS 32
 
 #if UINTPTR_MAX == UINT32_MAX
 # define TCG_TARGET_REG_BITS 32
-- 
2.13.0
