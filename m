Received: by 10.80.166.35 with SMTP id d32csp659366edc;
        Wed, 12 Oct 2016 10:54:55 -0700 (PDT)
X-Received: by 10.55.91.197 with SMTP id p188mr2329269qkb.82.1476294895428;
        Wed, 12 Oct 2016 10:54:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p32si4427193qte.131.2016.10.12.10.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 10:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buNjy-00072l-Sc
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 13:54:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1buNjt-00070J-CS
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 13:54:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1buNjr-000332-6R
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 13:54:48 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1buNjq-00030L-UN; Wed, 12 Oct 2016 13:54:47 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1buNjk-0001tQ-F2; Wed, 12 Oct 2016 18:54:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 12 Oct 2016 18:54:36 +0100
Message-Id: <1476294876-12340-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476294876-12340-1-git-send-email-peter.maydell@linaro.org>
References: <1476294876-12340-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 4/4] hw/char/pl011: Add trace events
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
X-TUID: XVAwTqSl4Hwb

Add some trace events for the pl011 UART model.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c      | 71 ++++++++++++++++++++++++++++++++++++----------------
 hw/char/trace-events |  9 +++++++
 2 files changed, 59 insertions(+), 21 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 786e605..1a7911f 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -11,6 +11,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/char.h"
 #include "qemu/log.h"
+#include "trace.h"
 
 #define TYPE_PL011 "pl011"
 #define PL011(obj) OBJECT_CHECK(PL011State, (obj), TYPE_PL011)
@@ -58,6 +59,7 @@ static void pl011_update(PL011State *s)
     uint32_t flags;
 
     flags = s->int_level & s->int_enabled;
+    trace_pl011_irq_state(flags != 0);
     qemu_set_irq(s->irq, flags != 0);
 }
 
@@ -66,10 +68,8 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
 {
     PL011State *s = (PL011State *)opaque;
     uint32_t c;
+    uint64_t r;
 
-    if (offset >= 0xfe0 && offset < 0x1000) {
-        return s->id[(offset - 0xfe0) >> 2];
-    }
     switch (offset >> 2) {
     case 0: /* UARTDR */
         s->flags &= ~PL011_FLAG_RXFF;
@@ -84,41 +84,62 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
         }
         if (s->read_count == s->read_trigger - 1)
             s->int_level &= ~ PL011_INT_RX;
+        trace_pl011_read_fifo(s->read_count);
         s->rsr = c >> 8;
         pl011_update(s);
         if (s->chr) {
             qemu_chr_accept_input(s->chr);
         }
-        return c;
+        r = c;
+        break;
     case 1: /* UARTRSR */
-        return s->rsr;
+        r = s->rsr;
+        break;
     case 6: /* UARTFR */
-        return s->flags;
+        r = s->flags;
+        break;
     case 8: /* UARTILPR */
-        return s->ilpr;
+        r = s->ilpr;
+        break;
     case 9: /* UARTIBRD */
-        return s->ibrd;
+        r = s->ibrd;
+        break;
     case 10: /* UARTFBRD */
-        return s->fbrd;
+        r = s->fbrd;
+        break;
     case 11: /* UARTLCR_H */
-        return s->lcr;
+        r = s->lcr;
+        break;
     case 12: /* UARTCR */
-        return s->cr;
+        r = s->cr;
+        break;
     case 13: /* UARTIFLS */
-        return s->ifl;
+        r = s->ifl;
+        break;
     case 14: /* UARTIMSC */
-        return s->int_enabled;
+        r = s->int_enabled;
+        break;
     case 15: /* UARTRIS */
-        return s->int_level;
+        r = s->int_level;
+        break;
     case 16: /* UARTMIS */
-        return s->int_level & s->int_enabled;
+        r = s->int_level & s->int_enabled;
+        break;
     case 18: /* UARTDMACR */
-        return s->dmacr;
+        r = s->dmacr;
+        break;
+    case 0x3f8 ... 0x400:
+        r = s->id[(offset - 0xfe0) >> 2];
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "pl011_read: Bad offset %x\n", (int)offset);
-        return 0;
+        r = 0;
+        break;
     }
+
+    trace_pl011_read(offset, r);
+    return r;
 }
 
 static void pl011_set_read_trigger(PL011State *s)
@@ -141,6 +162,8 @@ static void pl011_write(void *opaque, hwaddr offset,
     PL011State *s = (PL011State *)opaque;
     unsigned char ch;
 
+    trace_pl011_write(offset, value);
+
     switch (offset >> 2) {
     case 0: /* UARTDR */
         /* ??? Check if transmitter is enabled.  */
@@ -207,11 +230,15 @@ static void pl011_write(void *opaque, hwaddr offset,
 static int pl011_can_receive(void *opaque)
 {
     PL011State *s = (PL011State *)opaque;
+    int r;
 
-    if (s->lcr & 0x10)
-        return s->read_count < 16;
-    else
-        return s->read_count < 1;
+    if (s->lcr & 0x10) {
+        r = s->read_count < 16;
+    } else {
+        r = s->read_count < 1;
+    }
+    trace_pl011_can_receive(s->lcr, s->read_count, r);
+    return r;
 }
 
 static void pl011_put_fifo(void *opaque, uint32_t value)
@@ -225,7 +252,9 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
     s->read_fifo[slot] = value;
     s->read_count++;
     s->flags &= ~PL011_FLAG_RXFE;
+    trace_pl011_put_fifo(value, s->read_count);
     if (!(s->lcr & 0x10) || s->read_count == 16) {
+        trace_pl011_put_fifo_full();
         s->flags |= PL011_FLAG_RXFF;
     }
     if (s->read_count == s->read_trigger) {
diff --git a/hw/char/trace-events b/hw/char/trace-events
index d53577c..7fd48bb 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -47,3 +47,12 @@ escc_sunkbd_event_in(int ch, const char *name, int down) "QKeyCode 0x%2.2x [%s],
 escc_sunkbd_event_out(int ch) "Translated keycode 0x%2.2x"
 escc_kbd_command(int val) "Command %d"
 escc_sunmouse_event(int dx, int dy, int buttons_state) "dx=%d dy=%d buttons=%01x"
+
+# hw/char/pl011.c
+pl011_irq_state(int level) "irq state %d"
+pl011_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
+pl011_read_fifo(int read_count) "FIFO read, read_count now %d"
+pl011_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
+pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR %08x read_count %d returning %d"
+pl011_put_fifo(uint32_t c, int read_count) "new char 0x%x read_count now %d"
+pl011_put_fifo_full(void) "FIFO now full, RXFF set"
-- 
2.7.4

