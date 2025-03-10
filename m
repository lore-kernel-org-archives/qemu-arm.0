Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp867491njc;
        Sun, 9 Mar 2025 18:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2wlTLEbNsN/O3rlxbp01/F01xL7VJ2RsFXYClijR0owaQEslxFjhZXhu/uUHDsPZWqrTYIYMzF5SnMg==@linaro.org
X-Received: by 2002:a05:600c:3544:b0:43b:c878:1466 with SMTP id 5b1f17b1804b1-43c601d94f1mr66977675e9.8.1741570146505;
        Sun, 09 Mar 2025 18:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741570146; cv=none;
        d=google.com; s=arc-20240605;
        b=kHo8KLn9rmu0HZ0vWRA3NHzwiTVOAOLNmkkdFWlYECzKnY275jVWJcgh00Kf+72im5
         fh2jrFjJghS4l70XA8mKtKoreKaSC4svnCe4qolLNHRf0TbPQfTFSIWeb+GBX9Gn2C7u
         exuVhXlp3YLwg9aSZ8lqoHi2pPQ4pPzsFNTmCzR15tS5K+Kps49xcBT8BwwMk/sInsOw
         cARCfVzbGCCEbjxqpLzVYsRjAMo2o0HerpeRBOTdgtRHwFkrqJiPUMH6s40XX9TtNxDP
         V3IlM84bIlBclgnvuI/znO+aJOFbPW7Dto8MOHQcGNhacatN51PdS2rIyC+xitJBQV+E
         PYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Rrde3KHLzAFDrcctuuOnFTDDeYEo7R3jlkMLF4h0mXs=;
        fh=K3s2boVWk2Hv5I3B+dvnQynhbLdnegZVmBd5oGAYt54=;
        b=erVYxW/kt4/soAYAUnpK63BJuxnL0DxWOxcJ8iT6QDfx3sbDswupYLX+qqCxbtqikx
         dn7z0kD4wu0psSXHQ1SwRzc3E8mTqVjwTbknDdqGx6oivX0gU11pgUH/4GIMIjPEIUM3
         A/sa1iMlKZfz1fzhuuvrHZEQB3dMDxGV3T2cqcEFoGUfAMXS6yDbxWYR/HMbg4SWdSLU
         AO63GD3qu8CH+mbxCW9nMEWMHaml4itaZXLvwZC6dGBFR+b4SbwhvvsvMMKvM6AoBfJ5
         GG0qcSJfy36DSjhHEFyuaMVaBNXfk2dIFPQyBzUAI9guSFTuDPhFbZCSLmp5SUr4euB2
         pWZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvRoWZgp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43cf1b0c05fsor3778495e9.0.2025.03.09.18.29.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 09 Mar 2025 18:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvRoWZgp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741570146; x=1742174946; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rrde3KHLzAFDrcctuuOnFTDDeYEo7R3jlkMLF4h0mXs=;
        b=mvRoWZgp0wC3eYEEO3pvYlSKeYa/UdI+CKoOZUj6rhIqP1ZWhq5CMhPK3N5YjIaK6F
         n+pTJACF1S2+T8xEwMae3weyHx8zqlPUv3/n8Mqu3AWuDDnNApafmHrDtwq5UoX9yC9H
         m9jjJ8GKMGdLdR0FGuje+Cvoxxw1r8KTOvd18evgm/vLQgFJpPGvpEo7+LMUDL5x/0S5
         9Mwxh4jl8Q9jVMVxt8p7r7cKCOysJMiLOGPdiH46i4tZmtC6gMq2viItfFp0gpD6CS7V
         ohemDV37cjjCJWXOUhkrzcuvubZxpGwSNtK+y7GBZ6c3FysiYfNnUy0ph13t2+uRiTbV
         PPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741570146; x=1742174946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rrde3KHLzAFDrcctuuOnFTDDeYEo7R3jlkMLF4h0mXs=;
        b=bU683tC+SqmKE1xXhbrNXdcn4m+vkRJHQtpVzTq5gX+MF2ACJjd20xEPDvvNU3n47a
         rKRtPzWqhwFlUYTTJCVoT+e1jfiVM+Gn+ILw4vfgoF5ac4JyydMCM7+DOwnROf8yRInG
         6I5dUx2aj2uif/pYWFHOHcpEMggCz6GSX7FtlDOPVHzZs4/zAwKgjNF/4hgAQpu9JCeC
         EEQJzxVUo6CQLrRtGuOVX9dsmX66WdWeVvHsgy5lV3Z6D+GFHEQZ8rLK+G9xChYi1DUy
         EP57hMdDi9HlVTYx/oseIzYRjJDFerzVpuiY20SHw9B8FbUYLQ8ShI7cqzABS97E2e1+
         rluQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTxfTmWwT3o3IV9djGwIDIbtPPj47e6MNEAgBjeBRW3TNIFIQrdyxF9GXcBfvfrHSHnlMiXLT0s8hIVA==@linaro.org
X-Gm-Message-State: AOJu0Yx7sS9tH59t3NzamOl9YcMoZTFkMVN3s07xSwndsRO0GJuQt2x/
	3lBGLeY4yWgrWdF9CUwuOYOIVJ7Iuu9YdICc+bqOZ5lyfjMipuPa+bVBaKGgGksQBw==
X-Gm-Gg: ASbGncviN1faOyOiyA2Kg9OKh4ppuNB1REENu1OFmhsd2jc/4+qXYWHgEBSkW0HY9jw
	zYHAd7I0eARuiZ6E367GJiqZvcsz5h24Oli1yg3yFojVhsvM5vR/eyHzRGaNHcQ5lMpvKKPsNvq
	jjfhPS4deOfmb8gd6sU8tTiV4UAh5vW/bjC8v/mlQJcnmWgJDmxLifro3q4UMKauMJrlchANSfZ
	qhcCRawjtpN667w7xem8RjL3xvQmf58ftmA0ITpyleA7QUVsRzwA2GjHOkJd0ivJlJcwLcIlBPN
	c2vovP6w2+0NI9trT6m+lZ5tizEnN/fYfpQHzs/NoORmZT+Wk4c4wfg0CwtHSEW/guqVP8jJtJp
	9PfC4d8HyjM6ig7lNwbs=
X-Google-Smtp-Source: AGHT+IEjjbNUd/fjjVs/TgqBs+38DGmL924XOhJ7YZDqRqjfyUSLEZxaWX1770a0FruR1ihuojC2sA==
X-Received: by 2002:a05:6000:402a:b0:391:2fe3:24ec with SMTP id ffacd0b85a97d-39132d3c1a9mr7994487f8f.14.1741570145997;
        Sun, 09 Mar 2025 18:29:05 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfe0004sm13025061f8f.40.2025.03.09.18.29.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Mar 2025 18:29:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v7 7/7] hw/char/pl011: Implement TX FIFO
Date: Mon, 10 Mar 2025 02:28:25 +0100
Message-ID: <20250310012825.79614-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310012825.79614-1-philmd@linaro.org>
References: <20250310012825.79614-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VC/j051QRMgG

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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 35 +++++++++++++++++++++++++++--------
 hw/char/trace-events |  1 +
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 6d26a3e13f8..d93cd8b3f0e 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -258,6 +258,10 @@ static gboolean pl011_xmit_cb(void *do_not_use, GIOCondition cond, void *opaque)
 
     count = fifo8_num_used(&s->xmit_fifo);
     trace_pl011_fifo_tx_xmit_used(count);
+    if (count < 1) {
+        /* FIFO empty */
+        return G_SOURCE_REMOVE;
+    }
 
     if (!qemu_chr_fe_backend_connected(&s->chr)) {
         /* Instant drain the fifo when there's no back-end. */
@@ -265,15 +269,23 @@ static gboolean pl011_xmit_cb(void *do_not_use, GIOCondition cond, void *opaque)
         return G_SOURCE_REMOVE;
     }
 
-    buf[0] = fifo8_pop(&s->xmit_fifo);
-    bytes_consumed = 1;
+    count = fifo8_peek_buf(&s->xmit_fifo, buf, fifo8_num_used(&s->xmit_fifo));
+    trace_pl011_fifo_tx_xmit_peek(count);
 
-    /*
-     * XXX this blocks entire thread. Rewrite to use
-     * qemu_chr_fe_write and background I/O callbacks
-     */
-    qemu_chr_fe_write_all(&s->chr, buf, bytes_consumed);
+    /* Transmit as much data as we can. */
+    bytes_consumed = qemu_chr_fe_write(&s->chr, buf, count);
     trace_pl011_fifo_tx_xmit_consumed(bytes_consumed);
+    if (bytes_consumed < 0) {
+        /* Error in back-end: drain the fifo. */
+        pl011_drain_tx(s);
+        return G_SOURCE_REMOVE;
+    } else if (bytes_consumed == 0) {
+        /* Couldn't send anything, try again later */
+        return G_SOURCE_CONTINUE;
+    }
+
+    /* Pop the data we could transmit. */
+    fifo8_drop(&s->xmit_fifo, bytes_consumed);
     s->int_level |= INT_TX;
     s->flags &= ~PL011_FLAG_TXFF;
 
@@ -284,6 +296,11 @@ static gboolean pl011_xmit_cb(void *do_not_use, GIOCondition cond, void *opaque)
 
     pl011_update(s);
 
+    if (!emptied_fifo) {
+        /* Reschedule another transmission if we couldn't transmit all. */
+        return G_SOURCE_CONTINUE;
+    }
+
     return G_SOURCE_REMOVE;
 }
 
@@ -313,7 +330,9 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
     trace_pl011_fifo_tx_put(data);
     pl011_loopback_tx(s, data);
     fifo8_push(&s->xmit_fifo, data);
-    s->flags |= PL011_FLAG_TXFF;
+    if (pl011_is_tx_fifo_full(s)) {
+        s->flags |= PL011_FLAG_TXFF;
+    }
     s->flags &= ~PL011_FLAG_TXFE;
 
     pl011_xmit(s);
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 730d6292a2d..c377f971a6c 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -68,6 +68,7 @@ pl011_fifo_rx_put(uint32_t c, unsigned read_count, size_t rx_fifo_depth) "RX FIF
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
 pl011_fifo_tx_is_full(const char *desc, bool full) "mode:%s full:%u"
 pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
+pl011_fifo_tx_xmit_peek(unsigned sent) "TX FIFO peek %u chars"
 pl011_fifo_tx_xmit_used(unsigned sent) "TX FIFO used %u chars"
 pl011_fifo_tx_xmit_consumed(unsigned sent) "TX FIFO consumed %u chars"
 pl011_fifo_tx_overrun(void) "TX FIFO overrun"
-- 
2.47.1
