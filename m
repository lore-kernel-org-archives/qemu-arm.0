Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1012375wrd;
        Thu, 23 Aug 2018 03:38:41 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZrz0LTi9MgI7SxwHaVqHzfccDEw0GsqjWAllSHErCnpzdxTDQCCiQMYg5e//r7WrPQW6Jc
X-Received: by 2002:a0c:937b:: with SMTP id e56-v6mr22716934qve.4.1535020721806;
        Thu, 23 Aug 2018 03:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535020721; cv=none;
        d=google.com; s=arc-20160816;
        b=IAoua3SMPh8hBXKgNgeNr0HlL4Cln5V8xC76FXzD7dD7BSUEL+AQEl0WfD7AVW55L6
         2mRGDmRqjJB/Nwmv6zp4ADoOwLXO+Fo598ivI5UDrR7uxPDLgAp0Z+4upk2YlZjK7LeN
         phZp4ZmsbYXaVM98+BbFm/l0BH8ho1ypv7wJM/BcHO6suGjBq8jejQlNl1XaArcct9s9
         1M/L4E65WYWbC+xDu9Ulvnqtb1GH9ZdV8Xz/1Di5DnFPq3IIHXN06yUuey0yG8Q8ikNi
         D0csITRH0NXMLKW6QZ0UMa9ibbw4eGTeggt0/0IlLIAYNXKW3twV9ZC1slDSdVvcrESq
         /RIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=wixKQvC2lp2HlUF4xdo3i6RrbwajEPE/Vnw2+4TWv9Y=;
        b=raV+90iuRnPMMYo7fL6SvVqXKKjFN/NsW4UZ2ZFryvN+Da4kPI8O6PQTJDkdaxMH3r
         Y4O2V5ubnbTIG1D6Wlryz4uLGDKl1aBwgm6caQflMRYnUaCp1Oe6p0T2ZGJO2tAcotHc
         4JyyVIv7TC3MjybCR+oBReK0fmt/Cmzo7TjvNrGaSLpg6jbGfNplE0lUP9nrMEZHPrla
         RQS7/hUpqwph2bR4/bkpSLGlYdrYMF2rrm77qDZLTcJNQ710W83OWOJa9g/SjkJN/TLL
         AJmY/lOksQ8gPk7yIu4LQ3P9dYpc5foH0pisPx0IWD2DlqfB3sGPs8ZF+bCREEKKUo2E
         zaUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o9-v6si3902180qvn.224.2018.08.23.03.38.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 03:38:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsn0j-0001Ih-A9
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 06:38:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fsn0Z-0001HH-Bx
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 06:38:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fsn0Y-0000x0-E5
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 06:38:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44828)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fsn0Y-0000uQ-50; Thu, 23 Aug 2018 06:38:30 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fsn0Q-0005iz-1J; Thu, 23 Aug 2018 11:38:22 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 23 Aug 2018 11:38:18 +0100
Message-Id: <20180823103818.31189-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2] hw/intc/arm_gic: Document QEMU interface
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
X-TUID: FgIauhltWoti

The GICv2's QEMU interface (sysbus MMIO regions, IRQs,
etc) is now quite complicated with the addition of the
virtualization extensions. Add a comment in the header
file which documents it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I needed to write this out to figure out what I was
connecting to what in the a15mpcore object :-)

v1->v2 changes: fixed errors in sysbus IRQ and per-cpu GICH
memory region docs pointed out by Luc.

 include/hw/intc/arm_gic.h | 43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
index 42bb535fd45..1af5051ed5d 100644
--- a/include/hw/intc/arm_gic.h
+++ b/include/hw/intc/arm_gic.h
@@ -18,6 +18,49 @@
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
+ *  + sysbus IRQs: (in order; number will vary depending on number of cores)
+ *    - IRQ for CPU 0
+ *    - IRQ for CPU 1
+ *      ...
+ *    - FIQ for CPU 0
+ *    - FIQ for CPU 1
+ *      ...
+ *    - VIRQ for CPU 0 (exists even if virt extensions not present)
+ *    - VIRQ for CPU 1 (exists even if virt extensions not present)
+ *      ...
+ *    - VFIQ for CPU 0 (exists even if virt extensions not present)
+ *    - VFIQ for CPU 1 (exists even if virt extensions not present)
+ *      ...
+ *    - maintenance IRQ for CPU i/f 0 (only if virt extensions present)
+ *    - maintenance IRQ for CPU i/f 1 (only if virt extensions present)
+ *  + sysbus MMIO regions: (in order; numbers will vary depending on
+ *    whether virtualization extensions are present and on number of cores)
+ *    - distributor registers (GICD*)
+ *    - CPU interface for the accessing core (GICC*)
+ *    - virtual interface control registers (GICH*) (only if virt extns present)
+ *    - virtual CPU interface for the accessing core (GICV*) (only if virt)
+ *    - CPU 0 CPU interface registers
+ *    - CPU 1 CPU interface registers
+ *      ...
+ *    - CPU 0 virtual interface control registers (only if virt extns present)
+ *    - CPU 1 virtual interface control registers (only if virt extns present)
+ *      ...
+ */
+
 #ifndef HW_ARM_GIC_H
 #define HW_ARM_GIC_H
 
-- 
2.18.0

