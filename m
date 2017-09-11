Received: by 10.223.172.38 with SMTP id v35csp5563802wrc;
        Mon, 11 Sep 2017 06:55:04 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDZN2iEhJS4k7eqE5LqGKVPbB6zyUh5uSQj6OXaKWd7mhth0kic55ZhtU5NuMNLMDrCfQeT
X-Received: by 10.55.102.212 with SMTP id a203mr16361764qkc.272.1505138104073;
        Mon, 11 Sep 2017 06:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505138104; cv=none;
        d=google.com; s=arc-20160816;
        b=nW2rdETGHKNPVf5SbNneVVwthLvYbqfo7aZTxxdAEmF/RzC0AWi3ZzOm9E8NxUw46q
         /38624nKgOtOJ2ARs6JmvFnzIyCN0P+tuUsfaGGTmLq1Y338at/uIMnSqFcIFYvUfeQ6
         nXK+YiMTFQ505EDF3UphxIqt8LmQK9WMC2moMFGaRAonF74AFVovxoelDl8ysXBDRcPf
         g7By13jfQyBo0imgqJdDFr5OcxPBwyn164qTP1YdlQO7OnTMpyAqx8fvKV6ZGDmYg37Z
         lBwCmTuvkXkc3bY+JObqwYBVzlwgnWhC54tVkgg9BkIsmJJZ5w6cRC1mE+hrtFN2aD1j
         +mVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=BWsjrYSavSxCnT1vxbk0oAog74deWZZ/WZ4O5Nys86A=;
        b=Icc1ah5ST6vVOkK8IpJFcsf+8zMkvWg9yFR/VsbZnOniuz52VSP18o5ulnSHe5DWrB
         MAq8KBtLTN5mPsOkepBNPuur4j297+VESHRsBEXUxQSFcSz86UKZ54J6siRV3bb3oO0/
         iRz46dKFDMYzsbvPl9YRzArPZe8/emMwrjiAqWa9cQMpjGwocfV3ygoYrRbIXaGkLJsi
         c3RptLaLSNR9jBEqMOdWhQMbG5IHbVg2E+XDvouh5CG1nSjvURrbnW9XCBKhrX+3dXV3
         mWZqOU0nrX75yAPkRclE0ikc+vBnl8ELMqVQk7CXU15oPVR/XjszFJLzUsE2FfPKEgc3
         WAJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s68si9366587qkf.486.2017.09.11.06.55.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 06:55:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drPAz-0004UG-Kq
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 09:55:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP86-0001fj-8T
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:52:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP82-0002Ac-7b
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 09:52:02 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37238)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drP82-00023m-0L; Mon, 11 Sep 2017 09:51:58 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drP7s-0007mr-VD; Mon, 11 Sep 2017 14:51:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 14:52:09 +0100
Message-Id: <1505137930-13255-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/7] target/arm: Add and use defines for EXCRET
 constants
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rzke6dQYKH92

The exception-return magic values get some new bits in v8M, which
makes some bit definitions for them worthwhile.

We don't use the bit definitions for the switch on the low bits
which checks the return type for v7M, because this is defined
in the v7M ARM ARM as a set of valid values rather than via
per-bit checks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 10 ++++++++++
 target/arm/helper.c    | 14 +++++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a315354..18be370 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -61,6 +61,16 @@ FIELD(V7M_CONTROL, NPRIV, 0, 1)
 FIELD(V7M_CONTROL, SPSEL, 1, 1)
 FIELD(V7M_CONTROL, FPCA, 2, 1)
 
+/* Bit definitions for v7M exception return payload */
+FIELD(V7M_EXCRET, ES, 0, 1)
+FIELD(V7M_EXCRET, RES0, 1, 1)
+FIELD(V7M_EXCRET, SPSEL, 2, 1)
+FIELD(V7M_EXCRET, MODE, 3, 1)
+FIELD(V7M_EXCRET, FTYPE, 4, 1)
+FIELD(V7M_EXCRET, DCRS, 5, 1)
+FIELD(V7M_EXCRET, S, 6, 1)
+FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
+
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
  * Note that this mapping and the AArch32 mapping defined in bank_number()
diff --git a/target/arm/helper.c b/target/arm/helper.c
index fdd5cc6..a502e4e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6242,7 +6242,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                   " previous exception %d\n",
                   type, env->v7m.exception);
 
-    if (extract32(type, 5, 23) != extract32(-1, 5, 23)) {
+    if ((type & R_V7M_EXCRET_RES1_MASK) != R_V7M_EXCRET_RES1_MASK) {
         qemu_log_mask(LOG_GUEST_ERROR, "M profile: zero high bits in exception "
                       "exit PC value 0x%" PRIx32 " are UNPREDICTABLE\n", type);
     }
@@ -6255,7 +6255,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          * which security state's faultmask to clear. (v8M ARM ARM R_KBNF.)
          */
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            int es = type & 1;
+            int es = type & R_V7M_EXCRET_ES_MASK;
             if (armv7m_nvic_raw_execution_priority(env->nvic) >= 0) {
                 env->v7m.faultmask[es] = 0;
             }
@@ -6491,12 +6491,16 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         return; /* Never happens.  Keep compiler happy.  */
     }
 
-    lr = 0xfffffff1;
+    lr = R_V7M_EXCRET_RES1_MASK |
+        R_V7M_EXCRET_S_MASK |
+        R_V7M_EXCRET_DCRS_MASK |
+        R_V7M_EXCRET_FTYPE_MASK |
+        R_V7M_EXCRET_ES_MASK;
     if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) {
-        lr |= 4;
+        lr |= R_V7M_EXCRET_SPSEL_MASK;
     }
     if (!arm_v7m_is_handler_mode(env)) {
-        lr |= 8;
+        lr |= R_V7M_EXCRET_MODE_MASK;
     }
 
     v7m_push_stack(cpu);
-- 
2.7.4

