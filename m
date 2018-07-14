Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp649429wrq;
        Sat, 14 Jul 2018 10:16:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdC/STzJHnYFPhnM1dbtNRTIgwjV2fuwYyiC9uMbyXUxWZihRPeiAJwVV5hgWoJmR+UY6BX
X-Received: by 2002:ac8:3579:: with SMTP id z54-v6mr9355028qtb.161.1531588606736;
        Sat, 14 Jul 2018 10:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588606; cv=none;
        d=google.com; s=arc-20160816;
        b=xtt8atJnziYDsKTwg2lhGeDjhA9KguUSfLmKYyZFNxm+9SBCxgN/iUCdRq1zdcM1ko
         iP7hcODfDeo/FW8hekTLaCl+xwiEPvRAGs4jf1q4HgHK4COhpCTDrx9cO2zZFHGnMkTn
         Al6yLjZ5+k2L14VVfGBclLY+eKELJHSKwcwmytNruIq03zwqOtQV6nnWHRsOZoUuKKnH
         q4XCkLVWjiLabKuEIdSS1NgTa0ZMGKraGHM66sX42t2g6jBZAHorB30LMBqaoBv+8XkZ
         Gyk1zrNJAJDbd8IrzVF9DpG2TM0akgtrwG4Ez+/xY5JOWT6AjT/RXjg1MQ5mFpGI0kc1
         g59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=w+0bu3l7Ik8OHKbAhpB0DQmwnZtaTWinFusElivFEpM=;
        b=k2fgMmMxa19LWaLExu3CU/xGF7xsa/ejqgkSIx+c9BB6T7sWtAPRNs6DP7KUmBqPnh
         rDbnZn/kjJ6E6xoy3Lp+DOcGEqWWZ4fAd9EGqMaAQ7tWlfOexNXg32J7LC8J9Uz5ApKz
         Miks+cXpgW49/UlYMpy7JmSrx2unEMRSzkdqx9a51QJKeLlrr6J0NPE+yzqJh80/6zQz
         KNQF9ZOhpiKEGRuiIGrfKhjb3MR/1TIcixc+HIP00N6+dLUOM2ntpSrLRYEhZAUuLDmc
         IdOkl5sLX3RlGW+C9htXBXwceWwaQotxRURS6c4ewvivU0vY8MnNtxn6UZ3qLh+sej6M
         4YjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="u/QAJT2E";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=disQtvfK;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=disQtvfK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q12-v6si5426944qtn.388.2018.07.14.10.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="u/QAJT2E";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=disQtvfK;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=disQtvfK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOA2-0005kd-4f
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:16:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9m-0005k2-8P
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9j-0004RK-Ne
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:30 -0400
Received: from greensocs.com ([193.104.36.180]:57311)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9j-0004QI-Du; Sat, 14 Jul 2018 13:16:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 3AC45C7AFF;
	Sat, 14 Jul 2018 19:16:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588582;
	bh=LGnVqOQ1ydGryJv7quPh10kFCdk81AGnaVJGiNWVrAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=u/QAJT2Erni/BAEcMldG4dkHGRKCtaooPNAc5cwOmqKxQyi3CLPUxcqCBqG199IlT
	jENUQNaByED3A79S+iMVhIoKEPMWwL5/7YxD3GVylaX9DaB5N88ARfOTNCqW13JZai
	1ZwJkdmTb5jKyzZz36mRQvb3417nVf6z0Kap8xVw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=disQtvfK;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=disQtvfK
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 81UODOVOf1P5; Sat, 14 Jul 2018 19:16:21 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id EE6A8C7AF4; Sat, 14 Jul 2018 19:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588580;
	bh=LGnVqOQ1ydGryJv7quPh10kFCdk81AGnaVJGiNWVrAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=disQtvfKn66Q7rIX+PEaRkjWpA/MOo7jdZZ+ukTTK600kk82vIt5+QVFkZvjpIYqe
	XWHrWLQ/ufYz7G+apm81OyLat1Vpv6JI2d/9ZSXfPqvwH2cc2jJ3MbvL2WDWwkjKaf
	GGT1zGvLGevfG2roPh4WR0wUO/XEIAXiNzvWtVmo=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6CC8EC7ADD;
	Sat, 14 Jul 2018 19:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588580;
	bh=LGnVqOQ1ydGryJv7quPh10kFCdk81AGnaVJGiNWVrAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=disQtvfKn66Q7rIX+PEaRkjWpA/MOo7jdZZ+ukTTK600kk82vIt5+QVFkZvjpIYqe
	XWHrWLQ/ufYz7G+apm81OyLat1Vpv6JI2d/9ZSXfPqvwH2cc2jJ3MbvL2WDWwkjKaf
	GGT1zGvLGevfG2roPh4WR0wUO/XEIAXiNzvWtVmo=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:47 +0200
Message-Id: <20180714171601.5734-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 06/20] intc/arm_gic: Add virtual interface
 register definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WWxMJY8PdqSm

Add the register definitions for the virtual interface of the GICv2.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gic_internal.h | 65 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index c85427c8e3..1aa888a576 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -21,6 +21,7 @@
 #ifndef QEMU_ARM_GIC_INTERNAL_H
 #define QEMU_ARM_GIC_INTERNAL_H
 
+#include "hw/registerfields.h"
 #include "hw/intc/arm_gic.h"
 
 #define ALL_CPU_MASK ((unsigned)(((1 << GIC_NCPU) - 1)))
@@ -64,6 +65,70 @@
 #define GICC_CTLR_EOIMODE    (1U << 9)
 #define GICC_CTLR_EOIMODE_NS (1U << 10)
 
+REG32(GICH_HCR, 0x0)
+    FIELD(GICH_HCR, EN, 0, 1)
+    FIELD(GICH_HCR, UIE, 1, 1)
+    FIELD(GICH_HCR, LRENPIE, 2, 1)
+    FIELD(GICH_HCR, NPIE, 3, 1)
+    FIELD(GICH_HCR, VGRP0EIE, 4, 1)
+    FIELD(GICH_HCR, VGRP0DIE, 5, 1)
+    FIELD(GICH_HCR, VGRP1EIE, 6, 1)
+    FIELD(GICH_HCR, VGRP1DIE, 7, 1)
+    FIELD(GICH_HCR, EOICount, 27, 5)
+
+#define GICH_HCR_MASK \
+    (R_GICH_HCR_EN_MASK | R_GICH_HCR_UIE_MASK | \
+     R_GICH_HCR_LRENPIE_MASK | R_GICH_HCR_NPIE_MASK | \
+     R_GICH_HCR_VGRP0EIE_MASK | R_GICH_HCR_VGRP0DIE_MASK | \
+     R_GICH_HCR_VGRP1EIE_MASK | R_GICH_HCR_VGRP1DIE_MASK | \
+     R_GICH_HCR_EOICount_MASK)
+
+REG32(GICH_VTR, 0x4)
+    FIELD(GICH_VTR, ListRegs, 0, 6)
+    FIELD(GICH_VTR, PREbits, 26, 3)
+    FIELD(GICH_VTR, PRIbits, 29, 3)
+
+REG32(GICH_VMCR, 0x8)
+    FIELD(GICH_VMCR, VMCCtlr, 0, 10)
+    FIELD(GICH_VMCR, VMABP, 18, 3)
+    FIELD(GICH_VMCR, VMBP, 21, 3)
+    FIELD(GICH_VMCR, VMPriMask, 27, 5)
+
+REG32(GICH_MISR, 0x10)
+    FIELD(GICH_MISR, EOI, 0, 1)
+    FIELD(GICH_MISR, U, 1, 1)
+    FIELD(GICH_MISR, LRENP, 2, 1)
+    FIELD(GICH_MISR, NP, 3, 1)
+    FIELD(GICH_MISR, VGrp0E, 4, 1)
+    FIELD(GICH_MISR, VGrp0D, 5, 1)
+    FIELD(GICH_MISR, VGrp1E, 6, 1)
+    FIELD(GICH_MISR, VGrp1D, 7, 1)
+
+REG32(GICH_EISR0, 0x20)
+REG32(GICH_EISR1, 0x24)
+REG32(GICH_ELRSR0, 0x30)
+REG32(GICH_ELRSR1, 0x34)
+REG32(GICH_APR, 0xf0)
+
+REG32(GICH_LR0, 0x100)
+    FIELD(GICH_LR0, VirtualID, 0, 10)
+    FIELD(GICH_LR0, PhysicalID, 10, 10)
+    FIELD(GICH_LR0, CPUID, 10, 3)
+    FIELD(GICH_LR0, EOI, 19, 1)
+    FIELD(GICH_LR0, Priority, 23, 5)
+    FIELD(GICH_LR0, State, 28, 2)
+    FIELD(GICH_LR0, Grp1, 30, 1)
+    FIELD(GICH_LR0, HW, 31, 1)
+
+/* Last LR register */
+REG32(GICH_LR63, 0x1fc)
+
+#define GICH_LR_MASK \
+    (R_GICH_LR0_VirtualID_MASK | R_GICH_LR0_PhysicalID_MASK | \
+     R_GICH_LR0_CPUID_MASK | R_GICH_LR0_EOI_MASK | \
+     R_GICH_LR0_Priority_MASK | R_GICH_LR0_State_MASK | \
+     R_GICH_LR0_Grp1_MASK | R_GICH_LR0_HW_MASK)
+
 /* Valid bits for GICC_CTLR for GICv1, v1 with security extensions,
  * GICv2 and GICv2 with security extensions:
  */
-- 
2.18.0

