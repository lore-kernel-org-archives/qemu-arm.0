Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276579ejb;
        Sat, 20 May 2023 09:29:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4GQE9vpMleNZvN8I0t5EwIINRhNSGpnMzRRoGmQLEbWHfSL8Mv7rCR23khC3epjnExzJV4
X-Received: by 2002:a05:622a:55:b0:3f6:a1c7:bfe9 with SMTP id y21-20020a05622a005500b003f6a1c7bfe9mr3127431qtw.15.1684600144180;
        Sat, 20 May 2023 09:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600144; cv=none;
        d=google.com; s=arc-20160816;
        b=gP9QYFictPys4nJWhdEhs5/aseAdqfQfX5w92FWbqNGx+HdshrIKwveABZLbNNxf/4
         7dVVnsKCRqX/xVI2t6r27Z2Ad4Z/iM48qdSfdZARKEhxMmxdk8dRYvs3AmoJAHZbqrGC
         wEUIc6IZ6w1tnhxKgpusqavFrZRHVHHWipw1jEtCu9AxKRPfAl7bMxkcHr5Nfhd2nnik
         GK7EtnyX6CCL9qsZIXnH9mzzy8aVLZ/gVS2pszpWGXmSDthVVjhNX/avSl3FL3jBjMRx
         V9r3R16RXGjOXyjOu3SSuDj1noVLSf1KR1IWoW8vU2DVm9QHwX5D0gHWJBoNzfwMCdpR
         4HhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LDPGtChIiM90g/ZXe1/z5yfO/noMZETMdebtBSg+Cq0=;
        b=B841cKagG8YZf1KLPn3ssPCbaABrTlrDOVbfaVvP+igo/jAWf+wylDi49UCt6baWdM
         qeG0i0JvhCew/7iP8240CV8049lSjN9fSr4qloWaovC6u6OPQAUOD2SqnvZUbm45G81p
         gT4xQdxX2VdmwLo0Ic8q68yrPWN7gpzQxQ1DbGYA3Rgoawu6sTuwmp3QlgGtJTOAM0K3
         i6rZT9RY6Cb3wRMvMr3sAjXdQPWhKcJL1WT2wkoINakeglqT1RNII8fYoYCynSMC9VVp
         cEKYYJPqF6CG5Xk/mk5ksv2USF3hu6fj38yKrz/93OUWErYIgaNCALdDxhAlEbcJSIFM
         XurA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jdehzckn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10-20020a05622a028a00b003f0ae4921c6si1328039qtw.108.2023.05.20.09.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jdehzckn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0PQH-0003kq-Ci; Sat, 20 May 2023 12:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQA-0003fX-I3
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:06 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PQ5-00039X-Vi
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:27:06 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1ae875bf125so10482655ad.1
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 09:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684600018; x=1687192018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LDPGtChIiM90g/ZXe1/z5yfO/noMZETMdebtBSg+Cq0=;
 b=jdehzcknbhahn3YrpWtWGvjVp+1YD5TSwOTtUpns1ZN888QVuPolQfP6mxrxJi6VeR
 wONd70ntXWkW0l3xzzPD1KAJjM+e8xhZLBuHHBNl8EjziMWqVlgI8eeZDVRsPkzd3mEA
 5fm8J/w0qxduqS+Tbn27laID0m9lEPmsrIgMFCXV/4H6cGiwy6q5D/Iaoo8gmMIMKJdF
 D1D2nLvwAET9HJWCqiONrLsyGSig9jcuad2jm2NMahqoi7+LtCMy9OPm3oAsDw+vrF8Q
 42YKisUPxW0058wu02OzJxSgxIjLFFj9HNyoQmIUaPUcaQWlS/fQ6/Qp+d9mJii686GK
 ynKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684600018; x=1687192018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LDPGtChIiM90g/ZXe1/z5yfO/noMZETMdebtBSg+Cq0=;
 b=S+D06HjW9S+aF0aX8t0rvSXnMnJ+nS56kgWTIUe4FUgqEPy11JA51ILPY+HTzChBaw
 KamH2zARvZE7kYC0EkeOtgpMx0kARxh7n5d1Bxy1V/GtFp6Q/raxHVw4y6VlxGaomEV7
 cd93vHGfnBKKcW+szQnWLZAg7nt+oko8dhk5xyWrhZHR7A4LDdUWQlXvesU4jalD3x5c
 pOJcAYcCGust/P5jUVEI1LZiLaiyx0tDLfd7Qxl/Ocv4RBH5uR1MkOUbicy6dXabNb5X
 amVunclvQk3OE0VsBpJv9Ogh1BPrOuUstJHakLUscnfelB5Il525eQHXwwG98VmW+KHq
 uvqQ==
X-Gm-Message-State: AC+VfDxMIymiV7JuIrnjeBe+d7FcheMm71XcsN/TmDdL/K+s9+2YI8tJ
 2CNsLv3xlUz8E8/N+7E9yztGQA==
X-Received: by 2002:a17:902:c20c:b0:1ab:d2c:a1a6 with SMTP id
 12-20020a170902c20c00b001ab0d2ca1a6mr5793978pll.69.1684600018265; 
 Sat, 20 May 2023 09:26:58 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:26:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 14/27] target/ppc: Use tcg_gen_qemu_{ld, st}_i128 for LQARX, LQ,
 STQ
Date: Sat, 20 May 2023 09:26:21 -0700
Message-Id: <20230520162634.3991009-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: BivUbs4hwKAB

No need to roll our own, as this is now provided by tcg.
This was the last use of retxl, so remove that too.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
---
 target/ppc/cpu.h                           |  1 -
 target/ppc/helper.h                        |  9 ----
 target/ppc/mem_helper.c                    | 48 --------------------
 target/ppc/translate.c                     | 34 ++-------------
 target/ppc/translate/fixedpoint-impl.c.inc | 51 +++-------------------
 5 files changed, 11 insertions(+), 132 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 1c02596d9f..0f9f2e1a0c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1124,7 +1124,6 @@ struct CPUArchState {
                            /* used to speed-up TLB assist handlers */
 
     target_ulong nip;      /* next instruction pointer */
-    uint64_t retxh;        /* high part of 128-bit helper return */
 
     /* when a memory exception occurs, the access type is stored here */
     int access_type;
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 0beaca5c7a..38efbc351c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -810,12 +810,3 @@ DEF_HELPER_4(DSCLIQ, void, env, fprp, fprp, i32)
 
 DEF_HELPER_1(tbegin, void, env)
 DEF_HELPER_FLAGS_1(fixup_thrm, TCG_CALL_NO_RWG, void, env)
-
-#ifdef TARGET_PPC64
-DEF_HELPER_FLAGS_3(lq_le_parallel, TCG_CALL_NO_WG, i64, env, tl, i32)
-DEF_HELPER_FLAGS_3(lq_be_parallel, TCG_CALL_NO_WG, i64, env, tl, i32)
-DEF_HELPER_FLAGS_5(stq_le_parallel, TCG_CALL_NO_WG,
-                   void, env, tl, i64, i64, i32)
-DEF_HELPER_FLAGS_5(stq_be_parallel, TCG_CALL_NO_WG,
-                   void, env, tl, i64, i64, i32)
-#endif
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 1578887a8f..46eae65819 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -367,54 +367,6 @@ target_ulong helper_lscbx(CPUPPCState *env, target_ulong addr, uint32_t reg,
     return i;
 }
 
-#ifdef TARGET_PPC64
-uint64_t helper_lq_le_parallel(CPUPPCState *env, target_ulong addr,
-                               uint32_t opidx)
-{
-    Int128 ret;
-
-    /* We will have raised EXCP_ATOMIC from the translator.  */
-    assert(HAVE_ATOMIC128);
-    ret = cpu_atomic_ldo_le_mmu(env, addr, opidx, GETPC());
-    env->retxh = int128_gethi(ret);
-    return int128_getlo(ret);
-}
-
-uint64_t helper_lq_be_parallel(CPUPPCState *env, target_ulong addr,
-                               uint32_t opidx)
-{
-    Int128 ret;
-
-    /* We will have raised EXCP_ATOMIC from the translator.  */
-    assert(HAVE_ATOMIC128);
-    ret = cpu_atomic_ldo_be_mmu(env, addr, opidx, GETPC());
-    env->retxh = int128_gethi(ret);
-    return int128_getlo(ret);
-}
-
-void helper_stq_le_parallel(CPUPPCState *env, target_ulong addr,
-                            uint64_t lo, uint64_t hi, uint32_t opidx)
-{
-    Int128 val;
-
-    /* We will have raised EXCP_ATOMIC from the translator.  */
-    assert(HAVE_ATOMIC128);
-    val = int128_make128(lo, hi);
-    cpu_atomic_sto_le_mmu(env, addr, val, opidx, GETPC());
-}
-
-void helper_stq_be_parallel(CPUPPCState *env, target_ulong addr,
-                            uint64_t lo, uint64_t hi, uint32_t opidx)
-{
-    Int128 val;
-
-    /* We will have raised EXCP_ATOMIC from the translator.  */
-    assert(HAVE_ATOMIC128);
-    val = int128_make128(lo, hi);
-    cpu_atomic_sto_be_mmu(env, addr, val, opidx, GETPC());
-}
-#endif
-
 /*****************************************************************************/
 /* Altivec extension helpers */
 #if HOST_BIG_ENDIAN
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f603f1a939..1720570b9b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3757,6 +3757,7 @@ static void gen_lqarx(DisasContext *ctx)
 {
     int rd = rD(ctx->opcode);
     TCGv EA, hi, lo;
+    TCGv_i128 t16;
 
     if (unlikely((rd & 1) || (rd == rA(ctx->opcode)) ||
                  (rd == rB(ctx->opcode)))) {
@@ -3772,36 +3773,9 @@ static void gen_lqarx(DisasContext *ctx)
     lo = cpu_gpr[rd + 1];
     hi = cpu_gpr[rd];
 
-    if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
-        if (HAVE_ATOMIC128) {
-            TCGv_i32 oi = tcg_temp_new_i32();
-            if (ctx->le_mode) {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128 | MO_ALIGN,
-                                                    ctx->mem_idx));
-                gen_helper_lq_le_parallel(lo, cpu_env, EA, oi);
-            } else {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128 | MO_ALIGN,
-                                                    ctx->mem_idx));
-                gen_helper_lq_be_parallel(lo, cpu_env, EA, oi);
-            }
-            tcg_gen_ld_i64(hi, cpu_env, offsetof(CPUPPCState, retxh));
-        } else {
-            /* Restart with exclusive lock.  */
-            gen_helper_exit_atomic(cpu_env);
-            ctx->base.is_jmp = DISAS_NORETURN;
-            return;
-        }
-    } else if (ctx->le_mode) {
-        tcg_gen_qemu_ld_i64(lo, EA, ctx->mem_idx, MO_LEUQ | MO_ALIGN_16);
-        tcg_gen_mov_tl(cpu_reserve, EA);
-        gen_addr_add(ctx, EA, EA, 8);
-        tcg_gen_qemu_ld_i64(hi, EA, ctx->mem_idx, MO_LEUQ);
-    } else {
-        tcg_gen_qemu_ld_i64(hi, EA, ctx->mem_idx, MO_BEUQ | MO_ALIGN_16);
-        tcg_gen_mov_tl(cpu_reserve, EA);
-        gen_addr_add(ctx, EA, EA, 8);
-        tcg_gen_qemu_ld_i64(lo, EA, ctx->mem_idx, MO_BEUQ);
-    }
+    t16 = tcg_temp_new_i128();
+    tcg_gen_qemu_ld_i128(t16, EA, ctx->mem_idx, DEF_MEMOP(MO_128 | MO_ALIGN));
+    tcg_gen_extr_i128_i64(lo, hi, t16);
 
     tcg_gen_st_tl(hi, cpu_env, offsetof(CPUPPCState, reserve_val));
     tcg_gen_st_tl(lo, cpu_env, offsetof(CPUPPCState, reserve_val2));
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 02d86b77a8..f47f1a50e8 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -72,7 +72,7 @@ static bool do_ldst_quad(DisasContext *ctx, arg_D *a, bool store, bool prefixed)
 #if defined(TARGET_PPC64)
     TCGv ea;
     TCGv_i64 low_addr_gpr, high_addr_gpr;
-    MemOp mop;
+    TCGv_i128 t16;
 
     REQUIRE_INSNS_FLAGS(ctx, 64BX);
 
@@ -101,51 +101,14 @@ static bool do_ldst_quad(DisasContext *ctx, arg_D *a, bool store, bool prefixed)
         low_addr_gpr = cpu_gpr[a->rt + 1];
         high_addr_gpr = cpu_gpr[a->rt];
     }
+    t16 = tcg_temp_new_i128();
 
-    if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
-        if (HAVE_ATOMIC128) {
-            mop = DEF_MEMOP(MO_128);
-            TCGv_i32 oi = tcg_constant_i32(make_memop_idx(mop, ctx->mem_idx));
-            if (store) {
-                if (ctx->le_mode) {
-                    gen_helper_stq_le_parallel(cpu_env, ea, low_addr_gpr,
-                                               high_addr_gpr, oi);
-                } else {
-                    gen_helper_stq_be_parallel(cpu_env, ea, high_addr_gpr,
-                                               low_addr_gpr, oi);
-
-                }
-            } else {
-                if (ctx->le_mode) {
-                    gen_helper_lq_le_parallel(low_addr_gpr, cpu_env, ea, oi);
-                    tcg_gen_ld_i64(high_addr_gpr, cpu_env,
-                                   offsetof(CPUPPCState, retxh));
-                } else {
-                    gen_helper_lq_be_parallel(high_addr_gpr, cpu_env, ea, oi);
-                    tcg_gen_ld_i64(low_addr_gpr, cpu_env,
-                                   offsetof(CPUPPCState, retxh));
-                }
-            }
-        } else {
-            /* Restart with exclusive lock.  */
-            gen_helper_exit_atomic(cpu_env);
-            ctx->base.is_jmp = DISAS_NORETURN;
-        }
+    if (store) {
+        tcg_gen_concat_i64_i128(t16, low_addr_gpr, high_addr_gpr);
+        tcg_gen_qemu_st_i128(t16, ea, ctx->mem_idx, DEF_MEMOP(MO_128));
     } else {
-        mop = DEF_MEMOP(MO_UQ);
-        if (store) {
-            tcg_gen_qemu_st_i64(low_addr_gpr, ea, ctx->mem_idx, mop);
-        } else {
-            tcg_gen_qemu_ld_i64(low_addr_gpr, ea, ctx->mem_idx, mop);
-        }
-
-        gen_addr_add(ctx, ea, ea, 8);
-
-        if (store) {
-            tcg_gen_qemu_st_i64(high_addr_gpr, ea, ctx->mem_idx, mop);
-        } else {
-            tcg_gen_qemu_ld_i64(high_addr_gpr, ea, ctx->mem_idx, mop);
-        }
+        tcg_gen_qemu_ld_i128(t16, ea, ctx->mem_idx, DEF_MEMOP(MO_128));
+        tcg_gen_extr_i128_i64(low_addr_gpr, high_addr_gpr, t16);
     }
 #else
     qemu_build_not_reached();
-- 
2.34.1

