Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1944640lfq;
        Fri, 2 Oct 2020 15:00:01 -0700 (PDT)
X-Received: by 2002:aca:b287:: with SMTP id b129mr2547388oif.85.1601676001111;
        Fri, 02 Oct 2020 15:00:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601676001; cv=none;
        d=google.com; s=arc-20160816;
        b=TCS5oFyXZyVHGMCEcNxa+COin8OqRlKuNFFTnjbMs3LwTxV1GwS9+kaz/uZu5cFfQ9
         9RG3rxg75Y2w23uXBviUzvJsIurxSTtw4dxGiWZ0avsnvHDRJrhW3jENlWo9yeqt+nV1
         Z1nxUs4syaSbkA/zBbeDp4N8JZYs91WaSrcPL8muswk16uoinUpHBShqeDMtLGu3aR55
         3h9gz2oTQ2I5efN0lCKaqgQNuJX2ZOFvQ9wnt6ozN0YjehmkhXBwAWpI5cSyYq5l6PKQ
         /4PnwrkPqvKzHusQVv6KVYrzA2NeJCJHZgid91zAhqK52VWGGoeFROIHjwuK21vsgIvd
         rgLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1sPywZydkzNx8f/80GoSubL6qkbD2bze0L3zxjjn9Qg=;
        b=h1nZxOQyZUkhEJF9rlMUi+gy0USbvO5RSX2sVzRcHsE/PHIsD+KxSe8pyYhsYIHr8Q
         KEF2l0VcTqRYLHtD1IHw8g8WkP4znNDt4sFydXPi113Xa8hyJvdFNWYyRa/lG6Ua7CXU
         wkEBoBoAJE0EoC6KURrVuQi06UXKr7/sQkzjgCINaqXE2sBAu/DL7lDC/rDFG7vL9IFX
         870aQ1pieNujNPYayOEY7x459/DLFeyXdlSyhXKkMfbm6FkYWBZ0a9z/bElgE7Ar6OnF
         GKJYOLNZZ/bELC//Uj3rRH6fc/QhfnWMP8ZZXNSuiDeU3XVdSaNbtX05xd7aw9+WBdQg
         FQmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sXKo8YEz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y8sor609765otq.1.2020.10.02.15.00.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Oct 2020 15:00:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sXKo8YEz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1sPywZydkzNx8f/80GoSubL6qkbD2bze0L3zxjjn9Qg=;
        b=sXKo8YEznddVXahGBBUB8MPdd7uVD5frA0ogbMV72F3DEGzKYBnPZOI4QkE9G+i145
         /3TrWuQ7jrfBdZMCf8dHn4VJk3pxhcFX02O2cwDbbY7gwhQFOB715Hqv/Yba9kTkx4Sx
         Apz+hHB5vkWNEE3YQZKFPcxiamos5mcTUro5/3sxq9HiLThhY12IaAGoWLfTxrERIOWI
         JwHtKDttDDQ/irqqhlj1nJdpRwBM37k59LRnFhDx84JWMnhMTmh/KxFWi2fBz7hebHsm
         bVK5lIiVhhMuj7qWDb/p87AfIrtnwfsrkT8whKj36rAbABAA43tFvfE7BgclYkR3inT+
         0YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1sPywZydkzNx8f/80GoSubL6qkbD2bze0L3zxjjn9Qg=;
        b=cGJHl08vDwvT6bNOEdaovdy4TJ7CrDaVyW99OLwwjtQjR15KvTQO7mhKsBR83QyZAE
         EVs0QPqwyXbVN/FUfINUN7iu7AlsDPPOU9iE0xhk5TjhvE3bmfvvoNfTpNEsuZK+y7po
         vYh1+8/hgnJ/OKVCi4UKS73VHKbxMtEuI+pilHVUubCvQWpnQjWEXWwSZf7FNdBMAy1C
         /85e3zdDth9+lZqtMl0Latm9U29CJn+G6t60ZbbLNrpzpJmcaugP0QOGlH4BoILL3v3Z
         VsOqUocSFQYFGMAAcDOI0RwAAPxUnmVngDb9IMtKMFGWMAegDSNKTVZSXZBUyDcnCPgm
         nuJQ==
X-Gm-Message-State: AOAM533pXcEq/P/yRk3zsvhdJwBSueXoVWHvRKJh0foIU+xRFMF7cCtO
	5TmntcIVfuGd2I0Pb5PK3/Cbxy7J
X-Google-Smtp-Source: ABdhPJzCn8lS566R5abRvl4jGA/N7I2ltVyfzG+DhtvxKIxOk3KwL9jk1anM2AM7sFxF55YOrSkK6A==
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr3346514oti.63.1601676000681;
        Fri, 02 Oct 2020 15:00:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id k10sm684268ots.60.2020.10.02.14.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:00:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v10 2/8] linux-user: Set PAGE_TARGET_1 for TARGET_PROT_BTI
Date: Fri,  2 Oct 2020 16:59:49 -0500
Message-Id: <20201002215955.254866-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002215955.254866-1-richard.henderson@linaro.org>
References: <20201002215955.254866-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0HGdUSKowLOn

Transform the prot bit to a qemu internal page bit, and save
it in the page tables.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v10: Add PAGE_BTI define (pmm).
---
 include/exec/cpu-all.h     |  2 ++
 linux-user/syscall_defs.h  |  4 ++++
 target/arm/cpu.h           |  5 +++++
 linux-user/mmap.c          | 16 ++++++++++++++++
 target/arm/translate-a64.c |  6 +++---
 5 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index f6439c4705..ba80c46c95 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -274,6 +274,8 @@ extern intptr_t qemu_host_page_mask;
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
 #define PAGE_RESERVED  0x0020
 #endif
+/* Target-specific bits that will be used via page_get_flags().  */
+#define PAGE_TARGET_1  0x0080
 
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 731c3d5341..cabbfb762d 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1277,6 +1277,10 @@ struct target_winsize {
 #define TARGET_PROT_SEM         0x08
 #endif
 
+#ifdef TARGET_AARCH64
+#define TARGET_PROT_BTI         0x10
+#endif
+
 /* Common */
 #define TARGET_MAP_SHARED	0x01		/* Share changes */
 #define TARGET_MAP_PRIVATE	0x02		/* Changes are private */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e4549a8cc0..a07d605c2f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3439,6 +3439,11 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
 #define arm_tlb_bti_gp(x) (typecheck_memtxattrs(x)->target_tlb_bit0)
 #define arm_tlb_mte_tagged(x) (typecheck_memtxattrs(x)->target_tlb_bit1)
 
+/*
+ * AArch64 usage of the PAGE_TARGET_* bits for linux-user.
+ */
+#define PAGE_BTI  PAGE_TARGET_1
+
 /*
  * Naming convention for isar_feature functions:
  * Functions which test 32-bit ID registers should have _aa32_ in
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index f261563420..00c05e6a0f 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -83,6 +83,22 @@ static int validate_prot_to_pageflags(int *host_prot, int prot)
     *host_prot = (prot & (PROT_READ | PROT_WRITE))
                | (prot & PROT_EXEC ? PROT_READ : 0);
 
+#ifdef TARGET_AARCH64
+    /*
+     * The PROT_BTI bit is only accepted if the cpu supports the feature.
+     * Since this is the unusual case, don't bother checking unless
+     * the bit has been requested.  If set and valid, record the bit
+     * within QEMU's page_flags.
+     */
+    if (prot & TARGET_PROT_BTI) {
+        ARMCPU *cpu = ARM_CPU(thread_cpu);
+        if (cpu_isar_feature(aa64_bti, cpu)) {
+            valid |= TARGET_PROT_BTI;
+            page_flags |= PAGE_BTI;
+        }
+    }
+#endif
+
     return prot & ~valid ? 0 : page_flags;
 }
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7188808341..072754fa24 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14507,10 +14507,10 @@ static void disas_data_proc_simd_fp(DisasContext *s, uint32_t insn)
  */
 static bool is_guarded_page(CPUARMState *env, DisasContext *s)
 {
-#ifdef CONFIG_USER_ONLY
-    return false;  /* FIXME */
-#else
     uint64_t addr = s->base.pc_first;
+#ifdef CONFIG_USER_ONLY
+    return page_get_flags(addr) & PAGE_BTI;
+#else
     int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
     unsigned int index = tlb_index(env, mmu_idx, addr);
     CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-- 
2.25.1
