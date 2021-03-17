Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp856954lfg;
        Wed, 17 Mar 2021 16:36:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVz72sQBj2MJtTyE2Wdz51xUgvSZMIoVTpoAo5kko+6V8j1lNi6DsUIAJcxsv+JYcM7mer
X-Received: by 2002:ad4:4ae9:: with SMTP id cp9mr1764215qvb.20.1616024165008;
        Wed, 17 Mar 2021 16:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616024165; cv=none;
        d=google.com; s=arc-20160816;
        b=ijCgIabV06zDFQnIV7KHWkxzyvGD1XICgji/hGs+BD8pO4JLa4qYakr1x2awc6/Br1
         OaAyqqwf+L9HV8Aq0Kysp5T7C4JtyIc0DeHHbRJ5jhi/NpmT6ddCDJLgdHsxij4+sb1w
         /guUMxexssWoXmtzbTOeKtEcfSIBt0ZJ0c9yNS1FJomm05C16/uK44JdwzBMz9lzqxGO
         jws95jdYna/UdYpDnXByLxhB8PHIUVz6VEj3x+prKX83BUO5FSSlMhh++aRCwASA5Fl5
         EwdO9aAcsYSt/Nin9N3Qsa8iAsy5A4ZTM/GHXwRP7FjsUKbYDp4Eu8m6MGtXvaSUzVEo
         vMmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=isLK5SgCVgmU05FBFa6ZughRqyflJB/ni8lS60DTSH8=;
        b=yhrL17XFWRzNtadKUHicN1B/KgPI6zb567JoPmVJwSABrwfHbFUvtbdRFjCnr57BPf
         YKS0Lps/yF7unxyXslEP72W2+IrEwzjM0yPFUNi9aFxYs70X/CpBmzFWjnwGW+jCKTOT
         QG1xGYelqpuFjmdlYTDqYFF7yWMNPBAmfN5RcfODFG9fwhb+VIBzl50/yjeK9zZ6OzMO
         wYMBo9aku54RRiSlHwcXpKDujT1T8cAXO47iYadx25R2JUGm6evYvOLerd8MyAKOQT5w
         TcfaXuS7xGdddXLulvgz/gyexDWVyLetuvuR17xsp/iglVH6dnuQih82/k6d5avKqwJ4
         THdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="sRUd4R/w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 138si218920qkd.279.2021.03.17.16.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 16:36:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="sRUd4R/w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMfhr-0006gQ-CK
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 19:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff7-0004KP-5Q
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 19:33:13 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:46990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMff4-0001tw-QM
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 19:33:12 -0400
Received: by mail-io1-xd29.google.com with SMTP id j26so378633iog.13
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 16:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=isLK5SgCVgmU05FBFa6ZughRqyflJB/ni8lS60DTSH8=;
 b=sRUd4R/w+jHBbh5/u0kXMXm3q0KS+NxS3womL6TX1qnogInbtZJiRuk+VXSKNvaSGN
 Unvp/vWq3V7GEDJ1swHvJCJDqz9vzvInXoa+JHPjCVWtBJN07uQNro8TBAZdc5na53r4
 TNyQrBqXkbpNHLLfZMfHIHNZWImAsRtS6r4HzOsflUOyKRJFEfTOv7O0zVt6BDPfw3mv
 bE9+wejfuU954Ik2lbVUOl2uqhwog2kpMSs3u2ZXv85Q1oVbRLs9aFnBejHSaRP/NYzG
 uLd3nR8DjBM8YegQ0IWUcdEVZ5DuG/3oLKc1QQRFODm/Oh+218kRUA40SoI+brecAJ47
 ffLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=isLK5SgCVgmU05FBFa6ZughRqyflJB/ni8lS60DTSH8=;
 b=GyD6dE3w5ex0YZ+99bXief4WwIH6ylyJ/CgTx+ijGoJ6YTOtH7C1mjCYXm6M4vYCZF
 zI3CnlS6gu85phT2dSJKqslYDa3jz6VhRo81NkyV3ZyAz6YMoJyy3Rutcm44e7wm3P5/
 Mc/tVaC5aZ9nfGt2zSCSd6Q0HL7N2FSb35ohKIuWVqgotguAT5fKfWXA0JLrYSg6m7Ly
 sS/gnpymEWON0+hEsPu+KN3PxMvUehLAPdqz/GKbR0R3vBRb5iaaD+Pn+DamHw0E2nxs
 nSEIzjThpGAa0gObaZExgZxfZ2FVHzV3mxTM8T8Or7WohwfewKqtCuedmfOMKaph/kXm
 ssqg==
X-Gm-Message-State: AOAM531t9Dwv0OfrGE+MamFAwW2+9EP0l0KFa9REW/GWayRyfqYhjtM3
 T3OGLB7bBkxDO2lb8AnivUiKhA==
X-Received: by 2002:a02:714f:: with SMTP id n15mr4856603jaf.6.1616023989858;
 Wed, 17 Mar 2021 16:33:09 -0700 (PDT)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id k12sm235183ios.2.2021.03.17.16.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 16:33:09 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v5 3/4] target/arm: Add support for FEAT_TLBIOS
Date: Wed, 17 Mar 2021 17:33:00 -0600
Message-Id: <20210317233301.4130-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210317233301.4130-1-rebecca@nuviainc.com>
References: <20210317233301.4130-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd29.google.com
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
X-TUID: 037uo+EUQBkP

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
index ce913deff490..5b10f179b761 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7211,6 +7211,78 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
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
@@ -8583,6 +8655,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

