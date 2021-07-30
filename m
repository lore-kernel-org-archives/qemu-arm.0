Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp323920lff;
        Fri, 30 Jul 2021 08:17:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywqVQECDmN0mtFD6+DnU3kNjVjl1BcMr+/iqqmVbyZACBODjFDhwPxfhN/3N8Q28HKpWwn
X-Received: by 2002:a67:f854:: with SMTP id b20mr2261791vsp.32.1627658224927;
        Fri, 30 Jul 2021 08:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627658224; cv=none;
        d=google.com; s=arc-20160816;
        b=IiK1iJwz4h0Aa16HBTDC8cDem/EV4iSXWuO/Efs0hgvyX1WrzOaDsk4tt2WAg5VF0z
         Acfu+WH1GkL/Lv1pvbw60b9XYw13VWQfV1uk2qVC54omaImkgRMEudyk0hJ6qVmqZGM1
         0vNwBLilFEfGyhQiR+LRLjgax71iOCBYb4UOtVIB4cZ3F6AW4t3pX2wMs8LJRslGzjVS
         Isdsve2GR4r2bedwzUpaBGtMSNhPbrUAj4uTYHJP/wwn8rtw//i/qF6GcX7BKVXJ7BLX
         JIXzjU3K8IIXgkRy71ApaiLhY2bVPtPFylUnOdrwhr0gwOd/StGiNOWVPhJZEea1q65I
         EBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Y4T9Q0phKt1q1Ay7Q+sG5xGKY/jcAnzqEkcBv03G2Xk=;
        b=SF1xNWX+V7nXbiPOQpL6aXBR1OqS5kKEjXV0fpvR1VMnu812kEUb2XvcKgN3TtgmSo
         1Vcdyd03FQLxs9/A2Km76pIgc68ahzUWLAeYNz1V8EyZf/K/KPU3+Jd3fiZ7KFyXdCfU
         HPs/70015oeqtFD7s2D7kmw8ppsClQ4XxtEoU+E+VnNIK0V4ZmEs7Q7EP8pgdNACRA8y
         dVfdGmOtQ0KHIJzmeWp+douJ8GFfodRVlDkn4bEqUbEZXdwp2ayA5tTrTGs2B59QpVFd
         J7nyIcS+F88JdTd3EcYHgO3bxO28RQIYzGctgOPEsowfCYWa2W1P/dwiuqwzfHYNqLLJ
         aLrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c0Dg/rwB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si831902vsg.161.2021.07.30.08.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 08:17:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c0Dg/rwB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9UG0-0005UX-7r
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 11:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFf-0004kN-9s
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 11:16:43 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9UFd-0008TL-Cu
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 11:16:43 -0400
Received: by mail-wr1-x436.google.com with SMTP id l18so11751590wrv.5
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Y4T9Q0phKt1q1Ay7Q+sG5xGKY/jcAnzqEkcBv03G2Xk=;
 b=c0Dg/rwBHtooBSiVbt8U7eThLZW94LxK2rYijWtW+QuMT9ILkPTDhJN4lTZqjSI3v/
 JnW/HLQ51vSKN9TQg05RHlF1fEg0l4ubICEAhBo8Nyt54gQdPXbfl7vdFjOhDOqiH4Nz
 Hx17qTQBFhwigGvFoV3tIn8CwoFZEjXa+I0gngOCZGxhF/f1nBVLvn/dMaUjDW7kyGQw
 yPDRb0l67D6DqD9zfGAPrbBmM2aVSwC4Y5kG5utwD25yCM5O7YoJmK2Vq+9bfk/qKuDu
 44QAHHgA6eA4eNUYp+CFVxrAD/eijTcVHmmEiO8SoaXN3lrmTWRiOd1s9+uL/QdwSXvF
 EuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y4T9Q0phKt1q1Ay7Q+sG5xGKY/jcAnzqEkcBv03G2Xk=;
 b=cs/uLnSBzZqljvhGAmFEZSUykpdztILMXzPE5VDFE7w9b911e0tryeDpDZK9rBSWoW
 yHUSth2c/g4iaBQbMFIor8Q6JrP7nIObo3VDYYGYNbOS8bTRJFF24qDuL7gGPW7tjAV2
 pFkqssqCC3dJ4lgOQ2U6MG84BVQLsykbSVTYG87RTpyHKyT1l+g1XLqqhChDpda29I/Q
 NxT0KGaN3OR8oyaibW6WXrefAgrHqi5kvgk5gfqEtZ6yMH157HNPJcFA2h+iayarbymD
 KTm6E3ZjSJ6QJjjC1tIL7x2aTttajgRm6u3VQDG8U5G7RWHMwR/gX1a1uvZw/BHY6ojx
 YYSA==
X-Gm-Message-State: AOAM5328zMePmMoedfDYnaG0Q7PdANJKx8DK0cnCppjh8IMFeAiCUGL3
 RAqEf38ojdWqbpeARMH0DagaPbprHCCKPg==
X-Received: by 2002:a5d:4410:: with SMTP id z16mr3581312wrq.173.1627658200076; 
 Fri, 30 Jul 2021 08:16:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h12sm2020292wrm.62.2021.07.30.08.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 08:16:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: Implement M-profile trapping on division by
 zero
Date: Fri, 30 Jul 2021 16:16:36 +0100
Message-Id: <20210730151636.17254-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210730151636.17254-1-peter.maydell@linaro.org>
References: <20210730151636.17254-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ml9qCNtbXu4a

Unlike A-profile, for M-profile the UDIV and SDIV insns can be
configured to raise an exception on division by zero, using the CCR
DIV_0_TRP bit.

Implement support for setting this bit by making the helper functions
raise the appropriate exception.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  1 +
 target/arm/helper.h    |  4 ++--
 target/arm/helper.c    | 19 +++++++++++++++++--
 target/arm/m_helper.c  |  4 ++++
 target/arm/translate.c |  4 ++--
 5 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9f0a5f84d50..5cf8996ae3c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -54,6 +54,7 @@
 #define EXCP_LAZYFP         20   /* v7M fault during lazy FP stacking */
 #define EXCP_LSERR          21   /* v8M LSERR SecureFault */
 #define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault */
+#define EXCP_DIVBYZERO      23   /* v7M DIVBYZERO UsageFault */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 248569b0cd8..aee8f0019b4 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -6,8 +6,8 @@ DEF_HELPER_3(add_saturate, i32, env, i32, i32)
 DEF_HELPER_3(sub_saturate, i32, env, i32, i32)
 DEF_HELPER_3(add_usaturate, i32, env, i32, i32)
 DEF_HELPER_3(sub_usaturate, i32, env, i32, i32)
-DEF_HELPER_FLAGS_2(sdiv, TCG_CALL_NO_RWG_SE, s32, s32, s32)
-DEF_HELPER_FLAGS_2(udiv, TCG_CALL_NO_RWG_SE, i32, i32, i32)
+DEF_HELPER_FLAGS_3(sdiv, TCG_CALL_NO_RWG, s32, env, s32, s32)
+DEF_HELPER_FLAGS_3(udiv, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_1(rbit, TCG_CALL_NO_RWG_SE, i32, i32)
 
 #define PAS_OP(pfx)  \
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8e9c2a2cf8c..56c520cf8e9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9345,6 +9345,18 @@ uint32_t HELPER(sxtb16)(uint32_t x)
     return res;
 }
 
+static void handle_possible_div0_trap(CPUARMState *env, uintptr_t ra)
+{
+    /*
+     * Take a division-by-zero exception if necessary; otherwise return
+     * to get the usual non-trapping division behaviour (result of 0)
+     */
+    if (arm_feature(env, ARM_FEATURE_M)
+        && (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_DIV_0_TRP_MASK)) {
+        raise_exception_ra(env, EXCP_DIVBYZERO, 0, 1, ra);
+    }
+}
+
 uint32_t HELPER(uxtb16)(uint32_t x)
 {
     uint32_t res;
@@ -9353,9 +9365,10 @@ uint32_t HELPER(uxtb16)(uint32_t x)
     return res;
 }
 
-int32_t HELPER(sdiv)(int32_t num, int32_t den)
+int32_t HELPER(sdiv)(CPUARMState *env, int32_t num, int32_t den)
 {
     if (den == 0) {
+        handle_possible_div0_trap(env, GETPC());
         return 0;
     }
     if (num == INT_MIN && den == -1) {
@@ -9364,9 +9377,10 @@ int32_t HELPER(sdiv)(int32_t num, int32_t den)
     return num / den;
 }
 
-uint32_t HELPER(udiv)(uint32_t num, uint32_t den)
+uint32_t HELPER(udiv)(CPUARMState *env, uint32_t num, uint32_t den)
 {
     if (den == 0) {
+        handle_possible_div0_trap(env, GETPC());
         return 0;
     }
     return num / den;
@@ -9567,6 +9581,7 @@ void arm_log_exception(int idx)
             [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
             [EXCP_LSERR] = "v8M LSERR UsageFault",
             [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
+            [EXCP_DIVBYZERO] = "v7M DIVBYZERO UsageFault",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 20761c94877..47903b3dc35 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2252,6 +2252,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_UNALIGNED_MASK;
         break;
+    case EXCP_DIVBYZERO:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
+        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_DIVBYZERO_MASK;
+        break;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC, env->v7m.secure);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 80c282669f0..28eabeb2323 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7992,9 +7992,9 @@ static bool op_div(DisasContext *s, arg_rrr *a, bool u)
     t1 = load_reg(s, a->rn);
     t2 = load_reg(s, a->rm);
     if (u) {
-        gen_helper_udiv(t1, t1, t2);
+        gen_helper_udiv(t1, cpu_env, t1, t2);
     } else {
-        gen_helper_sdiv(t1, t1, t2);
+        gen_helper_sdiv(t1, cpu_env, t1, t2);
     }
     tcg_temp_free_i32(t2);
     store_reg(s, a->rd, t1);
-- 
2.20.1

