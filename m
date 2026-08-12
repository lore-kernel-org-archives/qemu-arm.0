Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB50BC5DF65
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 20:45:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuFoo-0003cg-UK; Wed, 12 Aug 2026 16:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFon-0003aW-I5
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:57 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFol-0002Gf-IU
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:57 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-848643382fcso1430359b3a.1
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 13:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786567494; x=1787172294; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fDDfgxcUeDenp1TCRREpiqyxENBHO3/H9gHynAXLyRg=;
 b=nhtZ/JCB8lMDpkrjZSAs4k8sUup9wu9K8RyuraZYK9+SPoHuMiFTvBgqKKm2HqX/l8
 OmpG+nlnfwQvdoTQsALPOTFzg1E96/TWXM6qC10Gak6+/ixOpLvjrIGafxRg7uIvuv4h
 dfi55eAmUYFdkBm2S4l1EMNLMPQi3+x16BJFeYgD5xNdwJFulYdVH/ZokaPa4E+ktlQx
 qd4YDmm/nS2KIUyhLky9P/q66gSq45uYV44/gmtMfPCuqLY/63eTIbDAxMN8FzT1BqQq
 yHUdWXLf4g8f9Z5IgOlFwLK5vOCHzkSgiQiwbCNqoiMx0GU7h7T61VxFfO8JrOfJuFkq
 3tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786567494; x=1787172294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fDDfgxcUeDenp1TCRREpiqyxENBHO3/H9gHynAXLyRg=;
 b=bQs3Ibznjqyg3Yx1ZxzTJqzhZLhBKtu3Z59V1f3ScsBDCnbpa1Hl/HqG42kUoIBbRy
 H0Mx0V13hg9cu+oJJjwvsO3NNRy3dkSmjw8yWqNnPID5qsTS2lXwoct40AEmnN+aeeMY
 /RZb8DgjDvhOzQYEGRZm/Psl6oT0xQwe+Yk4J9ZkeJyeeJhMYt0NBIjdkVW7PQvV5SYv
 wVWJXDCLkxYBhY7hQfdfU6pPy2BrmBh9knkMSbQ2+rFtiDyenzPYO6M7DgClzTQsxg2a
 lJXjrWelK/AcDuDzcnEvLJ+iRVZw8UjspOs4GphlWLMex5q8cqCdMcch0guZC567WgfZ
 T/JA==
X-Gm-Message-State: AOJu0Ywb/gWwRvM+LUPxAlX6Ko19CEWhdPei0hBJtTnrJUZwDv6i+2h4
 6cjFavUZIgyKMBBGDbyQpXbiAOTXLIVbtDvm0X6y1V7J6WA0IY7M8SE4L/K+55CugV0=
X-Gm-Gg: AR+sD10yh0wiHk3D7dJukMyBIjFOmAcFCWbjedZL0yojOxLrFzaQNRt7tz0I4qADQBr
 LtLXxvJSC0Sor7GaWOGLpqRLHOq/W5E9JY7ZKw5DoByI8jjTDK5KFohG348Xuj6D4UnjUsZmJAQ
 TXNTDVu5KuHAhSk8Kqml+DugPT//jOiFipr7wcJV0laFvCah1P9RJMu5j0nLwxfVJ2v4cfP0mzx
 75/K7xTaCspjxmYisa0M5UEPPo8/pVVtVylawo33F0xI7ALeKAHV3x6VveDCrK6nZvVyUFqoEFf
 Q/8N/124ipwM4Hxp5wsgdpERTy0DAgSuMuPXgTVlroAVOsKdkVW6TUmykvxLYa3FBPhu3Zal0W0
 u7emOncepcG8OZHp8eyO3YGeO+VmlbKtD9+KMyUnE3SFX0D7xiPni1ysQOcZx180cvs/79phCVh
 2PsmQ22+L0rWbS5YQSBhegalhj/Yz01oQGZCegc3USwvBhYdSMhHLsYHcEmEkK8AsIlcKkp4NnD
 qLRQdXQPkwiEo764iE7IwzBHpSBOuc=
X-Received: by 2002:a05:6a00:8c01:b0:84e:89a:b8f7 with SMTP id
 d2e1a72fcca58-84fc74acd5amr639681b3a.11.1786567493959; 
 Wed, 12 Aug 2026 13:44:53 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fc4787325sm125308b3a.23.2026.08.12.13.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 13:44:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 06/10] target/arm: Move aa32_max_features to tcg/cpu32.c
Date: Wed, 12 Aug 2026 13:44:31 -0700
Message-ID: <20260812204435.295067-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812204435.295067-1-richard.henderson@linaro.org>
References: <20260812204435.295067-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

The function is unused without TCG, so move.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-max.c   | 96 ------------------------------------------
 target/arm/tcg/cpu32.c | 96 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 96 deletions(-)

diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index 7df7d015a9..8d968336a8 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -85,102 +85,6 @@ void aarch64_aa32_a57_init(ARMCPU *cpu, bool aarch64_enabled)
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
-/* Share AArch32 -cpu max features with AArch64. */
-void aa32_max_features(ARMCPU *cpu)
-{
-    uint32_t t;
-    ARMISARegisters *isar = &cpu->isar;
-
-    /* Add additional features supported by QEMU */
-    t = GET_IDREG(isar, ID_ISAR5);
-    t = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
-    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
-    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
-    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
-    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
-    SET_IDREG(isar, ID_ISAR5, t);
-
-    t = GET_IDREG(isar, ID_ISAR6);
-    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);        /* FEAT_JSCVT */
-    t = FIELD_DP32(t, ID_ISAR6, DP, 1);           /* Feat_DotProd */
-    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);          /* FEAT_FHM */
-    t = FIELD_DP32(t, ID_ISAR6, SB, 1);           /* FEAT_SB */
-    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);      /* FEAT_SPECRES */
-    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);         /* FEAT_AA32BF16 */
-    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);         /* FEAT_AA32I8MM */
-    SET_IDREG(isar, ID_ISAR6, t);
-
-    t = cpu->isar.mvfr1;
-    t = FIELD_DP32(t, MVFR1, FPHP, 3);            /* FEAT_FP16 */
-    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);          /* FEAT_FP16 */
-    cpu->isar.mvfr1 = t;
-
-    t = cpu->isar.mvfr2;
-    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3);        /* SIMD MaxNum */
-    t = FIELD_DP32(t, MVFR2, FPMISC, 4);          /* FP MaxNum */
-    cpu->isar.mvfr2 = t;
-
-    FIELD_DP32_IDREG(isar, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
-
-    t = GET_IDREG(isar, ID_MMFR4);
-    t = FIELD_DP32(t, ID_MMFR4, HPDS, 2);         /* FEAT_HPDS2 */
-    t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
-    t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
-    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
-    t = FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT2 */
-    SET_IDREG(isar, ID_MMFR4, t);
-
-    FIELD_DP32_IDREG(isar, ID_MMFR5, ETS, 2);          /* FEAT_ETS2 */
-
-    t = GET_IDREG(isar, ID_PFR0);
-    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CSV2 */
-    t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
-    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
-    SET_IDREG(isar, ID_PFR0, t);
-
-    t = GET_IDREG(isar, ID_PFR2);
-    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
-    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
-    SET_IDREG(isar, ID_PFR2, t);
-
-    t = GET_IDREG(isar, ID_DFR0);
-    t = FIELD_DP32(t, ID_DFR0, COPDBG, 10);       /* FEAT_Debugv8p8 */
-    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 10);      /* FEAT_Debugv8p8 */
-    t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
-    SET_IDREG(isar, ID_DFR0, t);
-
-    /* Debug ID registers. */
-
-    /* Bit[15] is RES1, Bit[13] and Bits[11:0] are RES0. */
-    t = 0x00008000;
-    t = FIELD_DP32(t, DBGDIDR, SE_IMP, 1);
-    t = FIELD_DP32(t, DBGDIDR, NSUHD_IMP, 1);
-    t = FIELD_DP32(t, DBGDIDR, VERSION, 10);      /* FEAT_Debugv8p8 */
-    t = FIELD_DP32(t, DBGDIDR, CTX_CMPS, 1);
-    t = FIELD_DP32(t, DBGDIDR, BRPS, 5);
-    t = FIELD_DP32(t, DBGDIDR, WRPS, 3);
-    cpu->isar.dbgdidr = t;
-
-    t = 0;
-    t = FIELD_DP32(t, DBGDEVID, PCSAMPLE, 3);
-    t = FIELD_DP32(t, DBGDEVID, WPADDRMASK, 1);
-    t = FIELD_DP32(t, DBGDEVID, BPADDRMASK, 15);
-    t = FIELD_DP32(t, DBGDEVID, VECTORCATCH, 0);
-    t = FIELD_DP32(t, DBGDEVID, VIRTEXTNS, 1);
-    t = FIELD_DP32(t, DBGDEVID, DOUBLELOCK, 1);
-    t = FIELD_DP32(t, DBGDEVID, AUXREGS, 0);
-    t = FIELD_DP32(t, DBGDEVID, CIDMASK, 0);
-    cpu->isar.dbgdevid = t;
-
-    /* Bits[31:4] are RES0. */
-    t = 0;
-    t = FIELD_DP32(t, DBGDEVID1, PCSROFFSET, 2);
-    cpu->isar.dbgdevid1 = t;
-
-    FIELD_DP32_IDREG(isar, ID_DFR1, HPMN0, 1);         /* FEAT_HPMN0 */
-}
-
 /*
  * -cpu max: a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index e1ff074b47..d5dd236152 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -749,6 +749,102 @@ type_init(arm_tcg_cpu_register_types)
 
 #endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
 
+/* Share AArch32 -cpu max features with AArch64. */
+void aa32_max_features(ARMCPU *cpu)
+{
+    uint32_t t;
+    ARMISARegisters *isar = &cpu->isar;
+
+    /* Add additional features supported by QEMU */
+    t = GET_IDREG(isar, ID_ISAR5);
+    t = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
+    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
+    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
+    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
+    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
+    SET_IDREG(isar, ID_ISAR5, t);
+
+    t = GET_IDREG(isar, ID_ISAR6);
+    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);        /* FEAT_JSCVT */
+    t = FIELD_DP32(t, ID_ISAR6, DP, 1);           /* Feat_DotProd */
+    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);          /* FEAT_FHM */
+    t = FIELD_DP32(t, ID_ISAR6, SB, 1);           /* FEAT_SB */
+    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);      /* FEAT_SPECRES */
+    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);         /* FEAT_AA32BF16 */
+    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);         /* FEAT_AA32I8MM */
+    SET_IDREG(isar, ID_ISAR6, t);
+
+    t = cpu->isar.mvfr1;
+    t = FIELD_DP32(t, MVFR1, FPHP, 3);            /* FEAT_FP16 */
+    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);          /* FEAT_FP16 */
+    cpu->isar.mvfr1 = t;
+
+    t = cpu->isar.mvfr2;
+    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3);        /* SIMD MaxNum */
+    t = FIELD_DP32(t, MVFR2, FPMISC, 4);          /* FP MaxNum */
+    cpu->isar.mvfr2 = t;
+
+    FIELD_DP32_IDREG(isar, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
+
+    t = GET_IDREG(isar, ID_MMFR4);
+    t = FIELD_DP32(t, ID_MMFR4, HPDS, 2);         /* FEAT_HPDS2 */
+    t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
+    t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
+    t = FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT2 */
+    SET_IDREG(isar, ID_MMFR4, t);
+
+    FIELD_DP32_IDREG(isar, ID_MMFR5, ETS, 2);          /* FEAT_ETS2 */
+
+    t = GET_IDREG(isar, ID_PFR0);
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CSV2 */
+    t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
+    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
+    SET_IDREG(isar, ID_PFR0, t);
+
+    t = GET_IDREG(isar, ID_PFR2);
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
+    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
+    SET_IDREG(isar, ID_PFR2, t);
+
+    t = GET_IDREG(isar, ID_DFR0);
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 10);       /* FEAT_Debugv8p8 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 10);      /* FEAT_Debugv8p8 */
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
+    SET_IDREG(isar, ID_DFR0, t);
+
+    /* Debug ID registers. */
+
+    /* Bit[15] is RES1, Bit[13] and Bits[11:0] are RES0. */
+    t = 0x00008000;
+    t = FIELD_DP32(t, DBGDIDR, SE_IMP, 1);
+    t = FIELD_DP32(t, DBGDIDR, NSUHD_IMP, 1);
+    t = FIELD_DP32(t, DBGDIDR, VERSION, 10);      /* FEAT_Debugv8p8 */
+    t = FIELD_DP32(t, DBGDIDR, CTX_CMPS, 1);
+    t = FIELD_DP32(t, DBGDIDR, BRPS, 5);
+    t = FIELD_DP32(t, DBGDIDR, WRPS, 3);
+    cpu->isar.dbgdidr = t;
+
+    t = 0;
+    t = FIELD_DP32(t, DBGDEVID, PCSAMPLE, 3);
+    t = FIELD_DP32(t, DBGDEVID, WPADDRMASK, 1);
+    t = FIELD_DP32(t, DBGDEVID, BPADDRMASK, 15);
+    t = FIELD_DP32(t, DBGDEVID, VECTORCATCH, 0);
+    t = FIELD_DP32(t, DBGDEVID, VIRTEXTNS, 1);
+    t = FIELD_DP32(t, DBGDEVID, DOUBLELOCK, 1);
+    t = FIELD_DP32(t, DBGDEVID, AUXREGS, 0);
+    t = FIELD_DP32(t, DBGDEVID, CIDMASK, 0);
+    cpu->isar.dbgdevid = t;
+
+    /* Bits[31:4] are RES0. */
+    t = 0;
+    t = FIELD_DP32(t, DBGDEVID1, PCSROFFSET, 2);
+    cpu->isar.dbgdevid1 = t;
+
+    FIELD_DP32_IDREG(isar, ID_DFR1, HPMN0, 1);         /* FEAT_HPMN0 */
+}
+
 void aarch32_max_tcg_init(ARMCPU *cpu)
 {
     aarch64_aa32_a57_init(cpu, false);
-- 
2.43.0


