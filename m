Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2264204lfg;
        Mon, 8 Mar 2021 15:12:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1g7O8eSxHHhJF3DVTPXLVAGEG3CyHYOAPtWXO4OvB7OB/HEctYSL5LY2BA33K7x6mEG/v
X-Received: by 2002:ab0:2e91:: with SMTP id f17mr13966015uaa.74.1615245133165;
        Mon, 08 Mar 2021 15:12:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615245133; cv=none;
        d=google.com; s=arc-20160816;
        b=M6Q9bgqDT8omo9Om3j7AtevckuoYZBMwwyZdEuSdNvTMZH9TY7lTYFvpfItcUFQPB5
         QvKBoqnKnEjLuSCacEEUGSNDvZf8aEk6cWL4LSqVb57ogta2QRKP38IYxCFXlYF/Vs1S
         4BaVwKK5esX55+SBBu97CKLcDEQCbz6v+Q6m7KmDpSBwXoq1NBW5EG3IvbxpM+Tby8Il
         Ora5t80jfYaHRz7ywCuJyVd1Rqk7ytUpsgpKksUaQUMP5DKV2oRcrX4WD1zvD9EGdxzz
         h+7Zhj4uxTQAU4Cv8r5M58f3kGuKJZIQ1Ene5QAd+mp78/aLYquID1sJK3EYpmpDqd5B
         Wffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FuLXWEBDT/nStPlCbNrQBm4sbdZi+U37XXkIK2ucmsg=;
        b=t9Ev9WogxHz6ybyk5YHM6hEDqeabUaNpBxXOMtjlOIZ2XSuvbDRnIBElqFk13pJ2F2
         tRH8QSjFacto7F4HY9KYuKjSnutm25DXC4fpFDE75YLzjOxPHJhzQtH4LZQ5jN+ulvM4
         EMrYWdmv95GfJSKEeVD1QbiNwGyaqH3auzWMq41AoQir1OZD6emeDHyiNkVDHDxSIjtY
         LM86TmcsGHyMA9IsDz8wxRg37wiK3BDyzulsQzhE0442mO/Szs2OpPdj6IOMYEG2sd4x
         oP7VtuvozeN3zpIEv55Ev1X9Jc/OG2qDtN+BQfuBB0RKhhJjYp0v1WLCXdowueXtixZy
         tHAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=dsoRLoPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si1036438vsn.151.2021.03.08.15.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 15:12:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=dsoRLoPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJP2q-0002lB-Cw
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 18:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJP2B-0001oN-DN
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 18:11:31 -0500
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:46546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJP29-0005lV-GT
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 18:11:31 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id 15so5490915qvp.13
 for <qemu-arm@nongnu.org>; Mon, 08 Mar 2021 15:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuLXWEBDT/nStPlCbNrQBm4sbdZi+U37XXkIK2ucmsg=;
 b=dsoRLoPohlr8Bico/8+xdK6T8HKMP+5ILLqZYtbR08bWqWE/qYKT7dJb39m2w/fonn
 LayfHoKZWZssapre1j/FDRJ0MAss2UukCHapSyLa5/UBV7H+9XQRZnPXFvdA7DOsenWX
 drDDMSmzQWtEHSX3B3JYKHZv+plg9zf2l4ovEeK+ExBM2F1Ou3K39hnwuwzhKVe9pTYc
 8zzZ9+PrHr734SsciXVsBbJY/vS6vL+kPMH9UagZ4ZgpI2tHOlTbkeDgjcCDL5qOfxoT
 ftgIq+c4RtOKWMnI40I8uP/ywH4iGCEI5eHtlaLIqHS3EI3mVwi6lCjruByivHbGlZAh
 7JRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuLXWEBDT/nStPlCbNrQBm4sbdZi+U37XXkIK2ucmsg=;
 b=HFhDWGAI5U0bUw8qTTABzbbJ9E4N9rpTt5PN2oSyrJ/fOSq+fnS6PgV2UuLKYvu8JR
 N5QKoduW+A59wVHn0L1kf3Nz64DLhWKI0TfJSu5t+YXL04+hXa4Ge5jSKIhTkcwNnDtg
 qUN8gGH0Prl+Cgdt7rJZqoJlCTpWv2ANzDCEHDEER6uBAwdGCDqMw1fhVvyYyOVppa5H
 BDXZk6T6xu6q9Y0I7jxkIQGdppka4Gafhbglf7pvTwBg6oO9wYF4UFob1aoKPsqH19EC
 CfymIytZQBsodzuhCNA0azz+6zI8dxOXTdV65F9Tmpv9J0RvkzqCOQGZRzi/cay2iO5N
 Od0w==
X-Gm-Message-State: AOAM533GlFb6qBP86urIsL9EcnKmKNYbBCIJCJgvj+yVBFhrb/DSncRv
 n25rdngmNdtQeZ1xAtkIyVjDrA==
X-Received: by 2002:ad4:44a9:: with SMTP id n9mr23628964qvt.60.1615245088694; 
 Mon, 08 Mar 2021 15:11:28 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id z6sm3312342qto.70.2021.03.08.15.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 15:11:28 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 2/3] target/arm: Add support for FEAT_TLBIOS
Date: Mon,  8 Mar 2021 16:11:16 -0700
Message-Id: <20210308231117.12650-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308231117.12650-1-rebecca@nuviainc.com>
References: <20210308231117.12650-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=rebecca@nuviainc.com; helo=mail-qv1-xf2b.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 07Vi28Lm3u38

ARMv8.4 adds the mandatory FEAT_TLBIOS. It provides TLBI
maintenance instructions that extend to the Outer Shareable domain.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h    |  6 ++
 target/arm/helper.c | 75 ++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 782a77c7ca3b..1cab297f0fa6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4035,6 +4035,12 @@ static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
 }
 
+static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 1 ||
+           FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
+}
+
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2505afe5f65c..64d97dfa254d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7147,6 +7147,78 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo tlbios_reginfo[] = {
+    { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
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
+    { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle2is_write },
+   { .name = "TLBI_ALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
+    { .name = "TLBI_VMALLS12E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
+    { .name = "TLBI_IPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 3,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_IPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 7,
+      .access = PL2_W, .type = ARM_CP_NOP },
+   { .name = "TLBI_RVAE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 1,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+   { .name = "TLBI_RVALE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 5,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae2is_write },
+    { .name = "TLBI_ALLE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle3is_write },
+   { .name = "TLBI_RVAE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 5, .opc2 = 1,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
+   { .name = "TLBI_RVALE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 5, .opc2 = 5,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_rvae3is_write },
+    REGINFO_SENTINEL
+};
+
 static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     Error *err = NULL;
@@ -8516,6 +8588,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_tlbirange, cpu)) {
         define_arm_cp_regs(cpu, tlbirange_reginfo);
     }
+    if (cpu_isar_feature(aa64_tlbios, cpu)) {
+        define_arm_cp_regs(cpu, tlbios_reginfo);
+    }
 #ifndef CONFIG_USER_ONLY
     /* Data Cache clean instructions up to PoP */
     if (cpu_isar_feature(aa64_dcpop, cpu)) {
-- 
2.26.2

