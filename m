Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp976484njb;
        Sat, 8 Feb 2025 08:39:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqEn8mdzOblxnaDij6qw/FXHOh8X9m0jWTwGn0nqGTyR+suPuMyYDJX9AQF0/aouTLb4ZlVgci4uOGSw==@linaro.org
X-Received: by 2002:a5d:584f:0:b0:38d:d544:8bc6 with SMTP id ffacd0b85a97d-38dd5448f71mr1372212f8f.12.1739032771209;
        Sat, 08 Feb 2025 08:39:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739032771; cv=none;
        d=google.com; s=arc-20240605;
        b=JBWAdfCD3WKfylbUUi09q4nFF7HZRqdQbm/w7YDwiYsZOHN7uya1SRDG1fKf4xKBoA
         hz7RdH/GrOd3DD5aaV2esgMjEUkNAnEEjV+z4/bI4j9WmSopHUWrqhdW4h2VY9TlKQ41
         vQ7g+Xj0+bFHCmK7U3i+Bqv33zhYJBcBSFl5YJYpPK5hkxvDL1G8iDdGNq5dXWyxvExh
         1olcHtKnxPtZw4qxS9Eoro//3cKnb9bsmeAhpZJRJ3gAMpSNkX/84WTqs+ya4EKZ3jv8
         w0Osg7N9eBmofayn5jBFUbdlfBkmKhVA3QpEnMPZBAfzgUtP/ojaVPJ1c8GcjzOEItfB
         EP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BHNgIGYUe1Afrdl08LOWU03e5kzF56Zt76xmOxbCwW0=;
        fh=Z9p9mN9Dr7I0nkGwCdwgpQvPK9WYeKBNsY1l2I+6sDo=;
        b=HPWziiK6Zms6mOwbY6vNkYLjY354EKwMr4RGNQisnewO7jc7HRhuo8EK8Bg14buq3P
         JhZotEyHFb4ahumOaZM2g5YyKePOmUSW+k0493ZDPwn6Ib7yIFgY6ogva6NMogmM6Hf+
         pMp+r3eFA94GnDHSk4XSGS7NhNRjs14/DFUty9aT1CgFFN0dl+nFBgqpEdS7quSLLhxm
         EY9O4AeojaVIOrbskOmZPC/0slbilGiXD/zduLO6ala5A47f4rEGiB5aMgbPZJJ7w8J9
         KBK1NqRKXHcoc/yBDvEd5TNYBoan3N2p6BqUOGgAVhkBZPSQxXUyXmzKSbADsvNlX57D
         fvMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ScKkFNup;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38dd3c44052sor345510f8f.2.2025.02.08.08.39.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 08 Feb 2025 08:39:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ScKkFNup;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739032771; x=1739637571; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHNgIGYUe1Afrdl08LOWU03e5kzF56Zt76xmOxbCwW0=;
        b=ScKkFNup1NC2bdFt22uh9k9cJ+UtmiMH9q0yzTBqdcJgt/cDVEOxmvUrBKMFYyrf0v
         7uNeCGrbX2OCp50QRazyfeXcNwlsY7NlA8IeGSer5qRo3LLHHAydEZ8MexWl1VEMT0Qz
         mnnsbgnaR8vb6pKe/AbgPE6InngjebrzwxRRkyycdH/SviBfB/VH1ZnHWi1GkXgeAM28
         bG2Q/5gGwUcPIT2X7coDFDprttVZs3dM9cZSBO3Lv/cdEE9/FibzkQ818XZdiChrJNIJ
         TjusDj6wL+eItUiweo7j/awePaHA6MOwY9qQV44G9yJROHZjpxgOo8I/6dpqcdrG9kwi
         DSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032771; x=1739637571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHNgIGYUe1Afrdl08LOWU03e5kzF56Zt76xmOxbCwW0=;
        b=NVP0fkfr64aEM4MHtuCFg7UKmL4xdjWYV5/7s0qRuL2MqhjWE0AObxmbVbiNt0HN7v
         O7misD8leBaNm08hj1T26IaU2h16kkfnKJfhd2/2w6CRhRq73zRRKXt4IL2ZWirsRJIs
         zY5IpigXRybL56kOtH6KoSqC/zYbMuV74g/FItB3rbHpGgmxZosX629DkY10apSIIAum
         5XxBvT7ZWKn8quCtATEpodf7+VJ4qxGdfJIl2NL6MrwnlP1MgfUTy5arj8ANiniN1R6N
         Cr9hxhieoZ4RhYWpK0iEH/I1DtNU8hfkA5q07LwCqbjscJCKJPrCwebh6WZ5jdzqfELO
         zS+g==
X-Forwarded-Encrypted: i=1; AJvYcCUIiOqXG4mULE4fTt4dE13FBXlkatp20nrMZVz9gZsBII0BPEQ+MzoK4n4I59od9GfoCClW+0YaMzXmSA==@linaro.org
X-Gm-Message-State: AOJu0YwWz4AgXChGX/oK8yxTIz0RWTn6w3Mqbp6fmtQFsuVad2pK3pZf
	hecqm9YQ1LnyXiMJ15am2mgZ3z9KP/q96Q5B+9N7AV2pUzsIzN05eWhe4yXV1g6hLg==
X-Gm-Gg: ASbGncu0eYrvMYhBaKnNmo2neWBIT26nwzEOtiqdYcvEHuQ5aIauuUup/3gqBOigzRI
	nwCYwnk+u38VSAkzSRohUhpri/DzIUmtLTg5o5+GyQznBuPmQju2n2okmGldbHn0ot/8yqoCft/
	HNNWDaAIEKTrdllVk7GZfsBaj5n7dJ9c8odmf6nzxSKfduaU9oyOjYWwCJvbn7/cVrFyOOMyH/p
	Q0ReoYDk3SLyEx2CEZ+cAko8/zBb4YEvVtWU4U4xT9GjOfSUsCOlKLvFbAWJzve/qmiuO/dB1YP
	WIJG/4bT+UkgKorIglhEN/GwWnE6JQZeTAa7I/XuttnFtqJVef7ECo4Yrbs6ZExBaw==
X-Google-Smtp-Source: AGHT+IFYXCzbTFyNpFo+/GYGePnB+ahiUdqXKhY+NZKi+ZPsvLUsiHHLIKejAHlbITfeO0ayn66qUw==
X-Received: by 2002:a5d:6d8b:0:b0:38d:d328:7987 with SMTP id ffacd0b85a97d-38dd3287fd1mr2148023f8f.40.1739032770614;
        Sat, 08 Feb 2025 08:39:30 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd1d3a2c3sm2661793f8f.50.2025.02.08.08.39.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 08:39:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 3/7] hw/char/pl011: Introduce pl011_xmit() as GSource
Date: Sat,  8 Feb 2025 17:39:07 +0100
Message-ID: <20250208163911.54522-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250208163911.54522-1-philmd@linaro.org>
References: <20250208163911.54522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5Xm7m3kH39zX

Extract pl011_xmit() from pl011_write_txdata(). Use the
FIFO to pass the character to be transmitted.

Implement it using the FEWatchFunc prototype, since we want
to register it as GSource later. While the return value is
not yet used, we return G_SOURCE_REMOVE meaning the GSource
is removed from the main loop (because we only send one char).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 36 +++++++++++++++++++++++++++++-------
 hw/char/trace-events |  3 +++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 807fcdee50b..b9c9e5b5983 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -226,6 +226,32 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
     pl011_fifo_rx_put(s, value);
 }
 
+static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
+{
+    PL011State *s = opaque;
+    int bytes_consumed;
+    uint8_t data;
+    uint32_t count;
+
+    count = fifo8_num_used(&s->xmit_fifo);
+    trace_pl011_fifo_tx_xmit_used(count);
+
+    data = fifo8_pop(&s->xmit_fifo);
+    bytes_consumed = 1;
+
+    /*
+     * XXX this blocks entire thread. Rewrite to use
+     * qemu_chr_fe_write and background I/O callbacks
+     */
+    qemu_chr_fe_write_all(&s->chr, &data, bytes_consumed);
+    trace_pl011_fifo_tx_xmit_consumed(bytes_consumed);
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
@@ -237,14 +263,10 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
                       "PL011 data written to disabled TX UART\n");
     }
 
-    /*
-     * XXX this blocks entire thread. Rewrite to use
-     * qemu_chr_fe_write and background I/O callbacks
-     */
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
index b2e3d25ae34..3d07866be5c 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -65,6 +65,9 @@ pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x val
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
 pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
+pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
+pl011_fifo_tx_xmit_used(unsigned sent) "TX FIFO used %u chars"
+pl011_fifo_tx_xmit_consumed(unsigned sent) "TX FIFO consumed %u chars"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 
 # cmsdk-apb-uart.c
-- 
2.47.1
