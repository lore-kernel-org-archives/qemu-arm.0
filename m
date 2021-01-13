Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp167986lfq;
        Tue, 12 Jan 2021 22:28:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT/hDicgRjQRjP6eCJP2KzvrmwnB87a6o1XSlIAGxYjINLw8eJEogIHnph1RqlY282TW+P
X-Received: by 2002:a25:6f86:: with SMTP id k128mr1124547ybc.313.1610519314224;
        Tue, 12 Jan 2021 22:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610519314; cv=none;
        d=google.com; s=arc-20160816;
        b=kC6tWPdVdXnFIQjNYRACc5dkVcEQc4YCYU0CBzuoyinfSYFIQzKsuuIFab4/BcGvq+
         ZTzgPttpv/i458A4bdnFDLiLp7zBuXirxfFLsrlkleVcWybyA5umYMgUZubDQHHqjqr5
         pbYWWbaqzY5YQJizXd4v6+Y65E8ECKDV0U0P5T/A4A2tSk7+ZRMsHyGKh9WQq8FcK0tE
         U8AArTdzzGAP+1Bo8J78KcgcXGfmXOg9tUv1DDU4Lwapm0zRRaL9Skqqp4o0mLFPvLNX
         NCzCIXRui0luTHCnigNmzm6UND2dl+4eYusewZlzVuMXvL8Veo9XmSQr3okHZqQhmUl1
         tgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YbAy4KVm8LZdofZcsXyEMftLzbs/6FHl1IDz/kaEGZA=;
        b=iQ6DqS66qUuT+MmQG7qzYAlOIzA0XkUsf2yQjptaVzGcNLTRmXL5AqfPlUSapplgQG
         6EPydebOi/6N94le7JUWkZU0xicQLXaFzeygchw03V/pJHkvyJucF9193UqUNxmIuWwn
         iXwTIumeOVesWfBWa5JjOZQC9qN3SYLoYdwN/BGMGVOgxvbMKMjrs8qp+QrZwDWpl5cr
         Yi5wEex1/8XAPpiNuBAD4V8hsrmBDenjGgR022g1P5gCZ8pOLw36JAHhAXJV0oVO+ZVu
         hYfCZE/30A5psmcJZ12vbmkZM5RRF5z4FujoJUsA1Rchz8wHlhgJOxOrTMWGNe2Gumoj
         cyrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=giEqWeeg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si1243030ybs.204.2021.01.12.22.28.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 22:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=giEqWeeg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzZdx-0005Jx-JE
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 01:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcX-00049n-AK
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 01:27:05 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcV-0007I2-Am
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 01:27:05 -0500
Received: by mail-pg1-x52a.google.com with SMTP id i7so845765pgc.8
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 22:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YbAy4KVm8LZdofZcsXyEMftLzbs/6FHl1IDz/kaEGZA=;
 b=giEqWeegyT3S3mL7WsKtn/HvThYJUn9jz6oSMART99yy/X+/8XiS47SFV8WBRJVsYc
 1Vm4hMLZYqfikoNB3rCtI42MHrA5loVkfhMf7TFRI6GWzqcTfY0/wyAPrgZhpTTm/JLb
 gRaZGmIIgJhDMSnNAvY8XeLV8DlEisk31m7kQH+94HrfzByzLnrJ/X9UuNhtVryRQCZH
 J7ToapLEWf1CgCRLaxMaZTPlWacynJvtRHwFnjPOzkpmpK9mxOPhpPpQajE/uU7kBUjg
 tJknfaUWa9F4FE3TU4CCmzlpy2EnGomR0GLG2D2ZYEex6Z1mVt6JGY/b6XGeXwMQ3orU
 hLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YbAy4KVm8LZdofZcsXyEMftLzbs/6FHl1IDz/kaEGZA=;
 b=uQ2/OkbWCr7Z9GGPBKAzrGk9cCQOYyxscO0XznQqCFrLaDNJ72zfBeAwoeAAM8slkO
 EvSwEKOiYYgctvtrqfjoCyl1i0WjRd2E2iOBegJCyHiork1DOdpiN9Ortg/UDbSS2G1q
 N9nHfBfC2hwgFEoIcnJmlf1yUU60dplkS5hFKmUrtlpmMKXMgUV1DdIdzVoKTcCPEkrz
 UiIR10Z9oF8XeAf7L4KRs05VrB7cGZ5CQQyrOhdqYUBxdiS7zlYNFVGVfnoa/TXJRxsK
 xQnKruKiPePI1c6reyC+iFgbV8yJIuBh8zduds34eU8Hta187nkvrAhyHYTg6rIqMFvN
 pd0Q==
X-Gm-Message-State: AOAM531CWeOoTPoCSXDltsDz/VE5v81yNtIA0fNMTxSb+75xcufFDuJi
 UCl47vlrV45ITrnCQsJB4nduLQ==
X-Received: by 2002:aa7:904b:0:b029:19e:c8a5:5154 with SMTP id
 n11-20020aa7904b0000b029019ec8a55154mr640584pfo.41.1610519221930; 
 Tue, 12 Jan 2021 22:27:01 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k25sm1138241pfi.10.2021.01.12.22.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:27:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] target/arm: Update REV, PUNPK for pred_desc
Date: Tue, 12 Jan 2021 20:26:50 -1000
Message-Id: <20210113062650.593824-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113062650.593824-1-richard.henderson@linaro.org>
References: <20210113062650.593824-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
X-TUID: bpn/yb3FYUjt

Update all users of do_perm_pred2 for the new
predicate descriptor field definitions.

Cc: qemu-stable@nongnu.org
Buglink: https://bugs.launchpad.net/bugs/1908551
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    |  8 ++++----
 target/arm/translate-sve.c | 13 ++++---------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7eec4b6b73..844db08bd5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2036,8 +2036,8 @@ static uint8_t reverse_bits_8(uint8_t x, int n)
 
 void HELPER(sve_rev_p)(void *vd, void *vn, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    int esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     intptr_t i, oprsz_2 = oprsz / 2;
 
     if (oprsz <= 8) {
@@ -2066,8 +2066,8 @@ void HELPER(sve_rev_p)(void *vd, void *vn, uint32_t pred_desc)
 
 void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    intptr_t high = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    intptr_t high = FIELD_EX32(pred_desc, PREDDESC, DATA);
     uint64_t *d = vd;
     intptr_t i;
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0baca176a0..27402af23c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2145,19 +2145,14 @@ static bool do_perm_pred2(DisasContext *s, arg_rr_esz *a, bool high_odd,
     TCGv_ptr t_d = tcg_temp_new_ptr();
     TCGv_ptr t_n = tcg_temp_new_ptr();
     TCGv_i32 t_desc;
-    int desc;
+    uint32_t desc = 0;
 
     tcg_gen_addi_ptr(t_d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(t_n, cpu_env, pred_full_reg_offset(s, a->rn));
 
-    /* Predicate sizes may be smaller and cannot use simd_desc.
-       We cannot round up, as we do elsewhere, because we need
-       the exact size for ZIP2 and REV.  We retain the style for
-       the other helpers for consistency.  */
-
-    desc = vsz - 2;
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
-    desc = deposit32(desc, SIMD_DATA_SHIFT + 2, 2, high_odd);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz);
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
+    desc = FIELD_DP32(desc, PREDDESC, DATA, high_odd);
     t_desc = tcg_const_i32(desc);
 
     fn(t_d, t_n, t_desc);
-- 
2.25.1

