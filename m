Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1366688ejx;
        Fri, 11 Nov 2022 20:26:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6IBCVH9jbK2NtSXjE50THZrHRVICn47/+oT3JyD/oiEYyMeZA6sQHmu8JqQV0D6hradhYe
X-Received: by 2002:a05:622a:598e:b0:3a5:42f9:dddc with SMTP id gb14-20020a05622a598e00b003a542f9dddcmr4323340qtb.237.1668227216258;
        Fri, 11 Nov 2022 20:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668227216; cv=none;
        d=google.com; s=arc-20160816;
        b=DQ4KUZVBes9kXu71K+iEFdQLFdGeodNyq6srDCwQWrwxQHC7M3HPs7CZVBlRhULJBz
         sEX/4hIKo+0uUQ63U9QAbu5EEqWNiCWnH+QfrCMXsipxHKo8CMF4IyjdOoZEimpppIzA
         kqx1V0rjeDETi6nd98IYnaZVoYO6rC+om7nxU6Ks15aTVEbVXJEAwH4vcHVHI5QPMnxf
         /NYl/yivq7e5k8UKnxYLtmteEgSkaGQ1oshHkzXC6RZUVuD7p4bIL3Oj0BejIyLHXPvv
         Ak7bifAVVbzI8shy4uyprCfx6tW+KB8Z5AGIZW1VyFxrZ99gUCzkk43akYYIcpBRYKco
         ZrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zOuzdLAJ+q7/0hx4wIJRj3B5882zBkuY1Acmu3xa8EE=;
        b=UfInTCmq9/6Kq+spyf3xPtNrOXrvdxCmJxV42n2Up5/S+ajQPHtYTIioO3X/x6r4xf
         12auBBd/8yWoNVOzW46+kMZtmYWW64Wgeq9QRIQjNJX2XvxqYSM68YZizknj+2uGBJEr
         RAaphUF4q+M2zCDFUHBBlOv6HzahIoevzycgsYQ6py2k8eW+JJ5SsvIav8y2fJWnaX54
         JTJusQOrlkrd87DlPL9vCjB+iyuABI68l9fBlJXrmiSDTTbDg6e9t8Dl3Asm+JQprzWg
         GyKfnfWwGLLKdTHArqe9oHWz53CpxSQT99HCWmgVpiryNaqmlu8sPsZcThXkEiEHG1qM
         vQtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CKH7WAOh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a05620a090a00b006e9779c2128si1983828qkv.430.2022.11.11.20.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Nov 2022 20:26:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CKH7WAOh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oti5q-00050R-Ra; Fri, 11 Nov 2022 23:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oti5n-0004zJ-W0
 for qemu-arm@nongnu.org; Fri, 11 Nov 2022 23:26:08 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oti5m-000813-0W
 for qemu-arm@nongnu.org; Fri, 11 Nov 2022 23:26:07 -0500
Received: by mail-pf1-x42b.google.com with SMTP id i3so6459237pfc.11
 for <qemu-arm@nongnu.org>; Fri, 11 Nov 2022 20:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zOuzdLAJ+q7/0hx4wIJRj3B5882zBkuY1Acmu3xa8EE=;
 b=CKH7WAOhq85Iv6EgZ47uAlNBcLrN8ikgwfPoOpA5ii6n5OmY9An53ih0b8/Ji3hrWv
 R6PjLOtc4NAZPwQYb27Vdv16qrQ46Tn4TLaGJoY6EI9kDf18RAqvcOIg0xnTwR9g4+0e
 6fwmPMRTBC11+zTvSfgH+slW9gQjJlPGDkMCazyc6H/dfVS1zHDw62OvgcahNaGmuxPb
 8oR4G33ZWzoC0znR1vuENFpQNbJhfZ4tHm7fOqXw4AHtYWM7HSEK/zq5w4lpBiaQpnD2
 VHLRL7AIjiluOGs3RCc2UVkBs5Q6Q77niT78tWn5PQYZI+1ATbg1L1BR63EEiMnotoPV
 AbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zOuzdLAJ+q7/0hx4wIJRj3B5882zBkuY1Acmu3xa8EE=;
 b=uTFEcJdia4GGY6tYtBhC9vAYEE7uECtSdBdhD6qJA+S9z+GOyyxfWe8RL4b3YDRlf3
 Q0j67dJyy1FgnuYRDaoVdeDbE9PjHw6poPgQaXxdycXU5inln0m0iZxhC8/D6Gaewrfq
 62MsBi+QFyO+/KzheXf66CPNMXuwjTdQ4cjgUKP+rJ9T67D0nuBFxKsgQj87AvdvzFwd
 aw8qZ4CTOeUx9/dptzHSYRbZm2V5JLtnQ5D9x6AumuOivruiQ+80Zdn8zuTSBM1fhJrr
 bIrCpE2QZay3PIhiIU5dOagKAd/QkjMLiSlA1Sz4hBMgXmKSfi6A4anpgxJUZApXbimN
 fA8w==
X-Gm-Message-State: ANoB5pm+YGwAXKMiqyHsjGFrlyUGWtV4l5BCxpPUzixwFUJjvHy/umar
 FxHfS4yUE/Wer3xEXeXYWz71BfDUSpKukdwK
X-Received: by 2002:a63:1b01:0:b0:470:580a:c8a with SMTP id
 b1-20020a631b01000000b00470580a0c8amr3929734pgb.505.1668227163965; 
 Fri, 11 Nov 2022 20:26:03 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170902784600b001869ba04c83sm2522003pln.245.2022.11.11.20.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 20:26:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-8.0 1/2] target/arm: Use tcg_gen_atomic_cmpxchg_i128 for
 STXP
Date: Sat, 12 Nov 2022 14:25:54 +1000
Message-Id: <20221112042555.2622152-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112042555.2622152-1-richard.henderson@linaro.org>
References: <20221112042555.2622152-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Sd9jBpKvwul4

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.h    |   6 ---
 target/arm/helper-a64.c    | 104 -------------------------------------
 target/arm/translate-a64.c |  60 ++++++++++++---------
 3 files changed, 35 insertions(+), 135 deletions(-)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 7b706571bb..94065d1917 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -50,12 +50,6 @@ DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
 DEF_HELPER_FLAGS_2(fcvtx_f64_to_f32, TCG_CALL_NO_RWG, f32, f64, env)
 DEF_HELPER_FLAGS_3(crc32_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
 DEF_HELPER_FLAGS_3(crc32c_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_le, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_le_parallel, TCG_CALL_NO_WG,
-                   i64, env, i64, i64, i64)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_be, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
-DEF_HELPER_FLAGS_4(paired_cmpxchg64_be_parallel, TCG_CALL_NO_WG,
-                   i64, env, i64, i64, i64)
 DEF_HELPER_5(casp_le_parallel, void, env, i32, i64, i64, i64)
 DEF_HELPER_5(casp_be_parallel, void, env, i32, i64, i64, i64)
 DEF_HELPER_FLAGS_3(advsimd_maxh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 77a8502b6b..7dbdb2c233 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -505,110 +505,6 @@ uint64_t HELPER(crc32c_64)(uint64_t acc, uint64_t val, uint32_t bytes)
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
 
-uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env, uint64_t addr,
-                                     uint64_t new_lo, uint64_t new_hi)
-{
-    Int128 cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
-    Int128 newv = int128_make128(new_lo, new_hi);
-    Int128 oldv;
-    uintptr_t ra = GETPC();
-    uint64_t o0, o1;
-    bool success;
-    int mem_idx = cpu_mmu_index(env, false);
-    MemOpIdx oi0 = make_memop_idx(MO_LEUQ | MO_ALIGN_16, mem_idx);
-    MemOpIdx oi1 = make_memop_idx(MO_LEUQ, mem_idx);
-
-    o0 = cpu_ldq_le_mmu(env, addr + 0, oi0, ra);
-    o1 = cpu_ldq_le_mmu(env, addr + 8, oi1, ra);
-    oldv = int128_make128(o0, o1);
-
-    success = int128_eq(oldv, cmpv);
-    if (success) {
-        cpu_stq_le_mmu(env, addr + 0, int128_getlo(newv), oi1, ra);
-        cpu_stq_le_mmu(env, addr + 8, int128_gethi(newv), oi1, ra);
-    }
-
-    return !success;
-}
-
-uint64_t HELPER(paired_cmpxchg64_le_parallel)(CPUARMState *env, uint64_t addr,
-                                              uint64_t new_lo, uint64_t new_hi)
-{
-    Int128 oldv, cmpv, newv;
-    uintptr_t ra = GETPC();
-    bool success;
-    int mem_idx;
-    MemOpIdx oi;
-
-    assert(HAVE_CMPXCHG128);
-
-    mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_LE | MO_128 | MO_ALIGN, mem_idx);
-
-    cmpv = int128_make128(env->exclusive_val, env->exclusive_high);
-    newv = int128_make128(new_lo, new_hi);
-    oldv = cpu_atomic_cmpxchgo_le_mmu(env, addr, cmpv, newv, oi, ra);
-
-    success = int128_eq(oldv, cmpv);
-    return !success;
-}
-
-uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env, uint64_t addr,
-                                     uint64_t new_lo, uint64_t new_hi)
-{
-    /*
-     * High and low need to be switched here because this is not actually a
-     * 128bit store but two doublewords stored consecutively
-     */
-    Int128 cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
-    Int128 newv = int128_make128(new_hi, new_lo);
-    Int128 oldv;
-    uintptr_t ra = GETPC();
-    uint64_t o0, o1;
-    bool success;
-    int mem_idx = cpu_mmu_index(env, false);
-    MemOpIdx oi0 = make_memop_idx(MO_BEUQ | MO_ALIGN_16, mem_idx);
-    MemOpIdx oi1 = make_memop_idx(MO_BEUQ, mem_idx);
-
-    o1 = cpu_ldq_be_mmu(env, addr + 0, oi0, ra);
-    o0 = cpu_ldq_be_mmu(env, addr + 8, oi1, ra);
-    oldv = int128_make128(o0, o1);
-
-    success = int128_eq(oldv, cmpv);
-    if (success) {
-        cpu_stq_be_mmu(env, addr + 0, int128_gethi(newv), oi1, ra);
-        cpu_stq_be_mmu(env, addr + 8, int128_getlo(newv), oi1, ra);
-    }
-
-    return !success;
-}
-
-uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
-                                              uint64_t new_lo, uint64_t new_hi)
-{
-    Int128 oldv, cmpv, newv;
-    uintptr_t ra = GETPC();
-    bool success;
-    int mem_idx;
-    MemOpIdx oi;
-
-    assert(HAVE_CMPXCHG128);
-
-    mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_BE | MO_128 | MO_ALIGN, mem_idx);
-
-    /*
-     * High and low need to be switched here because this is not actually a
-     * 128bit store but two doublewords stored consecutively
-     */
-    cmpv = int128_make128(env->exclusive_high, env->exclusive_val);
-    newv = int128_make128(new_hi, new_lo);
-    oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
-
-    success = int128_eq(oldv, cmpv);
-    return !success;
-}
-
 /* Writes back the old data into Rs.  */
 void HELPER(casp_le_parallel)(CPUARMState *env, uint32_t rs, uint64_t addr,
                               uint64_t new_lo, uint64_t new_hi)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2ee171f249..dffd7ee737 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2580,32 +2580,42 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
                                        get_mem_index(s),
                                        MO_64 | MO_ALIGN | s->be_data);
             tcg_gen_setcond_i64(TCG_COND_NE, tmp, tmp, cpu_exclusive_val);
-        } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
-            if (!HAVE_CMPXCHG128) {
-                gen_helper_exit_atomic(cpu_env);
-                /*
-                 * Produce a result so we have a well-formed opcode
-                 * stream when the following (dead) code uses 'tmp'.
-                 * TCG will remove the dead ops for us.
-                 */
-                tcg_gen_movi_i64(tmp, 0);
-            } else if (s->be_data == MO_LE) {
-                gen_helper_paired_cmpxchg64_le_parallel(tmp, cpu_env,
-                                                        cpu_exclusive_addr,
-                                                        cpu_reg(s, rt),
-                                                        cpu_reg(s, rt2));
-            } else {
-                gen_helper_paired_cmpxchg64_be_parallel(tmp, cpu_env,
-                                                        cpu_exclusive_addr,
-                                                        cpu_reg(s, rt),
-                                                        cpu_reg(s, rt2));
-            }
-        } else if (s->be_data == MO_LE) {
-            gen_helper_paired_cmpxchg64_le(tmp, cpu_env, cpu_exclusive_addr,
-                                           cpu_reg(s, rt), cpu_reg(s, rt2));
         } else {
-            gen_helper_paired_cmpxchg64_be(tmp, cpu_env, cpu_exclusive_addr,
-                                           cpu_reg(s, rt), cpu_reg(s, rt2));
+            TCGv_i128 t16 = tcg_temp_new_i128();
+            TCGv_i128 c16 = tcg_temp_new_i128();
+            TCGv_i64 a, b;
+
+            if (s->be_data == MO_LE) {
+                tcg_gen_concat_i64_i128(t16, cpu_reg(s, rt), cpu_reg(s, rt2));
+                tcg_gen_concat_i64_i128(c16, cpu_exclusive_val,
+                                        cpu_exclusive_high);
+            } else {
+                tcg_gen_concat_i64_i128(t16, cpu_reg(s, rt2), cpu_reg(s, rt));
+                tcg_gen_concat_i64_i128(c16, cpu_exclusive_high,
+                                        cpu_exclusive_val);
+            }
+
+            tcg_gen_atomic_cmpxchg_i128(t16, cpu_exclusive_addr, c16, t16,
+                                        get_mem_index(s),
+                                        MO_128 | MO_ALIGN | s->be_data);
+            tcg_temp_free_i128(c16);
+
+            a = tcg_temp_new_i64();
+            b = tcg_temp_new_i64();
+            if (s->be_data == MO_LE) {
+                tcg_gen_extr_i128_i64(a, b, t16);
+            } else {
+                tcg_gen_extr_i128_i64(b, a, t16);
+            }
+
+            tcg_gen_xor_i64(a, a, cpu_exclusive_val);
+            tcg_gen_xor_i64(b, b, cpu_exclusive_high);
+            tcg_gen_or_i64(tmp, a, b);
+            tcg_temp_free_i64(a);
+            tcg_temp_free_i64(b);
+            tcg_temp_free_i128(t16);
+
+            tcg_gen_setcondi_i64(TCG_COND_NE, tmp, tmp, 0);
         }
     } else {
         tcg_gen_atomic_cmpxchg_i64(tmp, cpu_exclusive_addr, cpu_exclusive_val,
-- 
2.34.1

