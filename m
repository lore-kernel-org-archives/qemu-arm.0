Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009164ejf;
        Tue, 16 Aug 2022 13:34:54 -0700 (PDT)
X-Received: by 2002:a05:6830:3707:b0:636:913f:2313 with SMTP id bl7-20020a056830370700b00636913f2313mr8036936otb.290.1660682094608;
        Tue, 16 Aug 2022 13:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682094; cv=none;
        d=google.com; s=arc-20160816;
        b=EvGr2rf2yKD+57mSRV/WgURbuilI8CSvT7UItDaL7sHdNzrqdoER+vhw3GJuQ7LSJn
         zPUAXbIWTnoCPPrVTs1fTi7rcULJAjcpeEXz3Kt2w0AdP1E89PVYUJTB924LRqawjWt9
         /RFMv2oVU8cS4nfm7pP8YILeI/T2k6DjGWfq+EGYl5ZPf2zR8bNoEQBVCfMyLBXO7pJv
         Qqdh6pdj4iAEil2LnN0vdCxDN7rjdbf9eek3dYnHFLU4aY4rzllZKPbAegYrwA0zZh6z
         fgVeKbgCi4EsZqQVHHNBlnC2gmDUoeoyHezicvhQWtkXuUHspRGsWx5VD5pKjB7f8Ht4
         Armw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xEQZVGp1RTivKylQ7UGFI7xtIFjejFxCKqT/C8jhtT8=;
        b=qrq5Ggaa7yCkiCIlaNisphM1hj1FjqOwIHVo6Hdf9QC+UGlCB3ETZWdK1mSUvk0Ya+
         kgJwzoAhxcv6+X0zYj7phTC7veu4p7ExMNg8wTk2DzFJR5IC/LcGR4EZ5ZSvdsuesATd
         uoLfBLzHf36wxzLwoLIXiJAYFaYlbOizEFMIYL99IlOm709tpdihmMjCgZA8B33RtNi4
         /EnWizWBajOgPXHPE8QfgtCZ4s47w1fQO5s+1d2AcnmKNTUhWbEo6XW2wR9C8pNZbG3Q
         Wo0TynsX92tF7VZrSI0icckxF+I9I18/Nkl+iEfuH6tAkreiWXNw1M1E8tr6Ab2OdK9E
         Zisg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/QRPeix";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y12-20020a9d518c000000b00636db98ec2asor1618805otg.159.2022.08.16.13.34.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/QRPeix";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xEQZVGp1RTivKylQ7UGFI7xtIFjejFxCKqT/C8jhtT8=;
        b=I/QRPeixV/YsGiUDTxHgbEPGCapQKXw22SwyZ3PhaLRx3tC8tL/HjXUM27ObZCieHR
         /AZn0zCWGMgjXS3hhTXt9ILqTY+UswzOOnYqnI28kdPFc6i525oEO/H9UQlo8VrT4KJD
         gtb3cF/YxQq2TqZ9zhXTNNKkhk3NIdaOFitg/G7qZDi9Ibmi2p3IautyaOxVMbz3nmP5
         ve2Fc1rApuH2XKqrCt5aJOsHWx04UUV2YELnfU68M+a4mQ0sg6mbIdFXG6q6GyG9v+kT
         ROZTybRB/jRWn2WdEu80kP9HPyjKl5J9li5V0TRFLq50RvfudFlbg5DZEWTo1EtR1wQN
         G6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xEQZVGp1RTivKylQ7UGFI7xtIFjejFxCKqT/C8jhtT8=;
        b=Hcvd0XT5GWBGF5cXel+Ej+1NT2zySy3dqQikd4qOYnSLsBrFX+RdK+KCiBI3+q1pRq
         S5qRNCccO/Ht5tjUY8WDxRN5iPMHZaNQh21QslcdDovWrhaBQGDbcWJsJ5Yv9mixwA0H
         NFi1/3o+as2wVpXkiIgfY+6BM6K+C+vqgUI8SB7Z6lu7aRP2fCDfarTGbkRF0gpvkHS8
         dXvEwAlHATOqlWJUpJhaSQJ9m8eS92uc5+DrXkDjxLv88Y0JNPPL2SC4ANJF81LmLMAs
         GE3Dwn5/kyzy6AaJ3hZEIP2QxH93ow3kABiaqz9iYwI8wegwBp7NBdNsCZMI7aTlDELc
         v5bA==
X-Gm-Message-State: ACgBeo03g5kQGvApg8CoSkpEgAkAuq0XKGvijLeqIaURau5RmXhcdEKz
	CsQXExuGkcITP23egCYxrndY2CLbMn4A9B0R
X-Google-Smtp-Source: AA6agR54psQ9YjiiSxiGldX/ePdcL0bkcVlvtJfWEsDJhNyFkYzf5fksTmHv4bNxHp1FBFGXCRE6YQ==
X-Received: by 2002:a05:6830:1be4:b0:636:d697:42e8 with SMTP id k4-20020a0568301be400b00636d69742e8mr8481978otb.248.1660682094105;
        Tue, 16 Aug 2022 13:34:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 23/33] accel/tcg: Introduce TARGET_TB_PCREL
Date: Tue, 16 Aug 2022 15:33:50 -0500
Message-Id: <20220816203400.161187-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hoHUJk7TOsNd

Prepare for targets to be able to produce TBs that can
run in more than one virtual context.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h   |  3 +++
 include/exec/exec-all.h   | 41 ++++++++++++++++++++++++++---
 include/hw/core/cpu.h     |  1 +
 accel/tcg/cpu-exec.c      | 55 ++++++++++++++++++++++++++++++---------
 accel/tcg/translate-all.c | 48 ++++++++++++++++++++++------------
 5 files changed, 115 insertions(+), 33 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index ba3cd32a1e..87e2bc4e59 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -54,6 +54,9 @@
 #  error TARGET_PAGE_BITS must be defined in cpu-param.h
 # endif
 #endif
+#ifndef TARGET_TB_PCREL
+# define TARGET_TB_PCREL 0
+#endif
 
 #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index cec3ef1666..b41835bb55 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -459,8 +459,32 @@ struct tb_tc {
 };
 
 struct TranslationBlock {
-    target_ulong pc;   /* simulated PC corresponding to this block (EIP + CS base) */
-    target_ulong cs_base; /* CS base for this block */
+#if !TARGET_TB_PCREL
+    /*
+     * Guest PC corresponding to this block.  This must be the true
+     * virtual address.  Therefore e.g. x86 stores EIP + CS_BASE, and
+     * targets like Arm, MIPS, HP-PA, which reuse low bits for ISA or
+     * privilege, must store those bits elsewhere.
+     *
+     * If TARGET_TB_PCREL, the opcodes for the TranslationBlock are
+     * written such that the TB is associated only with the physical
+     * page and may be run in any virtual address context.  In this case,
+     * PC must always be taken from ENV in a target-specific manner.
+     * Unwind information is taken as byte offsets from the "current"
+     * value of the PC, as tracked by the translator.
+     */
+    target_ulong pc;
+#endif
+
+    /*
+     * Target-specific data associated with the TranslationBlock, e.g.:
+     * x86: the original user, the Code Segment virtual base,
+     * arm: an extension of tb->flags,
+     * s390x: instruction data for EXECUTE,
+     * sparc: the next pc of the instruction queue (for delay slots).
+     */
+    target_ulong cs_base;
+
     uint32_t flags; /* flags defining in which context the code was generated */
     uint32_t cflags;    /* compile flags */
 
@@ -536,13 +560,24 @@ struct TranslationBlock {
 /* Hide the read to avoid ifdefs for TARGET_TB_PCREL. */
 static inline target_ulong tb_pc(const TranslationBlock *tb)
 {
+#if TARGET_TB_PCREL
+    qemu_build_not_reached();
+#else
     return tb->pc;
+#endif
 }
 
-/* Similarly, but for logs. */
+/*
+ * Similarly, but for logs. In this case, when the virtual pc
+ * is not available, use the physical address.
+ */
 static inline target_ulong tb_pc_log(const TranslationBlock *tb)
 {
+#if TARGET_TB_PCREL
+    return tb->page_addr[0];
+#else
     return tb->pc;
+#endif
 }
 
 /* Hide the qatomic_read to make code a little easier on the eyes */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 8edef14199..7dcfccf6e2 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -235,6 +235,7 @@ struct hvf_vcpu_state;
 
 typedef struct {
     TranslationBlock *tb;
+    vaddr pc;
 } CPUJumpCache;
 
 /* work queue */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f146960b7b..f7c82a8f2c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -185,7 +185,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const TranslationBlock *tb = p;
     const struct tb_desc *desc = d;
 
-    if (tb_pc(tb) == desc->pc &&
+    if ((TARGET_TB_PCREL || tb_pc(tb) == desc->pc) &&
         tb->page_addr[0] == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
@@ -227,7 +227,8 @@ static TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
         return NULL;
     }
     desc.page_addr0 = phys_pc;
-    h = tb_hash_func(phys_pc, pc, flags, cflags, *cpu->trace_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : pc),
+                     flags, cflags, *cpu->trace_dstate);
     return qht_lookup_custom(&tb_ctx.htable, &desc, h, tb_lookup_cmp);
 }
 
@@ -243,21 +244,42 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     tcg_debug_assert(!(cflags & CF_INVALID));
 
     hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash].tb);
-
-    if (likely(tb &&
-               tb->pc == pc &&
-               tb->cs_base == cs_base &&
-               tb->flags == flags &&
-               tb->trace_vcpu_dstate == *cpu->trace_dstate &&
-               tb_cflags(tb) == cflags)) {
-        return tb;
+    if (TARGET_TB_PCREL) {
+        /* Use acquire to ensure current load of pc from tb_jmp_cache[]. */
+        tb = qatomic_load_acquire(&cpu->tb_jmp_cache[hash].tb);
+    } else {
+        /* Use rcu_read to ensure current load of pc from *tb. */
+        tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash].tb);
     }
+    if (likely(tb)) {
+        target_ulong jmp_pc;
+
+        if (TARGET_TB_PCREL) {
+            jmp_pc = qatomic_read(&cpu->tb_jmp_cache[hash].pc);
+        } else {
+            jmp_pc = tb_pc(tb);
+        }
+        if (jmp_pc == pc &&
+            tb->cs_base == cs_base &&
+            tb->flags == flags &&
+            tb->trace_vcpu_dstate == *cpu->trace_dstate &&
+            tb_cflags(tb) == cflags) {
+            return tb;
+        }
+    }
+
     tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
     if (tb == NULL) {
         return NULL;
     }
-    qatomic_set(&cpu->tb_jmp_cache[hash].tb, tb);
+
+    if (TARGET_TB_PCREL) {
+        /* Use store_release on tb to ensure pc is current. */
+        qatomic_set(&cpu->tb_jmp_cache[hash].pc, pc);
+        qatomic_store_release(&cpu->tb_jmp_cache[hash].tb, tb);
+    } else {
+        qatomic_set(&cpu->tb_jmp_cache[hash].tb, tb);
+    }
     return tb;
 }
 
@@ -445,6 +467,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
         if (cc->tcg_ops->synchronize_from_tb) {
             cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
         } else {
+            assert(!TARGET_TB_PCREL);
             assert(cc->set_pc);
             cc->set_pc(cpu, tb_pc(last_tb));
         }
@@ -988,7 +1011,13 @@ int cpu_exec(CPUState *cpu)
                  * for the fast lookup
                  */
                 h = tb_jmp_cache_hash_func(pc);
-                qatomic_set(&cpu->tb_jmp_cache[h].tb, tb);
+                if (TARGET_TB_PCREL) {
+                    /* Use store_release on tb to ensure pc is current. */
+                    qatomic_set(&cpu->tb_jmp_cache[h].pc, pc);
+                    qatomic_store_release(&cpu->tb_jmp_cache[h].tb, tb);
+                } else {
+                    qatomic_set(&cpu->tb_jmp_cache[h].tb, tb);
+                }
             }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 1248ee3433..27435b97db 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -298,7 +298,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             if (i == 0) {
-                prev = (j == 0 ? tb_pc(tb) : 0);
+                prev = (!TARGET_TB_PCREL && j == 0 ? tb_pc(tb) : 0);
             } else {
                 prev = tcg_ctx->gen_insn_data[i - 1][j];
             }
@@ -326,7 +326,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                                      uintptr_t searched_pc, bool reset_icount)
 {
-    target_ulong data[TARGET_INSN_START_WORDS] = { tb_pc(tb) };
+    target_ulong data[TARGET_INSN_START_WORDS];
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
     CPUArchState *env = cpu->env_ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
@@ -342,6 +342,11 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
         return -1;
     }
 
+    memset(data, 0, sizeof(data));
+    if (!TARGET_TB_PCREL) {
+        data[0] = tb_pc(tb);
+    }
+
     /* Reconstruct the stored insn data while looking for the point at
        which the end of the insn exceeds the searched_pc.  */
     for (i = 0; i < num_insns; ++i) {
@@ -884,13 +889,13 @@ static bool tb_cmp(const void *ap, const void *bp)
     const TranslationBlock *a = ap;
     const TranslationBlock *b = bp;
 
-    return tb_pc(a) == tb_pc(b) &&
-        a->cs_base == b->cs_base &&
-        a->flags == b->flags &&
-        (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
-        a->trace_vcpu_dstate == b->trace_vcpu_dstate &&
-        a->page_addr[0] == b->page_addr[0] &&
-        a->page_addr[1] == b->page_addr[1];
+    return ((TARGET_TB_PCREL || tb_pc(a) == tb_pc(b)) &&
+            a->cs_base == b->cs_base &&
+            a->flags == b->flags &&
+            (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
+            a->trace_vcpu_dstate == b->trace_vcpu_dstate &&
+            a->page_addr[0] == b->page_addr[0] &&
+            a->page_addr[1] == b->page_addr[1]);
 }
 
 void tb_htable_init(void)
@@ -1169,8 +1174,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb->page_addr[0];
-    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, orig_cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, orig_cflags, tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
     }
@@ -1186,10 +1191,17 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     }
 
     /* remove the TB from the hash list */
-    h = tb_jmp_cache_hash_func(tb->pc);
-    CPU_FOREACH(cpu) {
-        if (qatomic_read(&cpu->tb_jmp_cache[h].tb) == tb) {
-            qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
+    if (TARGET_TB_PCREL) {
+        /* Any TB may be at any virtual address */
+        CPU_FOREACH(cpu) {
+            cpu_tb_jmp_cache_clear(cpu);
+        }
+    } else {
+        h = tb_jmp_cache_hash_func(tb_pc(tb));
+        CPU_FOREACH(cpu) {
+            if (qatomic_read(&cpu->tb_jmp_cache[h].tb) == tb) {
+                qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
+            }
         }
     }
 
@@ -1300,8 +1312,8 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     }
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, tb->cflags,
-                     tb->trace_vcpu_dstate);
+    h = tb_hash_func(phys_pc, (TARGET_TB_PCREL ? 0 : tb_pc(tb)),
+                     tb->flags, tb->cflags, tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
     /* remove TB from the page(s) if we couldn't insert it */
@@ -1371,7 +1383,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     gen_code_buf = tcg_ctx->code_gen_ptr;
     tb->tc.ptr = tcg_splitwx_to_rx(gen_code_buf);
+#if !TARGET_TB_PCREL
     tb->pc = pc;
+#endif
     tb->cs_base = cs_base;
     tb->flags = flags;
     tb->cflags = cflags;
-- 
2.34.1
