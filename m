Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp703894ejq;
        Thu, 9 Nov 2023 11:29:17 -0800 (PST)
X-Received: by 2002:a17:907:72d4:b0:9bf:5771:a8cf with SMTP id du20-20020a17090772d400b009bf5771a8cfmr5445604ejc.70.1699558157361;
        Thu, 09 Nov 2023 11:29:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558157; cv=none;
        d=google.com; s=arc-20160816;
        b=ae7DFSnfQW/Cd7eXrqMgedE2k3qxwy9HiwmGbLvJOEGRL/AzfQPfO9pfMOpFI4UvJS
         spdd7EDHZxRso5vzjlR0aELejMMoH03uxQdlN2V9GTIKD2c/dg5zeHHxN0QXxSPc3dk4
         jhjpr5Ty9v7ttapGcU7xgJiBUQlvLx3BF2MjM0Y14owCOMKux3qiCpIx/T1PANnWbfFX
         PR2Qr4vxzJQmO6TIgFUmNHTzOMQimFeoqrGPD7tmy4oe/pe26opir1yOndHJxjSv8D7G
         F34CL83fLE+grOBrc9MYQvRiefPyyFtyrgvu8kze2DqqLPN2V8zoSnPtA4Fu1fSZTIy3
         xoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=L0ZgfFAgA7ypETy4OWUsXUiUb+FjTb/S73XLff6YN2Y=;
        fh=n7joC1En9kOODo5cknOnlSvmXvqw4rwZKjGMK8wqNNM=;
        b=aEFWOu4NwkWKmKIzP4A+FFN7//4WmLKtkghWAlil+WYdnKnkLwG87AaCb3U8Xq7eBZ
         TJPUFYBYzNjgg4JhScuSErKiCd+qU470ZnOtMfAENTapSge/aqf2BZdDFKnMBozsdnI0
         WTfjNItpMS9GZ6wSjqWj80QY+Hw09HPLihXrLxTcf8oI2xS3Kqjh1r7SkO7WvZDbHc9Y
         aEqd9XBjWIA0ZxAAu1pGub27PWYRzQFnjpbaFnRw6YAURWoBANZ4KZj0ZJHOqHdvbW3O
         yM6GOBZo6PGQ55mxYgqiueUolq2I8XjSI85KcueyIWy9tWdFYipJJ8LDZuLemEe93R7m
         FAvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nEyjzFFv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 20-20020a17090601d400b009bf63a32cd9sor3266123ejj.13.2023.11.09.11.29.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:29:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nEyjzFFv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558157; x=1700162957; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0ZgfFAgA7ypETy4OWUsXUiUb+FjTb/S73XLff6YN2Y=;
        b=nEyjzFFvmZE9WMo6heRp5YrD6cd3h8GXbYcKvHTAFPD6760nedtDT0tfVu+LSlfkA5
         FGHpB1C+Jxka4/0Z0n6hDE9uc4upx+tdIRVRVqKL7fJlGRFssyr60+HHdGr/eIQOecYP
         LUXljfthmZrlTxsGakx2mEXF74DHCtWzMP4AP6olTu1dBRASj5QvldG1y4vXMtSETQzX
         bEMgDEshPdnnUGk0hiQolIBYTmUHLUOVcxs0qq9j9JW3VtxgPjSQuYJrEmwNXwsEu812
         hQAOmwnB1qRCrWnYzE9ZGc+a+cxlvA1Ej3qTad20aLmqKwppUFsYceMRZpi6SWBquY9E
         EFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558157; x=1700162957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0ZgfFAgA7ypETy4OWUsXUiUb+FjTb/S73XLff6YN2Y=;
        b=FKyM54JDo854mCRjw/VN5CHdzEheLx5DbK3frvCOupplAmbkp83WiOwe5sFeciHKTJ
         rgXx3RfCMdXftGnzeoYtkKOWi0HG1wPu5y/685Yx1RDhv4bjMtVFKfjqfDkeox2lxESn
         iu06mpAJD1QTJcnRvwD7C6neBWBxibBcllsY51G83SxlcoN/JuNnHbKag0EsPTVXeMhF
         ByFkHHlxMJFO9QD3slxmeY45ju68dyOWQhcRB4x+lf3OaJb+7l+B5wUNTksSDnD6vK1D
         bdzsEsNc9aVj6068/PmuCVXp5dFocZ8sp20TVGyCzL7xF1+xAulJ8N4M+tYiv1xtBjDi
         8twA==
X-Gm-Message-State: AOJu0Yw1b4+AuiUCF5NCNsvCPUkFp9EJPKaG+X/8jLyFDd5kvXVIqDmp
	uQDGw7pB/lkzAU/rKszI2rOQVBiB
X-Google-Smtp-Source: AGHT+IFrycDbYp1brEZyLTehDLKygp53lllF/hswUqBO3IWUSyid/9YWQor0+3ILzSpUZO2vnonAPQ==
X-Received: by 2002:a17:907:3e1c:b0:9b2:d554:da0e with SMTP id hp28-20020a1709073e1c00b009b2d554da0emr5818301ejc.69.1699558157027;
        Thu, 09 Nov 2023 11:29:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id f4-20020a170906048400b00988e953a586sm2933836eja.61.2023.11.09.11.29.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Nov 2023 11:29:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH-for-8.2 v4 10/10] hw/char/pl011: Implement TX FIFO
Date: Thu,  9 Nov 2023 20:28:14 +0100
Message-ID: <20231109192814.95977-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
References: <20231109192814.95977-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XXPVl7PKt1QD

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
 hw/char/pl011.c      | 107 ++++++++++++++++++++++++++++++++++++++++---
 hw/char/trace-events |   4 ++
 2 files changed, 105 insertions(+), 6 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index f474f56780..a14ece4f07 100644
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
@@ -156,6 +159,68 @@ static void pl011_reset_tx_fifo(PL011State *s)
     fifo8_reset(&s->xmit_fifo);
 }
 
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
+    tx_enabled = (s->cr & CR_UARTEN) && (s->cr & CR_TXE);
+    if (!tx_enabled) {
+        /*
+         * If TX is disabled, nothing to do.
+         * Keep the potentially used FIFO as is.
+         */
+        return G_SOURCE_REMOVE;
+    }
+
+    if (!qemu_chr_fe_backend_connected(&s->chr)) {
+        /* Instant drain the fifo when there's no back-end */
+        return pl011_drain_tx(s);
+    }
+
+    count = fifo8_num_used(&s->xmit_fifo);
+    if (count < 1) {
+        /* FIFO empty */
+        return G_SOURCE_REMOVE;
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
+    if (!fifo8_is_empty(&s->xmit_fifo)) {
+        /* Reschedule another transmission if we couldn't transmit all */
+        guint r = qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
+                                        pl011_xmit, s);
+        if (!r) {
+            /* Error in back-end? */
+            return pl011_drain_tx(s);
+        }
+    }
+
+    pl011_update(s);
+
+    return G_SOURCE_REMOVE;
+}
+
 static void pl011_write_txdata(PL011State *s, uint8_t data)
 {
     if (!(s->cr & CR_UARTEN)) {
@@ -165,11 +230,25 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled TX UART\n");
     }
 
-    /* XXX this blocks entire thread. Rewrite to use
-     * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&s->chr, &data, 1);
-    s->int_level |= INT_TX;
-    pl011_update(s);
+    if (fifo8_is_full(&s->xmit_fifo)) {
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
+    trace_pl011_fifo_tx_put(data);
+    fifo8_push(&s->xmit_fifo, data);
+    if (fifo8_is_full(&s->xmit_fifo)) {
+        s->flags |= PL011_FLAG_TXFF;
+    }
+
+    pl011_xmit(NULL, G_IO_OUT, s);
 }
 
 static uint32_t pl011_read_rxdata(PL011State *s)
@@ -331,10 +410,21 @@ static void pl011_write(void *opaque, hwaddr offset,
         s->lcr = value;
         pl011_set_read_trigger(s);
         break;
-    case 12: /* UARTCR */
+    case 12: /* UARTCR */ {
+        uint16_t en_bits = s->cr & (CR_UARTEN | CR_TXE | CR_RXE);
+        uint16_t dis_bits = value & (CR_UARTEN | CR_TXE | CR_RXE);
+        if (en_bits ^ dis_bits && !fifo8_is_empty(&s->xmit_fifo)) {
+            /*
+             * If the UART is disabled in the middle of transmission
+             * or reception, it completes the current character before
+             * stopping.
+             */
+            pl011_xmit(NULL, G_IO_OUT, s);
+        }
         /* ??? Need to implement the enable and loopback bits.  */
         s->cr = value;
         break;
+    }
     case 13: /* UARTIFS */
         s->ifl = value;
         pl011_set_read_trigger(s);
@@ -477,6 +567,11 @@ static int pl011_post_load(void *opaque, int version_id)
         s->read_pos = 0;
     }
 
+    if (!fifo8_is_empty(&s->xmit_fifo)) {
+        /* Reschedule another transmission */
+        qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP, pl011_xmit, s);
+    }
+
     return 0;
 }
 
diff --git a/hw/char/trace-events b/hw/char/trace-events
index bc9e84261f..ee00af0c66 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -60,6 +60,10 @@ pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x val
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
 pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
+pl011_fifo_tx_put(uint8_t byte) "TX FIFO push [0x%02x]"
+pl011_fifo_tx_xmit(int count) "TX FIFO pop %d"
+pl011_fifo_tx_overrun(void) "TX FIFO overrun"
+pl011_fifo_tx_drain(unsigned drained) "TX FIFO draining %u"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 
 # cmsdk-apb-uart.c
-- 
2.41.0
