Received: by 10.80.166.35 with SMTP id d32csp85681edc;
        Tue, 11 Oct 2016 09:32:25 -0700 (PDT)
X-Received: by 10.55.17.74 with SMTP id b71mr4893129qkh.93.1476203545021;
        Tue, 11 Oct 2016 09:32:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 98si753595qtc.118.2016.10.11.09.32.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 09:32:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1btzya-0003NU-G1
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 12:32:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1btzyU-0003N6-0n
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 12:32:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cov@codeaurora.org>) id 1btzyO-0007AA-20
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 12:32:16 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cov@codeaurora.org>)
	id 1btzyN-00079C-Q9; Tue, 11 Oct 2016 12:32:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id EB7F461822; Tue, 11 Oct 2016 16:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1476203529;
	bh=2GdA/z2TxRD6+WDFYFyF95HXl/Kuu+JHO8yQfE1rE9E=;
	h=From:To:Cc:Subject:Date:From;
	b=U//fFPRUECotuIOlfuk4U/c6lewrxmt2f7+4cd8CRkVom0RGVK+8mU/tmt3PzA/Ir
	tckBTbVOFT7eNxEbmXjbHvlDc9Y0L/Zh9wEJEqMVGSb/TeNZCJeL0MtDgHpBM7c7wJ
	q3MiwPtVlQWCFnAR8WM7N244NIB6fPBObdAAEge0=
Received: from rtp-lab-has1.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: cov@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B497F61787;
	Tue, 11 Oct 2016 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1476203529;
	bh=2GdA/z2TxRD6+WDFYFyF95HXl/Kuu+JHO8yQfE1rE9E=;
	h=From:To:Cc:Subject:Date:From;
	b=U//fFPRUECotuIOlfuk4U/c6lewrxmt2f7+4cd8CRkVom0RGVK+8mU/tmt3PzA/Ir
	tckBTbVOFT7eNxEbmXjbHvlDc9Y0L/Zh9wEJEqMVGSb/TeNZCJeL0MtDgHpBM7c7wJ
	q3MiwPtVlQWCFnAR8WM7N244NIB6fPBObdAAEge0=
DMARC-Filter: OpenDMARC Filter v1.3.1 smtp.codeaurora.org B497F61787
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=pass smtp.mailfrom=cov@codeaurora.org
From: Christopher Covington <cov@codeaurora.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Oct 2016 12:32:02 -0400
Message-Id: <20161011163202.19720-1-cov@codeaurora.org>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH] hw/intc/arm_gic_kvm: Fix build on aarch64
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
Cc: Andrew Jones <drjones@redhat.com>,
	Christopher Covington <cov@codeaurora.org>,
	Shanker Donthineni <shankerd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F2MV1HOZuMus

Remove unused debugging code to fix native building on aarch64. Without
this change, the following -Werr output inhibits make from completing.

  qemu/hw/intc/arm_gic_kvm.c:38:18: error: debug_gic_kvm defined but not used [-Werror=unused-const-variable=]
   static const int debug_gic_kvm = 0;
                    ^~~~~~~~~~~~~
  cc1: all warnings being treated as errors
  qemu/rules.mak:60: recipe for target 'hw/intc/arm_gic_kvm.o' failed
  make[1]: *** [hw/intc/arm_gic_kvm.o] Error 1
  Makefile:205: recipe for target 'subdir-aarch64-softmmu' failed

Signed-off-by: Christopher Covington <cov@codeaurora.org>
---
 hw/intc/arm_gic_kvm.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index ae7ac58..11729ee 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -30,20 +30,6 @@
 #include "gic_internal.h"
 #include "vgic_common.h"
 
-//#define DEBUG_GIC_KVM
-
-#ifdef DEBUG_GIC_KVM
-static const int debug_gic_kvm = 1;
-#else
-static const int debug_gic_kvm = 0;
-#endif
-
-#define DPRINTF(fmt, ...) do { \
-        if (debug_gic_kvm) { \
-            printf("arm_gic: " fmt , ## __VA_ARGS__); \
-        } \
-    } while (0)
-
 #define TYPE_KVM_ARM_GIC "kvm-arm-gic"
 #define KVM_ARM_GIC(obj) \
      OBJECT_CHECK(GICState, (obj), TYPE_KVM_ARM_GIC)
-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc. Qualcomm Technologies, Inc. is a member of the Code Aurora
Forum, a Linux Foundation Collaborative Project.

