Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2155546njk;
        Sun, 1 Dec 2024 07:18:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVeR4h6pET8twXx3pHG7bY6QY5hs9yWZ9AOq48Cz8NzZIf9kJMk4ECGtUDxIMv5lc/qkmItS89pj9aQeA==@linaro.org
X-Google-Smtp-Source: AGHT+IFMSnd92LRcm6f0m39F23uJ9k9jRgBqyyDPxmIsf1imiddNSPjr1tGiSmbxokkPGCgy1q88
X-Received: by 2002:a05:6214:202c:b0:6d8:8c59:be55 with SMTP id 6a1803df08f44-6d88c59c04fmr159819356d6.14.1733066330541;
        Sun, 01 Dec 2024 07:18:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733066330; cv=none;
        d=google.com; s=arc-20240605;
        b=D79MlfqoMk/4Gp905voYPFHT5u3Gy1Xjcng0gtUuAqe5KVtXKzv5YkV66PD3yzWu+s
         lOcavP+sbYsFsJsRpl3oBhvIbHEGv+vW5tuI+pkS1ojtbeOEzO9ocdWJf23+It0137gz
         4GofeSlK1PNnJI8wKnkKVwgjk5mEz7dXTqaa7iA3daY8haEtaBHCm2nNv9x7LS2r0S5f
         xCrW1IJtvAi2UzGCFPhyfvO6cQz4nAxsFYRgUv2nQ8qPcnq4nHjRRK4OjXMMzAJvRehe
         bG55etgwB4+cCZULbddr9fEiCxeva7JhlgegF9IYdp3fsl6+04fW3i+u7+iUXIDGBWUK
         ddLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K05BccdsIU8t807GjcqZMY4bIXaGoBbAdQflnbBMnII=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=YcQcPoL+rlc06sKaawn6ElQkDPD3t/rvZGdHI8paiyU2aIlM7cH2KwH2e0RoBmW0F9
         0hI1HFADjYJAMjqFHBrhhQbXkJYDTNMnSLGl2wKUmxXEx6jGMKlq0VLAgWNAdXlD/dSN
         e7W7jbKV7xgDOJ1cuZ+UIJ92CSnUg+w+FJwlCv3FjYB+FiTH20n2FEh40LT59IsVnH3P
         nyAGqQ9PXvfMykaVaZ6gLuz/tkcxR/QOrlnb1JLrLrbe0V069lwtLPtN4XI+NTqezP0R
         Owj2TrnM03IbMcB4LgBzxXa3wwMJYsfQdry8yS9Th+pIKd+axVUM9FjOnvqzBcqS1vf9
         FmcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JjdyRmeS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d875590038si98767376d6.486.2024.12.01.07.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:18:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JjdyRmeS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlX1-0001VY-Bq; Sun, 01 Dec 2024 10:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWz-0001SY-03
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:41 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWx-0004IA-86
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:40 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-71d51a9a42bso1484289a34.1
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065598; x=1733670398; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K05BccdsIU8t807GjcqZMY4bIXaGoBbAdQflnbBMnII=;
 b=JjdyRmeS/k9skGsEv/jM+Gl4cQMYE+tGvwCM6PPDxHsd7GrgTgPSsFSftQBjHmp7bw
 cReqOVJ/x72BREpdZ+EqyHd1Jz5yq6qeNicVbSRB+4DF9ZVes2WzEL76EydqMb7SVbwf
 G/ikNjviIJNRsp4CTjYKFxWt3J+xVAvLbjMU3FWTa9OM33D7IeCatnwm3BfFr1AXDqgS
 al+394kf/s5aDsQWjLDtImp/e6/xS//0hHdunPyhpTVpZ9U+b+Ul6m0S2CjnyZ1roCAu
 taKDp5MyOzLtdU2UeZFZM9OO07zBodVtrz7UEazkHS2SMFOMf8nVLy6O1fMz6GlWRLc0
 9jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065598; x=1733670398;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K05BccdsIU8t807GjcqZMY4bIXaGoBbAdQflnbBMnII=;
 b=TPPRNBN5w4jA0QmHKOaDWMyFNbmLPX+REQ2UWWwEDZFQqom7gJCxWBk0dOgA6viqjr
 /lHY3LMxzRqkq2J4sKRcLPGH3OcgqBbOLjhYrAq6ETgHjA33ceBhe2vdqVhXs1tXpsEP
 35P7z4xpyTaZ+/bSrfaWKSzf0aWZidxU5fZ2/md9TXYD3usNO3hHRGy4N2FmcWHXDRsv
 ZzA9kK9kwfXaE4vVt1L25X2VspSws0v0OMleDc9PE7KvXClwBNFhUpaSnJsoBEfoL5rG
 4N5trDiHH4hYtS/V8yBhP7H8XOHik0rXvd7FgwrRcDxy64aWXGZ8wMBHLL1fmEjr7lXV
 /4Wg==
X-Gm-Message-State: AOJu0YyOrn7lBRXGAUr8qXVbRFED6g8FyEAoRxh00g2ftLRkyO9QqdGl
 MSwr9d0CcVCqxCgfzqEdAjJWN7nNInYoSGeCoIel4Txy5k1gttMoj7ZOIW24dlI=
X-Gm-Gg: ASbGncsbWe9jhx1PJPUi8Qtc1CVBx14zTE+Z18GiFr+2pG9j9mZgKseZ+q/UWSNbZzJ
 2F+oYFO4JBpMR1i/sKAvxlDQqImjtFy5NirnQLRTKHDWMjyWdoqQYa8/vTPM2AcBvy1Et/1H03K
 TvKD3AoYOc5F+GG7OAQ7GPxfXB1V0MvqOB3XU7WznSQWCIGSxSsZ/7UvA96ET1eoKoNulupHbKt
 0N3MEQMqsG2H10bBA3Pm5TmArnLtGq9+PdDi+UC/JHdtxjmoww7wp228kCVNaL2Zyx/toZEEtI8
 CJD0nIwlRksCO0eic1vf7yWDi9w2Q2pDgmzC
X-Received: by 2002:a05:6830:925:b0:71d:4ec6:8600 with SMTP id
 46e09a7af769-71d65ca3b44mr18481534a34.13.1733065598024; 
 Sun, 01 Dec 2024 07:06:38 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 25/67] target/arm: Remove helper_sqrt_f16
Date: Sun,  1 Dec 2024 09:05:24 -0600
Message-ID: <20241201150607.12812-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
X-TUID: jOqKlmFCUKUt

This function is identical with helper_vfp_sqrth.
Replace all uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.h    |  1 -
 target/arm/tcg/helper-a64.c    | 11 -----------
 target/arm/tcg/translate-a64.c |  4 ++--
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index 481007bf39..203b7b7ac8 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -80,7 +80,6 @@ DEF_HELPER_2(advsimd_rinth_exact, f16, f16, ptr)
 DEF_HELPER_2(advsimd_rinth, f16, f16, ptr)
 DEF_HELPER_2(advsimd_f16tosinth, i32, f16, ptr)
 DEF_HELPER_2(advsimd_f16touinth, i32, f16, ptr)
-DEF_HELPER_2(sqrt_f16, f16, f16, ptr)
 
 DEF_HELPER_2(exception_return, void, env, i64)
 DEF_HELPER_FLAGS_2(dc_zva, TCG_CALL_NO_WG, void, env, i64)
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 8f42a28d07..3f4d7b9aba 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -915,17 +915,6 @@ illegal_return:
                   "resuming execution at 0x%" PRIx64 "\n", cur_el, env->pc);
 }
 
-/*
- * Square Root and Reciprocal square root
- */
-
-uint32_t HELPER(sqrt_f16)(uint32_t a, void *fpstp)
-{
-    float_status *s = fpstp;
-
-    return float16_sqrt(a, s);
-}
-
 void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
 {
     uintptr_t ra = GETPC();
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c976c15b08..4d945f2d5b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8358,7 +8358,7 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
     switch (opcode) {
     case 0x3: /* FSQRT */
         fpst = fpstatus_ptr(FPST_FPCR_F16);
-        gen_helper_sqrt_f16(tcg_res, tcg_op, fpst);
+        gen_helper_vfp_sqrth(tcg_res, tcg_op, fpst);
         break;
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
@@ -10977,7 +10977,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
                 gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
                 break;
             case 0x7f: /* FSQRT */
-                gen_helper_sqrt_f16(tcg_res, tcg_op, tcg_fpstatus);
+                gen_helper_vfp_sqrth(tcg_res, tcg_op, tcg_fpstatus);
                 break;
             default:
                 g_assert_not_reached();
-- 
2.43.0

