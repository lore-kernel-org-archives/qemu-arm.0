Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1149494ejb;
        Mon, 30 Jan 2023 10:26:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/cQD7+M4G0Po/9RWgnGrrqoIvMisb3C6v5iV2OLYZjwFQjtn0EwGrWZF5hXT7KpMva/kLu
X-Received: by 2002:a0c:ab51:0:b0:53a:3a20:4200 with SMTP id i17-20020a0cab51000000b0053a3a204200mr13638384qvb.31.1675103164683;
        Mon, 30 Jan 2023 10:26:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675103164; cv=none;
        d=google.com; s=arc-20160816;
        b=dj2rmONP7tAZkUSKgVNf5ZL3KnO08DyDygqWJNYsMG8WXizgvvaPFlXChXvC6rFL3i
         0J+N7n08A1cgZOEj0CVhpV6wXdD4AvY4P0MG4MnpEh1JxSkJL3IzAe6KXUwGlTVvsOqA
         EKPPowaA4YtvHDUmySaHF98Hd3KOrlY+VdUnulCxERoZFCORyUMAMc/poyBK4DaDGcIp
         bEf6kFI7S9MuN4QEdmCuW1pYinN2eeht12JM8MFOknLEer5ejO5u1W1fuX+EdqD6498z
         HuOufwuZTpE5FHQPzf2xcj6ty3mQgFdxZgFMgfo2bSW0uBrdypbYJefdXe0b+1ggNOvS
         PeDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5OppjKsEFWrzHuMej0d7TRJ+lmUSsgoknvJv6YnUZ9I=;
        b=q6UBNz5+T/bYi7JmMJ1ril5TkrOLF66IXua1ymKZEEh/SpuF5U2mOHRqeAMQGDtddw
         jNLMW3ZWddUNvrbkT874FgPmQhA/bVKqkLKe7sBQooZ2a8mu7LJexJfegxnEXNqDb7/N
         HnxGUGJdBXEF0tKZnN2wgRv7y7cJ73G4etlPWkdi+HIBx8Uom3kVByJjh+mU+yd8ChMm
         IbNcwdeWEdQeG4AtBoMT9XSaiaC2qydqzE2dVsqHXKQToiHQDofswPGOw4QoRJJkwWF8
         9A9zk0z/Ghvrm37nI4QtGoKu5G89r18PZNK3HB+jLjJHrTaYUBqEM8a3Cs9ljOAsy+i6
         YkOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iO8g3aAo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020ad45762000000b005399bb931b4si4781926qvx.275.2023.01.30.10.26.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jan 2023 10:26:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iO8g3aAo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMYqS-0001Eu-Pw; Mon, 30 Jan 2023 13:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqP-0001CM-Iw
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:29 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqK-0008PX-Au
 for qemu-arm@nongnu.org; Mon, 30 Jan 2023 13:25:29 -0500
Received: by mail-wr1-x435.google.com with SMTP id y1so12006640wru.2
 for <qemu-arm@nongnu.org>; Mon, 30 Jan 2023 10:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5OppjKsEFWrzHuMej0d7TRJ+lmUSsgoknvJv6YnUZ9I=;
 b=iO8g3aAoSmI4JHtH3kA+JA6w8EI6AqCXrACoteJBXTbK05jj/coZrnaHGEGGFQkFjy
 3/1GC4CY9cXon5gJcR92jZJ3e+vrk/lQIRo9TzjKLK3mRtm1Xm/7vRu8vGHbn/IPLchb
 aHeue2EyQ7yoAuBWRjV6sIjE6+Jr6Y5SdO8k3qSlcxftPvrgv3hRo8eUrMqNTO9xOFWx
 TXgFy4oyKHC7pDmJaKUe7bLceJcqW6tAHZc2xj1jfbmiU72B+YXfRhkWtrjexVWDMzDD
 OOI/nKyu1ZkTY6bJu0vl9W0va9j50pL2gauLc2TMNt5UHchGM+BEePRnf+IGsvsz8uEN
 QviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5OppjKsEFWrzHuMej0d7TRJ+lmUSsgoknvJv6YnUZ9I=;
 b=BfHzPkbsFPa7uS+I+SGuIb2rBFXofTINQ2MFyXjUGV1dvnBTykNdFPaR4a43LzLpcO
 vH+VSRzHkx9QI19sZesX9UWMNm6YgXQ2UyWJZNbkQpV+iNYGkg4uJ+Mw6IooWA/qNe70
 0dv22Asuohw0RHbTfGDjkQgb2e9BL34BvcWQRGQB69DZef58kxKb53glRA3257KqaP0v
 0NL2UykUX5P1Dv5tcYcabPRPAFvEhgs7rTwwhD0Nvz4JISelg+p7ZwFHW7ZDUpmH7qr2
 aCW+M/PFq8s8CTvL1nShRmb3EU/rt2gNqcuQsa3+L3EgU8X3rZ0OnHm4ebueT1E1Xg/9
 E3Xg==
X-Gm-Message-State: AO0yUKWgg9gM8cfL4/LzgNO8w9+ePKts7cz9ol0Z3DcZrCK3wE7H30+H
 t3ZbWeh10y6E4rijP52LNFyDdlK8SvY540RO
X-Received: by 2002:a5d:650f:0:b0:2bf:ae11:c40c with SMTP id
 x15-20020a5d650f000000b002bfae11c40cmr20484662wru.32.1675103123539; 
 Mon, 30 Jan 2023 10:25:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 22/23] target/arm: Implement MDCR_EL2.TDCC and
 MDCR_EL3.TDCC traps
Date: Mon, 30 Jan 2023 18:24:58 +0000
Message-Id: <20230130182459.3309057-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /RooaWzUaSsm

FEAT_FGT also implements an extra trap bit in the MDCR_EL2 and
MDCR_EL3 registers: bit TDCC enables trapping of use of the Debug
Comms Channel registers OSDTRRX_EL1, OSDTRTX_EL1, MDCCSR_EL0,
MDCCINT_EL0, DBGDTR_EL0, DBGDTRRX_EL0 and DBGDTRTX_EL0 (and their
AArch32 equivalents).  This trapping is independent of whether
fine-grained traps are enabled or not.

Implement these extra traps.  (We don't implement DBGDTR_EL0,
DBGDTRRX_EL0 and DBGDTRTX_EL0.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-23-peter.maydell@linaro.org
---
 target/arm/debug_helper.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index b106746b0e1..3c671c88c1a 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -599,6 +599,33 @@ static CPAccessResult access_tda(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/*
+ * Check for traps to Debug Comms Channel registers. If FEAT_FGT
+ * is implemented then these are controlled by MDCR_EL2.TDCC for
+ * EL2 and MDCR_EL3.TDCC for EL3. They are also controlled by
+ * the general debug access trap bits MDCR_EL2.TDA and MDCR_EL3.TDA.
+ */
+static CPAccessResult access_tdcc(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+    uint64_t mdcr_el2 = arm_mdcr_el2_eff(env);
+    bool mdcr_el2_tda = (mdcr_el2 & MDCR_TDA) || (mdcr_el2 & MDCR_TDE) ||
+        (arm_hcr_el2_eff(env) & HCR_TGE);
+    bool mdcr_el2_tdcc = cpu_isar_feature(aa64_fgt, env_archcpu(env)) &&
+                                          (mdcr_el2 & MDCR_TDCC);
+    bool mdcr_el3_tdcc = cpu_isar_feature(aa64_fgt, env_archcpu(env)) &&
+                                          (env->cp15.mdcr_el3 & MDCR_TDCC);
+
+    if (el < 2 && (mdcr_el2_tda || mdcr_el2_tdcc)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && ((env->cp15.mdcr_el3 & MDCR_TDA) || mdcr_el3_tdcc)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void oslar_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -681,7 +708,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      */
     { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
-      .access = PL0_R, .accessfn = access_tda,
+      .access = PL0_R, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * OSDTRRX_EL1/OSDTRTX_EL1 are used for save and restore of DBGDTRRX_EL0.
@@ -689,11 +716,11 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      */
     { .name = "OSDTRRX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
       .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tda,
+      .access = PL1_RW, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "OSDTRTX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
       .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
-      .access = PL1_RW, .accessfn = access_tda,
+      .access = PL1_RW, .accessfn = access_tdcc,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     /*
      * OSECCR_EL1 provides a mechanism for an operating system
@@ -757,7 +784,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      */
     { .name = "MDCCINT_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 0,
-      .access = PL1_RW, .accessfn = access_tda,
+      .access = PL1_RW, .accessfn = access_tdcc,
       .type = ARM_CP_NOP },
     /*
      * Dummy DBGCLAIM registers.
-- 
2.34.1

