Received: by 10.25.21.96 with SMTP id l93csp1364415lfi;
        Mon, 20 Jun 2016 02:57:29 -0700 (PDT)
X-Received: by 10.55.26.219 with SMTP id l88mr20062892qkh.14.1466416649093;
        Mon, 20 Jun 2016 02:57:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v70si46979611qkv.221.2016.06.20.02.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 02:57:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bEvxQ-0000SX-ID
	for alex.bennee@linaro.org; Mon, 20 Jun 2016 05:57:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bEvxN-0000SR-TT
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 05:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bEvxM-0005Qv-4e
	for qemu-arm@nongnu.org; Mon, 20 Jun 2016 05:57:24 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57916)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bEvxL-0005QG-SV; Mon, 20 Jun 2016 05:57:24 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bEvxD-0001ML-K7; Mon, 20 Jun 2016 10:57:15 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Jun 2016 10:57:14 +0100
Message-Id: <1466416634-9798-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] hw/intc/arm_gicv3: Fix compilation with simple
 trace backend
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
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NJfg6IZAOqtC

Fix missing includes of qemu/log.h, which broke compilation with the
simple trace backend (the default backend pulls in log.h implicitly
via trace.h).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
In particular, this broke travis builds.
---
 hw/intc/arm_gicv3_dist.c   | 1 +
 hw/intc/arm_gicv3_redist.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index b977ae5..3ea3dd0 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "trace.h"
 #include "gicv3_internal.h"
 
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 55c25e8..2f60096 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "trace.h"
 #include "gicv3_internal.h"
 
-- 
1.9.1

