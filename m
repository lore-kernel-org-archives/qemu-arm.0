Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2126563wro;
        Fri, 2 Nov 2018 06:41:47 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dCWo6DDorjQVb/4y7M+SLxrdaRpkk4YRGBVXrRuENUdrSv3se659xdQikTyJw0z+5t1w7/
X-Received: by 2002:ac8:2475:: with SMTP id d50-v6mr10873233qtd.7.1541166107511;
        Fri, 02 Nov 2018 06:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541166107; cv=none;
        d=google.com; s=arc-20160816;
        b=l7tPcN/DFuuh4BdX+Jl5EZu4akMWbh5kUk0m+Tsj5aAzfRi5rRFy6EcjwPwSQjd+/a
         Qn/IKg5T1WzRmRgSuOE0pNFk+Hw6d56zzeQltJINcbvxUQFjmbSOUEJWJU0KxCORGkSP
         HR1BD3llORDTI3/TDqDeVXBlThBKS3ZP+XAAHCGmBKSlJ1/9rdbuGqtBeQxhtOtdoBfh
         +D7dU0JPG2TpvYhOZ8Y5yvLyW3L4xNMQMUESv6w1VQdx1UNPnlapHHf6ezoJZUj7iE71
         0CEGohkcr7VPbcWg2tzMbjeuHluEi7m7tcUDdr0dGggRYnJeuPymmnOZp45Gh9TpAYzj
         7cbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ibpO8aAfuGlV+RemFfOG8a6k0Psov4g1AaQlMHudcgg=;
        b=mDaW1tgTGyFW8km+Ok9osmkczaT21rnnhAuHA0s5KQ2+rg2DRU8y+WOX6oucY8SfaH
         DbhlALphBD6pf30ZWvnfbLrrf9QIe1sCR0W85ydWC2ufPuao6X0345Ywh3C0V6cUQ4Ml
         Ek4Esj3itESitt9suBjfqkA91oeUvSSnYcuIpv+w+3m8NtuQgtYbrLNvp+aaBKL01bO7
         yc93CUM24BPxnuGKiK5+mRE3RvPIB3wPSfLvBYni4ORCOzONxLv0xD/JPRjtARfeRF/b
         X2zTO8iKh79tK4y7fglxoqddamOQCexDwOy7aOsYVB8pAzLOAt3kxYRpXLHuR+xswcrO
         mVZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dYYanNyp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p20-v6si3058130qvf.103.2018.11.02.06.41.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 06:41:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dYYanNyp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIZhr-00078w-28
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 09:41:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIZhj-00078l-Bs
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:41:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gIZhh-0007LQ-9v
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:41:39 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33972)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gIZhg-0007BA-Qd
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:41:37 -0400
Received: by mail-wm1-x342.google.com with SMTP id f1-v6so1280334wmg.1
	for <qemu-arm@nongnu.org>; Fri, 02 Nov 2018 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ibpO8aAfuGlV+RemFfOG8a6k0Psov4g1AaQlMHudcgg=;
	b=dYYanNypVMR8K+kdz6rgbEYv+mhyF/Nm0Yq/babvhX6H3pulHbuR1kbYYBgCMlKmEu
	cLa3RoyHPum81BJEnwG8cmWudlH+CclPrYnD5rJ5tKa3v5HXTGkYRfMqfu6D6k9L/14I
	Wv9+zx2hLL5FqsM3zE2CjwYp2e3E96fCIGPEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ibpO8aAfuGlV+RemFfOG8a6k0Psov4g1AaQlMHudcgg=;
	b=kD9XzzCbbeADF34/vQFPonztotVNXUGoXNApMFU86HsUSGSNKMYvsJM80i0ervltah
	qF+ntio0S+GJVe6Zvx9kWWlDwrlZWV31j4I68xhUU+8kCIWH+PRb/08o0WB+b3tE5fav
	aIPz8qcRJ0TBebneSg4Dp25jV8CdDOnUdOmLt5Zjy/+tBl81dDlQh+5mhopU+OV99aIU
	rqCcjhkJd56eU8HAaJIDq6WkAFP9iUKmrddhv/8I6QGFNuMMsJJ3yAeBvibVwYeyyoZ6
	09blnR6wGzJq3A7sgmEtpQfsFFn2lRXCRG0fAnVYZIsL+BAu3b37Y3Ygu4X3So7oPNJa
	Gabg==
X-Gm-Message-State: AGRZ1gJPTWElM0nK8aYVjEMilbMq5qRVDHQ+m4Z339ro0ztkixnheTgn
	4y3D3/Br5zV2p+kwTU5uXJbFtA==
X-Received: by 2002:a1c:8d2:: with SMTP id 201-v6mr13439wmi.132.1541166079880; 
	Fri, 02 Nov 2018 06:41:19 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:504f:6300:a3de:88d8:75ae:bf4c])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm1629686wrp.56.2018.11.02.06.41.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Nov 2018 06:41:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  2 Nov 2018 13:41:10 +0000
Message-Id: <20181102134112.26370-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181102134112.26370-1-richard.henderson@linaro.org>
References: <20181102134112.26370-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH for-4.0 2/4] target/arm: Implement the
 ARMv8.1-LOR extension
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZY4Y9ECVJquW

Provide a trivial implementation with zero limited ordering regions,
which causes the LDLAR and STLLR instructions to devolve into the
LDAR and STLR instructions from the base ARMv8.0 instruction set.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/cpu64.c         |  4 ++++
 target/arm/helper.c        | 26 ++++++++++++++++++++++++++
 target/arm/translate-a64.c | 12 ++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2ce5e80dfc..f12a6afddc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3278,6 +3278,11 @@ static inline bool isar_feature_aa64_atomics(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, ATOMIC) != 0;
 }
 
+static inline bool isar_feature_aa64_lor(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr0, ID_AA64MMFR1, LO) != 0;
+}
+
 static inline bool isar_feature_aa64_rdm(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, RDM) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0babe483ac..aac6283018 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -324,6 +324,10 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
         cpu->isar.id_aa64pfr0 = t;
 
+        t = cpu->isar.id_aa64mmfr1;
+        t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
+        cpu->isar.id_aa64mmfr1 = t;
+
         /* Replicate the same data to the 32-bit id registers.  */
         u = cpu->isar.id_isar5;
         u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 70376764cb..758ddac5e9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5714,6 +5714,32 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &sctlr);
     }
 
+    if (cpu_isar_feature(aa64_lor, cpu)) {
+        /*
+         * A trivial implementation of ARMv8.1-LOR leaves all of these
+         * registers fixed at 0, which indicates that there are zero
+         * supported Limited Ordering regions.
+         */
+        static const ARMCPRegInfo lor_reginfo[] = {
+            { .name = "LORSA_EL1", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 0,
+              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+            { .name = "LOREA_EL1", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 1,
+              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+            { .name = "LORN_EL1", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 2,
+              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+            { .name = "LORC_EL1", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 3,
+              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+            { .name = "LORID_EL1", .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 4, .opc2 = 7,
+              .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+        };
+        define_arm_cp_regs(cpu, lor_reginfo);
+    }
+
     if (cpu_isar_feature(aa64_sve, cpu)) {
         define_one_arm_cp_reg(cpu, &zcr_el1_reginfo);
         if (arm_feature(env, ARM_FEATURE_EL2)) {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 88195ab949..2307a18d5a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2290,6 +2290,12 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         }
         return;
 
+    case 0x8: /* STLLR */
+        if (!dc_isar_feature(aa64_lor, s)) {
+            break;
+        }
+        /* StoreLORelease is the same as Store-Release for QEMU.  */
+        /* fallthru */
     case 0x9: /* STLR */
         /* Generate ISS for non-exclusive accesses including LASR.  */
         if (rn == 31) {
@@ -2301,6 +2307,12 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
                   disas_ldst_compute_iss_sf(size, false, 0), is_lasr);
         return;
 
+    case 0xc: /* LDLAR */
+        if (!dc_isar_feature(aa64_lor, s)) {
+            break;
+        }
+        /* LoadLOAcquire is the same as Load-Acquire for QEMU.  */
+        /* fallthru */
     case 0xd: /* LDAR */
         /* Generate ISS for non-exclusive accesses including LASR.  */
         if (rn == 31) {
-- 
2.17.2

