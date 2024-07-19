Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617666njc;
        Fri, 19 Jul 2024 11:12:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLCAnWflouR/NaY3VWSHtSgdMdnlQZgNV0HXjpDIahevtMp74NtBGsEkjmxa6zrgIUt3+eXSLL3NQIB3zwrgwjG6RGX+rX
X-Received: by 2002:a05:600c:3487:b0:426:623f:34ae with SMTP id 5b1f17b1804b1-427daa28691mr1840945e9.16.1721412746295;
        Fri, 19 Jul 2024 11:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412746; cv=none;
        d=google.com; s=arc-20160816;
        b=Gy3JVxlmmQzUt2cb2NNFEchOIV542t1GhnjJvzasD9LTnGfHO1xBCMZ74KiC8l29pl
         /esojgtTNd/ZmxLcqyqknQIQU86WwW5J1fhqR8tFE9cbyROJRIaSmkIqVSO2vsRkmcE8
         TldZ6FOa3jMCnwBKzCB+8vaB79l3woZcgoZovCKYOhxjZI0K5AZAD8jyTNt1FTzB3ttg
         XOZq3PCis2bi78/ApqzNGsSKgrcXXb1qFuQqC28hlmBGffcPg+fzsIKEvjgvQpQpl6hH
         HFQ8QuBfVt/o0zhhQ52skadxiHcjXLcVw1ufOet/nGuV3L2xMtq87Scn+Y3QF/Wn5F3R
         36hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=e/ZQe/yHYS+wM7PLPDCR+wv5t4w+2k62yQLSsqaNg4w=;
        fh=G3BBsiIDFOqQlsL8o5Tx/L/QHk9I06buDhEZLbGJryo=;
        b=pL8439lb924xHSM6/cpSB5pbx9n4ENiZk91vKq6xJvYYcrUlRrSzrKDtowZIwqTY0C
         eAsjPLIByJxMMQIobXz3n/Pd+XksPRmDVMW1uqjTxMCcw/c+4PUyrbv2AnFybHljej/F
         8zNl5KikqduxNvZ1Upl6awyrwiKEZjGcNSAKi3ncNxDgl2r1+jPRCw5S+JbFzBV51yiz
         mQDXM+poVdJZanp4M1yqgBiphDNf3mQTfBJOJxszDIX3kzVPGjSg3nUlkRniC5xG/+c5
         nuiMnG5Of1B1tWaxGStm0P3WnlZW32Bv6yL3uk7KNnaiPsdcpfI97q5PpOO/zM+nlS6X
         J8Dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ie0BumoK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d70f0d54sor5976365e9.6.2024.07.19.11.12.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:12:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ie0BumoK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412746; x=1722017546; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/ZQe/yHYS+wM7PLPDCR+wv5t4w+2k62yQLSsqaNg4w=;
        b=ie0BumoKXuWfTO5aFLCZKFWG1aJIJwZoLhFFdPSvGdqN/Dtr/IaImVc7lqjFDLOHye
         uPSUyVKf4qGOOkJn6kycZeJ8EoXBk5MGFQcQdlK1rkONSQ++lMHRbewLhXdGs7z06SfZ
         lcvUl9UlIEzMS+wfPHD9DUIMmhIrqPdcnEQWd3SeCsolmFWJe8h6rE4mzHn9dJ90b3oO
         F8WLD0lU79rEtxPnVGu+zfdDzjySzBxv4USJAjchfx/YNXV9VsKyh/8pm/BdYEdbFVJZ
         Dag1CsYbCf35tuDnwWxn4V1SZTPJXVYtocjvClI2JHgrZgTsn2lgoI3Dcjqsy+HmSFUc
         kWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412746; x=1722017546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/ZQe/yHYS+wM7PLPDCR+wv5t4w+2k62yQLSsqaNg4w=;
        b=glB230ylKdGtdFAHqXtSqHp9D8QvcjTHlk2OG+q/jLf54XchyXtYk/dXShOJk+raTE
         E6GuJTvVfkRhFQk05eHrXNr9+DKAjq/iZUqWzkNaPRrE1MtA3AUPhtSr+/esWd25F0ty
         ccMzK9TMISVcsZwUeGk/POc/TSCqPk3ebfyvS+si/70bzN8F87ceiV0WmH28doxc7oEU
         804y/ryoc0WnPS3NLkR88JAPCZwqOqGxhCR6YW/Ycn36uLsKbX/4l8s5EvBrDl6pXSj1
         HdAGfaaV2PazY6oFZ5/QO2RYTjX6tT8zty4Sh2g81UbiY3PXwAemQpU0prSuzLr1iplc
         CjVA==
X-Forwarded-Encrypted: i=1; AJvYcCWLtJP9WGGD5wkSF5UdMS9Z+U6m0+wlfxoETdxeh6HHZHa/YpOLo6fFgIx2aZDCwuOH4WSE0842WSwBPManpgMPE529eTHW
X-Gm-Message-State: AOJu0Ywu49ibN4PabNjp4xsP7KwiOyHVlioigsw4hYhp/D3asn4EekZ5
	I4EbgYUGj/qFbCsFLQlDrNUuaEF+9AhqIh4/VdO6HdSsHasvBKHozJPepYa64J83fQ==
X-Google-Smtp-Source: AGHT+IEka99OAZtI0h2En3VRTvDYiJuupj8PiTozQteCkvzdFJ54IYUgWSRstsrhskAVbkyoUotZwg==
X-Received: by 2002:a05:600c:19cd:b0:427:dac4:d36 with SMTP id 5b1f17b1804b1-427dac4132fmr1307245e9.7.1721412745794;
        Fri, 19 Jul 2024 11:12:25 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6929976sm33385325e9.29.2024.07.19.11.12.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:12:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Tong Ho <tong.ho@amd.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [RFC PATCH v5 16/16] hw/char/pl011: Implement TX FIFO
Date: Fri, 19 Jul 2024 20:10:41 +0200
Message-ID: <20240719181041.49545-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cL/JoeI/WqdN

If the UART back-end chardev doesn't drain data as fast as stdout
does or blocks, buffer in the TX FIFO to try again later.

This avoids having the IO-thread busy waiting on chardev back-ends,
reported recently when testing the Trusted Reference Stack and
using the socket backend.

Implement registering a front-end 'watch' callback on back-end
events, so we can resume transmitting when the back-end is writable
again, not blocking the main loop.

Similarly to the RX FIFO path, FIFO level selection is not
implemented (interrupt is triggered when a single byte is available
in the FIFO).

Reported-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: Something is still broken, some characters are emitted async...
---
 hw/char/pl011.c      | 60 ++++++++++++++++++++++++++++++++++++--------
 hw/char/trace-events |  1 +
 2 files changed, 51 insertions(+), 10 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index cfa3fd3da4..9f72b6a765 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -240,7 +240,9 @@ static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
 {
     PL011State *s = opaque;
     int bytes_consumed;
-    uint8_t data;
+    const uint8_t *buf;
+    uint32_t buflen;
+    uint32_t count;
 
     if (!(s->cr & CR_UARTEN)) {
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled UART\n");
@@ -249,25 +251,40 @@ static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled TX UART\n");
     }
 
+    count = fifo8_num_used(&s->xmit_fifo);
+    if (count < 1) {
+        /* FIFO empty */
+        return G_SOURCE_REMOVE;
+    }
+
     if (!qemu_chr_fe_backend_connected(&s->chr)) {
         /* Instant drain the fifo when there's no back-end. */
         pl011_drain_tx(s);
         return G_SOURCE_REMOVE;
     }
 
-    data = fifo8_pop(&s->xmit_fifo);
-    bytes_consumed = 1;
+    buf = fifo8_peek_buf(&s->xmit_fifo, count, &buflen);
 
-    /*
-     * XXX this blocks entire thread. Rewrite to use
-     * qemu_chr_fe_write and background I/O callbacks
-     */
-    qemu_chr_fe_write_all(&s->chr, &data, bytes_consumed);
+    /* Transmit as much data as we can. */
+    bytes_consumed = qemu_chr_fe_write(&s->chr, buf, buflen);
     trace_pl011_fifo_tx_xmit(bytes_consumed);
+    if (bytes_consumed < 0) {
+        /* Error in back-end: drain the fifo. */
+        pl011_drain_tx(s);
+        return G_SOURCE_REMOVE;
+    }
+
+    /* Pop the data we could transmit. */
+    fifo8_pop_buf(&s->xmit_fifo, bytes_consumed, NULL);
     s->int_level |= INT_TX;
 
     pl011_update(s);
 
+    if (!fifo8_is_empty(&s->xmit_fifo)) {
+        /* Reschedule another transmission if we couldn't transmit all. */
+        return G_SOURCE_CONTINUE;
+    }
+
     return G_SOURCE_REMOVE;
 }
 
@@ -290,6 +307,10 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
     trace_pl011_fifo_tx_put(data);
     pl011_loopback_tx(s, data);
     fifo8_push(&s->xmit_fifo, data);
+    if (fifo8_is_full(&s->xmit_fifo)) {
+        s->flags |= PL011_FLAG_TXFF;
+    }
+
     pl011_xmit(NULL, G_IO_OUT, s);
 }
 
@@ -488,10 +509,24 @@ static void pl011_write(void *opaque, hwaddr offset,
         pl011_trace_baudrate_change(s);
         break;
     case 11: /* UARTLCR_H */
-        /* Reset the FIFO state on FIFO enable or disable */
         if ((s->lcr ^ value) & LCR_FEN) {
-            pl011_reset_rx_fifo(s);
+            bool fifo_enabled = value & LCR_FEN;
+
+            trace_pl011_fifo_enable(fifo_enabled);
+            if (fifo_enabled) {
+                /* Transmit and receive FIFO buffers are enabled (FIFO mode). */
+                fifo8_change_capacity(&s->xmit_fifo, PL011_FIFO_DEPTH);
+            } else {
+                /*
+                 * FIFOs are disabled (character mode) that is, the FIFOs
+                 * become 1-byte-deep holding registers.
+                 */
+                pl011_drain_tx(s);
+                fifo8_change_capacity(&s->xmit_fifo, 1);
+            }
+            /* Reset the FIFO state on FIFO enable or disable */
             pl011_reset_tx_fifo(s);
+            pl011_reset_rx_fifo(s);
         }
         if ((s->lcr ^ value) & LCR_BRK) {
             int break_enable = value & LCR_BRK;
@@ -636,6 +671,11 @@ static int pl011_post_load(void *opaque, int version_id)
         s->read_pos = 0;
     }
 
+    if (!fifo8_is_empty(&s->xmit_fifo)) {
+        /* Reschedule another transmission */
+        qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP, pl011_xmit, s);
+    }
+
     s->ibrd &= IBRD_MASK;
     s->fbrd &= FBRD_MASK;
 
diff --git a/hw/char/trace-events b/hw/char/trace-events
index bf586ba664..2405819812 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -58,6 +58,7 @@ pl011_read(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x valu
 pl011_read_fifo(int read_count) "FIFO read, read_count now %d"
 pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
+pl011_fifo_enable(bool enable) "enable:%u"
 pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
 pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
-- 
2.41.0
