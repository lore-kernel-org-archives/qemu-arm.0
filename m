Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1540587ejb;
        Sun, 11 Jun 2023 09:03:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RKblKQzLp0Ykw4pobdOj8Ba+ZyVi8S0+bXSGa7kTxyLrmEKM23NNheUcng5S5fnhQPcKl
X-Received: by 2002:a67:f617:0:b0:434:8401:beae with SMTP id k23-20020a67f617000000b004348401beaemr2666958vso.34.1686499398770;
        Sun, 11 Jun 2023 09:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686499398; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3h3LnY1WTt2zn/qRq3axg/lKDcwPDwNz4oYBhKC03uMK0o8DM51YE2LRnq1jVe95q
         jWtYZiBo2h02bxsU9m2wr7m4zf+9s33KVHiyDIy1SvtKNOM8gJoQVeyXkAl/NMFMcfy5
         SqG/kXiaHwxToikwqy63/0ksncsSVMqDhJ5DSM1m8xafbYjsdSkisakoqT1VhZz45ZuI
         aux/S3BEfhp5LGx/aeoNYyjImUK7skys8Z3W79sfn8/PznKQg1sn92698EpDD/LBF+7z
         9utDtQV00yCJrQdBZDqr0bb4Z46LX8SME4m7q/jymw9ZFrn4xIv65Go3+srAuAN+UUvV
         BVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bzdwcdEJDH3+9LvIk3s+qDKAfWLrlUNUbth2GVMBPBg=;
        b=O3TaoWxjtp8m54521ssNYnYlNOQdIrl6J528rubLjZvyJdut/yobQkRs9PdiSE83Hj
         R9yXzF63eu5FLIf497Zjcyd5d0YvjfJUAAIABxpVd9Di3ptqhKfko9BuyvMNxdYnauGa
         CfHg4/PBsjTb4TCtTHM7wN/3OMyOi4p13ZAITzJplx9PsHRXSPktpzh5ZPTuqfGPDbrw
         kHh0MMXPsZQvU/40Yrj/F93wJdhDpTT1gXnGA0QQ7IQA5YE3bNTKAB2FJi3ucaMCXGGc
         t+W6VRs5VdKW8vXdGz5GoQ33mJn3ml0Sewo65jh90DiIWe3NPx9O4ttFxVbIEOO0QTZc
         D3ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TP5j7R5a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19-20020a056102081300b0043634dac341si480545vsb.807.2023.06.11.09.03.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 09:03:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TP5j7R5a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q8NVl-0006hy-Ka; Sun, 11 Jun 2023 12:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUg-0005pd-9t
 for qemu-devel@nongnu.org; Sun, 11 Jun 2023 12:00:49 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUc-0000Rc-7G
 for qemu-devel@nongnu.org; Sun, 11 Jun 2023 12:00:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30fb4b3e62fso538283f8f.2
 for <qemu-devel@nongnu.org>; Sun, 11 Jun 2023 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686499236; x=1689091236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bzdwcdEJDH3+9LvIk3s+qDKAfWLrlUNUbth2GVMBPBg=;
 b=TP5j7R5aWCmSlMxWZ53YfX5KXxqW3flVjsON8OnwCjLZpE//x8roiwKhryCBXwIJb/
 XMhbXLdbWXjNoNZ89f/8e+azDA9j8sU3KIdjLhktrd5yHEbb3Zrn43BGOCLW4vObR/oS
 pfw8XUESrbiXw0G11nt/0BgNtAJ6DQAAg+3BhNTHjcs6lxypj+8jhGkL2xykJL0iAkn8
 i05Fesl1auCcvCN3PgY68YCOGmmTypivdUbHp9cTiTgzRFR5Xf6IH5okbEmry+QAENiy
 /de4o+IZP3Od551fSMDL6vnBmpFrzAkVr/Hxx3Dt+uccgFrLpGh4ASyvOFTtM5f0qahP
 g93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686499236; x=1689091236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzdwcdEJDH3+9LvIk3s+qDKAfWLrlUNUbth2GVMBPBg=;
 b=PYAWVy9MpxvUUDyi0VtDWwFrF4prddDU0n2JdO1tnc4MEJ69rgi8gqB6BRo46/5nK5
 mz4hk4OZzxpQfCt1p2dohFgH+yiJZmBZXb0tAetcadT0iIiXgN6zyEUNk9Ydh61+0pqY
 Tv/5x5MCMe+aW1HHNzOYxwf81KedsHVsgnZ9uRLa/+zglqovZamykJnJ/e3evpTwCP+h
 tOQQ4WomOl06u583fgabSgtOIR/Dn2jK1dz+dDnuuvbMYIaEpV9iXbFHzRAV8Ek2ilCZ
 x0d4X4KJ73QMoWd0RP6MayNU5Az68IJQPdNRHJvjJT2KEOjMZLMxQBEPeo4QJeHPTS8p
 vDZg==
X-Gm-Message-State: AC+VfDwxoh2dLzVi/SlyYhU0ksFlCKgU8tHW/AC2hYR1GtlVD/KmYO5W
 b5CVjxHNrDzFIbFkjS8u8oDYsi5WysLJoLH3SpE=
X-Received: by 2002:a5d:4acb:0:b0:30a:e542:c5c9 with SMTP id
 y11-20020a5d4acb000000b0030ae542c5c9mr2685698wrs.24.1686499236055; 
 Sun, 11 Jun 2023 09:00:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b0030ae499da59sm9923022wrx.111.2023.06.11.09.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 09:00:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/23] target/arm: Consistently use finalize_memop_asimd()
 for ASIMD loads/stores
Date: Sun, 11 Jun 2023 17:00:13 +0100
Message-Id: <20230611160032.274823-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611160032.274823-1-peter.maydell@linaro.org>
References: <20230611160032.274823-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: asqdyA0Cyqvd

In the recent refactoring we missed a few places which should be
calling finalize_memop_asimd() for ASIMD loads and stores but
instead are just calling finalize_memop(); fix these.

For the disas_ldst_single_struct() and disas_ldst_multiple_struct()
cases, this is not a behaviour change because there the size
is never MO_128 and the two finalize functions do the same thing.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d271449431a..1108f8287b8 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3309,6 +3309,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
         if (!fp_access_check(s)) {
             return;
         }
+        memop = finalize_memop_asimd(s, size);
     } else {
         if (size == 3 && opc == 2) {
             /* PRFM - prefetch */
@@ -3321,6 +3322,7 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
         is_store = (opc == 0);
         is_signed = !is_store && extract32(opc, 1, 1);
         is_extended = (size < 3) && extract32(opc, 0, 1);
+        memop = finalize_memop(s, size + is_signed * MO_SIGN);
     }
 
     if (rn == 31) {
@@ -3333,7 +3335,6 @@ static void disas_ldst_reg_roffset(DisasContext *s, uint32_t insn,
 
     tcg_gen_add_i64(dirty_addr, dirty_addr, tcg_rm);
 
-    memop = finalize_memop(s, size + is_signed * MO_SIGN);
     clean_addr = gen_mte_check1(s, dirty_addr, is_store, true, memop);
 
     if (is_vector) {
@@ -3398,6 +3399,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
         if (!fp_access_check(s)) {
             return;
         }
+        memop = finalize_memop_asimd(s, size);
     } else {
         if (size == 3 && opc == 2) {
             /* PRFM - prefetch */
@@ -3410,6 +3412,7 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
         is_store = (opc == 0);
         is_signed = !is_store && extract32(opc, 1, 1);
         is_extended = (size < 3) && extract32(opc, 0, 1);
+        memop = finalize_memop(s, size + is_signed * MO_SIGN);
     }
 
     if (rn == 31) {
@@ -3419,7 +3422,6 @@ static void disas_ldst_reg_unsigned_imm(DisasContext *s, uint32_t insn,
     offset = imm12 << size;
     tcg_gen_addi_i64(dirty_addr, dirty_addr, offset);
 
-    memop = finalize_memop(s, size + is_signed * MO_SIGN);
     clean_addr = gen_mte_check1(s, dirty_addr, is_store, rn != 31, memop);
 
     if (is_vector) {
@@ -3861,7 +3863,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * promote consecutive little-endian elements below.
      */
     clean_addr = gen_mte_checkN(s, tcg_rn, is_store, is_postidx || rn != 31,
-                                total, finalize_memop(s, size));
+                                total, finalize_memop_asimd(s, size));
 
     /*
      * Consecutive little-endian elements from a single register
@@ -4019,7 +4021,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     total = selem << scale;
     tcg_rn = cpu_reg_sp(s, rn);
 
-    mop = finalize_memop(s, scale);
+    mop = finalize_memop_asimd(s, scale);
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
                                 total, mop);
-- 
2.34.1

