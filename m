Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1318754lfg;
        Fri, 28 Feb 2020 17:30:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxoKj9EftB8Pdk97ek80IEmIvvqticxlarOcJSmZx531nCRrDjnCeiT0kJKZhpWjyAPRNa4
X-Received: by 2002:a0c:e54b:: with SMTP id n11mr4804376qvm.235.1582939832304;
        Fri, 28 Feb 2020 17:30:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582939832; cv=none;
        d=google.com; s=arc-20160816;
        b=vGWhh0nBR7dd79J08IiaK/1OSDY4gci7iCK2DJJWusTy4uybehfakbyeYBR38e92or
         VJ13nC3pB72hRN+0iPc5Ilv58ZND84441SYUEoDSeffy94a0wiq4V4F7bL3u1FO02iAa
         Awxz9DLkWChHh7UdehgHetyiQixiiVITzesDpvYQ6LfKDmHDGfDDz0fskc7xSdy663tA
         qFlJi+1hEz+2sm/39N5Pbsy6QOrI8r7M4qF08oDQn3HSflIwV+otNo6L/2oP0248+Jwy
         UKHukCv/OZxJFOkYYGIgG7MPxSqfrWHJ2HOXSLAQZFhZF9teqpYUjy9NgapnqLMOKxI8
         ydXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wtHqtEkFJI+2mWFKUf0vqbrWVBZN2VlKX8BKVOAKBhQ=;
        b=oEDyDaH3tu2N037PXWfxX7ITkkArPJO+WFcwNLz1PSaAG5GTugK43veksIXNW7WAPz
         hPguRHpE58ZELyK4pEoip6CZoz0wlyjhYx2dq/okGrpF4pKE8qPnuJBRl8lfMHvPuM+s
         KkRcBKvosP573SC9WZqKO8E/Vkd/5k3IznCX5Djwv+2pvvTB2cH0W2pa4JtCENtK70Oa
         rbc+oRnbl0MgD8IubRiroP1YmN9ZspHbF1IFx7HX4luURMj1Ok33gbhDz4LaMu+oYXgt
         S7oNUa559f3ma/4z0P7RrS1ej1hSw/jNmj0G7in33zqkXdLgu0ceuLxyVEpBghf4vbij
         YdSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kE5h9o2k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8si2198571qth.190.2020.02.28.17.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 17:30:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kE5h9o2k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7qxb-0000y9-LJ
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 20:30:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvZ-0004ra-Vl
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvX-00062g-JW
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:25 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45291)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7qvX-000625-9j
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:23 -0500
Received: by mail-pg1-x543.google.com with SMTP id m15so2380739pgv.12
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 17:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wtHqtEkFJI+2mWFKUf0vqbrWVBZN2VlKX8BKVOAKBhQ=;
 b=kE5h9o2k85UGFlu5CreKubXrnYeX6sAUdyhLI6T14OVgmENYMyKPvIHkL05yblWgQo
 5JTGK91cvFagQDS5Je0ORV5UVQqyXB4zYpQzQY5bYhhEnFQAZ/UzCL+kAkQEY40fqGsF
 XzeDb3a8Vet7GKhJ82Mm/bJny6/aIgEO0+JYYEMBFCYW5o6U/QeT4LekapJKruqtV4wa
 DDRChmCjjO1cwMf3MIHNK3WGlOuOikckdAuZ8/CW+zLtLLuP6gbKb3/3SBK0KPFI40pc
 pIZ6PoCfVto2XRpaJm/39Q9RN/lB6D2v1j958W3dMLy2QfMHEv4fa5/2BnPwctFT0lz3
 Nmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wtHqtEkFJI+2mWFKUf0vqbrWVBZN2VlKX8BKVOAKBhQ=;
 b=n6q1d34FsJWuo9V473VVseIpw6I5XUECmkQQE2efy1N+LDZbDEe8DxkAopD8AeqPLH
 9PZE4JzENjYTUZ8woj2JB4jrcFoDS3qOkTHWXFAKgWhZZyFMm3KCOMB5ZJ13J0lyVMlt
 cntM0cpn9vSKwPttAtDtY9mMj/t3kLgmcRZu208vjXh6fo5fzelY4iCrfTbikhFedL7T
 pAQwtxZUoAJx6yLYSNsi4846jFK8+nE9xWvS0Zbuy5C7DEk5S559rY8jf0tpvkAdyyAa
 eAsSVvpDCT5iMbROpd28sE9LS8bNxQCBvP2LjbrYIqcR923PWbn29bkLk2WIIfvpKjMj
 TWrA==
X-Gm-Message-State: APjAAAUcGfFwvGjbdDPQoIngl9jv7I/R/74YNFR3RN4fFPMVjOCVEb/8
 EBotkAvz16OHQqccFbd7BL+o2Q==
X-Received: by 2002:a63:d845:: with SMTP id k5mr7041765pgj.183.1582939702301; 
 Fri, 28 Feb 2020 17:28:22 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm4606313pfq.126.2020.02.28.17.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 17:28:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/12] target/arm: Honor the HCR_EL2.{TVM,TRVM} bits
Date: Fri, 28 Feb 2020 17:28:05 -0800
Message-Id: <20200229012811.24129-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200229012811.24129-1-richard.henderson@linaro.org>
References: <20200229012811.24129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-TUID: LEHm0r/wNbZD

These bits trap EL1 access to various virtual memory controls.

Buglink: https://bugs.launchpad.net/bugs/1855072
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Include TTBCR.
v3: Include not_v8_cp_reginfo, lpae_cp_reginfo, CONTEXTIDR_S;
    exclude not_v7_cp_reginfo (pmm).
---
 target/arm/helper.c | 82 ++++++++++++++++++++++++++++++---------------
 1 file changed, 55 insertions(+), 27 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ef3f02d194..1f371b0391 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -530,6 +530,19 @@ static CPAccessResult access_tpm(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -785,12 +798,14 @@ static const ARMCPRegInfo cp_reginfo[] = {
      */
     { .name = "CONTEXTIDR_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 1,
-      .access = PL1_RW, .secure = ARM_CP_SECSTATE_NS,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .secure = ARM_CP_SECSTATE_NS,
       .fieldoffset = offsetof(CPUARMState, cp15.contextidr_el[1]),
       .resetvalue = 0, .writefn = contextidr_write, .raw_writefn = raw_write, },
     { .name = "CONTEXTIDR_S", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 1,
-      .access = PL1_RW, .secure = ARM_CP_SECSTATE_S,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .secure = ARM_CP_SECSTATE_S,
       .fieldoffset = offsetof(CPUARMState, cp15.contextidr_s),
       .resetvalue = 0, .writefn = contextidr_write, .raw_writefn = raw_write, },
     REGINFO_SENTINEL
@@ -803,7 +818,7 @@ static const ARMCPRegInfo not_v8_cp_reginfo[] = {
     /* MMU Domain access control / MPU write buffer control */
     { .name = "DACR",
       .cp = 15, .opc1 = CP_ANY, .crn = 3, .crm = CP_ANY, .opc2 = CP_ANY,
-      .access = PL1_RW, .resetvalue = 0,
+      .access = PL1_RW, .accessfn = access_tvm_trvm, .resetvalue = 0,
       .writefn = dacr_write, .raw_writefn = raw_write,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.dacr_s),
                              offsetoflow32(CPUARMState, cp15.dacr_ns) } },
@@ -996,7 +1011,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     { .name = "DMB", .cp = 15, .crn = 7, .crm = 10, .opc1 = 0, .opc2 = 5,
       .access = PL0_W, .type = ARM_CP_NOP },
     { .name = "IFAR", .cp = 15, .crn = 6, .crm = 0, .opc1 = 0, .opc2 = 2,
-      .access = PL1_RW,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ifar_s),
                              offsetof(CPUARMState, cp15.ifar_ns) },
       .resetvalue = 0, },
@@ -2208,16 +2223,19 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
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
@@ -2231,12 +2249,14 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
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
@@ -3886,20 +3906,21 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
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
@@ -3907,25 +3928,29 @@ static const ARMCPRegInfo vmsa_pmsa_cp_reginfo[] = {
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
@@ -3937,7 +3962,8 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
  */
 static const ARMCPRegInfo ttbcr2_reginfo = {
     .name = "TTBCR2", .cp = 15, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 3,
-    .access = PL1_RW, .type = ARM_CP_ALIAS,
+    .access = PL1_RW, .accessfn = access_tvm_trvm,
+    .type = ARM_CP_ALIAS,
     .bank_fieldoffsets = { offsetofhigh32(CPUARMState, cp15.tcr_el[3]),
                            offsetofhigh32(CPUARMState, cp15.tcr_el[1]) },
 };
@@ -4157,23 +4183,25 @@ static const ARMCPRegInfo lpae_cp_reginfo[] = {
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
                              offsetof(CPUARMState, cp15.par_ns)} },
     { .name = "TTBR0", .cp = 15, .crm = 2, .opc1 = 0,
-      .access = PL1_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .type = ARM_CP_64BIT | ARM_CP_ALIAS,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
                              offsetof(CPUARMState, cp15.ttbr0_ns) },
       .writefn = vmsa_ttbr_write, },
     { .name = "TTBR1", .cp = 15, .crm = 2, .opc1 = 1,
-      .access = PL1_RW, .type = ARM_CP_64BIT | ARM_CP_ALIAS,
+      .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .type = ARM_CP_64BIT | ARM_CP_ALIAS,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) },
       .writefn = vmsa_ttbr_write, },
@@ -4888,7 +4916,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .type = ARM_CP_NOP, .access = PL1_W },
     /* MMU Domain access control / MPU write buffer control */
     { .name = "DACR", .cp = 15, .opc1 = 0, .crn = 3, .crm = 0, .opc2 = 0,
-      .access = PL1_RW, .resetvalue = 0,
+      .access = PL1_RW, .accessfn = access_tvm_trvm, .resetvalue = 0,
       .writefn = dacr_write, .raw_writefn = raw_write,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.dacr_s),
                              offsetoflow32(CPUARMState, cp15.dacr_ns) } },
@@ -7765,7 +7793,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

