Received: by 10.25.205.13 with SMTP id d13csp134049lfg;
        Mon, 16 Jan 2017 10:01:08 -0800 (PST)
X-Received: by 10.55.98.5 with SMTP id w5mr30952699qkb.165.1484589668267;
        Mon, 16 Jan 2017 10:01:08 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l63si14695849qke.238.2017.01.16.10.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jan 2017 10:01:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTBab-0005XG-KB
	for alex.bennee@linaro.org; Mon, 16 Jan 2017 13:01:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cTBYO-0003sk-6A
	for qemu-devel@nongnu.org; Mon, 16 Jan 2017 12:58:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cTBYN-0000e5-98
	for qemu-devel@nongnu.org; Mon, 16 Jan 2017 12:58:48 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cTBYK-0000Wv-NL; Mon, 16 Jan 2017 12:58:44 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cTBYC-0000dN-EB; Mon, 16 Jan 2017 17:58:36 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 16 Jan 2017 17:58:35 +0000
Message-Id: <1484589515-26353-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH] hw/char/exynos4210_uart: Drop unused local
 variable frame_size
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fjiLrHuGAE/W

The frame_size local variable in exynos4210_uart_update_parameters()
is calculated but never used (and has been this way since the
device was introduced in commit e5a4914efc7). The qemu_chr_fe_ioctl()
doesn't need this information (if it really wanted it it could
calculate it from the parity/data_bits/stop_bits), so just drop
the variable entirely.

Fixes: https://bugs.launchpad.net/bugs/1655702

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/exynos4210_uart.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 820d1ab..0cd3dd3 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -306,7 +306,7 @@ static void exynos4210_uart_update_irq(Exynos4210UartState *s)
 
 static void exynos4210_uart_update_parameters(Exynos4210UartState *s)
 {
-    int speed, parity, data_bits, stop_bits, frame_size;
+    int speed, parity, data_bits, stop_bits;
     QEMUSerialSetParams ssp;
     uint64_t uclk_rate;
 
@@ -314,9 +314,7 @@ static void exynos4210_uart_update_parameters(Exynos4210UartState *s)
         return;
     }
 
-    frame_size = 1; /* start bit */
     if (s->reg[I_(ULCON)] & 0x20) {
-        frame_size++; /* parity bit */
         if (s->reg[I_(ULCON)] & 0x28) {
             parity = 'E';
         } else {
@@ -334,8 +332,6 @@ static void exynos4210_uart_update_parameters(Exynos4210UartState *s)
 
     data_bits = (s->reg[I_(ULCON)] & 0x3) + 5;
 
-    frame_size += data_bits + stop_bits;
-
     uclk_rate = 24000000;
 
     speed = uclk_rate / ((16 * (s->reg[I_(UBRDIV)]) & 0xffff) +
-- 
2.7.4

