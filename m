Received: by 10.25.227.6 with SMTP id a6csp5464051lfh;
        Fri, 30 Jun 2017 04:10:08 -0700 (PDT)
X-Received: by 10.237.56.169 with SMTP id k38mr26713177qte.201.1498821008572;
        Fri, 30 Jun 2017 04:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498821008; cv=none;
        d=google.com; s=arc-20160816;
        b=enXPeafaOGr/om70HyMFMR8qXNkAVGVziq3Z6+Zbl0hNCjoasOA0z5sC36MvR07zBI
         3d5jp+tnh1RsXFRqDYrTq4lMmrlGorZIBM2cD6IAmn4hlWo8dHP/QWdY2IDkOH1s545h
         4VB83SGbOlR5BSMseRx90zeRfGsPNgFgIB2ITzU6zvMR58UcBIxjOgH+II7mkbc4UHf/
         4R02GI1pzTSMIAzfrPt0qf6DMCKA8skEdu4qMoYuY/N111QXN3BSVSYR31AJGcnyUj1Z
         nGzB3iBWhCPGRaf1B8bntyjwWIDWN/pMPLvojm3C1SHaPpDa53s/e8WpXztJ+CwcTCaX
         csiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=TBn4cnCuwWUdsPkJAfkCA9qJ6zSXm6DYrmfgTOpQyPg=;
        b=zmRPPpPQ0ckfHkhvlVK9Gk8rgKdADQDZhQCGiZt7oMb7TK5P0I0iXooIC2JqQ7Scxl
         R+azP0xNHuobly3ndCbGMlV3Re/cqtTJ7YNhAwdVIeeYPPO6GukKmKnvSEmknRjVUkTJ
         Q2e7fjt+zPsjzwKclNWU7PO8FghKd1fqxWzEUeVxHakIfUgUVDZIoMWbyB/er/AGI1Ac
         PfuvceI/CMRb/M/D8eaYjpIp5dufJZJ7as0O63+YjgFcpot3MWFPh12uePrAIR7b3Iu7
         Ij2/pbik/691Lm9nFwxzKTYag7yV+EgKaqCYTYV3dAoybFZPZT0/PwF6lwEiDQWu/1CH
         8NfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si4474506qte.112.2017.06.30.04.10.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Jun 2017 04:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dQtoL-0004wj-MN
	for alex.bennee@linaro.org; Fri, 30 Jun 2017 07:10:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dQtl4-0001Z4-OF
	for qemu-arm@nongnu.org; Fri, 30 Jun 2017 07:06:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dQtl3-0004Dt-S5
	for qemu-arm@nongnu.org; Fri, 30 Jun 2017 07:06:42 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dQtl3-00040t-LZ; Fri, 30 Jun 2017 07:06:41 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dQtku-0003xT-I1; Fri, 30 Jun 2017 12:06:32 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 30 Jun 2017 12:06:31 +0100
Message-Id: <1498820791-8130-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target-arm: v7M: ignore writes to CONTROL.SPSEL
 from Thread mode
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
X-TUID: HN1SG6Oqkr73

For v7M, writes to the CONTROL register are only permitted for
privileged code. However even if the code is privileged, the
write must not affect the SPSEL bit in the CONTROL register
if the CPU is in Thread mode (as documented in the pseudocode
for the MSR instruction). Implement this, instead of permitting
SPSEL to be written in all cases.

This was causing mbed applications not to run, because the
RTX RTOS they use relies on this behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2594faa..4ed32c5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8768,9 +8768,16 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         }
         break;
     case 20: /* CONTROL */
-        switch_v7m_sp(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
-        env->v7m.control = val & (R_V7M_CONTROL_SPSEL_MASK |
-                                  R_V7M_CONTROL_NPRIV_MASK);
+        /* Writing to the SPSEL bit only has an effect if we are in
+         * thread mode; other bits can be updated by any privileged code.
+         * switch_v7m_sp() deals with updating the SPSEL bit in
+         * env->v7m.control, so we only need update the others.
+         */
+        if (env->v7m.exception == 0) {
+            switch_v7m_sp(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
+        }
+        env->v7m.control &= ~R_V7M_CONTROL_NPRIV_MASK;
+        env->v7m.control |= val & R_V7M_CONTROL_NPRIV_MASK;
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "Attempt to write unknown special"
-- 
2.7.4

