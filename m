Received: by 10.25.77.4 with SMTP id a4csp1289518lfb;
        Mon, 13 Mar 2017 11:48:39 -0700 (PDT)
X-Received: by 10.200.41.42 with SMTP id y39mr33617364qty.37.1489430919282;
        Mon, 13 Mar 2017 11:48:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y65si1095025qkd.99.2017.03.13.11.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 11:48:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnV1I-0001iz-CY
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 14:48:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnV0y-0001Ue-ER
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:48:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnV0x-0004mW-Ol
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:48:16 -0400
Received: from mail.kernel.org ([198.145.29.136]:56006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cnV0x-0004lT-Hl; Mon, 13 Mar 2017 14:48:15 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 8051020260;
	Mon, 13 Mar 2017 18:48:13 +0000 (UTC)
Received: from localhost.localdomain (bzq-79-180-56-222.red.bezeqint.net
	[79.180.56.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 39C9620263;
	Mon, 13 Mar 2017 18:48:08 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 13 Mar 2017 20:47:49 +0200
Message-Id: <20170313184750.429-3-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170313184750.429-1-krzk@kernel.org>
References: <20170313184750.429-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH v3 2/3] hw/char/exynos4210_uart: Constify static
 array and few arguments
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
Cc: eblake@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v1OpNBejLqMK

The static array exynos4210_uart_regs with register values is not
modified so it can be made const.

Few other functions accept driver or uart state as an argument but they
do not change it and do not cast it so this can be made const for code
safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/char/exynos4210_uart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index b75f28d473bf..bff706ab3a68 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -102,7 +102,7 @@ typedef struct Exynos4210UartReg {
     uint32_t            reset_value;
 } Exynos4210UartReg;
 
-static Exynos4210UartReg exynos4210_uart_regs[] = {
+static const Exynos4210UartReg exynos4210_uart_regs[] = {
     {"ULCON",    ULCON,    0x00000000},
     {"UCON",     UCON,     0x00003000},
     {"UFCON",    UFCON,    0x00000000},
@@ -220,7 +220,7 @@ static uint8_t fifo_retrieve(Exynos4210UartFIFO *q)
     return  ret;
 }
 
-static int fifo_elements_number(Exynos4210UartFIFO *q)
+static int fifo_elements_number(const Exynos4210UartFIFO *q)
 {
     if (q->sp < q->rp) {
         return q->size - q->rp + q->sp;
@@ -229,7 +229,7 @@ static int fifo_elements_number(Exynos4210UartFIFO *q)
     return q->sp - q->rp;
 }
 
-static int fifo_empty_elements_number(Exynos4210UartFIFO *q)
+static int fifo_empty_elements_number(const Exynos4210UartFIFO *q)
 {
     return q->size - fifo_elements_number(q);
 }
@@ -245,7 +245,7 @@ static void fifo_reset(Exynos4210UartFIFO *q)
     q->rp = 0;
 }
 
-static uint32_t exynos4210_uart_Tx_FIFO_trigger_level(Exynos4210UartState *s)
+static uint32_t exynos4210_uart_Tx_FIFO_trigger_level(const Exynos4210UartState *s)
 {
     uint32_t level = 0;
     uint32_t reg;
-- 
2.9.3

