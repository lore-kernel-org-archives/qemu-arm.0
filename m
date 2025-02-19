Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1627892njb;
        Wed, 19 Feb 2025 13:09:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCViiAK1hTbdX28h5DsIt9mcWhmneXWyLb+DAzeBgAxq5XluEh+6a5ydxa31+Debu2mjuut3/1xdO5pq7Q==@linaro.org
X-Received: by 2002:a5d:5f50:0:b0:38f:28dc:db50 with SMTP id ffacd0b85a97d-38f33f11953mr19419255f8f.1.1739999340624;
        Wed, 19 Feb 2025 13:09:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739999340; cv=none;
        d=google.com; s=arc-20240605;
        b=HN5fDH02gJvbXJMF/ZJQzeej1U3ceA4y+X6zSxZuaEfLt6/zL7ylg94o/DSRlwwBzJ
         E94XhFa4Pi2W6uT/OpjW2ZwzqE1GSgSCl8HI2At3MAZr4/Lydg1LPQgBW16UzRXTm/H4
         v8m3I6kubnTH9ls6cyGBlqiRVU1WEp2Yxn5ZcAYxVPvWOgM+5rwoy7cFKlLCaHCNVlf6
         am7arJa/nMQAgwekWe9F9AyU0oYplA4DjF/SVwWT3DIJNOtLbWFwaKlfIRC7ud8FcYB9
         jw8RHHPdq+OulkiEVH1eTM8fBQbk371Megt4ciV7NBqNhK6B2R4JzM27i9QaWdhnkHjQ
         ijEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4FHsuKvW5lxqHnKhRd7Yijx1j/tjAzvjfWfwUFBfXHI=;
        fh=pcb76TwSW7umJj2rWTjpWiLDAxqssg42Hzm4vEoJdP0=;
        b=X2YisN8hvW9EJ9YUV0zdBAuGWTwd2mT5hOmfE4WAeo4Qm7kY1wlOEWfmG7mJOhoTLe
         HQJsuchuk41JOIZZgmTwOjWKstg6+VYrQoHG1SZ9cPRTVNKo8LqzWecLQivp9wbBvec0
         upj4gkezPq5aAJiYd/PYg6OaP+ZfcIB4sFzUEJc2sfLmAFRWF9T5HFsapjVLfJOHSm3J
         5dWEpg3bbjzAR2oMW7GGS6kghktOhCj0CYGaCkw60Ql5RC43Vip3tfhQ6khcCOc/tiI8
         m4fRM51wh7AVcxSAmOG2d/cBjVZM/XhI2h3p1nY4rG07RZghH+g1CfZmN/ts5tqUpBkt
         hpPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gFP466he;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439851b1e7asor25332985e9.9.2025.02.19.13.09.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 13:09:00 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gFP466he;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999340; x=1740604140; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FHsuKvW5lxqHnKhRd7Yijx1j/tjAzvjfWfwUFBfXHI=;
        b=gFP466he0IV7cr7Kk2EuyMgh91SDQ/m0MltYygABYmthA0RQ7hnAUQGYnGH//TXRuY
         psX+MEdF4IE2+WvkxKs1EGQlAecNuZFA5yoI0EEanHDcy2K7K5hiQ1rPS0kUiqTnUxWS
         v2ax39QdMszZhM1OXdjOVOHRnfiIEwxL9oF+2ir7hZUr4GH9fxd5XMxgWb9N7TvSAAR5
         RWtwqVfh4sPf23S/CqCNRH4hNzQd1nV2UldKud1FEEKuiSAgPnJsymI1OE4rOPqdiiUS
         yNHRnKxIB0ZMpCQTIPgWhHz1Sk3wzwBLmkJdPewzUfNbZsPZ24jBw9ZRJ2UYco6SGRpZ
         o+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999340; x=1740604140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FHsuKvW5lxqHnKhRd7Yijx1j/tjAzvjfWfwUFBfXHI=;
        b=o5iLQGpJ8dxaGpCuxugxtohI4ySwGw6nIrgyqK1BnqqhiTum1IgPM4DA4aA7mj/mx3
         5Vp9+Pnpvs5pWUMy4IpH/s5B7yjHLT9dlgM1aWtozTkljQKkg3V8lTOeWicWdY5YEWBu
         Ud4Vq4/5ZsjwEPsUgE9r/wo9pfkttQke+oWzoePkQysk7N6aBbcvvC1UYBfhIDPr449s
         Af78WR6uW7hoRhi9sgGCM3MFOIqj5ii9kC5lwX8IqnOPyEZbCLxhK+DDXOkTqLth5ozF
         LmnUO+7b0m2cgj/sXx8Z+dfgQkSoZnFxPwTa8PviLi37EAK/ZquyQc8Ss5MSYppnVuqA
         84kg==
X-Forwarded-Encrypted: i=1; AJvYcCU362wlAFt2jVZZHb155Zddzo1lcLtQFzQeQBcSZu4H2p33kLPr2W8fF8l95FzV9MpIxyWvkbYOxpTOPw==@linaro.org
X-Gm-Message-State: AOJu0YxaB/GeTtiV8Upe0r1IuvsM1nMLMt96SjvLiGwaBm570lAEc8C7
	PmNr3PPtrlTmb5LT4u6b9OIBb7LoHLoDlvwKwdr1A+n4oRXXXirHVGgEbDyUnHo7AA==
X-Gm-Gg: ASbGncti522Lvtz6BBGcvWE1+CVc4p6+EucCFfp45Ev9CbKeg2tIjGjfBSYVllf3P5N
	GBd+Hjn/0dtXR84WvIBYNrRl/ELC1HEGPyt9WuL4WVk7NXApDDUt02JrGMU5F1q0jdg3InaA7sg
	0OQU2lP8z8VAVCWgnC2+ffNCYsRZCX54SLLvl6w7RfU5ePE8RMBS5n6fkMCVlC+0JSC/FS2cg2k
	UckLlCd3NlsijauhSSRhMuUVPzmUfzQUDhyfbTLXzJsQhuBfrdihw49fxqh5vs/NYUYtQ08IiZj
	uaa9oyPJ0NgkWI6lcWzSIDUu8+uh2+jT+YG/R1eLOCF0BBujxrNZJX18Xv2xeknE3w==
X-Google-Smtp-Source: AGHT+IERTR1XiiAxvQUqcL7HgCAWEcqCxi9fc99r9lHG3vrUskwUdQLOHiIzY3gm4LBo+mMusZ7Jww==
X-Received: by 2002:a05:600c:3b1a:b0:439:9274:81ed with SMTP id 5b1f17b1804b1-439927483e2mr72162935e9.1.1739999340068;
        Wed, 19 Feb 2025 13:09:00 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8730sm19267996f8f.93.2025.02.19.13.08.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Feb 2025 13:08:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>,
	Luc Michel <luc.michel@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <huth@tuxfamily.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH 3/9] hw/char/pl011: Improve RX flow tracing events
Date: Wed, 19 Feb 2025 22:08:35 +0100
Message-ID: <20250219210841.94797-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250219210841.94797-1-philmd@linaro.org>
References: <20250219210841.94797-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4G1bHhAci7av

Log FIFO use (availability and depth).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 10 ++++++----
 hw/char/trace-events |  7 ++++---
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index bcd516d682d..148a7d0dc60 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -185,7 +185,7 @@ static void pl011_fifo_rx_put(void *opaque, uint32_t value)
     s->read_fifo[slot] = value;
     s->read_count++;
     s->flags &= ~PL011_FLAG_RXFE;
-    trace_pl011_fifo_rx_put(value, s->read_count);
+    trace_pl011_fifo_rx_put(value, s->read_count, pipe_depth);
     if (s->read_count == pipe_depth) {
         trace_pl011_fifo_rx_full();
         s->flags |= PL011_FLAG_RXFF;
@@ -248,12 +248,13 @@ static void pl011_write_txdata(PL011State *s, uint8_t data)
 static uint32_t pl011_read_rxdata(PL011State *s)
 {
     uint32_t c;
+    unsigned fifo_depth = pl011_get_fifo_depth(s);
 
     s->flags &= ~PL011_FLAG_RXFF;
     c = s->read_fifo[s->read_pos];
     if (s->read_count > 0) {
         s->read_count--;
-        s->read_pos = (s->read_pos + 1) & (pl011_get_fifo_depth(s) - 1);
+        s->read_pos = (s->read_pos + 1) & (fifo_depth - 1);
     }
     if (s->read_count == 0) {
         s->flags |= PL011_FLAG_RXFE;
@@ -261,7 +262,7 @@ static uint32_t pl011_read_rxdata(PL011State *s)
     if (s->read_count == s->read_trigger - 1) {
         s->int_level &= ~INT_RX;
     }
-    trace_pl011_read_fifo(s->read_count);
+    trace_pl011_read_fifo(s->read_count, fifo_depth);
     s->rsr = c >> 8;
     pl011_update(s);
     qemu_chr_fe_accept_input(&s->chr);
@@ -496,12 +497,13 @@ static int pl011_can_receive(void *opaque)
     if (!(s->cr & CR_RXE)) {
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled TX UART\n");
     }
-    trace_pl011_can_receive(s->lcr, s->read_count, r);
+    trace_pl011_can_receive(s->lcr, s->read_count, fifo_depth, fifo_available);
     return r;
 }
 
 static void pl011_receive(void *opaque, const uint8_t *buf, int size)
 {
+    trace_pl011_receive(size);
     /*
      * In loopback mode, the RX input signal is internally disconnected
      * from the entire receiving logics; thus, all inputs are ignored,
diff --git a/hw/char/trace-events b/hw/char/trace-events
index b2e3d25ae34..05a33036c12 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -60,12 +60,13 @@ imx_serial_put_data(const char *chrname, uint32_t value) "%s: 0x%" PRIx32
 # pl011.c
 pl011_irq_state(int level) "irq state %d"
 pl011_read(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
-pl011_read_fifo(int read_count) "FIFO read, read_count now %d"
+pl011_read_fifo(unsigned rx_fifo_used, size_t rx_fifo_depth) "RX FIFO read, used %u/%zu"
 pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
-pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
-pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d"
+pl011_can_receive(uint32_t lcr, unsigned rx_fifo_used, size_t rx_fifo_depth, unsigned rx_fifo_available) "LCR 0x%02x, RX FIFO used %u/%zu, can_receive %u chars"
+pl011_fifo_rx_put(uint32_t c, unsigned read_count, size_t rx_fifo_depth) "RX FIFO push char [0x%02x] %d/%zu depth used"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
+pl011_receive(int size) "recv %d chars"
 
 # cmsdk-apb-uart.c
 cmsdk_apb_uart_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB UART read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
-- 
2.47.1
