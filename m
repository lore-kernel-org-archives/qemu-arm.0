Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4193775njb;
        Wed, 11 Dec 2024 08:37:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXeOrRsoSGj5pAKgxv30ypf6V7ism9G8njLWIvsx/dIkjjqegwsR8Zi24ETnrHd2nnjOsEpz2ZFfR9UfA==@linaro.org
X-Google-Smtp-Source: AGHT+IEBwuViR5L9HoXfidVUt1wr4xVgopAR6TbFZsGJPocQZAvYRob9njAgAh7Nu/y759DcaZ/G
X-Received: by 2002:a05:622a:5a05:b0:467:492b:617f with SMTP id d75a77b69052e-4678937a667mr78533281cf.40.1733935065601;
        Wed, 11 Dec 2024 08:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935065; cv=none;
        d=google.com; s=arc-20240605;
        b=VqeZfxHbZQlFBMD+VFcRPULcP7bWiKiD/pkHWc5Hkmc76X6tsAdxK0CSsO+W1wVNZD
         CPCWTiSuvRX2jr8oQG3rJJtu9eTK6Ls1COMvZcgLjdxg8d8pUY4/uqKHdiC/Bn34mHGH
         1MNWutk8L5ElDDRn9KEY4rhU71pVntQX7OjzaRQ/I7LyEDns1X75MMg5JswfnGWLV/0Y
         rOWXNSXttPPr3vTtDvFk2BmO0piUgscp5fNOkOIobmEVItWlho+20P/kMcDAACPCVvNu
         ycFXqcihFCpGm4RrLkOgzQ6thQdm8Mmqb+zM+7U3pwQWTAGmxsa22TDsbmUs/VGhSzua
         hP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TmvLC72KaZzM8jiapnL2kS3QqFWjexV3Z72ZJbn8iE0=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=lBEtRtrqCNti8uuTCMmdLR2ZTvoE13G5jCldPC/oQ0JA+W0NVYLFpuGJ0YgCXaHfF9
         zygE6Dk8ibJfe2oGL99NF3DQoybQ6JRaEqpnYsaBok/qT0vYkSnV4etcVkg32FxNrfQ4
         bDpKGecBkPhNj2FIn768AxSFni/w229RJsGfqwRYAw5Hc9dSPlOJN7QyvouvUrsoGisC
         9qN4UBt7IhP9EKt0pFbdA3ErmklPHCm/RyhzlArXLRT7Qdxa9w6m7sn+9IxuW8cCzUqO
         KEwE0OFcuFCQI+meTSVTOIXOHKg5nx/zeRYqOgxNFUQRiXQhHeF5tN/8JYoT1Q3Sfo7i
         v/eQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rTqELhjL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4678547550bsi34915231cf.662.2024.12.11.08.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:37:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rTqELhjL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPdv-0007xU-Qz; Wed, 11 Dec 2024 11:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPd3-0004wF-Sm
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:01 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPd1-0001KI-PT
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:01 -0500
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-46375ac25fbso66464241cf.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934719; x=1734539519; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TmvLC72KaZzM8jiapnL2kS3QqFWjexV3Z72ZJbn8iE0=;
 b=rTqELhjL8kFUn6HcuFGTkO7cYqXG/pAkkeaS1dSZUncvxjxI1x7b5rnqQ9yHIFWXs1
 IrgBVVEbfQ9KkqpSjRfVwEq7eIQk6pOyiEUXNTaMRTdrLahBBE6s9CJhIix7d+d40N7s
 bJLd7zqEmBSX2qVrhv4A9eU66/xHVh+kKVGB3KNKeQp9T7g6XP2lwF4kc/B2GNoa6nYN
 J0WM9yefPRNhSKp+kI/lk2Kx57b9OVOABJpN8M+Hv0XVevoGc3Dxx9rGymtjXhIDpbVT
 IwfqJb8xN+J8hfbtZqusC6dAWN1bQgn3msT1faSN10nqVaHWauPuzGveo9KEvoPMol32
 Vi6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934719; x=1734539519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TmvLC72KaZzM8jiapnL2kS3QqFWjexV3Z72ZJbn8iE0=;
 b=QiVdoeEA2s2biZY8eJ6+DgmspR0NqY32v2lz5RanoZvrj4j60NHSA4A2LqnXTqwWBw
 eJrXXdLy/nGc5Ytm03E19eoQ3CwGAY+Rjtl6LJN6FpaJf2xlYu5nwlJ743EIrPoy+iKy
 OgIri7gbVIy5Wcj0U6oNUiH11Dqc1zNPUVf8ovcZ04G3GcyZVP0cofgqTmQ0gO4x7tVi
 5IxW2vP2kRF3jaF+sG9QjDtmNb4+5yhfrH/tzAqgFGtYWX+Gc5dMtriCtzkDtPqUGIWg
 wDYUJCTgYuIV9WOWMdNm/j73pW0npHksHB1X/h/kN0sTH62e62U5ingoelT4FClk+pQM
 XP0A==
X-Gm-Message-State: AOJu0YwzemnvUevUPfhPMvX/O6mRcav2u/21Bzjy2fFvvuef+QMcXpLC
 DGXKJCj1PsV/kHVT8m8O/OLpyVkloNzZp1tewRShcW2a8uPIvGNM/8mXvwkbXj8=
X-Gm-Gg: ASbGncsaa2MOogssgoi9Rhawm4YqEFmX3g0SA2Wx777xelj3+xnlY+u3qXWPMDm/eRd
 2UDaAQC+VlnsbNaFBl1Jn1ad5S6tJjILQ71IUfCNGoUHxXHGgMTs8mQU5O97sQ+S7saeMykoLSP
 NqrR9MMDVJngPXJhssP7jNWPJDZJAqDBOWhDxvv0CkQomsgjfzkj6DHa8cHPhvMyf02Jae5bOzc
 saQx5clmFJ1Bf17bmgyCl3x818JcLlHcF6IA1Gz17Gs7WUEKuz9d+z+44rZJg==
X-Received: by 2002:a05:622a:4c16:b0:466:a032:dbbb with SMTP id
 d75a77b69052e-46789298f1dmr57776341cf.1.1733934718804; 
 Wed, 11 Dec 2024 08:31:58 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:31:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 18/69] target/arm: Convert CCMP, CCMN to decodetree
Date: Wed, 11 Dec 2024 10:29:45 -0600
Message-ID: <20241211163036.2297116-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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
X-TUID: 91oa2uvqOBYn

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 66 +++++++++++-----------------------
 target/arm/tcg/a64.decode      |  6 ++--
 2 files changed, 25 insertions(+), 47 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 774689641d..56a445a3c2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8092,68 +8092,46 @@ static bool do_setf(DisasContext *s, int rn, int shift)
 TRANS_FEAT(SETF8, aa64_condm_4, do_setf, a->rn, 24)
 TRANS_FEAT(SETF16, aa64_condm_4, do_setf, a->rn, 16)
 
-/* Conditional compare (immediate / register)
- *  31 30 29 28 27 26 25 24 23 22 21  20    16 15  12  11  10  9   5  4 3   0
- * +--+--+--+------------------------+--------+------+----+--+------+--+-----+
- * |sf|op| S| 1  1  0  1  0  0  1  0 |imm5/rm | cond |i/r |o2|  Rn  |o3|nzcv |
- * +--+--+--+------------------------+--------+------+----+--+------+--+-----+
- *        [1]                             y                [0]       [0]
- */
-static void disas_cc(DisasContext *s, uint32_t insn)
+/* CCMP, CCMN */
+static bool trans_CCMP(DisasContext *s, arg_CCMP *a)
 {
-    unsigned int sf, op, y, cond, rn, nzcv, is_imm;
-    TCGv_i32 tcg_t0, tcg_t1, tcg_t2;
-    TCGv_i64 tcg_tmp, tcg_y, tcg_rn;
+    TCGv_i32 tcg_t0 = tcg_temp_new_i32();
+    TCGv_i32 tcg_t1 = tcg_temp_new_i32();
+    TCGv_i32 tcg_t2 = tcg_temp_new_i32();
+    TCGv_i64 tcg_tmp = tcg_temp_new_i64();
+    TCGv_i64 tcg_rn, tcg_y;
     DisasCompare c;
-
-    if (!extract32(insn, 29, 1)) {
-        unallocated_encoding(s);
-        return;
-    }
-    if (insn & (1 << 10 | 1 << 4)) {
-        unallocated_encoding(s);
-        return;
-    }
-    sf = extract32(insn, 31, 1);
-    op = extract32(insn, 30, 1);
-    is_imm = extract32(insn, 11, 1);
-    y = extract32(insn, 16, 5); /* y = rm (reg) or imm5 (imm) */
-    cond = extract32(insn, 12, 4);
-    rn = extract32(insn, 5, 5);
-    nzcv = extract32(insn, 0, 4);
+    unsigned nzcv;
 
     /* Set T0 = !COND.  */
-    tcg_t0 = tcg_temp_new_i32();
-    arm_test_cc(&c, cond);
+    arm_test_cc(&c, a->cond);
     tcg_gen_setcondi_i32(tcg_invert_cond(c.cond), tcg_t0, c.value, 0);
 
     /* Load the arguments for the new comparison.  */
-    if (is_imm) {
-        tcg_y = tcg_temp_new_i64();
-        tcg_gen_movi_i64(tcg_y, y);
+    if (a->imm) {
+        tcg_y = tcg_constant_i64(a->y);
     } else {
-        tcg_y = cpu_reg(s, y);
+        tcg_y = cpu_reg(s, a->y);
     }
-    tcg_rn = cpu_reg(s, rn);
+    tcg_rn = cpu_reg(s, a->rn);
 
     /* Set the flags for the new comparison.  */
-    tcg_tmp = tcg_temp_new_i64();
-    if (op) {
-        gen_sub_CC(sf, tcg_tmp, tcg_rn, tcg_y);
+    if (a->op) {
+        gen_sub_CC(a->sf, tcg_tmp, tcg_rn, tcg_y);
     } else {
-        gen_add_CC(sf, tcg_tmp, tcg_rn, tcg_y);
+        gen_add_CC(a->sf, tcg_tmp, tcg_rn, tcg_y);
     }
 
-    /* If COND was false, force the flags to #nzcv.  Compute two masks
+    /*
+     * If COND was false, force the flags to #nzcv.  Compute two masks
      * to help with this: T1 = (COND ? 0 : -1), T2 = (COND ? -1 : 0).
      * For tcg hosts that support ANDC, we can make do with just T1.
      * In either case, allow the tcg optimizer to delete any unused mask.
      */
-    tcg_t1 = tcg_temp_new_i32();
-    tcg_t2 = tcg_temp_new_i32();
     tcg_gen_neg_i32(tcg_t1, tcg_t0);
     tcg_gen_subi_i32(tcg_t2, tcg_t0, 1);
 
+    nzcv = a->nzcv;
     if (nzcv & 8) { /* N */
         tcg_gen_or_i32(cpu_NF, cpu_NF, tcg_t1);
     } else {
@@ -8190,6 +8168,7 @@ static void disas_cc(DisasContext *s, uint32_t insn)
             tcg_gen_and_i32(cpu_VF, cpu_VF, tcg_t2);
         }
     }
+    return true;
 }
 
 /* Conditional select
@@ -8266,10 +8245,6 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
     }
 
     switch (op2) {
-    case 0x2: /* Conditional compare */
-        disas_cc(s, insn); /* both imm and reg forms */
-        break;
-
     case 0x4: /* Conditional select */
         disas_cond_select(s, insn);
         break;
@@ -8277,6 +8252,7 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
     default:
     do_unallocated:
     case 0x0:
+    case 0x2: /* Conditional compare */
     case 0x6: /* Data-processing */
     case 0x8 ... 0xf: /* (3 source) */
         unallocated_encoding(s);
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index ae2c6831d7..a9d7d57199 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -761,8 +761,10 @@ RMIF            1 01 11010000 imm:6 00001 rn:5 0 mask:4
 SETF8           0 01 11010000 00000 000010 rn:5 01101
 SETF16          0 01 11010000 00000 010010 rn:5 01101
 
-# Conditional compare (regster)
-# Conditional compare (immediate)
+# Conditional compare
+
+CCMP            sf:1 op:1 1 11010010 y:5 cond:4 imm:1 0 rn:5 0 nzcv:4
+
 # Conditional select
 # Data Processing (3-source)
 
-- 
2.43.0

