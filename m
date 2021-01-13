Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp167814lfq;
        Tue, 12 Jan 2021 22:28:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxf9k8Eg73Sw2qRqtzl5q7JddEQISUnXs22QNbNKm4bi+acF+Q2JXLT71SNEa7gyOKCYT6n
X-Received: by 2002:a25:5d1:: with SMTP id 200mr1131257ybf.397.1610519295544;
        Tue, 12 Jan 2021 22:28:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610519295; cv=none;
        d=google.com; s=arc-20160816;
        b=WRM/ZLnzCRZ3tsa9AG7pIbvyhP7ND6TGzlwDdW/bxgTlREZJcANKQEciASNluzpPqh
         2OD9+d/FABaAxSpOUPf88iAmfr1/LC5p5V5mgOu2PayZz5fYH2e5OoUfgQqOgmQNPL50
         36tXrb16w6BiZVcCHH7eYVvLlM+R5iJZiugbckTDKXNTZhUYTItEzn54Ur8xmpHWJKHS
         bKuaoc0D20I2fG9wF8HktboEnqVnbnCInsmT9YDsxdwcBA3Mtt9Qfi59ZWZcxoB+xlWB
         /yYoTh7hJxn2vsyJWfa45pONgZTK5xmeTCp7asfx4WiIukrVw6KWE1NLwORU/PZACfkc
         bI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x4WrRc9ij8plFlXKBhz8CZ+MgZnj8Yfv6pjE6AqRZ6g=;
        b=WkWeWIbOIR/MiyH+RjczN2zgoON6drCx9H+mADeA6ILLCtoPknfOUcJe9WpwuMMqS2
         +2rcDtaeguo4tPr5bI8NMml8QB0PcIQfbeOYGGMqTnnCbG/OTwuZQEXPw8cCikek0TrH
         Tse1PCT+b39zmzcEq/r/YGarp+t5u+Eod5+QjkyEmyAD3vLXGrU5AOvhl46x4I7/X45S
         n39BuS0KRJNXgokY+GAE+HkrOp1AQhLzrtVie7279Sa1VUCZZkqYR/8DgOp5+CEDlid2
         eJaO0zpvBWm0ehLPBNkbx9s68z2ch8EHgdV1MraGHd3N4EwzW6dPR5IXpHmSyg9Od3gG
         Gi8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nJM4gqhY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x30si1202009ybh.196.2021.01.12.22.28.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 22:28:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nJM4gqhY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzZde-0004qw-V1
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 01:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcV-000440-6p
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 01:27:03 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcT-0007GG-BI
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 01:27:02 -0500
Received: by mail-pl1-x62f.google.com with SMTP id be12so506551plb.4
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 22:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x4WrRc9ij8plFlXKBhz8CZ+MgZnj8Yfv6pjE6AqRZ6g=;
 b=nJM4gqhYgtmaC3mmYOj0THdAIZ6sxtk2gDtMpmCvv9saWJ8axHkBLwuy05tR62vK6W
 63x+Df30JNOouWr2GWWZ/RdNg4d9NpTeLif/hK/tXXPKnZQLwsQt95JFUzdUtAzsoPpJ
 J6t8FUKPdxliN1DChKYdt0B8yJLLRgVq3SzKyxBt7J31bc3ELg4XN0ZRtbryiq1xyPSe
 0ehhpWHuwRzaHWn/MGMt0VDvYDLMRTdTpfbPQ/xVl6Hce6y/Um7Z1fk+HXFYCkOo4th1
 vP+naLf/UFicY5yPbfP8g58GGBS4idSC1bBfweJVBEgqVE1TLF7AQ0hTQh58tRBXfD5A
 e7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x4WrRc9ij8plFlXKBhz8CZ+MgZnj8Yfv6pjE6AqRZ6g=;
 b=bnDAo4mFyUhsuRRXCv0MxMGX1FvRtZU7Sh8eA2Gc9UcsYp8Kka8RfRVfNdjN8hV3j2
 68vKThw3V1wTkm9ekIP6ZgiZjsbPK68d8m/gZF02xeIjd7i5j3B2o61TJsdjlEv4ihmZ
 +q+nEIluCHWUYok53fgxbjbh8bWsKuOIbELnQNffYBSXOtJ9rfAG4YaWa9iLyf2WGyMJ
 94Es+o0EQ2YQyo8+6Pnkb6Xkix/pm3OWtzFFaABybS46IdChXf3CC0h1CtdwnR2KWKHN
 7gVlZtfU2CkjRSComGViTfCZP7JpoDibBlrjdEz0Zkdnfhjew6TH4kgTGVyASFcAuj28
 mUqg==
X-Gm-Message-State: AOAM5325zg8DvDPm9lGXcsAky6GwS7CIwSOdVgBqQC1uE3IE1aWV49BW
 7tcPWvV8DXeTqng5d2JDzH32rg==
X-Received: by 2002:a17:90a:9304:: with SMTP id
 p4mr620365pjo.220.1610519220050; 
 Tue, 12 Jan 2021 22:27:00 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k25sm1138241pfi.10.2021.01.12.22.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:26:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] target/arm: Update ZIP, UZP, TRN for pred_desc
Date: Tue, 12 Jan 2021 20:26:49 -1000
Message-Id: <20210113062650.593824-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113062650.593824-1-richard.henderson@linaro.org>
References: <20210113062650.593824-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cwjHMkgs/cdZ

Update all users of do_perm_pred3 for the new
predicate descriptor field definitions.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 18 +++++++++---------
 target/arm/translate-sve.c | 12 ++++--------
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index ff01851bf2..7eec4b6b73 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1868,9 +1868,9 @@ static uint64_t compress_bits(uint64_t x, int n)
 
 void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
-    intptr_t high = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    int esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    intptr_t high = FIELD_EX32(pred_desc, PREDDESC, DATA);
     uint64_t *d = vd;
     intptr_t i;
 
@@ -1929,9 +1929,9 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
 void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
-    int odd = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1) << esz;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    int esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    int odd = FIELD_EX32(pred_desc, PREDDESC, DATA) << esz;
     uint64_t *d = vd, *n = vn, *m = vm;
     uint64_t l, h;
     intptr_t i;
@@ -1986,9 +1986,9 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
 void HELPER(sve_trn_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    uintptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
-    bool odd = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    int esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    int odd = FIELD_EX32(pred_desc, PREDDESC, DATA);
     uint64_t *d = vd, *n = vn, *m = vm;
     uint64_t mask;
     int shr, shl;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index efcb646f72..0baca176a0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2110,19 +2110,15 @@ static bool do_perm_pred3(DisasContext *s, arg_rrr_esz *a, bool high_odd,
 
     unsigned vsz = pred_full_reg_size(s);
 
-    /* Predicate sizes may be smaller and cannot use simd_desc.
-       We cannot round up, as we do elsewhere, because we need
-       the exact size for ZIP2 and REV.  We retain the style for
-       the other helpers for consistency.  */
     TCGv_ptr t_d = tcg_temp_new_ptr();
     TCGv_ptr t_n = tcg_temp_new_ptr();
     TCGv_ptr t_m = tcg_temp_new_ptr();
     TCGv_i32 t_desc;
-    int desc;
+    uint32_t desc = 0;
 
-    desc = vsz - 2;
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
-    desc = deposit32(desc, SIMD_DATA_SHIFT + 2, 2, high_odd);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz);
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
+    desc = FIELD_DP32(desc, PREDDESC, DATA, high_odd);
 
     tcg_gen_addi_ptr(t_d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(t_n, cpu_env, pred_full_reg_offset(s, a->rn));
-- 
2.25.1

