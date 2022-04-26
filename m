Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp364236lfu;
        Tue, 26 Apr 2022 09:44:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6N+S0fG1sUHhwnlF3n93X5otCSKl17hDTio0Nhar5eVOZhqlZetMfHU0ZWuqxBwVMf3Ux
X-Received: by 2002:a25:a0c9:0:b0:647:36b4:d149 with SMTP id i9-20020a25a0c9000000b0064736b4d149mr16389996ybm.405.1650991451623;
        Tue, 26 Apr 2022 09:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991451; cv=none;
        d=google.com; s=arc-20160816;
        b=EGpKzRikGy9fnAmSeVpqDAxUDVGzAT3USxcajIrZ1b/RB4EYg9IpOoy4tBxPd8YiX2
         BEbov1+j/PR1BCP2h6uA9SufPLLQtLlbeEZRGxHSyOGDs7soaz/LYijVGCwklhIFl2AM
         z8K3l4mhwJTYx1Dy9KP94G2oCt7hR7SUzl95gE9m0G5w4V/ZbuV+Z0Ab2ElDjo9l5+vZ
         WMaqEx0sRg+9klVkdMDVZ/qAaqrCfbxzM8kKoQxAEPC2RdOETHHMZZ9hrcBInY0cAn15
         qucgdMOTWnUIfPCAeTNAYOpD4KdFuqh4ZtDzEpdiYwE62/dgU0s4+uBlURi/4h4rVtnc
         zPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6bRLZdi3rldJQhxVk4t5p5Sfqgb/tmNaqa3IEpWhsOc=;
        b=aSJA72GvYi0s/A7gRL7GYsVNAGdnF1WZB/Bd1YFEfDCKs/kl8k9RhSj/+Nv90mAudo
         Zjo3D9dT9dzGC0Fh06CxAp0oHlJLfpFXPDCUU+LIugxKwLPBmk21R2k5D8yrWjS0btHC
         ZBMAlfTxV22akIhllrJEjnkV4W60tGgdCsUsc4Jk3bcCvD0cOZOMq4GPFODoeLJH3aI3
         LJli4U9ck5bS4k0yblMdowxi024KIIfU+tpAIa4cq/GfEaVcIc4g2QZUegPcB/kxzIiG
         Cugkv/7u0lgfeYHvo6zXptlX68dkI+VLpd4zAD+RQ9Eyplzw+1933u4XWXZ5qKfSNEsn
         e/1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SuluE+jO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k202-20020a2524d3000000b0064851b6d093si6346313ybk.695.2022.04.26.09.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:44:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SuluE+jO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOIM-0005sk-Tj
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5g-0002xh-Mk
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5c-0003nn-NV
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:02 -0400
Received: by mail-pg1-x52d.google.com with SMTP id z21so8847119pgj.1
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6bRLZdi3rldJQhxVk4t5p5Sfqgb/tmNaqa3IEpWhsOc=;
 b=SuluE+jOKC5WdzeZb8Mte6IGipsin6nP9M27M2XIMGQ90nUiRqjHg/lZGgIKEm85cv
 TrdkU2GMCjc3gQ77qjkHd4vOqRgxpApMkZ2qoH5a6QiAecA/4B1+6mmVaH/VM1ty8opM
 xcj/yBSYQNlt4MGUMGo3c652UI5ZuosNreaeGp51KSvepyZW0KGJ5vF5/nXqGWgCGTVY
 dtqPoV24XTVi5iGNXTAORXCECVg9kuCN0xGogKqixYtKDf7kw0T5XPyKac/joBeVDfqH
 2i6dJMvsg5qXqhjORIJ/JLLjwZ1jEaCwCv+v177KDVYnA23YhOw9fw1v14bnZI271uMS
 8dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6bRLZdi3rldJQhxVk4t5p5Sfqgb/tmNaqa3IEpWhsOc=;
 b=13Jnhunexnrr2jFWieRXkSYlNNNSOjCzYk4a0P9u+Wbt5oNlCNgQS+BFDkaI+SKsD+
 KhfBw1J35asOy7cF5bB7yFV1KzX7yQ/n0yFg+RYExJc9tXw8wtuQKLBM0H2iJYLev/0G
 TaXALEhuCNhyKSRxbJk/iClu+AL/iw8EGLX8Eut5Og4BSzBr+/7FCSrdO74XwV5kLynE
 vOh5kxQnoaWjnVFgImCHYc1+LLDszWm7QtLTHZOkidXALj7mUUpR4m/iKoiCqidA5XqP
 v0Oxm7cJ9Djn5CoWVlQGva/sW/2ySe2jeRSLn/pGiaJHe0j1i2CDfx09jJqbLm7qgkDW
 6uXg==
X-Gm-Message-State: AOAM532xABJXa6fJbyY3lNS87vCZXqM56M1BkspCWO6cVeS0kSKAYDSr
 FvyMK5RTcvrX7ENJR3V5VcgSCcqiTPC4VA==
X-Received: by 2002:a05:6a00:2d0:b0:4f4:1f34:e39d with SMTP id
 b16-20020a056a0002d000b004f41f34e39dmr25116632pft.14.1650990652986; 
 Tue, 26 Apr 2022 09:30:52 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/47] target/arm: Use tcg_constant in
 gen_compare_and_swap_pair
Date: Tue, 26 Apr 2022 09:30:04 -0700
Message-Id: <20220426163043.100432-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R1xOQoPwNO5F

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 68e3b5c1f8..af6844b4b6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2523,7 +2523,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         tcg_temp_free_i64(cmp);
     } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
         if (HAVE_CMPXCHG128) {
-            TCGv_i32 tcg_rs = tcg_const_i32(rs);
+            TCGv_i32 tcg_rs = tcg_constant_i32(rs);
             if (s->be_data == MO_LE) {
                 gen_helper_casp_le_parallel(cpu_env, tcg_rs,
                                             clean_addr, t1, t2);
@@ -2531,7 +2531,6 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
                 gen_helper_casp_be_parallel(cpu_env, tcg_rs,
                                             clean_addr, t1, t2);
             }
-            tcg_temp_free_i32(tcg_rs);
         } else {
             gen_helper_exit_atomic(cpu_env);
             s->base.is_jmp = DISAS_NORETURN;
@@ -2542,7 +2541,7 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         TCGv_i64 a2 = tcg_temp_new_i64();
         TCGv_i64 c1 = tcg_temp_new_i64();
         TCGv_i64 c2 = tcg_temp_new_i64();
-        TCGv_i64 zero = tcg_const_i64(0);
+        TCGv_i64 zero = tcg_constant_i64(0);
 
         /* Load the two words, in memory order.  */
         tcg_gen_qemu_ld_i64(d1, clean_addr, memidx,
@@ -2563,7 +2562,6 @@ static void gen_compare_and_swap_pair(DisasContext *s, int rs, int rt,
         tcg_temp_free_i64(a2);
         tcg_temp_free_i64(c1);
         tcg_temp_free_i64(c2);
-        tcg_temp_free_i64(zero);
 
         /* Write back the data from memory to Rs.  */
         tcg_gen_mov_i64(s1, d1);
-- 
2.34.1

