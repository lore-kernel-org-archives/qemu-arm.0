Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3681288lfa;
        Mon, 7 Jun 2021 10:07:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOTsLZ5hCtoFo3Z6IWdCtzVOu4lFUDASWn/Ap4kOoz9GA5RqOf8esAJzL5N+dlKaAH64hS
X-Received: by 2002:a05:600c:1d1a:: with SMTP id l26mr11045576wms.189.1623085654781;
        Mon, 07 Jun 2021 10:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623085654; cv=none;
        d=google.com; s=arc-20160816;
        b=y+am3XyoN+B2p4XLvetrEchIz4mfVPmPcavJFxnz84UvWB/vE9/XMPeN3/GMlZfvGs
         Nxx/nBSW8yGScMBEfNX+min/91PhfRETOY3SdG6dhSWSJHORYKKdjh9hLq/LwLe3Rg0M
         cs/fyS/VTXR4AIs0Y87tsPfc7JHqlD/3cQcSeAKkikHblVbl0s/NRQBDYhZiYJ9fXuTn
         l424dx4IeI0pftFZehPmZ40bnQvVK1VW2ikgtEFmFMS60HZHCtSiDT5o2Q0ZPv5T7cBY
         Js5BYXO7VVyN23yc2qYT1i/DrQ07+aN54qcnd24D5akLBldaD8EGI3yjSab8LdLBeJUB
         7pVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LKqmv0MgdApn4ZHvXGc8SemnH+SSJM42zZ7JcZtsFWE=;
        b=ZUs+vvq3M6FZ94hnk/oNZXUuznoS+ToA4cV6xNKzkW9FbES4/ZifhvmVZbbRZ9N7+i
         PZl4Wr52IzkGpWpmkmhQZ43xC14By98vY0ijScHX0N1naEbfz9e1Y41qqCKriV1ZX0oy
         muQ2ItIPxesABV5QpFxulIXEtuYcg9ySsGiIIJwbtCwqX9vJlD7xg7HDA6/UG1mKpWjl
         0NPmWqz94lQmwLceWhZNomdkjR6irHAAIN0WQLl1CAWqrWfQrof75iLvztYbJG5e6UaU
         KuO7rd+CzGwYEPsaYxvcjc/k7458u/9rL3cldBHP63dPkO6K7cOazfHJtsuej2B5F5v6
         mSPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wyI18BeC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si9978293wrr.539.2021.06.07.10.07.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wyI18BeC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIir-0004UR-PQ
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaD-0007Ko-E4
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:37 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa8-0007tu-Qe
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:37 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso124025wmg.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LKqmv0MgdApn4ZHvXGc8SemnH+SSJM42zZ7JcZtsFWE=;
 b=wyI18BeCVmi4d8sDs/M8rseTGlKY94y+I3Rs2pH3w5XuEiCx/U5PCxz02Q2qpWqhBE
 iOnei8ZsNB0RFuu3Vvq1dkPvgbhb7zAbet5PEXr0vERNpqI1KhaoQ/nxBjIhQxIZ0YZI
 Nbr6lGfCC6GAc9EARBKeqgNcgzJc3udY1KAQhzacbfai+rtObcxTgrBxBvDPdzWVlmO6
 wnfucW4Nh6CBgwkoxppoTVB2ZyqiiDbYBPjhmgdVbS+O3KLfcwK9zh39HEHKqmw8k1V/
 eOUlxQBup1No6MTFHB4N6hTWrIp/JO541cPe9UussKXF/3EVg6ICc6Iu63xog7R43uDZ
 cQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LKqmv0MgdApn4ZHvXGc8SemnH+SSJM42zZ7JcZtsFWE=;
 b=Waqubefqbqqp5YX9goNS/I0MxFMoDcNIRiW5hR62VPoB9j0E2DvZfmYBL707XK2R4G
 LRBbxsF68331CI8XjSWe5zLWT+Nn0ZI4GSHZo22AAvTiGoZjHobLTKowXH1tcF7xsV5f
 jbkZMFfI3HxwAmLKLntkeYYQMXjmjuH+IJY4UQWKw6vuLQjRSyHz/ukbEr+V43tCQz8y
 4vxtaEA7plOyvCNRGtWAC9Q53Wxvp6/mWv2KM2ZJx4bWQJTcFtm4ywnVccdmXvhwr+wU
 Gvf+EfdyzFDoZDMxpYjMkdX4ZBIRtqBi8Ta39VSBlKEPFnmNxVxZjYgP9s4sVSrx5/oh
 v2Lg==
X-Gm-Message-State: AOAM530oa0jTQI5i1zafui0FCbjMG4uOUnpuQsIX0/2j9odV9gfkbZdq
 vPi6pdYcOFPq6/6uSB+4wT5jPa2NpYRUh3aX
X-Received: by 2002:a1c:e907:: with SMTP id q7mr70588wmc.1.1623085111449;
 Mon, 07 Jun 2021 09:58:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/55] target/arm: Implement MVE LETP insn
Date: Mon,  7 Jun 2021 17:57:35 +0100
Message-Id: <20210607165821.9892-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rry3scEBe7ge

Implement the MVE LETP insn.  This is like the existing LE loop-end
insn, but it must perform an FPU-enabled check, and on loop-exit it
resets LTPSIZE to 4.

To accommodate the requirement to do something on loop-exit, we drop
the use of condlabel and instead manage both the TB exits manually,
in the same way we already do in trans_WLS().

The other MVE-specific change to the LE insn is that we must raise an
INVSTATE UsageFault insn if LTPSIZE is not 4.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This amounts to a complete rewrite of trans_LE()...
---
 target/arm/t32.decode  |   2 +-
 target/arm/translate.c | 104 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 97 insertions(+), 9 deletions(-)

diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 8e1ca7d64a9..4115e08ce99 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -676,7 +676,7 @@ BL               1111 0. .......... 11.1 ............         @branch24
     {
       # This is WLSTP
       WLS        1111 0 0000 0 size:2 rn:4 1100 . .......... 1 imm=%lob_imm
-      LE         1111 0 0000 0 f:1 0 1111 1100 . .......... 1 imm=%lob_imm
+      LE         1111 0 0000 0 f:1 tp:1 1111 1100 . .......... 1 imm=%lob_imm
     }
     {
       # This is DLSTP
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 976c665be9c..6d70c89961a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8223,25 +8223,113 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
      * any faster.
      */
     TCGv_i32 tmp;
+    TCGLabel *loopend;
+    bool fpu_active;
 
     if (!dc_isar_feature(aa32_lob, s)) {
         return false;
     }
+    if (a->f && a->tp) {
+        return false;
+    }
+    if (s->condexec_mask) {
+        /*
+         * LE in an IT block is CONSTRAINED UNPREDICTABLE;
+         * we choose to UNDEF, because otherwise our use of
+         * gen_goto_tb(1) would clash with the use of TB exit 1
+         * in the dc->condjmp condition-failed codepath in
+         * arm_tr_tb_stop() and we'd get an assertion.
+         */
+        return false;
+    }
+    if (a->tp) {
+        /* LETP */
+        if (!dc_isar_feature(aa32_mve, s)) {
+            return false;
+        }
+        if (!vfp_access_check(s)) {
+            s->eci_handled = true;
+            return true;
+        }
+    }
 
     /* LE/LETP is OK with ECI set and leaves it untouched */
     s->eci_handled = true;
 
-    if (!a->f) {
-        /* Not loop-forever. If LR <= 1 this is the last loop: do nothing. */
-        arm_gen_condlabel(s);
-        tcg_gen_brcondi_i32(TCG_COND_LEU, cpu_R[14], 1, s->condlabel);
-        /* Decrement LR */
-        tmp = load_reg(s, 14);
-        tcg_gen_addi_i32(tmp, tmp, -1);
-        store_reg(s, 14, tmp);
+    /*
+     * With MVE, LTPSIZE might not be 4, and we must emit an INVSTATE
+     * UsageFault exception for the LE insn in that case. Note that we
+     * are not directly checking FPSCR.LTPSIZE but instead check the
+     * pseudocode LTPSIZE() function, which returns 4 if the FPU is
+     * not currently active (ie ActiveFPState() returns false). We
+     * can identify not-active purely from our TB state flags, as the
+     * FPU is active only if:
+     *  the FPU is enabled
+     *  AND lazy state preservation is not active
+     *  AND we do not need a new fp context (this is the ASPEN/FPCA check)
+     *
+     * Usually we don't need to care about this distinction between
+     * LTPSIZE and FPSCR.LTPSIZE, because the code in vfp_access_check()
+     * will either take an exception or clear the conditions that make
+     * the FPU not active. But LE is an unusual case of a non-FP insn
+     * that looks at LTPSIZE.
+     */
+    fpu_active = !s->fp_excp_el && !s->v7m_lspact && !s->v7m_new_fp_ctxt_needed;
+
+    if (!a->tp && dc_isar_feature(aa32_mve, s) && fpu_active) {
+        /* Need to do a runtime check for LTPSIZE != 4 */
+        TCGLabel *skipexc = gen_new_label();
+        tmp = load_cpu_field(v7m.ltpsize);
+        tcg_gen_brcondi_i32(TCG_COND_EQ, tmp, 4, skipexc);
+        tcg_temp_free_i32(tmp);
+        gen_exception_insn(s, s->pc_curr, EXCP_INVSTATE, syn_uncategorized(),
+                           default_exception_el(s));
+        gen_set_label(skipexc);
+    }
+
+    if (a->f) {
+        /* Loop-forever: just jump back to the loop start */
+        gen_jmp(s, read_pc(s) - a->imm);
+        return true;
+    }
+
+    /*
+     * Not loop-forever. If LR <= loop-decrement-value this is the last loop.
+     * For LE, we know at this point that LTPSIZE must be 4 and the
+     * loop decrement value is 1. For LETP we need to calculate the decrement
+     * value from LTPSIZE.
+     */
+    loopend = gen_new_label();
+    if (!a->tp) {
+        tcg_gen_brcondi_i32(TCG_COND_LEU, cpu_R[14], 1, loopend);
+        tcg_gen_addi_i32(cpu_R[14], cpu_R[14], -1);
+    } else {
+        /*
+         * Decrement by 1 << (4 - LTPSIZE). We need to use a TCG local
+         * so that decr stays live after the brcondi.
+         */
+        TCGv_i32 decr = tcg_temp_local_new_i32();
+        TCGv_i32 ltpsize = load_cpu_field(v7m.ltpsize);
+        tcg_gen_sub_i32(decr, tcg_constant_i32(4), ltpsize);
+        tcg_gen_shl_i32(decr, tcg_constant_i32(1), decr);
+        tcg_temp_free_i32(ltpsize);
+
+        tcg_gen_brcond_i32(TCG_COND_LEU, cpu_R[14], decr, loopend);
+
+        tcg_gen_sub_i32(cpu_R[14], cpu_R[14], decr);
+        tcg_temp_free_i32(decr);
     }
     /* Jump back to the loop start */
     gen_jmp(s, read_pc(s) - a->imm);
+
+    gen_set_label(loopend);
+    if (a->tp) {
+        /* Exits from tail-pred loops must reset LTPSIZE to 4 */
+        tmp = tcg_const_i32(4);
+        store_cpu_field(tmp, v7m.ltpsize);
+    }
+    /* End TB, continuing to following insn */
+    gen_jmp_tb(s, s->base.pc_next, 1);
     return true;
 }
 
-- 
2.20.1

