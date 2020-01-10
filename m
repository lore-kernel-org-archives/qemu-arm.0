Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1175302lff;
        Fri, 10 Jan 2020 12:41:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqyTcLTz6FLxOdciUCR/54pHIMThNTlMHhnEl/XGHWhcyiuNl+7i2qqf8r/Ft5FVB0736Gub
X-Received: by 2002:ac8:342c:: with SMTP id u41mr4218260qtb.86.1578688871178;
        Fri, 10 Jan 2020 12:41:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578688871; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNgGRPGfJXx2fWrbJMIlOy+qkjhEc0cuiEsvRfYU8eMKENdxRUvjzFBEgAEH+b1b/l
         yKLkZ0W77zQ3do3t17G/wbqaTW3XkDp3UoVKUAXmWnIdTH74gN7pOKESgNFYVS+wylfE
         lX/muYCOKPAeC/mqywae9QsOvRZCe/dTxL3l0bvx29Sx7VK6GyEoIHcNqXwK/cQYt571
         Lib/FqX0hoBowmz2oCfPhvak55O/iwlvkWnQeHZWsvWhoOIBElQTy/9HZuZbmcUiZPmM
         jXVAtsu2sKZKiUyErHdOVS8LmDMEZNqgsUqWNd9JPA08S5EHqiaSj9jzwnWBZ045Sccc
         J/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=QqaH3pXRjjA0Ik+eBsaT6RsaZ2EEjfEu0olkmdpV/O4=;
        b=mofpxNKWhhp+qxU48+o9eqBU2zze5Ff/mslLr6wHcL+ZgV9cbgVqu8LbdwqDklMOqI
         KTA9ECXDn2gXjBb8ST/A+RjqawMir4hPsAqZcmD4veFNQBo97s+tOz7OTSrPep8zRK/7
         X60rnCcCkjySLLEoZi67CM0l0663/efD4RTJP4PD9ytqyGasn07Lck6FTeMaRW7Ltcui
         qIuTBwN+9WIw/fsBHD6povyeKmRN3ht4uWhn2OKWu73T28gQagZZx6PgqqJx5s6ksiN0
         ShKElLYnFIz1tx9KxGQd4Jxkgh0f3+SFm5iwMzlSQvPmTNlruzEtsUkl+zYnIvlo2rFo
         oFqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BTmQdRVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y64si2021468qkb.374.2020.01.10.12.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 12:41:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BTmQdRVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iq15i-0001a3-5t
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 15:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33711)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iq14U-0000YQ-5Y
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 15:39:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iq14S-00070B-C8
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 15:39:54 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45982)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iq14S-0006yW-4h; Fri, 10 Jan 2020 15:39:52 -0500
Received: by mail-pg1-x542.google.com with SMTP id b9so1504869pgk.12;
 Fri, 10 Jan 2020 12:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QqaH3pXRjjA0Ik+eBsaT6RsaZ2EEjfEu0olkmdpV/O4=;
 b=BTmQdRVmU0zKsOg0YFA5fFWy1g2uFPTS4J0cxFuMVYTxkmEgSvt7EORZFYlZMQeZYn
 Jjhuk9vu1qyFajPvusoqQBr1Rrg6ybCdUaVPkzezF6wMef/qfQdN12OKStyo/8s6QDvB
 MKQ7yDIJFJbNZ5t13LpAjLQMDjdGtzuHi9MmWBy4wbr76fOINzacx+3x2GE/obs5NPNE
 SOTTxArS3Z9TvS8EuZ3Zdakr51jcHXFHzMKXX1cAe2k+PFjlmB8XqY4kpyfW3U9TkoYg
 NAf/NFJGOqlfcJ7U2YZA08FRCAy8b/b6meUTS+09kHD0Y8dnrSMVafFUTcOcL4xrcz2d
 /EBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=QqaH3pXRjjA0Ik+eBsaT6RsaZ2EEjfEu0olkmdpV/O4=;
 b=gzm2GjpMZ/ejQ4n6U46yNNJeuwAA/ZfXieTW/3T4T3rqSQmZBsUswK4FLr7XqPJrtd
 zDuwY1ZS/aFde9bA+eOneWBLxS2D/EidbXyB5KMnCH9n76IXgtQpfINWfQBDTwKWaFTY
 78j/m/84rch9FR5qmYCR+hBXL0/HWHI4EabF2/Agvt0qZ0jOY9lnd879dqbrDbM59GLt
 XPKy7UnjYSHI2uZFhNekUHaT+J0EYgaviSevfj7Sj95ym+pe7IE5Rt0FGDJU/v8xiugV
 /2hYUP4RDovT/ynzj95PJ81x6VOUWzFnRE3NwL75yHOkSuzPAPMo66+fR9BP5idgcz0z
 9vIg==
X-Gm-Message-State: APjAAAVscWhsWE1PPufDRk6YUXrBLlUZms+hvDkMmWQZMKpKoEonu7mM
 nd7PmHbZO/EWPV4TcZjGoik+/zpk
X-Received: by 2002:aa7:8ad9:: with SMTP id b25mr6181713pfd.70.1578688791301; 
 Fri, 10 Jan 2020 12:39:51 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 83sm3742383pgh.12.2020.01.10.12.39.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 Jan 2020 12:39:50 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>
Subject: [PATCH 4/6] hw/char/exynos4210_uart: Implement receive FIFO
Date: Fri, 10 Jan 2020 12:39:40 -0800
Message-Id: <20200110203942.5745-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110203942.5745-1-linux@roeck-us.net>
References: <20200110203942.5745-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lXDuRnw4JHqq

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/char/exynos4210_uart.c | 120 ++++++++++++++++++++++++++++++--------
 hw/char/trace-events      |   3 +-
 2 files changed, 97 insertions(+), 26 deletions(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index fb7a3ebd09..61134a7bdc 100644
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
@@ -578,6 +644,10 @@ static void exynos4210_uart_init(Object *obj)
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

