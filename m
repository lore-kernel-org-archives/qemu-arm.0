Received: by 10.223.188.70 with SMTP id a6csp5102031wrh;
        Tue, 22 Aug 2017 08:43:07 -0700 (PDT)
X-Received: by 10.200.47.162 with SMTP id l31mr1590465qta.185.1503416587674;
        Tue, 22 Aug 2017 08:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416587; cv=none;
        d=google.com; s=arc-20160816;
        b=nAH9llQVwwXx2dGHVkyXKUapZRs4+M6PmLXl/PeAEvfflSRB4cIPVmjSXkuN6Ai4XP
         Ctad0zuDIz0dgTOvo88kIV2wkmrW1PBM3NO1ihBKCuiqJz1fI4aYstF4vqNrZ7xl9RVj
         yQ28YeCCTW4trVnJfTRw7iKZUhShMo5mlAPd5uyulp4mGcjqlrx8Gbbhpl5U7YrF/Oh8
         7w5J+V3BBqCfQl7AesDbVjoc9U3yuxWNHYBHxrlfjzDm0zn02/f34R1dN9zCCfanEAXv
         IkjsAHKU7jgjNl8iKTPoxUUdeWqfo3e5C4GOpG97USKbZKB2bTsfFs5jvGlDUPnUNQI0
         g3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=hz4KQZwOGryrU5tGLJV4YLT8MuGG1TLM1gG7oVsvXiY=;
        b=LZOHjFRd4f5l6ZaAYS4ggyB9vnRR1W9THe7LXjEgZYHzExHpxuLQ1OF7yi5hQmTfRi
         D7s00N6FYwYZPN6hhy2zbqD0E/1yoK7WdyjFZk+NerTB/GD7nqh0FdwS537t6aJCucmC
         AYJPST1vFgyJ9gtnAxCw91cK9tjwAbkHjktEaxtCHrqcMLpIjEGY1QqNtzxLTV4CUN6c
         GDv1MgFCMHGnDFCwLJSPSmRkO6xBK/LYGG29SmdEEn1Kn3TSKdI6JyBF1msvhQXXoJ0h
         wjBrLVPmMmNbl+161c4ZpLZ8FJ9vIRUJBdY1206R+yJb0GmCr0RJL4WRvkUqOZkv3Xcp
         Pimw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i53si13399272qti.453.2017.08.22.08.43.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBKb-00043b-79
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:43:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAni-0006JQ-4b
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAng-000371-Vk
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:06 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAng-00031e-Nf; Tue, 22 Aug 2017 11:09:04 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnZ-0004dW-5g; Tue, 22 Aug 2017 16:08:57 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:39 +0100
Message-Id: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 00/20] first steps towards v8M support
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
X-TUID: ZIkFcVnIwU9w

Hi; this patchset is the first slice of work aiming at support
of the ARM v8M architecture. It doesn't do anything by itself
(there's no CPU yet that enables the new feature) and there's
a lot more work still to do to get something actually functional,
but it seems better to push the work out for review a slice
at a time rather than hanging onto it and sending a 100-patch
set at the end.

This patchset sits on top of my target-arm.next tree, which
has the 'preliminary patchset' I sent out a while back in it.

It includes:
 * implementation of PMSAv8
 * banking of most of the main CPU registers which need it
   (the NVIC proper also gets banked exceptions, and the
   systick device is banked, but neither of those are done here)
 * the "let secure access the NS view of the NVIC" alias region
 * an implementation of the BXNS instruction, mostly as the
   simplest thing that needs the banking of stack pointers

We don't yet actually properly swap the stack pointer around
on other kinds of S<->NS transition including exception
entry and exit. I have some patches working in that direction,
so if the BXNS patch doesn't have enough context yet to make
sense I can keep it around and resend it with those later.

Next thing probably will be the NVIC changes, once I've
got my head around the priority related changes v8M brings...

Series available also at 
https://git.linaro.org/people/peter.maydell/qemu-arm.git v8m
(on top of the target-arm.next stuff.)

thanks
-- PMM

Peter Maydell (20):
  target/arm: Implement ARMv8M's PMSAv8 registers
  target/arm: Implement new PMSAv8 behaviour
  target/arm: Add state field, feature bit and migration for v8M secure
    state
  target/arm: Register second AddressSpace for secure v8M CPUs
  target/arm: Add MMU indexes for secure v8M
  target/arm: Make BASEPRI register banked for v8M
  target/arm: Make PRIMASK register banked for v8M
  target/arm: Make FAULTMASK register banked for v8M
  target/arm: Make CONTROL register banked for v8M
  nvic: Add NS alias SCS region
  target/arm: Make VTOR register banked for v8M
  target/arm: Make MPU_MAIR0, MPU_MAIR1 registers banked for v8M
  target/arm: Make MPU_RBAR, MPU_RLAR banked for v8M
  target/arm: Make MPU_RNR register banked for v8M
  target/arm: Make MPU_CTRL register banked for v8M
  target/arm: Make CCR register banked for v8M
  target/arm: Make MMFAR banked for v8M
  target/arm: Make CFSR register banked for v8M
  target/arm: Move regime_is_secure() to target/arm/internals.h
  target/arm: Implement BXNS, and banked stack pointers

 include/hw/intc/armv7m_nvic.h |   1 +
 target/arm/cpu.h              | 100 ++++++++++++--
 target/arm/helper.h           |   2 +
 target/arm/internals.h        |  26 ++++
 target/arm/translate.h        |   1 +
 hw/intc/armv7m_nvic.c         | 294 +++++++++++++++++++++++++++++++++------
 target/arm/cpu.c              |  82 ++++++++---
 target/arm/helper.c           | 315 +++++++++++++++++++++++++++++++++---------
 target/arm/machine.c          | 104 ++++++++++++--
 target/arm/translate.c        |  52 ++++++-
 10 files changed, 820 insertions(+), 157 deletions(-)

-- 
2.7.4

