Received: by 10.80.166.35 with SMTP id d32csp794104edc;
        Thu, 27 Oct 2016 12:24:54 -0700 (PDT)
X-Received: by 10.176.5.130 with SMTP id e2mr8630731uae.108.1477596294880;
        Thu, 27 Oct 2016 12:24:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j9si4182339uab.207.2016.10.27.12.24.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 12:24:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44115 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzqII-0003wE-AV
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 15:24:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzqIC-0003vT-6d
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 15:24:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bzqIA-0002Fx-Rf
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 15:24:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58820)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bzqIA-0002Ff-MB; Thu, 27 Oct 2016 15:24:46 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C742333C158;
	Thu, 27 Oct 2016 19:24:45 +0000 (UTC)
Received: from javelin.localdomain (vpn-58-122.rdu2.redhat.com [10.10.58.122])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9RJOdq4029585
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 27 Oct 2016 15:24:42 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Fri, 28 Oct 2016 00:54:38 +0530
Message-Id: <1477596278-1470-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 27 Oct 2016 19:24:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4] char: cadence: check baud rate generator and
 divider values
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4+virb9z/8Ty

From: Prasad J Pandit <pjp@fedoraproject.org>

The Cadence UART device emulator calculates speed by dividing the
baud rate by a 'baud rate generator' & 'baud rate divider' value.
The device specification defines these register values to be
non-zero and within certain limits. Add checks for these limits
to avoid errors like divide by zero.

Reported-by: Huawei PSIRT <psirt@huawei.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/char/cadence_uart.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

Update: remove default reset value assignment.
  -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg07206.html

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index e3bc52f..4a3c4c6 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -1,6 +1,11 @@
 /*
  * Device model for Cadence UART
  *
+ * Reference: Xilinx Zynq 7000 reference manual
+ *   - http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
+ *   - Chapter 19 UART Controller
+ *   - Appendix B for Register details
+ *
  * Copyright (c) 2010 Xilinx Inc.
  * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogix.com)
  * Copyright (c) 2012 PetaLogix Pty Ltd.
@@ -410,6 +415,16 @@ static void uart_write(void *opaque, hwaddr offset,
             break;
         }
         break;
+    case R_BRGR: /* Baud rate generator */
+        if (value >= 0x01) {
+            s->r[offset] = value & 0xFFFF;
+        }
+        break;
+    case R_BDIV:    /* Baud rate divider */
+        if (value >= 0x04) {
+            s->r[offset] = value & 0xFF;
+        }
+        break;
     default:
         s->r[offset] = value;
     }
-- 
2.7.4

