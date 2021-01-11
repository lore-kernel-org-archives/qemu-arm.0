Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2940203lfq;
        Mon, 11 Jan 2021 11:34:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzegTO4y1dMuiH0+hTxqCZTw2obbSfnyWtApuY0WDxjfohWezNhApctxbnv0Iy/BINkn6kY
X-Received: by 2002:a25:b444:: with SMTP id c4mr1682283ybg.481.1610393658356;
        Mon, 11 Jan 2021 11:34:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610393658; cv=none;
        d=google.com; s=arc-20160816;
        b=dkzDTe5DAHR3isgzopWSi0tKk/7nYme3mYXEwlcImVdbhlGn4hTkkRRCXWahRjh6QA
         Vc6PWyYUxbT2OLeTG40ySiXohT+UK84/UWxGcKBwJwdkHmTDJMR+S1cyyYNKCNW+b07g
         5lDbw4NiOzYuJcHgbS6pBb7X3/7uRqpdUa1+Rnv1GZ5AioP23Hy9U4rSv2pW9xN/irKD
         dHao2uq3jGLaUf311rmMqz/DQtpheSPKgPSUIXXFGJOGh8E2xZssCTefiGBZ565IQ4e6
         dvWQRZHIcDmAfq9KR5A3YhHc3j/+l94Jm1hVHh7u34M0yMxO1lUB3uMIiWC6oFNPt3rp
         FEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6T/o1lhn6aSUmH+RBGXbRyAbXaPSiwSZ8/GJte4+zxA=;
        b=G/vFwHYoy3/3tUDedR0oGXzq+4k34CcsEKMVihSu9VSz0ew25j//rp00kL2T0DXVq8
         44VdnADoiRXt3n1WbKY+XZtRZluAe96mzMyLIGqu/CCkYNImJjcvNOH4a2StvjLm7HGV
         ctgHQcBK0bfZgFr1iGcXYriq09SX9qf0GioUYbajoa5V0Rq311oSjERKDnJzlub9Ld5t
         M1LQLFyVYw/HePoRO3DJbu1q254HabzNWp82lBthP8IJ7CRRi3xBRv66tEh7akQXFIsM
         lVNA1vF7XxuE8+Hz8LoyL9+JBIp+Y6tQj4wMIJgpz0ZjIuPopC6krs82tIOkkx9z+sP5
         +uKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=veqUcAfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si614402ybc.421.2021.01.11.11.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:34:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=veqUcAfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2xF-0001hX-Ll
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2SF-0006Th-5s
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:02:16 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2S8-0006YU-Sx
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:02:14 -0500
Received: by mail-pj1-x1036.google.com with SMTP id n3so335059pjm.1
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6T/o1lhn6aSUmH+RBGXbRyAbXaPSiwSZ8/GJte4+zxA=;
 b=veqUcAfEKkOdgtGBmuxzfqqRywgKTkPGA58D/I4uIREHkWRTNhXWIbQdVsaYk7Weso
 BTI5skZEBoGn6csTSbu4mPIDOoODq5MlKNpz+HNSh+aZWXcGXHjK86pCUXTyILN2dVoG
 d854M+WbOVXI0QIoeJi+9ns8uFNrH1akYRqTKX32cY+N0g9h4QuHwecHT7iOpn7ulc70
 hUrcdVm3m44YH0yK+FYUVwmHcKuk4LcEfxQbsf1TPhbxPqEguzwBTXGC7FWzyt/6YEAs
 MBiQPYY+G367ZDMGeosMICT/xKDIwv+4sOfUK9trWKHspzcCLoSnGTmdiQWcC5acCUzd
 06OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6T/o1lhn6aSUmH+RBGXbRyAbXaPSiwSZ8/GJte4+zxA=;
 b=uO4u86xaHNuEghQ2cXEGJxttozEdB/77USK81FBZE7HqKZ7eDquzAarRiZXNGRlYrR
 aWIdmfCs+FR18Z8U3UyW+odgWN7pCX4qq28cnuutzKVa4pXseEYk9FKXvJA4uEScojcD
 2Ta/IGD8P+tIyjlkdIyEYm68oT2yHzyD78VI7ZKvl3xZdmeQF+jcdq40MiS/gYEk5fSc
 vzIpu4NctocfXgsgjEtLCSVM7T7BMQ30pUUtcMCocX0KPu2VitnJPUwad94yPldcsoaQ
 LA3ELioD58FQYFAUZFcAQA8vgVdZm0bFEEqc7L2ykzFld35Qrouf8rlV2vqtdjDI29hp
 7sbg==
X-Gm-Message-State: AOAM5303aPY+2ogYVKgoS6Nws0GvkPEMnT5m98xaJMN0p+Vfiv3AyXFR
 yDkF7Qa3qSvmZks1cYwhyt4TZtOAnVBm7w==
X-Received: by 2002:a17:90a:e64e:: with SMTP id
 ep14mr279189pjb.5.1610391727352; 
 Mon, 11 Jan 2021 11:02:07 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:02:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/30] target/arm: Enforce alignment for aa64 vector
 LDn/STn (single)
Date: Mon, 11 Jan 2021 09:01:12 -1000
Message-Id: <20210111190113.303726-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uVBCjS8vgD2t

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7765c15e0c..ec8e488b11 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3786,6 +3786,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int index = is_q << 3 | S << 2 | size;
     int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
+    MemOp mop;
 
     if (extract32(insn, 31, 1)) {
         unallocated_encoding(s);
@@ -3847,6 +3848,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
                                 scale, total);
+    mop = finalize_memop(s, scale);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
@@ -3854,8 +3856,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             /* Load and replicate to all elements */
             TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr,
-                                get_mem_index(s), s->be_data + scale);
+            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr, get_mem_index(s), mop);
             tcg_gen_gvec_dup_i64(scale, vec_full_reg_offset(s, rt),
                                  (is_q + 1) * 8, vec_full_reg_size(s),
                                  tcg_tmp);
@@ -3863,9 +3864,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, mop);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_st(s, rt, index, clean_addr, mop);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.25.1

