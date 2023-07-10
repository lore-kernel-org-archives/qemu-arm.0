Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351717eje;
        Mon, 10 Jul 2023 10:52:09 -0700 (PDT)
X-Received: by 2002:a7b:ce8a:0:b0:3fb:be07:5343 with SMTP id q10-20020a7bce8a000000b003fbbe075343mr11799032wmj.27.1689011529804;
        Mon, 10 Jul 2023 10:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011529; cv=none;
        d=google.com; s=arc-20160816;
        b=ukLbIVZzaBc0n8E9iljwkkasWY9zjcWUvAdteF609TEuMsikMPt8rF5sKZt3OkV9zM
         3SdowTToqWTC7BPl8N8VYSNmwt3SD/UEb6trT3lMVsHrhYFHIAu97uVc3ENUXewLdUYg
         Msfn6F4TNOo0xoP9s8CQmkPnVJ+XD5n8EgcJ+lITfenHwJnB2//fa/5aMQMoqo4CcQI/
         8M8rJ+LOmKqePu7vfTkEnLZAxyQU3oH5CV4GiLs8MpCh1zSiWsrUt0wKrqNb85dGi42+
         kaeSzwm7vx2loGOLoBfPsZT5eC1XfbJ5SytGHshf9FqLAdejDjcADvfrE0JyGWeAucVc
         9Y2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qOM6YlvdwPEkIJATvf5aWwHQXWtlyzUZX4uuGNKyOYI=;
        fh=h2ztgUZ2XV+ir99uJ/APPfzm77wVDZASNC4DoaahShk=;
        b=GiOdb4Y+YnS3sYguZEYstzaihPQQhT5wVAv3KtOemWZp6I5IkWVH4cDNjp0xaEUbzY
         3H/+L6vt4kD151/tBFSA74I4z5/LhP1aNGDhqwxD4f6ZGBX7F1NUI+Bw46Y5nxNR+0ae
         w0S20/wgvlf/fsrE721n8YUnGwWEglagrGWAz9sY0XIpTunRsm4daMxXcMIPmtz5BFJ1
         tSfhbE8UwOApdeC4OxKBEjjAYDxOWQSWWl99drFB9Xhxmoh/XL2+rWcCUiequksjy79P
         CVquuu8Qn9iZdOyhMLOGZa4ODat0y9hLYppgZNahxTGHDSNLI5ZU80QR3qFTAUS2hS5K
         LyyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pQpdtX2F;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p1-20020a05600c204100b003fae92e7a72sor45660wmg.9.2023.07.10.10.52.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:52:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pQpdtX2F;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011529; x=1691603529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOM6YlvdwPEkIJATvf5aWwHQXWtlyzUZX4uuGNKyOYI=;
        b=pQpdtX2FFUQFbzTPfG23N0pQaj1nvgf8FjGIT0q8JE1Pn/5Gl0QJdaHcl15eaXlrCA
         2cux+FNqIrK1+FYgTiW4bNExzfVRxyQnCwazrnVUKLcAyMxKBru5ChBAW8vE2R/+DE6D
         mBRqRtE8Qku2TK/w45gwAB+UFDZONaTSY6h4lM8PKXN/0b8utwkoth5Sw8q+Bbvujrl9
         RYI6aT/5E4Gy5duHJlO/xfTWRqaEJD+9pQ5bodkpsahcTvpGiznb7vp+lebdVdhEO5zO
         QnOtVrSjqaoNBJ10vqHGQoaBsnNc+FQ5L6eSKeB/q8qNGbUwNL6fKHM8IJLo4XJJ9TJN
         dU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011529; x=1691603529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOM6YlvdwPEkIJATvf5aWwHQXWtlyzUZX4uuGNKyOYI=;
        b=jIYf5R5Oa66RQlBj+L6vrDXqgGDKdNOmCVqIEhf6ygRUnhFpwb0LIiJf/Kcdb28/c8
         jsIK/Y1BZ2lldVYzUNwy0kpHHistIX7cBtcz/JoH2Ma97882j+cCgZswjysp2V9qIOqw
         oUCN9yg7KGWa4LdGuVG703eUDvQsx3HNfuuBom+QPt7IamiDi/lXzGB3g56Pn1vbOCN5
         sPZmuLf5VslrQRMXx+Of+hkIoixWc0m22eWqAxVgwo0d3I3BcyxzxthdOEA/zcEDXTrU
         Uer7f7yJmfm01IeLf2KkXlQV5MlzbSx+JfnVBg8C7rsWZD74XPlwb8U4L38w1aZ+na4m
         v8kQ==
X-Gm-Message-State: ABy/qLZd2FmKIjuEIz0VC+/14vzLcsN0eebnoWocaNLz6A1/IGHpx+zZ
	6jjKbm16aHWC+PnzhI3fb+bCarPu
X-Google-Smtp-Source: APBJJlE7S47o8tIy+znwAnQLIwsiiIKh2MNH1FjUGellyGcB1jtOeN+vpJz9h8g0qzgaG6wq0Ra6eg==
X-Received: by 2002:a05:600c:24e:b0:3f9:b19c:aab4 with SMTP id 14-20020a05600c024e00b003f9b19caab4mr12878355wmj.6.1689011529429;
        Mon, 10 Jul 2023 10:52:09 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id m20-20020a7bcb94000000b003fbfea1afffsm461613wmi.27.2023.07.10.10.52.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:52:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [RFC PATCH v2 11/11] hw/char/pl011: Implement TX FIFO
Date: Mon, 10 Jul 2023 19:51:02 +0200
Message-Id: <20230710175102.32429-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230710175102.32429-1-philmd@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eUAcWafteU93

If the UART back-end chardev doesn't drain data as fast as stdout
does or blocks, buffer in the TX FIFO to try again later.

This avoids having the IO-thread busy waiting on chardev back-ends,
reported recently when testing the Trusted Reference Stack and
using the socket backend:
https://linaro.atlassian.net/browse/TRS-149?focusedCommentId=149574

Implement registering a front-end 'watch' callback on back-end
events, so we can resume transmitting when the back-end is writable
again, not blocking the main loop.

Similarly to the RX FIFO path, FIFO level selection is not
implemented (interrupt is triggered when a single byte is available
in the FIFO).

We only migrate the TX FIFO if it is in use.

Reported-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: Again for the migration part.
---
 include/hw/char/pl011.h |   2 +
 hw/char/pl011.c         | 108 ++++++++++++++++++++++++++++++++++++++--
 hw/char/trace-events    |   4 ++
 3 files changed, 109 insertions(+), 5 deletions(-)

diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index d853802132..20898f43a6 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -18,6 +18,7 @@
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
 #include "qom/object.h"
+#include "qemu/fifo8.h"
 
 #define TYPE_PL011 "pl011"
 OBJECT_DECLARE_SIMPLE_TYPE(PL011State, PL011)
@@ -53,6 +54,7 @@ struct PL011State {
     Clock *clk;
     bool migrate_clk;
     const unsigned char *id;
+    Fifo8 xmit_fifo;
 };
 
 DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr);
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 7c785e7bb0..4392773327 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -57,6 +57,9 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 /* Data Register, UARTDR */
 #define DR_BE   (1 << 10)
 
+/* Receive Status Register/Error Clear Register, UARTRSR/UARTECR */
+#define RSR_OE  (1 << 3)
+
 /* Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC */
 #define INT_OE (1 << 10)
 #define INT_BE (1 << 9)
@@ -152,6 +155,59 @@ static inline void pl011_reset_tx_fifo(PL011State *s)
     /* Reset FIFO flags */
     s->flags &= ~PL011_FLAG_TXFF;
     s->flags |= PL011_FLAG_TXFE;
+
+    fifo8_reset(&s->xmit_fifo);
+}
+
+static gboolean pl011_drain_tx(PL011State *s)
+{
+    trace_pl011_fifo_tx_drain(fifo8_num_used(&s->xmit_fifo));
+    pl011_reset_tx_fifo(s);
+    s->rsr &= ~RSR_OE;
+    return G_SOURCE_REMOVE;
+}
+
+static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
+{
+    PL011State *s = opaque;
+    int ret;
+    const uint8_t *buf;
+    uint32_t buflen;
+    uint32_t count;
+    bool tx_enabled;
+
+    if (!qemu_chr_fe_backend_connected(&s->chr)) {
+        /* Instant drain the fifo when there's no back-end */
+        return pl011_drain_tx(s);
+    }
+
+    tx_enabled = s->cr & CR_UARTEN;
+    /* Allow completing the current FIFO character before stopping. */
+    count = tx_enabled ? fifo8_num_used(&s->xmit_fifo) : 1; /* current only */
+    if (count) {
+        /* Transmit as much data as we can */
+        buf = fifo8_peek_buf(&s->xmit_fifo, count, &buflen);
+        ret = qemu_chr_fe_write(&s->chr, buf, buflen);
+        if (ret >= 0) {
+            /* Pop the data we could transmit */
+            trace_pl011_fifo_tx_xmit(ret);
+            fifo8_pop_buf(&s->xmit_fifo, ret, NULL);
+            s->int_level |= INT_TX;
+        }
+
+        if (tx_enabled && !fifo8_is_empty(&s->xmit_fifo)) {
+            /* Reschedule another transmission if we couldn't transmit all */
+            guint r = qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
+                                            pl011_xmit, s);
+            if (!r) {
+                return pl011_drain_tx(s);
+            }
+        }
+
+        pl011_update(s);
+    }
+
+    return G_SOURCE_REMOVE;
 }
 
 static void pl011_write_txdata(PL011State *s, const uint8_t *buf, int length)
@@ -162,12 +218,32 @@ static void pl011_write_txdata(PL011State *s, const uint8_t *buf, int length)
     if (!(s->cr & CR_TXE)) {
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 write data but TX disabled\n");
     }
+    if (!fifo8_is_empty(&s->xmit_fifo)) {
+        /*
+         * If the UART is disabled in the middle of transmission
+         * or reception, it completes the current character before
+         * stopping.
+         */
+        pl011_xmit(NULL, G_IO_OUT, s);
+        return;
+    }
 
-    /* XXX this blocks entire thread. Rewrite to use
-     * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&s->chr, buf, 1);
-    s->int_level |= INT_TX;
-    pl011_update(s);
+    if (length > fifo8_num_free(&s->xmit_fifo)) {
+        /*
+         * The FIFO contents remain valid because no more data is
+         * written when the FIFO is full, only the contents of the
+         * shift register are overwritten. The CPU must now read
+         * the data, to empty the FIFO.
+         */
+        trace_pl011_fifo_tx_overrun();
+        s->rsr |= RSR_OE;
+        return;
+    }
+
+    trace_pl011_fifo_tx_put(length);
+    fifo8_push_all(&s->xmit_fifo, buf, length);
+
+    pl011_xmit(NULL, G_IO_OUT, s);
 }
 
 static uint32_t pl011_read_rxdata(PL011State *s)
@@ -434,6 +510,13 @@ static const VMStateDescription vmstate_pl011_clock = {
     }
 };
 
+static bool pl011_xmit_fifo_state_needed(void *opaque, int version_id)
+{
+    PL011State* s = opaque;
+
+    return pl011_is_fifo_enabled(s) && !fifo8_is_empty(&s->xmit_fifo);
+}
+
 static int pl011_post_load(void *opaque, int version_id)
 {
     PL011State* s = opaque;
@@ -455,6 +538,11 @@ static int pl011_post_load(void *opaque, int version_id)
         s->read_pos = 0;
     }
 
+    if (pl011_xmit_fifo_state_needed(s, version_id)) {
+        /* Reschedule another transmission */
+        qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP, pl011_xmit, s);
+    }
+
     return 0;
 }
 
@@ -473,6 +561,7 @@ static const VMStateDescription vmstate_pl011 = {
         VMSTATE_UINT32(int_enabled, PL011State),
         VMSTATE_UINT32(int_level, PL011State),
         VMSTATE_UINT32_ARRAY(read_fifo, PL011State, PL011_FIFO_DEPTH),
+        VMSTATE_FIFO8_TEST(xmit_fifo, PL011State, pl011_xmit_fifo_state_needed),
         VMSTATE_UINT32(ilpr, PL011State),
         VMSTATE_UINT32(ibrd, PL011State),
         VMSTATE_UINT32(fbrd, PL011State),
@@ -500,6 +589,7 @@ static void pl011_init(Object *obj)
     PL011State *s = PL011(obj);
     int i;
 
+    fifo8_create(&s->xmit_fifo, PL011_FIFO_DEPTH);
     memory_region_init_io(&s->iomem, OBJECT(s), &pl011_ops, s, "pl011", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
@@ -512,6 +602,13 @@ static void pl011_init(Object *obj)
     s->id = pl011_id_arm;
 }
 
+static void pl011_finalize(Object *obj)
+{
+    PL011State *s = PL011(obj);
+
+    fifo8_destroy(&s->xmit_fifo);
+}
+
 static void pl011_realize(DeviceState *dev, Error **errp)
 {
     PL011State *s = PL011(dev);
@@ -555,6 +652,7 @@ static const TypeInfo pl011_arm_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(PL011State),
     .instance_init = pl011_init,
+    .instance_finalize = pl011_finalize,
     .class_init    = pl011_class_init,
 };
 
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 9fd40e3aae..4c25564066 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -60,6 +60,10 @@ pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x val
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
 pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
+pl011_fifo_tx_put(int count) "TX FIFO push %d"
+pl011_fifo_tx_xmit(int count) "TX FIFO pop %d"
+pl011_fifo_tx_overrun(void) "TX FIFO overrun"
+pl011_fifo_tx_drain(unsigned drained) "TX FIFO draining %u"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 
 # cmsdk-apb-uart.c
-- 
2.38.1
