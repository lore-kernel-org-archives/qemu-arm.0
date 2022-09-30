Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp39933ocs;
        Fri, 30 Sep 2022 15:04:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5grRg4cjPkLCtikmTWovNiVB1DsYLGUf+1EO+g3WbSKR8AVbjMfnwf03dZuip6au9v2aVc
X-Received: by 2002:a0c:f4cc:0:b0:4aa:a471:978f with SMTP id o12-20020a0cf4cc000000b004aaa471978fmr8671031qvm.80.1664575476261;
        Fri, 30 Sep 2022 15:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664575476; cv=none;
        d=google.com; s=arc-20160816;
        b=E14OM0LnkL4jusWBNkGSLLUtqoN9d27MvG0BspaK0V8a0/ndGf2fGw2au24zSHRk8k
         G/EVr4EebyHeU8kc4FzvTka6fPJOTiiEiiGQBS4XTIN3fktR+iYtr9HEi1uHJPYKGhGG
         HkXSHhejrZC2aSoihu7DM8H3Ftji9yVYsjxZKLD6WTrg7r3eabbyd9X3SrJvcmELajtC
         /Dj+hB1YiTgro3OwC/tjFVkGIzkmp+4XG35DwU7SV9oUxB5B0gbh6ldIwKSMQaw++9BC
         fkeUpi4sYvdgeZeX5C+WpSF3AuZG5t/Wt52TT4tr2oR7s8WjAge3rJKVbecuZBWuD9NM
         x4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6YmhwBNEkuM0BFWCxU5vS57JWawvJkZaQY6laYf14Ok=;
        b=YJ0NLBMgy9ebHxZXkCG4sw9g5RF6radHpFJP8r5KoLDOLHmSomo1lLIuXKbdGHRAlk
         eJiVMQrV8zgSWD2EIYD/R9PIYh04ZEHmAr5YgWcZfyVlLN8mJhr6g/k7pE5viXYgWZTH
         jwTwW/g0kv2VYRNei0HNCgSqclDl4Y4rWrhrgESD5VJYsjLGaQPg2tGgREkDpKbeBHwI
         grP3YXnIu9UrIVfK1nSDL1ljAlA7UiPCir9EnenarfLoLfKdTovG1mB8Pix3cmrNtl9c
         RUYVWe4I7TH5Z3BunrMQ4LEJRwO2JOKND2jCuB2FpTWxi5MlkHLzFkGlB4+08vVtKrCv
         ke/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A68L/Obd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm22-20020a05620a199600b006ce20d8db59si1896333qkb.275.2022.09.30.15.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 15:04:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A68L/Obd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeO7W-0002Ys-Q7
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 18:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6S-0001hd-QJ
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 18:03:28 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:34438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeO6R-0002ZF-2p
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 18:03:28 -0400
Received: by mail-qt1-x829.google.com with SMTP id e20so3361001qts.1
 for <qemu-arm@nongnu.org>; Fri, 30 Sep 2022 15:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=6YmhwBNEkuM0BFWCxU5vS57JWawvJkZaQY6laYf14Ok=;
 b=A68L/ObdFP6GjSRgWpsuqYmjyX51OOHTpW6pCITLPNViOwdQBlGdiRuKpzm+nFy3db
 qFa0WxYCV02yQ+1I1Bp6wuYsSxF6+5WDDFkYqMR0VVgN7HWL7Ng3SNaNC8LpqOw8oB+W
 8ZNONEEuX2N6ZgelRQZZ9o5mzRQVG0XYbNxHIsxWqMG6eZLy7oG+Jr8OlMgOby7ZQ+HE
 VH90pA/Phawd3qZPgTYgkOfvVY7nz4cifO6owrNaALsWle8l5xihMvhXgmhUSJeQiFQQ
 ksR7XMZjmh1wokfGvSU8i3w5suB95BgDPiuv/GQC+N56qIOzkjSigKx+pm4n8mWvwStf
 cHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6YmhwBNEkuM0BFWCxU5vS57JWawvJkZaQY6laYf14Ok=;
 b=z8/iXSxf4FMWDvcpHpEeaHiodqXIhFBZ9GFqLX0AkTBmJAZ1BDc2YjNgb1BOW8FjYq
 a1naCvXbJRekqTo4AeQmiKWG52d7eLdWHAd9v2ksnWH8uKtfe3NAxQQq6Q95tNN88SJi
 EnyjF6BsuOly4cr0/BXQs3Km5sQ60waBLQqvUsAQxYRe2Tt0tLhEALizYW82++bnP/rv
 CB/HqceP+JEiTO+zcaETuw4vhK8mN++VUhEGVB5U9oK8qbN11lmH5uJcyzcEJdI5YxgV
 GwinSLb7gLmHt4EgheGyzL2AowW03jYB359Mj6gyoNFqrQUxskHjIC+Uxbstj/G9QohJ
 lHUQ==
X-Gm-Message-State: ACrzQf13JjxkCB7ohbQVLNRII+oRD2KC6WL42U9jtNorDGIbNmGdbWPz
 dVcQY9bT3NMkBqzSXkfBYV1llw==
X-Received: by 2002:ac8:4e94:0:b0:35d:5266:ac9c with SMTP id
 20-20020ac84e94000000b0035d5266ac9cmr8860915qtp.177.1664575405971; 
 Fri, 30 Sep 2022 15:03:25 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a05620a22cf00b006bb78d095c5sm3196055qki.79.2022.09.30.15.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 15:03:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 5/9] target/arm: Remove gen_exception_internal_insn pc
 argument
Date: Fri, 30 Sep 2022 15:03:08 -0700
Message-Id: <20220930220312.135327-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930220312.135327-1-richard.henderson@linaro.org>
References: <20220930220312.135327-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SPCaWRz3pJa8

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
Since we always pass dc->pc_curr, fold the arithmetic to zero displacement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c |  6 +++---
 target/arm/translate.c     | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2621b3b36a..005fd767fb 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -340,9 +340,9 @@ static void gen_exception_internal(int excp)
     gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint64_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
-    gen_a64_update_pc(s, pc - s->pc_curr);
+    gen_a64_update_pc(s, 0);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -2219,7 +2219,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
          * Secondly, "HLT 0xf000" is the A64 semihosting syscall instruction.
          */
         if (semihosting_enabled(s->current_el == 0) && imm16 == 0xf000) {
-            gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+            gen_exception_internal_insn(s, EXCP_SEMIHOST);
         } else {
             unallocated_encoding(s);
         }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f9d3128656..e0b1d415a2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1078,10 +1078,10 @@ static inline void gen_smc(DisasContext *s)
     s->base.is_jmp = DISAS_SMC;
 }
 
-static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
+static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
     gen_set_condexec(s);
-    gen_update_pc(s, pc - s->pc_curr);
+    gen_update_pc(s, 0);
     gen_exception_internal(excp);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -1173,7 +1173,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
      */
     if (semihosting_enabled(s->current_el != 0) &&
         (imm == (s->thumb ? 0x3c : 0xf000))) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
         return;
     }
 
@@ -6560,7 +6560,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
     if (arm_dc_feature(s, ARM_FEATURE_M) &&
         semihosting_enabled(s->current_el == 0) &&
         (a->imm == 0xab)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
         gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
     }
@@ -8766,7 +8766,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
     if (!arm_dc_feature(s, ARM_FEATURE_M) &&
         semihosting_enabled(s->current_el == 0) &&
         (a->imm == semihost_imm)) {
-        gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
+        gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
         gen_update_pc(s, curr_insn_len(s));
         s->svc_imm = a->imm;
-- 
2.34.1

