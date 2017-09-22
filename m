Received: by 10.223.172.38 with SMTP id v35csp3217407wrc;
        Fri, 22 Sep 2017 08:07:42 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAd/YLR9Ag0v8le8O/ovtpwlFqjXueZQ+CsZIpuzPxXHr2HGsYciA+G5gRLXjGtB0tYb3ZI
X-Received: by 10.55.48.210 with SMTP id w201mr8198252qkw.117.1506092862322;
        Fri, 22 Sep 2017 08:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092862; cv=none;
        d=google.com; s=arc-20160816;
        b=W8b2PUhJxAIZdnxjgoSarA38X1L9sukjMPicgE6yne9r7skF9PIxcdYvpU+hytbTuz
         4Bl6IRmYFlgSKceRMT5/xvUFx6qQc6j1+ltVpu9rFEp7e6MbWJyWQqSRoK4YGERMpc5e
         YRihsabPyKrk/HpnbnQcV9LDQrA5LiFMnywOFIwpOYjplEsoDgfveKtBPDkZ97XhLQ8E
         bzkLeAQFf3unPkdtRa/g4LT6lruwO5PjGbtUh7XC0vkqbYvEddROW0VEY+lGyqvt8kLR
         Le83PMn7alm4niuzJazyz4wwLD8c47gWyv1guFlAi0VQkNBRDBGxIXVln99UJ9bHVWpC
         SJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=fa6mdZIut2A2NQf1izgJ1b4XVtoS/B4w08kdnPJjIP4=;
        b=YJMiVnYjQNScBMGiLgUNLTQGDJQWF604xlimtK6RtdKLZIjl6/OkXI73xUuLdimtz2
         xKNfIy3tHJxOl2WQQRadF6Yp/T0EcebrT4bvWh6xtbLnlp0C/tBF1BXOw5CY7+MEinoN
         p26lvMldZx14CxKrmn7I0SDlQHcc0cGHIu8DFv8erteyVmL6rIfSYD/nH+2bOmZzZ738
         j0EuvoUy7rEyZ4nsLXqUsA1FImTJ5t5uD4VVaCwLDoB9FvI/DqTm1tS1KnEi/hyHbWFA
         HHxPjjfPbhhDnuV5eE5jPl9RHJCtP52g2RhcpUwYxuH5guQC5KlcFL+gWNS9pv5V98M7
         93TA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b64si35152qka.109.2017.09.22.08.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:07:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPYJ-0006hT-U9
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:07:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQY-0007wo-U4
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQY-00045h-12
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:39 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37562)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQX-00044o-Pj; Fri, 22 Sep 2017 10:59:37 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQW-0007CA-L7; Fri, 22 Sep 2017 15:59:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:57 +0100
Message-Id: <1506092407-26985-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 10/20] target/arm: Update excret sanity checks
 for v8M
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
X-TUID: vG+dGKVBptcV

In v8M, more bits are defined in the exception-return magic
values; update the code that checks these so we accept
the v8M values when the CPU permits them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 73 ++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 59a07d2..da3a36e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6275,8 +6275,9 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     uint32_t excret;
     uint32_t xpsr;
     bool ufault = false;
-    bool return_to_sp_process = false;
-    bool return_to_handler = false;
+    bool sfault = false;
+    bool return_to_sp_process;
+    bool return_to_handler;
     bool rettobase = false;
     bool exc_secure = false;
     bool return_to_secure;
@@ -6310,6 +6311,19 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                       excret);
     }
 
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        /* EXC_RETURN.ES validation check (R_SMFL). We must do this before
+         * we pick which FAULTMASK to clear.
+         */
+        if (!env->v7m.secure &&
+            ((excret & R_V7M_EXCRET_ES_MASK) ||
+             !(excret & R_V7M_EXCRET_DCRS_MASK))) {
+            sfault = 1;
+            /* For all other purposes, treat ES as 0 (R_HXSR) */
+            excret &= ~R_V7M_EXCRET_ES_MASK;
+        }
+    }
+
     if (env->v7m.exception != ARMV7M_EXCP_NMI) {
         /* Auto-clear FAULTMASK on return from other than NMI.
          * If the security extension is implemented then this only
@@ -6347,24 +6361,53 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         g_assert_not_reached();
     }
 
+    return_to_handler = !(excret & R_V7M_EXCRET_MODE_MASK);
+    return_to_sp_process = excret & R_V7M_EXCRET_SPSEL_MASK;
     return_to_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
         (excret & R_V7M_EXCRET_S_MASK);
 
-    switch (excret & 0xf) {
-    case 1: /* Return to Handler */
-        return_to_handler = true;
-        break;
-    case 13: /* Return to Thread using Process stack */
-        return_to_sp_process = true;
-        /* fall through */
-    case 9: /* Return to Thread using Main stack */
-        if (!rettobase &&
-            !(env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_NONBASETHRDENA_MASK)) {
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        if (!arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            /* UNPREDICTABLE if S == 1 or DCRS == 0 or ES == 1 (R_XLCP);
+             * we choose to take the UsageFault.
+             */
+            if ((excret & R_V7M_EXCRET_S_MASK) ||
+                (excret & R_V7M_EXCRET_ES_MASK) ||
+                !(excret & R_V7M_EXCRET_DCRS_MASK)) {
+                ufault = true;
+            }
+        }
+        if (excret & R_V7M_EXCRET_RES0_MASK) {
             ufault = true;
         }
-        break;
-    default:
-        ufault = true;
+    } else {
+        /* For v7M we only recognize certain combinations of the low bits */
+        switch (excret & 0xf) {
+        case 1: /* Return to Handler */
+            break;
+        case 13: /* Return to Thread using Process stack */
+        case 9: /* Return to Thread using Main stack */
+            /* We only need to check NONBASETHRDENA for v7M, because in
+             * v8M this bit does not exist (it is RES1).
+             */
+            if (!rettobase &&
+                !(env->v7m.ccr[env->v7m.secure] &
+                  R_V7M_CCR_NONBASETHRDENA_MASK)) {
+                ufault = true;
+            }
+            break;
+        default:
+            ufault = true;
+        }
+    }
+
+    if (sfault) {
+        env->v7m.sfsr |= R_V7M_SFSR_INVER_MASK;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+        v7m_exception_taken(cpu, excret);
+        qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
+                      "stackframe: failed EXC_RETURN.ES validity check\n");
+        return;
     }
 
     if (ufault) {
-- 
2.7.4

