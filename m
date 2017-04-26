Received: by 10.25.0.144 with SMTP id 138csp390471lfa;
        Wed, 26 Apr 2017 10:15:09 -0700 (PDT)
X-Received: by 10.200.51.183 with SMTP id c52mr890032qtb.252.1493226909848;
        Wed, 26 Apr 2017 10:15:09 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38si837773qtw.335.2017.04.26.10.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Apr 2017 10:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3QWz-00035d-7e
	for alex.bennee@linaro.org; Wed, 26 Apr 2017 13:15:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1d3QVU-0002Ee-VL
	for qemu-devel@nongnu.org; Wed, 26 Apr 2017 13:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1d3QVP-0000QI-Dk
	for qemu-devel@nongnu.org; Wed, 26 Apr 2017 13:13:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36968)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1d3QVI-0000JT-BB; Wed, 26 Apr 2017 13:13:24 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d3QV8-0004fu-M4; Wed, 26 Apr 2017 18:13:14 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 26 Apr 2017 18:13:11 +0100
Message-Id: <1493226792-3237-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493226792-3237-1-git-send-email-peter.maydell@linaro.org>
References: <1493226792-3237-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 2/3] hw/intc/arm_gicv3_cpuif: Don't let BPR be
 set below its minimum
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
X-TUID: b3c/dpLdZnPb

icc_bpr_write() was not enforcing that writing a value below the
minimum for the BPR should behave as if the BPR was set to the
minimum value. This doesn't make a difference for the secure
BPRs (since we define the minimum for the QEMU implementation
as zero) but did mean we were allowing the NS BPR1 to be set to
0 when 1 should be the lowest value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index d31eba0..e660b3f 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1388,6 +1388,7 @@ static void icc_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     GICv3CPUState *cs = icc_cs_from_env(env);
     int grp = (ri->crm == 8) ? GICV3_G0 : GICV3_G1;
+    uint64_t minval;
 
     if (icv_access(env, grp == GICV3_G0 ? HCR_FMO : HCR_IMO)) {
         icv_bpr_write(env, ri, value);
@@ -1415,6 +1416,11 @@ static void icc_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
+    minval = (grp == GICV3_G1NS) ? GIC_MIN_BPR_NS : GIC_MIN_BPR;
+    if (value < minval) {
+        value = minval;
+    }
+
     cs->icc_bpr[grp] = value & 7;
     gicv3_cpuif_update(cs);
 }
-- 
2.7.4

