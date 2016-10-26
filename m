Received: by 10.80.166.35 with SMTP id d32csp280512edc;
        Wed, 26 Oct 2016 14:23:21 -0700 (PDT)
X-Received: by 10.237.33.225 with SMTP id m30mr3551908qtc.61.1477517001419;
        Wed, 26 Oct 2016 14:23:21 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si2331963qtu.127.2016.10.26.14.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 14:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzVfM-0006Mi-RV
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 17:23:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzVeg-0006LH-AJ
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 17:22:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzVef-0000JO-CW
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 17:22:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59366)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzVea-0000GU-MA; Wed, 26 Oct 2016 17:22:32 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7D2B8F278;
	Wed, 26 Oct 2016 21:22:31 +0000 (UTC)
Received: from javelin.localdomain (vpn-55-145.rdu2.redhat.com [10.10.55.145])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9QLMQFF013938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Oct 2016 17:22:28 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Thu, 27 Oct 2016 02:52:25 +0530
Message-Id: <1477516945-9891-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 26 Oct 2016 21:22:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3] char: cadence: check baud rate generator
 and divider values
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cyytKwnw8STC

From: Prasad J Pandit <pjp@fedoraproject.org>

The Cadence UART device emulator calculates speed by dividing the
baud rate by a 'baud rate generator' & 'baud rate divider' value.
The device specification defines these register values to be
non-zero and within certain limits. Add checks for these limits
to avoid errors like divide by zero.

Reported-by: Huawei PSIRT <psirt@huawei.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/char/cadence_uart.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

Update: mask R_BRGR and R_BDIV register values with 0xffff and 0xff resp.
  -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg06206.html
  -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg06215.html

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index e3bc52f..5341d81 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -1,5 +1,10 @@
 /*
  * Device model for Cadence UART
+ *   -> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
+ *
+ * Reference: Xilinx Zynq 7000 reference manual
+ *   - Chapter 19 UART Controller
+ *   - Appendix B for Register details
  *
  * Copyright (c) 2010 Xilinx Inc.
  * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogix.com)
@@ -410,6 +415,18 @@ static void uart_write(void *opaque, hwaddr offset,
             break;
         }
         break;
+    case R_BRGR: /* Baud rate generator */
+        s->r[offset] = 0x028B; /* default reset value */
+        if (value >= 0x01) {
+            s->r[offset] = value & 0xFFFF;
+        }
+        break;
+    case R_BDIV:    /* Baud rate divider */
+        s->r[offset] = 0x0F;
+        if (value >= 0x04) {
+            s->r[offset] = value & 0xFF;
+        }
+        break;
     default:
         s->r[offset] = value;
     }
-- 
2.7.4

