Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3655119wrd;
        Mon, 17 Sep 2018 01:42:01 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYVJYnRfmfJ2A7oyGX5tci2t43esmP1HbCyxakitq1DFiQ72ziIJRLdhJsbkg9eOYdrSSTN
X-Received: by 2002:a0c:df90:: with SMTP id w16-v6mr16850181qvl.31.1537173721490;
        Mon, 17 Sep 2018 01:42:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537173721; cv=none;
        d=google.com; s=arc-20160816;
        b=qS7N1+Xwq+Cvzz808RIvttXpEQRM4vxg1HM35Zxj6E3lI7Seh5+Xz9wR3RvD4Q49yX
         MKMrL5ZpOeDNJ9Eif9DGg8B/oeAnQEzbdcVYcbdL1Hf7kOaDpa98wTYqDmluhW+Vpp1q
         Wq2KGidjV+nCbA6tKygb7qXrMjrHz6y7S51FYX7XTToEn49Bk6N/dElyvS06ia4C4T6K
         KqO4JViF9MJaa0Cdx2E4amwQRoUpCrSQGnMkX51vXuXm8DoEwb0SDrZcIEV+ELE5K3zo
         6DgzzPz1/0Ndy/RdJmbCAXnoCpHoutgCg2z5LMcioOcZKllv/DlfFX/SStCoLUVMcqSM
         3U9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=eLAp4lORPdeAb18vvwHgmBI6Lz0l34xoQhwvLnqJexs=;
        b=aPyvV0gF/yKM3ydRDT88R/QuuHZsVTRt30Ua34URoQTQco/Lw2GenzGZWY4c6tDScy
         d8kLfF4ElCGamOZRfb7UqQeEL6PGkY1Fxbepe3F6mU82g56RIr7ceUug7CBKgZG4etDe
         Zs70c5ZlZ7VuGgqRKU2k6Qo7rS9BZ7C4UXGU0g+OvQOgQXUb6i+4gfQiG+DVGiv6lsqw
         xXahsJ153VMG4WjZG5RXwD6Zxp4NA9+vYICo5T2fVQYQpjYWxrXpQXtQDyIXj6/JuQPn
         hIqF/icldX1Yx6o87dvs/yvrcxA6Lf7iqRhcDosudAawUnFxkKs72Upu/sHaSVYQ55Sf
         3mCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qo7578kC;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KkK3J3W0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=TrTBEiyv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g28-v6si4069325qta.395.2018.09.17.01.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 01:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qo7578kC;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=KkK3J3W0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=TrTBEiyv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1p6W-0006Q1-V9
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 04:42:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5u-00069R-Vt
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5q-0005Wl-Px
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:22 -0400
Received: from greensocs.com ([193.104.36.180]:51752)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g1p5q-0005VV-BR; Mon, 17 Sep 2018 04:41:18 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 50EFF521ABB;
	Mon, 17 Sep 2018 10:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173673;
	bh=FU/ZIeWlr5yhKG/DHMFM7aS5cyJSf4R8YXtaT8ndAMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qo7578kC7WP2HPyvmA5SxFcBoz8bpp5lbUDGQrCxkcAdLrPXZyFwXIuNI4N0qYXRv
	rVD7CNGXL6HJrLZbLI0yp/HaAcnYOBLDb7147zSN6rJc0BEq2Zf//R9gXE5QGXvpP2
	WThnz7O9ngMwMxCpZFzdCX7S2/qc3e1r5Y7JoI5Q=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=KkK3J3W0;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=TrTBEiyv
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48JTWTnXTfxx; Mon, 17 Sep 2018 10:41:12 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 3B784443483; Mon, 17 Sep 2018 10:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173672;
	bh=FU/ZIeWlr5yhKG/DHMFM7aS5cyJSf4R8YXtaT8ndAMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KkK3J3W0O+sJ4yqgdS41NpLNByel5VJyOyJUFreowGiPrJKnuimg2ZTC53wmSbcFn
	zJGjg/Dnj/beCY32UMcEnF32UcAV8O/q8+xgUOj3pSbRCCwpKVb+5POaRp6TBE4A0O
	gnsiyOSTIEn7KOWNsYv6kc3q7XNnaWXJZgVc+hMg=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id AA4022387FF;
	Mon, 17 Sep 2018 10:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173671;
	bh=FU/ZIeWlr5yhKG/DHMFM7aS5cyJSf4R8YXtaT8ndAMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TrTBEiyv4MuXHt2OLi6FKEg07YNV9evxaLIXBsdZXkTRBt0cz3KI0PTaWoeuoeSBL
	r5rg8+F6TkVOaD2nPPaSf3a68zyZkPcBsAFuwEh9yoeI8W57MlrVCeVT+/3GomeWab
	ftJn+R9w04DQftCKtLTk8butdvym2oayPvz+LM3E=
From: damien.hedde@greensocs.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 10:40:15 +0200
Message-Id: <20180917084016.12750-10-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180917084016.12750-1-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 09/10] hw/char/cadence_uart: add clock support
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com, fred.konrad@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1IFpCHClCuIn

From: Damien Hedde <damien.hedde@greensocs.com>

Add bus interface and uart reference clock inputs.

Note: it is hard to find out from the doc what is the behavior when only one
of the clock is disabled and what does each clock domain reset.

Right now, register access needs both clock being active.

The bus interface control the mmios visibility. Its associated reset
does nothing apart from disabling the mmios.

The reference clock controls the baudrate generation. If it disabled,
any input characters and events are ignored. Also register accesses are
conditioned to the clock being enabled (but is it really the case in
reality ?) and a guest error is triggerred if that is not the case.
Its associated reset triggers the cadence_uart reset.

If theses clocks remains unconnected, the uart behaves as before.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/char/cadence_uart.h |  2 +
 hw/char/cadence_uart.c         | 73 ++++++++++++++++++++++++++++++++--
 hw/char/trace-events           |  3 ++
 3 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uart.h
index 118e3f10de..c6bb537adf 100644
--- a/include/hw/char/cadence_uart.h
+++ b/include/hw/char/cadence_uart.h
@@ -21,6 +21,7 @@
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
 #include "qemu/timer.h"
+#include "hw/clock-port.h"
 
 #define CADENCE_UART_RX_FIFO_SIZE           16
 #define CADENCE_UART_TX_FIFO_SIZE           16
@@ -47,6 +48,7 @@ typedef struct {
     CharBackend chr;
     qemu_irq irq;
     QEMUTimer *fifo_trigger_handle;
+    ClockState refclk;
 } CadenceUARTState;
 
 static inline DeviceState *cadence_uart_create(hwaddr addr,
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index fbdbd463bb..63a8c7108d 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -28,6 +28,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "hw/char/cadence_uart.h"
+#include "trace.h"
 
 #ifdef CADENCE_UART_ERR_DEBUG
 #define DB_PRINT(...) do { \
@@ -94,7 +95,7 @@
 #define LOCAL_LOOPBACK         (0x2 << UART_MR_CHMODE_SH)
 #define REMOTE_LOOPBACK        (0x3 << UART_MR_CHMODE_SH)
 
-#define UART_INPUT_CLK         50000000
+#define UART_DEFAULT_REF_CLK (50 * 1000 * 1000)
 
 #define R_CR       (0x00/4)
 #define R_MR       (0x04/4)
@@ -165,15 +166,30 @@ static void uart_send_breaks(CadenceUARTState *s)
                       &break_enabled);
 }
 
+static unsigned int uart_input_clk(CadenceUARTState *s)
+{
+    return clock_state_get_frequency(&s->refclk);
+}
+
 static void uart_parameters_setup(CadenceUARTState *s)
 {
     QEMUSerialSetParams ssp;
     unsigned int baud_rate, packet_size;
 
     baud_rate = (s->r[R_MR] & UART_MR_CLKS) ?
-            UART_INPUT_CLK / 8 : UART_INPUT_CLK;
+            uart_input_clk(s) / 8 : uart_input_clk(s);
+    baud_rate /= (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
+    trace_cadence_uart_baudrate(baud_rate);
+
+    ssp.speed = baud_rate;
+    if (ssp.speed == 0) {
+        /*
+         * Avoid division-by-zero below.
+         * TODO: find something better
+         */
+        ssp.speed = 1;
+    }
 
-    ssp.speed = baud_rate / (s->r[R_BRGR] * (s->r[R_BDIV] + 1));
     packet_size = 1;
 
     switch (s->r[R_MR] & UART_MR_PAR) {
@@ -337,6 +353,11 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
     CadenceUARTState *s = opaque;
     uint32_t ch_mode = s->r[R_MR] & UART_MR_CHMODE;
 
+    /* ignore characters when unclocked or reset */
+    if (!clock_state_is_domain_running(&s->refclk)) {
+        return;
+    }
+
     if (ch_mode == NORMAL_MODE || ch_mode == ECHO_MODE) {
         uart_write_rx_fifo(opaque, buf, size);
     }
@@ -350,6 +371,11 @@ static void uart_event(void *opaque, int event)
     CadenceUARTState *s = opaque;
     uint8_t buf = '\0';
 
+    /* ignore events when unclocked or reset */
+    if (!clock_state_is_domain_running(&s->refclk)) {
+        return;
+    }
+
     if (event == CHR_EVENT_BREAK) {
         uart_write_rx_fifo(opaque, &buf, 1);
     }
@@ -382,6 +408,14 @@ static void uart_write(void *opaque, hwaddr offset,
 {
     CadenceUARTState *s = opaque;
 
+    /* ignore accesses when ref clock is disabled */
+    if (!clock_state_is_domain_running(&s->refclk)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "cadence_uart: Trying to write register 0x%x"
+                " while clock is disabled/reset\n", (unsigned) offset);
+        return;
+    }
+
     DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
@@ -440,6 +474,14 @@ static uint64_t uart_read(void *opaque, hwaddr offset,
     CadenceUARTState *s = opaque;
     uint32_t c = 0;
 
+    /* ignore accesses when ref clock is disabled */
+    if (!clock_state_is_domain_running(&s->refclk)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                "cadence_uart: Trying to read register 0x%x"
+                " while clock is disabled/reset\n", (unsigned) offset);
+        return 0;
+    }
+
     offset >>= 2;
     if (offset >= CADENCE_UART_R_MAX) {
         c = 0;
@@ -488,6 +530,24 @@ static void cadence_uart_realize(DeviceState *dev, Error **errp)
                              uart_event, NULL, s, NULL, true);
 }
 
+static void cadence_uart_refclk_update(void *opaque, ClockState *clk)
+{
+    CadenceUARTState *s = opaque;
+
+    bool need_reset = clock_state_get_domain_reset(clk) &&
+        !clock_state_get_domain_reset(&s->refclk);
+
+    clock_state_copy(&s->refclk, clk);
+
+    /* reset state if clock domain reset is asserted */
+    if (need_reset) {
+        cadence_uart_reset(DEVICE(s));
+    }
+
+    /* recompute uart's speed on clock change */
+    uart_parameters_setup(s);
+}
+
 static void cadence_uart_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -497,6 +557,11 @@ static void cadence_uart_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
 
+    sysbus_init_bus_interface_clock(sbd, "busclk");
+    qdev_init_clock_in(DEVICE(obj), "refclk", cadence_uart_refclk_update, s);
+    /* initialize the frequency in case the clock remains unconnected */
+    s->refclk.frequency = UART_DEFAULT_REF_CLK;
+
     s->char_tx_time = (NANOSECONDS_PER_SECOND / 9600) * 10;
 }
 
@@ -548,7 +613,7 @@ static void cadence_uart_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_cadence_uart;
     dc->reset = cadence_uart_reset;
     dc->props = cadence_uart_properties;
-  }
+}
 
 static const TypeInfo cadence_uart_info = {
     .name          = TYPE_CADENCE_UART,
diff --git a/hw/char/trace-events b/hw/char/trace-events
index b64213d4dd..2ea25d1ea1 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -73,3 +73,6 @@ cmsdk_apb_uart_receive(uint8_t c) "CMSDK APB UART: got character 0x%x from backe
 cmsdk_apb_uart_tx_pending(void) "CMSDK APB UART: character send to backend pending"
 cmsdk_apb_uart_tx(uint8_t c) "CMSDK APB UART: character 0x%x sent to backend"
 cmsdk_apb_uart_set_params(int speed) "CMSDK APB UART: params set to %d 8N1"
+
+# hw/char/cadence_uart.c
+cadence_uart_baudrate(unsigned baudrate) "baudrate %u"
-- 
2.18.0

