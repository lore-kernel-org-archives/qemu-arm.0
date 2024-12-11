Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4191039njb;
        Wed, 11 Dec 2024 08:33:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUtagmobLigTrmcuXMwHrupaGayMs3rndApbhx4QBGNIza6MTd9SEHlqJ9cmRmqgtI4woFqh4qmSETCdw==@linaro.org
X-Google-Smtp-Source: AGHT+IGoiTDnv/RGYjirfvGy/Ebb832nQiO1FnK1ydGjHQ3HMpUtjveMo+y4IThQW8Wo98FJwDN3
X-Received: by 2002:a05:6214:c86:b0:6cb:eba0:267f with SMTP id 6a1803df08f44-6d934b10077mr51300376d6.16.1733934833839;
        Wed, 11 Dec 2024 08:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733934833; cv=none;
        d=google.com; s=arc-20240605;
        b=GOYQZj3nnRvJfj0aWXn52n4Hq0ACMJf+P/lrEYv3wXH4nEwknnd5cuFImP/rgxYu6+
         iKplWRHaGpkJ+FBmJYRqBLpFFzHqn4z9OtLoCfmi0wfZtkAZ8jrW7i9SsWT6BdPU6LzH
         2cUZTkNOoV7bwDr/RDGlg9QKB5kjiVjLFNg/yPxWtBigV+uk1HRgynFlHzwlRJ2Huu+K
         rFYr5ytHYN9Xkh44thS8gvYILd/LSNT4vps4vEji7/n4FoVtB2veC/hErIE6AHuLc5NW
         rKht2WNqigzn1JAaeUCgptF+MEhWvywoqfn6KvXp6oyZ0Rq+zkinhdeiJS0xWRmD/h8w
         mAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ev7jjsh9Nmr0LRpcRvQLdJjaZQoRj4CtThapvJLKxEk=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=Pux+qNarFnL5orWYN+8p365oh7WGDYrbH2H2XbVOzSU7JNWCOrVeeekJDP0TbC/UfW
         +H4BH4Wqwp541zdU21At98q+UfmHIP+Oi3W50CtSCdBiR1NGKO9VYsoIABCkWCeiLwoK
         XzcbySTzVbY5MjRKJzzbxESfW5nBopOPAx2ggQJHka5k+e/L57eLQ6Il3RO+/153Nb+9
         VACs1Pii0JcdsN7Fsha1vvHFhRjjaMv56DYFHDJrxArkuFtEkpDrJFFtq+A98deAHF5e
         9HrQSByDKygzpet5ssyYSiAfU5vQERQO6vS8fOGvJgnANF3QVL0UuxlMrZi0uy5NjhN+
         iv2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h/A8ouxr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8ee04afe8si12390196d6.124.2024.12.11.08.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h/A8ouxr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPe3-0008OH-B6; Wed, 11 Dec 2024 11:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdG-0005JO-80
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:16 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdE-0001ON-1y
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:13 -0500
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-46761d91f7aso34842251cf.1
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934731; x=1734539531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ev7jjsh9Nmr0LRpcRvQLdJjaZQoRj4CtThapvJLKxEk=;
 b=h/A8ouxr/2d+OyaRE69M4DRdl8STTDJ/76HRkkwaiErQiiH8imMBesyMF++DruDstO
 8pXdhoZJOS0dmtrFcvVAuMkeGTjQuISxlgmYu9bTiL2loIAVuQaVX/ThJgg3mY8ByPW1
 zD0DpSepRLOneT5IqtKQ4sVzg2DlSOC1DEoQG/j9UHzrJ1iJL7taDxpKjtd0sdveE9Lb
 fCqXQ9R/XsH/NoE6lnKTfibflq/uluCBkDChqWrQ/NS+KfHwayFVTwz3Qzr/n2U/w6AX
 N9AXFlt6iGr670kuZTU9nscBZfn9OQYXa68GHPNwlvb8GZ6keDumsgqHYAHYCaNh5d/8
 4Crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934731; x=1734539531;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ev7jjsh9Nmr0LRpcRvQLdJjaZQoRj4CtThapvJLKxEk=;
 b=eemKjaW6/3Is8MHTJPfdTN1750CDlqxmOjFJ9vOPlhB8DNOIfMmrtIf+nyXTUBUskw
 bxgmw15mwZwKZMocOikOkOHsZKbrY1m5T7+cXxSoQ5iEDFyp5+iZGhgtoqoP2+LuP3pb
 57LsqObKL86lW5H2X2fn8L2ZMDyIXZtifX5gMLxEhwAfoPi/rRrhKMs8uqINcfNVyOJl
 L6MFV0EgYGW6Wy4ehoue60ZnkRyMePZLpGEgMyj1d1kIiqLZhj9DROp/C4dyf4LVUdmS
 m4N7GStEFoC6BfmFX1ovbcW9l788dVtwIR5F49GYj9tzQ3Cp9Y8H1kdI/TicXt/y16sY
 pepQ==
X-Gm-Message-State: AOJu0Yzys0qtLQwL2DOs0OWYcNrV0anlGPd2C9+xCBP17vnRNeykEkYh
 zLw2G32LdV0tXeYEQFCG2QWSAsiJkxqmttyKSngbq9ObsGs4ZxtrGsJ4kBpXB4QW4cfgjvcO50I
 ufNaCmK/n
X-Gm-Gg: ASbGncugdbUnWsCwNjfQuJcV2pE421LnFQonAznsxDJHxq39AD7JtBMWQDmq0EzhYnj
 voKH80Nf4P0I21qVLzhhM4qomkPU3HdzCR0U2kTTTHmb85X56omCpWI74mqG8GWhSW1NCG4vdTt
 7Pomt4fbu+sdlIy1se/NzFlI+It4EA0qR13HMqIJoeGJ4z/Thish5k692iSeWF6on45JbjjSxAj
 kStYkMgS/e5sCvaBtFA2Mj7EJQPWXNnumi8rQWD2Wu7/7HGcOnzvzkTles9zA==
X-Received: by 2002:a05:622a:2d2:b0:460:a928:696f with SMTP id
 d75a77b69052e-4678936d296mr47606581cf.29.1733934730964; 
 Wed, 11 Dec 2024 08:32:10 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 26/69] target/arm: Remove helper_sqrt_f16
Date: Wed, 11 Dec 2024 10:29:53 -0600
Message-ID: <20241211163036.2297116-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: B4RrYk0+JAJp

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
index cfc73b8506..2a5cb70475 100644
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
@@ -10978,7 +10978,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
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

