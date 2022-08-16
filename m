Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009106ejf;
        Tue, 16 Aug 2022 13:34:47 -0700 (PDT)
X-Received: by 2002:a05:6808:10d4:b0:344:f380:cf8c with SMTP id s20-20020a05680810d400b00344f380cf8cmr137354ois.27.1660682086980;
        Tue, 16 Aug 2022 13:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682086; cv=none;
        d=google.com; s=arc-20160816;
        b=tqUVQnNbeTk0aBeC269d9Ft6DVkp9dYc63S9LS7q7Xsq3EN399eJTY6dfNJCfiv2+A
         WHaH4JIDKuKf/SRHGF2w/bkj9dItoSXRxZpZYzPXPOdisnNBGia7O1p0X9L3OLTYFmro
         OfUjmOC3dzhG44NSS1RdWC8D0vew/sO/1ecmO6g1Ep5/X5TrsYG7595cBwMcQMGs8WWg
         RNNYKbkXd4gEF86P/xOhZuUDVcM+O/U3SAg2zS31Ref5eeFnc5A0r12Z67CkpzKfixns
         i1sW02X0DA6BzE5do5ABytIIzYmgoDhYyd19ezMsJjkYCZMf9Dko+63yR/vXaWL6lZ8s
         sT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0wEozwiMMGON8j83eoeWLlqUaXUdXZtfgTyD9icvNrg=;
        b=lnGWb0YWLYe0/vfl898VZDVdPJW8luQZmL+Vi5ToQ/DmtdGzJpdcMOj2FKTsZI7ESf
         0QnpLR+Y83iWsI4SspnRf3lwV4vjB04O4p4wzaFs6eDEBRUmb1lLtZycgDSm2IYAC5rT
         Cqwb8b7EPJ1o6UbCgI1rgxZyDHXD/StWT0hRsy1TnZPfpoj8hVHW3FOnLOkc5iOige1Y
         YsZ9qVQgRFiptvvfMXaibymLYSuhI3w5CqDuwHQ6d2yox7rAXsNl8ejADpJFKUvsClfu
         OLF6WNmWdbgTD7/7xIZZcl3li77+J0cM52ObgHIvFrSGVQFMZsJ0OzWgelrmF/S3lrvI
         FTkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nZlrGs7j;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e65-20020a9d01c7000000b00638ab46bb88sor870398ote.51.2022.08.16.13.34.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nZlrGs7j;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0wEozwiMMGON8j83eoeWLlqUaXUdXZtfgTyD9icvNrg=;
        b=nZlrGs7j0Pyx9eyNjRq5q83zXLIhsty9SfCOK3mtJbwRzuofKAcvINcGzM2zA9bARc
         8+8JhLloISHL9Uawoi685+yW1HRf5rztbcXsCgJ5PsyrWaXFrXqEYCd+62WzTfhRC9RK
         oa2Rd64FBSbwMfiiAHRrcY8SBs6/oVXMZ3wmiwfU8e5WRFVVLKYqAzSY9IfQJ1rNbVNc
         VA+9Zw+LwJQZq/KgP53ozQq+SRO1uPXwrZfQ/BKOPY06ImRbB6KFRveB7bxQeA7Ms51I
         nUO/g3IzhbjMrspJ1VGze0KVg57QgSnCRN6HtfVxL0/l/J6RnsAZZG53KE/fd1B6KUph
         l1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0wEozwiMMGON8j83eoeWLlqUaXUdXZtfgTyD9icvNrg=;
        b=oVeWdvyvQPPgIHoEif9GzAwqFVVBX4mrCxnvGRnq3sXwCM20E86XUPpzM6CLBJxyvT
         vyecx6bW5cc2vTPHF9RjkXOoXOZjNrSHZ5TKguS+4slf+39vgaJNqdZz2tGY4rs/ykN5
         TwdyDyrwJolhgabI8la+D2fnVKvlBLtT/mfKxn2kpT3RvkXQyRTJJor4XQyXzpU29m6G
         4sfmo+Q371stB5fh8zwjCuq3vmebGCP2NNzhnY+D+CI1lQAttfNVALIIQNzm1cEkAIal
         LRoVsZcU8IZtQTjjMNzDa78wp94YFFAOLyGAKyK5Q+wOUsEi38mBTg4GHE6JYwMhRwuu
         +i3Q==
X-Gm-Message-State: ACgBeo3T+3R5xgK8n7juyw4s+QKGJq12eIeMCrt5Ib5OCbLWppS14K+w
	S5nI+0GV+oBWYmb5CiLX6Swm3BzA
X-Google-Smtp-Source: AA6agR7X94qf3OtUDJGLzkj4cWsjYibg6YY4IV1xy6XLdAl9FD6j61Bdm2MS33CLMF48SwPwYFdsoQ==
X-Received: by 2002:a9d:6ad7:0:b0:636:f76b:638a with SMTP id m23-20020a9d6ad7000000b00636f76b638amr8583857otq.233.1660682086486;
        Tue, 16 Aug 2022 13:34:46 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 18/33] accel/tcg: Add fast path for translator_ld*
Date: Tue, 16 Aug 2022 15:33:45 -0500
Message-Id: <20220816203400.161187-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IF3l0yqeBWiz

Cache the translation from guest to host address, so we may
use direct loads when we hit on the primary translation page.

Look up the second translation page only once, during translation.
This obviates another lookup of the second page within tb_gen_code
after translation.

Fixes a bug in that plugin_insn_append should be passed the bytes
in the original memory order, not bswapped by pieces.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h |  52 ++++++++++++------
 accel/tcg/translate-all.c |  26 ++++-----
 accel/tcg/translator.c    | 111 +++++++++++++++++++++++++++++++-------
 3 files changed, 138 insertions(+), 51 deletions(-)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 69db0f5c21..177a001698 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -81,13 +81,14 @@ typedef enum DisasJumpType {
  * Architecture-agnostic disassembly context.
  */
 typedef struct DisasContextBase {
-    const TranslationBlock *tb;
+    TranslationBlock *tb;
     target_ulong pc_first;
     target_ulong pc_next;
     DisasJumpType is_jmp;
     int num_insns;
     int max_insns;
     bool singlestep_enabled;
+    void *host_addr[2];
 #ifdef CONFIG_USER_ONLY
     /*
      * Guest address of the last byte of the last protected page.
@@ -183,24 +184,43 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest);
  * the relevant information at translation time.
  */
 
-#define GEN_TRANSLATOR_LD(fullname, type, load_fn, swap_fn)             \
-    type fullname ## _swap(CPUArchState *env, DisasContextBase *dcbase, \
-                           abi_ptr pc, bool do_swap);                   \
-    static inline type fullname(CPUArchState *env,                      \
-                                DisasContextBase *dcbase, abi_ptr pc)   \
-    {                                                                   \
-        return fullname ## _swap(env, dcbase, pc, false);               \
+uint8_t translator_ldub(CPUArchState *env, DisasContextBase *db, abi_ptr pc);
+uint16_t translator_lduw(CPUArchState *env, DisasContextBase *db, abi_ptr pc);
+uint32_t translator_ldl(CPUArchState *env, DisasContextBase *db, abi_ptr pc);
+uint64_t translator_ldq(CPUArchState *env, DisasContextBase *db, abi_ptr pc);
+
+static inline uint16_t
+translator_lduw_swap(CPUArchState *env, DisasContextBase *db,
+                     abi_ptr pc, bool do_swap)
+{
+    uint16_t ret = translator_lduw(env, db, pc);
+    if (do_swap) {
+        ret = bswap16(ret);
     }
+    return ret;
+}
 
-#define FOR_EACH_TRANSLATOR_LD(F)                                       \
-    F(translator_ldub, uint8_t, cpu_ldub_code, /* no swap */)           \
-    F(translator_lduw, uint16_t, cpu_lduw_code, bswap16)                \
-    F(translator_ldl, uint32_t, cpu_ldl_code, bswap32)                  \
-    F(translator_ldq, uint64_t, cpu_ldq_code, bswap64)
+static inline uint32_t
+translator_ldl_swap(CPUArchState *env, DisasContextBase *db,
+                    abi_ptr pc, bool do_swap)
+{
+    uint32_t ret = translator_ldl(env, db, pc);
+    if (do_swap) {
+        ret = bswap32(ret);
+    }
+    return ret;
+}
 
-FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
-
-#undef GEN_TRANSLATOR_LD
+static inline uint64_t
+translator_ldq_swap(CPUArchState *env, DisasContextBase *db,
+                    abi_ptr pc, bool do_swap)
+{
+    uint64_t ret = translator_ldq_swap(env, db, pc, false);
+    if (do_swap) {
+        ret = bswap64(ret);
+    }
+    return ret;
+}
 
 /*
  * Return whether addr is on the same page as where disassembly started.
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 7360ecdb38..a8f1c34c4e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1332,10 +1332,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 {
     CPUArchState *env = cpu->env_ptr;
     TranslationBlock *tb, *existing_tb;
-    tb_page_addr_t phys_pc, phys_page2;
-    target_ulong virt_page2;
+    tb_page_addr_t phys_pc;
     tcg_insn_unit *gen_code_buf;
     int gen_code_size, search_size, max_insns;
+    void *host_pc;
 #ifdef CONFIG_PROFILER
     TCGProfile *prof = &tcg_ctx->prof;
     int64_t ti;
@@ -1344,7 +1344,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     assert_memory_lock();
     qemu_thread_jit_write();
 
-    phys_pc = get_page_addr_code_hostp(env, pc, false, NULL);
+    phys_pc = get_page_addr_code_hostp(env, pc, false, &host_pc);
 
     if (phys_pc == -1) {
         /* Generate a one-shot TB with 1 insn in it */
@@ -1375,6 +1375,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->flags = flags;
     tb->cflags = cflags;
     tb->trace_vcpu_dstate = *cpu->trace_dstate;
+    tb->page_addr[0] = phys_pc;
+    tb->page_addr[1] = -1;
     tcg_ctx->tb_cflags = cflags;
  tb_overflow:
 
@@ -1568,13 +1570,11 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     }
 
     /*
-     * If the TB is not associated with a physical RAM page then
-     * it must be a temporary one-insn TB, and we have nothing to do
-     * except fill in the page_addr[] fields. Return early before
-     * attempting to link to other TBs or add to the lookup table.
+     * If the TB is not associated with a physical RAM page then it must be
+     * a temporary one-insn TB, and we have nothing left to do. Return early
+     * before attempting to link to other TBs or add to the lookup table.
      */
-    if (phys_pc == -1) {
-        tb->page_addr[0] = tb->page_addr[1] = -1;
+    if (tb->page_addr[0] == -1) {
         return tb;
     }
 
@@ -1585,17 +1585,11 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
      */
     tcg_tb_insert(tb);
 
-    /* check next page if needed */
-    virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
-    phys_page2 = -1;
-    if ((pc & TARGET_PAGE_MASK) != virt_page2) {
-        phys_page2 = get_page_addr_code(env, virt_page2);
-    }
     /*
      * No explicit memory barrier is required -- tb_link_page() makes the
      * TB visible in a consistent state.
      */
-    existing_tb = tb_link_page(tb, phys_pc, phys_page2);
+    existing_tb = tb_link_page(tb, tb->page_addr[0], tb->page_addr[1]);
     /* if the TB already exists, discard what we just translated */
     if (unlikely(existing_tb != tb)) {
         uintptr_t orig_aligned = (uintptr_t)gen_code_buf;
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 3eef30d93a..a693c17259 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -66,6 +66,8 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
     db->num_insns = 0;
     db->max_insns = max_insns;
     db->singlestep_enabled = cflags & CF_SINGLE_STEP;
+    db->host_addr[0] = host_pc;
+    db->host_addr[1] = NULL;
     translator_page_protect(db, db->pc_next);
 
     ops->init_disas_context(db, cpu);
@@ -151,31 +153,102 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int max_insns,
 #endif
 }
 
-static inline void translator_maybe_page_protect(DisasContextBase *dcbase,
-                                                 target_ulong pc, size_t len)
+static void *translator_access(CPUArchState *env, DisasContextBase *db,
+                               target_ulong pc, size_t len)
 {
+    void *host;
+    target_ulong base;
+    TranslationBlock *tb;
+
 #ifdef CONFIG_USER_ONLY
     target_ulong end = pc + len - 1;
-
-    if (end > dcbase->page_protect_end) {
-        translator_page_protect(dcbase, end);
+    if (end > db->page_protect_end) {
+        translator_page_protect(db, end);
     }
 #endif
-}
 
-#define GEN_TRANSLATOR_LD(fullname, type, load_fn, swap_fn)             \
-    type fullname ## _swap(CPUArchState *env, DisasContextBase *dcbase, \
-                           abi_ptr pc, bool do_swap)                    \
-    {                                                                   \
-        translator_maybe_page_protect(dcbase, pc, sizeof(type));        \
-        type ret = load_fn(env, pc);                                    \
-        if (do_swap) {                                                  \
-            ret = swap_fn(ret);                                         \
-        }                                                               \
-        plugin_insn_append(pc, &ret, sizeof(ret));                      \
-        return ret;                                                     \
+    tb = db->tb;
+    if (unlikely(tb->page_addr[0] == -1)) {
+        /* Use slow path if first page is MMIO. */
+        return NULL;
+    } else if (likely(is_same_page(db, pc + len - 1))) {
+        host = db->host_addr[0];
+        base = db->pc_first;
+    } else if (is_same_page(db, pc)) {
+        /* Use slow path when crossing pages. */
+        return NULL;
+    } else {
+        host = db->host_addr[1];
+        base = TARGET_PAGE_ALIGN(db->pc_first);
+        if (host == NULL) {
+            tb->page_addr[1] =
+                get_page_addr_code_hostp(env, base, false,
+                                         &db->host_addr[1]);
+            /* We cannot handle MMIO as second page. */
+            assert(tb->page_addr[1] != -1);
+            host = db->host_addr[1];
+        }
     }
 
-FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
+    tcg_debug_assert(pc >= base);
+    return host + (pc - base);
+}
 
-#undef GEN_TRANSLATOR_LD
+uint8_t translator_ldub(CPUArchState *env, DisasContextBase *db, abi_ptr pc)
+{
+    uint8_t ret;
+    void *p = translator_access(env, db, pc, sizeof(ret));
+
+    if (p) {
+        plugin_insn_append(pc, p, sizeof(ret));
+        return ldub_p(p);
+    }
+    ret = cpu_ldub_code(env, pc);
+    plugin_insn_append(pc, &ret, sizeof(ret));
+    return ret;
+}
+
+uint16_t translator_lduw(CPUArchState *env, DisasContextBase *db, abi_ptr pc)
+{
+    uint16_t ret, plug;
+    void *p = translator_access(env, db, pc, sizeof(ret));
+
+    if (p) {
+        plugin_insn_append(pc, p, sizeof(ret));
+        return lduw_p(p);
+    }
+    ret = cpu_lduw_code(env, pc);
+    plug = tswap16(ret);
+    plugin_insn_append(pc, &plug, sizeof(ret));
+    return ret;
+}
+
+uint32_t translator_ldl(CPUArchState *env, DisasContextBase *db, abi_ptr pc)
+{
+    uint32_t ret, plug;
+    void *p = translator_access(env, db, pc, sizeof(ret));
+
+    if (p) {
+        plugin_insn_append(pc, p, sizeof(ret));
+        return ldl_p(p);
+    }
+    ret = cpu_ldl_code(env, pc);
+    plug = tswap32(ret);
+    plugin_insn_append(pc, &plug, sizeof(ret));
+    return ret;
+}
+
+uint64_t translator_ldq(CPUArchState *env, DisasContextBase *db, abi_ptr pc)
+{
+    uint64_t ret, plug;
+    void *p = translator_access(env, db, pc, sizeof(ret));
+
+    if (p) {
+        plugin_insn_append(pc, p, sizeof(ret));
+        return ldq_p(p);
+    }
+    ret = cpu_ldq_code(env, pc);
+    plug = tswap64(ret);
+    plugin_insn_append(pc, &plug, sizeof(ret));
+    return ret;
+}
-- 
2.34.1
