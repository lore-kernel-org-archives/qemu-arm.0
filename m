Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3426632njb;
        Tue, 10 Dec 2024 08:06:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXQOccYtnhTV4XOmCV9P3QYIWK1iY4FAz3CbXX+RqcRkWg+k04L1TUaWuR1Tl/7jBuKwIScD8iEmPgWMA==@linaro.org
X-Google-Smtp-Source: AGHT+IHiJzOYiduXFWRTMl7V8lbQiEA+oH0BKSXXtCUosinZo73Xqfi4HMo/TS4nyFgOkQSiheJ2
X-Received: by 2002:a05:6102:d8a:b0:4af:f6e5:2b46 with SMTP id ada2fe7eead31-4b11608bc29mr5975250137.9.1733846775825;
        Tue, 10 Dec 2024 08:06:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733846775; cv=none;
        d=google.com; s=arc-20240605;
        b=bTrs5Z2LnwqalMufSAh5n4dRxs7LYs+fTXSCkimXFheoOm2UkR7zuIv5Q88tw4gQgC
         9VnTxwUmF+wFKBJiOKYNtQpqfqftro+NOJVWFxW5dklnALCUl/WN3zC5c+YWQhXBtSEf
         1/n/nEo2cB505q40SWCqlIjW6qXutINj4Ze5Rw9r5XX58Q9ohexlbLN3rw+c7MsFYzBO
         q+gY4OMgsxQkUQ6urhAO9T/jz06Vna5i50TPu24SmAwiAQtZpYtMltg4o2YLLoyEHJFw
         VqBT1rvINNgRqs1zkKyi0tllkKuEnvVTeu1xr5hedaLZRwLYfOtbAyMGflB1tzvkHMKd
         1VIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3x05ToQXS1sFrMCb0A0LAmrCwUQI8ZMhFz2ZtZaJsG8=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=l24L1j7beZCh3UEdKFaKqp6yC7/hTRNwZgouwbQnpJmmKzHuOpxkuQGHmNnmwyphV0
         O5ULOqWpm5hJqTrCkedzshsfrREU09B3hoqRfHtKE6hMes+ytA59Cz3L4W+XIs6d30op
         JQUOkx51/hJvc5hxvQcgz+yE0+Sj2WbFqURvA0Kie5Sd3tdwg2hunJe2YlkS8QkhyjTW
         i3DTDw9+emjWarBI8kqxgcE3TzEVIE/OH+LlKI2owf8eiaGZudURdkFCZWgfakx/vHcr
         p+fysODvafXEF67RfRaMIFpEdrzLLAw/34goJW1bMYtzTLuiFgNO8T3H+68olErf+1SS
         bThw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MrOp9Cav;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afede3a98esi1297876137.335.2024.12.10.08.06.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:06:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MrOp9Cav;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2k1-0001KL-V2; Tue, 10 Dec 2024 11:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tL2jx-0001Dc-QB
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:05:37 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tL2jv-0004cn-9e
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:05:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-435004228c0so17479725e9.0
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733846734; x=1734451534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3x05ToQXS1sFrMCb0A0LAmrCwUQI8ZMhFz2ZtZaJsG8=;
 b=MrOp9CavjeU33kBttDPaBhCb4j+mcFtv+LiXRezCdjByn4dYys7bYppwOFWXiEpWhp
 hPO7L75/0eKMRb5hf4nAhwngGpdZW09UxsHrj9ngRU9KxHtNflrxVodOuAHdDnufMwb9
 FylkxbfvJoOaQ+TtssboklXcb1Q6RHfKrd2xrTHinFlycIMrfqKzYvIMHJeWdJove75N
 qLo7RS2SlhIYxB7vuHt5KfZfyllN/jZXVTvH/73GLRHU2tfE0QhkGWqfyeZY3NgKchrl
 W8r2oXqjqle91orhmbXG9YRL6h/LYwgYn1Z3fmiQZmxCK5DtK4FDaApevlJRi5rhPVJi
 M4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733846734; x=1734451534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3x05ToQXS1sFrMCb0A0LAmrCwUQI8ZMhFz2ZtZaJsG8=;
 b=hyE9+dhMbUcJOBSgiq+rmO0BUzFekQBXMfNXVL3LtozDh0IEnFEc+KdDCH2v2J3Oam
 tI2fKk2sn8d0ahMISaGCW2pntAwQ8LbXY+aRNoMPs+hAFWd7IMfF5lYFSdeGxYiF0ieD
 TMd1eElLCU2/7ZrBSAZSFbfJMdfuD1Yt8pfMmzp4GrYFR9SBi7gsZys62rphJ+hmONWx
 sVsIRPAxZ3HVhV4ccQscXv7V49SpSz3b2iKfo9o7LJVuED46q5Hu+RxyNzyh2FkYQgeu
 5GPB51asHYWgZllyPtUfDH+7YN//t2W9R5tII2Zg4DmE8+7z6kvkdRPDvBL4ftxCNj0v
 Evpw==
X-Gm-Message-State: AOJu0Yxi+R79sGzem3k8Ex2tm+MuCTSqDePS26Lr0aQY/QoHRaZYa5qF
 MjtSZ2+81ju5fImRgLkWhdRbzf3FBgC0HUx2hNk0j3fou0a2B9QT9TaEajwcjiUQYOgjsL0uAPg
 W
X-Gm-Gg: ASbGncuMGW/KWPif3k8Y3s8eCmlmkS71nnjOe7Uxij/99Zk7MLGuu5bDV7BLXOLpYX9
 CKJAzuNr1She/aQmJh31hCTQvOGFWF9rZppER7W0Iq6zoDAgxyq4zGKepxH1OyidvpD5IDJqjTG
 hiW+XnB7h0WSQh8FKV0WkfEaZLw8M8z7mIU3ZJ26qjScu06OPq4+e7wTp5CgZYYusiSGMhoLOS+
 399S8JzWB9HkkAlN6iit88an8v0g+oBLdtt7Mo7i50S7KcbxwtEbMcKWNdf
X-Received: by 2002:a7b:cb8b:0:b0:434:f817:4492 with SMTP id
 5b1f17b1804b1-434fffba064mr61973695e9.31.1733846732126; 
 Tue, 10 Dec 2024 08:05:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434e8ec8072sm124671605e9.18.2024.12.10.08.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:05:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/10] target/arm: Move small helper functions to tlb-insns.c
Date: Tue, 10 Dec 2024 16:04:50 +0000
Message-Id: <20241210160452.2427965-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210160452.2427965-1-peter.maydell@linaro.org>
References: <20241210160452.2427965-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: y5qjpXWySxdd

The remaining functions that we temporarily made global are now
used only from callsits in tlb-insns.c; move them across and
make them file-local again.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h        |  34 ------
 target/arm/helper.c        | 220 -------------------------------------
 target/arm/tcg/tlb-insns.c | 220 +++++++++++++++++++++++++++++++++++++
 3 files changed, 220 insertions(+), 254 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index fe838bcfd97..cc7c54378f4 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -1134,38 +1134,4 @@ static inline bool arm_cpreg_traps_in_nv(const ARMCPRegInfo *ri)
     return ri->opc1 == 4 || ri->opc1 == 5;
 }
 
-/*
- * Temporary declarations of functions until the move to tlb_insn_helper.c
- * is complete and we can make the functions static again
- */
-CPAccessResult access_ttlb(CPUARMState *env, const ARMCPRegInfo *ri,
-                           bool isread);
-CPAccessResult access_ttlbis(CPUARMState *env, const ARMCPRegInfo *ri,
-                             bool isread);
-CPAccessResult access_ttlbos(CPUARMState *env, const ARMCPRegInfo *ri,
-                             bool isread);
-bool tlb_force_broadcast(CPUARMState *env);
-int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
-                       uint64_t addr);
-int vae1_tlbbits(CPUARMState *env, uint64_t addr);
-int vae2_tlbbits(CPUARMState *env, uint64_t addr);
-int vae1_tlbmask(CPUARMState *env);
-int vae2_tlbmask(CPUARMState *env);
-int ipas2e1_tlbmask(CPUARMState *env, int64_t value);
-int e2_tlbmask(CPUARMState *env);
-void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                               uint64_t value);
-void tlbi_aa64_alle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t value);
-void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                            uint64_t value);
-void tlbi_aa64_alle2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t value);
-void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                            uint64_t value);
-void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                            uint64_t value);
-void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t value);
-
 #endif /* TARGET_ARM_CPREGS_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f7d56e809f..cd9f8650316 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -365,40 +365,6 @@ static CPAccessResult access_tacr(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
-/* Check for traps from EL1 due to HCR_EL2.TTLB. */
-CPAccessResult access_ttlb(CPUARMState *env, const ARMCPRegInfo *ri,
-                           bool isread)
-{
-    if (arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_TTLB)) {
-        return CP_ACCESS_TRAP_EL2;
-    }
-    return CP_ACCESS_OK;
-}
-
-/* Check for traps from EL1 due to HCR_EL2.TTLB or TTLBIS. */
-CPAccessResult access_ttlbis(CPUARMState *env, const ARMCPRegInfo *ri,
-                             bool isread)
-{
-    if (arm_current_el(env) == 1 &&
-        (arm_hcr_el2_eff(env) & (HCR_TTLB | HCR_TTLBIS))) {
-        return CP_ACCESS_TRAP_EL2;
-    }
-    return CP_ACCESS_OK;
-}
-
-#ifdef TARGET_AARCH64
-/* Check for traps from EL1 due to HCR_EL2.TTLB or TTLBOS. */
-CPAccessResult access_ttlbos(CPUARMState *env, const ARMCPRegInfo *ri,
-                             bool isread)
-{
-    if (arm_current_el(env) == 1 &&
-        (arm_hcr_el2_eff(env) & (HCR_TTLB | HCR_TTLBOS))) {
-        return CP_ACCESS_TRAP_EL2;
-    }
-    return CP_ACCESS_OK;
-}
-#endif
-
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -455,16 +421,6 @@ int alle1_tlbmask(CPUARMState *env)
             ARMMMUIdxBit_Stage2_S);
 }
 
-/*
- * Non-IS variants of TLB operations are upgraded to
- * IS versions if we are at EL1 and HCR_EL2.FB is effectively set to
- * force broadcast of these operations.
- */
-bool tlb_force_broadcast(CPUARMState *env)
-{
-    return arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_FB);
-}
-
 static const ARMCPRegInfo cp_reginfo[] = {
     /*
      * Define the secure and non-secure FCSE identifier CP registers
@@ -4680,182 +4636,6 @@ static CPAccessResult access_tocu(CPUARMState *env, const ARMCPRegInfo *ri,
     return do_cacheop_pou_access(env, HCR_TOCU | HCR_TPU);
 }
 
-/*
- * See: D4.7.2 TLB maintenance requirements and the TLB maintenance instructions
- * Page D4-1736 (DDI0487A.b)
- */
-
-int vae1_tlbmask(CPUARMState *env)
-{
-    uint64_t hcr = arm_hcr_el2_eff(env);
-    uint16_t mask;
-
-    assert(arm_feature(env, ARM_FEATURE_AARCH64));
-
-    if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-        mask = ARMMMUIdxBit_E20_2 |
-               ARMMMUIdxBit_E20_2_PAN |
-               ARMMMUIdxBit_E20_0;
-    } else {
-        /* This is AArch64 only, so we don't need to touch the EL30_x TLBs */
-        mask = ARMMMUIdxBit_E10_1 |
-               ARMMMUIdxBit_E10_1_PAN |
-               ARMMMUIdxBit_E10_0;
-    }
-    return mask;
-}
-
-int vae2_tlbmask(CPUARMState *env)
-{
-    uint64_t hcr = arm_hcr_el2_eff(env);
-    uint16_t mask;
-
-    if (hcr & HCR_E2H) {
-        mask = ARMMMUIdxBit_E20_2 |
-               ARMMMUIdxBit_E20_2_PAN |
-               ARMMMUIdxBit_E20_0;
-    } else {
-        mask = ARMMMUIdxBit_E2;
-    }
-    return mask;
-}
-
-/* Return 56 if TBI is enabled, 64 otherwise. */
-int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
-                       uint64_t addr)
-{
-    uint64_t tcr = regime_tcr(env, mmu_idx);
-    int tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
-    int select = extract64(addr, 55, 1);
-
-    return (tbi >> select) & 1 ? 56 : 64;
-}
-
-int vae1_tlbbits(CPUARMState *env, uint64_t addr)
-{
-    uint64_t hcr = arm_hcr_el2_eff(env);
-    ARMMMUIdx mmu_idx;
-
-    assert(arm_feature(env, ARM_FEATURE_AARCH64));
-
-    /* Only the regime of the mmu_idx below is significant. */
-    if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-        mmu_idx = ARMMMUIdx_E20_0;
-    } else {
-        mmu_idx = ARMMMUIdx_E10_0;
-    }
-
-    return tlbbits_for_regime(env, mmu_idx, addr);
-}
-
-int vae2_tlbbits(CPUARMState *env, uint64_t addr)
-{
-    uint64_t hcr = arm_hcr_el2_eff(env);
-    ARMMMUIdx mmu_idx;
-
-    /*
-     * Only the regime of the mmu_idx below is significant.
-     * Regime EL2&0 has two ranges with separate TBI configuration, while EL2
-     * only has one.
-     */
-    if (hcr & HCR_E2H) {
-        mmu_idx = ARMMMUIdx_E20_2;
-    } else {
-        mmu_idx = ARMMMUIdx_E2;
-    }
-
-    return tlbbits_for_regime(env, mmu_idx, addr);
-}
-
-void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                               uint64_t value)
-{
-    CPUState *cs = env_cpu(env);
-    int mask = vae1_tlbmask(env);
-
-    tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
-}
-
-int e2_tlbmask(CPUARMState *env)
-{
-    return (ARMMMUIdxBit_E20_0 |
-            ARMMMUIdxBit_E20_2 |
-            ARMMMUIdxBit_E20_2_PAN |
-            ARMMMUIdxBit_E2);
-}
-
-void tlbi_aa64_alle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t value)
-{
-    CPUState *cs = env_cpu(env);
-    int mask = alle1_tlbmask(env);
-
-    tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
-}
-
-void tlbi_aa64_alle2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t value)
-{
-    CPUState *cs = env_cpu(env);
-    int mask = e2_tlbmask(env);
-
-    tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
-}
-
-void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t value)
-{
-    CPUState *cs = env_cpu(env);
-
-    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_E3);
-}
-
-void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                            uint64_t value)
-{
-    CPUState *cs = env_cpu(env);
-    int mask = vae1_tlbmask(env);
-    uint64_t pageaddr = sextract64(value << 12, 0, 56);
-    int bits = vae1_tlbbits(env, pageaddr);
-
-    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
-}
-
-void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                                   uint64_t value)
-{
-    CPUState *cs = env_cpu(env);
-    int mask = vae2_tlbmask(env);
-    uint64_t pageaddr = sextract64(value << 12, 0, 56);
-    int bits = vae2_tlbbits(env, pageaddr);
-
-    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
-}
-
-void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                            uint64_t value)
-{
-    CPUState *cs = env_cpu(env);
-    uint64_t pageaddr = sextract64(value << 12, 0, 56);
-    int bits = tlbbits_for_regime(env, ARMMMUIdx_E3, pageaddr);
-
-    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
-                                                  ARMMMUIdxBit_E3, bits);
-}
-
-int ipas2e1_tlbmask(CPUARMState *env, int64_t value)
-{
-    /*
-     * The MSB of value is the NS field, which only applies if SEL2
-     * is implemented and SCR_EL3.NS is not set (i.e. in secure mode).
-     */
-    return (value >= 0
-            && cpu_isar_feature(aa64_sel2, env_archcpu(env))
-            && arm_is_secure_below_el3(env)
-            ? ARMMMUIdxBit_Stage2_S
-            : ARMMMUIdxBit_Stage2);
-}
-
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                       bool isread)
 {
diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
index 45ebfc512f9..51b4756e31e 100644
--- a/target/arm/tcg/tlb-insns.c
+++ b/target/arm/tcg/tlb-insns.c
@@ -13,6 +13,40 @@
 #include "cpu-features.h"
 #include "cpregs.h"
 
+/* Check for traps from EL1 due to HCR_EL2.TTLB. */
+static CPAccessResult access_ttlb(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    if (arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_TTLB)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
+/* Check for traps from EL1 due to HCR_EL2.TTLB or TTLBIS. */
+static CPAccessResult access_ttlbis(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
+{
+    if (arm_current_el(env) == 1 &&
+        (arm_hcr_el2_eff(env) & (HCR_TTLB | HCR_TTLBIS))) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
+#ifdef TARGET_AARCH64
+/* Check for traps from EL1 due to HCR_EL2.TTLB or TTLBOS. */
+static CPAccessResult access_ttlbos(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
+{
+    if (arm_current_el(env) == 1 &&
+        (arm_hcr_el2_eff(env) & (HCR_TTLB | HCR_TTLBOS))) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+#endif
+
 /* IS variants of TLB operations must affect all cores */
 static void tlbiall_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
@@ -46,6 +80,16 @@ static void tlbimvaa_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_page_all_cpus_synced(cs, value & TARGET_PAGE_MASK);
 }
 
+/*
+ * Non-IS variants of TLB operations are upgraded to
+ * IS versions if we are at EL1 and HCR_EL2.FB is effectively set to
+ * force broadcast of these operations.
+ */
+static bool tlb_force_broadcast(CPUARMState *env)
+{
+    return arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_FB);
+}
+
 static void tlbiall_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
@@ -170,6 +214,102 @@ static void tlbiall_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_E2);
 }
 
+/*
+ * See: D4.7.2 TLB maintenance requirements and the TLB maintenance instructions
+ * Page D4-1736 (DDI0487A.b)
+ */
+
+static int vae1_tlbmask(CPUARMState *env)
+{
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    uint16_t mask;
+
+    assert(arm_feature(env, ARM_FEATURE_AARCH64));
+
+    if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+        mask = ARMMMUIdxBit_E20_2 |
+               ARMMMUIdxBit_E20_2_PAN |
+               ARMMMUIdxBit_E20_0;
+    } else {
+        /* This is AArch64 only, so we don't need to touch the EL30_x TLBs */
+        mask = ARMMMUIdxBit_E10_1 |
+               ARMMMUIdxBit_E10_1_PAN |
+               ARMMMUIdxBit_E10_0;
+    }
+    return mask;
+}
+
+static int vae2_tlbmask(CPUARMState *env)
+{
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    uint16_t mask;
+
+    if (hcr & HCR_E2H) {
+        mask = ARMMMUIdxBit_E20_2 |
+               ARMMMUIdxBit_E20_2_PAN |
+               ARMMMUIdxBit_E20_0;
+    } else {
+        mask = ARMMMUIdxBit_E2;
+    }
+    return mask;
+}
+
+/* Return 56 if TBI is enabled, 64 otherwise. */
+static int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
+                       uint64_t addr)
+{
+    uint64_t tcr = regime_tcr(env, mmu_idx);
+    int tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+    int select = extract64(addr, 55, 1);
+
+    return (tbi >> select) & 1 ? 56 : 64;
+}
+
+static int vae1_tlbbits(CPUARMState *env, uint64_t addr)
+{
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    ARMMMUIdx mmu_idx;
+
+    assert(arm_feature(env, ARM_FEATURE_AARCH64));
+
+    /* Only the regime of the mmu_idx below is significant. */
+    if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+        mmu_idx = ARMMMUIdx_E20_0;
+    } else {
+        mmu_idx = ARMMMUIdx_E10_0;
+    }
+
+    return tlbbits_for_regime(env, mmu_idx, addr);
+}
+
+static int vae2_tlbbits(CPUARMState *env, uint64_t addr)
+{
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    ARMMMUIdx mmu_idx;
+
+    /*
+     * Only the regime of the mmu_idx below is significant.
+     * Regime EL2&0 has two ranges with separate TBI configuration, while EL2
+     * only has one.
+     */
+    if (hcr & HCR_E2H) {
+        mmu_idx = ARMMMUIdx_E20_2;
+    } else {
+        mmu_idx = ARMMMUIdx_E2;
+    }
+
+    return tlbbits_for_regime(env, mmu_idx, addr);
+}
+
+static void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
+
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
+}
+
 static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                     uint64_t value)
 {
@@ -183,6 +323,14 @@ static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static int e2_tlbmask(CPUARMState *env)
+{
+    return (ARMMMUIdxBit_E20_0 |
+            ARMMMUIdxBit_E20_2 |
+            ARMMMUIdxBit_E20_2_PAN |
+            ARMMMUIdxBit_E2);
+}
+
 static void tlbi_aa64_alle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                   uint64_t value)
 {
@@ -210,6 +358,32 @@ static void tlbi_aa64_alle3_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_by_mmuidx(cs, ARMMMUIdxBit_E3);
 }
 
+static void tlbi_aa64_alle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = alle1_tlbmask(env);
+
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
+}
+
+static void tlbi_aa64_alle2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = e2_tlbmask(env);
+
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
+}
+
+static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+
+    tlb_flush_by_mmuidx_all_cpus_synced(cs, ARMMMUIdxBit_E3);
+}
+
 static void tlbi_aa64_vae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
@@ -241,6 +415,17 @@ static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
     tlb_flush_page_by_mmuidx(cs, pageaddr, ARMMMUIdxBit_E3);
 }
 
+static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = vae1_tlbmask(env);
+    uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = vae1_tlbbits(env, pageaddr);
+
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
+}
+
 static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                  uint64_t value)
 {
@@ -262,6 +447,41 @@ static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    int mask = vae2_tlbmask(env);
+    uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = vae2_tlbbits(env, pageaddr);
+
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
+}
+
+static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   uint64_t value)
+{
+    CPUState *cs = env_cpu(env);
+    uint64_t pageaddr = sextract64(value << 12, 0, 56);
+    int bits = tlbbits_for_regime(env, ARMMMUIdx_E3, pageaddr);
+
+    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                  ARMMMUIdxBit_E3, bits);
+}
+
+static int ipas2e1_tlbmask(CPUARMState *env, int64_t value)
+{
+    /*
+     * The MSB of value is the NS field, which only applies if SEL2
+     * is implemented and SCR_EL3.NS is not set (i.e. in secure mode).
+     */
+    return (value >= 0
+            && cpu_isar_feature(aa64_sel2, env_archcpu(env))
+            && arm_is_secure_below_el3(env)
+            ? ARMMMUIdxBit_Stage2_S
+            : ARMMMUIdxBit_Stage2);
+}
+
 static void tlbi_aa64_ipas2e1_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                     uint64_t value)
 {
-- 
2.34.1

