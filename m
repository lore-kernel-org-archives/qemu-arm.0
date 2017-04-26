Received: by 10.25.0.144 with SMTP id 138csp389786lfa;
        Wed, 26 Apr 2017 10:13:29 -0700 (PDT)
X-Received: by 10.237.62.243 with SMTP id o48mr826868qtf.89.1493226809378;
        Wed, 26 Apr 2017 10:13:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k76si846249qke.86.2017.04.26.10.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Apr 2017 10:13:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3QVM-00025x-Pt
	for alex.bennee@linaro.org; Wed, 26 Apr 2017 13:13:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1d3QVI-00025J-H7
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 13:13:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1d3QVH-0000L8-Mo
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 13:13:24 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36968)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1d3QVH-0000JT-G2; Wed, 26 Apr 2017 13:13:23 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d3QV8-0004fj-7O; Wed, 26 Apr 2017 18:13:14 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 26 Apr 2017 18:13:10 +0100
Message-Id: <1493226792-3237-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493226792-3237-1-git-send-email-peter.maydell@linaro.org>
References: <1493226792-3237-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/3] hw/intc/arm_gicv3_cpuif: Fix reset value for
 VMCR_EL2.VBPR1
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
X-TUID: I7GgBBryJBhG

We were setting the VBPR1 field of VMCR_EL2 to icv_min_vbpr()
on reset, but this is not correct. The field should reset to
the minimum value of ICV_BPR0_EL1 plus one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 0b20856..d31eba0 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2014,7 +2014,7 @@ static void icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     cs->ich_hcr_el2 = 0;
     memset(cs->ich_lr_el2, 0, sizeof(cs->ich_lr_el2));
     cs->ich_vmcr_el2 = ICH_VMCR_EL2_VFIQEN |
-        (icv_min_vbpr(cs) << ICH_VMCR_EL2_VBPR1_SHIFT) |
+        ((icv_min_vbpr(cs) + 1) << ICH_VMCR_EL2_VBPR1_SHIFT) |
         (icv_min_vbpr(cs) << ICH_VMCR_EL2_VBPR0_SHIFT);
 }
 
-- 
2.7.4

