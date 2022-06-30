Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp619792lft;
        Thu, 30 Jun 2022 12:49:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v1T/WKVWt/5OgSaGIQJFvkdSsd6knD3hp/XOVufRKCmSKvE5qchmvh7IfzuvrjIG3gA9Ch
X-Received: by 2002:a05:620a:4708:b0:6b1:68c8:541e with SMTP id bs8-20020a05620a470800b006b168c8541emr6624521qkb.748.1656618558768;
        Thu, 30 Jun 2022 12:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656618558; cv=none;
        d=google.com; s=arc-20160816;
        b=DeYijl9WJdRIQIHDJ05A6okviKkEyM4/yf+L0sWm9pcapmpGzIyRyD56DBHOG/uCzc
         7bNISoolDmjLHMAVDJRC+at510eiX+1QIvbQ60xx3sjm6zliM//JomQxxWdV2K3oCJV7
         TCb/33iY4TAD/SDKnRV8C8+K/nwAXFEr4cSQdU7KXn/nyfTGCEFLAkgaqPOrS9eVGjkQ
         OL8DNAZ+ebom21YOuITXRQ7/OYqQQ6N0ApZiYvIUmSyb0Jek8YCUMlpqaUN7aFMsjbmV
         /Mzf5lvEduRM46IJvTMkVfLgJfHEki8MzdQYZ/sWnI6OavPcn+sO5uxbXaNJ0ygslVVj
         JhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gxCySAGYvgbHeMWk/bvkJgi22PGqoAxpMgQUYLIF/6g=;
        b=hWWk7NTs9Qt2UqJUZl5kQUlk8Mb6+ViZeb5ZwyySMRQw7Q70pwqfjzciBTX3CbKiOK
         kIf+m/XFudAOGhTchPuEOe8elCRtkTxoaoyRq+EBh0t//NWmcmLJ0zXQJn0PhYuFC4Xx
         MoEp547qVERHxLBQzf2xgur2Os0Yf03wkmQpr+l7tycS4ssBJ3rMNs6/loZdfvLmoUu4
         WZBi92iPMUEbL+hT3KFntrxYbZwex9EBCKQLQtDXI66P8CEcHn/o1/J5wvsk7ATc3LA9
         hiyHapaok/1dIPlH8UUyA2Ps0ETd1kG0KUW7Wv4QdsuXLNjxWYP1SoQlTOdLZB9g+Fgm
         NNDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ocqGm0NZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05622a04c600b003191a57c6e6si8867146qtx.167.2022.06.30.12.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 12:49:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ocqGm0NZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o70AA-0001U3-6d
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 15:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o702f-00032Z-Fq
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 15:41:33 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o702a-0005i7-2S
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 15:41:33 -0400
Received: by mail-wr1-x432.google.com with SMTP id v9so61865wrp.7
 for <qemu-arm@nongnu.org>; Thu, 30 Jun 2022 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gxCySAGYvgbHeMWk/bvkJgi22PGqoAxpMgQUYLIF/6g=;
 b=ocqGm0NZ2DXvR4jb2upcAUNmcCEiQmP5WnEP3+LsH21sdvvupj7uKb9BUIs03ty54D
 i4neekB+8NbIDytWdqUpSIJm8YzeXWQ+ajOLuNG7C5c3wMOlUDF2FrZaF3tUq/YjZPAu
 gRoKf9dTEouUBSlbV0tD8TZ6wI483lIa3Zh9xkym+hXeNw9sO5S4VMYNK3RUJdBGooOM
 +B3SqMR8dHy5FBE60c6exDT+I6lzrL9g+RgNYQ2Y1MurUHFBDwEJSoaufe7eOzskDcIL
 4uX36SPwALgfT7RVGgJs165f7v5omdphvBQj2G6tfVXeoE0oX2/UtUPWKWjNVXRm7elW
 HTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gxCySAGYvgbHeMWk/bvkJgi22PGqoAxpMgQUYLIF/6g=;
 b=oX/tWQxm1E/WyF3/ikm3l4JEioouwymLoEPnuWompCVRXtEEgos3T+cSmLgiAd9bGy
 Da2hjLr3fMEgvHL/UUQJOL9rOOKy0EuCIcLSmW1ZeDjqdOx/vs/B3K/BAuYN74k+GqUg
 XAvXJxGHUF8GMSoNRms8CbQWqDvHiqYnjt+CW1R4DOcmSquaWvU7r1I8nu/S23g5gc7+
 oYzOshqoAvdJWaaQn0HXhry0YBSYl/Ar2SAWjurjcNTxfQ4YXYyBoR39/LeqW82ApBs9
 w6Yh6qoebT/+0gEIxcv141vy7saLngF1tJ4XxXuXxC++oYXazTXgmzHeTC9oDSqjY6Xg
 1SNg==
X-Gm-Message-State: AJIora++0jMFQ4ZjutUP6nLaoshO32ZcsZrJ+mtmu/upVBW3JmZGkwEh
 Ahh8fc6fDqFLw+u+WdBg8cemBBH1x9gUKA==
X-Received: by 2002:a5d:4e12:0:b0:21b:ae89:73e7 with SMTP id
 p18-20020a5d4e12000000b0021bae8973e7mr9825784wrt.386.1656618086809; 
 Thu, 30 Jun 2022 12:41:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m2-20020adffa02000000b0021d163daeb0sm13200228wrr.108.2022.06.30.12.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:41:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/5] target/arm: Correctly implement Feat_DoubleLock
Date: Thu, 30 Jun 2022 20:41:16 +0100
Message-Id: <20220630194116.3438513-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630194116.3438513-1-peter.maydell@linaro.org>
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: N8Npg4RIOYVF

The architecture defines the OS DoubleLock as a register which
(similarly to the OS Lock) suppresses debug events for use in CPU
powerdown sequences.  This functionality is required in Arm v7 and
v8.0; from v8.2 it becomes optional and in v9 it must not be
implemented.

Currently in QEMU we implement the OSDLR_EL1 register as a NOP.  This
is wrong both for the "feature implemented" and the "feature not
implemented" cases: if the feature is implemented then the DLK bit
should read as written and cause suppression of debug exceptions, and
if it is not implemented then the bit must be RAZ/WI.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Is there a nicer way to implement the isar_any feature test ?
What I have here is correct but a bit ad-hoc.
---
 target/arm/cpu.h          | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/debug_helper.c | 17 +++++++++++++++--
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c533ad0b64d..069dfe1d308 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -500,6 +500,7 @@ typedef struct CPUArchState {
         uint64_t dbgwcr[16]; /* watchpoint control registers */
         uint64_t mdscr_el1;
         uint64_t oslsr_el1; /* OS Lock Status */
+        uint64_t osdlr_el1; /* OS DoubleLock status */
         uint64_t mdcr_el2;
         uint64_t mdcr_el3;
         /* Stores the architectural value of the counter *the last time it was
@@ -2253,6 +2254,15 @@ FIELD(DBGDIDR, CTX_CMPS, 20, 4)
 FIELD(DBGDIDR, BRPS, 24, 4)
 FIELD(DBGDIDR, WRPS, 28, 4)
 
+FIELD(DBGDEVID, PCSAMPLE, 0, 4)
+FIELD(DBGDEVID, WPADDRMASK, 4, 4)
+FIELD(DBGDEVID, BPADDRMASK, 8, 4)
+FIELD(DBGDEVID, VECTORCATCH, 12, 4)
+FIELD(DBGDEVID, VIRTEXTNS, 16, 4)
+FIELD(DBGDEVID, DOUBLELOCK, 20, 4)
+FIELD(DBGDEVID, AUXREGS, 24, 4)
+FIELD(DBGDEVID, CIDMASK, 28, 4)
+
 FIELD(MVFR0, SIMDREG, 0, 4)
 FIELD(MVFR0, FPSP, 4, 4)
 FIELD(MVFR0, FPDP, 8, 4)
@@ -3731,6 +3741,11 @@ static inline bool isar_feature_aa32_debugv8p2(const ARMISARegisters *id)
     return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 8;
 }
 
+static inline bool isar_feature_aa32_doublelock(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->dbgdevid, DBGDEVID, DOUBLELOCK) > 0;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4155,6 +4170,11 @@ static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, FA64);
 }
 
+static inline bool isar_feature_aa64_doublelock(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64dfr0, ID_AA64DFR0, DOUBLELOCK) >= 0;
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
@@ -4198,6 +4218,22 @@ static inline bool isar_feature_any_ras(const ARMISARegisters *id)
     return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
 }
 
+static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
+{
+    /*
+     * We can't just OR together the aa32 and aa64 checks, because
+     * if there is no AArch64 support the aa64 function will default
+     * to returning true for a zero id_aa64dfr0.
+     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
+     * the AArch64 ID register values in id", because it's always the
+     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
+     */
+    if (id->id_aa64pfr0) {
+        return isar_feature_aa64_doublelock(id);
+    }
+    return isar_feature_aa32_doublelock(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index e96a4ffd28d..62bd8f85383 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -142,7 +142,7 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
  */
 bool arm_generate_debug_exceptions(CPUARMState *env)
 {
-    if (env->cp15.oslsr_el1 & 1) {
+    if ((env->cp15.oslsr_el1 & 1) || (env->cp15.osdlr_el1 & 1)) {
         return false;
     }
     if (is_a64(env)) {
@@ -614,6 +614,18 @@ static void oslar_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.oslsr_el1 = deposit32(env->cp15.oslsr_el1, 1, 1, oslock);
 }
 
+static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                        uint64_t value)
+{
+    /*
+     * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
+     * implemented this is RAZ/WI.
+     */
+    if (cpu_isar_feature(any_doublelock, env_archcpu(env))) {
+        env->cp15.osdlr_el1 = value & 1;
+    }
+}
+
 static const ARMCPRegInfo debug_cp_reginfo[] = {
     /*
      * DBGDRAR, DBGDSAR: always RAZ since we don't implement memory mapped
@@ -670,7 +682,8 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "OSDLR_EL1", .state = ARM_CP_STATE_BOTH,
       .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 4,
       .access = PL1_RW, .accessfn = access_tdosa,
-      .type = ARM_CP_NOP },
+      .writefn = osdlr_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.osdlr_el1) },
     /*
      * Dummy DBGVCR: Linux wants to clear this on startup, but we don't
      * implement vector catch debug events yet.
-- 
2.25.1

