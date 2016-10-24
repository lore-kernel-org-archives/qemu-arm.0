Received: by 10.80.166.35 with SMTP id d32csp2636143edc;
        Mon, 24 Oct 2016 06:23:04 -0700 (PDT)
X-Received: by 10.159.39.68 with SMTP id a62mr6883772uaa.95.1477315384711;
        Mon, 24 Oct 2016 06:23:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h86si5001265vkc.66.2016.10.24.06.23.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 06:23:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46744 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byfDT-0003qB-Ct
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 09:23:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1byfDM-0003nm-Uu
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 09:23:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1byfDI-0006WX-Db
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 09:22:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47230)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1byfDI-0006W6-7t; Mon, 24 Oct 2016 09:22:52 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24A3F61E50;
	Mon, 24 Oct 2016 13:22:51 +0000 (UTC)
Received: from javelin.localdomain (vpn-61-69.rdu2.redhat.com [10.10.61.69])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9ODMkrI011024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 24 Oct 2016 09:22:48 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Mon, 24 Oct 2016 18:52:44 +0530
Message-Id: <1477315364-15134-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 24 Oct 2016 13:22:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2] char: cadence: check baud rate generator and
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
X-TUID: WyJYG99wzYcG

From: Prasad J Pandit <pjp@fedoraproject.org>

The Cadence UART device emulator calculates speed by dividing the
baud rate by a 'baud rate generator' & 'baud rate divider' value.
The device specification defines these register values to be
non-zero and within certain limits. Add checks for these limits
to avoid errors like divide by zero.

Reported-by: Huawei PSIRT <psirt@huawei.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/char/cadence_uart.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

Update: set register values as per the specification
  -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg04931.html

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index e3bc52f..c176446 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -1,5 +1,6 @@
 /*
  * Device model for Cadence UART
+ *  -> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
  *
  * Copyright (c) 2010 Xilinx Inc.
  * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogix.com)
@@ -410,6 +411,18 @@ static void uart_write(void *opaque, hwaddr offset,
             break;
         }
         break;
+    case R_BRGR: /* Baud rate generator */
+        s->r[offset] = 0x028B; /* default reset value */
+        if (value >= 0x01 && value <= 0xFFFF) {
+            s->r[offset] = value;
+        }
+        break;
+    case R_BDIV:    /* Baud rate divider */
+        s->r[offset] = 0x0F;
+        if (value >= 0x04 && value <= 0xFF) {
+            s->r[offset] = value;
+        }
+        break;
     default:
         s->r[offset] = value;
     }
-- 
2.7.4

