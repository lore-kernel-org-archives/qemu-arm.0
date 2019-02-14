Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp958106wrp;
        Thu, 14 Feb 2019 05:09:16 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY6DhpORq/5qnsoOoln0NJhMrJRX7hRS5TYKdPB30SOJjLie4mVjJPQGP3SujpactlnPehN
X-Received: by 2002:a81:5e89:: with SMTP id s131mr2996819ywb.388.1550149756565;
        Thu, 14 Feb 2019 05:09:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149756; cv=none;
        d=google.com; s=arc-20160816;
        b=fBh91evW4K6h4Mu0vPzvZYljA6lpLFoexllWG+Ssz33VGrROndzBnYPNw0OlJd08qw
         cx1B4OV6nd6SJ+Q8CZUuaDirvUWchfRGohTJZ632wysTcrDx2Fu+uG2bFaK3Yjkrh7RE
         M11X3rkyAKT3xp3nORYFf1Jl0P4BVhfwDtNRslRVOIvIahoEojA20cVa4LMttE5gU8ie
         BtG8/9Da7WYIpL3xipKClaGUO0Uv9fC/jENRqzkWt/Lcu8AlxQfQzFarRK4BzbrSBnaa
         a1YJ5+N/1xZxiAM1RGngU6aD6DqdYe0WAnfDR+NFuQgTLY5z0Ietq8K9IhKU7q/B240V
         yr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=9GhcdoHkWYFQUs/bSK2K6WRQDH8DkevPHImfn8kPArY=;
        b=x6D0jKGyppDEndfcskUuNgKDqRPp4tue/iul6iUW6MgMgbAshCDpkdhTr/8qTo/gaA
         vQbVk9AeTAWTpvA2hJGE3jnQqJhBsAwn4A2v+2aQaQWVaS9h2KLRxwx73xL7yh0S0Pwy
         /AL4hQzTDjlN0tcjkLWJoov1dSVfynM0T5rRLUc9fWKjyw60q1Il6/X51gEcIFhv8NED
         YXZcTA4syJTMKNV6q1sm/WP7E+mJDog0mIhTjhE4lYcNVy7s5Dg8N3NolJAbShfKFpKa
         1sMTI+NY7ZHIdQo9qznps0iPReSeM/dXlf552ojbLbMByCln7fqIWMAvzHjjsoOcPv50
         QAiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n26sLxq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si1273942ybn.333.2019.02.14.05.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:09:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n26sLxq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGlP-0000II-TU
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:09:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeR-00038S-Hs
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 08:02:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGUD-0006n9-7g
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:33 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35877)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGU2-0006VS-NI
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:22 -0500
Received: by mail-wm1-x344.google.com with SMTP id j125so5992801wmj.1
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 04:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9GhcdoHkWYFQUs/bSK2K6WRQDH8DkevPHImfn8kPArY=;
	b=n26sLxq5Oi6VHS4zA4McrNiLy47MxTPtsjbf46p8iXp7IXVvPwXCyxaRNXouvi754D
	R4CMIulgR6cmE2PfuwwOy5FLa8pw2zUrEK6q2+gN+OCBVIOyC0qafM0DV6ScK16Rt6xN
	QOTIFAuWnAL/OQnY3iHj+m9GrlaUH86QgGfV1NGRWJvHQ4YRC7KtkK2RmBDjz7+ujyJw
	Q94sHUBR3iz427T5z8v9cUhP5RBe2wcf1jQQBbxSrVFQ2L+GHq2cgabPauFKJ8t1omx5
	kpes/M1ERnw5FmnhpupeaErVzbGvxfdM3yhJSemVEUKa03VmoyPchiVFM/kp1u2/MNNg
	4RZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9GhcdoHkWYFQUs/bSK2K6WRQDH8DkevPHImfn8kPArY=;
	b=Og0+K5T76kepQkGxkGF15uNJ8qPu8TasX9RjKOQottRhO4TcEhnaAbvYpBw6do1hOE
	OUTz21AjVoMdqA72a9lF8kQZok/O0AGGO8mRH1rcTry9GG1O9SYAuvwzw795D+rZe76Q
	3kkn/+mJA7C/QI79DyjUEhQwcd/9bfDaTwTPGfduL/G0HvSWbzP7ud7S7eD8ehGlLq6M
	2wpXDBpGxaUaXArsZEfWZ0IusQJ5puztWGcw1p1bndCKPGqyka49zCDuq008xSvihQyE
	2RU5cw5ddqHVQdgksWLBeoTdigm1U9lv8P+iFxSDvOXe0KKxgqs27HcG0fHd1lo94u6o
	IYmQ==
X-Gm-Message-State: AHQUAuZMRY2gfLxu/3v6O8gO9JbtSoG0YXoksmCwb9hoibenMms5szfc
	JHSoPHFBkMZsIMrU6ZbUzcNv48Nid1Iliw==
X-Received: by 2002:a1c:1b4e:: with SMTP id b75mr2788355wmb.88.1550148676391; 
	Thu, 14 Feb 2019 04:51:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:50:59 +0000
Message-Id: <20190214125107.22178-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH 06/14] hw/char/pl011: Support all interrupt lines
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JUi/Z8zB48bG

The PL011 UART has six interrupt lines:
 * RX (receive data)
 * TX (transmit data)
 * RT (receive timeout)
 * MS (modem status)
 * E (errors)
 * combined (logical OR of all the above)

So far we have only emulated the combined interrupt line;
add support for the others, so that boards that wire them
up to different interrupt controller inputs can do so.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/pl011.h |  2 +-
 hw/char/pl011.c         | 46 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 1b52bfd5c90..dad3cf29121 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -45,7 +45,7 @@ typedef struct PL011State {
     int read_count;
     int read_trigger;
     CharBackend chr;
-    qemu_irq irq;
+    qemu_irq irq[6];
     const unsigned char *id;
 } PL011State;
 
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 0c4711e4027..29f4e5eb224 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -7,6 +7,17 @@
  * This code is licensed under the GPL.
  */
 
+/*
+ * QEMU interface:
+ *  + sysbus MMIO region 0: device registers
+ *  + sysbus IRQ 0: UARTINTR (combined interrupt line)
+ *  + sysbus IRQ 1: UARTRXINTR (receive FIFO interrupt line)
+ *  + sysbus IRQ 2: UARTTXINTR (transmit FIFO interrupt line)
+ *  + sysbus IRQ 3: UARTRTINTR (receive timeout interrupt line)
+ *  + sysbus IRQ 4: UARTMSINTR (momem status interrupt line)
+ *  + sysbus IRQ 5: UARTEINTR (error interrupt line)
+ */
+
 #include "qemu/osdep.h"
 #include "hw/char/pl011.h"
 #include "hw/sysbus.h"
@@ -22,18 +33,46 @@
 #define PL011_FLAG_TXFF 0x20
 #define PL011_FLAG_RXFE 0x10
 
+/* Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC */
+#define INT_OE (1 << 10)
+#define INT_BE (1 << 9)
+#define INT_PE (1 << 8)
+#define INT_FE (1 << 7)
+#define INT_RT (1 << 6)
+#define INT_TX (1 << 5)
+#define INT_RX (1 << 4)
+#define INT_DSR (1 << 3)
+#define INT_DCD (1 << 2)
+#define INT_CTS (1 << 1)
+#define INT_RI (1 << 0)
+#define INT_E (INT_OE | INT_BE | INT_PE | INT_FE)
+#define INT_MS (INT_RI | INT_DSR | INT_DCD | INT_CTS)
+
 static const unsigned char pl011_id_arm[8] =
   { 0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
 static const unsigned char pl011_id_luminary[8] =
   { 0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1 };
 
+/* Which bits in the interrupt status matter for each outbound IRQ line ? */
+static const uint32_t irqmask[] = {
+    INT_E | INT_MS | INT_RT | INT_TX | INT_RX, /* combined IRQ */
+    INT_RX,
+    INT_TX,
+    INT_RT,
+    INT_MS,
+    INT_E,
+};
+
 static void pl011_update(PL011State *s)
 {
     uint32_t flags;
+    int i;
 
     flags = s->int_level & s->int_enabled;
     trace_pl011_irq_state(flags != 0);
-    qemu_set_irq(s->irq, flags != 0);
+    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
+        qemu_set_irq(s->irq[i], (flags & irqmask[i]) != 0);
+    }
 }
 
 static uint64_t pl011_read(void *opaque, hwaddr offset,
@@ -284,10 +323,13 @@ static void pl011_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     PL011State *s = PL011(obj);
+    int i;
 
     memory_region_init_io(&s->iomem, OBJECT(s), &pl011_ops, s, "pl011", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
-    sysbus_init_irq(sbd, &s->irq);
+    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
+        sysbus_init_irq(sbd, &s->irq[i]);
+    }
 
     s->read_trigger = 1;
     s->ifl = 0x12;
-- 
2.20.1

