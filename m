Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6239132lfp;
        Tue, 18 Feb 2020 07:29:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxGmMHW1xrdBeogu9X71TAYJyBJA9Fmu/IA+SqdhQ+TQXqrBIAosAcoQTa5WOnn1oveUWdd
X-Received: by 2002:ac8:6f0d:: with SMTP id g13mr17527545qtv.56.1582039741275;
        Tue, 18 Feb 2020 07:29:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582039741; cv=none;
        d=google.com; s=arc-20160816;
        b=CaF4KHydhDIGm2utHrYT6r/JMj54/ePGCi8U1SadyXf6vtpRNwV6gaJPXJx2a0Xacb
         u96vyzSekrq0Mtg9cRE/uPNkk+5ymUaHSLuyM7Hhcq9Ltc77O7aQKRahonVzuwP43cD/
         iL6mMB17D097gqzpElhPC++qreUyCGwfXoYAtAij1Pp3gbJfFzg0eDmM6o06lPSIXDj1
         15xA9YpA4KJ+RjIHZaAKo3NShj8mOUU8Azlsgq3vVXooYS6Lw2R9ROgz5PRRZCNp54dV
         7KzuOTKJszXJzLrbjeHY7kroV+hs2OK8SB5LGzY1YoRJLmyukQo+5v+8fmOI3ndUiMZ3
         uyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=HQHh6qrFUuo2T2mOb46doVh8eCV8qOfeXP4yG8YM+KE=;
        b=QRkC12T3V51ps5dYjBxvMSrM5fpTyANw63E5yS69m15THb5dXuG2or+22dpSzDQCo3
         Z695TiB+1RCfkiTkYOvdnLSpO27ormm8+6j/hCpzPY5z5arkLR7GvAtiEkdGsB20CRlM
         I1lWhvzloUuY53osHrDN+8Z04WJpOCMGZKD+8II8/Tb33npCuIwkS41ysqVbY3+ZnJTa
         aXvQxLiCBJUR0ob+m1u+HHjrtGmlecCQovuScFP236Uhx5PiMw/VXZWsgkoQf3HtgJ5g
         CESBUP6dvsnKmPJR7jS/fReBLCkvJflSKKp3s5mQpIizGQQJzrmBPwVfIlf8//jsE/S6
         rMWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l7TyzcVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si2122127qke.370.2020.02.18.07.29.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 07:29:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l7TyzcVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j44o0-0007Uv-MG
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 10:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j44nr-0007Tl-DU
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 10:28:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j44np-0003ZO-G7
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 10:28:51 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33546)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j44np-0003Yr-6w
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 10:28:49 -0500
Received: by mail-pf1-x442.google.com with SMTP id n7so10831824pfn.0
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 07:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HQHh6qrFUuo2T2mOb46doVh8eCV8qOfeXP4yG8YM+KE=;
 b=l7TyzcVtNETOsX7sWWVg80s6TeyD1XGTzSrNNHCDRUXEciLrXIDc224hHu6/JoUAmE
 fIpUPVfDKJmPAQCyeicAwfLUvCwZcdNvbrIQueeKKzzj/wDjXILgqbAqWavCK1avXNpd
 ECAZg8OoXYNgJq3NPII+PAEHfkAgXH/Uj4YepR8VcSfHdZOuICEF3bKpFfbf3sk9ngNR
 Cd1Fw6r01/KYWNHjJzUJLkLsFSp9uOhABr6ZFB60Z+9wsM9kTkD8a+X2lE6aQnI+hKTJ
 s7PM/tPIYK2YI5eYtsaVCesxXhmAUb8B4Qk5YukvtbqMgzS5s9go76voC9C7T5RIh+I3
 Iq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HQHh6qrFUuo2T2mOb46doVh8eCV8qOfeXP4yG8YM+KE=;
 b=A7ElQdsY7f2rjZryJVA02LRtuwdluffeZsUZa/NUoh/v1JYMo+Fty+X+64Q/+vdzaQ
 ZZ+7tASqbChZ1/dvCG0ZfT0RbtakeUCdD1tnaTQ0QwqpUhQ2hOuZgn6LTyOuFiJXckR4
 yX7MLUto4j9WmvNy0FtCHNSL8/mMxUH3F1rFWfOeroBBtlIHOxKZuJPLK56xEgiUpfBj
 qvuWsJcdAHOTI9MfBiPCvude6K6rGcKAWFKWI/4xTcx5tclO2FrEQ0Sw5H8ez9iT/Idq
 lpRjoHtpOz87heRib5YdsAvVEwQXW7aF5o8KOFGZFtHPWwBEmOWrQr7F2YLb8jCbJPbw
 I5Yw==
X-Gm-Message-State: APjAAAW1V43TV4myac5tsdbeNf9DaasY77iTBjd/U3ePDxTeO0k1z/P3
 KfHFdpGpSJ8JYFIZTWaIkWiSGQ==
X-Received: by 2002:a63:921a:: with SMTP id o26mr23777918pgd.246.1582039727453; 
 Tue, 18 Feb 2020 07:28:47 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r6sm4662382pfh.91.2020.02.18.07.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 07:28:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/arm: Honor the HCR_EL2.{TVM,TRVM} bits
Date: Tue, 18 Feb 2020 07:28:44 -0800
Message-Id: <20200218152844.29351-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aMCxSiqt7Xj0

These bits trap EL1 access to various virtual memory controls.

Buglink: https://bugs.launchpad.net/bugs/1855072
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Include TTBCR.
---
 target/arm/helper.c | 77 ++++++++++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 366dbcf460..69946a57f8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -529,6 +529,19 @@ static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* Check for traps from EL1 due to HCR_EL2.TVM and HCR_EL2.TRVM.  */
+static CPAccessResult access_tvm_trvm(CPUARMState *env, const ARMCPRegInfo *ri,
+                                      bool isread)
+{
+    if (arm_current_el(env) == 1) {
+        uint64_t trap = isread ? HCR_TRVM : HCR_TVM;
+        if (arm_hcr_el2_eff(env) & trap) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+    }
+    return CP_ACCESS_OK;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -784,7 +797,8 @@ static const ARMCPRegInfo cp_reginfo[] = {
      */
     { .name = "CONTEXTIDR_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 1,
-      .access = PL1_RW, .secure = ARM_CP_SECSTATE_NS,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .secure = ARM_CP_SECSTATE_NS,
       .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[1]),
       .resetvalue = 0, .writefn = contextidr_write, .raw_writefn = raw_write, },
     { .name = "CONTEXTIDR_S", .state = ARM_CP_STATE_AA32,
@@ -876,9 +890,11 @@ static const ARMCPRegInfo not_v7_cp_reginfo[] = {
       .opc1 = CP_ANY, .opc2 = 3, .access = PL1_W, .writefn = tlbimvaa_write,
       .type = ARM_CP_NO_RAW },
     { .name = "PRRR", .cp = 15, .crn = 10, .crm = 2,
-      .opc1 = 0, .opc2 = 0, .access = PL1_RW, .type = ARM_CP_NOP },
+      .opc1 = 0, .opc2 = 0, .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .type = ARM_CP_NOP },
     { .name = "NMRR", .cp = 15, .crn = 10, .crm = 2,
-      .opc1 = 0, .opc2 = 1, .access = PL1_RW, .type = ARM_CP_NOP },
+      .opc1 = 0, .opc2 = 1, .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .type = ARM_CP_NOP },
     REGINFO_SENTINEL
 };
 
@@ -996,7 +1012,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     { .name = "DMB", .cp = 15, .crn = 7, .crm = 10, .opc1 = 0, .opc2 = 5,
       .access = PL0_W, .type = ARM_CP_NOP },
     { .name = "IFAR", .cp = 15, .crn = 6, .crm = 0, .opc1 = 0, .opc2 = 2,
-      .access = PL1_RW,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ifar_s),
                              offsetof(CPUARMState, cp15.ifar_ns) },
       .resetvalue = 0, },
@@ -2164,16 +2180,19 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
      */
     { .name = "AFSR0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 1, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "AFSR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 1, .opc2 = 1,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     /* MAIR can just read-as-written because we don't implement caches
      * and so don't need to care about memory attributes.
      */
     { .name = "MAIR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 2, .opc2 = 0,
-      .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.mair_el[1]),
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fieldoffset = offsetof(CPUARMState, cp15.mair_el[1]),
       .resetvalue = 0 },
     { .name = "MAIR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 10, .crm = 2, .opc2 = 0,
@@ -2187,12 +2206,14 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       * handled in the field definitions.
       */
     { .name = "MAIR0", .state = ARM_CP_STATE_AA32,
-      .cp = 15, .opc1 = 0, .crn = 10, .crm = 2, .opc2 = 0, .access = PL1_RW,
+      .cp = 15, .opc1 = 0, .crn = 10, .crm = 2, .opc2 = 0,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.mair0_s),
                              offsetof(CPUARMState, cp15.mair0_ns) },
       .resetfn = arm_cp_reset_ignore },
     { .name = "MAIR1", .state = ARM_CP_STATE_AA32,
-      .cp = 15, .opc1 = 0, .crn = 10, .crm = 2, .opc2 = 1, .access = PL1_RW,
+      .cp = 15, .opc1 = 0, .crn = 10, .crm = 2, .opc2 = 1,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.mair1_s),
                              offsetof(CPUARMState, cp15.mair1_ns) },
       .resetfn = arm_cp_reset_ignore },
@@ -3842,20 +3863,21 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
 static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
     { .name = "DFSR", .cp = 15, .crn = 5, .crm = 0, .opc1 = 0, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_ALIAS,
+      .access = PL1_RW, .accessfn = access_tvm_trvm, .type = ARM_CP_ALIAS,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.dfsr_s),
                              offsetoflow32(CPUARMState, cp15.dfsr_ns) }, },
     { .name = "IFSR", .cp = 15, .crn = 5, .crm = 0, .opc1 = 0, .opc2 = 1,
-      .access = PL1_RW, .resetvalue = 0,
+      .access = PL1_RW, .accessfn = access_tvm_trvm, .resetvalue = 0,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.ifsr_s),
                              offsetoflow32(CPUARMState, cp15.ifsr_ns) } },
     { .name = "DFAR", .cp = 15, .opc1 = 0, .crn = 6, .crm = 0, .opc2 = 0,
-      .access = PL1_RW, .resetvalue = 0,
+      .access = PL1_RW, .accessfn = access_tvm_trvm, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.dfar_s),
                              offsetof(CPUARMState, cp15.dfar_ns) } },
     { .name = "FAR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .crn = 6, .crm = 0, .opc1 = 0, .opc2 = 0,
-      .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.far_el[1]),
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fieldoffset = offsetof(CPUARMState, cp15.far_el[1]),
       .resetvalue = 0, },
     REGINFO_SENTINEL
 };
@@ -3863,25 +3885,29 @@ static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
 static const ARMCPRegInfo vmsa_cp_reginfo[] = {
     { .name = "ESR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .crn = 5, .crm = 2, .opc1 = 0, .opc2 = 0,
-      .access = PL1_RW,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
       .fieldoffset = offsetof(CPUARMState, cp15.esr_el[1]), .resetvalue = 0, },
     { .name = "TTBR0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
-      .access = PL1_RW, .writefn = vmsa_ttbr_write, .resetvalue = 0,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .writefn = vmsa_ttbr_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
                              offsetof(CPUARMState, cp15.ttbr0_ns) } },
     { .name = "TTBR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 1,
-      .access = PL1_RW, .writefn = vmsa_ttbr_write, .resetvalue = 0,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .writefn = vmsa_ttbr_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) } },
     { .name = "TCR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 2,
-      .access = PL1_RW, .writefn = vmsa_tcr_el12_write,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .writefn = vmsa_tcr_el12_write,
       .resetfn = vmsa_ttbcr_reset, .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[1]) },
     { .name = "TTBCR", .cp = 15, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_ALIAS, .writefn = vmsa_ttbcr_write,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .type = ARM_CP_ALIAS, .writefn = vmsa_ttbcr_write,
       .raw_writefn = vmsa_ttbcr_raw_write,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tcr_el[3]),
                              offsetoflow32(CPUARMState, cp15.tcr_el[1])} },
@@ -3893,7 +3919,8 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
  */
 static const ARMCPRegInfo ttbcr2_reginfo = {
     .name = "TTBCR2", .cp = 15, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 3,
-    .access = PL1_RW, .type = ARM_CP_ALIAS,
+    .access = PL1_RW, .accessfn = access_tvm_trvm,
+    .type = ARM_CP_ALIAS,
     .bank_fieldoffsets = { offsetofhigh32(CPUARMState, cp15.tcr_el[3]),
                            offsetofhigh32(CPUARMState, cp15.tcr_el[1]) },
 };
@@ -4113,12 +4140,12 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
     /* NOP AMAIR0/1 */
     { .name = "AMAIR0", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .crn = 10, .crm = 3, .opc1 = 0, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     /* AMAIR1 is mapped to AMAIR_EL1[63:32] */
     { .name = "AMAIR1", .cp = 15, .crn = 10, .crm = 3, .opc1 = 0, .opc2 = 1,
-      .access = PL1_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "PAR", .cp = 15, .crm = 7, .opc1 = 0,
       .access = PL1_RW, .type = ARM_CP_64BIT, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.par_s),
@@ -4844,7 +4871,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .type = ARM_CP_NOP, .access = PL1_W },
     /* MMU Domain access control / MPU write buffer control */
     { .name = "DACR", .cp = 15, .opc1 = 0, .crn = 3, .crm = 0, .opc2 = 0,
-      .access = PL1_RW, .resetvalue = 0,
+      .access = PL1_RW, .accessfn = access_tvm_trvm, .resetvalue = 0,
       .writefn = dacr_write, .raw_writefn = raw_write,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.dacr_s),
                              offsetoflow32(CPUARMState, cp15.dacr_ns) } },
@@ -7652,7 +7679,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo sctlr = {
             .name = "SCTLR", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
-            .access = PL1_RW,
+            .access = PL1_RW, .accessfn = access_tvm_trvm,
             .bank_fieldoffsets = { offsetof(CPUARMState, cp15.sctlr_s),
                                    offsetof(CPUARMState, cp15.sctlr_ns) },
             .writefn = sctlr_write, .resetvalue = cpu->reset_sctlr,
-- 
2.20.1

