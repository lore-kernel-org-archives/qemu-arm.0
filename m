Received: by 10.28.4.212 with SMTP id 203csp724626wme;
        Thu, 19 Apr 2018 07:32:24 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpVr3wuA4XIROcsjPpLBR8sPkmYJ2h5eF9JHArGcothoX3nNXYQ1Cne9leK+TtslnBUPbtt
X-Received: by 10.55.192.8 with SMTP id o8mr6239194qki.252.1524148344143;
        Thu, 19 Apr 2018 07:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524148344; cv=none;
        d=google.com; s=arc-20160816;
        b=p5YQWHdXvw5eiul0d4g0Ym6jZ2ooCCsiZTjJWuDiYpciah6jESaIVfIs6jzKlwAPVM
         1f6Xhz5CpngbRijIAz9X45tYVwDyBz/uqMuBFMQPi81BjS97HNiAZhDBFEN4JuksrQ8S
         2BrwZmfiMrmaFT1gN+9eKjCGWhCH6IJf89avaxmXfDhvsdbnwR2O7UPfSgRlHi96oOdg
         xajWI5c/0xyciVCNXTa0FdpXmoZu11MpiRssDHVpOgpM04GPFuLE8kmJIDIUhZnF9Pf+
         0ViVaT2ZGXuCI4UfU2gmTfNx0qFsFtP1JD2+zdpRNueq9h35fUyuySl/gr5HU5BNhu23
         LgkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=JBzfNwQh+Begl5ObkCIf0k0GmhPYRjYaIZKXrGSfnDA=;
        b=if7tioxePJ3KzINHr+xFeJ/T38JxFSFPuXPJCKpS+Lxkg+Hb5drExSKH7CEsTvC0xI
         Pe2dmZfH8A72g6xUxPXmDyjTDYzUSnFLVPxjufaMwMDcUch3b3P+rRSvD+D8nvg4I7pO
         2JXciUVFNfvWicrtkUKhg3I0hFnUPVu1V9U7V5rKmEtIJWmGQJoJBL/oHScuGSINJ/jJ
         sn5ObZ1qOmQib7gb1YqRAEZ3NNOnYy+g3kqeCRZtOy2yLLGdj1XCvQTSWI6BMBH0ac45
         dLxiE6Th4mJUWiehgejEUtyDDcE5ftYGklUhBk/nUfeTePQH8vIoE2RqJYXDEbMnph2Z
         pN7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p124si1456948qkd.353.2018.04.19.07.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 07:32:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9Abn-00038d-KM
	for alex.bennee@linaro.org; Thu, 19 Apr 2018 10:32:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9AR7-0002XL-Pm
	for qemu-devel@nongnu.org; Thu, 19 Apr 2018 10:21:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f9AR1-0002AX-Rp
	for qemu-devel@nongnu.org; Thu, 19 Apr 2018 10:21:21 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f9AQv-00026j-M7; Thu, 19 Apr 2018 10:21:09 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f9AQt-0003FQ-CG; Thu, 19 Apr 2018 15:21:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 19 Apr 2018 15:21:06 +0100
Message-Id: <20180419142106.9694-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH] target/arm: Use v7m_stack_read() for reading
 the frame signature
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
X-TUID: yQGwrox/6lzS

In commit 95695effe8caa552b8f2 we changed the v7M/v8M stack
pop code to use a new v7m_stack_read() function that checks
whether the read should fail due to an MPU or bus abort.
We missed one call though, the one which reads the signature
word for the callee-saved register part of the frame.

Correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b14fdab140..2ebd086ef2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6913,7 +6913,6 @@ static bool v7m_push_stack(ARMCPU *cpu)
 static void do_v7m_exception_exit(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
-    CPUState *cs = CPU(cpu);
     uint32_t excret;
     uint32_t xpsr;
     bool ufault = false;
@@ -7112,9 +7111,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
             ((excret & R_V7M_EXCRET_ES_MASK) == 0 ||
              (excret & R_V7M_EXCRET_DCRS_MASK) == 0)) {
             uint32_t expected_sig = 0xfefa125b;
-            uint32_t actual_sig = ldl_phys(cs->as, frameptr);
+            uint32_t actual_sig;
 
-            if (expected_sig != actual_sig) {
+            pop_ok = v7m_stack_read(cpu, &actual_sig, frameptr, mmu_idx);
+
+            if (pop_ok && expected_sig != actual_sig) {
                 /* Take a SecureFault on the current stack */
                 env->v7m.sfsr |= R_V7M_SFSR_INVIS_MASK;
                 armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
@@ -7125,7 +7126,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                 return;
             }
 
-            pop_ok =
+            pop_ok = pop_ok &&
                 v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_idx) &&
                 v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_idx) &&
                 v7m_stack_read(cpu, &env->regs[5], frameptr + 0xc, mmu_idx) &&
-- 
2.17.0

