Received: by 10.25.21.156 with SMTP id 28csp830555lfv;
        Wed, 3 Aug 2016 09:28:25 -0700 (PDT)
X-Received: by 10.200.49.14 with SMTP id g14mr845094qtb.23.1470241705131;
        Wed, 03 Aug 2016 09:28:25 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x32si5223467qta.101.2016.08.03.09.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Aug 2016 09:28:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUz1s-0000LU-Ah
	for alex.bennee@linaro.org; Wed, 03 Aug 2016 12:28:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywu-0004D2-0d
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywp-0006jN-M8
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bUywg-0006gZ-Qp; Wed, 03 Aug 2016 12:23:03 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 733594E320;
	Wed,  3 Aug 2016 16:23:02 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-7-219.ams2.redhat.com
	[10.36.7.219])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u73GMoal009808; Wed, 3 Aug 2016 12:23:00 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Aug 2016 17:22:39 +0100
Message-Id: <1470241360-3574-5-git-send-email-berrange@redhat.com>
In-Reply-To: <1470241360-3574-1-git-send-email-berrange@redhat.com>
References: <1470241360-3574-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 03 Aug 2016 16:23:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/5] hw: replace most use of qemu_chr_fe_write
 with qemu_chr_fe_write_all
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
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mep9eaihi1f3

The qemu_chr_fe_write method will return -1 on EAGAIN if the
chardev backend write would block. Almost no callers of the
qemu_chr_fe_write() method check the return value, instead
blindly assuming data was successfully sent. In most cases
this will lead to silent data loss on interactive consoles,
but in some cases (eg RNG EGD) it'll just cause corruption
of the protocol being spoken.

We unfortunately can't fix the virtio-console code, due to
a bug in the Linux guest drivers, which would cause the
entire Linux kernel to hang if we delay processing of the
incoming data in any way. Fixing this requires first fixing
the guest driver to not hold spinlocks while writing to the
hvc device backend.

Fixes bug: https://bugs.launchpad.net/qemu/+bug/1586756

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 backends/rng-egd.c          |  4 +++-
 gdbstub.c                   |  4 +++-
 hw/arm/omap2.c              |  8 +++++---
 hw/arm/pxa2xx.c             |  4 +++-
 hw/arm/strongarm.c          |  4 +++-
 hw/char/bcm2835_aux.c       |  4 +++-
 hw/char/debugcon.c          |  4 +++-
 hw/char/digic-uart.c        |  2 ++
 hw/char/escc.c              |  4 +++-
 hw/char/etraxfs_ser.c       |  4 +++-
 hw/char/exynos4210_uart.c   |  4 +++-
 hw/char/grlib_apbuart.c     |  4 +++-
 hw/char/imx_serial.c        |  4 +++-
 hw/char/ipoctal232.c        |  4 +++-
 hw/char/lm32_juart.c        |  2 ++
 hw/char/lm32_uart.c         |  2 ++
 hw/char/mcf_uart.c          |  4 +++-
 hw/char/parallel.c          |  4 +++-
 hw/char/pl011.c             |  4 +++-
 hw/char/sclpconsole-lm.c    |  4 +++-
 hw/char/sclpconsole.c       |  2 ++
 hw/char/sh_serial.c         |  4 +++-
 hw/char/spapr_vty.c         |  5 +++--
 hw/char/stm32f2xx_usart.c   |  2 ++
 hw/char/virtio-console.c    | 21 +++++++++++++++++++++
 hw/char/xilinx_uartlite.c   |  4 +++-
 hw/usb/ccid-card-passthru.c |  7 +++++--
 hw/usb/dev-serial.c         |  4 +++-
 slirp/slirp.c               |  4 +++-
 29 files changed, 104 insertions(+), 27 deletions(-)

diff --git a/backends/rng-egd.c b/backends/rng-egd.c
index 7a1b924..ba17c07 100644
--- a/backends/rng-egd.c
+++ b/backends/rng-egd.c
@@ -41,7 +41,9 @@ static void rng_egd_request_entropy(RngBackend *b, RngRequest *req)
         header[0] = 0x02;
         header[1] = len;
 
-        qemu_chr_fe_write(s->chr, header, sizeof(header));
+        /* XXX this blocks entire thread. Rewrite to use
+         * qemu_chr_fe_write and background I/O callbacks */
+        qemu_chr_fe_write_all(s->chr, header, sizeof(header));
 
         size -= len;
     }
diff --git a/gdbstub.c b/gdbstub.c
index 5da66f1..ecea8c4 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -402,7 +402,9 @@ static void put_buffer(GDBState *s, const uint8_t *buf, int len)
         }
     }
 #else
-    qemu_chr_fe_write(s->chr, buf, len);
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(s->chr, buf, len);
 #endif
 }
 
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 3a0d777..7e11c65 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -769,14 +769,16 @@ static void omap_sti_fifo_write(void *opaque, hwaddr addr,
 
     if (ch == STI_TRACE_CONTROL_CHANNEL) {
         /* Flush channel <i>value</i>.  */
-        qemu_chr_fe_write(s->chr, (const uint8_t *) "\r", 1);
+        /* XXX this blocks entire thread. Rewrite to use
+         * qemu_chr_fe_write and background I/O callbacks */
+        qemu_chr_fe_write_all(s->chr, (const uint8_t *) "\r", 1);
     } else if (ch == STI_TRACE_CONSOLE_CHANNEL || 1) {
         if (value == 0xc0 || value == 0xc3) {
             /* Open channel <i>ch</i>.  */
         } else if (value == 0x00)
-            qemu_chr_fe_write(s->chr, (const uint8_t *) "\n", 1);
+            qemu_chr_fe_write_all(s->chr, (const uint8_t *) "\n", 1);
         else
-            qemu_chr_fe_write(s->chr, &byte, 1);
+            qemu_chr_fe_write_all(s->chr, &byte, 1);
     }
 }
 
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index cb55704..0241e07 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1903,7 +1903,9 @@ static void pxa2xx_fir_write(void *opaque, hwaddr addr,
         else
             ch = ~value;
         if (s->chr && s->enable && (s->control[0] & (1 << 3)))	/* TXE */
-            qemu_chr_fe_write(s->chr, &ch, 1);
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
+            qemu_chr_fe_write_all(s->chr, &ch, 1);
         break;
     case ICSR0:
         s->status[0] &= ~(value & 0x66);
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index f1b2c6c..021cbf9 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -1108,7 +1108,9 @@ static void strongarm_uart_tx(void *opaque)
     if (s->utcr3 & UTCR3_LBM) /* loopback */ {
         strongarm_uart_receive(s, &s->tx_fifo[s->tx_start], 1);
     } else if (s->chr) {
-        qemu_chr_fe_write(s->chr, &s->tx_fifo[s->tx_start], 1);
+        /* XXX this blocks entire thread. Rewrite to use
+         * qemu_chr_fe_write and background I/O callbacks */
+        qemu_chr_fe_write_all(s->chr, &s->tx_fifo[s->tx_start], 1);
     }
 
     s->tx_start = (s->tx_start + 1) % 8;
diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
index 319f165..f7a845d 100644
--- a/hw/char/bcm2835_aux.c
+++ b/hw/char/bcm2835_aux.c
@@ -169,7 +169,9 @@ static void bcm2835_aux_write(void *opaque, hwaddr offset, uint64_t value,
         /* "DLAB bit set means access baudrate register" is NYI */
         ch = value;
         if (s->chr) {
-            qemu_chr_fe_write(s->chr, &ch, 1);
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
+            qemu_chr_fe_write_all(s->chr, &ch, 1);
         }
         break;
 
diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index e7f025e..4402033 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -60,7 +60,9 @@ static void debugcon_ioport_write(void *opaque, hwaddr addr, uint64_t val,
     printf(" [debugcon: write addr=0x%04" HWADDR_PRIx " val=0x%02" PRIx64 "]\n", addr, val);
 #endif
 
-    qemu_chr_fe_write(s->chr, &ch, 1);
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(s->chr, &ch, 1);
 }
 
 
diff --git a/hw/char/digic-uart.c b/hw/char/digic-uart.c
index c7604e6..e96a9b2 100644
--- a/hw/char/digic-uart.c
+++ b/hw/char/digic-uart.c
@@ -77,6 +77,8 @@ static void digic_uart_write(void *opaque, hwaddr addr, uint64_t value,
     switch (addr) {
     case R_TX:
         if (s->chr) {
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
             qemu_chr_fe_write_all(s->chr, &ch, 1);
         }
         break;
diff --git a/hw/char/escc.c b/hw/char/escc.c
index 31a5f90..aa17397 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -557,7 +557,9 @@ static void escc_mem_write(void *opaque, hwaddr addr,
         s->tx = val;
         if (s->wregs[W_TXCTRL2] & TXCTRL2_TXEN) { // tx enabled
             if (s->chr)
-                qemu_chr_fe_write(s->chr, &s->tx, 1);
+                /* XXX this blocks entire thread. Rewrite to use
+                 * qemu_chr_fe_write and background I/O callbacks */
+                qemu_chr_fe_write_all(s->chr, &s->tx, 1);
             else if (s->type == kbd && !s->disabled) {
                 handle_kbd_command(s, val);
             }
diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index 04ca04f..c99cc5d 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -126,7 +126,9 @@ ser_write(void *opaque, hwaddr addr,
     switch (addr)
     {
         case RW_DOUT:
-            qemu_chr_fe_write(s->chr, &ch, 1);
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
+            qemu_chr_fe_write_all(s->chr, &ch, 1);
             s->regs[R_INTR] |= 3;
             s->pending_tx = 1;
             s->regs[addr] = value;
diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 885ecc0..1107578 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -387,7 +387,9 @@ static void exynos4210_uart_write(void *opaque, hwaddr offset,
             s->reg[I_(UTRSTAT)] &= ~(UTRSTAT_TRANSMITTER_EMPTY |
                     UTRSTAT_Tx_BUFFER_EMPTY);
             ch = (uint8_t)val;
-            qemu_chr_fe_write(s->chr, &ch, 1);
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
+            qemu_chr_fe_write_all(s->chr, &ch, 1);
 #if DEBUG_Tx_DATA
             fprintf(stderr, "%c", ch);
 #endif
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index 871524c..778148a 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -203,7 +203,9 @@ static void grlib_apbuart_write(void *opaque, hwaddr addr,
         /* Transmit when character device available and transmitter enabled */
         if ((uart->chr) && (uart->control & UART_TRANSMIT_ENABLE)) {
             c = value & 0xFF;
-            qemu_chr_fe_write(uart->chr, &c, 1);
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
+            qemu_chr_fe_write_all(uart->chr, &c, 1);
             /* Generate interrupt */
             if (uart->control & UART_TRANSMIT_INTERRUPT) {
                 qemu_irq_pulse(uart->irq);
diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index 44856d6..5c3fa61 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -182,7 +182,9 @@ static void imx_serial_write(void *opaque, hwaddr offset,
         ch = value;
         if (s->ucr2 & UCR2_TXEN) {
             if (s->chr) {
-                qemu_chr_fe_write(s->chr, &ch, 1);
+                /* XXX this blocks entire thread. Rewrite to use
+                 * qemu_chr_fe_write and background I/O callbacks */
+                qemu_chr_fe_write_all(s->chr, &ch, 1);
             }
             s->usr1 &= ~USR1_TRDY;
             imx_update(s);
diff --git a/hw/char/ipoctal232.c b/hw/char/ipoctal232.c
index 9ead32a..2859fdd 100644
--- a/hw/char/ipoctal232.c
+++ b/hw/char/ipoctal232.c
@@ -360,7 +360,9 @@ static void io_write(IPackDevice *ip, uint8_t addr, uint16_t val)
             DPRINTF("Write THR%c (0x%x)\n", channel + 'a', reg);
             if (ch->dev) {
                 uint8_t thr = reg;
-                qemu_chr_fe_write(ch->dev, &thr, 1);
+                /* XXX this blocks entire thread. Rewrite to use
+                 * qemu_chr_fe_write and background I/O callbacks */
+                qemu_chr_fe_write_all(ch->dev, &thr, 1);
             }
         } else {
             DPRINTF("Write THR%c (0x%x), Tx disabled\n", channel + 'a', reg);
diff --git a/hw/char/lm32_juart.c b/hw/char/lm32_juart.c
index 28c2cf7..cb1ac76 100644
--- a/hw/char/lm32_juart.c
+++ b/hw/char/lm32_juart.c
@@ -76,6 +76,8 @@ void lm32_juart_set_jtx(DeviceState *d, uint32_t jtx)
 
     s->jtx = jtx;
     if (s->chr) {
+        /* XXX this blocks entire thread. Rewrite to use
+         * qemu_chr_fe_write and background I/O callbacks */
         qemu_chr_fe_write_all(s->chr, &ch, 1);
     }
 }
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
index b5c760d..be93697 100644
--- a/hw/char/lm32_uart.c
+++ b/hw/char/lm32_uart.c
@@ -178,6 +178,8 @@ static void uart_write(void *opaque, hwaddr addr,
     switch (addr) {
     case R_RXTX:
         if (s->chr) {
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
             qemu_chr_fe_write_all(s->chr, &ch, 1);
         }
         break;
diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index 3c0438f..c184859 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -114,7 +114,9 @@ static void mcf_uart_do_tx(mcf_uart_state *s)
 {
     if (s->tx_enabled && (s->sr & MCF_UART_TxEMP) == 0) {
         if (s->chr)
-            qemu_chr_fe_write(s->chr, (unsigned char *)&s->tb, 1);
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
+            qemu_chr_fe_write_all(s->chr, (unsigned char *)&s->tb, 1);
         s->sr |= MCF_UART_TxEMP;
     }
     if (s->tx_enabled) {
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index 11c78fe..66fe60e 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -128,7 +128,9 @@ parallel_ioport_write_sw(void *opaque, uint32_t addr, uint32_t val)
             if (val & PARA_CTR_STROBE) {
                 s->status &= ~PARA_STS_BUSY;
                 if ((s->control & PARA_CTR_STROBE) == 0)
-                    qemu_chr_fe_write(s->chr, &s->dataw, 1);
+                    /* XXX this blocks entire thread. Rewrite to use
+                     * qemu_chr_fe_write and background I/O callbacks */
+                    qemu_chr_fe_write_all(s->chr, &s->dataw, 1);
             } else {
                 if (s->control & PARA_CTR_INTEN) {
                     s->irq_pending = 1;
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c0fbf8a..786e605 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -146,7 +146,9 @@ static void pl011_write(void *opaque, hwaddr offset,
         /* ??? Check if transmitter is enabled.  */
         ch = value;
         if (s->chr)
-            qemu_chr_fe_write(s->chr, &ch, 1);
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
+            qemu_chr_fe_write_all(s->chr, &ch, 1);
         s->int_level |= PL011_INT_TX;
         pl011_update(s);
         break;
diff --git a/hw/char/sclpconsole-lm.c b/hw/char/sclpconsole-lm.c
index 8cb0026..8e1d74d 100644
--- a/hw/char/sclpconsole-lm.c
+++ b/hw/char/sclpconsole-lm.c
@@ -89,7 +89,9 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
     scon->buf[scon->length] = *buf;
     scon->length += 1;
     if (scon->echo) {
-        qemu_chr_fe_write(scon->chr, buf, size);
+        /* XXX this blocks entire thread. Rewrite to use
+         * qemu_chr_fe_write and background I/O callbacks */
+        qemu_chr_fe_write_all(scon->chr, buf, size);
     }
 }
 
diff --git a/hw/char/sclpconsole.c b/hw/char/sclpconsole.c
index d224648..a75ad4f 100644
--- a/hw/char/sclpconsole.c
+++ b/hw/char/sclpconsole.c
@@ -168,6 +168,8 @@ static ssize_t write_console_data(SCLPEvent *event, const uint8_t *buf,
         return len;
     }
 
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
     return qemu_chr_fe_write_all(scon->chr, buf, len);
 }
 
diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 4c55dcb..97ce562 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -111,7 +111,9 @@ static void sh_serial_write(void *opaque, hwaddr offs,
     case 0x0c: /* FTDR / TDR */
         if (s->chr) {
             ch = val;
-            qemu_chr_fe_write(s->chr, &ch, 1);
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
+            qemu_chr_fe_write_all(s->chr, &ch, 1);
 	}
 	s->dr = val;
 	s->flags &= ~SH_SERIAL_FLAG_TDE;
diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
index 3498d7b..9aeafc0 100644
--- a/hw/char/spapr_vty.c
+++ b/hw/char/spapr_vty.c
@@ -60,8 +60,9 @@ void vty_putchars(VIOsPAPRDevice *sdev, uint8_t *buf, int len)
 {
     VIOsPAPRVTYDevice *dev = VIO_SPAPR_VTY_DEVICE(sdev);
 
-    /* FIXME: should check the qemu_chr_fe_write() return value */
-    qemu_chr_fe_write(dev->chardev, buf, len);
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(dev->chardev, buf, len);
 }
 
 static void spapr_vty_realize(VIOsPAPRDevice *sdev, Error **errp)
diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
index 15657ab..4c6640d 100644
--- a/hw/char/stm32f2xx_usart.c
+++ b/hw/char/stm32f2xx_usart.c
@@ -153,6 +153,8 @@ static void stm32f2xx_usart_write(void *opaque, hwaddr addr,
         if (value < 0xF000) {
             ch = value;
             if (s->chr) {
+                /* XXX this blocks entire thread. Rewrite to use
+                 * qemu_chr_fe_write and background I/O callbacks */
                 qemu_chr_fe_write_all(s->chr, &ch, 1);
             }
             s->usart_sr |= USART_SR_TC;
diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
index 4f0e03d..d44c18c 100644
--- a/hw/char/virtio-console.c
+++ b/hw/char/virtio-console.c
@@ -68,6 +68,27 @@ static ssize_t flush_buf(VirtIOSerialPort *port,
          */
         if (ret < 0)
             ret = 0;
+
+        /* XXX we should be queuing data to send later for the
+         * console devices too rather than silently dropping
+         * console data on EAGAIN. The Linux virtio-console
+         * hvc driver though does sends with spinlocks held,
+         * so if we enable throttling that'll stall the entire
+         * guest kernel, not merely the process writing to the
+         * console.
+         *
+         * While we could queue data for later write without
+         * enabling throttling, this would result in the guest
+         * being able to trigger arbitrary memory usage in QEMU
+         * buffering data for later writes.
+         *
+         * So fixing this problem likely requires fixing the
+         * Linux virtio-console hvc driver to not hold spinlocks
+         * while writing, and instead merely block the process
+         * that's writing. QEMU would then need some way to detect
+         * if the guest had the fixed driver too, before we can
+         * use throttling on host side.
+         */
         if (!k->is_console) {
             virtio_serial_throttle_port(port, true);
             if (!vcon->watch) {
diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 4847efb..3766dc2 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -144,7 +144,9 @@ uart_write(void *opaque, hwaddr addr,
 
         case R_TX:
             if (s->chr)
-                qemu_chr_fe_write(s->chr, &ch, 1);
+                /* XXX this blocks entire thread. Rewrite to use
+                 * qemu_chr_fe_write and background I/O callbacks */
+                qemu_chr_fe_write_all(s->chr, &ch, 1);
 
             s->regs[addr] = value;
 
diff --git a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
index c0e90e5..2eacea7 100644
--- a/hw/usb/ccid-card-passthru.c
+++ b/hw/usb/ccid-card-passthru.c
@@ -75,8 +75,11 @@ static void ccid_card_vscard_send_msg(PassthruState *s,
     scr_msg_header.type = htonl(type);
     scr_msg_header.reader_id = htonl(reader_id);
     scr_msg_header.length = htonl(length);
-    qemu_chr_fe_write(s->cs, (uint8_t *)&scr_msg_header, sizeof(VSCMsgHeader));
-    qemu_chr_fe_write(s->cs, payload, length);
+    /* XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks */
+    qemu_chr_fe_write_all(s->cs, (uint8_t *)&scr_msg_header,
+                          sizeof(VSCMsgHeader));
+    qemu_chr_fe_write_all(s->cs, payload, length);
 }
 
 static void ccid_card_vscard_send_apdu(PassthruState *s,
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index ba8538e..966ad84 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -366,7 +366,9 @@ static void usb_serial_handle_data(USBDevice *dev, USBPacket *p)
             goto fail;
         for (i = 0; i < p->iov.niov; i++) {
             iov = p->iov.iov + i;
-            qemu_chr_fe_write(s->cs, iov->iov_base, iov->iov_len);
+            /* XXX this blocks entire thread. Rewrite to use
+             * qemu_chr_fe_write and background I/O callbacks */
+            qemu_chr_fe_write_all(s->cs, iov->iov_base, iov->iov_len);
         }
         p->actual_length = p->iov.size;
         break;
diff --git a/slirp/slirp.c b/slirp/slirp.c
index 7eb183d..49c6c95 100644
--- a/slirp/slirp.c
+++ b/slirp/slirp.c
@@ -1072,7 +1072,9 @@ int slirp_add_exec(Slirp *slirp, int do_pty, const void *args,
 ssize_t slirp_send(struct socket *so, const void *buf, size_t len, int flags)
 {
     if (so->s == -1 && so->extra) {
-        qemu_chr_fe_write(so->extra, buf, len);
+        /* XXX this blocks entire thread. Rewrite to use
+         * qemu_chr_fe_write and background I/O callbacks */
+        qemu_chr_fe_write_all(so->extra, buf, len);
         return len;
     }
 
-- 
2.7.4

