Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp172740lfq;
        Fri, 8 Apr 2022 17:11:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8sDYYwE8jpqenln3IxJlmw1Sx6zLovObXz8rUPeDr2uYiEpD9G6uZ+p8ZVUyaN5RB0eKi
X-Received: by 2002:a05:622a:1822:b0:2e1:b2d4:d877 with SMTP id t34-20020a05622a182200b002e1b2d4d877mr18268874qtc.630.1649463093946;
        Fri, 08 Apr 2022 17:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649463093; cv=none;
        d=google.com; s=arc-20160816;
        b=I2SUKs4P9TmfL/9QCx/uAZFjC9PqjvjbkBudVR3Li/psb5F6CEXTOlvJPY6aFxvqze
         3DXK3EQM7Ri1m3EkBBRxeV/fCgLIDeSDMX6L3tWu5xy64b+gz9rfxZxn7UlnpGLlQUnn
         bFPcsHHrmrdHXmk/HGOEsnFW79nSjdb2hCGPJFZoal+xYCwDwdMdFxPuQ97D4QCbJqQa
         BvkjnYvaFKr8jjK/b/cj/2UE+tpyrsonW3IOotBi6oJMDuzHNBwfSaiRanXFIohSmAPd
         LrOmrZZYU2Imo8PghI/SJpknXMm1Z778aKNcL84ld/3J7Rj0IGZBbvdGjE3A3GqynnAM
         E5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kYlBQs73M0s8RmpgWsEfo4P2xw9UaQj0M1CIAVxBygs=;
        b=J0S2RxjollfHLaxbEajBt9/FD1lKkgUY6piDyjrK2pQovzPYZ3vAfO5tchxXXO5tHz
         Ec7EmS9f5n/Kh4GDool/DEsv4plxmld/n4Wo92TBxW1eHwufVx0Pu5xtqc61oUCb2RYc
         gFo8Xk9QNLHTF00ATJ5xeBDvbteKfjzVZ7RX8ddnew6evi/8U5hgpi/bHQtSdhbA4PP6
         xzFDKHgAEysnXj/iPR8ZVwkrLvLdMReLyUTCE6XkRjSdVANR2yQHSleUiEjCp610T453
         H3yC8LvgpB2EYwaNxeyEyXDuLAwEZ1IPOkk8Iv+kBb0FQlD2UJwTlyaImlgoMS+8qJOn
         u+6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ku8d76b2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4-20020a05620a240400b0069bdb0a1233si1476600qkn.360.2022.04.08.17.11.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:11:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ku8d76b2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyhR-0006VV-Dp
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydp-0008C2-Tp
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:49 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:43600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydn-0003Q1-Gl
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:49 -0400
Received: by mail-pl1-x635.google.com with SMTP id d15so9238796pll.10
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kYlBQs73M0s8RmpgWsEfo4P2xw9UaQj0M1CIAVxBygs=;
 b=ku8d76b2Wj+/2k6ZCWSEHAU2i8RuWBpfTZWEz6tedzulxBNIBl/NSCfCDJ2uCWy2Ni
 Zv3g0WegNss0MPEvLe46AnyWiS7E7fXue6Crd4STbB6Qwd1Ft3jkAWiWGuiDbD1pQs2L
 4MVHLro35ZXCDqSEyyz6kwp/rDAIGEteWrjPf69KshwQJWc6LUEYa60xmG3ozBeoNpI3
 l8qoj5aF8W/eYxplE5L9XQQV5+/A6UXBjd4xAuYdQN+qJk8ftzr3BDZMXH+JeRsnAePt
 CSztShXIxLRNH7KWLEJ1TsLyJC7xiCTPxjQfxqT9/zouudu3jgAqEBHgiJzQOfaDksts
 GM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kYlBQs73M0s8RmpgWsEfo4P2xw9UaQj0M1CIAVxBygs=;
 b=SGYiNYkv2HcggX67VItjcGxEVo/sT0sEKn4sx9MlSi/ZVhCY6ibESU+cGr7sRcQJHi
 Rb4NZUilATDQXgVljRCb9xNT0ZJ39W69CZ7s4mHAsA5G4GV8qc8NdMhyx1MHButDDcdn
 duoI7qTTBaQJaf3T7YPYiFZ43ya5jF83K/XBBFDVq/MRECnCL10nidKabHm/ipNoQL9c
 /Lrzrkr9ISDq3pFPhRNuM5LZ7sdH8xrbyuwngfGMyNclOwPCGEu8gLJFEEufHJJTev82
 LATBks3y34rd2n/0r7OuXKwawc8rbSQHjWzKVPl1V611DZszfBLe1Uk4DiDHNIRsD+fe
 BtXg==
X-Gm-Message-State: AOAM53221NZbP0PGaGoFoWB6Kya0jRZukkQbCcvD8l9gS5+sFn9dwPjK
 DWq0AzV+qMF8ct/Kp6SJ/BZfEw==
X-Received: by 2002:a17:902:e889:b0:151:a56d:eb8f with SMTP id
 w9-20020a170902e88900b00151a56deb8fmr21116042plg.142.1649462866110; 
 Fri, 08 Apr 2022 17:07:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/16] target/arm: Update qemu-system-arm -cpu max to
 cortex-a57
Date: Fri,  8 Apr 2022 17:07:29 -0700
Message-Id: <20220409000742.293691-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zxf7IXXsouzu

Instead of starting with cortex-a15 and adding v8 features to
a v7 cpu, begin with a v8 cpu stripped of its aarch64 features.
This fixes the long-standing to-do where we only enabled v8
features for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 134 ++++++++++++++++++++++++++-----------------
 1 file changed, 80 insertions(+), 54 deletions(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 13d0e9b195..43ac3e27fa 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -938,71 +938,97 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
 static void arm_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t t;
 
-    cortex_a15_initfn(obj);
+    /* aarch64_a57_initfn, advertising none of the aarch64 features */
+    cpu->dtb_compatible = "arm,cortex-a57";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr = 0x411fd070;
+    cpu->revidr = 0x00000000;
+    cpu->reset_fpsid = 0x41034070;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+    cpu->ctr = 0x8444c004;
+    cpu->reset_sctlr = 0x00c50838;
+    cpu->isar.id_pfr0 = 0x00000131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x03010066;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x10101105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01260000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232042;
+    cpu->isar.id_isar3 = 0x01112131;
+    cpu->isar.id_isar4 = 0x00011142;
+    cpu->isar.id_isar5 = 0x00011121;
+    cpu->isar.id_isar6 = 0;
+    cpu->isar.dbgdidr = 0x3516d000;
+    cpu->clidr = 0x0a200023;
+    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
+    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
+    cpu->ccsidr[2] = 0x70ffe07a; /* 2048KB L2 cache */
 
-    /* old-style VFP short-vector support */
+    /* Break with true ARMv8 and add back old-style VFP short-vector support */
     cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
 
-#ifdef CONFIG_USER_ONLY
-    /*
-     * We don't set these in system emulation mode for the moment,
-     * since we don't correctly set (all of) the ID registers to
-     * advertise them.
-     */
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    {
-        uint32_t t;
+    /* Add additional features supported by QEMU */
+    t = cpu->isar.id_isar5;
+    t = FIELD_DP32(t, ID_ISAR5, AES, 2);
+    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
+    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
+    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
+    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
+    cpu->isar.id_isar5 = t;
 
-        t = cpu->isar.id_isar5;
-        t = FIELD_DP32(t, ID_ISAR5, AES, 2);
-        t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
-        t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
-        t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-        t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
-        t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
-        cpu->isar.id_isar5 = t;
+    t = cpu->isar.id_isar6;
+    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
+    t = FIELD_DP32(t, ID_ISAR6, DP, 1);
+    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
+    t = FIELD_DP32(t, ID_ISAR6, SB, 1);
+    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
+    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
+    cpu->isar.id_isar6 = t;
 
-        t = cpu->isar.id_isar6;
-        t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
-        t = FIELD_DP32(t, ID_ISAR6, DP, 1);
-        t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
-        t = FIELD_DP32(t, ID_ISAR6, SB, 1);
-        t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
-        t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
-        t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
-        cpu->isar.id_isar6 = t;
+    t = cpu->isar.mvfr1;
+    t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
+    cpu->isar.mvfr1 = t;
 
-        t = cpu->isar.mvfr1;
-        t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
-        t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
-        cpu->isar.mvfr1 = t;
+    t = cpu->isar.mvfr2;
+    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
+    t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
+    cpu->isar.mvfr2 = t;
 
-        t = cpu->isar.mvfr2;
-        t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
-        t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-        cpu->isar.mvfr2 = t;
+    t = cpu->isar.id_mmfr3;
+    t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
+    cpu->isar.id_mmfr3 = t;
 
-        t = cpu->isar.id_mmfr3;
-        t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
-        cpu->isar.id_mmfr3 = t;
+    t = cpu->isar.id_mmfr4;
+    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
+    t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+    t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
+    cpu->isar.id_mmfr4 = t;
 
-        t = cpu->isar.id_mmfr4;
-        t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
-        t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-        t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
-        t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
-        cpu->isar.id_mmfr4 = t;
+    t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, DIT, 1);
+    cpu->isar.id_pfr0 = t;
 
-        t = cpu->isar.id_pfr0;
-        t = FIELD_DP32(t, ID_PFR0, DIT, 1);
-        cpu->isar.id_pfr0 = t;
-
-        t = cpu->isar.id_pfr2;
-        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
-        cpu->isar.id_pfr2 = t;
-    }
-#endif /* CONFIG_USER_ONLY */
+    t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+    cpu->isar.id_pfr2 = t;
 }
 #endif /* !TARGET_AARCH64 */
 
-- 
2.25.1

