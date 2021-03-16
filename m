Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4692753lfg;
        Tue, 16 Mar 2021 08:50:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN5domqMWufULvaV7MyAEEOvR2G1t1TRiB5BOIu3QjhhCljkR/RcniVEQnTdpcUtEbPkQa
X-Received: by 2002:a5d:80d5:: with SMTP id h21mr3893178ior.11.1615909807481;
        Tue, 16 Mar 2021 08:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615909807; cv=none;
        d=google.com; s=arc-20160816;
        b=frYNT1Y8d/6ua16eH9kr/pLb4wReMLfSTsX3bcZxZVcUbrvOT1DsUBubaPZ0zQHSJ6
         43aITrCpJ33JrLkl9qLNEwDsU5pK1uBmUCZYlCxyS+w+aPV0kn3D8PRVBTnIhELV4fIh
         QQwcsY4CaFBx8bupqscPQZ13z1CqNEqgANNHb0LP1a/jSIfboK+o8TJ6FzKvO2FwIBp1
         kEc4Vel169lOSYtc6fbm1P1TgbcpUvau5ZIc5mpUiY2459kkIn6SLYm7oeWOddT4L0N6
         dQt7mkxle0cl5s5maA+svqLH9DOPdw2DKTXdUIvp0vVjmUQtFc3WHSr6rbeEiFAamiBm
         Hlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=c1KETVQxlesPGOxLpbPCGBEToWENT6MfthnXoeOv+EA=;
        b=McO9NNpvknyYg3amUqpvCzuiaH+wFZtxoFrZJCwfQQ28NpIydbDLBZJZbfARP8UVC/
         eM5/KazldCgPGpDcDyZtD7CI+omVtdm9mL+iW9PF/auMu88qLrF5Av0lgtjg8tB/4YTg
         H1YkZgEhyBQfA9N6hYYzGR5VnJyNSLzrJ6xipLGCCj+METbZ5r+4xMNX2dgLfLnGisnS
         2B3uFNaDLXa0Syodc8M6MFWwxopqGeuTMnSnVUPogg+Yy+FzQy6ZSY/OiFzHvnS1chs9
         SogYu5jwNKHkOChl2iuzP8NnTzKZoCU4HvinGXlcHtj2qqnt5XdewwQH4e5aEmy4W2Vo
         xHyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=pHp8HwcI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9si12309144jas.111.2021.03.16.08.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 08:50:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=pHp8HwcI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMBxO-0008Oi-Fg
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 11:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBwk-0007yG-Mx
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 11:49:26 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBwi-0002PG-DS
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 11:49:26 -0400
Received: by mail-qt1-x830.google.com with SMTP id m7so11964200qtq.11
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 08:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c1KETVQxlesPGOxLpbPCGBEToWENT6MfthnXoeOv+EA=;
 b=pHp8HwcI5t1R7qryBqakQXCh5IuzqcGtBDtkQw2hSeeX3Ox2oUCUssRpoLx3QsuZBq
 2RswZ2dLXD1Xsnw0vQj2ekAoygmT+NrdH+7dmLxhhwp4Xd3d5/nUBQzi2cI/FurJstw9
 4Ia7B8l0mpriiKsAFwVXP/Jz0cbT35R0BgyiUFecvh8QwjsGbV8qidjeOSLIvOW2JJDW
 uKcshc6FOAR299A4DiO0AborotHyxd8quTehh2MmX/Ifh7BzZPK4gizJuuz1htnkGNz+
 wBhgsIYSBcgvVzXgAQfWn9rqs8QeW0JbRu3a3EnCcoXjwDYarcE8ASodZbkOHwnYWpNn
 JzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c1KETVQxlesPGOxLpbPCGBEToWENT6MfthnXoeOv+EA=;
 b=D4gRpbmRKsUid07Er7PH+ePQ/ArO6Sawr9kM4ny9rEUtFNEjcCTtiDXYP7Y3Z5na0G
 j1y80aLD4LuC1dpnxsTz6y1ZTJTv5rJQcB41STsDzEzUcl3aoKdshmpY5D3ezOB2CviZ
 T2N282pEy59kqTkYEVzXeyTgowVsafv8e1PgQ4LjLhSTFdPNeMYjpBmkAAdQFsJ/hi2s
 jTvnrF9ZBMRP0qWsuExdG2m+9NQpZxySjRp9BQdqsmVRkIpuX8KzmUjj6xEueB5+zLVu
 gXoq2lhH2n3+nQihr1PopLGjh6zmGuDncmA0GXvFC5BRa/4tpqrSBNiY2tUCmP4q2WIQ
 ZWsQ==
X-Gm-Message-State: AOAM533UQjO7ufjyPCeCwWqf6hBOwdRk2gCWKKCBS7qW1i5z81Gq8QwE
 TNAQfnzCr1hvtDlh8QksnZu17w==
X-Received: by 2002:ac8:7b8b:: with SMTP id p11mr295944qtu.57.1615909763487;
 Tue, 16 Mar 2021 08:49:23 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id n5sm14855623qkp.133.2021.03.16.08.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 08:49:23 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v4 2/3] target/arm: Add support for FEAT_TLBIOS
Date: Tue, 16 Mar 2021 09:49:09 -0600
Message-Id: <20210316154910.25804-3-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316154910.25804-1-rebecca@nuviainc.com>
References: <20210316154910.25804-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=rebecca@nuviainc.com; helo=mail-qt1-x830.google.com
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
X-TUID: LwIoNCpuMWjP

ARMv8.4 adds the mandatory FEAT_TLBIOS. It provides TLBI
maintenance instructions that extend to the Outer Shareable domain.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu.h    |  5 ++
 target/arm/helper.c | 75 ++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 32b78a4ef587..272fde83ca4e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4043,6 +4043,11 @@ static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
 }
 
+static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) != 0;
+}
+
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7133454330d3..afcbb5e30c18 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7235,6 +7235,78 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
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
@@ -8607,6 +8679,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

