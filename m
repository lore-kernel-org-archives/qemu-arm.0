Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1804771lfb;
        Mon, 6 Jun 2022 19:54:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4CQ5b+gg6Z1qZWWcK0xtpQ9HmpTNBTO6DQVmRJd+48VJL8tYrpF6qkujZqALXInbbtc7A
X-Received: by 2002:a05:622a:1a04:b0:2fb:80ff:39b1 with SMTP id f4-20020a05622a1a0400b002fb80ff39b1mr21231005qtb.259.1654570480201;
        Mon, 06 Jun 2022 19:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654570480; cv=none;
        d=google.com; s=arc-20160816;
        b=ivRzcDAKWUlaNFY8BF6EB8jpEeO26WcEjHnuurNQSx5yoWOY5y4wMlRyGQmgWsLYMq
         44WTOS2J0QmJZ3ms5XW8gmyvDF4ubCJ1OKScteSGxwVKgM0pC9D4baPHEk73qHTxR123
         HmVWGbkC+trUNBdN5+RuWP05EP2/IF9S4wbwwfjiI2kYBNbLdKUqobalrWEtgLMEdCSa
         nSEBzYk4LnyvqGcQkfi0EyznZRX5stPFs8BeCqtWTWiFNjFIYKnfkcYem3CB2p5CioBl
         yFBI77kJehXQstkQCnln5Rvgp811EZuwvX5QBwwllyPeyt911i8k5z76hV2VaENeTGCQ
         6GCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9S8DgVIYwXT3v7+Mq8zUaV8sSMq5mSYLW1DSinvTJ/c=;
        b=M5lvSWLW/cneT4101A7SZfHdtIlauhPDbs62/pWAhYnHyS3Zg1+jD0wlM/mV9w0S73
         jjTlSMTYFX+0bCxJQ48f1cFttpLuhUOhft+jtrqS8DJ/C5N/OnwEgh9/BR8YNLAqWcna
         2jGt7nOnPc+4cR/0YBYKfWAHyD6lfSnnkEo7yVlidXTRUA642m+EO43KhzNIw88dkqEm
         nvCBRSFwHqXHgo8eV5GTl5E9KPN5RvFfcNNp/fTGWkAESSbUHACXT1qE5W6V6GldKAnU
         WTb0WhpCKPCsIh8fg1KC6OjO2yOxgld69Q6Tx9Bqv31E3QbGUvOab2jNF8b/bBn+TdzH
         BbCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S91Jd+1o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9-20020a05622a118900b00304ebd7a2bbsi2541410qtk.448.2022.06.06.19.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 19:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S91Jd+1o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyPMd-0003Dj-HX
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 22:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG1-0006t5-MY
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:49 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPFx-0000K9-57
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 22:47:49 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b135so14252700pfb.12
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 19:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9S8DgVIYwXT3v7+Mq8zUaV8sSMq5mSYLW1DSinvTJ/c=;
 b=S91Jd+1otx21UGN8wuqGFzTijKyO8JHYnyjyvh74paoeE4Zd6lHITfxFmz+qgcttMF
 nqEQ8no8oEi2BVGSigpoRXum+peB3TiuVHweWQSnGpMRGmat25uPxgMrIPt1L80v7PbW
 g5WEnxyWWbO8koAnSUo0+qGM9dXHw+mTJtZ+x7egbBxuFuMmVfFSacNR+KZki8WnmTzp
 TUv5gdhfxce04sHUmBR9WPr4PcJLyIZKWvV/qHG6P6bjvZAij6IQ43iD8DaAMKaazFXo
 5waFt5KDVVnvXp6KUfW7hOgugJhsGL0cCY2O/reRopw0H0A6Ro0YQWXAwJW1xnqYuthr
 fcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9S8DgVIYwXT3v7+Mq8zUaV8sSMq5mSYLW1DSinvTJ/c=;
 b=8PmLU1afr1Bv9INwk1eFjkrbzIwgx3aOsswEqJieoo143sA3H58ZqC1D+ZZzQCDDOP
 c/lz2Y444lUWCD2lpHVMNIJKYveqsrYDvrGpEXUMMi5XcLSFmn0jsPCi6evcaUkKtY+c
 nuR0XZqDGNka25+wRbVtZZf1sA+ynjm/F9VcPSuenkbkOagscKJsIhjdt5F2Z9tO3yjM
 4TEXDrCR/OEWryB3ywmCxuO0dhi2onH9E0+A2BMM98wuaQHBPn04M+x9kyu/yY0a8Viy
 0MOUpV+fM7Cnwu4Vfmq+I6LEhy4ct8abOAMa8Y3HqlBrNuZD4SsMSrLgFrmN0tFE0Aal
 PNcA==
X-Gm-Message-State: AOAM531Gl1RelfI2S64cwbBVwMTDzm1E6WpGM1PeApitnW3j5CPqy/hC
 wzImpdxKrdQ1VyiZeb2p43ZeKQ==
X-Received: by 2002:a05:6a00:1496:b0:51b:dfb2:c9b5 with SMTP id
 v22-20020a056a00149600b0051bdfb2c9b5mr21161067pfu.84.1654570063803; 
 Mon, 06 Jun 2022 19:47:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 10/25] target/arm: Rename helper_exception_with_syndrome
Date: Mon,  6 Jun 2022 19:47:19 -0700
Message-Id: <20220607024734.541321-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rAqIeVsCiQQW

Rename to helper_exception_with_syndrome_el, to emphasize
that the target el is a parameter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h    | 2 +-
 target/arm/translate.h | 6 +++---
 target/arm/op_helper.c | 6 +++---
 target/arm/translate.c | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index a13007699d..aca86612b4 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -45,7 +45,7 @@ DEF_HELPER_FLAGS_2(usad8, TCG_CALL_NO_RWG_SE, i32, i32, i32)
 DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, noreturn, env, i32)
-DEF_HELPER_4(exception_with_syndrome, noreturn, env, i32, i32, i32)
+DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
 DEF_HELPER_3(exception_advsimdfp_access, noreturn, env, i32, i32)
 DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
 DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index da5f89d49d..1d6a8c7dca 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -332,9 +332,9 @@ static inline void gen_ss_advance(DisasContext *s)
 static inline void gen_exception(int excp, uint32_t syndrome,
                                  uint32_t target_el)
 {
-    gen_helper_exception_with_syndrome(cpu_env, tcg_constant_i32(excp),
-                                       tcg_constant_i32(syndrome),
-                                       tcg_constant_i32(target_el));
+    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
+                                          tcg_constant_i32(syndrome),
+                                          tcg_constant_i32(target_el));
 }
 
 static inline void gen_exception_advsimdfp_access(DisasContext *s,
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index ae0009d1a3..1c4e6753f6 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -373,7 +373,7 @@ void HELPER(yield)(CPUARMState *env)
  * those EXCP values which are special cases for QEMU to interrupt
  * execution and not to be used for exceptions which are passed to
  * the guest (those must all have syndrome information and thus should
- * use exception_with_syndrome).
+ * use exception_with_syndrome*).
  */
 void HELPER(exception_internal)(CPUARMState *env, uint32_t excp)
 {
@@ -385,8 +385,8 @@ void HELPER(exception_internal)(CPUARMState *env, uint32_t excp)
 }
 
 /* Raise an exception with the specified syndrome register value */
-void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
-                                     uint32_t syndrome, uint32_t target_el)
+void HELPER(exception_with_syndrome_el)(CPUARMState *env, uint32_t excp,
+                                        uint32_t syndrome, uint32_t target_el)
 {
     raise_exception(env, excp, syndrome, target_el);
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 87a899d638..dc033600c0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1119,9 +1119,9 @@ static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
 {
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    gen_helper_exception_with_syndrome(cpu_env,
-                                       tcg_constant_i32(excp),
-                                       tcg_constant_i32(syn), tcg_el);
+    gen_helper_exception_with_syndrome_el(cpu_env,
+                                          tcg_constant_i32(excp),
+                                          tcg_constant_i32(syn), tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.34.1

