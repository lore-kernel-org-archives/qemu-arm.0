Received: by 10.28.71.27 with SMTP id u27csp2744448wma;
        Sat, 10 Feb 2018 15:09:24 -0800 (PST)
X-Google-Smtp-Source: AH8x227r218bYrpcMfG0T8EuE/Znh0esUvx9qxRXJBuypE0oh17efxpHbxoTeP7Quh/geeQfedaa
X-Received: by 10.129.87.139 with SMTP id l133mr5018571ywb.214.1518304163897;
        Sat, 10 Feb 2018 15:09:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518304163; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/AgCdL5Sv51tvuRR2J2RvglL8kVAREZlGJsAyAZM+ZW4zpYBTewCkqTB+m1Okp6Ac
         fL71MxUH/MN0eZclfWUrJOI1PLQA9tPgq6qzohaKPp9YC8HeDZy1XePg45cvUnTLeIie
         UAvKyTbJmrP+W40EYtyLDsUlm6lhbQGJ1OuJsjeNL5X84mJb8rtQOPQcQcK0FvBhjNTn
         PdPm1dylfa17kMx6NLnx3xUp1Od39bmUiIyKA9CjoNQqXSPbXNLamGD20/5gHuLnCkQ8
         UNL3ao+ucBedAlmNvqqMZI2BDIQ3MN+o9qfOhHl1UbTRhtjaR4WdOTQSYiW5XD1PVqyf
         UVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=u9SJZsEYOcc3Fv1vUr4knqPF5dvb+F9pFsuL2qHHgwA=;
        b=aMNNwY3gyN/wkqsJcZlqZ37EVoTT1SdhQ4w7HLrfKbIqrN9YhBegvMYaoW/evRvEB3
         zErSRSiijPAMYnT3K8/dKRJhgWbk4OULittZqvQK5j7SVOwR6QwnZZBZwRRc97smc7fl
         sVRDnOcFT4sQOroguFPoas7dAauIwNt2rEid24Lqd5uP2CMYFwp0L7uK9ehWMVUvrotf
         G1HUa0yjLapm4lMmlOKaneop9k96Rv8T+qQT1msckHxIyvSyLiFYz/IUXSTY5HajhS02
         X/XnQ1iSKzt2knmS1fQGtsMp6KStRGR4lL58H9IjY2A6OY6zMxJ0trxEFOnSbSbNG45I
         EX7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MnYQgg4t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f2si493093ybn.609.2018.02.10.15.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Feb 2018 15:09:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MnYQgg4t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekeGp-0000ld-88
	for alex.bennee@linaro.org; Sat, 10 Feb 2018 18:09:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeDH-0006Za-BP
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeDE-00087p-9J
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:43 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:44249)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekeDD-00086Q-S4
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:40 -0500
Received: by mail-pf0-x243.google.com with SMTP id 17so2679069pfw.11
	for <qemu-arm@nongnu.org>; Sat, 10 Feb 2018 15:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u9SJZsEYOcc3Fv1vUr4knqPF5dvb+F9pFsuL2qHHgwA=;
	b=MnYQgg4tjq4xVGN8vHjFa6v94oM7FNOFnkcm1AYLgTzLWAyywxFp/4u/H/biDClOw8
	syHQ2dUZpHTnKKubX3MKn+V6lmnFlP21RDHCArWvUXR8NNwq6EMEP3O5m0mLzawxsEkC
	+oXaTP39SppjPBxaViC7i2uoxMnzeTPfHO1Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u9SJZsEYOcc3Fv1vUr4knqPF5dvb+F9pFsuL2qHHgwA=;
	b=gMFyr3nRfpzfMCIsmcO4m7HHbaTr1Z0B0b96BC/5T+w+hHp92SH7ntIpJTobss+2vO
	qeyXW2QXgEUT+D0GXDPBZSJ2+xtCqExdmiuaVbz9ZzBsnxImozfrDcpncb7d3V1Q9PAp
	v7EQFA0UaNiZAA7RaPpAAaLLGfjDsPqxZ4jQXGEv61RuK6pGh+brJr5vbZ+pSNnhdsgt
	WbJQwyb8pP1xyCY+i7K3YWw5c7TX9OX6H9xtmwGtxAKr6kHNth0tb1ooG27QgXtriIzW
	jExfbfLjB9E7zhB8JxvfI+kyUa1KMQgqXv5Lug8EubmuGvFg/5UjkAdmSu8UWi8eQh2s
	e8Sg==
X-Gm-Message-State: APf1xPDRilr4g/A2ioi1CuxT6/t8VoEnMyBkaQ+dCtHtu/DqDnbAOvGL
	XumlQ3I34EJpabP6vvXQwOOv08VBV+8=
X-Received: by 10.101.77.140 with SMTP id p12mr5786154pgq.195.1518303938865;
	Sat, 10 Feb 2018 15:05:38 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	w10sm14122374pgr.57.2018.02.10.15.05.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Feb 2018 15:05:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 10 Feb 2018 15:05:29 -0800
Message-Id: <20180210230530.8421-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180210230530.8421-1-richard.henderson@linaro.org>
References: <20180210230530.8421-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH 4/5] target/arm: Enforce access to ZCR_EL at
 translation
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yPbGefUeOhnv

This also makes sure that we get the correct ordering of
SVE vs FP exceptions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  3 ++-
 target/arm/internals.h     |  6 ++++++
 target/arm/helper.c        | 22 ++++------------------
 target/arm/translate-a64.c | 16 ++++++++++++++++
 4 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e966a57f8a..51a3e16275 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1750,10 +1750,11 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
 #define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
 #define ARM_CP_FPU               0x1000
+#define ARM_CP_SVE               0x2000
 /* Used only as a terminator for ARMCPRegInfo lists */
 #define ARM_CP_SENTINEL          0xffff
 /* Mask of only the flag bits in a type field */
-#define ARM_CP_FLAG_MASK         0x10ff
+#define ARM_CP_FLAG_MASK         0x30ff
 
 /* Valid values for ARMCPRegInfo state field, indicating which of
  * the AArch32 and AArch64 execution states this register is visible in.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 89f5d2fe12..47cc224a46 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -243,6 +243,7 @@ enum arm_exception_class {
     EC_AA64_HVC               = 0x16,
     EC_AA64_SMC               = 0x17,
     EC_SYSTEMREGISTERTRAP     = 0x18,
+    EC_SVEACCESSTRAP          = 0x19,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -381,6 +382,11 @@ static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
         | (cv << 24) | (cond << 20);
 }
 
+static inline uint32_t syn_sve_access_trap(void)
+{
+    return EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT;
+}
+
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 {
     return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e0184c7162..550dc3d290 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4335,20 +4335,6 @@ static int sve_exception_el(CPUARMState *env)
     return 0;
 }
 
-static CPAccessResult zcr_access(CPUARMState *env, const ARMCPRegInfo *ri,
-                                 bool isread)
-{
-    switch (sve_exception_el(env)) {
-    case 3:
-        return CP_ACCESS_TRAP_EL3;
-    case 2:
-        return CP_ACCESS_TRAP_EL2;
-    case 1:
-        return CP_ACCESS_TRAP;
-    }
-    return CP_ACCESS_OK;
-}
-
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
@@ -4359,7 +4345,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static const ARMCPRegInfo zcr_el1_reginfo = {
     .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL1_RW, .accessfn = zcr_access,
+    .access = PL1_RW, .type = ARM_CP_SVE | ARM_CP_FPU,
     .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
     .writefn = zcr_write, .raw_writefn = raw_write
 };
@@ -4367,7 +4353,7 @@ static const ARMCPRegInfo zcr_el1_reginfo = {
 static const ARMCPRegInfo zcr_el2_reginfo = {
     .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .accessfn = zcr_access,
+    .access = PL2_RW, .type = ARM_CP_SVE | ARM_CP_FPU,
     .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[2]),
     .writefn = zcr_write, .raw_writefn = raw_write
 };
@@ -4375,14 +4361,14 @@ static const ARMCPRegInfo zcr_el2_reginfo = {
 static const ARMCPRegInfo zcr_no_el2_reginfo = {
     .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW,
+    .access = PL2_RW, .type = ARM_CP_SVE | ARM_CP_FPU,
     .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore
 };
 
 static const ARMCPRegInfo zcr_el3_reginfo = {
     .name = "ZCR_EL3", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL3_RW, .accessfn = zcr_access,
+    .access = PL3_RW, .type = ARM_CP_SVE | ARM_CP_FPU,
     .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[3]),
     .writefn = zcr_write, .raw_writefn = raw_write
 };
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 89f50558a7..e3881d4999 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1182,6 +1182,19 @@ static inline bool fp_access_check(DisasContext *s)
     return false;
 }
 
+/* Check that SVE access is enabled.  If it is, return true.
+ * If not, emit code to generate an appropriate exception and return false.
+ */
+static inline bool sve_access_check(DisasContext *s)
+{
+    if (s->sve_excp_el) {
+        gen_exception_insn(s, 4, EXCP_UDEF, syn_sve_access_trap(),
+                           s->sve_excp_el);
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
@@ -1631,6 +1644,9 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     default:
         break;
     }
+    if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
+        return;
+    }
     if ((ri->type & ARM_CP_FPU) && !fp_access_check(s)) {
         return;
     }
-- 
2.14.3

