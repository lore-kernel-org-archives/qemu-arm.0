Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1563836wro;
        Thu, 14 Mar 2019 20:35:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHkOykeWBTsoZiGZLe/pV417p6acXrOr4PelaSakqyoXT9JqcjrjYgABYgsynPzdWuP9ip
X-Received: by 2002:adf:f111:: with SMTP id r17mr744546wro.272.1552620902527;
        Thu, 14 Mar 2019 20:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552620902; cv=none;
        d=google.com; s=arc-20160816;
        b=KUnaTzYXz9XbK51zCtOuh2rYIncDqaIoCHignAWUZL7fhlKXEChGOmEqDgCmJ6vMDT
         cfurBPx5Gp8nteXq6mAM0Cay9zqinMg206GcKAER3tITRdCdWPgNBRRPxCUph4t0x1ut
         6k0a6Q4VlLM9aTF3LIl9gXTWYfv5c4L5xeKLJ/Tzw7sc2+N2vGkI2iNoKZkVlSzLQCoZ
         En2mm1GBjpfVzEKQsOlPoe+hXuzIORZkS+Ji3LnSOmD8FNCSYvlBWvCVCcnQiEjQ1mWP
         RcBDfpLY9s55/Mu0G+Qx4e1lCigD9AevpEnzDMkVIp0b3iGN6VsgAkf7Er/5UF3MAa/6
         4d/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wUaNiLlnpoO4I9xjlRRq8x+Qys7GOrUiY0x3QzlpWQA=;
        b=VLhcfkWj2wRlyBIcHoYwaDJZro9jGCKTPTg9FdMRoz+coVIubGnoTo81lCEERVO8Ia
         wcjGENhnWBUZ2vWNw7FIc3pY+yh5BRPmuQU9NFNGMUCWBfJojRplo+TJqmxKQGXA2Im9
         HikguYhRxcoqo0OwYR6JSUDzPz3pYWNeQrIqZXBcnIJlAcxbXuT8cOVG3QuE5swasrJy
         7eCjfymOc4LTswqzrOjZ2sleDlBY3S68Tbua5KfizC6pnuKBvhKMuWko3YED3bIRcJYr
         iBwcG+OAr7MVwm3W5ldeBiM5IY7KP6B1Ncx9w6R2ehe/mJUSWLL6xCvrWySOnuJ2TFAw
         PZzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eJF99u6/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si429724wrt.269.2019.03.14.20.35.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 20:35:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eJF99u6/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4dcb-0005Ee-Dp
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 23:35:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4dcI-0004w5-2w
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 23:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4dUq-00039s-EE
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 23:27:01 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34789)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h4dUq-00039C-6M
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 23:27:00 -0400
Received: by mail-pg1-x542.google.com with SMTP id v12so5434125pgq.1
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 20:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wUaNiLlnpoO4I9xjlRRq8x+Qys7GOrUiY0x3QzlpWQA=;
	b=eJF99u6/rZaaOScD53XGXXKCgukmZZ9pb9QlZIslNjMWQegquM6IvFpFosxLl/lS9P
	cenvq/ikDD3wTm1IWikdr082lBsOyOArY+Q2HmFug056o+3OvzudaLmmbv1CrqCf+oVp
	8ZvF45dvX2plSqTVD1a52wWet8b2KMuiIA07cZTIC+Kv3c4ok5RPqqn5XGRaC9g/ZPA4
	ak21lgbv9uhOLGjllHVH/7cnJRVQ9/xIYS5Ey2DMoIThQAB/n1b9tsrhhy8/4MWg7aQk
	2iyuG3+H0OMZ0fG0dS2FVDWLSzSPNrq/fNgCDG2t1YHKasnmlPwN1G6+/YV1j0SwrHAG
	P92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wUaNiLlnpoO4I9xjlRRq8x+Qys7GOrUiY0x3QzlpWQA=;
	b=G9bCD2qiOuG7zyO9YvCg1wgTaQdHBIUqmc/bCHhkCfJk2cDaTUPdczXEPK50/fqspF
	4W0t4hs6qqUYBLBj0guwgM+gBlmxsrgeBWBVJV7oOUp9EPEaJ7vOyqgGCR9nbMbLCCey
	F1OIlUeEX6jtzBLUAQH9lvPOWk7Aa09P0DraRwTFpozgllcO5GkysJHkrmPSqXWiUvBC
	FEtl7QonkPZuykXbPjuxPUTLYHPKg3vAj47IYElPltCwhe8ncCmcYgxNWGVUF25YEzoZ
	McOg9cegwRJswySWMfD5kGD8sYPPf4oBijxoqfNg6Ftlp2n0S7ZX3BCY9ifL+o5Vn6qZ
	Kkfw==
X-Gm-Message-State: APjAAAX0CbdDd+dSO7W4XiXF6U79sGadB2lERwkWv9uBwadGQQjNPJRQ
	IAE68rX7EgleanXdIh0L9Ve8MAzcmR8=
X-Received: by 2002:a65:6546:: with SMTP id a6mr1277968pgw.296.1552620419297; 
	Thu, 14 Mar 2019 20:26:59 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id d26sm690816pfn.86.2019.03.14.20.26.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Mar 2019 20:26:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 14 Mar 2019 20:26:27 -0700
Message-Id: <20190315032629.21234-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190315032629.21234-1-richard.henderson@linaro.org>
References: <20190315032629.21234-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v3 21/23] target/arm: Implement ARMv8.5-RNG
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iDlKli2Xc1wy

Cc: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Log errors with -d unimp, for lack of a better flag.
---
 target/arm/cpu.h    |  5 +++++
 target/arm/cpu64.c  |  1 +
 target/arm/helper.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ae2381e222..6a078aa1a0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3443,6 +3443,11 @@ static inline bool isar_feature_aa64_condm_5(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TS) >= 2;
 }
 
+static inline bool isar_feature_aa64_rndr(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, RNDR) != 0;
+}
+
 static inline bool isar_feature_aa64_jscvt(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, JSCVT) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 228906f267..835f73cceb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -310,6 +310,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
         t = cpu->isar.id_aa64isar1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b5d63f894..4a8d2d4481 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -20,6 +20,8 @@
 #include "fpu/softfloat.h"
 #include "qemu/range.h"
 #include "qapi/qapi-commands-target.h"
+#include "qapi/error.h"
+#include "qemu/guest-random.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -5717,6 +5719,45 @@ static const ARMCPRegInfo pauth_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, keys.apib.hi) },
     REGINFO_SENTINEL
 };
+
+static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    Error *err = NULL;
+    uint64_t ret;
+
+    /* Success sets NZCV = 0000.  */
+    env->NF = env->CF = env->VF = 0, env->ZF = 1;
+
+    if (qemu_guest_getrandom(&ret, sizeof(ret), &err) < 0) {
+        /*
+         * ??? Failed, for unknown reasons in the crypto subsystem.
+         * The best we can do is log the reason and return the
+         * timed-out indication to the guest.  There is no reason
+         * we know to expect this failure to be transitory, so the
+         * guest may well hang retrying the operation.
+         */
+        qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
+                      ri->name, error_get_pretty(err));
+        error_free(err);
+
+        env->ZF = 0; /* NZCF = 0100 */
+        return 0;
+    }
+    return ret;
+}
+
+/* We do not support re-seeding, so the two registers operate the same.  */
+static const ARMCPRegInfo rndr_reginfo[] = {
+    { .name = "RNDR", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .opc0 = 3, .opc1 = 3, .crn = 2, .crm = 4, .opc2 = 0,
+      .access = PL0_R, .readfn = rndr_readfn },
+    { .name = "RNDRRS", .state = ARM_CP_STATE_AA64,
+      .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
+      .opc0 = 3, .opc1 = 3, .crn = 2, .crm = 4, .opc2 = 1,
+      .access = PL0_R, .readfn = rndr_readfn },
+    REGINFO_SENTINEL
+};
 #endif
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -6661,6 +6702,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
+    if (cpu_isar_feature(aa64_rndr, cpu)) {
+        define_arm_cp_regs(cpu, rndr_reginfo);
+    }
 #endif
 
     /*
-- 
2.17.2

