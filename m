Received: by 10.223.188.70 with SMTP id a6csp3964190wrh;
        Sun, 27 Aug 2017 20:53:31 -0700 (PDT)
X-Received: by 10.129.80.86 with SMTP id e83mr2709069ywb.470.1503892411254;
        Sun, 27 Aug 2017 20:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503892411; cv=none;
        d=google.com; s=arc-20160816;
        b=RdJx849kyOUaPDszkaCwawzJdnzRTiHQTHhOGvyPmVudMo/EzZcMdxxvwxXLN9PvQz
         I2xjzGR7H47Ul0opZaMlDItD5rZ9VJSjWZa/1CVCbzK8Ut4vc6kwHDH4pSschanMCWyr
         oDVn5TNuBqBQHzUXCkX2/9q1DGGCLMguuWKYIFqFA7GRbAEGrfvOnx9iu6hjD9zq/4ex
         9blMKuO5CJpEjHGXgxtEHVCeWIN8A6sTCSB0EOa1jaKYlLqe06WJQEwiMp0dms6OpkGz
         1BwA/wPEo9HjNxsrTGSq+qv+I51uJEYWikoNGI+pGPAoWGMaDSFP0qQ1l0lNzv4bD23x
         Gmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:arc-authentication-results;
        bh=NKneIklgXd1r8SxdWzvYWVqIn/IWKcCDCp5OlI41SWU=;
        b=gJjiOMw6CLYtfV0onhD5K/B9E//wCRARviv3bqostfCtaWnqIXA8n6jW3+J+ZX2nxp
         JGgH78OsZjAXNoUlBcoz9zUQ4X0KlUFiKYlsXqS6L1vAPqoR0T6dE7JHQkcINs1Sh07U
         pjsIKl0FS5q4RJbK3GLpMC69WYiq9VNaFWjUkZQbKFnya9MnBYdIjD0o8fKETWaEtnLj
         oc9YO4vMdQTt5TpIcpB0P8GA55bd+leCe4RdM/mGV32gSTAI1ORw6Q81o5YBxWScv4xC
         MsOTumug4Qyzn1RUPSQZfIxEZ/XofADx5lR1LrguKX8mmTBb3H3H9LMwijp/Iq3wPYEb
         n2FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HwAHAtEt;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <bobby.prani@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c144sor327409ywa.313.2017.08.27.20.53.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 27 Aug 2017 20:53:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HwAHAtEt;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NKneIklgXd1r8SxdWzvYWVqIn/IWKcCDCp5OlI41SWU=;
        b=HwAHAtEtDIZQHZHlwbzcsSIOxxnA54XSXqkewVNX28Kv5f15J1hh8ZA6DfQyqKIqCd
         Qe54VTIarZeQF2XZWprouccFPkKq00SiWEXxdbuUxokG/3YusYDSiAs/GrR5kqOGhW3b
         GeRbBXn6KmGnBWix0BuZmyS80o8kYvN68f45H5Aqgl8W6Yw7EBRTa3CJmrS1f4Lywr0E
         UCSaZujo5H8/xUcAPEQ3Y6Af/nr/4wUXHB2ligsC//z060azMW5Pl4HrTHdxd45AonHx
         nPQ9HNZxDSqPE3EUmO6wrEVNsL7JPZN8+hASITWHSDYXt5HY6n9rZxMcmTuX1NamxWnW
         BhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NKneIklgXd1r8SxdWzvYWVqIn/IWKcCDCp5OlI41SWU=;
        b=oA81k+3wnuIAACaEl7noCN+3lO/BTkMHVLPREns6slMc/MX8i0ywwBTEzFP9yU40JS
         JhtjwRTDk8sYaY96W3c/zwrHtPcdTigQyGHIuqb0x2l8ZKDZ+YNQ4KjJhHkupngbZCtY
         cedjrdwqLks7QXLNq9/LoO0PZQZNJZdOeZkapEiesU5lN/l6xaU5+P5YGtOK4W8drV1G
         TCJW0wqIW1rP0zdQuyAVZEy9k6FCScLpsQ0ATaf3Y+j0jYn5ng685wWxMpeqilpV3TTT
         xhXcCb5Th6c6YOdK/x/YQC8JI8nfQbMpZkbqJvPD8BPSp5xVvuNZXPRpaO3Y9Po720FA
         TbTg==
X-Gm-Message-State: AHYfb5h7iPQqbphDNder16Z+1nzIfSZ2RHeRSgC4HAE6+l2tPgTSWN27
	+nM8MOvRFigT7bxd994=
X-Received: by 10.37.14.212 with SMTP id 203mr4858559ybo.164.1503892410621;
        Sun, 27 Aug 2017 20:53:30 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from localhost.localdomain ([98.192.46.210])
        by smtp.gmail.com with ESMTPSA id i64sm4820865ywi.64.2017.08.27.20.53.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Aug 2017 20:53:30 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: alex.bennee@linaro.org,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org (open list:AArch64 target),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [RFC PATCH 3/3] mttcg: Implement implicit ordering semantics
Date: Sun, 27 Aug 2017 23:53:26 -0400
Message-Id: <20170828035327.17146-3-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170828035327.17146-1-bobby.prani@gmail.com>
References: <20170828035327.17146-1-bobby.prani@gmail.com>
X-TUID: 0vi9wmZyjOzP

Currently, we cannot use mttcg for running strong memory model guests
on weak memory model hosts due to missing ordering semantics.

We implicitly generate fence instructions for stronger guests if an
ordering mismatch is detected. We generate fences only for the orders
for which fence instructions are necessary, for example a fence is not
necessary between a store and a subsequent load on x86 since its
absence in the guest binary tells that ordering need not be
ensured. Also note that if we find multiple subsequent fence
instructions in the generated IR, we combine them in the TCG
optimization pass.

This patch allows us to boot an x86 guest on ARM64 hosts using mttcg.

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 tcg/aarch64/tcg-target.h |  2 ++
 tcg/arm/tcg-target.h     |  2 ++
 tcg/mips/tcg-target.h    |  2 ++
 tcg/ppc/tcg-target.h     |  2 ++
 tcg/tcg-op.c             | 17 +++++++++++++++++
 tcg/tcg-op.h             |  1 +
 6 files changed, 26 insertions(+)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 55a46ac825..b41a248bee 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -117,4 +117,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
     __builtin___clear_cache((char *)start, (char *)stop);
 }
 
+#define TCG_TARGET_DEFAULT_MO (0)
+
 #endif /* AARCH64_TCG_TARGET_H */
diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index 5ef1086710..a38be15a39 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -134,4 +134,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
     __builtin___clear_cache((char *) start, (char *) stop);
 }
 
+#define TCG_TARGET_DEFAULT_MO (0)
+
 #endif
diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index d75cb63ed3..e9558d15bc 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -206,4 +206,6 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
     cacheflush ((void *)start, stop-start, ICACHE);
 }
 
+#define TCG_TARGET_DEFAULT_MO (0)
+
 #endif
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 5f4a40a5b4..5a092b038a 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -125,4 +125,6 @@ extern bool have_isa_3_00;
 
 void flush_icache_range(uintptr_t start, uintptr_t stop);
 
+#define TCG_TARGET_DEFAULT_MO (0)
+
 #endif
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 87f673ef49..085fe66fb2 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -28,6 +28,7 @@
 #include "exec/exec-all.h"
 #include "tcg.h"
 #include "tcg-op.h"
+#include "tcg-mo.h"
 #include "trace-tcg.h"
 #include "trace/mem.h"
 
@@ -2662,8 +2663,21 @@ static void gen_ldst_i64(TCGOpcode opc, TCGv_i64 val, TCGv addr,
 #endif
 }
 
+void tcg_gen_req_mo(TCGBar type)
+{
+#if defined(TCG_GUEST_DEFAULT_MO) && defined(TCG_TARGET_DEFAULT_MO)
+    TCGBar order_mismatch = type & (TCG_GUEST_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO);
+    if (order_mismatch) {
+        tcg_gen_mb(order_mismatch | TCG_BAR_SC);
+    }
+#else
+    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
+#endif
+}
+
 void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, TCGMemOp memop)
 {
+    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_LD_ST);
     memop = tcg_canonicalize_memop(memop, 0, 0);
     trace_guest_mem_before_tcg(tcg_ctx.cpu, tcg_ctx.tcg_env,
                                addr, trace_mem_get_info(memop, 0));
@@ -2672,6 +2686,7 @@ void tcg_gen_qemu_ld_i32(TCGv_i32 val, TCGv addr, TCGArg idx, TCGMemOp memop)
 
 void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, TCGMemOp memop)
 {
+    tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
     memop = tcg_canonicalize_memop(memop, 0, 1);
     trace_guest_mem_before_tcg(tcg_ctx.cpu, tcg_ctx.tcg_env,
                                addr, trace_mem_get_info(memop, 1));
@@ -2680,6 +2695,7 @@ void tcg_gen_qemu_st_i32(TCGv_i32 val, TCGv addr, TCGArg idx, TCGMemOp memop)
 
 void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, TCGMemOp memop)
 {
+    tcg_gen_req_mo(TCG_MO_LD_LD | TCG_MO_LD_ST);
     if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
         tcg_gen_qemu_ld_i32(TCGV_LOW(val), addr, idx, memop);
         if (memop & MO_SIGN) {
@@ -2698,6 +2714,7 @@ void tcg_gen_qemu_ld_i64(TCGv_i64 val, TCGv addr, TCGArg idx, TCGMemOp memop)
 
 void tcg_gen_qemu_st_i64(TCGv_i64 val, TCGv addr, TCGArg idx, TCGMemOp memop)
 {
+    tcg_gen_req_mo(TCG_MO_ST_LD | TCG_MO_ST_ST);
     if (TCG_TARGET_REG_BITS == 32 && (memop & MO_SIZE) < MO_64) {
         tcg_gen_qemu_st_i32(TCGV_LOW(val), addr, idx, memop);
         return;
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 5d3278f243..6ad2c6d60e 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -262,6 +262,7 @@ static inline void tcg_gen_br(TCGLabel *l)
 }
 
 void tcg_gen_mb(TCGBar);
+void tcg_gen_req_mo(TCGBar type);
 
 /* Helper calls. */
 
-- 
2.13.0
