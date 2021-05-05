Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4185075lfg;
        Tue, 4 May 2021 20:07:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywpb+bz2nb7WUlKDuHfxfKSkamndJoeriiW8fKjr7rHCoUpWK15w80d+3mPt4gpR9ge/cw
X-Received: by 2002:a05:6e02:685:: with SMTP id o5mr13721488ils.93.1620184050289;
        Tue, 04 May 2021 20:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620184050; cv=none;
        d=google.com; s=arc-20160816;
        b=S78QUgyzRNuBY9iHEMk2nBjYes4PEd4ww/xWQxp5+/z/xkqkRFPqlcaLjq1JlhEPgH
         8oSyzHNFgv+GF+UNnIl74nqbJ5fegBPY1bGgGvKntGBnnXQEbVL+s/euPkE5DIqUOwwS
         UaxHdYu7C1JsumO2XZ5Zt+muNn+xoFsyeptTmBCAEGEamj2n2OiF+DC3HSZq/8RHzoY+
         N5/u0cIQyzThz08UUfbObK0vamSYXgsXZGEjRjkL+xN+lLayMJvvBEqSS8o4rvbbDRiv
         f61enIxNzQEbqZON1uTSOINvt26Tp2t40otKmbFQJiR0zt+nL49obJQ4jeeBwiC6N2Lf
         Wxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jlgETGbZuRzHBHvHlcUoL6xtFf9QKaaxdVGn5r8yTJA=;
        b=UGO6x4O2rAbaudAjGhO+lkK1AryX3zYytguRwQ2D58uX3DECJQmajBH67kzhw7ewla
         uZFvnYt/sq7fMPcvSh1QrowXvyUdLtO4J4b2rSV1NkhadHWw8PrJP9YDqGBoV9Bi9IYH
         Zj6LagNbXfjNVxITBobYyjmObnYkAaeXprklqJ8aaG+xlwnnPV+uWGPHVEefj53EyjVY
         Z8OOAbcpkWvQmm7HGDvEdgOTpthukELuFYqK/x+sKy/sdzfx3iXPK9wXQQpBMYsrmNqh
         GlRNfUvgjEh9JLR6x+DbVlcstgWIHnGjBsp6A5w+MMGPzqgxolpSZTgtPESLkojz/xQq
         6+uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Gka7U2VP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si12978608jam.78.2021.05.04.20.07.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 May 2021 20:07:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=Gka7U2VP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1le7sn-0001Q3-HG
	for alex.bennee@linaro.org; Tue, 04 May 2021 23:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qe-0008Di-VB
 for qemu-arm@nongnu.org; Tue, 04 May 2021 23:05:17 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:45861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1le7qU-00032m-Op
 for qemu-arm@nongnu.org; Tue, 04 May 2021 23:05:15 -0400
Received: by mail-qv1-xf30.google.com with SMTP id u7so547163qvv.12
 for <qemu-arm@nongnu.org>; Tue, 04 May 2021 20:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlgETGbZuRzHBHvHlcUoL6xtFf9QKaaxdVGn5r8yTJA=;
 b=Gka7U2VPWD7XS/ZTppMHp81DH3AVgFEmnJCSPQkWFJCKmxh9Vsh69KLMcI25e3alRW
 MSe9PP2ACvY5t+1SPF/6ihyzK+wrmacoa3Cj1upylzQjaESfFe5Rm1fWY6yEgw42UyC0
 /7W/OuM6vr3GC4KPa+C/ZGHstGQhPgeeMY5YoJ8cb6XbLWsSldgSwx91aHcBReEHiVxt
 copkclDr260xff6T2HsdjhC2VZFncKqlCilbPB3wlTuJJ8dH+gIFPrObSv/efE/D1fBa
 yzmEPH4qB1qnlX3zFGp3SGEOia14R+E2pNtjVzXJn3nbZfb51iISFnnSj9kS3DZmxs7V
 oxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlgETGbZuRzHBHvHlcUoL6xtFf9QKaaxdVGn5r8yTJA=;
 b=OfnhtKa+ZPHFEKv2yDDS+o31sr91BXgGZqBA2n24wnJjFuNdvmDbRevxzJ5DK/1qpg
 S749Sgau5y5Z4G/gdq6TvIoDNwW2xx6gqnTFIzne0la8XbGK6/8QgOCjk02Q3+gvftB9
 wjlVecsLlBXXwf17yMUlT9CeLjG41TfqGJV5qX3pQd2R/Hbi9uerlUxRajO6XbMeX/lo
 4UhRwIAuxKk9YqR3s4eJd7YFXWC5vI/WFYH+a/K6uouaZbGiysFmz6t2TZb7QkySQGa3
 6LcVaaUwYI9eJovNn4FOoLCLTCy8LPUL1NhMDxAu9ZBLa8J4OTx8R+qkrt4wytjN8LBc
 EUMw==
X-Gm-Message-State: AOAM531wISL6dV5LBFTRG8ZI01ayuSqLW1ff+aAqckCFNXn1cJQh8akD
 XS6rWXBmHqvN4XTFD6tiOThyLg==
X-Received: by 2002:a0c:ca8c:: with SMTP id a12mr28588897qvk.14.1620183905802; 
 Tue, 04 May 2021 20:05:05 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a63sm12270550qkf.132.2021.05.04.20.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 20:05:05 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v8 2/4] target/arm: Add support for FEAT_TLBIRANGE
Date: Tue,  4 May 2021 21:04:41 -0600
Message-Id: <20210505030443.25310-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210505030443.25310-1-rebecca@nuviainc.com>
References: <20210505030443.25310-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=rebecca@nuviainc.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CzVMiTnSauwo

ARMv8.4 adds the mandatory FEAT_TLBIRANGE. It provides TLBI
maintenance instructions that apply to a range of input addresses.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h    |   5 +
 target/arm/helper.c | 296 ++++++++++++++++++++
 2 files changed, 301 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 616b39325347..5802798c3069 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4071,6 +4071,11 @@ static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) != 0;
 }
 
+static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
+}
+
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9b1b98705f91..cb10851efda8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4759,6 +4759,219 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                                                   ARMMMUIdxBit_SE3, bits);
 }
 
+#ifdef TARGET_AARCH64
+static uint64_t tlbi_aa64_range_get_length(CPUARMState *env,
+                                           uint64_t value)
+{
+    unsigned int page_shift;
+    unsigned int page_size_granule;
+    uint64_t num;
+    uint64_t scale;
+    uint64_t exponent;
+    uint64_t length;
+
+    num = extract64(value, 39, 4);
+    scale = extract64(value, 44, 2);
+    page_size_granule = extract64(value, 46, 2);
+
+    page_shift = page_size_granule * 2 + 10;
+
+    if (page_size_granule == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
+                      page_size_granule);
+        return 0;
+    }
+
+    exponent = (5 * scale) + 1;
+    length = (num + 1) << (exponent + page_shift);
+
+    return length;
+}
+
+static void tlbi_aa64_rvae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL1&0.
+     * Currently handles all of RVAE1, RVAAE1, RVAALE1 and RVALE1,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    ARMMMUIdx mmu_idx;
+    int mask;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    mask = vae1_tlbmask(env);
+    mmu_idx = ARM_MMU_IDX_A | ctz32(mask);
+    if (regime_has_2_ranges(mmu_idx)) {
+        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    } else {
+        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    }
+    length = tlbi_aa64_range_get_length(env, value);
+    bits = tlbbits_for_regime(env, mmu_idx, pageaddr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                            length, mask,
+                                                            bits);
+    } else {
+        tlb_flush_page_range_bits_by_mmuidx(cs, pageaddr, length, mask,
+                                            bits);
+    }
+}
+
+static void tlbi_aa64_rvae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    /*
+     * Invalidate by VA range, Inner/Outer Shareable EL1&0.
+     * Currently handles all of RVAE1IS, RVAE1OS, RVAAE1IS, RVAAE1OS,
+     * RVAALE1IS, RVAALE1OS, RVALE1IS and RVALE1OS, since we don't support
+     * flush-for-specific-ASID-only, flush-last-level-only or inner/outer
+     * shareable specific flushes.
+     */
+    ARMMMUIdx mmu_idx;
+    int mask;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    mask = vae1_tlbmask(env);
+    mmu_idx = ARM_MMU_IDX_A | ctz32(mask);
+    if (regime_has_2_ranges(mmu_idx)) {
+        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    } else {
+        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    }
+    length = tlbi_aa64_range_get_length(env, value);
+    bits = tlbbits_for_regime(env, mmu_idx, pageaddr);
+
+    tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                        length, mask,
+                                                        bits);
+}
+
+static void tlbi_aa64_rvae2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL2.
+     * Currently handles all of RVAE2 and RVALE2,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    bool secure;
+    int mask;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    secure = arm_is_secure_below_el3(env);
+    pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    length = tlbi_aa64_range_get_length(env, value);
+    mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
+    bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
+                              pageaddr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                            length, mask,
+                                                            bits);
+    } else {
+        tlb_flush_page_range_bits_by_mmuidx(cs, pageaddr, length, mask,
+                                            bits);
+    }
+}
+
+static void tlbi_aa64_rvae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    /*
+     * Invalidate by VA range, Inner/Outer Shareable, EL2.
+     * Currently handles all of RVAE2IS, RVAE2OS, RVALE2IS and RVALE2OS,
+     * since we don't support flush-for-specific-ASID-only,
+     * flush-last-level-only or inner/outer shareable specific flushes.
+     */
+    bool secure;
+    int mask;
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    secure = arm_is_secure_below_el3(env);
+    pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    length = tlbi_aa64_range_get_length(env, value);
+    mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
+    bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_SE2 : ARMMMUIdx_E2,
+                              pageaddr);
+
+    tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                        length, mask,
+                                                        bits);
+}
+
+static void tlbi_aa64_rvae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL3.
+     * Currently handles all of RVAE3 and RVALE3,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    length = tlbi_aa64_range_get_length(env, value);
+    bits = tlbbits_for_regime(env, ARMMMUIdx_SE3, pageaddr);
+
+    if (tlb_force_broadcast(env)) {
+        tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                            length,
+                                                            ARMMMUIdxBit_SE3,
+                                                            bits);
+    } else {
+        tlb_flush_page_range_bits_by_mmuidx(cs, pageaddr, length,
+                                            ARMMMUIdxBit_SE3,
+                                            bits);
+    }
+}
+
+static void tlbi_aa64_rvae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL3, Inner/Outer Shareable.
+     * Currently handles all of RVAE3IS, RVAE3OS, RVALE3IS and RVALE3OS,
+     * since we don't support flush-for-specific-ASID-only,
+     * flush-last-level-only or inner/outer specific flushes.
+     */
+    int bits;
+    uint64_t pageaddr;
+    uint64_t length;
+
+    CPUState *cs = env_cpu(env);
+    pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    length = tlbi_aa64_range_get_length(env, value);
+    bits = tlbbits_for_regime(env, ARMMMUIdx_SE3, pageaddr);
+
+    tlb_flush_page_range_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
+                                                        length,
+                                                        ARMMMUIdxBit_SE3,
+                                                        bits);
+}
+#endif
+
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                       bool isread)
 {
@@ -6920,6 +7133,86 @@ static const ARMCPRegInfo pauth_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo tlbirange_reginfo[] = {
+    { .name = "TLBI_RVAE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 1,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAAE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 3,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+   { .name = "TLBI_RVALE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 5,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAALE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 2, .opc2 = 7,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 1,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+    { .name = "TLBI_RVAAE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 3,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+   { .name = "TLBI_RVALE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 5,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+    { .name = "TLBI_RVAALE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 6, .opc2 = 7,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1_write },
+    { .name = "TLBI_RIPAS2E1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 2,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2LE1IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 0, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RVAE2IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 1,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+   { .name = "TLBI_RVALE2IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 5,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+    { .name = "TLBI_RIPAS2E1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 2,
+      .access = PL2_W, .type = ARM_CP_NOP },
+   { .name = "TLBI_RIPAS2LE1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RVAE2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 1,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2_write },
+   { .name = "TLBI_RVALE2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 5,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2_write },
+   { .name = "TLBI_RVAE3IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 1,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
+   { .name = "TLBI_RVALE3IS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
+   { .name = "TLBI_RVAE3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 6, .opc2 = 1,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3_write },
+   { .name = "TLBI_RVALE3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 6, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3_write },
+    REGINFO_SENTINEL
+};
+
 static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     Error *err = NULL;
@@ -8289,6 +8582,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_rndr, cpu)) {
         define_arm_cp_regs(cpu, rndr_reginfo);
     }
+    if (cpu_isar_feature(aa64_tlbirange, cpu)) {
+        define_arm_cp_regs(cpu, tlbirange_reginfo);
+    }
 #ifndef CONFIG_USER_ONLY
     /* Data Cache clean instructions up to PoP */
     if (cpu_isar_feature(aa64_dcpop, cpu)) {
-- 
2.26.2

