Received: by 10.223.172.38 with SMTP id v35csp3214849wrc;
        Fri, 22 Sep 2017 08:05:16 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAZEm7IlHL8yxMKRpZ3wNedqHnLsbm4TABuyhPAt79Kico7l8JrpKIBCxmmu54vHUCzDiy4
X-Received: by 10.200.22.231 with SMTP id y36mr8854899qtk.31.1506092716675;
        Fri, 22 Sep 2017 08:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092716; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1c0i3hLDps/GbDQvp3RKpnF+ouEZ3jsbVYwqUK5cOU+4L7Ttm0kPUNKF2MTt580VP
         Xmi6XKNfOwEoFLddYgrvuYmcBeXTb7Cww56jbBBJL+bffi1F4/+Xgb9s0gx5emtd8GDn
         fvhIRq02B5dHU04ZRrwkIIWSEadT/TMvvF0I0CTi+nIEi/mEkubbeF/oaSBKx952t1xy
         Mg5cH99aLAlb4DZJW8mUW8NYWf8roDzbEbb8ddIbCWUrlnn8pGlzwgPXFml09bLt9Ua/
         VB0NmXSQsFszK/WoUP6ujXjJilDTVl9F6duSs2MKo2ldkhn92Q2q/EfY/ZLPdCxifR+j
         qpsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Fsh4oIJ3B3CaidDWd4z+MOGxN18AGoi0ep7C3Z8eiWY=;
        b=DJBX+o07DvPR8/ObD1uBBJ8p1i4yoIC5Wznf1d4o8EXyTzHTnHaaYptb6aqaZtdK8e
         YgigUSGPhqKq2Mpi+X7pEOgoKXFJPTzAytHJzdZuxP4hjC+42NpLjFF/YFSKXiHbzGT1
         scOZ/MJxcuM78Fx35mzmNixOlkwKkPDQm7PjKNwMLWU8BaYjGXpXO/Lg0pwp15ou9WTr
         X5Mdv6Jt2nzkLf++9VSxCLKVQi4+k6js5aKfIdRgLUYmvncw5R8YKf/LmAdHMvpeZXwB
         VTL03BCC6M01ew3afcEvXd6UmbSR1hvb3bUv89QeBa+rO3QZ4chbIDSAgLIZP0wC6sYC
         wBPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t68si31629qkh.102.2017.09.22.08.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPVw-0003iP-2j
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:05:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQd-00081n-38
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 10:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQc-0004CT-4Q
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 10:59:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQZ-00043B-Bp; Fri, 22 Sep 2017 10:59:39 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQX-0007Cf-AG; Fri, 22 Sep 2017 15:59:37 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:58 +0100
Message-Id: <1506092407-26985-12-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 11/20] target/arm: Add support for restoring
 v8M additional state context
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
X-TUID: uBla37IaVeJN

For v8M, exceptions from Secure to Non-Secure state will save
callee-saved registers to the exception frame as well as the
caller-saved registers. Add support for unstacking these
registers in exception exit when necessary.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index da3a36e..25f5675 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6453,6 +6453,36 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                           "for destination state is UNPREDICTABLE\n");
         }
 
+        /* Do we need to pop callee-saved registers? */
+        if (return_to_secure &&
+            ((excret & R_V7M_EXCRET_ES_MASK) == 0 ||
+             (excret & R_V7M_EXCRET_DCRS_MASK) == 0)) {
+            uint32_t expected_sig = 0xfefa125b;
+            uint32_t actual_sig = ldl_phys(cs->as, frameptr);
+
+            if (expected_sig != actual_sig) {
+                /* Take a SecureFault on the current stack */
+                env->v7m.sfsr |= R_V7M_SFSR_INVIS_MASK;
+                armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+                v7m_exception_taken(cpu, excret);
+                qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
+                              "stackframe: failed exception return integrity "
+                              "signature check\n");
+                return;
+            }
+
+            env->regs[4] = ldl_phys(cs->as, frameptr + 0x8);
+            env->regs[5] = ldl_phys(cs->as, frameptr + 0xc);
+            env->regs[6] = ldl_phys(cs->as, frameptr + 0x10);
+            env->regs[7] = ldl_phys(cs->as, frameptr + 0x14);
+            env->regs[8] = ldl_phys(cs->as, frameptr + 0x18);
+            env->regs[9] = ldl_phys(cs->as, frameptr + 0x1c);
+            env->regs[10] = ldl_phys(cs->as, frameptr + 0x20);
+            env->regs[11] = ldl_phys(cs->as, frameptr + 0x24);
+
+            frameptr += 0x28;
+        }
+
         /* Pop registers. TODO: make these accesses use the correct
          * attributes and address space (S/NS, priv/unpriv) and handle
          * memory transaction failures.
-- 
2.7.4

