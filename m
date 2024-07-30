Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2441551njb;
        Tue, 30 Jul 2024 09:03:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVzZoVeJB0zqIswsdeCl3aSCzLOBAIMm4vC3/tt+cCw8jlP+zS8raguDRERLONNhRdZ1/7RfwQemdVgtW3MO+1ck71cHUN
X-Google-Smtp-Source: AGHT+IGDBV6E0JtWjJn7wmivWAXDfzQAFKzyCvL1MTf4i+RIGVKQDr5uZJ0Elob0vOBxajKbzUNZ
X-Received: by 2002:a05:620a:4310:b0:79f:10f:23fd with SMTP id af79cd13be357-7a1e524fd17mr1290280385a.23.1722355400058;
        Tue, 30 Jul 2024 09:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722355400; cv=none;
        d=google.com; s=arc-20160816;
        b=Ohi5VsA3aKASwNXPYSb/Agc44S37Ektr8SUUcoCBYQiriq41myI7K9yoyQyeY14wzZ
         rs6wq05t2g0Bxv1DomfOe4KDBIrB3fLEP1LqtaiXzQPQpYEGcKxESgQsMvzdBP3cPDmY
         mzTqYCiMNMHvz2bbzUBvNSCIOdZRIyRQvr8a72ekvAaL5yiL+7q4UsVOv0VLDQiNKPHF
         0xibYr+0uTzujtFrFKXZJA5sfe0C7W3Takocg80NsP+9h+RP1JuNOOJ/Lp2aYENoX6Js
         6i10UF3L9uePdjvuV2t5tu0LIjrbhG0gGgXLusjAJ8EiN1NNO7LGJo5MwZLz1JsHtyOI
         m/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MzA6yndkssVsonTKDMnjVcpdRFu5VtP6syrp6zmpq4E=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=pFlt7wHdMH39Wh8pW3AAC14dqXS6bugYpTYg6se2py7hUrjeVILy+Y6TEwHbYhTFY6
         9y59luBy6iIXJ0LiocIzGWwEpfWAOocQOWoYkzEOfkaHZR0ypHq3w3e6J33MUaCLxdhA
         PePVbjETgIZZuUCjBc2vBzmpFlSTSs8bKG7PNZ8IIp/OLdzw9mwxOl2Tuz2FP1RnSaym
         ANyt8b50ic6+uNv+/DJ22b8vOaMWu3e8VK7T6iSRL9hGusDF9EgMbMB+11c1hYklyaZp
         Gc91GtCLEujUCiYYp+nySdz57BQByjlDNxF7hLPv3wPySVTOAJ5CpFSgvovOYoZ5x1lc
         xNvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ir9dZ3YJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d739b242si1331837485a.16.2024.07.30.09.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 09:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ir9dZ3YJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYpJi-0003AJ-P6; Tue, 30 Jul 2024 12:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYpJh-00034O-Gs
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 12:03:13 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sYpJe-0000Fb-DW
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 12:03:13 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-369cb9f086aso2500553f8f.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722355389; x=1722960189; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MzA6yndkssVsonTKDMnjVcpdRFu5VtP6syrp6zmpq4E=;
 b=ir9dZ3YJPUo/CIDm54tqFp1AasR6mmctWCOwGZ4khO5oLWMSW77KRSNOp0vQX10kdX
 fKJ0AyQqP1trHICdwJ/xa3hobpseOgGYlRDVR2gXxUtQYXcCNfbS3SCreusKmZtpBEr/
 R4h7fg3fLLEdh0mB+DQhuUg4QvI4w8b7MlJh4x4JXnCTULieClDeHFk0RWD1cBTtKVYs
 PSgzmSUCUdCuZnZdIqwc1JvYVNsI8+9HW18+HGMq+82W65AUOLUyNZUJqKJTQ965mU9m
 8KZWpyer3DUiA259xhAdu4N+GCan/rrCA7jPZfOMko5Ejsr7fxUuH01BbuMFwTs7UQZL
 marQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722355389; x=1722960189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MzA6yndkssVsonTKDMnjVcpdRFu5VtP6syrp6zmpq4E=;
 b=ich67sXBOHf4wYrTspFZL33XZ5j5KCor1BivSqjqgqTwr1StUBSAIcwB3gZuViZjrh
 8MbXfumJ/rr0mylsiH8P4qQ5X5bjZk+ZsVdPBAi52jv27MWbBIIdFE7fZfQGe3IImjLB
 GG5EPRT9d8BGAlE68X5+fBedPais/dm2U5AQJv/cMcl/fmo5K4OkdOW5ZH5PmKMG7wbi
 6m3XHpg/79IB3m/UiiimtDv6Dj3xVrvUzcdXYrDM8TB2sGSbJuJErZhdUjNU0PU5hjMA
 fvYTfqOBFv+kVZgAzRE87RKBwSICBRtFXW2s7XqRGx+zYV+qYX9BAj8UqZr6o53TB/Ac
 jpqQ==
X-Gm-Message-State: AOJu0YwTGbeQ8oGaCxh2vErvBmtc77MJIq6ukdaUiaspYq9MYrHKv9oK
 36IHWKJVJRdufNXwu4yk7aB+RC/JIOQvIVKbL/WjVjoiUaw8mGA1ZFXgB8hPcp46Rdb7s0EypvU
 m
X-Received: by 2002:adf:fc0c:0:b0:366:e7aa:7fa5 with SMTP id
 ffacd0b85a97d-36b5d0b094cmr7074359f8f.1.1722355388644; 
 Tue, 30 Jul 2024 09:03:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b3685810csm15001676f8f.71.2024.07.30.09.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 09:03:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/8] target/arm: Allow setting the FPCR.EBF bit for FEAT_EBF16
Date: Tue, 30 Jul 2024 17:02:59 +0100
Message-Id: <20240730160306.2959745-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240730160306.2959745-1-peter.maydell@linaro.org>
References: <20240730160306.2959745-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YD/A135Ox5Wa

FEAT_EBF16 adds one new bit to the FPCR floating point control
register.  Allow this bit to be read and written when the ID
registers indicate the presence of the feature.

Note that because this new bit is not in FPSCR_FPCR_MASK the bit is
not visible in the AArch32 FPSCR, and FPSCR writes do not affect it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h | 5 +++++
 target/arm/cpu.h          | 1 +
 target/arm/vfp_helper.c   | 8 ++++++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index c59ca104fe1..cfb82c23cad 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -556,6 +556,11 @@ static inline bool isar_feature_aa64_bf16(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, BF16) != 0;
 }
 
+static inline bool isar_feature_aa64_ebf16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, BF16) > 1;
+}
+
 static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a12859fc533..34df9d7e39b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1707,6 +1707,7 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val);
 #define FPCR_OFE    (1 << 10)   /* Overflow exception trap enable */
 #define FPCR_UFE    (1 << 11)   /* Underflow exception trap enable */
 #define FPCR_IXE    (1 << 12)   /* Inexact exception trap enable */
+#define FPCR_EBF    (1 << 13)   /* Extended BFloat16 behaviors */
 #define FPCR_IDE    (1 << 15)   /* Input Denormal exception trap enable */
 #define FPCR_LEN_MASK (7 << 16) /* LEN, A-profile only */
 #define FPCR_FZ16   (1 << 19)   /* ARMv8.2+, FP16 flush-to-zero */
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index b3698da8ca7..203d37303bd 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -254,6 +254,10 @@ static void vfp_set_fpcr_masked(CPUARMState *env, uint32_t val, uint32_t mask)
         val &= ~FPCR_FZ16;
     }
 
+    if (!cpu_isar_feature(aa64_ebf16, cpu)) {
+        val &= ~FPCR_EBF;
+    }
+
     vfp_set_fpcr_to_host(env, val, mask);
 
     if (mask & (FPCR_LEN_MASK | FPCR_STRIDE_MASK)) {
@@ -278,12 +282,12 @@ static void vfp_set_fpcr_masked(CPUARMState *env, uint32_t val, uint32_t mask)
      * We don't implement trapped exception handling, so the
      * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES0!)
      *
-     * The FPCR bits we keep in vfp.fpcr are AHP, DN, FZ, RMode
+     * The FPCR bits we keep in vfp.fpcr are AHP, DN, FZ, RMode, EBF
      * and FZ16. Len, Stride and LTPSIZE we just handled. Store those bits
      * there, and zero any of the other FPCR bits and the RES0 and RAZ/WI
      * bits.
      */
-    val &= FPCR_AHP | FPCR_DN | FPCR_FZ | FPCR_RMODE_MASK | FPCR_FZ16;
+    val &= FPCR_AHP | FPCR_DN | FPCR_FZ | FPCR_RMODE_MASK | FPCR_FZ16 | FPCR_EBF;
     env->vfp.fpcr &= ~mask;
     env->vfp.fpcr |= val;
 }
-- 
2.34.1

