Received: by 10.182.158.201 with SMTP id ww9csp3413167obb;
        Wed, 2 Dec 2015 16:21:13 -0800 (PST)
X-Received: by 10.55.79.207 with SMTP id d198mr7236300qkb.49.1449102073920;
        Wed, 02 Dec 2015 16:21:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y203si6177479qka.43.2015.12.02.16.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:21:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4He5-00087m-Ij
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:21:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc2-0004B2-LY
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 19:19:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc1-0001yV-PS
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 19:19:06 -0500
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:36357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hbz-0001xA-Tu; Wed, 02 Dec 2015 19:19:03 -0500
Received: by qkda6 with SMTP id a6so23874949qkd.3;
	Wed, 02 Dec 2015 16:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ceShUSRsK9N2cX++r12+TH3t/doT7b0T6bcb5O4iikc=;
	b=q4Smyt0/d1kKIbj4Ae9yM8ZDYrNO6hX2gGUthIUs21menQdzA0aNGI+9c7wAxDkIXK
	SBmnDSHpE5ge7CJwpX6fRqwJpq8O41WUQC6/XUJ80l17LH1fR4QpJlAG+4cJBFQIyZpJ
	SzOAkwDZjxYDbV24aYuMxkz+zKs4vBlsW2J2WZS24RGnovAwyFSTCh+kCGwksPAOPc4F
	p/OSRCtKbTQlpsWlp7zkPyZ7GGLXNX2zUfvhVOmpvyUEPMsbwnwpTezUErEqH4K2ihEo
	I9g81zPk3qk+wsmSspARtMDr4fqfODDUzrLWJxjL9xzq/tu5YU3mfQxonSten0feoQU3
	JQ8A==
X-Received: by 10.55.26.38 with SMTP id a38mr3778214qka.0.1449101943355;
	Wed, 02 Dec 2015 16:19:03 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:02 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:33 -0500
Message-Id: <1449101933-24928-7-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22e
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-arm] [PATCH v2 06/26] armv7m: fix I and F flag handling
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i2DucsRl6oFn

Despite having the same notation, these bits
have completely different meaning than -AR.

Use armv7m_excp_running_prio() and the highest
pending exception priority to determine
if the pending exception can interrupt preempt.
---
 target-arm/cpu.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 5348028..6e3b251 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -305,19 +305,15 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
     ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
     bool ret = false;
 
-
-    if (interrupt_request & CPU_INTERRUPT_FIQ
-        && !(env->daif & PSTATE_F)) {
-        cs->exception_index = EXCP_FIQ;
-        cc->do_interrupt(cs);
-        ret = true;
-    }
+    /* ARMv7-M interrupt masking works differently than -A or -R.
+     * There is no FIQ/IRQ distinction.
+     * Instead of masking interrupt sources, the I and F bits
+     * (along with basepri) mask certain exception priority levels.
+     */
     if (interrupt_request & CPU_INTERRUPT_HARD
-        && !(env->daif & PSTATE_I)
-            ) {
+            && (armv7m_excp_running_prio(cpu) > cpu->env.v7m.pending_prio)) {
         cs->exception_index = EXCP_IRQ;
         cc->do_interrupt(cs);
         ret = true;
-- 
2.1.4

