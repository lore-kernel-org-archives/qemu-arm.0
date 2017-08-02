Received: by 10.25.44.15 with SMTP id s15csp6356248lfs;
        Wed, 2 Aug 2017 09:47:08 -0700 (PDT)
X-Received: by 10.237.49.132 with SMTP id 4mr34600143qth.105.1501692428692;
        Wed, 02 Aug 2017 09:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692428; cv=none;
        d=google.com; s=arc-20160816;
        b=hSL2nrjQBOCbqhQAf8C3WejpTrdmz4hBZatHSlSsJR5ezouPxt/o9VG1MKijQbqfdK
         g1UYzLyFG3Un1EKBQMMrgmOJexVqFpVrojKLy/G9Vj6mmLsAY0wms/BKx/Sifm/vCTP4
         lk2GeTOWpoHsezbbn11+aisezJSRX6JAZKeni1b8978Ig60qaWoUn5kqJV0TfusReR+v
         XvCTaGcPb2P1owYjwmyu048iMvkkLm5SgWx6IAtGQCBHPjTLN8kks1rIVu9mAoZ3FDN2
         EiussbO44LWhNa6cPXCppZcNyAFNPn3XCYnuMbFiSoWXfG19ef5LxXXYO9U5SNGTTR4i
         7NgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bDtLgHuN1uARvu8/XUeKUmQoJ3+0PqDF3HbngR8y97A=;
        b=uvWYyPp2/ZWy/Ozi4lL7bvvCN+PzwA3eQ1mLcNHQ+V0Tt5FWhNFDs0C2dal7i/eEEm
         gU7kUSEYGI869mw8Wr9KUh0hVTmDwUoNW0XNivq1pZNELlSqjXHeK+Ccg1YR0SXp3opy
         6VcaJjkIoZWYm4WS0qO/HqSg1bqtHxaTr3+V8+eS4uwHLiiE0CSoWDv8pz3iIS4Qo8Dd
         zMX+Wn1i+jRa4TwqsJi2CcFL6rxTh20aw3RX31IDBaRK9K35kESARL8CWijNtpKCjO5+
         Dk9Zrj43CFKuFLhQkKPlpOVNQzxQ87HHmJUyJFGguKGc6r4feGOIfCCGF8PHH2FPpXOQ
         gG9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4si27962976qte.462.2017.08.02.09.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwnZ-0005Jf-WF
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:47:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl9-0003Yq-FQ
	for qemu-devel@nongnu.org; Wed, 02 Aug 2017 12:44:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl8-0004ly-Dw
	for qemu-devel@nongnu.org; Wed, 02 Aug 2017 12:44:35 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwl5-0003zA-PS; Wed, 02 Aug 2017 12:44:31 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkh-0003zO-EN; Wed, 02 Aug 2017 17:44:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:56 +0100
Message-Id: <1501692241-23310-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 10/15] target/arm: Don't use
 cpsr_write/cpsr_read to transfer M profile XPSR
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7cN4yxDboTgE

For M profile the XPSR is a similar but not identical format to the
A profile CPSR/SPSR. (For instance the Thumb bit is in a different
place.) For guest accesses we make the M profile code go through
xpsr_read() and xpsr_write() which handle the different layout.
However for migration we use cpsr_read() and cpsr_write() to
marshal state into and out of the migration data stream. This
is pretty confusing and works more by luck than anything else.
Make M profile migration use xpsr_read() and xpsr_write() instead.

The most complicated part of this is handling the possibility
that the migration source is an older QEMU which hands us a
CPSR format value; helpfully we can always tell the two apart.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/machine.c | 49 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 2fb4b76..3193b00 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -217,21 +217,37 @@ static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
     uint32_t val = qemu_get_be32(f);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-        /* If the I or F bits are set then this is a migration from
-         * an old QEMU which still stored the M profile FAULTMASK
-         * and PRIMASK in env->daif. Set v7m.faultmask and v7m.primask
-         * accordingly, and then clear the bits so they don't confuse
-         * cpsr_write(). For a new QEMU, the bits here will always be
-         * clear, and the data is transferred using the
-         * vmstate_m_faultmask_primask subsection.
-         */
-        if (val & CPSR_F) {
-            env->v7m.faultmask = 1;
-        }
-        if (val & CPSR_I) {
-            env->v7m.primask = 1;
+        if (val & XPSR_EXCP) {
+            /* This is a CPSR format value from an older QEMU. (We can tell
+             * because values transferred in XPSR format always have zero
+             * for the EXCP field, and CPSR format will always have bit 4
+             * set in CPSR_M.) Rearrange it into XPSR format. The significant
+             * differences are that the T bit is not in the same place, the
+             * primask/faultmask info may be in the CPSR I and F bits, and
+             * we do not want the mode bits.
+             */
+            uint32_t newval = val;
+
+            newval &= (CPSR_NZCV | CPSR_Q | CPSR_IT | CPSR_GE);
+            if (val & CPSR_T) {
+                newval |= XPSR_T;
+            }
+            /* If the I or F bits are set then this is a migration from
+             * an old QEMU which still stored the M profile FAULTMASK
+             * and PRIMASK in env->daif. For a new QEMU, the data is
+             * transferred using the vmstate_m_faultmask_primask subsection.
+             */
+            if (val & CPSR_F) {
+                env->v7m.faultmask = 1;
+            }
+            if (val & CPSR_I) {
+                env->v7m.primask = 1;
+            }
+            val = newval;
         }
-        val &= ~(CPSR_F | CPSR_I);
+        /* Ignore the low bits, they are handled by vmstate_m. */
+        xpsr_write(env, val, ~XPSR_EXCP);
+        return 0;
     }
 
     env->aarch64 = ((val & PSTATE_nRW) == 0);
@@ -252,7 +268,10 @@ static int put_cpsr(QEMUFile *f, void *opaque, size_t size,
     CPUARMState *env = &cpu->env;
     uint32_t val;
 
-    if (is_a64(env)) {
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        /* The low 9 bits are v7m.exception, which is handled by vmstate_m. */
+        val = xpsr_read(env) & ~XPSR_EXCP;
+    } else if (is_a64(env)) {
         val = pstate_read(env);
     } else {
         val = cpsr_read(env);
-- 
2.7.4

