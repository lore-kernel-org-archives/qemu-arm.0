Received: by 10.25.21.156 with SMTP id 28csp1598970lfv;
        Mon, 11 Jul 2016 11:23:01 -0700 (PDT)
X-Received: by 10.200.56.90 with SMTP id r26mr6312011qtb.37.1468261381837;
        Mon, 11 Jul 2016 11:23:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t189si2559801qkh.21.2016.07.11.11.23.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 11:23:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMfrB-0008Id-Aw
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 14:23:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bMfr7-0008IW-92
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 14:22:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bMfr6-0005BX-CF
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 14:22:57 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58231)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bMfr6-0005B1-3m; Mon, 11 Jul 2016 14:22:56 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bMfr3-00072O-Ad; Mon, 11 Jul 2016 19:22:53 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 11 Jul 2016 19:22:52 +0100
Message-Id: <1468261372-17508-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] arm_gicv3: Add assert()s to tell Coverity that
 offsets are aligned
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YgIIqrub9PhN

Coverity complains that the GICR_IPRIORITYR case in gicv3_readl()
can overflow an array, because it doesn't know that the offsets
passed to that function must be word aligned. Add some assert()s
which hopefully tell Coverity that this isn't possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I don't have any way to test this except getting it into master
and seeing if Coverity still complains, but if it does then
I'll happily just mark the error as a false positive...

 hw/intc/arm_gicv3_redist.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 2f60096..77e5cfa 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -420,6 +420,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
     MemTxResult r;
     int cpuidx;
 
+    assert((offset & (size - 1)) == 0);
+
     /* This region covers all the redistributor pages; there are
      * (for GICv3) two 64K pages per CPU. At the moment they are
      * all contiguous (ie in this one region), though we might later
@@ -468,6 +470,8 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     MemTxResult r;
     int cpuidx;
 
+    assert((offset & (size - 1)) == 0);
+
     /* This region covers all the redistributor pages; there are
      * (for GICv3) two 64K pages per CPU. At the moment they are
      * all contiguous (ie in this one region), though we might later
-- 
1.9.1

