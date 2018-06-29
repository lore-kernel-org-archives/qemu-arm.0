Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp729917wrq;
        Fri, 29 Jun 2018 06:31:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf2dmEqDjVH1HuoexFBQJ3yGRJXfm3Mb8Tn2ipQ/BimRzbCQr1wWR42GUXyrw9ey3x5PBtw
X-Received: by 2002:a37:a18d:: with SMTP id k135-v6mr12219025qke.203.1530279070980;
        Fri, 29 Jun 2018 06:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279070; cv=none;
        d=google.com; s=arc-20160816;
        b=mmqKWJbsMYo3+Oe5tF7V2dPOpzieZ7B+wGXpu+G9dx+eheeX8cCpMq0aNr+c7PJKno
         05LkLjL9+5Nth4g/wQQOWODtKjEd2DiYUE95I5EnGQ2F1OTsPRAMtHQ46icTlxmmYsFS
         CGuQOpegjReawSyl5Pm80odYu/LLr5uep0Wy2WK79L7T3foQiVdlZ/iGIZf+OR6AJFDa
         oV86IgX+Vwg/XJyQLQ//61+11nOh65kKzgkr9gpc+g4RQU7kRJpDs19uLcA9nCa3AlNl
         ove8RBF0IfBVFbqOlGb/OLGzP6tPvC2gpRyIXcYYJD846CJP5PXGTH/UrhrFE2FnyVox
         +tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=J4S8VBoZTmkwZTxIUv6aI3AKurIKF5xqtmggnoCyW2c=;
        b=Y+GqGmrWXlcJgfu2hA8V+6AlRVXDdHzhnYIx2elXuZffQpwrxZRXiiJWnvJLzRPZoN
         mmc4y8mNVoeVLvN+0eXfPrulU5Nz/GBm1FS88+gc5FASW751xXZZGYXt+0nnZ/SPvozb
         J4tzc+6kuouRzISIPQShVY3V/1yIydXvUklPwsyl3fk4zgaQYT/0Dmw5q9nx3TzAbxsk
         0yksT44sMGU2QuSXFWOJkvOEoRXRXVwMAw87AvDq/e/839a7IS7xlEdphpGZKceNQvQA
         V9vUO4veVSDSmUi2oanBcrd5zAfkaBND5GOO3oCXDCYIWYaXUnsq7FyOK8LBwZx7yHn9
         P9wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=NWCFB+dN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gZq1tTf1;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="EsO7C5/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f19-v6si1770852qka.95.2018.06.29.06.31.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=NWCFB+dN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gZq1tTf1;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="EsO7C5/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtUS-0007dp-St
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU6-0007a0-Vh
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006qB-0K
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:46 -0400
Received: from greensocs.com ([193.104.36.180]:58612)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU2-0006mH-AL; Fri, 29 Jun 2018 09:30:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id B5AE54434AC;
	Fri, 29 Jun 2018 15:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279035;
	bh=lurj2e4wV6LuI+8vErq60c/A/ecbAFkgK/dicIkSym0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NWCFB+dNwfRV/pYNrYv+ZlEjTUu5hV2lfeD7VrjuYQ+JfEubKstiAhQa/zfioyN8A
	AtsgulVBmprBjX3ERhPmm9qrquPdUbT7L0aUd/9Qy/rCQH/1ivmLeA3vDfAWdUVOe1
	8Vg/yoZ3q0a86RW2ymrycfY55ykjNgi7q8JekOOo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=gZq1tTf1;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=EsO7C5/e
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IX5m6zXitNLc; Fri, 29 Jun 2018 15:30:34 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 2B44C4434AB; Fri, 29 Jun 2018 15:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279034;
	bh=lurj2e4wV6LuI+8vErq60c/A/ecbAFkgK/dicIkSym0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gZq1tTf1Fe75toknv/5+JgiHn/nnJy03F1OFzWi//b72dmuzeeAwehsNfO9ZhMvn8
	5AvNoEMS6aR6LBPfA7V2qBzJX79UBDSlOjcDJpWC0EUvB+jvd6vmRZUhWuTOuTP7wW
	kHDsJeF5tMGAkEO61cmzkxQInRXsyIAS2zFWsB3I=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4D4A44434B2;
	Fri, 29 Jun 2018 15:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279033;
	bh=lurj2e4wV6LuI+8vErq60c/A/ecbAFkgK/dicIkSym0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EsO7C5/eXl03uhpK7sTkclS7GKNJWdTtsWabl925Ws12j7RnhyaA+zBwusgdQebW6
	vyk7/yySGPZvjQnNlvW6Lf41iwCcoDjDEWQkJL1nfx/mwebLsn5oWJbWdce+3sY4Ha
	7BVQrVX6oE0YFNGKrVpeiu6Lbzx4SpsezA3Z3tfQ=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:40 +0200
Message-Id: <20180629132954.24269-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 06/20] intc/arm_gic: Add virtual interface
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
X-TUID: IFZp7k2e4obi

Add the register definitions for the virtual interface of the GICv2.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
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
2.17.1

