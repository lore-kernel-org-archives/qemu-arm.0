Received: by 10.28.71.27 with SMTP id u27csp20767wma;
        Tue, 23 Jan 2018 15:02:34 -0800 (PST)
X-Google-Smtp-Source: AH8x225KXrDrresh53j6yAHzOViU4kiwn2V+B+f8LNZzqhbmTHtOYCnDUUfefqUL72kCLrBtKCQU
X-Received: by 10.37.104.141 with SMTP id d135mr4003461ybc.380.1516748554814;
        Tue, 23 Jan 2018 15:02:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516748554; cv=none;
        d=google.com; s=arc-20160816;
        b=Mf8us5dfKjod/40tDy1ROM5BGIKdrds7yYr5QhvfbMV1eOMKet2FCrPnu6sIQN0rzc
         7qXIf0Smn/IBQC/F6XEkmuE9Qls4iQ19c+QNQ/92iRxew6wFIE6JrKqNDBBmr02oanNE
         0ACFEnz738Dq25OxhQLRpUYBWBSWPw9U6ss7n8WOUYrDoZco/QozXL8ZcbyIkTIREe7m
         f44JWcQuKLEsUvMHd/aEx9YFunw89eobP1Ou8D85st8iQpz2nhwjEDDe9aBRku3KWqhT
         Pq0mvowuJnaw7f3xY52VZVNMKiB+MFvQnZSF+47Q1lJhDOn1UvZwNxOKpcc5SySFpYa9
         pIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=/QyF1Vwm+8svLryma+BP+Cu5HUfQ0Y0t6jE8PwDRlv4=;
        b=K0XYbWOjg8unxj0fR6iqVo58BYlxOiV3qXxUbnBVFEQrFjlDzPi05GmzYw51AQLR81
         98RVjyL8IfDri3Y71g5gEaBrE96ORYqru+6E/ICEPNviKrHq60dUoBhDNpZ1lUDcySBj
         wZ6H/slUZQYvg4zLggHUEoHNKpYBz8B5/zc+L/8zqvF4MizEcoxFeg7kau/bbv70HqyA
         xEsWthMnCK7fRRYvaPfcbw9ayvg4XBToretlVpMV5fEjUJ2ne4X7jh8h0j+gTFq8QEsU
         SrZ8ZVvZEQ609z5KEp658y0A/xnpaBHBg0VkFPEU66qMjX2Bq1JGerD5uVhOFicUpTT6
         QJqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zaq8L+l6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si4321739ywj.33.2018.01.23.15.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 15:02:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zaq8L+l6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee7aM-0005FP-9y
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 18:02:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1ee7X1-0003Ka-Ir
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 17:59:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1ee7Wy-000430-22
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 17:59:07 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:44382)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1ee7Wx-00040q-J4
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 17:59:03 -0500
Received: by mail-lf0-x243.google.com with SMTP id v188so2706573lfa.11
	for <qemu-devel@nongnu.org>; Tue, 23 Jan 2018 14:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=/QyF1Vwm+8svLryma+BP+Cu5HUfQ0Y0t6jE8PwDRlv4=;
	b=Zaq8L+l6RUnWShSpYClwuN3mQZKvOAq+jTqI3/ALM1h2CmJig6Mj5G3mYL1pQF7u7c
	V3FcO4NMcYR+KrKQCttZBobqxphSp3HoPZbHoU7mwNqALeiHpaBXwaXNq0ngJ40oNDry
	PMR4p09UEkHmufabz1itNIs/oy/MUaHOSA2tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/QyF1Vwm+8svLryma+BP+Cu5HUfQ0Y0t6jE8PwDRlv4=;
	b=gXwqFRZ+md8vas1fyyZTvszTmQD0S4MYuR7Tk9uAfK0jO89LZxnDzdxocF+JCdX78C
	lx3HU6R4iLK/NnOyBhX2yUXH4A0IXr00fJErOALTACntJED9NwDt4EGo+fim8J3XNYEg
	MLn/cHSRPAboQ4vLsxKAF6iuXWS5P3U2KmXzMZwgltUMIj9FwfHBSTaZg1HnDaITEAo8
	rL2oOD0ipgWup9WY8gCsKTaMmStIarSWi0I4TptFZErQDlrUPhGdUpfNrdvMLPb/9WdT
	OzZyzGn277+cI+XIWLC9v4+8jYUJ13cfjIyKu7CnsAsjJrmt/tybLYns+2QD7U8cyfgy
	eWuA==
X-Gm-Message-State: AKwxytc2c9rqPDwdWtLLLmQWuYmNvUzB+ZX5Hvq8zq4yebfKhdLqDjPF
	lnsfua5Lp1p+b7iegwFAWzHZA2xXWpY=
X-Received: by 10.25.56.13 with SMTP id f13mr2118489lfa.16.1516748341815;
	Tue, 23 Jan 2018 14:59:01 -0800 (PST)
Received: from localhost.localdomain
	(c-cb7471d5.014-348-6c756e10.cust.bredbandsbolaget.se.
	[213.113.116.203])
	by smtp.gmail.com with ESMTPSA id m25sm245424lfc.38.2018.01.23.14.59.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Jan 2018 14:59:01 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jan 2018 23:56:54 +0100
Message-Id: <20180123225654.5764-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH] pl110: Implement vertical compare/next base
 interrupts
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
	Linus Walleij <linus.walleij@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PvaAHWTM0Sga

This implements rudimentary support for interrupt generation on the
PL110. I am working on a new DRI/KMS driver for Linux and since that
uses the blanking interrupt, we need something to fire here. Without
any interrupt support Linux waits for a while and then gives ugly
messages about the vblank not working in the console (it does not
hang perpetually or anything though, DRI is pretty forgiving).

I solved it for now by setting up a timer to fire at 60Hz and pull
the interrupts for "vertical compare" and "next memory base"
at this interval. This works fine and fires roughly the same number
of IRQs on QEMU as on the hardware and leaves the console clean
and nice.

People who want to create more accurate emulation can probably work
on top of this if need be. It is certainly closer to the hardware
behaviour than what we have today anyway.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 hw/display/pl110.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index 8c7dcc6f0a69..777bb3f44503 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -12,6 +12,7 @@
 #include "ui/console.h"
 #include "framebuffer.h"
 #include "ui/pixel_ops.h"
+#include "qemu/timer.h"
 #include "qemu/log.h"
 
 #define PL110_CR_EN   0x001
@@ -19,6 +20,8 @@
 #define PL110_CR_BEBO 0x200
 #define PL110_CR_BEPO 0x400
 #define PL110_CR_PWR  0x800
+#define PL110_IE_NB   0x004
+#define PL110_IE_VC   0x008
 
 enum pl110_bppmode
 {
@@ -50,6 +53,7 @@ typedef struct PL110State {
     MemoryRegion iomem;
     MemoryRegionSection fbsection;
     QemuConsole *con;
+    QEMUTimer *vblank_timer;
 
     int version;
     uint32_t timing[4];
@@ -320,7 +324,23 @@ static void pl110_resize(PL110State *s, int width, int height)
 /* Update interrupts.  */
 static void pl110_update(PL110State *s)
 {
-  /* TODO: Implement interrupts.  */
+    /* Raise IRQ if enabled and any status bit is 1 */
+    if (s->int_status & s->int_mask) {
+        qemu_irq_raise(s->irq);
+    } else {
+        qemu_irq_lower(s->irq);
+    }
+}
+
+static void pl110_vblank_interrupt(void *opaque)
+{
+    PL110State *s = opaque;
+
+    /* Fire the vertical compare and next base IRQs and re-arm */
+    s->int_status |= (PL110_IE_NB | PL110_IE_VC);
+    timer_mod(s->vblank_timer,
+              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + NANOSECONDS_PER_SECOND / 60);
+    pl110_update(s);
 }
 
 static uint64_t pl110_read(void *opaque, hwaddr offset,
@@ -429,6 +449,10 @@ static void pl110_write(void *opaque, hwaddr offset,
         s->bpp = (val >> 1) & 7;
         if (pl110_enabled(s)) {
             qemu_console_resize(s->con, s->cols, s->rows);
+            timer_mod(s->vblank_timer,
+                      qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + NANOSECONDS_PER_SECOND / 60);
+        } else {
+            timer_del(s->vblank_timer);
         }
         break;
     case 10: /* LCDICR */
@@ -474,6 +498,7 @@ static void pl110_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->iomem, OBJECT(s), &pl110_ops, s, "pl110", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
+    s->vblank_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, pl110_vblank_interrupt, s);
     qdev_init_gpio_in(dev, pl110_mux_ctrl_set, 1);
     s->con = graphic_console_init(dev, 0, &pl110_gfx_ops, s);
 }
-- 
2.14.3

