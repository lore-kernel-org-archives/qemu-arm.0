Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp895819ejf;
        Fri, 19 Aug 2022 04:02:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR56iew+qRaRiXeiBFLjiCCu+wzIGVyFsDV6WbIOweGonoYhuuZkaazmmgwDL4/H5V0fJ0Wu
X-Received: by 2002:ac8:5888:0:b0:343:6cf2:e185 with SMTP id t8-20020ac85888000000b003436cf2e185mr5708523qta.285.1660906955615;
        Fri, 19 Aug 2022 04:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660906955; cv=none;
        d=google.com; s=arc-20160816;
        b=fCgBMm6wkPFEUWScoIewKIlMz601Sy3Wxn/HQNB2OC7zl4Rof3tpoG8rY+YDlFzQxA
         9rGN26mdiRKIxOwW860BjBF6jC+ivxg/OBk0ENVStODR866iZ5EUAQ2VLHDgZWY3O8li
         UGyh41BXw+90p6MvUMwZqh/Gb0tKa48Kwz/8nFGGzqFb1nkpbhsBcc0rixocHEF5Jhsa
         w0e+7qJk5Lt4gWrnF6mHot90nW+OnhnWJXEBK/rHz2bwsh5V+NxZdA7O/p4chsP0wUjR
         BekA/hwuakJqju4YoH4B0O8lT0mP5seI8YUOkPIeKedH8Pks1ikZcQUVVSkf4gh0elJM
         SaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gmgWZcEd2xgM6CGJtMX2e3RN3Kslo8iCQtt3bLXG/as=;
        b=n5lM9HcMm/OyHMzTbyLtYCcbWJfwIHDGKo7KXGFW0hXdmRsy30esl9gjfLzeBeXmCz
         RsxHoV0Ll/Uv+T/9M/RrgvieT5k0eY/dHsTxFa7V3u11NElN5V9uf9o0iwhoMOlzZrFQ
         OrZrESrxJ77k/amY4J28wdHJmCQf1sE3vrn3xDpDAnd+j5yAfkA5eRRl/oaq1MAUt9ND
         6A6bFMK/lBtZm6ZeQ1d4CEN0o+6QM/Qv/imPNpD3KCVk4Y7IiINgK3H+1yKD6p6FL8dL
         p/MDosIrUQJv4VNYvQABT+m4GV7dYX1vAx65Y50dR19wFSDxHSx2jQ3bt93+ycTlx/l8
         4Xlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wBXAy7+s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l24-20020ac84598000000b003448dc9c891si1777030qtn.115.2022.08.19.04.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 04:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wBXAy7+s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oOzlq-0002H8-Mu
	for alex.bennee@linaro.org; Fri, 19 Aug 2022 07:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkN-0002Cd-08
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 07:01:07 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkG-0001Q7-Iz
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 07:01:02 -0400
Received: by mail-wr1-x433.google.com with SMTP id a4so4770355wrq.1
 for <qemu-arm@nongnu.org>; Fri, 19 Aug 2022 04:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=gmgWZcEd2xgM6CGJtMX2e3RN3Kslo8iCQtt3bLXG/as=;
 b=wBXAy7+sSeyMEqVnntIC1ZeLi6BGN4wS3BnY73ClYHUItCTrG9dH8HCgL75ICYr0p0
 YEplB0xzns0gpHECYIrHWTOabRZs1lDo7W6ULemAsFxNJhEpGYrYCpefSWzQGbm8NWE/
 2h3EX7v9TlhSrtmKtk6z/RC8gFdPWPw2iAaeGv2ZLOEUfMxIasAdZ1f370yf2u3aAkW5
 nDsjUEHehDljKX5IvtQa1BKM37h302dLASyU5m3hBpx2fqFt06FcA+nZT5riBY713hAM
 54msD/1aqUCrES5D5MPKZMAD4VEk4vCpODdch7C0yiywOUPHevz8T3Y0n8UIebeD8Z5V
 OY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=gmgWZcEd2xgM6CGJtMX2e3RN3Kslo8iCQtt3bLXG/as=;
 b=x3kVaCWNI0JRa8ve5tlAmPzF7cILGBzpnK61R8r5MnQAeNsRQqEEzvYB2OuPyivOeG
 4xnPD5XC/B7XROJ4Nd3Gu58P2oq0FcAQq7rcYFQFlBNDyUAoIvZ6Bd0hG0GczLbu+fn3
 IJFPXhnFaiEedRm8CkVhtggu8eXeV2JeD6wADtlkNiuiyHGkhbJ3shGmrDKmTorGc0UM
 HbH8DP9m3ruoGa+hFfuY0AQMcXozbVjbVkuNhrO1Jh9+FqVtc6+2401fVq+FhR/zPWQc
 sfKb4YsAAdfmxbxbzvq92n9G+sVppl6zwTEGjDdypsbTwCSl4+xjm4RUxTqLKS3GvcZX
 SHZQ==
X-Gm-Message-State: ACgBeo2LLMxvxviiA3rVYLVitu3ZS84AhTUpNna5C8LRdlKEj5W7TmaW
 6bMIHfEz+my3A9+9Z/GkoI1gQjkkPGlFKA==
X-Received: by 2002:a5d:4204:0:b0:225:382f:a8be with SMTP id
 n4-20020a5d4204000000b00225382fa8bemr1631192wrq.379.1660906855117; 
 Fri, 19 Aug 2022 04:00:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/arm: Make cpregs 0, c0, c{3-15},
 {0-7} correctly RAZ in v8
Date: Fri, 19 Aug 2022 12:00:47 +0100
Message-Id: <20220819110052.2942289-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819110052.2942289-1-peter.maydell@linaro.org>
References: <20220819110052.2942289-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7cV9NDIRwVW2

In the AArch32 ID register scheme, coprocessor registers with
encoding cp15, 0, c0, c{0-7}, {0-7} are all in the space covered by
what in v6 and v7 was called the "CPUID scheme", and are supposed to
RAZ if they're not allocated to a specific ID register.  For our
pre-v8 CPUs we get this right, because the regdefs in
id_pre_v8_midr_cp_reginfo[] cover these RAZ requirements.  However
for v8 we failed to put in the necessary patterns to cover this, so
we end up UNDEFing on everything we didn't have an ID register for.
This is a problem because in Armv8 some encodings in 0, c0, c3, {0-7}
are now being used for new ID registers, and guests might thus start
trying to read them.  (We already have one of these: ID_PFR2.)

For v8 CPUs, we already have regdefs for 0, c0, c{0-2}, {0-7} (that
is, the space is completely allocated with no reserved spaces).  Add
entries to v8_idregs[] covering 0, c0, c3, {0-7}:
 * c3, {0-2} is the reserved AArch32 space corresponding to the
   AArch64 MVFR[012]_EL1
 * c3, {3,5,6,7} are reserved RAZ for both AArch32 and AArch64
   (in fact some of these are given defined meanings in Armv8.6,
   but we don't implement them yet)
 * c3, 4 is ID_PFR2 (already defined)

We then programmatically add RAZ patterns for AArch32 for
0, c0, c{4..15}, {0-7}:
 * c4-c7 are unused, and not shared with AArch64 (these
   are the encodings corresponding to where the AArch64
   specific ID registers live in the system register space)
 * c8-c15 weren't required to RAZ in v6/v7, but v8 extends
   the AArch32 reserved-should-RAZ space to cover these;
   the equivalent area of the AArch64 sysreg space is not
   defined as must-RAZ

Note that the architecture allows some registers in this space
to return an UNKNOWN value; we always return 0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 65 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a5..c171770b035 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7345,11 +7345,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, not_v7_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_V8)) {
-        /* AArch64 ID registers, which all have impdef reset values.
+        /*
+         * v8 ID registers, which all have impdef reset values.
          * Note that within the ID register ranges the unused slots
          * must all RAZ, not UNDEF; future architecture versions may
          * define new registers here.
+         * ID registers which are AArch64 views of the AArch32 ID registers
+         * which already existed in v6 and v7 are handled elsewhere,
+         * in v6_idregs[].
          */
+        int i;
         ARMCPRegInfo v8_idregs[] = {
             /*
              * ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST in system
@@ -7539,7 +7544,34 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.mvfr2 },
-            { .name = "MVFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            /*
+             * "0, c0, c3, {0,1,2}" are the encodings corresponding to
+             * AArch64 MVFR[012]_EL1. Define the STATE_AA32 encoding
+             * as RAZ, since it is in the "reserved for future ID
+             * registers, RAZ" part of the AArch32 encoding space.
+             */
+            { .name = "RES_0_C0_C3_0", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 0,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .accessfn = access_aa64_tid3,
+              .resetvalue = 0 },
+            { .name = "RES_0_C0_C3_1", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 1,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .accessfn = access_aa64_tid3,
+              .resetvalue = 0 },
+            { .name = "RES_0_C0_C3_2", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
+              .access = PL1_R, .type = ARM_CP_CONST,
+              .accessfn = access_aa64_tid3,
+              .resetvalue = 0 },
+            /*
+             * Other encodings in "0, c0, c3, ..." are STATE_BOTH because
+             * they're also RAZ for AArch64, and in v8 are gradually
+             * being filled with AArch64-view-of-AArch32-ID-register
+             * for new ID registers.
+             */
+            { .name = "RES_0_C0_C3_3", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
@@ -7549,17 +7581,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_pfr2 },
-            { .name = "MVFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "RES_0_C0_C3_5", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = 0 },
-            { .name = "MVFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "RES_0_C0_C3_6", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = 0 },
-            { .name = "MVFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "RES_0_C0_C3_7", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
@@ -7625,6 +7657,29 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
         define_arm_cp_regs(cpu, v8_idregs);
         define_arm_cp_regs(cpu, v8_cp_reginfo);
+
+        for (i = 4; i < 16; i++) {
+            /*
+             * Encodings in "0, c0, {c4-c7}, {0-7}" are RAZ for AArch32.
+             * For pre-v8 cores there are RAZ patterns for these in
+             * id_pre_v8_midr_cp_reginfo[]; for v8 we do that here.
+             * v8 extends the "must RAZ" part of the ID register space
+             * to also cover c0, 0, c{8-15}, {0-7}.
+             * These are STATE_AA32 because in the AArch64 sysreg space
+             * c4-c7 is where the AArch64 ID registers live (and we've
+             * already defined those in v8_idregs[]), and c8-c15 are not
+             * "must RAZ" for AArch64.
+             */
+            g_autofree char *name = g_strdup_printf("RES_0_C0_C%d_X", i);
+            ARMCPRegInfo v8_aa32_raz_idregs = {
+                .name = name,
+                .state = ARM_CP_STATE_AA32,
+                .cp = 15, .opc1 = 0, .crn = 0, .crm = i, .opc2 = CP_ANY,
+                .access = PL1_R, .type = ARM_CP_CONST,
+                .accessfn = access_aa64_tid3,
+                .resetvalue = 0 };
+            define_one_arm_cp_reg(cpu, &v8_aa32_raz_idregs);
+        }
     }
 
     /*
-- 
2.25.1

