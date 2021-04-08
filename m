Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp958688lfr;
        Wed, 7 Apr 2021 17:22:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwocegeXzCGwctXUySUPWqIdzdy5mE+YS9PhlFfuPA/3MoXK7ipu13zflczzSEm8rcIUaiY
X-Received: by 2002:ab0:30a3:: with SMTP id b3mr4143574uam.0.1617841320344;
        Wed, 07 Apr 2021 17:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617841320; cv=none;
        d=google.com; s=arc-20160816;
        b=IpEGjqXsSVnfPgs7zgBQdBKRZZjd9eMVIyvz1PcBqkmve1RPdM2TgqY2Y668K1RDQW
         WtC2uJREfsGO6ojukE1++GyIMwFNjl2QWAtg1qpM7jOycQekgT9KOkBEVaExBZZexi4L
         Cklhad2K5emoMj4YhLGBe93zwYFRIExs2gTglZYlQo/fcsrtuYRKpXNrOcHxDrHqZ+F8
         X+SA8qgm5ivIqBDMrC1/Wn/zEzPtVVwilqlOwjNHDsxAwEZVPXK37Fe1kZ+T26s6yoZa
         LVWWXeJCWjSuauO/vIAXnMQ9+YKjhWAbQljf4MO1Q6SVGUcY0oCHoGb92ekNo6pnKpt0
         +OYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=isLK5SgCVgmU05FBFa6ZughRqyflJB/ni8lS60DTSH8=;
        b=nUmmCoYIYU6VNY85GQAk8Y9aCjQ6lHKnphBOoiJnh98MqIYsMnqlo5KRgA2j07mshi
         PfDyw7960Bd2IJ0ba49fBR5kvVIHcgTr5VhTKDapl8bIRKvy+veui+gJNjZ4+9t14lKb
         ImPRIqoiXh9XFlsEP/4AGfaeyhAyCuITCjevi1MHb6V73ni7i3IeAldcuEuJr+OIkpLc
         22aNk2xOHWNJnq4VIoOd6AUhoQ1qLn8hSY0kaX6PsepbKEimaqdJPxChKZLHBW91VhA4
         PBzcVIR/mjmIJK664gNv1g28m157YmtnpWgrwaUEV1sALLTz0wPL6c7jaLO9pKtt8+6p
         80Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="ErYS/cxl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v2si1547056vsi.145.2021.04.07.17.21.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 17:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="ErYS/cxl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUIQp-0005lV-DH
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 20:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIPy-0005HJ-Om
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 20:21:06 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:35441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lUIPo-0002e8-Hg
 for qemu-arm@nongnu.org; Wed, 07 Apr 2021 20:21:06 -0400
Received: by mail-il1-x129.google.com with SMTP id c3so297612ils.2
 for <qemu-arm@nongnu.org>; Wed, 07 Apr 2021 17:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=isLK5SgCVgmU05FBFa6ZughRqyflJB/ni8lS60DTSH8=;
 b=ErYS/cxlKRt/7iRrNpkSwufmqqtVory0JbMx7VVfIXduiU6oSVQPQVLNASfCYQ6MX0
 c1nRrXtx6AYfaCluHZTXnOUrBZCMT1QISnSt/ct2KWcJG2Z1pwHkWs35xXPV/g40uWBC
 NWgsABeRL0EYKY1DcGVWhm13hNEe8Hk9IfxA9NkMBFNh9+Bfe0/0x1AZp7xUINLaqHuh
 rX0+p/vKuyKPpIvM7Pom3/0c6KHHUQOKMLKaqUIjYsVFtteWLaZIWrQmhhlIGJl4AXyQ
 vzKxgADMCvcHO6EQ/17IeWimX/7Z1Ixy1nrAvrfpmo9jtN5PDwv1BIQecmDaLlAOKbM2
 bjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=isLK5SgCVgmU05FBFa6ZughRqyflJB/ni8lS60DTSH8=;
 b=SrWMj8dgHO7txRNGAwYWFB/RM/AR2uYAvEpbgOxC5CML1ZWjc2VMRBFvn5wafUUHI/
 25MlSgnFBFw6YaIF+Ezm2EHplFIsLJU/GOOhzny4fm3bPsog4nr5UuU0DUn0Fkhf1PFn
 J6yrZdUMa9JGMBwfwlMJapSma1hK+99wdj5xv3mpr6N7ZauijbDfaiKOc8HJGExOTjmA
 mEKxGcFf6g05zG+Tkuv1Aq3cDDi4QOcXZBQISwWlqchT/YJ1k+hjIgUEyB5sIF8Msy+v
 zifpBQOjKd/EyyuD46XJGlqQ5hF75+fJDWpbAZ4FQHOoB4o1hKTdBZgBBReZsCnnWhXj
 7oJg==
X-Gm-Message-State: AOAM532LAPjqiXENq4DDgUrPrfBqhLsbmf4ijkArvtf1MQG5tRiisyvD
 59AlzriwOrP/drnXZBGFAtH9Ng==
X-Received: by 2002:a05:6e02:1584:: with SMTP id
 m4mr4884385ilu.108.1617841254645; 
 Wed, 07 Apr 2021 17:20:54 -0700 (PDT)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id 11sm1818393ilg.53.2021.04.07.17.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 17:20:54 -0700 (PDT)
From: Rebecca Cran <rebecca@nuviainc.com>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v6 3/4] target/arm: Add support for FEAT_TLBIOS
Date: Wed,  7 Apr 2021 18:20:38 -0600
Message-Id: <20210408002039.18027-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210408002039.18027-1-rebecca@nuviainc.com>
References: <20210408002039.18027-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=rebecca@nuviainc.com; helo=mail-il1-x129.google.com
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JF3fpnbKDV5Q

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

