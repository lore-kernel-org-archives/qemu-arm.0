Received: by 10.80.166.35 with SMTP id d32csp3027564edc;
        Mon, 24 Oct 2016 23:49:17 -0700 (PDT)
X-Received: by 10.200.40.197 with SMTP id j5mr18223939qtj.43.1477378156945;
        Mon, 24 Oct 2016 23:49:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w126si12630350qka.48.2016.10.24.23.49.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 23:49:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byvXw-0004yy-6e
	for alex.bennee@linaro.org; Tue, 25 Oct 2016 02:49:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1byvXr-0004xa-SO
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 02:49:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1byvXn-00010S-0m
	for qemu-arm@nongnu.org; Tue, 25 Oct 2016 02:49:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1byvXm-0000y2-S5; Tue, 25 Oct 2016 02:49:06 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CA2E80F8F;
	Tue, 25 Oct 2016 06:49:05 +0000 (UTC)
Received: from javelin.localdomain (vpn-55-172.rdu2.redhat.com [10.10.55.172])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9P6n1jL002212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 25 Oct 2016 02:49:03 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Tue, 25 Oct 2016 12:19:00 +0530
Message-Id: <1477378140-2670-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 25 Oct 2016 06:49:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] char: cadence: correct reset value for baud rate
 registers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Prasad J Pandit <pjp@fedoraproject.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hMtTNTtKXa+R

From: Prasad J Pandit <pjp@fedoraproject.org>

The Cadence UART device emulator stores 'baud rate generator'
and 'baud rate divider' values, used in computing speed, in two
registers. The device specification defines their range and
their reset value. Use their correct value when resetting the
device in cadence_uart_reset.

Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/char/cadence_uart.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index c176446..b8d4c28 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -471,7 +471,8 @@ static void cadence_uart_reset(DeviceState *dev)
     s->r[R_IMR] = 0;
     s->r[R_CISR] = 0;
     s->r[R_RTRIG] = 0x00000020;
-    s->r[R_BRGR] = 0x0000000F;
+    s->r[R_BRGR] = 0x0000028B;
+    s->r[R_BDIV] = 0x0000000F;
     s->r[R_TTRIG] = 0x00000020;
 
     uart_rx_reset(s);
-- 
2.7.4

