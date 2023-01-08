Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1328248ejc;
        Sat, 7 Jan 2023 18:47:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvEq6j9EN7WptyRIq+cbWqlBHg5KEzO0a9rBTijzFCTD7TdHpNJaQbzhkeSozsD3c5w9Odh
X-Received: by 2002:ac8:7348:0:b0:3a6:89ac:caac with SMTP id q8-20020ac87348000000b003a689accaacmr77663898qtp.61.1673146053171;
        Sat, 07 Jan 2023 18:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673146053; cv=none;
        d=google.com; s=arc-20160816;
        b=uAUgbCvwbnBYrdpq1tV2eZVyODjufWsS3kzmpl7WXbnSYZDAPmgE2falojka3dF+0G
         p8MpP6+JWvJfYry1jmQEemSlxD1BIofhDfz3RLGDUheev2wyb4FIOaZevGf+lOlnBfZr
         q5PC1zlrj3pPCgsME760tqz20lmHnRAsf3z2DiK/t0VwUPvuA0WCyU0pkGpfLmCdBgQX
         /4mEsj4E+bFCAaSQqaBnwlqsdIibmDAV0XUn2AFUpc2RXS6YtXztImvMfyjkT+8+08Dn
         NSRL2VPsLjiitRvry52p+DpgOaPGEuc4/3ppTtQ8FbdZXVwTx/UiFzYUq8q7fwUcBYZr
         oW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Mhr3QIUQO1GxMkIggU7JbqoOmehoWj07MLx7q6K4qDk=;
        b=l3KDBt7Ys/UQebXb3ei/I2AFjFI0ewEDMM5UwYVZcabacVI2h/bADAqyBQzoGD3yb9
         lzFgPZ/BG0S+U+A0xYI2oBdy8ZUVy8A6KezmYsk+pKvCxzJBMorP9DVZdjfsYffu1iET
         veh+bzpvLu7bVuX8II/SlOZ7YNYgfl2oumWObVKbFtiC9iXXNSnKq4S1YS5B0MBSshOY
         W9q0trQTPC2TUWbpMx+beHqSpynOP6pmHiVbGyO9vDt13HDQanWrxXMOLiidKXGzF4Mu
         g36z8nO0X83cfmx9edtdHwygrVX2tCUnGakq/FdBga89bHdnN3jpoXGAjb76yfmQ1N5p
         v8sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hYrKynyZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w24-20020ac87198000000b003a3f04f2d32si2713294qto.668.2023.01.07.18.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:47:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hYrKynyZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pELal-0006v3-G3; Sat, 07 Jan 2023 21:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELab-0006hx-09
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:39:13 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZS-0004p7-Ap
 for qemu-arm@nongnu.org; Sat, 07 Jan 2023 21:39:10 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 z9-20020a17090a468900b00226b6e7aeeaso5837667pjf.1
 for <qemu-arm@nongnu.org>; Sat, 07 Jan 2023 18:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mhr3QIUQO1GxMkIggU7JbqoOmehoWj07MLx7q6K4qDk=;
 b=hYrKynyZZDUSofsJs+xXcMB7/0fMnugQQY67q1cmym7W3997wg5VycoQ2RkOmRpSZt
 QdSdaHQDlpuna7ZYoyiqCBVAfxxxttbloqn8SXWa9g8Q4BgJTRs5gmdyPwgbwLFtQesM
 uL5f2e49JZVqm3/o2RRsPLPyXWR0xKVL3uk1bk1vJFaxquAGmD36KprD3yZn/BkzLGU5
 DtwkqDeAdyMQOZDO7lwqhG1GahbRhVh6B0LZ44P2eRiDWtmVEHDAfBZj3qRTSwxY0GYC
 olI4A6VwTXVt/n4SXwwwHhFHZ882snHmHDJP38qXKstVeLZEzweh96+KYL5Igdb7wd83
 1a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mhr3QIUQO1GxMkIggU7JbqoOmehoWj07MLx7q6K4qDk=;
 b=yJaZDDNnyu1DoAs/vdVFhB+i8lQukCAWJRMvkac5cJfcgcnvhdwCGLV6/Hnr7sAl8i
 X1jdQ4P9KoGiBXVBFPCjymLosfRscs9QET23iyAUKOBL0d9cynrfC4oDEJ7T6bTyO2Fx
 ut6P+U5Y48ne4KPc7gBnTE78xaeggfxAqxF80y13XwEydJF16WE8Kb+g4OAEpWIeVfRj
 9ZwWLhsp8/otRmlCOCfUnnnhTxKgMAk9p6P3WHy1U30+fi5HqldlcV0v0BDxlMjNFOZ5
 HusysT4IyQRPkAfOeS6PTR6CadqhgYVkse3Zg7tPObENN2Dhg8GaKmR83p9NU7qjbIs8
 Bw3Q==
X-Gm-Message-State: AFqh2krSSdH5k7Dq6nfYjt10/uXFF6WbjFGlYcLGguTfeVblqItAUnTy
 Yq5HNrJCJULDp0xU0vBbSYa41g==
X-Received: by 2002:a17:903:2312:b0:192:8c7f:2654 with SMTP id
 d18-20020a170903231200b001928c7f2654mr53462869plh.0.1673145481048; 
 Sat, 07 Jan 2023 18:38:01 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:38:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 36/36] target/i386: Inline cmpxchg16b
Date: Sat,  7 Jan 2023 18:37:19 -0800
Message-Id: <20230108023719.2466341-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: 0XVYTOg8NzEJ

Use tcg_gen_atomic_cmpxchg_i128 for the atomic case,
and tcg_gen_qemu_ld/st_i128 otherwise.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h         |  4 ---
 target/i386/tcg/mem_helper.c | 69 ------------------------------------
 target/i386/tcg/translate.c  | 44 ++++++++++++++++++++---
 3 files changed, 39 insertions(+), 78 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 2df8049f91..e627a93107 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -66,10 +66,6 @@ DEF_HELPER_1(rsm, void, env)
 #endif /* !CONFIG_USER_ONLY */
 
 DEF_HELPER_2(into, void, env, int)
-#ifdef TARGET_X86_64
-DEF_HELPER_2(cmpxchg16b_unlocked, void, env, tl)
-DEF_HELPER_2(cmpxchg16b, void, env, tl)
-#endif
 DEF_HELPER_FLAGS_1(single_step, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_1(rechecking_single_step, void, env)
 DEF_HELPER_1(cpuid, void, env)
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index 814786bb87..3ef84e90d9 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -27,75 +27,6 @@
 #include "tcg/tcg.h"
 #include "helper-tcg.h"
 
-#ifdef TARGET_X86_64
-void helper_cmpxchg16b_unlocked(CPUX86State *env, target_ulong a0)
-{
-    uintptr_t ra = GETPC();
-    Int128 oldv, cmpv, newv;
-    uint64_t o0, o1;
-    int eflags;
-    bool success;
-
-    if ((a0 & 0xf) != 0) {
-        raise_exception_ra(env, EXCP0D_GPF, GETPC());
-    }
-    eflags = cpu_cc_compute_all(env, CC_OP);
-
-    cmpv = int128_make128(env->regs[R_EAX], env->regs[R_EDX]);
-    newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
-
-    o0 = cpu_ldq_data_ra(env, a0 + 0, ra);
-    o1 = cpu_ldq_data_ra(env, a0 + 8, ra);
-
-    oldv = int128_make128(o0, o1);
-    success = int128_eq(oldv, cmpv);
-    if (!success) {
-        newv = oldv;
-    }
-
-    cpu_stq_data_ra(env, a0 + 0, int128_getlo(newv), ra);
-    cpu_stq_data_ra(env, a0 + 8, int128_gethi(newv), ra);
-
-    if (success) {
-        eflags |= CC_Z;
-    } else {
-        env->regs[R_EAX] = int128_getlo(oldv);
-        env->regs[R_EDX] = int128_gethi(oldv);
-        eflags &= ~CC_Z;
-    }
-    CC_SRC = eflags;
-}
-
-void helper_cmpxchg16b(CPUX86State *env, target_ulong a0)
-{
-    uintptr_t ra = GETPC();
-
-    if ((a0 & 0xf) != 0) {
-        raise_exception_ra(env, EXCP0D_GPF, ra);
-    } else if (HAVE_CMPXCHG128) {
-        int eflags = cpu_cc_compute_all(env, CC_OP);
-
-        Int128 cmpv = int128_make128(env->regs[R_EAX], env->regs[R_EDX]);
-        Int128 newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
-
-        int mem_idx = cpu_mmu_index(env, false);
-        MemOpIdx oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
-        Int128 oldv = cpu_atomic_cmpxchgo_le_mmu(env, a0, cmpv, newv, oi, ra);
-
-        if (int128_eq(oldv, cmpv)) {
-            eflags |= CC_Z;
-        } else {
-            env->regs[R_EAX] = int128_getlo(oldv);
-            env->regs[R_EDX] = int128_gethi(oldv);
-            eflags &= ~CC_Z;
-        }
-        CC_SRC = eflags;
-    } else {
-        cpu_loop_exit_atomic(env_cpu(env), ra);
-    }
-}
-#endif
-
 void helper_boundw(CPUX86State *env, target_ulong a0, int v)
 {
     int low, high;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b542b084a6..9d9392b009 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3053,15 +3053,49 @@ static void gen_cmpxchg8b(DisasContext *s, CPUX86State *env, int modrm)
 #ifdef TARGET_X86_64
 static void gen_cmpxchg16b(DisasContext *s, CPUX86State *env, int modrm)
 {
+    MemOp mop = MO_TE | MO_128 | MO_ALIGN;
+    TCGv_i64 t0, t1;
+    TCGv_i128 cmp, val;
+
     gen_lea_modrm(env, s, modrm);
 
-    if ((s->prefix & PREFIX_LOCK) &&
-        (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-        gen_helper_cmpxchg16b(cpu_env, s->A0);
+    cmp = tcg_temp_new_i128();
+    val = tcg_temp_new_i128();
+    tcg_gen_concat_i64_i128(cmp, cpu_regs[R_EAX], cpu_regs[R_EDX]);
+    tcg_gen_concat_i64_i128(val, cpu_regs[R_EBX], cpu_regs[R_ECX]);
+
+    /* Only require atomic with LOCK; non-parallel handled in generator. */
+    if (s->prefix & PREFIX_LOCK) {
+        tcg_gen_atomic_cmpxchg_i128(val, s->A0, cmp, val, s->mem_index, mop);
     } else {
-        gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
+        tcg_gen_nonatomic_cmpxchg_i128(val, s->A0, cmp, val, s->mem_index, mop);
     }
-    set_cc_op(s, CC_OP_EFLAGS);
+
+    tcg_gen_extr_i128_i64(s->T0, s->T1, val);
+    tcg_temp_free_i128(cmp);
+    tcg_temp_free_i128(val);
+
+    /* Determine success after the fact. */
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    tcg_gen_xor_i64(t0, s->T0, cpu_regs[R_EAX]);
+    tcg_gen_xor_i64(t1, s->T1, cpu_regs[R_EDX]);
+    tcg_gen_or_i64(t0, t0, t1);
+    tcg_temp_free_i64(t1);
+
+    /* Update Z. */
+    gen_compute_eflags(s);
+    tcg_gen_setcondi_i64(TCG_COND_EQ, t0, t0, 0);
+    tcg_gen_deposit_tl(cpu_cc_src, cpu_cc_src, t0, ctz32(CC_Z), 1);
+    tcg_temp_free_i64(t0);
+
+    /*
+     * Extract the result values for the register pair.  We may do this
+     * unconditionally, because on success (Z=1), the old value matches
+     * the previous value in RDX:RAX.
+     */
+    tcg_gen_mov_i64(cpu_regs[R_EAX], s->T0);
+    tcg_gen_mov_i64(cpu_regs[R_EDX], s->T1);
 }
 #endif
 
-- 
2.34.1

