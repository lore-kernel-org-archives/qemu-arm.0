Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA04C5AC67
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 19:16:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtrx2-0002H8-TN; Tue, 11 Aug 2026 15:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtrwy-0002FU-LA
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 15:15:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wtrwv-00028R-F0
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 15:15:48 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2cf52d15d88so3073945ad.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786475744; x=1787080544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GRr6PoGrupLvbrBJeRkZc+07SX85ytBRGcRUr5gqRN8=;
 b=WH9ld1EEBkTa4kLttHBd4zp5fSI9u5h5IOfBwn0hWc7WcP2mtAiMBe5JdWmKQhAhJN
 WqbRYjrq3eEoV1ccaYeVy2IKhFp5wKw2pAs4O2omy+c0lYAiLT44T6AvM90XNjF2RlP1
 EMnI8m8OuvjCyRtLa2VHUfetQJfiwqyttROxrntvJzaxyRnmqoPMRJ40MAaLbeFn/s9M
 YP9VZQpWr6OXmdBgMjKOAlOjoYCjFQ1hgRzwcBIJrakc7JudwKHYbYTvSERmPqKSxGI8
 UdArEV/mzAE+CMIrJS79pS96y3nhqpuSX/DRHjI9DhjJ+jE9719WvXvR2QXgAPyLp1kE
 pU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786475744; x=1787080544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GRr6PoGrupLvbrBJeRkZc+07SX85ytBRGcRUr5gqRN8=;
 b=Nlvj3yUHx1ZYuX1ne9j2e8kfTLuC1rDTSC+auGRQOt7csUdZ5keptj562nmHYiyQms
 XS0L5PWPcD8vsT+XXA7pnLa1H5u6RTaGDARKg6iV8U8MOclsn0J8gV7G76vuwFVSBHSY
 l1zcbcjwycA3sq15ePe+c02liQ9Tx+VGnVcCtC6NpCY2ULSTrt75iFJgnRlaMWrR7IfC
 wlfIS7fZzqJSO8EpUAKJ/d9u2uhLpJv4vGqaufGSowe3IE+PdmgOc7sFCnCXEFQU02Xa
 3VWW+zZ2E1dTJ+fsnicbdJoo+DwQnrPaTBMdIySoT3QQVIygjz5y/pD0JtvmVJnnSXsI
 7I1w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrqEBhJO7G3d+1GtbSqGBXA4BsTO1ofkcjMOOpEOQYf6eFsSLlYFt29XPJRSQ9n15wV4VX1zoju3w==@nongnu.org
X-Gm-Message-State: AOJu0Yz7F5NAxaAe+qer5lFfXuiu9NfnMM4G1cI2VlA/+xIU6Di9ZErb
 EfkWrkYCd2zqJOsYPVryLT7R9jAFweuN86vsps0mnJmt/QFddBzJC/odRvxJheTqvgrXpUl9ptr
 t3U6A
X-Gm-Gg: AR+sD11AQDZQ28Z8t4fdAQa+J2iLda3GC6MtFJJIdLo9MwV3ay3Zo9DFozmia5+9fQe
 nk7oAbjFZ+7I0Rbfe0+sRAUkueE7tKjeJ65cM7veUf4fisSy9lgCvizm64K29X31idWsyfCbU9b
 tYHBdwxTNZm1NBYOLtDtw4e0hPpmTwjRKo8bsBF7YJjB+KRn3tzgexZQp8lJi/MOmrX9hqMMZ3A
 g6GtReRFJYWI4kOQvHo09HQ6tijdUZZpd9T1cOLDRpzOqc81kIuRbW/hBDlpf9PKE0oUg6cZ9qP
 s3AS6iYpwf9qScr+saZZyYUekhFZ6aXOprqg5A+j4NFPmKMrPQ2/PsD4dJrTBtyl/1n7Wu2dJmP
 88NpdWN5DzLm3X/G7muh2FsEhx2hKiOtOe53R3Z10J2ExPclD0zg7EXgAmv7WXCLohpiNWhSR58
 Kk2a/Q2Lp5xk3EIWiFeG2bEC/UABZ2hS4jg/nqDZSLOhsn8jUtoMbIjA757CnFmDJI3CaXOLi7x
 hH/vHEXbLIhhgR011XEoArQNBRiClQ=
X-Received: by 2002:a17:90b:1d44:b0:38e:6dd:a9ad with SMTP id
 98e67ed59e1d1-392ec11ef75mr5977312a91.0.1786475743665; 
 Tue, 11 Aug 2026 12:15:43 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-392f97fc409sm209668a91.1.2026.08.11.12.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2026 12:15:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yang.yanjun1@sanechips.com.cn,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/3] target/arm: Fix SVE2 WHILEWR/WHILERW zero diff
 boundary case
Date: Tue, 11 Aug 2026 12:15:39 -0700
Message-ID: <20260811191540.79882-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811191540.79882-1-richard.henderson@linaro.org>
References: <20260811191540.79882-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The trans_WHILE_ptr function incorrectly handles the case where the
address difference divided by ESIZE results in zero. This happens when
the address difference is less than ESIZE but greater than zero.

Fix by dropping direct comparisons of op0 vs op1, and instead
testing the scaled diff vs 0.  Merge with the bounding to the
maximum vector length via wrapping arithmetic.

Reported-by: YanjunYang <yang.yanjun1@sanechips.com.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 38 +++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index fc4cc8c479..0becef16a9 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3697,7 +3697,7 @@ TRANS_FEAT(WHILE_gt_cnt4, aa64_sme2_or_sve2p1, do_WHILE,
 
 static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 {
-    TCGv_i64 op0, op1, diff, t1, tmax;
+    TCGv_i64 op0, op1, diff, t1;
     TCGv_i32 t2;
     TCGv_ptr ptr;
     unsigned vsz = vec_full_reg_size(s);
@@ -3713,7 +3713,6 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
     op0 = read_cpu_reg(s, a->rn, 1);
     op1 = read_cpu_reg(s, a->rm, 1);
 
-    tmax = tcg_constant_i64(vsz >> a->esz);
     diff = tcg_temp_new_i64();
 
     if (a->rw) {
@@ -3723,25 +3722,36 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
         tcg_gen_sub_i64(diff, op0, op1);
         tcg_gen_sub_i64(t1, op1, op0);
         tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, diff, t1);
-        /* Divide, rounding down, by ESIZE.  */
-        tcg_gen_shri_i64(diff, diff, a->esz);
-        /* If op1 == op0, diff == 0, and the condition is always true. */
-        tcg_gen_movcond_i64(TCG_COND_EQ, diff, op0, op1, tmax, diff);
     } else {
         /* WHILEWR */
-        tcg_gen_sub_i64(diff, op1, op0);
-        /* Divide, rounding down, by ESIZE.  */
-        tcg_gen_shri_i64(diff, diff, a->esz);
-        /* If op0 >= op1, diff <= 0, the condition is always true. */
-        tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, tmax, diff);
+        /* Saturating subtraction maps diff <= 0 to diff == 0. */
+        tcg_gen_ussub_i64(diff, op1, op0);
     }
 
-    /* Bound to the maximum.  */
-    tcg_gen_umin_i64(diff, diff, tmax);
+    /* Divide, rounding down, by ESIZE.  */
+    tcg_gen_shri_i64(diff, diff, a->esz);
 
-    /* Since we're bounded, pass as a 32-bit type.  */
+    /*
+     * If diff == 0, the condition is always true.  Also, bound to max.
+     * Simplify
+     *    diff = diff ? diff : max;
+     *    diff = umin(diff, max);
+     * via
+     *    diff -= 1;
+     *    diff = umin(diff, max - 1);
+     *    diff += 1;
+     * via 0 - 1 == UINT64_MAX.
+     */
+    tcg_gen_addi_i64(diff, diff, -1);
+    tcg_gen_umin_i64(diff, diff, tcg_constant_i64((vsz >> a->esz) - 1));
+
+    /*
+     * Since we're bounded, pass as a 32-bit type.
+     * Sink the diff += 1 from above into the 32-bit type.
+     */
     t2 = tcg_temp_new_i32();
     tcg_gen_extrl_i64_i32(t2, diff);
+    tcg_gen_addi_i32(t2, t2, 1);
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
-- 
2.43.0


