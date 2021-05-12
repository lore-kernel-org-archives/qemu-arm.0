Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5269513lfg;
        Wed, 12 May 2021 11:34:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGBnVZZ0NXv70HBxxwUbSJWDGPQFedmWStIg3BXEI56MqbOcLqItVoYRHUQSgmhqsloP1F
X-Received: by 2002:a02:cca4:: with SMTP id t4mr34366494jap.67.1620844456052;
        Wed, 12 May 2021 11:34:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620844456; cv=none;
        d=google.com; s=arc-20160816;
        b=R6gki4EEb9u6uyKVQ7lp/oABVvKdvxLpkN+UJ0S4vrQm5TXz3egY8RBNogZieIFZer
         8+dklI3/561+9IVZjna6STMGMA2jm1uQf6c73Y6EOMSiUowTiiRvu8ji/Rl4lSv+Qshb
         6+Zm81CKWp5Ajw4gMe6vW5pQ1zm2GzYuMY5cp1XNgzYQP4juX2bajqqTeJdIBQfPcDLI
         4NcmCHumBx9UjnuRF+rgMoWs7vGNn6x1sz3do01fjuu93fa25tUxax/BG7YcgtipfJQi
         RZELDKaxXkZ+dGstgc5AEuDXuTFyMKnVRmBwMZXLwRW3FlpNZULN58N+yU0TH89GmIDz
         TAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lSeaVPE5uPZmfHK6wI0ew2xFQvqO9fhC+YLXT9cj1PE=;
        b=k1GBTb/S706a9OtfKKzfkVAWQ14pe7JZii8dyblPEpOzgUuknKEA4YMqQW8BkwdXA4
         gVbthuUcaMcQ+5x0zRSouTDq0KUXX3XoR4/ncwvt5hJtYA/LrMkLPshBMyVGPT+eqV8f
         r4p2PT2E9bYP3a2+G061dt/9ScJEyGoR96G3TBVD/vYG0AqPXep8Y9lWm9SxtJ8iVrEM
         wOOE0aSj25u6NdMjuCaRgsIlbVNIr4UmrI57APvtdA+s9i3hdoNxjtm6Brab37QFw+Bx
         +WoU0iRPQGYtYiXrx+Pv3mIgoDtL5M2dUWiTyCI8G/3UVWAkWskRw6K/4U9liRatINC0
         cO3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="EUgbY/L+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n184si792222iod.70.2021.05.12.11.34.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 11:34:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="EUgbY/L+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgtgV-000167-Ab
	for alex.bennee@linaro.org; Wed, 12 May 2021 14:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWR-000612-AI
 for qemu-arm@nongnu.org; Wed, 12 May 2021 14:23:51 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:33639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lgtWO-0005o7-4W
 for qemu-arm@nongnu.org; Wed, 12 May 2021 14:23:50 -0400
Received: by mail-il1-x136.google.com with SMTP id z1so13107984ils.0
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lSeaVPE5uPZmfHK6wI0ew2xFQvqO9fhC+YLXT9cj1PE=;
 b=EUgbY/L+95MNr6It5lnKKBdPgaY4UeRNVdrcWUrR3aXMr1eXQ0cYPSDqM2hbJzrqSf
 C0UA8TvwMEpE0alQlRWFMvKPHsNtSGrovYj3xNcf5WxNPnab7a7AKC1qvHCYedupEQg7
 O9CpjJp0f83oA1vytYI64XtoZPvirGA4t9t9mQopQpRwp5rg0sOV7bAQEMTzcW14xSUx
 rbzPYIZaRmmDkx57EbAVceB3xkSbodIJPdiSfCFK3qubwFC9KQ7lVluEdh6CBCHx1Kuc
 Q8BWwfklHh2uC1AQ73epkzizcwPsP6IGwBHvP6ibzNzFlZxSFTnz1xnFq6JHiEyc4fUj
 TpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lSeaVPE5uPZmfHK6wI0ew2xFQvqO9fhC+YLXT9cj1PE=;
 b=ls1os/ocEGpSBNM9lagTb1wnXHuTR3QkX5vQwdbB+aa2oSwsHL8WmpgWB6zvr4hmZS
 9YBSuKRjIJkFamOTYkRmFAmqsq7HimZI5mjc9Lu+j+o99V0pIhTPiWU/fb2JQvli/RMA
 koYLO4eByDulrI1prpllW3OpASo2imBP4jKSAdTPaBzvDH+m52/Qytxrk+4vkhi2pW1A
 mNUNGAS5XKwp/7CJlhGnQbSBKWOk36HPbNRxGMOF342KkuhQF7vVoCoSI250nrHCdKPC
 fQ/NkVlXgAoI3I2fdu5Enp4SIBPAKzxaZYBUs4rr2Xo0Hvfun5uyNCSqvwMmHvGuro4n
 E9BQ==
X-Gm-Message-State: AOAM533jWV2NviZb+mpt+JGDu6rXWZqdVxBZukQVXKcZ6wIHDBz5hptt
 uhQJrMkWYLG/cLPIkuwgfJGCQFS3Sgzqiobl
X-Received: by 2002:a92:de49:: with SMTP id e9mr30766510ilr.132.1620843826940; 
 Wed, 12 May 2021 11:23:46 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id d16sm247484ilo.12.2021.05.12.11.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 11:23:46 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 1/3] target/arm: Add support for FEAT_TLBIRANGE
Date: Wed, 12 May 2021 12:23:35 -0600
Message-Id: <20210512182337.18563-2-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210512182337.18563-1-rebecca@nuviainc.com>
References: <20210512182337.18563-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B81sIGeUuuBd

ARMv8.4 adds the mandatory FEAT_TLBIRANGE. It provides TLBI
maintenance instructions that apply to a range of input addresses.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h    |   5 +
 target/arm/helper.c | 281 ++++++++++++++++++++
 2 files changed, 286 insertions(+)

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
index 3b365a78cbc3..4adb017f81a2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4759,6 +4759,172 @@ static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
+    page_shift = page_size_granule * 2 + 12;
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
+static uint64_t tlbi_aa64_range_get_base(CPUARMState *env, uint64_t value,
+                                        bool two_ranges)
+{
+    /* TODO: ARMv8.7 FEAT_LPA2 */
+    uint64_t pageaddr;
+
+    if (two_ranges) {
+        pageaddr = sextract64(value, 0, 37) << TARGET_PAGE_BITS;
+    } else {
+        pageaddr = extract64(value, 0, 37) << TARGET_PAGE_BITS;
+    }
+
+    return pageaddr;
+}
+
+static void do_rvae_write(CPUARMState *env, uint64_t value,
+                          int idxmap, bool synced)
+{
+    ARMMMUIdx one_idx = ARM_MMU_IDX_A | ctz32(idxmap);
+    bool two_ranges = regime_has_2_ranges(one_idx);
+    uint64_t baseaddr, length;
+    int bits;
+
+    baseaddr = tlbi_aa64_range_get_base(env, value, two_ranges);
+    length = tlbi_aa64_range_get_length(env, value);
+    bits = tlbbits_for_regime(env, one_idx, baseaddr);
+
+    if (synced) {
+        tlb_flush_range_by_mmuidx_all_cpus_synced(env_cpu(env),
+                                                  baseaddr,
+                                                  length,
+                                                  idxmap,
+                                                  bits);
+    } else {
+        tlb_flush_range_by_mmuidx(env_cpu(env), baseaddr,
+                                  length, idxmap, bits);
+    }
+}
+
+static void tlbi_aa64_rvae1_write(CPUARMState *env,
+                                  const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL1&0.
+     * Currently handles all of RVAE1, RVAAE1, RVAALE1 and RVALE1,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+
+    do_rvae_write(env, value, vae1_tlbmask(env),
+                  tlb_force_broadcast(env));
+}
+
+static void tlbi_aa64_rvae1is_write(CPUARMState *env,
+                                    const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    /*
+     * Invalidate by VA range, Inner/Outer Shareable EL1&0.
+     * Currently handles all of RVAE1IS, RVAE1OS, RVAAE1IS, RVAAE1OS,
+     * RVAALE1IS, RVAALE1OS, RVALE1IS and RVALE1OS, since we don't support
+     * flush-for-specific-ASID-only, flush-last-level-only or inner/outer
+     * shareable specific flushes.
+     */
+
+    do_rvae_write(env, value, vae1_tlbmask(env), true);
+}
+
+static int vae2_tlbmask(CPUARMState *env)
+{
+    return (arm_is_secure_below_el3(env)
+            ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2);
+}
+
+static void tlbi_aa64_rvae2_write(CPUARMState *env,
+                                  const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL2.
+     * Currently handles all of RVAE2 and RVALE2,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+
+    do_rvae_write(env, value, vae2_tlbmask(env),
+                  tlb_force_broadcast(env));
+
+
+}
+
+static void tlbi_aa64_rvae2is_write(CPUARMState *env,
+                                    const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    /*
+     * Invalidate by VA range, Inner/Outer Shareable, EL2.
+     * Currently handles all of RVAE2IS, RVAE2OS, RVALE2IS and RVALE2OS,
+     * since we don't support flush-for-specific-ASID-only,
+     * flush-last-level-only or inner/outer shareable specific flushes.
+     */
+
+    do_rvae_write(env, value, vae2_tlbmask(env), true);
+
+}
+
+static void tlbi_aa64_rvae3_write(CPUARMState *env,
+                                  const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL3.
+     * Currently handles all of RVAE3 and RVALE3,
+     * since we don't support flush-for-specific-ASID-only or
+     * flush-last-level-only.
+     */
+
+    do_rvae_write(env, value, ARMMMUIdxBit_SE3,
+                  tlb_force_broadcast(env));
+}
+
+static void tlbi_aa64_rvae3is_write(CPUARMState *env,
+                                    const ARMCPRegInfo *ri,
+                                    uint64_t value)
+{
+    /*
+     * Invalidate by VA range, EL3, Inner/Outer Shareable.
+     * Currently handles all of RVAE3IS, RVAE3OS, RVALE3IS and RVALE3OS,
+     * since we don't support flush-for-specific-ASID-only,
+     * flush-last-level-only or inner/outer specific flushes.
+     */
+
+    do_rvae_write(env, value, ARMMMUIdxBit_SE3, true);
+}
+#endif
+
 static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                       bool isread)
 {
@@ -6920,6 +7086,118 @@ static const ARMCPRegInfo pauth_reginfo[] = {
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
+    { .name = "TLBI_RVAE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 1,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAAE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 3,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+   { .name = "TLBI_RVALE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 5,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae1is_write },
+    { .name = "TLBI_RVAALE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 5, .opc2 = 7,
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
+   { .name = "TLBI_RVAE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 1,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+   { .name = "TLBI_RVALE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 5,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
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
+   { .name = "TLBI_RVAE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 5, .opc2 = 1,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
+   { .name = "TLBI_RVALE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 5, .opc2 = 5,
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
@@ -8289,6 +8567,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

