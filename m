Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp373934lfu;
        Tue, 26 Apr 2022 10:00:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwk4KJcZaATh+Ab7lhCVQ9ISyjPe/rXykgjD45a+Tq2oNzjkxSXWLQHraJeUubVsB0Q3oWU
X-Received: by 2002:a25:80c1:0:b0:641:8d1f:431 with SMTP id c1-20020a2580c1000000b006418d1f0431mr21660914ybm.486.1650992417075;
        Tue, 26 Apr 2022 10:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650992417; cv=none;
        d=google.com; s=arc-20160816;
        b=jQQ0lGCiJK1tuIJA/io1p89R/ThaqCBGWQndDfv0ZlYdruyQUKBV0Bo/IemiWoJ/rj
         LqUKUDOiyr89fSe+ruDbuY72g20GQMWxFEBZE0ZVvUJiTsmMxRrQ5XtrDT4KAJTMXkF/
         lcyBOA5sdadtBgBzGhQhJlS3gKjHvMaZMhdJ8beT1H7EOO1eKQ0rx2dwSgIW1myyfEde
         O9KI7+BTCg4htfzPP1s3XKqm0ujsAoUK97CmNrbdUsl28HdL8ypp6FEl6mEeYa5atPok
         JVlwliN3VNWQ4KeVfljTkQVFf0trpqbl7VIAt1DWQmIAgBjEImpUb686Osb5yP04siwQ
         TARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uvLyVQbuChfsfEoCGl+dZ58evyiN/bZiVeu1vrYZOeg=;
        b=tbfau1TZHmFlGJXn1m/FT7KW5eO9gA8FACtw/l6ivne+8D9lsx2R5sAHPXbuopKTtW
         RUSCZbr7NhCxV+1nD8y7zJxJ/V06Pi7sYxkq2PQRvwdLZvFbXaA5P+jBR7b2AdAJEMiF
         TvKf1NsEnUX6+duZS1tYEXrnhf2JzTYbkliT7wNuFsX6gyJBq5y7MWUhP5Fz+rPQblK8
         xf4u+jkpdo7y7/1jUKSG+Ymqo4XlHSqFU1rQ491wWwXiF3bwBCL9eXFVPNpcZdYXNSUo
         SzCd4dxtBdzV8fbE7fpoBVuIcWpeU1VrRTBOlM8SEiEbtQKgr1A+MZDZ+LvlOsD49lvV
         09cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOYKC2zt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s21-20020a257715000000b0064885b9d2fasi5340024ybc.523.2022.04.26.10.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 10:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOYKC2zt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOXw-0008N6-Ej
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 13:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-00035c-74
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:21 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5n-0003t9-VC
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:15 -0400
Received: by mail-pl1-x633.google.com with SMTP id d15so30708250pll.10
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uvLyVQbuChfsfEoCGl+dZ58evyiN/bZiVeu1vrYZOeg=;
 b=dOYKC2ztJCmDPEVmIQl03djyFF6hrcJw3Rw+KDtxYsJuJ+PjTIyiCfGQZOn5MXv6Ba
 HPMCaD+l+d50Wa7N17F/ok0h4/RwCdLOjeVZ3AQOlkzwa+ns9HXJZZKnY5g+XOILPO8M
 cPx++gjlwPdjnkX67mnwmZwm5YepjXfwoX5ocrESlCz6yZtvhercVtKZI6rwCijwEjik
 +hN7LkMfdL3MLDU7acw9SpcYXmRxsYKpD13MM0zDNYLRg7jiLHz8SCFJv/qTxkan2aEr
 cZbXtbGepaos92LBixShTixt1TbuJn4HLAIXo/pTiNEw4wMlNZ9uqrNCkP4O9+Qny7yI
 /9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uvLyVQbuChfsfEoCGl+dZ58evyiN/bZiVeu1vrYZOeg=;
 b=z31EVPqTYmV65qrYCi9TEHosGGxSQKdarDIzJWQ3dg3GtabR61s2VgUiSXdj4yB9z+
 iV3DoolPrBy1mLQ7kcajfuWpW9hEgYTHhCjENffeI1CI2GXzq6jKMKDOXbmQpnzgPwG2
 GtVuLOV6pTc/1QiOLWd1Gy3A4fe1SNgp7oX2KFMyPl6rip+Q9VkU1kyCNPPtbQvFbYH0
 IWDPJxiPTxogwkFiadtUZSaZRvgQc5MmSTTWXs6gIXwblkK6XWbg6viFcds1nus4WV2T
 RQD4nIdM9WJGS3KgDwDb+MAP0pJJ/vn9/eIMtpKDv8rUCIT6+q8BenxR2CDd5kbbrBqK
 WjPQ==
X-Gm-Message-State: AOAM5323GX71XS58L3z+SLBQtbL2VXHBsUmct/Zng6JTHOE9xUcV4mlo
 0u9vtX1fnsuZAowumNas4yzxgA==
X-Received: by 2002:a17:90b:3ec3:b0:1c7:24c4:e28f with SMTP id
 rm3-20020a17090b3ec300b001c724c4e28fmr39195181pjb.191.1650990669357; 
 Tue, 26 Apr 2022 09:31:09 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/47] target/arm: Use tcg_constant for do_coproc_insn
Date: Tue, 26 Apr 2022 09:30:22 -0700
Message-Id: <20220426163043.100432-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: KHdxaa63C1zA

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 43 +++++++++++++-----------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9539d2e8ca..e4f3db26f6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4689,8 +4689,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
              * Note that on XScale all cp0..c13 registers do an access check
              * call in order to handle c15_cpar.
              */
-            TCGv_ptr tmpptr;
-            TCGv_i32 tcg_syn, tcg_isread;
             uint32_t syndrome;
 
             /* Note that since we are an implementation which takes an
@@ -4733,14 +4731,10 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
 
             gen_set_condexec(s);
             gen_set_pc_im(s, s->pc_curr);
-            tmpptr = tcg_const_ptr(ri);
-            tcg_syn = tcg_const_i32(syndrome);
-            tcg_isread = tcg_const_i32(isread);
-            gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn,
-                                           tcg_isread);
-            tcg_temp_free_ptr(tmpptr);
-            tcg_temp_free_i32(tcg_syn);
-            tcg_temp_free_i32(tcg_isread);
+            gen_helper_access_check_cp_reg(cpu_env,
+                                           tcg_constant_ptr(ri),
+                                           tcg_constant_i32(syndrome),
+                                           tcg_constant_i32(isread));
         } else if (ri->type & ARM_CP_RAISES_EXC) {
             /*
              * The readfn or writefn might raise an exception;
@@ -4776,13 +4770,11 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                 TCGv_i64 tmp64;
                 TCGv_i32 tmp;
                 if (ri->type & ARM_CP_CONST) {
-                    tmp64 = tcg_const_i64(ri->resetvalue);
+                    tmp64 = tcg_constant_i64(ri->resetvalue);
                 } else if (ri->readfn) {
-                    TCGv_ptr tmpptr;
                     tmp64 = tcg_temp_new_i64();
-                    tmpptr = tcg_const_ptr(ri);
-                    gen_helper_get_cp_reg64(tmp64, cpu_env, tmpptr);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_get_cp_reg64(tmp64, cpu_env,
+                                            tcg_constant_ptr(ri));
                 } else {
                     tmp64 = tcg_temp_new_i64();
                     tcg_gen_ld_i64(tmp64, cpu_env, ri->fieldoffset);
@@ -4797,13 +4789,10 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             } else {
                 TCGv_i32 tmp;
                 if (ri->type & ARM_CP_CONST) {
-                    tmp = tcg_const_i32(ri->resetvalue);
+                    tmp = tcg_constant_i32(ri->resetvalue);
                 } else if (ri->readfn) {
-                    TCGv_ptr tmpptr;
                     tmp = tcg_temp_new_i32();
-                    tmpptr = tcg_const_ptr(ri);
-                    gen_helper_get_cp_reg(tmp, cpu_env, tmpptr);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_get_cp_reg(tmp, cpu_env, tcg_constant_ptr(ri));
                 } else {
                     tmp = load_cpu_offset(ri->fieldoffset);
                 }
@@ -4833,24 +4822,18 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                 tcg_temp_free_i32(tmplo);
                 tcg_temp_free_i32(tmphi);
                 if (ri->writefn) {
-                    TCGv_ptr tmpptr = tcg_const_ptr(ri);
-                    gen_helper_set_cp_reg64(cpu_env, tmpptr, tmp64);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_set_cp_reg64(cpu_env, tcg_constant_ptr(ri),
+                                            tmp64);
                 } else {
                     tcg_gen_st_i64(tmp64, cpu_env, ri->fieldoffset);
                 }
                 tcg_temp_free_i64(tmp64);
             } else {
+                TCGv_i32 tmp = load_reg(s, rt);
                 if (ri->writefn) {
-                    TCGv_i32 tmp;
-                    TCGv_ptr tmpptr;
-                    tmp = load_reg(s, rt);
-                    tmpptr = tcg_const_ptr(ri);
-                    gen_helper_set_cp_reg(cpu_env, tmpptr, tmp);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_set_cp_reg(cpu_env, tcg_constant_ptr(ri), tmp);
                     tcg_temp_free_i32(tmp);
                 } else {
-                    TCGv_i32 tmp = load_reg(s, rt);
                     store_cpu_offset(tmp, ri->fieldoffset, 4);
                 }
             }
-- 
2.34.1

