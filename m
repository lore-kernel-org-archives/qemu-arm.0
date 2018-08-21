Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1947059wrd;
        Tue, 21 Aug 2018 06:59:11 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdb0nHH68/nbBrrNxCwW1c/3yIzLmAbN/fIF/SSoih193Mw2NWFS6v7T64ghetyWmNyPFn6c
X-Received: by 2002:ac8:372b:: with SMTP id o40-v6mr18666731qtb.340.1534859950921;
        Tue, 21 Aug 2018 06:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534859950; cv=none;
        d=google.com; s=arc-20160816;
        b=kpB5FqK6pfzirNsEZmR15uOcCEPgH5/z+HCzcLqBQmiaZGK3FUfYQxOQQy4hUYGmH9
         7XvXbBMAzjTuAo/4ojdeDt2K+2r6FVWtS4EVsH/ED5zu3v68SpwoSJ8TBsPXVfur1sGM
         qMh5CdpzYkLnbEbQVWWmq3pVHAAA6XA+buW6+G61KoS77UEAkJUHyuMN2mN6Y6yzGAbe
         JjrWZ/CsMFY5WJIFbUOzzOs8gRIJEIeBLywz2xbd2LGu/dR4W9LQKqqFzyC3C9Wpovvh
         81ENfgRwE9ufppo7hgb6/Ir1ozgi7oplLceRz8V6K5np82b0jY+SuX3EXLt9KFQDSX4k
         3Pvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6ohuFjfTm/dodZ7BP1e9FGOlsv5qZUBFw/E/rAbRysQ=;
        b=N3eVDhiDMjUOieCfPUlKTBSGynvz9xHpvUQskV1LA8P+sz9gwC+g6Q4R9eeK2ssZdC
         XlvgTL7WSSkiiR5vRDT3Dzsct5q29eti9TzqbmMlwBOpMC33pUReEzttGg750gTnh8y+
         nrm6SkCegXAviWwrde9+hWg+4rJgZDkAKBsWeJhjkxqOz6LDbWsb29HbMM2dtLbBFoj0
         w9wKiIJAhtdfgZnJPc9CtDZZceIGvO1i8dN0JG172Bj2yX6q2nYNP8Z37exZYnPii1K7
         rgBrHmR7skor/6jjU2vyQLglTnp0xpFinT+NToe0LyERMSjNAZJUGgVKyooK2Ag7uk47
         qYUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6-v6si2842837qks.3.2018.08.21.06.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 06:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs7Be-00005o-Cb
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 09:59:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6i6-00063A-JS
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 09:28:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fs6i3-0003rw-V3
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 09:28:38 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fs6i3-0003S5-Nb; Tue, 21 Aug 2018 09:28:35 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fs6hj-000492-F9; Tue, 21 Aug 2018 14:28:15 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Aug 2018 14:28:03 +0100
Message-Id: <20180821132811.17675-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821132811.17675-1-peter.maydell@linaro.org>
References: <20180821132811.17675-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/9] hw/intc/arm_gic: Document QEMU interface
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
Cc: Luc Michel <luc.michel@greensocs.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iD1uqcZ40GB5

The GICv2's QEMU interface (sysbus MMIO regions, IRQs,
etc) is now quite complicated with the addition of the
virtualization extensions. Add a comment in the header
file which documents it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I needed to write this out to figure out what I was
connecting to what in the a15mpcore object :-)
---
 include/hw/intc/arm_gic.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
index 42bb535fd45..989bc837606 100644
--- a/include/hw/intc/arm_gic.h
+++ b/include/hw/intc/arm_gic.h
@@ -18,6 +18,41 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+/*
+ * QEMU interface:
+ *  + QOM property "num-cpu": number of CPUs to support
+ *  + QOM property "num-irq": number of IRQs (including both SPIs and PPIs)
+ *  + QOM property "revision": GIC version (1 or 2), or 0 for the 11MPCore GIC
+ *  + QOM property "has-security-extensions": set true if the GIC should
+ *    implement the security extensions
+ *  + QOM property "has-virtualization-extensions": set true if the GIC should
+ *    implement the virtualization extensions
+ *  + unnamed GPIO inputs: (where P is number of PPIs, i.e. num-irq - 32)
+ *    [0..P-1]  SPIs
+ *    [P..P+31] PPIs for CPU 0
+ *    [P+32..P+63] PPIs for CPU 1
+ *    ...
+ *  + sysbus IRQ 0 : IRQ
+ *  + sysbus IRQ 1 : FIQ
+ *  + sysbus IRQ 2 : VIRQ (exists even if virt extensions not present)
+ *  + sysbus IRQ 3 : VFIQ (exists even if virt extensions not present)
+ *  + sysbus IRQ 4 : maintenance IRQ for CPU i/f 0 (only if virt extns present)
+ *  + sysbus IRQ 5 : maintenance IRQ for CPU i/f 1 (only if virt extns present)
+ *    ...
+ *  + sysbus MMIO regions: (in order; numbers will vary depending on
+ *    whether virtualization extensions are present and on number of cores)
+ *    - distributor registers (GICD*)
+ *    - CPU interface for the accessing core (GICC*)
+ *    - virtual interface control registers (GICH*) (only if virt extns present)
+ *    - virtual CPU interface for the accessing core (GICV*) (only if virt)
+ *    - CPU 0 CPU interface registers
+ *    - CPU 1 CPU interface registers
+ *      ...
+ *    - CPU 0 VCPU interface registers (only if virt extns present)
+ *    - CPU 1 VCPU interface registers (only if virt extns present)
+ *      ...
+ */
+
 #ifndef HW_ARM_GIC_H
 #define HW_ARM_GIC_H
 
-- 
2.18.0

