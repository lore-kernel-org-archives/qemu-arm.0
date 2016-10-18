Received: by 10.80.166.35 with SMTP id d32csp895876edc;
        Tue, 18 Oct 2016 02:47:27 -0700 (PDT)
X-Received: by 10.55.129.1 with SMTP id c1mr1496755qkd.53.1476784047492;
        Tue, 18 Oct 2016 02:47:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j42si20401511qta.132.2016.10.18.02.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 02:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwQzW-0004t2-GW
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 05:47:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bwQzR-0004sl-1F
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 05:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bwQzN-00057m-5Q
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 05:47:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bwQzM-00057Q-W6; Tue, 18 Oct 2016 05:47:17 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24181335F92;
	Tue, 18 Oct 2016 09:47:16 +0000 (UTC)
Received: from javelin.localdomain (vpn1-48-97.bne.redhat.com [10.64.48.97])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9I9l7Yu023847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 18 Oct 2016 05:47:11 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Tue, 18 Oct 2016 15:17:05 +0530
Message-Id: <1476784025-27293-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 18 Oct 2016 09:47:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] char: cadence: check divider against baud rate
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
Cc: qemu-arm@nongnu.org, Huawei PSIRT <psirt@huawei.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fvXbNcvlu8W/

From: Prasad J Pandit <pjp@fedoraproject.org>

The Cadence UART device emulator calculates speed by dividing the
baud rate by a divider. If this divider was to be zero or if baud
rate was to be lesser than the divider, it could lead to a divide
by zero error. Add check to avoid it.

Reported-by: Huawei PSIRT <psirt@huawei.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/char/cadence_uart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index e3bc52f..b18dd7f 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -170,6 +170,10 @@ static void uart_parameters_setup(CadenceUARTState *s)
     baud_rate = (s->r[R_MR] & UART_MR_CLKS) ?
             UART_INPUT_CLK / 8 : UART_INPUT_CLK;
 
+    if (!s->r[R_BRGR] || !(s->r[R_BDIV] + 1)
+        || baud_rate < (s->r[R_BRGR] * (s->r[R_BDIV] + 1))) {
+        return;
+    }
     ssp.speed = baud_rate / (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
     packet_size = 1;
 
-- 
2.7.4

