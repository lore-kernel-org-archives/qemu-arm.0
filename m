Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617510njc;
        Fri, 19 Jul 2024 11:12:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3P+StcEOXvvX1rVm+2T7tAz7vHqwX9PEVC60WB6TCLUfV+TqnjOekPRn21iQZFrpXbNzaxk8OHvdtPF7MlzYU2hk5CSeo
X-Received: by 2002:a05:600c:3544:b0:426:6822:5aa8 with SMTP id 5b1f17b1804b1-427c2cc8481mr74920525e9.18.1721412728428;
        Fri, 19 Jul 2024 11:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412728; cv=none;
        d=google.com; s=arc-20160816;
        b=Vu66AGrNCojtP5J3xzov1K4f3V04VR7e7Xz//AX+0hcsvoJYXhkRzIHrgGJwBhfvkC
         5AYev+YnWT6frulmq2YGQq6q/J1V82GfabP+DhA3dRXti19bwpra4ZecVeDV1aouQh5v
         LWsPn1/CPoREJTJVtOGxVqD/W5q4/YmU/qU9Yyf5ukXFCLuYs2RPt+tcyMD+rQFvV6Jy
         NS3x1kGoi+ISq9iIyLL4bmVBJ0hmj00qrUFxCEMUSMy8jra815zEdiwXMJaASJWJw3U5
         mM4MzOU8crgmqaVw0VvFe05jrUzr+8xcGFKOiM0t8hqSupRRZFdRa8fssG/YGsx+fbHC
         m+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=liDvD10Kju4SXJGwkPuAqGOs/WSuNz1hvgqWr6MAicc=;
        fh=8ydSl5aXhyTkF3jjeJJa8Q35mEm90O76CfoC1xS93WI=;
        b=AbgMUI4cffhVyXv1rOf8wBDhsl3J91KmG9n6GUuQ5ZQPMg9lDPvxAwBcQ84i0ZZjpd
         MgdllrBWlWnw3th2uGrmtlRvBj2nJlYROrv9vxajCoofu2te8/aMurcfIs2pqmsc+D9W
         lP1CU9qfrgPAm9cmUh9xMq1/WzSf/mwycqp2/jC8ZXoKDNAW2HALxRrr6/xPLpDyxxJo
         76V5946qqP+gBJ6xuCl0RwKwphQTPbY71fY8TALx7y5bUYSnhZ0AM3yu9U/Cjfnw5MIJ
         YHZ01baRlf8Th8zBk2GdLSR/TMnMBjzKRFHd1FKIU36a30VL/VnSiFo+g4+V01HGrnsO
         upeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E28lBeNc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6ebc855sor8493175e9.1.2024.07.19.11.12.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E28lBeNc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412728; x=1722017528; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liDvD10Kju4SXJGwkPuAqGOs/WSuNz1hvgqWr6MAicc=;
        b=E28lBeNcca4FvxJJpxVqWKYLzuAOFtQKtgJWscbzgLrAn+aUr8gB79w7PwO9sX1b9R
         /L4sunHNFsT5hXvJ6mLPI2yCFGNnuPOICa4VBuCJq2kydbGXTFpRkTeMsKXs70p07od8
         E1CS86hd++WWrOym7CPyaYKmTyTUUE8hmZNk0O9ugMzn0v2NnpveCypwIeLGo3Wx7QJH
         pF1cWqk8Lh6y6pq4XnS/vwcrUWGX5PrOFD0bjBPrM1adYihLGRpeMR0862Z4pA+YLr5t
         GujgfqPAI/tjatLuGMH1+3A4Yi9T43QOi2OVQJitGSk2WPFzNzWypeJ/oZWu2NVq8MF4
         EfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412728; x=1722017528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liDvD10Kju4SXJGwkPuAqGOs/WSuNz1hvgqWr6MAicc=;
        b=lnGPC1WuNVl7BJ7+m3f2thIR0diTHJCpntyQGTNJZ1H2xA7OFcwjAxsFNyh2an8eps
         tCZqWaUYkT0OY+Ppxv0MuT62GFR5f1Yv/soYAQOh+IWLtBNYhBREnXgouqUgYKouQOCD
         w4/dZ2LXcelib9VCcOjIkk3oBePvxhiD6MepzSuGPZfYeWmCBeZ66xe2ckqe5YOqQZC+
         BXdtI+tIYkWoVBM22k9ohtR5LQakuWarjDMAlr1aPi09k+6dAkBcNmnx6StZABd1CF1E
         n9G5HQi+rbX6gssUNt/vlST1zwhQUIS73ibxKkG3posGSxCM2FQTayWRM5EunN4ry1nJ
         Oiug==
X-Forwarded-Encrypted: i=1; AJvYcCVI+UPhuuY6EewYoQWDQmuPOzxN1I/wq4GzxxjeBGvtNqJlXDjGWUodZpsH84o7FU9hLOXJuUkPxo+YLb0kbLNm5j/xHdwz
X-Gm-Message-State: AOJu0YwGF+N2eO09asaqLQuAkCgMhssUsZenvij1y571uTpZN5NXVsvj
	t/a84ynq2B0jjyKAl4CDjHbdgVCuJCg2KQw7ABrMW0KnOChaQ7koHRKVi1U1Frn7rg==
X-Google-Smtp-Source: AGHT+IHWtTELjCDNtCSmmXDnKB84VYtaNnBUuuXv6AU6MMAO1IwggvgbxulY77NjjwDgREO0mtuUEg==
X-Received: by 2002:a05:600c:3595:b0:426:5c81:2538 with SMTP id 5b1f17b1804b1-427c2cb8a05mr68634095e9.14.1721412727834;
        Fri, 19 Jul 2024 11:12:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6929827sm33457315e9.34.2024.07.19.11.12.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:12:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Tong Ho <tong.ho@amd.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 13/16] hw/char/pl011: Introduce pl011_xmit() as GSource
Date: Fri, 19 Jul 2024 20:10:38 +0200
Message-ID: <20240719181041.49545-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NIYDY57CKE3U

Extract pl011_xmit() from pl011_write_txdata(). Use the
FIFO to pass the character to be transmitted.

Implement it using the FEWatchFunc prototype, since we want
to register it as GSource later. While the return value is
not yet used, we return G_SOURCE_REMOVE meaning the GSource
is removed from the main loop (because we only send one char).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 30 +++++++++++++++++++++++++-----
 hw/char/trace-events |  2 ++
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 6519340b50..6394d6eb36 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -226,6 +226,28 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
     pl011_fifo_rx_put(s, value);
 }
 
+static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
+{
+    PL011State *s = opaque;
+    int bytes_consumed;
+    uint8_t data;
+
+    data = fifo8_pop(&s->xmit_fifo);
+    bytes_consumed = 1;
+
+    /*
+     * XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks
+     */
+    qemu_chr_fe_write_all(&s->chr, &data, bytes_consumed);
+    trace_pl011_fifo_tx_xmit(bytes_consumed);
+    s->int_level |= INT_TX;
+
+    pl011_update(s);
+
+    return G_SOURCE_REMOVE;
+}
+
 static void pl011_write_txdata(PL011State *s, uint8_t data)
 {
     if (!(s->cr & CR_UARTEN)) {
@@ -235,12 +257,10 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled TX UART\n");
     }
 
-    /* XXX this blocks entire thread. Rewrite to use
-     * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&s->chr, &data, 1);
+    trace_pl011_fifo_tx_put(data);
     pl011_loopback_tx(s, data);
-    s->int_level |= INT_TX;
-    pl011_update(s);
+    fifo8_push(&s->xmit_fifo, data);
+    pl011_xmit(NULL, G_IO_OUT, s);
 }
 
 static uint32_t pl011_read_rxdata(PL011State *s)
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 59e1f734a7..30d06a2383 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -60,6 +60,8 @@ pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x val
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
 pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
+pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
+pl011_fifo_tx_xmit(int count) "TX FIFO pop %d chars"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 
 # cmsdk-apb-uart.c
-- 
2.41.0
