Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1287213ejb;
        Mon, 22 May 2023 08:32:55 -0700 (PDT)
X-Received: by 2002:a7b:c450:0:b0:3f4:2bb3:a5c9 with SMTP id l16-20020a7bc450000000b003f42bb3a5c9mr8465824wmi.8.1684769575335;
        Mon, 22 May 2023 08:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769575; cv=none;
        d=google.com; s=arc-20160816;
        b=b0N8s16wHls3zW7flcZX5loNzbxRNbYci7CR2hEi2srwRyN5WL2wgXsvlBBTg155g+
         1GegZTWHVC8YGWpZcLcvhIJeADgHFOL0QbfdffU6dnOFpD4dmp7FOyQCvu03MH+yly98
         hKzlZSOP+ICTFHyaY5vb5tadBhx4Rp7PzMh+g6/k0TTI2xKw9FjvAxg4l/vaWFw+tL4x
         sMj7ItIsa1bTVAkSd9Y3zcxpdP5+WVxc/T/eTOd+1i+i2aToLeWaSxYsTf/gfo+tDpae
         Rnbv+g2bl06ShZY6sHwDdd29PO5OtFKg5MRyovlXHa+J/NJzOMaoVVUxQWJ2c1Bc5Vpu
         wiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lE3AFLRBDeHmAd75tRobhpSnEmgT2M+g2etmHg9JWDI=;
        b=sL1ni22Z+RO7xXzWWMEIcxv5bRqQy48BGNIAXcQNY/IoVNVJ/uCVd5KUiDVi6hmBL6
         RG6e7DwZlOKlpPL8t5zssHAy0yOLN16ztqNd7zy+kN/LcWEDtMdIMLKt63R3lgCSdSe2
         0seVM/z1frvzhJQb8wHAz/G24egU6G2Aou8n0f6oy7+WpbHM1mHkFy4WuQNCJJ4vgbYn
         lKe1j55+rcDybd19LRrmD2+QpvXcKygfJh1cdN0KJbJA/KDOJ1bNfUK6+bPgVCUWSPe0
         K/R8jLlVQbSImIcShQKjPmg+sZrRTom6Wgw8WpKw8yk3rEk5JL41mNG27CbrlCPYNkt8
         +FrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q9nke18z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g3-20020a7bc4c3000000b003f42d8dd7f8sor1240226wmk.8.2023.05.22.08.32.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:32:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q9nke18z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769575; x=1687361575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lE3AFLRBDeHmAd75tRobhpSnEmgT2M+g2etmHg9JWDI=;
        b=q9nke18z0/+Mg9Q+nIwUINvI+Yse7bF2z1947OEzoTG6vk5SHi95KEIBqw0TvQe6jS
         XKhcRyQ83B7ClLUigsD+gZa9JqHpC6tQNnaf801rZni4UaPbJIj3ENK9aY4ztv1Il4RJ
         1d4eqYP5pkX/7yn3oodHvzzPgY0Nhp+6ge+AEYD3kYcLDb8eKIYSKDBNTzdnA+1C2E4i
         AhgDDRR6bjr9Anw2b3rSn0Q0dDCKYtHn1y9c4gCJJH+8/1kpNhPHSjePq0MTmYwiNAeY
         AoG2FSksrIyFC0IEfQwlB3HNTfcp105k4zXS7ZJDuAS70Blsnk31qJUbuUlWkfWN3Gc5
         1VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769575; x=1687361575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lE3AFLRBDeHmAd75tRobhpSnEmgT2M+g2etmHg9JWDI=;
        b=Mk7WdmYMbMq/hdx1bQ9vCXF4vFTI9cN0qlGRgdp/BEahwBLkhxbfFOq8QcNQfxLKrw
         9sSdVHYUJ6qndsiDfR9km7GK/zYbLJa9WIJKKLjEmiYT5+4JR2/EYPynE8vK0+uIQ1sB
         kCghTcTjqq+ja0fwT9CONx3Xg+7qSwWyoNOEXi8JyzNXMim4YaTTz3SwJbmXuPXqNctj
         ANt9n+31wmBWgeI+bdtKSOyANNAd0/j9nmxkQRgsjEYhl7Cfl88P4FT8awUHF0+1tXd5
         4sRw3GhCTWrRdDtuOKzZiCH1ROWndieoLd50wt/vKTKZRBANI8RHT2g2D7Hzy4Q7fPyU
         anOg==
X-Gm-Message-State: AC+VfDxstEAodfXDNt8jgrtmy2fQrAEPl0btKPdHs2DkZPBL2nDZoPE3
	T6e3VvbCp3hWoPrXe1JKaggk1dHc
X-Google-Smtp-Source: ACHHUZ5iOb7zJShU7RpQ6rQOYLEt2EVDHtUK9BII9rZfcgbH/iITSg5pZMQA0r1BgbZsNqhAYxfunw==
X-Received: by 2002:a7b:c390:0:b0:3f4:2805:c3a with SMTP id s16-20020a7bc390000000b003f428050c3amr8063059wmj.21.1684769574891;
        Mon, 22 May 2023 08:32:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c378300b003f4f8cc4285sm8674869wmr.17.2023.05.22.08.32.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:32:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 12/12] hw/char/pl011: Implement TX FIFO
Date: Mon, 22 May 2023 17:31:44 +0200
Message-Id: <20230522153144.30610-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WCu+oGxv6X9K

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

Due to the addition of the TX FIFO in the instance state, increase
the migration stream version.

Reported-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC because I'm pretty sure I got the migration code wrong.

After writing this I noticed the hw/char/cmsdk-apb-uart.c model
is much more complete. Instead of copy/pasting its code, I'd rather
try to extract some generic/bstract "FIFO based chardev" QOM class;
but this is beyond the scope of this series.
---
 include/hw/char/pl011.h |   2 +
 hw/char/pl011.c         | 105 +++++++++++++++++++++++++++++++++++++---
 hw/char/trace-events    |   4 ++
 3 files changed, 105 insertions(+), 6 deletions(-)

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
index 03c006199e..a957138405 100644
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
@@ -152,19 +155,94 @@ static inline void pl011_reset_tx_fifo(PL011State *s)
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
+    return FALSE;
+}
+
+static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
+{
+    PL011State *s = opaque;
+    int ret;
+    const uint8_t *buf;
+    uint32_t buflen;
+    uint32_t count;
+
+    if (!qemu_chr_fe_backend_connected(&s->chr)) {
+        /* Instant drain the fifo when there's no back-end */
+        return pl011_drain_tx(s);
+    }
+
+    count = fifo8_num_used(&s->xmit_fifo);
+    if (!count) {
+        return FALSE;
+    }
+    if  (!(s->cr & CR_UARTEN)) {
+        /* Allow completing the current FIFO character before stopping. */
+        count = 1;
+    }
+
+    /* Transmit as much data as we can */
+    buf = fifo8_peek_buf(&s->xmit_fifo, count, &buflen);
+    ret = qemu_chr_fe_write(&s->chr, buf, buflen);
+    if (ret >= 0) {
+        /* Pop the data we could transmit */
+        trace_pl011_fifo_tx_xmit(ret);
+        fifo8_pop_buf(&s->xmit_fifo, ret, NULL);
+        s->int_level |= INT_TX;
+    }
+
+    if ((s->cr & CR_UARTEN) && !fifo8_is_empty(&s->xmit_fifo)) {
+        /* Reschedule another transmission if we couldn't transmit all */
+        guint r = qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
+                                        pl011_xmit, s);
+        if (!r) {
+            return pl011_drain_tx(s);
+        }
+    }
+
+    pl011_update(s);
+
+    return FALSE;
 }
 
 static void pl011_write_tx(PL011State *s, const uint8_t *buf, int length)
 {
     if (!(s->cr & (CR_UARTEN | CR_TXE))) {
+        if (!fifo8_is_empty(&s->xmit_fifo)) {
+            /*
+             * If the UART is disabled in the middle of transmission
+             * or reception, it completes the current character before
+             * stopping.
+             */
+            pl011_xmit(NULL, G_IO_OUT, s);
+        }
         return;
     }
 
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
 
 static uint64_t pl011_read(void *opaque, hwaddr offset,
@@ -444,12 +522,17 @@ static int pl011_post_load(void *opaque, int version_id)
         s->read_pos = 0;
     }
 
+    if (version_id >= 3 && !fifo8_is_empty(&s->xmit_fifo)) {
+        /* Reschedule another transmission */
+        qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP, pl011_xmit, s);
+    }
+
     return 0;
 }
 
 static const VMStateDescription vmstate_pl011 = {
     .name = "pl011",
-    .version_id = 2,
+    .version_id = 3,
     .minimum_version_id = 2,
     .post_load = pl011_post_load,
     .fields = (VMStateField[]) {
@@ -462,6 +545,7 @@ static const VMStateDescription vmstate_pl011 = {
         VMSTATE_UINT32(int_enabled, PL011State),
         VMSTATE_UINT32(int_level, PL011State),
         VMSTATE_UINT32_ARRAY(read_fifo, PL011State, PL011_FIFO_DEPTH),
+        VMSTATE_FIFO8(xmit_fifo, PL011State),
         VMSTATE_UINT32(ilpr, PL011State),
         VMSTATE_UINT32(ibrd, PL011State),
         VMSTATE_UINT32(fbrd, PL011State),
@@ -505,10 +589,18 @@ static void pl011_realize(DeviceState *dev, Error **errp)
 {
     PL011State *s = PL011(dev);
 
+    fifo8_create(&s->xmit_fifo, PL011_FIFO_DEPTH);
     qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
                              pl011_event, NULL, s, NULL, true);
 }
 
+static void pl011_unrealize(DeviceState *dev)
+{
+    PL011State *s = PL011(dev);
+
+    fifo8_destroy(&s->xmit_fifo);
+}
+
 static void pl011_reset(DeviceState *dev)
 {
     PL011State *s = PL011(dev);
@@ -534,6 +626,7 @@ static void pl011_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = pl011_realize;
+    dc->unrealize = pl011_unrealize;
     dc->reset = pl011_reset;
     dc->vmsd = &vmstate_pl011;
     device_class_set_props(dc, pl011_properties);
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
