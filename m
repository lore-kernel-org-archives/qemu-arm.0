Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp622756lff;
        Sat, 18 Jan 2020 08:46:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqw3+U6HnGBfN0k/Konjcc0pF9fxN5Ssb/L7Dunu+jDiworpfVe0zCJWxuZ3fQtDWBchSsui
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr9875057edr.57.1579365966729;
        Sat, 18 Jan 2020 08:46:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579365966; cv=none;
        d=google.com; s=arc-20160816;
        b=qaR6M1SuvqOQFvXlNu0/ItDPqXOoTCFLxd735ARfSJcSBSJhp6Rifl8T9kF4zmw92Z
         hCxdGgebIQYspGjnSW/kE868o6fs7Ric/oGOIcdupGdt2K7HuR9lnIPa8eNBIK3/ERJ7
         S+1i1GCswrhmiF/V2p4ar9G/O2UUqUKLMiwNLFy5sCl+jur6A42oXgC2Afln21LgRPCe
         bx5PDIJHCXgSm5UDI/ZYD0Qsh1Q54oCgWdgiqNDBQaS8XrZqQqdgK+vLirfLWGgDFiHr
         6YCuHUyUIKGaCOusWI8m7OiKGSVaMuJF7t8MYrChkTenZ8ftkljzqdO5qQ8aj1TUj4D5
         aSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=td1yGNfjfUpZYYkn6uLD6QjKcoSaUeLpRJm2pQ2sVF0=;
        b=Olr3vLCp4BSJS3aWM4I1UWMM4O8qopzrxgiLnvqOgzJsJwqmcD+su04mD6+9PMxFbB
         RWXY6SrEC4i0ZA6VKWnHk4oPRpt+FLU3uM+4A6oohVv6gfSd6U7ejVxrlP5HmktvOs2F
         MESHtyOEquFRMn5iMgJZerFPJru/qQJNVOdcd+5aKfrK3ous9kPo5tNIZoq4MVxSyG5+
         kCeywqPVBLCCQ3FbuIUzZ0/j8w7z+VapXgZ0Ug9NkXYIqZPvqmwEv4ffNCH/V9mk/YmJ
         QrsGJhgwsBRLwJj6+Rh3+k0o0A9mJBUjpSefZQTTOFhWLhUOLjebrkAVKG4LB1E5r111
         LAuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ca4FcaZb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si18005354ejr.195.2020.01.18.08.46.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 08:46:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ca4FcaZb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isrEb-0000KD-2X
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 11:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1isrBM-00047W-F8
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 11:42:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1isrBK-0002Cc-N3
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 11:42:44 -0500
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:36335)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1isrBK-0002C9-Hg; Sat, 18 Jan 2020 11:42:42 -0500
Received: by mail-yw1-xc44.google.com with SMTP id n184so15871828ywc.3;
 Sat, 18 Jan 2020 08:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=td1yGNfjfUpZYYkn6uLD6QjKcoSaUeLpRJm2pQ2sVF0=;
 b=ca4FcaZb5GX65G3hmHJPY1QlbOvNrOHwT1dnJqlXa/LF3/ovvLiY3yAJOPZVZok7EI
 pKirS/6AdRtlrQTtttckovGbhDz0qwOkK3QnVsqZ0Ut40HaAvAPxrqs2G/BfDaj4SP2z
 toc7hFXuPVgOSuMEAfdkSkI1H1Iv6Jg8Xn/ywGbAji53kYLQD+nSFQx80ztA+2+wYpRQ
 zYCou7+NC1I4avbhzrk8oo8GQ9c+OaKOhwJtktUMvNL7PsroLmaRM0ZQHWKjT032TvfE
 Ra5LFkURtfFhT4X53jmNgsqiodixrRbA4COuyo/pvIb8g+fwTkrG6BU4YFl9us0YtPbx
 J65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=td1yGNfjfUpZYYkn6uLD6QjKcoSaUeLpRJm2pQ2sVF0=;
 b=FDFrxvwd82F6F7NsU15fM6Kbb4BmB7n+wAM7VGrIPvcO3jjxFjRm4PYFvHWu2wwoEr
 ApP4C1vJaSdByXuwjIHC5HW2RvxI0YyE9R4wyWzqXh93M4SUt0mGcCYggzk4QCaobpLk
 qIMi1KQJyaOy1xjmFWou53KQNfZGcyQ6H/pAn8h4gaclJ8PN/Uy10r70HK3ArllkfQEb
 628f/An8Yj4NfSp3tPsHd/YsnvBGO5diTaHhK4I1DiER5aIQA2gJNCQTiKMmuudnK/qZ
 uavrYtjJJDdcmWDSIcjBrQo06I7/fK7KYBrZ9DhhDBqDy184GQ+tE5062fczDlTdhYMA
 FuOA==
X-Gm-Message-State: APjAAAXCYCGaPDbGWraylawUMOiOsFpbPuh1yRlcOIEiANyp07mM29mQ
 SeHQhWpv8OpLGB2/XEJ01ek=
X-Received: by 2002:a0d:f106:: with SMTP id a6mr29070376ywf.318.1579365761873; 
 Sat, 18 Jan 2020 08:42:41 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h203sm12623797ywb.98.2020.01.18.08.42.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 Jan 2020 08:42:41 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 5/7] hw/char/exynos4210_uart: Implement Rx FIFO level
 triggers and timeouts
Date: Sat, 18 Jan 2020 08:42:27 -0800
Message-Id: <20200118164229.22539-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200118164229.22539-1-linux@roeck-us.net>
References: <20200118164229.22539-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q/5n2Outha4+

The driver already implements a receive FIFO, but it does not
handle receive FIFO trigger levels and timeout. Implement the
missing functionality.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Call exynos4210_uart_rx_timeout_set() from new post_load function
    to set the receive timeout timer.
    Add timer to vmstate_exynos4210_uart.

 hw/char/exynos4210_uart.c | 122 ++++++++++++++++++++++++++++++--------
 hw/char/trace-events      |   3 +-
 2 files changed, 99 insertions(+), 26 deletions(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 5d48701b6d..63ea9663f2 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -24,6 +24,7 @@
 #include "migration/vmstate.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qemu/timer.h"
 #include "chardev/char-fe.h"
 #include "chardev/char-serial.h"
 
@@ -118,6 +119,7 @@ static const Exynos4210UartReg exynos4210_uart_regs[] = {
 #define ULCON_STOP_BIT_SHIFT  1
 
 /* UART Tx/Rx Status */
+#define UTRSTAT_Rx_TIMEOUT              0x8
 #define UTRSTAT_TRANSMITTER_EMPTY       0x4
 #define UTRSTAT_Tx_BUFFER_EMPTY         0x2
 #define UTRSTAT_Rx_BUFFER_DATA_READY    0x1
@@ -147,6 +149,9 @@ typedef struct Exynos4210UartState {
     Exynos4210UartFIFO   rx;
     Exynos4210UartFIFO   tx;
 
+    QEMUTimer *fifo_timeout_timer;
+    uint64_t wordtime;        /* word time in ns */
+
     CharBackend       chr;
     qemu_irq          irq;
 
@@ -209,15 +214,12 @@ static void fifo_reset(Exynos4210UartFIFO *q)
     q->rp = 0;
 }
 
-static uint32_t exynos4210_uart_Tx_FIFO_trigger_level(const Exynos4210UartState *s)
+static uint32_t exynos4210_uart_FIFO_trigger_level(uint32_t channel,
+                                                   uint32_t reg)
 {
-    uint32_t level = 0;
-    uint32_t reg;
+    uint32_t level;
 
-    reg = (s->reg[I_(UFCON)] & UFCON_Tx_FIFO_TRIGGER_LEVEL) >>
-            UFCON_Tx_FIFO_TRIGGER_LEVEL_SHIFT;
-
-    switch (s->channel) {
+    switch (channel) {
     case 0:
         level = reg * 32;
         break;
@@ -231,12 +233,34 @@ static uint32_t exynos4210_uart_Tx_FIFO_trigger_level(const Exynos4210UartState
         break;
     default:
         level = 0;
-        trace_exynos_uart_channel_error(s->channel);
+        trace_exynos_uart_channel_error(channel);
+        break;
     }
-
     return level;
 }
 
+static uint32_t
+exynos4210_uart_Tx_FIFO_trigger_level(const Exynos4210UartState *s)
+{
+    uint32_t reg;
+
+    reg = (s->reg[I_(UFCON)] & UFCON_Tx_FIFO_TRIGGER_LEVEL) >>
+            UFCON_Tx_FIFO_TRIGGER_LEVEL_SHIFT;
+
+    return exynos4210_uart_FIFO_trigger_level(s->channel, reg);
+}
+
+static uint32_t
+exynos4210_uart_Rx_FIFO_trigger_level(const Exynos4210UartState *s)
+{
+    uint32_t reg;
+
+    reg = ((s->reg[I_(UFCON)] & UFCON_Rx_FIFO_TRIGGER_LEVEL) >>
+            UFCON_Rx_FIFO_TRIGGER_LEVEL_SHIFT) + 1;
+
+    return exynos4210_uart_FIFO_trigger_level(s->channel, reg);
+}
+
 static void exynos4210_uart_update_irq(Exynos4210UartState *s)
 {
     /*
@@ -244,13 +268,25 @@ static void exynos4210_uart_update_irq(Exynos4210UartState *s)
      * transmit FIFO is smaller than the trigger level.
      */
     if (s->reg[I_(UFCON)] & UFCON_FIFO_ENABLE) {
-
         uint32_t count = (s->reg[I_(UFSTAT)] & UFSTAT_Tx_FIFO_COUNT) >>
                 UFSTAT_Tx_FIFO_COUNT_SHIFT;
 
         if (count <= exynos4210_uart_Tx_FIFO_trigger_level(s)) {
             s->reg[I_(UINTSP)] |= UINTSP_TXD;
         }
+
+        /*
+         * Rx interrupt if trigger level is reached or if rx timeout
+         * interrupt is disabled and there is data in the receive buffer
+         */
+        count = fifo_elements_number(&s->rx);
+        if ((count && !(s->reg[I_(UCON)] & 0x80)) ||
+            count >= exynos4210_uart_Rx_FIFO_trigger_level(s)) {
+            s->reg[I_(UINTSP)] |= UINTSP_RXD;
+            timer_del(s->fifo_timeout_timer);
+        }
+    } else if (s->reg[I_(UTRSTAT)] & UTRSTAT_Rx_BUFFER_DATA_READY) {
+        s->reg[I_(UINTSP)] |= UINTSP_RXD;
     }
 
     s->reg[I_(UINTP)] = s->reg[I_(UINTSP)] & ~s->reg[I_(UINTM)];
@@ -264,6 +300,21 @@ static void exynos4210_uart_update_irq(Exynos4210UartState *s)
     }
 }
 
+static void exynos4210_uart_timeout_int(void *opaque)
+{
+    Exynos4210UartState *s = opaque;
+
+    trace_exynos_uart_rx_timeout(s->channel, s->reg[I_(UTRSTAT)],
+                                 s->reg[I_(UINTSP)]);
+
+    if ((s->reg[I_(UTRSTAT)] & UTRSTAT_Rx_BUFFER_DATA_READY) ||
+        (s->reg[I_(UCON)] & (1 << 11))) {
+        s->reg[I_(UINTSP)] |= UINTSP_RXD;
+        s->reg[I_(UTRSTAT)] |= UTRSTAT_Rx_TIMEOUT;
+        exynos4210_uart_update_irq(s);
+    }
+}
+
 static void exynos4210_uart_update_parameters(Exynos4210UartState *s)
 {
     int speed, parity, data_bits, stop_bits;
@@ -302,10 +353,24 @@ static void exynos4210_uart_update_parameters(Exynos4210UartState *s)
     ssp.data_bits = data_bits;
     ssp.stop_bits = stop_bits;
 
+    s->wordtime = NANOSECONDS_PER_SECOND * (data_bits + stop_bits + 1) / speed;
+
     qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
 
     trace_exynos_uart_update_params(
-                s->channel, speed, parity, data_bits, stop_bits);
+                s->channel, speed, parity, data_bits, stop_bits, s->wordtime);
+}
+
+static void exynos4210_uart_rx_timeout_set(Exynos4210UartState *s)
+{
+    if (s->reg[I_(UCON)] & 0x80) {
+        uint32_t timeout = ((s->reg[I_(UCON)] >> 12) & 0x0f) * s->wordtime;
+
+        timer_mod(s->fifo_timeout_timer,
+                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + timeout);
+    } else {
+        timer_del(s->fifo_timeout_timer);
+    }
 }
 
 static void exynos4210_uart_write(void *opaque, hwaddr offset,
@@ -361,6 +426,10 @@ static void exynos4210_uart_write(void *opaque, hwaddr offset,
         exynos4210_uart_update_irq(s);
         break;
     case UTRSTAT:
+        if (val & UTRSTAT_Rx_TIMEOUT) {
+            s->reg[I_(UTRSTAT)] &= ~UTRSTAT_Rx_TIMEOUT;
+        }
+        break;
     case UERSTAT:
     case UFSTAT:
     case UMSTAT:
@@ -376,12 +445,17 @@ static void exynos4210_uart_write(void *opaque, hwaddr offset,
         exynos4210_uart_update_irq(s);
         break;
     case UCON:
+        s->reg[I_(UCON)] = val;
+        exynos4210_uart_rx_timeout_set(s);
+        exynos4210_uart_update_irq(s);
+        break;
     case UMCON:
     default:
         s->reg[I_(offset)] = val;
         break;
     }
 }
+
 static uint64_t exynos4210_uart_read(void *opaque, hwaddr offset,
                                   unsigned size)
 {
@@ -461,7 +535,6 @@ static int exynos4210_uart_can_receive(void *opaque)
     return fifo_empty_elements_number(&s->rx);
 }
 
-
 static void exynos4210_uart_receive(void *opaque, const uint8_t *buf, int size)
 {
     Exynos4210UartState *s = (Exynos4210UartState *)opaque;
@@ -469,24 +542,17 @@ static void exynos4210_uart_receive(void *opaque, const uint8_t *buf, int size)
 
     if (s->reg[I_(UFCON)] & UFCON_FIFO_ENABLE) {
         if (fifo_empty_elements_number(&s->rx) < size) {
-            for (i = 0; i < fifo_empty_elements_number(&s->rx); i++) {
-                fifo_store(&s->rx, buf[i]);
-            }
+            size = fifo_empty_elements_number(&s->rx);
             s->reg[I_(UINTSP)] |= UINTSP_ERROR;
-            s->reg[I_(UTRSTAT)] |= UTRSTAT_Rx_BUFFER_DATA_READY;
-        } else {
-            for (i = 0; i < size; i++) {
-                fifo_store(&s->rx, buf[i]);
-            }
-            s->reg[I_(UTRSTAT)] |= UTRSTAT_Rx_BUFFER_DATA_READY;
         }
-        /* XXX: Around here we maybe should check Rx trigger level */
-        s->reg[I_(UINTSP)] |= UINTSP_RXD;
+        for (i = 0; i < size; i++) {
+            fifo_store(&s->rx, buf[i]);
+        }
+        exynos4210_uart_rx_timeout_set(s);
     } else {
         s->reg[I_(URXH)] = buf[0];
-        s->reg[I_(UINTSP)] |= UINTSP_RXD;
-        s->reg[I_(UTRSTAT)] |= UTRSTAT_Rx_BUFFER_DATA_READY;
     }
+    s->reg[I_(UTRSTAT)] |= UTRSTAT_Rx_BUFFER_DATA_READY;
 
     exynos4210_uart_update_irq(s);
 }
@@ -527,6 +593,7 @@ static int exynos4210_uart_post_load(void *opaque, int version_id)
     Exynos4210UartState *s = (Exynos4210UartState *)opaque;
 
     exynos4210_uart_update_parameters(s);
+    exynos4210_uart_rx_timeout_set(s);
 
     return 0;
 }
@@ -553,6 +620,7 @@ static const VMStateDescription vmstate_exynos4210_uart = {
                        vmstate_exynos4210_uart_fifo, Exynos4210UartFIFO),
         VMSTATE_UINT32_ARRAY(reg, Exynos4210UartState,
                              EXYNOS4210_UART_REGS_MEM_SIZE / sizeof(uint32_t)),
+        VMSTATE_TIMER_PTR(fifo_timeout_timer, Exynos4210UartState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -588,6 +656,10 @@ static void exynos4210_uart_init(Object *obj)
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     Exynos4210UartState *s = EXYNOS4210_UART(dev);
 
+    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                         exynos4210_uart_timeout_int, s);
+    s->wordtime = NANOSECONDS_PER_SECOND * 10 / 9600;
+
     /* memory mapping */
     memory_region_init_io(&s->iomem, obj, &exynos4210_uart_ops, s,
                           "exynos4210.uart", EXYNOS4210_UART_REGS_MEM_SIZE);
diff --git a/hw/char/trace-events b/hw/char/trace-events
index ba28b45b53..cb73fee6a9 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -81,7 +81,7 @@ nrf51_uart_write(uint64_t addr, uint64_t value, unsigned int size) "addr 0x%" PR
 # exynos4210_uart.c
 exynos_uart_irq_raised(uint32_t channel, uint32_t reg) "UART%d: IRQ raised: 0x%08"PRIx32
 exynos_uart_irq_lowered(uint32_t channel) "UART%d: IRQ lowered"
-exynos_uart_update_params(uint32_t channel, int speed, uint8_t parity, int data, int stop) "UART%d: speed: %d, parity: %c, data bits: %d, stop bits: %d"
+exynos_uart_update_params(uint32_t channel, int speed, uint8_t parity, int data, int stop, uint64_t wordtime) "UART%d: speed: %d, parity: %c, data bits: %d, stop bits: %d wordtime: %"PRId64"ns"
 exynos_uart_write(uint32_t channel, uint32_t offset, const char *name, uint64_t val) "UART%d: <0x%04x> %s <- 0x%" PRIx64
 exynos_uart_read(uint32_t channel, uint32_t offset, const char *name, uint64_t val) "UART%d: <0x%04x> %s -> 0x%" PRIx64
 exynos_uart_rx_fifo_reset(uint32_t channel) "UART%d: Rx FIFO Reset"
@@ -94,3 +94,4 @@ exynos_uart_rx_error(uint32_t channel) "UART%d: Rx error"
 exynos_uart_wo_read(uint32_t channel, const char *name, uint32_t reg) "UART%d: Trying to read from WO register: %s [0x%04"PRIx32"]"
 exynos_uart_rxsize(uint32_t channel, uint32_t size) "UART%d: Rx FIFO size: %d"
 exynos_uart_channel_error(uint32_t channel) "Wrong UART channel number: %d"
+exynos_uart_rx_timeout(uint32_t channel, uint32_t stat, uint32_t intsp) "UART%d: Rx timeout stat=0x%x intsp=0x%x"
-- 
2.17.1

