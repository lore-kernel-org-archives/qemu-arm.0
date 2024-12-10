Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3438984njb;
        Tue, 10 Dec 2024 08:20:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUTaa2R1yIlV7covWvqAOyXY+/q/c4PU4/QG7xaGW46HhP4qVRfAA+WZIpJzoKynW/569QAxgjBsaCQw==@linaro.org
X-Google-Smtp-Source: AGHT+IFBMpTkLgBwY7XyuPY2fFjnPFkNDTp5quidiJsMhCusJzGbr0pAzE4jpKKJAg+nFGoqayfa
X-Received: by 2002:ac8:7c47:0:b0:466:b1fb:3028 with SMTP id d75a77b69052e-46771e9c3a6mr93494591cf.4.1733847627330;
        Tue, 10 Dec 2024 08:20:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847627; cv=none;
        d=google.com; s=arc-20240605;
        b=YhGCTAkuqnFbBulMeyf+UvLEwjdJanD92l6czD+Ox15k936teIYKupABrXFQzN8r2t
         FcLjf2rgrFS13YljCLgLwQFztf15s4i7n+dJlzY+UgKoqMN7IwHG124AFaLknYYEteI+
         iaCoJCWxyCYwLf06aQkzEkgAMIHRw9Ta81iqPG1k1LMHGj5SIXl5ucNxZnN6Oy6lsUkv
         07MstDyrv7WJNK50PzsYicrDHzlMS3KmWCK5tdtR0q9SHI5oAV08TEYibbyA3ejIy0ws
         tEP/zxCui5qgZK02KHQsfK5MAISXgJCjYQ5rBTbbXCuA9nK+f2tOBnRhbBGy6jIxWEeL
         8A8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1UXwx0kDopuEVwiBnbW88lWarbgL+jsSQVFPQ+k0F70=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=A8Hw2419g0EIDsSFgVA1FMkYwS8lCqQdp9tIumn1Wb9CTg9ENU0g0gd/5OFtXA5H6V
         NYS/MbSTKIbXoLDkVV4mMup8BHJCdcbDabxQod4228Q9tBKHjFloOPHEjP8/2yw0ILpH
         ggQ0hboMIf7k1ye+4Sgm2o5mshsVjlDAKFGQc5ljfXHsvTC7g7tQGWZavlZTGSEuUdae
         VBluwWJPCAEHraYsNs+QCqhis2llBlXevrUJ4bBT5XD3ANE2ZBcJNP+/eUcy1Ag9ipO3
         YF4f7Cw+rJTMh/IBY/D8vAAJYEugVsdfMnd+v0ApnvPvI4e1KQSMkVrfg9oLIaQLlQjy
         XNMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I2evV/m3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46784f243d5si8422981cf.720.2024.12.10.08.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:20:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I2evV/m3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2xg-0004le-AX; Tue, 10 Dec 2024 11:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2xP-0003lE-7x
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:19:31 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2xM-0006Vz-7V
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:19:30 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso2572603e87.0
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847566; x=1734452366; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1UXwx0kDopuEVwiBnbW88lWarbgL+jsSQVFPQ+k0F70=;
 b=I2evV/m3VJZxMfOCGB2GL2GfF0ibnDBMXbUpAYJpAfzZLhvlj2L3gGT1fWtPZtu58j
 BZ0lN1EWIKxpoS3prLEY+4qaT5bZMq/jc3WjSOJZFJd01OLzrdVJj5B3vi6q+kXfXthe
 86b+ElBHelwa/7YvdhPnTjr5bj59KiiAXUjEYgpckZ7s+C7AAYtOuGOpQCdLatYqqq1A
 5K+UF6cBpCGVfE6E4bdj8HP7cNKD7sT/hi0sPKYo51QuqKJCBi0/cyFb8dJwM1tU3MkG
 Q0F4GmCynbNrEqduBBWQSz2pkwTcnGd3wmOAeRfVSwGy5FL0PTLlnFadRTKRc54HrU80
 CEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847566; x=1734452366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1UXwx0kDopuEVwiBnbW88lWarbgL+jsSQVFPQ+k0F70=;
 b=SCXvyyc5t5FFxgbZw8bTUxWCe6jFma/I/vDGgvDLgrCWpyM07FMZxd5OpESMVh1Jgj
 Pt6So/WKhlXpygJHGaRTfyNVzYBqpq6RIO9Ztb9lSUSNwGGQcvxTm+fdpvLdLtQQBH0o
 gngEKa3p06XF5Ss3TKyBuMeQysTVkhH960zV++PJTvRCXuBwroVj98fi/jeRxF1sinDD
 Tt7t6HO6PxwRuIEtRrr4OQADRv9dn4rn7TrsvCRMpIor1tAi57t/dP89r/ea2B1gu5dS
 nUgb7C08V1pTzT0vjHbY/JAi8uy4d2VW7wI7/lHxbuZYdho14LVET50NNlrxzWtzdctU
 w3sg==
X-Gm-Message-State: AOJu0YxzCJJzio/GhCfuoSOL34YOG9WTmBYJJrEWwH8qMKFM4E3Q2TdO
 4D20/2mBFyArFSJVhChfnK5xfqCQBaffFbQsgwbLzwoAJ8jOh+2KkkWGdacYmL8=
X-Gm-Gg: ASbGnctsPz+2esfymdLSAWoPYSWDj8KqLjwD9oOA5icmOnuCKJmCBU/gWDuk7kowzxT
 DQva7nI5KwZmiUqoUFWmVnY8Tc01T5BPAghnZMiGs52Cl3A3O9mIPJTHtV76sN92bG+I/AV3TC9
 Ui8aCqfU9K39bdLm6mfZ2yHaiV7s8JRzIsvCF1zDxdc0XjexGT8/zv3KmSgUoRyVuqLcj66vRQk
 sy4sUsefdO12WNDb9AfdzX1wjJ2+tz644mzLGlQzyQEfgXDHxDavTs6vNE=
X-Received: by 2002:a05:6512:1250:b0:540:2223:9b1c with SMTP id
 2adb3069b0e04-540251fd730mr1441112e87.25.1733847566392; 
 Tue, 10 Dec 2024 08:19:26 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:19:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 26/69] target/arm: Remove helper_sqrt_f16
Date: Tue, 10 Dec 2024 10:16:50 -0600
Message-ID: <20241210161733.1830573-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12b.google.com
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
X-TUID: ykljhwNp6nsQ

This function is identical with helper_vfp_sqrth.
Replace all uses.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index e278c0d87b..e6878abd35 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8354,7 +8354,7 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
     switch (opcode) {
     case 0x3: /* FSQRT */
         fpst = fpstatus_ptr(FPST_FPCR_F16);
-        gen_helper_sqrt_f16(tcg_res, tcg_op, fpst);
+        gen_helper_vfp_sqrth(tcg_res, tcg_op, fpst);
         break;
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
@@ -10976,7 +10976,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
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

