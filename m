Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp173663lfq;
        Fri, 8 Apr 2022 17:13:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtQnUKxxad+Uku/qU0kidEfPAMtIROr2GWn+vwZT9S84kGkrRMXMs6kUWMzFkmmlKPmHwX
X-Received: by 2002:a05:6214:2aaa:b0:441:5342:8614 with SMTP id js10-20020a0562142aaa00b0044153428614mr18550687qvb.63.1649463221894;
        Fri, 08 Apr 2022 17:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649463221; cv=none;
        d=google.com; s=arc-20160816;
        b=f0IF13caF96KnAtLGuYFF03QN/Af0fqQdB+uLmuz+Lt0R4Ih0uMzQ/fodVeF5dueiq
         2MjJqas2VbumWye74i/MTnIzR/ezKhqGEDTsM454wRO326ptjjmVsGpxDH0TtLaHaSVZ
         2/Va6vsNJsp8UPx6h/sWAKSX+X1ioBXc+goyYbEcZBkpH707CQW2pqVlUoc+33Njpcll
         e6WPuE3ZFFZo6ClGafGiuPGEcMFO+MhSAu1RG4XSQun+wOuFytUlRp0SzZ4pyyGTeQs/
         wli061SbXkcTj5zFdbZnHC5HHuLf1p98iBxT/GnlW+hf58gCMuOIZ6t0JGj37/OeAIqY
         Xrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8JpR2Ocg8Fx42QQsZ4oj5FYsojYTBwIWUurppokMXyo=;
        b=Fkuyxf3Pec9XHqiiCcAvrcbdRqOO5Eehbn8WOWewW88PRnu0v3vipV/cwDkRPp3e1t
         xO1Tfy4nWOEn1zINi1pZVn/caSWwqBHvwb598ywFuWy9DBdRib04SyGAE0mpvnVTlV0X
         Gfy97AeTJdaN6E8YJKnNm8V5fqMy36eh5BAjoaFMhrjXMbqi59UtNRdNeHOgJBekwVem
         R53R5Vz36Kcogx0dt6Q/Ngexh1FF3BMgQcQZ5mTCJ8L/JDDCVf7k8pORPaBVHcVNvdnm
         NMHBikpO/VZsPBoN71DTOaHk1xt43FJs1owMLpJ6Go4NXNKS607H0pwsvZW5GG9/erVt
         N0sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gRd8KWCz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a05620a29c100b0067e4be23874si1589094qkp.185.2022.04.08.17.13.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:13:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gRd8KWCz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyjV-0001if-Bv
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydr-0008H5-HD
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:51 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydp-0003Qs-6M
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:51 -0400
Received: by mail-pl1-x629.google.com with SMTP id t6so2905615plg.7
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8JpR2Ocg8Fx42QQsZ4oj5FYsojYTBwIWUurppokMXyo=;
 b=gRd8KWCzGqoak1CZL/ytekaK3xiaVNeoTLm1aNo+McCev/84zEJuhPwmN79KvImghO
 YJ4gELWHAob+BTEdEdjnBDFzf1IUgMi/mTxbnb6pc+TB1Ze7JKRHRKN/wjDb85hqNYV0
 lqU5rKDlpqaJsY2XL4Ys9DwRQT+Htsn9GumBv3scAuRPcH0o1QbGTMm/tAad8VMRrQev
 poYmz/DLj2vAa5RM6dMAUdAKTNxe2lU1eNN4vxx/JBxcCb3kSguIRyY0gMA8OZa3Ngvg
 NyZW6R+UtjvRTn5SBt9xekZIdiPCcBlXQw4CfZzs57Y07AH7/3o6PuusYSMSvsft3DIU
 Xa5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8JpR2Ocg8Fx42QQsZ4oj5FYsojYTBwIWUurppokMXyo=;
 b=Zgux9vXzL9mAkOGI3AI+OEghVz8NX/TJsc78J5gbp4Fut0TfgZoyC9+ezrxTf6RC9I
 wbKeixgLu03EiOCqmNhbL449Z1NrTsEFQW5gVDNsudI6VNZSViu5rguTs+f6YSFIxLLU
 mK8LxXhAuvBoQ5PCATtgZuyKwWDO9yEgAuX79S6biFbyWRHxZRdXpI7T6eJBlmpN0Iwi
 eA3oZQUtB2oe0b7XJMMUV8P7M+XA6W6K6SBFFpAU/4vBAPtNIbHqKvufZujRKpuaPOrp
 MmLtlvWEwokS/CV7ioIPfgDxBwgF/x3aEObvvswmaGdmGP9BIklp3Y/ngYIJOg0E3/ds
 vsMQ==
X-Gm-Message-State: AOAM533gj3xOWTDbhHnQ4bDE4L2bBZNYSGNhp2Mz7FjOjMC8IF15u6YX
 TK69VOwjbwzf8f5gUBeaJ+yO5s47fO9n4A==
X-Received: by 2002:a17:903:11cc:b0:151:71e4:dadc with SMTP id
 q12-20020a17090311cc00b0015171e4dadcmr21400095plh.78.1649462867830; 
 Fri, 08 Apr 2022 17:07:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/16] target/arm: Split out arm32_max_features
Date: Fri,  8 Apr 2022 17:07:31 -0700
Message-Id: <20220409000742.293691-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pi6tMsvzj6+n

Share the code to set AArch32 max features so that we no
longer have code drift between qemu{-system,}-{arm,aarch64}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |   2 +
 target/arm/cpu64.c     |  51 +----------------
 target/arm/cpu_tcg.c   | 121 ++++++++++++++++++++++-------------------
 3 files changed, 70 insertions(+), 104 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 7f696cd36a..596fd53619 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1295,4 +1295,6 @@ int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
 #endif
 
+void arm32_max_features(ARMCPU *cpu);
+
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index eb44c05822..13621530bc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -34,6 +34,7 @@
 #include "hvf_arm.h"
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
+#include "internals.h"
 
 
 #ifndef CONFIG_USER_ONLY
@@ -738,7 +739,6 @@ static void aarch64_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
-    uint32_t u;
 
     if (kvm_enabled() || hvf_enabled()) {
         /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
@@ -853,57 +853,12 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
     cpu->isar.id_aa64zfr0 = t;
 
-    /* Replicate the same data to the 32-bit id registers.  */
-    u = cpu->isar.id_isar5;
-    u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
-    u = FIELD_DP32(u, ID_ISAR5, SHA1, 1);
-    u = FIELD_DP32(u, ID_ISAR5, SHA2, 1);
-    u = FIELD_DP32(u, ID_ISAR5, CRC32, 1);
-    u = FIELD_DP32(u, ID_ISAR5, RDM, 1);
-    u = FIELD_DP32(u, ID_ISAR5, VCMA, 1);
-    cpu->isar.id_isar5 = u;
-
-    u = cpu->isar.id_isar6;
-    u = FIELD_DP32(u, ID_ISAR6, JSCVT, 1);
-    u = FIELD_DP32(u, ID_ISAR6, DP, 1);
-    u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
-    u = FIELD_DP32(u, ID_ISAR6, SB, 1);
-    u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
-    u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
-    u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
-    cpu->isar.id_isar6 = u;
-
-    u = cpu->isar.id_pfr0;
-    u = FIELD_DP32(u, ID_PFR0, DIT, 1);
-    cpu->isar.id_pfr0 = u;
-
-    u = cpu->isar.id_pfr2;
-    u = FIELD_DP32(u, ID_PFR2, SSBS, 1);
-    cpu->isar.id_pfr2 = u;
-
-    u = cpu->isar.id_mmfr3;
-    u = FIELD_DP32(u, ID_MMFR3, PAN, 2); /* ATS1E1 */
-    cpu->isar.id_mmfr3 = u;
-
-    u = cpu->isar.id_mmfr4;
-    u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
-    u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-    u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
-    u = FIELD_DP32(u, ID_MMFR4, XNX, 1); /* TTS2UXN */
-    cpu->isar.id_mmfr4 = u;
-
     t = cpu->isar.id_aa64dfr0;
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
     cpu->isar.id_aa64dfr0 = t;
 
-    u = cpu->isar.id_dfr0;
-    u = FIELD_DP32(u, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
-    cpu->isar.id_dfr0 = u;
-
-    u = cpu->isar.mvfr1;
-    u = FIELD_DP32(u, MVFR1, FPHP, 3);      /* v8.2-FP16 */
-    u = FIELD_DP32(u, MVFR1, SIMDHP, 2);    /* v8.2-FP16 */
-    cpu->isar.mvfr1 = u;
+    /* Replicate the same data to the 32-bit id registers.  */
+    arm32_max_features(cpu);
 
 #ifdef CONFIG_USER_ONLY
     /*
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 9569e496e0..2a0f67f128 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -19,6 +19,70 @@
 #include "hw/boards.h"
 #endif
 
+/* Share AArch32 -cpu max features with AArch64. */
+void arm32_max_features(ARMCPU *cpu)
+{
+    uint32_t t;
+
+    /* Break with true ARMv8 and add back old-style VFP short-vector support */
+    t = cpu->isar.mvfr0;
+    t = FIELD_DP32(t, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 = t;
+
+    /* Add additional features supported by QEMU */
+    t = cpu->isar.id_isar5;
+    t = FIELD_DP32(t, ID_ISAR5, AES, 2);
+    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
+    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
+    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
+    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
+    cpu->isar.id_isar5 = t;
+
+    t = cpu->isar.id_isar6;
+    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
+    t = FIELD_DP32(t, ID_ISAR6, DP, 1);
+    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
+    t = FIELD_DP32(t, ID_ISAR6, SB, 1);
+    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
+    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
+    cpu->isar.id_isar6 = t;
+
+    t = cpu->isar.mvfr1;
+    t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
+    cpu->isar.mvfr1 = t;
+
+    t = cpu->isar.mvfr2;
+    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
+    t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
+    cpu->isar.mvfr2 = t;
+
+    t = cpu->isar.id_mmfr3;
+    t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
+    cpu->isar.id_mmfr3 = t;
+
+    t = cpu->isar.id_mmfr4;
+    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
+    t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+    t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
+    cpu->isar.id_mmfr4 = t;
+
+    t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, DIT, 1);
+    cpu->isar.id_pfr0 = t;
+
+    t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+    cpu->isar.id_pfr2 = t;
+
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+}
+
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
@@ -938,7 +1002,6 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 static void arm_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    uint32_t t;
 
     /* aarch64_a57_initfn, advertising none of the aarch64 features */
     cpu->dtb_compatible = "arm,cortex-a57";
@@ -978,61 +1041,7 @@ static void arm_max_initfn(Object *obj)
     cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
     cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
 
-    /* Break with true ARMv8 and add back old-style VFP short-vector support */
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-
-    /* Add additional features supported by QEMU */
-    t = cpu->isar.id_isar5;
-    t = FIELD_DP32(t, ID_ISAR5, AES, 2);
-    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
-    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
-    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
-    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
-    cpu->isar.id_isar5 = t;
-
-    t = cpu->isar.id_isar6;
-    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
-    t = FIELD_DP32(t, ID_ISAR6, DP, 1);
-    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
-    t = FIELD_DP32(t, ID_ISAR6, SB, 1);
-    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
-    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
-    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
-    cpu->isar.id_isar6 = t;
-
-    t = cpu->isar.mvfr1;
-    t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
-    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
-    cpu->isar.mvfr1 = t;
-
-    t = cpu->isar.mvfr2;
-    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
-    t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-    cpu->isar.mvfr2 = t;
-
-    t = cpu->isar.id_mmfr3;
-    t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
-    cpu->isar.id_mmfr3 = t;
-
-    t = cpu->isar.id_mmfr4;
-    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
-    t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-    t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
-    t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
-    cpu->isar.id_mmfr4 = t;
-
-    t = cpu->isar.id_pfr0;
-    t = FIELD_DP32(t, ID_PFR0, DIT, 1);
-    cpu->isar.id_pfr0 = t;
-
-    t = cpu->isar.id_pfr2;
-    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
-    cpu->isar.id_pfr2 = t;
-
-    t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
-    cpu->isar.id_dfr0 = t;
+    arm32_max_features(cpu);
 }
 #endif /* !TARGET_AARCH64 */
 
-- 
2.25.1

