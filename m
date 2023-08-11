Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1649368ejc;
        Fri, 11 Aug 2023 14:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd10jYguo0OQzjavIqrIQf6RmP1zkBHNPJ1N2gPD/e7g0/5Qd3RZxZ0Xj3iQ+0hpzmOg0C
X-Received: by 2002:a05:620a:f12:b0:76c:b16b:ad74 with SMTP id v18-20020a05620a0f1200b0076cb16bad74mr3793101qkl.19.1691790106316;
        Fri, 11 Aug 2023 14:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691790106; cv=none;
        d=google.com; s=arc-20160816;
        b=BKFCPK/V0kR1YKK++V7+QCJLtQmJe7AcPvX1PpTB2kHwK7fhvcaAP1EPYeduqn9cMx
         YDacKVLdvJjmXQwkrAAXidvQTBg1SHE6VUwH60qDgseowUc3V/YLq3HGBSRiLnKL/Udw
         6HbprBnwPDB+DI9XvCe5qq6HGS+w8j8+k3Gimki0/ZQWjeRI+NlRN7CB8d70m9+eYKbE
         weZvxwyMxRtcAXu+E4wR/1CzT8tyM+zFnUwBINV9Pv7U5dvJ9dmn/YDIv7x36zqSyeZw
         qUR3HuUNn+Gck9Qy/DAO/TP9lL1kSdDVm2r2yVpqorUly9uEyQOAx71i1LgG4sRlZs2T
         IvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gyazxeEkqj9Hcr039Rs95Pk/TkvjVIVgvCNYykbHWYI=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=0kDTuW5prMGQF32n97pG2TCiZiorokbGH2+w9ZY8xZDgkGS51CPTc7QLQxprf7+ydi
         UNGun5eS4RhGJXtNbW1EUJr0/mJqpTu2idQKWmc0w84QjihmoWEQfxXCguroqLoF8aU3
         RRcLXpnQL9QiWCDRIRuB5MdkVUC0Tov+iti84oJesJ9jd6Q0w6tzusi63aT8ZAtMJCSM
         xBUZlSuDf5u2caWcSj2ALDqlpkOPXZx8AlD5uMUODaGPXj9A3RLdzBbcPw2xbMNsenD4
         4tzPWQ7jJsxSpFCPQDvkEv09FKtptU0AgNr4nChcwwpnjUcJZFYXvJNY++2Jk2SXz3pQ
         KRgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYIWAf1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rg3-20020a05620a8ec300b00765b0dc5ef0si2606738qkn.510.2023.08.11.14.41.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 14:41:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cYIWAf1V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUZsL-0003FT-Aw; Fri, 11 Aug 2023 17:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsF-00038O-GF
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:47 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsB-00029A-8w
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2680182bc21so1423057a91.2
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 14:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691790042; x=1692394842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gyazxeEkqj9Hcr039Rs95Pk/TkvjVIVgvCNYykbHWYI=;
 b=cYIWAf1VrnPUZit5NfPgjARzwLoPXvsDf3X2IcTXFCm1QPQPUCH+vY6emUY5nyoToC
 ZeUWZGH+zrMpJxEvDOlDNYcRAbbCHRmvng4KAW9qa/n2adH5VANOmaYaQ4dNo76Vv/z9
 TSUaZYPG/gH1zqc2nKpyF1p0fUczbRdwYAmAXScYNPGvDV+UPWaeQW2fM2gvAXVTtVD5
 75pCllzbVLJENlzauBniTaCDX26isrspjWp3XrwPQjGB11ecOPX89qPAr90z+GHhrs/i
 mKyMiM3fvoGfVoXjqyyehkyDRFm2rB39w9I/JciPwbIqKP0pbcreVXzoe87Xi9aIxZuM
 OItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691790042; x=1692394842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gyazxeEkqj9Hcr039Rs95Pk/TkvjVIVgvCNYykbHWYI=;
 b=gUFgJAIGJDTFs5bDe+JmWK0RxAia7Fg2nGNjXO/FXdg/iZ03rXzRVL1keZlMwqJ+d/
 rUsJ7C5oNGDHo4wJ2WKyBqPKVa/vxiJAjhTGhh/O/Hy52OxHqVKimyMAtgOfrMgd5r/M
 8DKekaLuoJZ/q8NzMtKwNQ+tWY3sGmPvR/boN/DvxBMlJQY+jOtC2zbvTa5OwFxIOrSj
 f9CmPBo2L7QtjtUdPBY8Go8waULXEwKrYewUJeZHxCpipp/DMjUqYd14l88IyuMZjWTc
 74S7kkn2fnccWEGmCWyV5C9fb/p5Lb6BecN3K0PsBorVKFygjoMNBExgsGoqkdEErnZY
 xtBQ==
X-Gm-Message-State: AOJu0YxXkOc++eYrRfxCiX8OOKSBxlb2v0lGSm3LtE1Y6wy3DDMrScns
 owccBJQAEZprRwtcJILFnwujTrbgAMnZcVIr83I=
X-Received: by 2002:a17:90a:410b:b0:269:1abd:3ba6 with SMTP id
 u11-20020a17090a410b00b002691abd3ba6mr2320142pjf.28.1691790041746; 
 Fri, 11 Aug 2023 14:40:41 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:e773:351d:2db2:8a8a])
 by smtp.gmail.com with ESMTPSA id
 gk18-20020a17090b119200b00263ba6a248bsm5723840pjb.1.2023.08.11.14.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 14:40:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 10/11] target/arm: Implement FEAT_HPDS2 as a no-op
Date: Fri, 11 Aug 2023 14:40:30 -0700
Message-Id: <20230811214031.171020-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811214031.171020-1-richard.henderson@linaro.org>
References: <20230811214031.171020-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: hw7YPY8Z4qOE

This feature allows the operating system to set TCR_ELx.HWU*
to allow the implementation to use the PBHA bits from the
block and page descriptors for for IMPLEMENTATION DEFINED
purposes.  Since QEMU has no need to use these bits, we may
simply ignore them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu32.c        | 2 +-
 target/arm/tcg/cpu64.c        | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index bdafc68819..2012bbf7c7 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -40,6 +40,7 @@ the following architecture extensions:
 - FEAT_HAFDBS (Hardware management of the access flag and dirty bit state)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
+- FEAT_HPDS2 (Translation table page-based hardware attributes)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_IDST (ID space trap handling)
 - FEAT_IESB (Implicit error synchronization event)
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 47d2e8e781..1f918ff537 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -62,7 +62,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr3 = t;
 
     t = cpu->isar.id_mmfr4;
-    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1);         /* FEAT_AA32HPD */
+    t = FIELD_DP32(t, ID_MMFR4, HPDS, 2);         /* FEAT_HPDS2 */
     t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
     t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
     t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 0054bb6dfa..b12e10d3ab 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -865,7 +865,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
-    t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
+    t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 2);     /* FEAT_HPDS2 */
     t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
     t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 3);      /* FEAT_PAN3 */
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
-- 
2.34.1

