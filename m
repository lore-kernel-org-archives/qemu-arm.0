Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp167541lfq;
        Tue, 12 Jan 2021 22:27:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvr4izdXQBAT0H2ghnmeYgZkzZeNK/o4oeNdz53en8rqyfREsHg0MyOmpEcJeDQ45lZ+hy
X-Received: by 2002:a25:848b:: with SMTP id v11mr1139557ybk.383.1610519261052;
        Tue, 12 Jan 2021 22:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610519261; cv=none;
        d=google.com; s=arc-20160816;
        b=mCFtwESWoEGSIVVXPHsEcMNbCFrbysDSSgJeDO8d2M9LFI9Hpaph7k/++8VXsc9Gso
         2B5jQT81bPiqsfRUezkYzG7UZbVdEr6ZkaVDwYJODBGfpt2MzxGoYkncEwLmWn7NR9lW
         Ysel3ZSgB+hLRnSQ9cQnHox68TxcdbxmKtCXhDp80ZKGSbzVSvODm2IY8uCGL8rmNNho
         40rQQcasQ8+hdJ04NHWlhQctQbCzgr/Rn+7x6SrjfJz/2FfLLBeVfEgaiBHmkdTHZYOh
         0Z5AmWxgo9CzCqWtj6XqaYcQToIP/aBvx30W2D4NcZIJPcGVo5/IevQh2Wj+APRLG8yg
         xInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Bymuml46Yty0XlvbocAimuoupZdaZklTevSIO7jJc+s=;
        b=L3VuFmAnKE/R58dDpDGAYRCq1tgYwCY3cOxfRfuzgtLa7jZz+XmVqLAtuqYMC4PuzS
         7Nha4jaGvtXjeG8U5KKcudNHZt2+3eRwkPbOj+ffbPmDln3D07NottIZijM9VCv+5tfY
         0/UL3rX1PnKMJ2aJxgqp7uRUtQp/SxkJOlrSllXb25qMQA7zwbFe5iCYWm+9SJvEbqsb
         9YPPM7zO3/wYY5d1JI3yhgeBJoUw282LsW3tJXo7JoTx3frDs77bWJMI6hHm4ykZbUdg
         voLl5I8lNm+pqNNrBBHi9oi+g+dDTLUVHV+LGYlWwlYEE2UxADU5kMjUodbb/QIubzhl
         itiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SLvo5rb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si1192942ybq.405.2021.01.12.22.27.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 22:27:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SLvo5rb1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzZd6-0004Nt-D2
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 01:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcT-0003yQ-44
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 01:27:01 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcR-0007Fi-Eu
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 01:27:00 -0500
Received: by mail-pl1-x634.google.com with SMTP id y8so498312plp.8
 for <qemu-arm@nongnu.org>; Tue, 12 Jan 2021 22:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bymuml46Yty0XlvbocAimuoupZdaZklTevSIO7jJc+s=;
 b=SLvo5rb1waFxld5OxOq7nLR4coQIkwbEOsB7CG7Fchnh319qiSmJbHx9X6MgtCNS2A
 zKomWxBC6QjE8ytjGeCpJPUXVxrXj05Jllb84wuQdbM+1ELUeoF1/uSnwbtmGtuZRKK9
 +MEQtFCGkKaVDKx1YGp5JjmwaUwYPTFB5VFriuhUuHujagT/Ust76mB+ziCq7kWRXbLh
 5rtRFDCh2PHKoOc8n/5w/ZK1r78Pz/vXbHUwcQvEfBZei+8oXoPPBenQCaLWzQFTkKLJ
 SURrICOfrOSruaMQuRwyugYHKMsQaTJfKhb4djXeCjNU7koRE9X16QjWHK7MxmSqz9t2
 ljXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bymuml46Yty0XlvbocAimuoupZdaZklTevSIO7jJc+s=;
 b=SyxsNaAHs+rjDtH3KDb1I1y3qTx+Ek3vQHtoaZLaVF5ME/4GOFj15gF5Ko3A7yS09P
 rzLQOCc5Bxlo9mWaxXJhFdVdsWacUDO+YUZWgUdIyxeDraXEYD46vf0URYSCH7FPYVpt
 kIba9ABNAFE6BhrESpAtqHd3R0NnO+lSYARhHhzAXQmFxcnaO6eFdTFJkulYetZ+MC64
 U3EYU4hz1mZOiZpaI/YMqKUFljRtiO2HbLCpfhc0499YELa3oYNJ1SII6JYfXO4an7x9
 9w+JHpiaN22s6DrDFlluvRpBO/o97zec36ay19umQIUniCGKnbAN2yzsBAavgadEL9da
 30hg==
X-Gm-Message-State: AOAM531n4L1gHLdEtAUX7XwUkuHrUFWgztFJJ7U+03TLjHr6/rfzn67t
 KSQkVt6YeGpSbIyi7ufbly/c8A==
X-Received: by 2002:a17:90a:4dcd:: with SMTP id
 r13mr652743pjl.74.1610519218183; 
 Tue, 12 Jan 2021 22:26:58 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k25sm1138241pfi.10.2021.01.12.22.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:26:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] target/arm: Update PFIRST, PNEXT for pred_desc
Date: Tue, 12 Jan 2021 20:26:48 -1000
Message-Id: <20210113062650.593824-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113062650.593824-1-richard.henderson@linaro.org>
References: <20210113062650.593824-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: f23/9/e06dVD

These two were odd, in that do_pfirst_pnext passed the
count of 64-bit words rather than bytes.  Change to pass
the standard pred_full_reg_size to avoid confusion.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 7 ++++---
 target/arm/translate-sve.c | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5f037c3a8f..ff01851bf2 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -889,8 +889,9 @@ static intptr_t last_active_element(uint64_t *g, intptr_t words, intptr_t esz)
     return (intptr_t)-1 << esz;
 }
 
-uint32_t HELPER(sve_pfirst)(void *vd, void *vg, uint32_t words)
+uint32_t HELPER(sve_pfirst)(void *vd, void *vg, uint32_t pred_desc)
 {
+    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
     uint32_t flags = PREDTEST_INIT;
     uint64_t *d = vd, *g = vg;
     intptr_t i = 0;
@@ -914,8 +915,8 @@ uint32_t HELPER(sve_pfirst)(void *vd, void *vg, uint32_t words)
 
 uint32_t HELPER(sve_pnext)(void *vd, void *vg, uint32_t pred_desc)
 {
-    intptr_t words = extract32(pred_desc, 0, SIMD_OPRSZ_BITS);
-    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint32_t flags = PREDTEST_INIT;
     uint64_t *d = vd, *g = vg, esz_mask;
     intptr_t i, next;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0c3a6d2121..efcb646f72 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1494,10 +1494,10 @@ static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
     TCGv_ptr t_pd = tcg_temp_new_ptr();
     TCGv_ptr t_pg = tcg_temp_new_ptr();
     TCGv_i32 t;
-    unsigned desc;
+    unsigned desc = 0;
 
-    desc = DIV_ROUND_UP(pred_full_reg_size(s), 8);
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, pred_full_reg_size(s));
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
 
     tcg_gen_addi_ptr(t_pd, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->rn));
-- 
2.25.1

