Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1360668ejx;
        Mon, 11 Sep 2023 06:55:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfcfaagRSfqfWkG6qJ0u2vkOWs6BO6kJgHiKvNdzaBStIATp4X69SbumbfaqL5nfFMIx8z
X-Received: by 2002:a0c:8d4a:0:b0:64f:9470:1306 with SMTP id s10-20020a0c8d4a000000b0064f94701306mr8965663qvb.44.1694440547585;
        Mon, 11 Sep 2023 06:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694440547; cv=none;
        d=google.com; s=arc-20160816;
        b=Km/XiY3p3ExYQCWLUgeG1XEoPsj269hlWRamCai74w6qqkJ6E3NqdfGdxgEiWu52DG
         LP95LGvc4DzlJpY7vXcWIS3xCX/lxZ1X5Rm0ioZszn+T5qFROwSSU0aYuZJM8/i18bV0
         hVg/9nb93S22vXxeToHuLxT/yVfYOQPLbdsIAzNe3yGjDbo0at9ET5zjYfUCKqC7zGVs
         /B0lpUhPEZ4xA7mS0jyVVP9SVRsk5k2+z0cjzii6TKQRXRszr5WCMbv1lZA2zL0AWUWZ
         k9lhJRQaeM5k2A1khMgCEoo8bQDpXf4Fw/B2oy8OK6rwLhacpjl43SFHvWrvr0dvxr4L
         rZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1SPaLFJICW9q9gqa6qvPwlUkb8XaROQF8dYUvvHc24Q=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=quDAq36rDzRdQicvpsBzWqA3KG/ORaO7lj2Ih0eX2+Z18zLuiOSAsk68blOgSdB9KU
         mTNGYJptP9dDW+inCBdfsuLslue1m6XVcHPwX3Km4QReEI8dMFQEc/5oJ2qRgLmBGlqn
         9sCLEyiYJdQ87pnwn9NRQLzS7CDp2G+qo7k4Uz6GdtUjfMIF1KGqz5pM7Rt+LZqWhnuB
         EYMx7jabvm5ldnB8YS8z01OGicT+BP9dxZB9mVUvLlP5sVamxepojxvsQmL9P+KAHahv
         6VjBboI4y2gxICf7xQbJ9/GYdR6hw/EQKHg0+OMoSQ5R5N1p36nyPPD8N55BHwK3viZ7
         Hdgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XvgKZ50R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10-20020a0ccb8a000000b0064a1571e1ecsi4488440qvk.66.2023.09.11.06.55.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 06:55:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XvgKZ50R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfhMV-0005q4-0N; Mon, 11 Sep 2023 09:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMT-0005oS-Qo
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMJ-0003Al-RE
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:57 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31dd10c2b8bso4384956f8f.3
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694440426; x=1695045226; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1SPaLFJICW9q9gqa6qvPwlUkb8XaROQF8dYUvvHc24Q=;
 b=XvgKZ50R8Dbc3FCeJtRahF+ujCToUeWldnj/USmBXiW4NOsH6Nwor2OO95xjHll+hi
 YrUaijJSzaIbIagjDVXj3MrJdfvGxxQeCuCjZb1VTYvxqgEBjxyn/9XKXi724OuI3mY2
 pufSNFviwK01r+UWVT7DBq6Oq726gHb/hncvlFv25mTGJkFNVilXpLwYkPEgVScLjHju
 lrkxQVNYJCmk1Q4K8LDwqe1tWkuq3LP6+jG/Nf8wahLACRWvH0J9Kcby7jsW5Z+j84zj
 1xe/95lGeEW3UftyI5Wkze5tqF9kEuaO+NUOzoOjlgSEXDFOWwW2bzdxq7NVHSpQSZd1
 ndqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694440426; x=1695045226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1SPaLFJICW9q9gqa6qvPwlUkb8XaROQF8dYUvvHc24Q=;
 b=UDuWX2fX+ReOIoBZ30d+rbdGhMcuYnKly3vBFVPVLBl4Y6HBZpqKi8H3OLEbODlPir
 Tai+YzEXMFb1Gw5+5J3EecgdPgG8RInGTU8G5DnLqgWAwdoqlW/7+KIF+2HYbYG527hN
 FG+db4jekPc8VMszj63OBL51H/cxTHSP3OOORDFW2erfbH78F1rDN/p3FImL7hYBvCFM
 e5EzPmFVnWwoJg9Cc6yqzJJCKX4zuDxIQ+BKLwnqaiw6yWrp9qIb4oxcBnSV7XK3S7KM
 eOs1eRJdS1QA//5ZQXk4HCb1Yv+rMOOTZrdicylpps0Ir1AX4QkGHw6SRHhthZ7Q/Kr6
 lnBg==
X-Gm-Message-State: AOJu0YwtgmzFvV4CERNq83jpPm1x8n82k7hTea1lcP76WgCr96rd+7tQ
 1e5+LEGlGUytLx3AeCKILM4SlBlz6faiHagKupk=
X-Received: by 2002:a5d:5744:0:b0:31a:e972:3601 with SMTP id
 q4-20020a5d5744000000b0031ae9723601mr8458561wrw.54.1694440426494; 
 Mon, 11 Sep 2023 06:53:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm10079758wrq.49.2023.09.11.06.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 06:53:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 7/7] target/arm: Implement FEAT_HBC
Date: Mon, 11 Sep 2023 14:53:40 +0100
Message-Id: <20230911135340.1139553-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911135340.1139553-1-peter.maydell@linaro.org>
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: TPJQNX8x01ZF

FEAT_HBC (Hinted conditional branches) provides a new instruction
BC.cond, which behaves exactly like the existing B.cond except
that it provides a hint to the branch predictor about the
likely behaviour of the branch.

Since QEMU does not implement branch prediction, we can treat
this identically to B.cond.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst  | 1 +
 target/arm/cpu.h               | 5 +++++
 target/arm/tcg/a64.decode      | 3 ++-
 linux-user/elfload.c           | 1 +
 target/arm/tcg/cpu64.c         | 4 ++++
 target/arm/tcg/translate-a64.c | 4 ++++
 6 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 2e6a7c8961e..34429054a3f 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -39,6 +39,7 @@ the following architecture extensions:
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_GTG (Guest translation granule size)
 - FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
+- FEAT_HBC (Hinted conditional branches)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_HPDS2 (Translation table page-based hardware attributes)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index eddf2d3b72c..fc45f1fb9e2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4050,6 +4050,11 @@ static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
 }
 
+static inline bool isar_feature_aa64_hbc(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, BC) != 0;
+}
+
 static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
 {
     return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 1;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index ef64a3f9cba..71113173020 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -126,7 +126,8 @@ CBZ             sf:1 011010 nz:1 ................... rt:5 &cbz imm=%imm19
 
 TBZ             . 011011 nz:1 ..... .............. rt:5 &tbz  imm=%imm14 bitpos=%imm31_19
 
-B_cond          0101010 0 ................... 0 cond:4 imm=%imm19
+# B.cond and BC.cond
+B_cond          0101010 0 ................... c:1 cond:4 imm=%imm19
 
 BR              1101011 0000 11111 000000 rn:5 00000 &r
 BLR             1101011 0001 11111 000000 rn:5 00000 &r
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index bbb4f08109c..203a2b790d5 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -815,6 +815,7 @@ uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sme_f64f64, ARM_HWCAP2_A64_SME_F64F64);
     GET_FEATURE_ID(aa64_sme_i16i64, ARM_HWCAP2_A64_SME_I16I64);
     GET_FEATURE_ID(aa64_sme_fa64, ARM_HWCAP2_A64_SME_FA64);
+    GET_FEATURE_ID(aa64_hbc, ARM_HWCAP2_A64_HBC);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 0f8972950d6..90e033bbc3a 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -814,6 +814,10 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     cpu->isar.id_aa64isar1 = t;
 
+    t = cpu->isar.id_aa64isar2;
+    t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);      /* FEAT_HBC */
+    cpu->isar.id_aa64isar2 = t;
+
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0b77c92437f..15eca55fc75 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1453,6 +1453,10 @@ static bool trans_TBZ(DisasContext *s, arg_tbz *a)
 
 static bool trans_B_cond(DisasContext *s, arg_B_cond *a)
 {
+    /* BC.cond is only present with FEAT_HBC */
+    if (a->c && !dc_isar_feature(aa64_hbc, s)) {
+        return false;
+    }
     reset_btype(s);
     if (a->cond < 0x0e) {
         /* genuinely conditional branches */
-- 
2.34.1

