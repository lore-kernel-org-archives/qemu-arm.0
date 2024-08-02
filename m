Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp1163137njb;
        Thu, 1 Aug 2024 17:30:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsmSey+j8VyldT6/nLwLYwSpU7dugLiW7fjp//juS5ms+HEP6Nrv+C3LtPxKVimq0beRR8WexNdUwcDf+tpYlFibMDhq0H
X-Google-Smtp-Source: AGHT+IEJAD9ONyxpM2EOa+bYqmig1Y9R38o0m5dZtNNx5/I6ZJZAICDoz2Kp3J40qC4fJ/fiBvCi
X-Received: by 2002:ac8:5fce:0:b0:44f:f8b8:bcab with SMTP id d75a77b69052e-45189354fffmr21314081cf.52.1722558658736;
        Thu, 01 Aug 2024 17:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722558658; cv=none;
        d=google.com; s=arc-20160816;
        b=siEB1S4UdMCerPfcJB5tImvMD4FpSMHvHmEp9yUrYONfI/MTEpvJAble7Nf0dlXfqn
         mgr2QKVZigssTLTNSc/nJimNhyyXn+3IVlTthLAaCBy1s8bDJ+zAyhB6+RZ7yPkayGb/
         CbRlI34zZMM8ctIaI9mQK1XCFDzkf8FFGjppn7CcLHMhzPBVpXDXE2bzg9MLybXYZBt5
         sCJnBoQKKM5oM/Ew+g1M7Sz66u6ITRI39v6PIp2A2zSuqUc0bFTNcmNk6aUoxQ+2eAiJ
         FkOey65I6F82WTvYtCuI/ruPcvK1YYA94WZ2A4ujZQKcz2p0TvfrqtRR0/x3iy+OKj4K
         E4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LiMEQG69yJo8ctZ7Uv/IEe1k23BKFoSxFIRYOs9ZoWQ=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=ri3XNIzTg5hvpF9mTIVf/IyMJksNpeXhXKfAvOSVu5vHz8gtUpde4J9Sk9IHa96Tgu
         /gWlRz4tB/xJninIfjAPX8XE0uUlPrhXm3oI81eNuKtWEam+ksjQKbv+EZcTBcQB1VnG
         aZuKfRJUXBrEoeVQlmM8bO7wnlO6xsiKPAhYDM1k4UPO4csXU0VK3FJhPaw1BhtzH0oB
         na+roI0W+ROS1o+drspgPby3O0GNZPJc+fyS8PcglSjKJh4i0K3GbnDGJn8mUjO868xN
         ZNKjFPuU1ce+a3XbguMSs67dHCtFCBgL8O5gUkKOwPK3+PaJCpzCkKAiBz0NOVXH7GwC
         qP7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rgLovX5f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4518a77c076si9728391cf.442.2024.08.01.17.30.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Aug 2024 17:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rgLovX5f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZgC2-0000zE-4O; Thu, 01 Aug 2024 20:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sZgBs-0000xw-Py
 for qemu-arm@nongnu.org; Thu, 01 Aug 2024 20:30:42 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sZgBp-0002Tx-EJ
 for qemu-arm@nongnu.org; Thu, 01 Aug 2024 20:30:40 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1fc4fccdd78so58074155ad.2
 for <qemu-arm@nongnu.org>; Thu, 01 Aug 2024 17:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722558635; x=1723163435; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LiMEQG69yJo8ctZ7Uv/IEe1k23BKFoSxFIRYOs9ZoWQ=;
 b=rgLovX5fqoz0qwTT0MAGa+USGXWWvfu0oVRb/ivhjyIRffmiEJmolhvnwwsClgtqhL
 Wzwt6nt0sm47toRzQrTsg3W5ifCKlKUlXMxcA1vIVxIOyCsGnB6STpL3om82CmnzkWxC
 hwbXl9jN660YjpV1E+6oBneWopmbYH3q4nWe3niQ1SdY1uU7+2yEVQLwNB80IJCZqINy
 mSZdyQSpn1mlvLFnjSj4CeIRS+gyO5hDe06DQ4RUmrXcImxPdAffB6WMJwdQpjooiq79
 85hTmX73u/p4GVAphfU7jAiUuKT2O7504ilaNEJq8YT1Deur2ZYmCNhDmaXwhALAGCmA
 M8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722558635; x=1723163435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LiMEQG69yJo8ctZ7Uv/IEe1k23BKFoSxFIRYOs9ZoWQ=;
 b=krSSLCGbqbSOjiZnmilK1rxCQFzQLxe/856yJvkod3fhiBqGh0rN5uUVzPjySJ7TU3
 qfHDR9Uk3G9rz+uIkT/MzcuVVQ8HzJuqPaihxfKGAILHT2QIzr1ReWI/AlTLdVVXUC+U
 7cTJKUwYurf4WnRh8rf+V9w7fNNbLSz+qyzo0QVE4pwlqQTRrCve0rSAFSRrVOMFDjNX
 rht452uU8RuK0D0BY04b0cghd6pZrNSW3WFAalS+//hx2c7M+uoR2xhqiUjTMXpSLkop
 ECyJ+lEFInczNR7nPJWdZDo9kO85V3OwidgsPtTQ09fz8METOBcdViimf1apTcCCXouR
 S47w==
X-Gm-Message-State: AOJu0YxMpk/QGRd1CU5rJn4w7xL4tEGu6IlZ44y5vQ7YoJVnghENzZPx
 3bmL6yHFWGJMe5rH+6l7mB1uYGv/9pnqenNSehV0p5g2keLdCooH/tnuclgrOi4=
X-Received: by 2002:a17:902:f54b:b0:1fd:6c5b:afcc with SMTP id
 d9443c01a7336-1ff5727c375mr26297155ad.8.1722558635018; 
 Thu, 01 Aug 2024 17:30:35 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ff59175d73sm4891275ad.193.2024.08.01.17.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 17:30:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2] target/arm: Fix BTI versus CF_PCREL
Date: Fri,  2 Aug 2024 10:30:28 +1000
Message-ID: <20240802003028.795476-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IjPeFsiRVRwY

With pcrel, we cannot check the guarded page bit at translation
time, as different mappings of the same physical page may or may
not have the GP bit set.

Instead, add a couple of helpers to check the page at runtime,
after all other filters that might obviate the need for the check.

The set_btype_for_br call must be moved after the gen_a64_set_pc
call to ensure the current pc can still be computed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

v2: Enable unwind from guarded_page_br.
    Since guarded_page_check is called exclusively with btype != 0,
    it must immediately follow an indirect branch or eret, so cpu
    state is up-to-date, so unwind is not required.

---
 target/arm/tcg/helper-a64.h    |  3 ++
 target/arm/tcg/translate.h     |  2 --
 target/arm/tcg/helper-a64.c    | 39 +++++++++++++++++++++
 target/arm/tcg/translate-a64.c | 64 ++++++++--------------------------
 4 files changed, 56 insertions(+), 52 deletions(-)

diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index 371388f61b..481007bf39 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -133,6 +133,9 @@ DEF_HELPER_4(cpyfp, void, env, i32, i32, i32)
 DEF_HELPER_4(cpyfm, void, env, i32, i32, i32)
 DEF_HELPER_4(cpyfe, void, env, i32, i32, i32)
 
+DEF_HELPER_FLAGS_1(guarded_page_check, TCG_CALL_NO_WG, void, env)
+DEF_HELPER_FLAGS_2(guarded_page_br, TCG_CALL_NO_RWG, void, env, tl)
+
 DEF_HELPER_FLAGS_5(gvec_fdiv_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fdiv_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fdiv_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index a8672c857c..01c217f4a4 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -163,8 +163,6 @@ typedef struct DisasContext {
     uint8_t dcz_blocksize;
     /* A copy of cpu->gm_blocksize. */
     uint8_t gm_blocksize;
-    /* True if this page is guarded.  */
-    bool guarded_page;
     /* True if the current insn_start has been updated. */
     bool insn_start_updated;
     /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index c60d2a7ec9..21a9abd90a 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -1877,3 +1877,42 @@ void HELPER(cpyfe)(CPUARMState *env, uint32_t syndrome, uint32_t wdesc,
 {
     do_cpye(env, syndrome, wdesc, rdesc, false, GETPC());
 }
+
+static bool is_guarded_page(CPUARMState *env, target_ulong addr, uintptr_t ra)
+{
+#ifdef CONFIG_USER_ONLY
+    return page_get_flags(addr) & PAGE_BTI;
+#else
+    CPUTLBEntryFull *full;
+    void *host;
+    int mmu_idx = cpu_mmu_index(env_cpu(env), true);
+    int flags = probe_access_full(env, addr, 0, MMU_INST_FETCH, mmu_idx,
+                                  false, &host, &full, ra);
+
+    assert(!(flags & TLB_INVALID_MASK));
+    return full->extra.arm.guarded;
+#endif
+}
+
+void HELPER(guarded_page_check)(CPUARMState *env)
+{
+    /*
+     * We have already verified that bti is enabled, and that the
+     * instruction at PC is not ok for BTYPE.  This is always at
+     * the beginning of a block, so PC is always up-to-date and
+     * no unwind is required.
+     */
+    if (is_guarded_page(env, env->pc, 0)) {
+        raise_exception(env, EXCP_UDEF, syn_btitrap(env->btype),
+                        exception_target_el(env));
+    }
+}
+
+void HELPER(guarded_page_br)(CPUARMState *env, target_ulong pc)
+{
+    /*
+     * We have already checked for branch via x16 and x17.
+     * What remains for choosing BTYPE is checking for a guarded page.
+     */
+    env->btype = is_guarded_page(env, pc, GETPC()) ? 3 : 1;
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 148be2826e..28a1013503 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1507,7 +1507,14 @@ static void set_btype_for_br(DisasContext *s, int rn)
 {
     if (dc_isar_feature(aa64_bti, s)) {
         /* BR to {x16,x17} or !guard -> 1, else 3.  */
-        set_btype(s, rn == 16 || rn == 17 || !s->guarded_page ? 1 : 3);
+        if (rn == 16 || rn == 17) {
+            set_btype(s, 1);
+        } else {
+            TCGv_i64 pc = tcg_temp_new_i64();
+            gen_pc_plus_diff(s, pc, 0);
+            gen_helper_guarded_page_br(tcg_env, pc);
+            s->btype = -1;
+        }
     }
 }
 
@@ -1521,8 +1528,8 @@ static void set_btype_for_blr(DisasContext *s)
 
 static bool trans_BR(DisasContext *s, arg_r *a)
 {
-    gen_a64_set_pc(s, cpu_reg(s, a->rn));
     set_btype_for_br(s, a->rn);
+    gen_a64_set_pc(s, cpu_reg(s, a->rn));
     s->base.is_jmp = DISAS_JUMP;
     return true;
 }
@@ -1581,8 +1588,8 @@ static bool trans_BRAZ(DisasContext *s, arg_braz *a)
     }
 
     dst = auth_branch_target(s, cpu_reg(s, a->rn), tcg_constant_i64(0), !a->m);
-    gen_a64_set_pc(s, dst);
     set_btype_for_br(s, a->rn);
+    gen_a64_set_pc(s, dst);
     s->base.is_jmp = DISAS_JUMP;
     return true;
 }
@@ -11878,37 +11885,6 @@ static bool trans_FAIL(DisasContext *s, arg_OK *a)
     return true;
 }
 
-/**
- * is_guarded_page:
- * @env: The cpu environment
- * @s: The DisasContext
- *
- * Return true if the page is guarded.
- */
-static bool is_guarded_page(CPUARMState *env, DisasContext *s)
-{
-    uint64_t addr = s->base.pc_first;
-#ifdef CONFIG_USER_ONLY
-    return page_get_flags(addr) & PAGE_BTI;
-#else
-    CPUTLBEntryFull *full;
-    void *host;
-    int mmu_idx = arm_to_core_mmu_idx(s->mmu_idx);
-    int flags;
-
-    /*
-     * We test this immediately after reading an insn, which means
-     * that the TLB entry must be present and valid, and thus this
-     * access will never raise an exception.
-     */
-    flags = probe_access_full(env, addr, 0, MMU_INST_FETCH, mmu_idx,
-                              false, &host, &full, 0);
-    assert(!(flags & TLB_INVALID_MASK));
-
-    return full->extra.arm.guarded;
-#endif
-}
-
 /**
  * btype_destination_ok:
  * @insn: The instruction at the branch destination
@@ -12151,19 +12127,6 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 
     if (dc_isar_feature(aa64_bti, s)) {
         if (s->base.num_insns == 1) {
-            /*
-             * At the first insn of the TB, compute s->guarded_page.
-             * We delayed computing this until successfully reading
-             * the first insn of the TB, above.  This (mostly) ensures
-             * that the softmmu tlb entry has been populated, and the
-             * page table GP bit is available.
-             *
-             * Note that we need to compute this even if btype == 0,
-             * because this value is used for BR instructions later
-             * where ENV is not available.
-             */
-            s->guarded_page = is_guarded_page(env, s);
-
             /* First insn can have btype set to non-zero.  */
             tcg_debug_assert(s->btype >= 0);
 
@@ -12172,12 +12135,13 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
              * priority -- below debugging exceptions but above most
              * everything else.  This allows us to handle this now
              * instead of waiting until the insn is otherwise decoded.
+             *
+             * We can check all but the guarded page check here;
+             * defer the latter to a helper.
              */
             if (s->btype != 0
-                && s->guarded_page
                 && !btype_destination_ok(insn, s->bt, s->btype)) {
-                gen_exception_insn(s, 0, EXCP_UDEF, syn_btitrap(s->btype));
-                return;
+                gen_helper_guarded_page_check(tcg_env);
             }
         } else {
             /* Not the first insn: btype must be 0.  */
-- 
2.43.0

