Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1885107ocs;
        Fri, 30 Sep 2022 10:50:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4A9MLWSCzNIHDdK/+1WOXJ6DZJxN3U+fnFxayfyWBZEVWDRgafS40v951wkxCU+VG6c6O9
X-Received: by 2002:a05:622a:1484:b0:35b:b50e:a3ad with SMTP id t4-20020a05622a148400b0035bb50ea3admr7696892qtx.299.1664560221676;
        Fri, 30 Sep 2022 10:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664560221; cv=none;
        d=google.com; s=arc-20160816;
        b=V1juhOTgEL00DlheYj7Op5mVeI6Ne5C3YlNkfcp/xr/MFnA7pEfJEdz7sj1cSuHNKf
         BI464WxNNjoG0dOiBqLBXdH79R/uHILY0M3Vp6WRmMMryu5y8Nm8FeGNWsvV/MBH1RLR
         8tw5kfaAWsJVL24KdiwVLdj0MK2TTtifdV0r0XF5XCKdgTghUflrxG+XqwGhRV4tKMa6
         AAsnG95WJ3bwV6oNoysFXvFHfnfxDiXYi5BNErpWEttlvlKVPgAEnY2KKQCpz+7GJa1x
         0MTUx8sAlUGYh8BynrgJoPz5TJwbuyWyHnY0H1sVyOaWeJuYRDzlfTGVCAqHb0Y8x8cv
         y1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/9aml6Xo1y4AfMcUR0XNUPmVm5TaV/G11ZEgQ+fDz6w=;
        b=psSYk71JrwUjhzf1CswIx7wwnC66m8Va9W9ANOil6JNmT0dHCuXb6n374NirJF6fZz
         CJhpzcFcNWNptzpuhH/cm1sO3CAW2oSCNse4+EOvqTFKonMraSepbWTp3Qs3g4dFOVf1
         xN72JKNc8ZDAIKPBGeEIXPvVHB56UKmoZw6MXZ/KVvHkHMfITZ5qpAXvGnewMGvMyrDQ
         uokslIr4S5lpKEo8gj4GRZbEHiMrlWL2iz9X788RX2/m08LuW9/gv6Wmy1em0UC8vo9u
         hrscgM0W9xB3cwpTgXIewB5EraldEqpGHNVy//KUfeJ+zKU4I0bNSZZpJCA+8MPOVGC6
         rsCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vMDPDXne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020ac84049000000b0034355c33802si1588566qtl.90.2022.09.30.10.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 10:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vMDPDXne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeK9V-0002CK-5h
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 13:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeK8I-0002AS-Ks
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 13:49:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeK8E-0006np-G2
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 13:49:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id r6so7946224wru.8
 for <qemu-arm@nongnu.org>; Fri, 30 Sep 2022 10:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=/9aml6Xo1y4AfMcUR0XNUPmVm5TaV/G11ZEgQ+fDz6w=;
 b=vMDPDXner1I4x+FGio4WgkJhVXcO6yP4Id7vB/6ok2ejQiAOeiO5Gz7wEJ/WJJ16Zh
 uQJgs7U7JljZww/qhvA1Yp3DrSCxRlry3PuJFqCnOaxG7NutLxmly9+YPfpUSWGqesA3
 kuLjmm3suC/Z8VX3RI21Am6Qfua6ASKFjQBQTa8OwysFkpJfR1z/QsBDvuhQOj9J6cQM
 +ANVrM1x0Q7RyCZ10dDEHObn0EcKVjxUNhetrGdoV5VAlOKaMpHPQB5xEf1w/dJm8v0u
 i0ol9yGhho8gK4UPT50MMFadmiJPUsolXUWfURQCgjjQTI1kbleMyhgr8h23xtfxryqC
 xHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/9aml6Xo1y4AfMcUR0XNUPmVm5TaV/G11ZEgQ+fDz6w=;
 b=DeHGWoYXT2qm46IDs/gZgeUahdxTnOBsG6KCTBFMvtePXPQl9+W7WcQc7BiaAdoYSc
 6N2prD78H12RjJfg/cUJZdt1urhrZTyFQQDLYrsa5mw8cnDC6R0M2wRlSON9sKZ8Cn+x
 MkSbWWfA9smghCF8b0t0zKvkG5LQIHbH+b0h/H3XD2xdZbpgBrwiMiPUznzFTuR+yzn1
 +1yYcKAvjAjSJ9oBFCJmnjQuaL9FzwC3GaNPCpf2Y70I984mINlcXESQkzV+LBeF9dAP
 vNbXk489fooS+GLXyGgjCaayoTNvPiJSLz8lXl6gK/l1Cxx112nT72nEuHDUm0d8PsTh
 SWWg==
X-Gm-Message-State: ACrzQf1LngABX9S6KbtZpLB1W+hrgPbMogdR+WUlMdQYbBrYYtQ3IgrV
 U/+cg1zLXGGMBPR8+OuqwQmBixi1vYh5xw==
X-Received: by 2002:a05:6000:144b:b0:22c:9161:76b4 with SMTP id
 v11-20020a056000144b00b0022c916176b4mr6224193wrx.145.1664560140918; 
 Fri, 30 Sep 2022 10:49:00 -0700 (PDT)
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b003b47e8a5d22sm7703541wmh.23.2022.09.30.10.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 10:49:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Don't allow guest to use unimplemented
 granule sizes
Date: Fri, 30 Sep 2022 18:48:52 +0100
Message-Id: <20220930174853.2233633-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930174853.2233633-1-peter.maydell@linaro.org>
References: <20220930174853.2233633-1-peter.maydell@linaro.org>
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iC3A0h8ArtIc

Arm CPUs support some subset of the granule (page) sizes 4K, 16K and
64K.  The guest selects the one it wants using bits in the TCR_ELx
registers.  If it tries to program these registers with a value that
is either reserved or which requests a size that the CPU does not
implement, the architecture requires that the CPU behaves as if the
field was programmed to some size that has been implemented.
Currently we don't implement this, and instead let the guest use any
granule size, even if the CPU ID register fields say it isn't
present.

Make aa64_va_parameters() check against the supported granule size
and force use of a different one if it is not implemented.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Unusually, the architecture would allow us to do this sanitizing
when the TCR_ELx register is written, because it permits that the
value of the register read back can be one corresponding to the
IMPDEF chosen size rather than having to be the value written.
But I opted to do the handling in aa64_va_parameters() anyway,
on the assumption that this isn't critically in the fast path.
---
 target/arm/cpu.h    |  33 +++++++++++++
 target/arm/helper.c | 110 ++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 135 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 33cdbc0143e..6d39d27378d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4103,6 +4103,39 @@ static inline bool isar_feature_aa64_tgran16_2_lpa2(const ARMISARegisters *id)
     return t >= 3 || (t == 0 && isar_feature_aa64_tgran16_lpa2(id));
 }
 
+static inline bool isar_feature_aa64_tgran4(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 0;
+}
+
+static inline bool isar_feature_aa64_tgran16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16) >= 1;
+}
+
+static inline bool isar_feature_aa64_tgran64(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN64) >= 0;
+}
+
+static inline bool isar_feature_aa64_tgran4_2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4_2);
+    return t >= 2 || (t == 0 && isar_feature_aa64_tgran4(id));
+}
+
+static inline bool isar_feature_aa64_tgran16_2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN16_2);
+    return t >= 2 || (t == 0 && isar_feature_aa64_tgran16(id));
+}
+
+static inline bool isar_feature_aa64_tgran64_2(const ARMISARegisters *id)
+{
+    unsigned t = FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN64_2);
+    return t >= 2 || (t == 0 && isar_feature_aa64_tgran64(id));
+}
+
 static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b5dac651e75..7c4eea58739 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10289,20 +10289,113 @@ static int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
     }
 }
 
+typedef enum GranuleSize {
+    /* Same order as TG0 encoding */
+    Gran4K,
+    Gran64K,
+    Gran16K,
+    GranInvalid,
+} GranuleSize;
+
+static GranuleSize tg0_to_gran_size(int tg)
+{
+    switch (tg) {
+    case 0:
+        return Gran4K;
+    case 1:
+        return Gran64K;
+    case 2:
+        return Gran16K;
+    default:
+        return GranInvalid;
+    }
+}
+
+static GranuleSize tg1_to_gran_size(int tg)
+{
+    switch (tg) {
+    case 1:
+        return Gran16K;
+    case 2:
+        return Gran4K;
+    case 3:
+        return Gran64K;
+    default:
+        return GranInvalid;
+    }
+}
+
+static inline bool have4k(ARMCPU *cpu, bool stage2)
+{
+    return stage2 ? cpu_isar_feature(aa64_tgran4_2, cpu)
+        : cpu_isar_feature(aa64_tgran4, cpu);
+}
+
+static inline bool have16k(ARMCPU *cpu, bool stage2)
+{
+    return stage2 ? cpu_isar_feature(aa64_tgran16_2, cpu)
+        : cpu_isar_feature(aa64_tgran16, cpu);
+}
+
+static inline bool have64k(ARMCPU *cpu, bool stage2)
+{
+    return stage2 ? cpu_isar_feature(aa64_tgran64_2, cpu)
+        : cpu_isar_feature(aa64_tgran64, cpu);
+}
+
+static GranuleSize sanitize_gran_size(ARMCPU *cpu, GranuleSize gran,
+                                      bool stage2)
+{
+    switch (gran) {
+    case Gran4K:
+        if (have4k(cpu, stage2)) {
+            return gran;
+        }
+        break;
+    case Gran16K:
+        if (have16k(cpu, stage2)) {
+            return gran;
+        }
+        break;
+    case Gran64K:
+        if (have64k(cpu, stage2)) {
+            return gran;
+        }
+        break;
+    case GranInvalid:
+        break;
+    }
+    /*
+     * If the guest selects a granule size that isn't implemented,
+     * the architecture requires that we behave as if it selected one
+     * that is (with an IMPDEF choice of which one to pick). We choose
+     * to implement the smallest supported granule size.
+     */
+    if (have4k(cpu, stage2)) {
+        return Gran4K;
+    }
+    if (have16k(cpu, stage2)) {
+        return Gran16K;
+    }
+    assert(have64k(cpu, stage2));
+    return Gran64K;
+}
+
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
     bool epd, hpd, using16k, using64k, tsz_oob, ds;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
+    GranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
+    bool stage2 = mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
         tsz = extract32(tcr, 0, 6);
-        using64k = extract32(tcr, 14, 1);
-        using16k = extract32(tcr, 15, 1);
-        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        gran = tg0_to_gran_size(extract32(tcr, 14, 2));
+        if (stage2) {
             /* VTCR_EL2 */
             hpd = false;
         } else {
@@ -10320,16 +10413,13 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         select = extract64(va, 55, 1);
         if (!select) {
             tsz = extract32(tcr, 0, 6);
+            gran = tg0_to_gran_size(extract32(tcr, 14, 2));
             epd = extract32(tcr, 7, 1);
             sh = extract32(tcr, 12, 2);
-            using64k = extract32(tcr, 14, 1);
-            using16k = extract32(tcr, 15, 1);
             hpd = extract64(tcr, 41, 1);
         } else {
-            int tg = extract32(tcr, 30, 2);
-            using16k = tg == 1;
-            using64k = tg == 3;
             tsz = extract32(tcr, 16, 6);
+            gran = tg1_to_gran_size(extract32(tcr, 30, 2));
             epd = extract32(tcr, 23, 1);
             sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
@@ -10338,6 +10428,10 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ds = extract64(tcr, 59, 1);
     }
 
+    gran = sanitize_gran_size(cpu, gran, stage2);
+    using64k = gran == Gran64K;
+    using16k = gran == Gran16K;
+
     if (cpu_isar_feature(aa64_st, cpu)) {
         max_tsz = 48 - using64k;
     } else {
-- 
2.25.1

