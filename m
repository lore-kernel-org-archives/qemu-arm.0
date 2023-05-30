Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2394071ejb;
        Tue, 30 May 2023 12:22:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7dHwo0tm3iJWNVXQ4AbbW7UNGjz4mgk7gS2XJRU3FJlpgEmFJQikiZVteQbwx+m+PBLVN3
X-Received: by 2002:ac8:5e11:0:b0:3f6:a7ad:9ee8 with SMTP id h17-20020ac85e11000000b003f6a7ad9ee8mr3234991qtx.19.1685474529010;
        Tue, 30 May 2023 12:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685474528; cv=none;
        d=google.com; s=arc-20160816;
        b=P7XJ6HUICTe+N7ifue67o+MOz0qkPHjV7vWbN8XcX9O1jVFfLnL070vitIY5H6Xi+Q
         e3vvjvLmZRqpabrxaJfvnoc7asTBgi0d6gizW3ZEov44Gk73duO6ix8JtcW3GNLd0EK3
         cPXQ/07tUNRWDpOxhqXQkPPG9Y4r8cpXwy4Go9pgspwSUn4tyLbdG30ddZA8qrLJiltE
         Vb9AmIDpq4Z8HpLunuUMMDY72YIzSmzSvZeXIY6JdKYTGjKsgJCiLg2/nMERfA4+hNa6
         HlUwXXpWy4yxudB7VCPhvXdUx8weyz/XZvH4R9HmD4sxZ1cc1XtNrnkwlIo7HhW5baxB
         eAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6JfHuaMlr/R5D+hsSo7rFRMVl2Kxv9MZXkN8QLhXQd8=;
        b=mvGXbax+Qp3ndzpYv9jdWDZsKrP+n5E+RsZHlnk6JPlnjC4WKo6VUYC6oxYvxTW4pY
         h4TEiCOPS3Q2J+ZUargtkj04zveNFaY3dqO6QtxlS5RbTOGOzgn/PtYKzxWkJjc5UOR1
         /OcCV5NYdpljqE1iwy9RkEOKk4LxIpj/toqtyAJevDF/nUXigA5urDc9IfuR/OZHZluk
         yliZ4PL4mgsi7uRcor+j5/Y2a76XEtjPmEK8XrAOP1RzEcs6CpgC/8/Ac6xBaUewCwMU
         JIGyJCsGtnD1GxH1HwwDLk5yLWyjCGD3T7givqBE5x4FwN6hgMS84w0WyzazArdk7CnT
         Y0Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWLsjx9v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12-20020ac85a0c000000b003e4e228cfd2si6992975qta.761.2023.05.30.12.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 12:22:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWLsjx9v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q44oG-0007Mt-SV; Tue, 30 May 2023 15:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44o6-0006vE-6Q
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:58 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q44o0-0004c3-4f
 for qemu-arm@nongnu.org; Tue, 30 May 2023 15:14:57 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d3e5e5980so5638930b3a.2
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 12:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685474091; x=1688066091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JfHuaMlr/R5D+hsSo7rFRMVl2Kxv9MZXkN8QLhXQd8=;
 b=TWLsjx9v3sBqhuRN1W3lU6hQZSF32ly69dkKthDlXVXvM+vIxWO20jMzGKYFpzfeyi
 39mDPoBGK+D2+rBdYgWYneI+pRw7rtYSkIuPxKgD4Ma7+XVFw78B0PkrGIHuHffwrxsD
 pVBAcPsq4FtvaR4Ddb7WjXoDBv4KqkfrCD8AhLtuBSmcsAO1gk+im4KBdNpMNtc7FXiz
 8hScnWrKoMY68mdoEo1H9XZIu9h3zFMh8MYQvLuzmOFIhsYhPHfS1d90KUb70XSbpqbU
 8GLgcz/uz26XmySUidd+cR4VxexJCo3t/7d93uAlU2wmujjeVqgr1rjro0w2RgpDQ/Md
 kU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685474091; x=1688066091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JfHuaMlr/R5D+hsSo7rFRMVl2Kxv9MZXkN8QLhXQd8=;
 b=jJYHNGVK7oXoOWGgCjn1BJWSA0BGflaWMbNPzirj1ajBjwFQiykgTtpRLNkEmP+khs
 UrHe23TDT+vj/LdpgFWCChbT9DGLwwVnLGk8Z5Mgb90hSKBJFaUfs0qYr9+DIn5+5yne
 4R6cPexrLwFQP1e1dmB5mo4r/eMGL45FV8HynG6keC0O0U3zBXA/4fg40586QVWn51qB
 aJ7JQhBVeOd+THPnTnjoGTsSgYqIKwJgRlkDCNWe6juv9onRIQVF597u+eBMYprDc7li
 iQ2oyfEH2MNuIGH1gDofKyl+vqXPU/qWO+a0TBEa+8TUwLj8ysfCKl/N1/unxldWO2v7
 pqBQ==
X-Gm-Message-State: AC+VfDwY//0DNP5m2QMe1KKyGksQU/BmIyEmAn+0FiX5dSrQly5hiE0e
 Om58RLGvWrLJVnxlhKt/Gt+UkA==
X-Received: by 2002:a05:6a00:8c4:b0:639:a518:3842 with SMTP id
 s4-20020a056a0008c400b00639a5183842mr4362013pfu.7.1685474091279; 
 Tue, 30 May 2023 12:14:51 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
 by smtp.gmail.com with ESMTPSA id
 10-20020a63104a000000b0051806da5cd6sm8926757pgq.60.2023.05.30.12.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 12:14:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 14/20] target/arm: Check alignment in helper_mte_check
Date: Tue, 30 May 2023 12:14:32 -0700
Message-Id: <20230530191438.411344-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
References: <20230530191438.411344-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: eg4qK9ohvaX5

Fixes a bug in that with SCTLR.A set, we should raise any
alignment fault before raising any MTE check fault.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h         |  3 ++-
 target/arm/tcg/mte_helper.c    | 18 ++++++++++++++++++
 target/arm/tcg/translate-a64.c |  2 ++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c869d18c38..05b5231d43 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1242,7 +1242,8 @@ FIELD(MTEDESC, MIDX,  0, 4)
 FIELD(MTEDESC, TBI,   4, 2)
 FIELD(MTEDESC, TCMA,  6, 2)
 FIELD(MTEDESC, WRITE, 8, 1)
-FIELD(MTEDESC, SIZEM1, 9, SIMD_DATA_BITS - 9)  /* size - 1 */
+FIELD(MTEDESC, ALIGN, 9, 3)
+FIELD(MTEDESC, SIZEM1, 12, SIMD_DATA_BITS - 12)  /* size - 1 */
 
 bool mte_probe(CPUARMState *env, uint32_t desc, uint64_t ptr);
 uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra);
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index a4f3f92bc0..9c64def081 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -785,6 +785,24 @@ uint64_t mte_check(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
 
 uint64_t HELPER(mte_check)(CPUARMState *env, uint32_t desc, uint64_t ptr)
 {
+    /*
+     * R_XCHFJ: Alignment check not caused by memory type is priority 1,
+     * higher than any translation fault.  When MTE is disabled, tcg
+     * performs the alignment check during the code generated for the
+     * memory access.  With MTE enabled, we must check this here before
+     * raising any translation fault in allocation_tag_mem.
+     */
+    unsigned align = FIELD_EX32(desc, MTEDESC, ALIGN);
+    if (unlikely(align)) {
+        align = (1u << align) - 1;
+        if (unlikely(ptr & align)) {
+            int idx = FIELD_EX32(desc, MTEDESC, MIDX);
+            bool w = FIELD_EX32(desc, MTEDESC, WRITE);
+            MMUAccessType type = w ? MMU_DATA_STORE : MMU_DATA_LOAD;
+            arm_cpu_do_unaligned_access(env_cpu(env), ptr, type, idx, GETPC());
+        }
+    }
+
     return mte_check(env, desc, ptr, GETPC());
 }
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 214a9b1638..8301d6c8e2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -274,6 +274,7 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ALIGN, get_alignment_bits(memop));
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, memop_size(memop) - 1);
 
         ret = tcg_temp_new_i64();
@@ -305,6 +306,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ALIGN, get_alignment_bits(single_mop));
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
 
         ret = tcg_temp_new_i64();
-- 
2.34.1

