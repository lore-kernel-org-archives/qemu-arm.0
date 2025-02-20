Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1887789njb;
        Thu, 20 Feb 2025 01:30:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUVrumZYOZIfatmPNdGRcsnge6qNGzF96I7wy5dTW70FnDG9eicPjNRdyr/DtIHSFMPDGFNsfbKPoXbyQ==@linaro.org
X-Received: by 2002:a05:6a00:9284:b0:734:b53:5826 with SMTP id d2e1a72fcca58-7341727f0f3mr2535590b3a.14.1740043802906;
        Thu, 20 Feb 2025 01:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740043802; cv=none;
        d=google.com; s=arc-20240605;
        b=LkKssQhR7YaTlbczRnKcbLd7uhEflJUWShqyQQi6OnbFCtaoEAERjmWfqbLW/Q8Y+T
         pkrF72AMCMQLE/ggnFSiN670jH+ntZ7yPhkrFXhgEHMg0624kORUFZ+oksKGvkgp7WHi
         aR9q8bpC/ZCoZeJldSQYBntVyPdDn8yHVDVDzhr9NRbTyBXQMEgQWMYugCo4SpPTZ54Z
         ZIcvHHOnKr0l47mazb07wxqSJKgxNkVcwn6jL5Mp+gHhwEt7gr2wLwGzB4/Mmjz5rtjw
         V5XK15cdrsxkQtSTxZI0ojywD+RQAaaIhr3GE8Ub0TtC6jmQWw3UDfrFuYMwzjWU5yyy
         Egsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X18oBKzoazjCfVrAQBfQueu5gB0Bm4XcS+Nhh43VH0E=;
        fh=sKQnHI3JfNXcud/pq+qbFUI4G2jy5cc/7Y+VXlv5V10=;
        b=YFH593ySyFTWFzd2cEBM8FKa163Ra2i/Eg1azrgygvmgyEC+F4m6Mb2FgtaC9EBaiM
         S9IDjHNGLt0lgA/cnNRjvEzBZufy97TAUtuFA4ydOUSw2VB4Go/xTihJyDFng47TRwcn
         JZKZNoPIg+Zh1A2QzVUE7TNlsxTdy3CF390mZVUcYwNTJCX1LV6S1/FFqcJxorp8IqHm
         OLUv1yHeQ0S2o1EoY5LzE24kXMVkQ5ykB5zEeKzLLiVbwKp+EnSEcypx4262wDI1RWet
         4F6URRjw0oURfOH9m/4RUoi4uNKrmP6P0+7WC9IHshmKjIiRSPQa5oUcEUr/eCre3jpS
         GJiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XrSuuE2n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73269ab71d4sor6731272b3a.4.2025.02.20.01.30.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 01:30:02 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XrSuuE2n;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740043802; x=1740648602; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X18oBKzoazjCfVrAQBfQueu5gB0Bm4XcS+Nhh43VH0E=;
        b=XrSuuE2nkLXSgSoZUWj6edfkiIh9/D54V5iEhJ3/xR9v7f8oYJD3L5SnxsbxxeI1EJ
         7srh4gkLVtuk+/um31xkbskC/owxm08VWO5Z29cS0rJj+8wayxMYWC85JHZ3NzrO327r
         4XUXbW9QPtDQiU3VDxMaCQ9OwiB0I/KLOmhJOxC54Wej8c8zdW5tOt+5WY0OCZ8aBtr7
         6ob6c0+hRTZevwePwOA0gTmVj3L2xDHDUvifLbku7FjKSyGUNDxekb1LrQnRb+0/MUeo
         4X76aoPJae9Zhi4KETtEccg1YgEJS7fSvXO4QJ90j65R6LQPgsx6nJBpcy8bP35OsQux
         uIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043802; x=1740648602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X18oBKzoazjCfVrAQBfQueu5gB0Bm4XcS+Nhh43VH0E=;
        b=lklqL1OWnQmt1go+V7FXTO5CSRwgaLy2qzRW9VsSKDGf5SwUdsJffuNhtkVpr4AUxD
         O1VO3PqOHRJl0ZZYTrJ6TJWQFt/8Cszve6kcTCIEhRGRshtOPR1AOJdbnh4x8U2btiYb
         LPhJf/Poz4VhOafRdrA5Ys5SJtT1w0vj/Qq40IyOYc/7uaKzY59C6XZACyysk0Y7gqm7
         g7LsAocezNSAzmzlVIaepM5eA7qlxH2a4YBpOoHt7mOw6sMaNuGGcM9uzq8Q1vv+upWS
         g8bjp7epaUCcDebURQiE7E1MmQ7Qlim30zdiav1kaHWV31gIFWeMt1KVpwn1i3gTTCLf
         TBaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMhfFcEUjLPAvEsXGkirXufSuD7b9A7jEeKSK0oDzjRr+ThpwQB6L8P/TKl9h9He9cfK/fJ8AoEQH6nQ==@linaro.org
X-Gm-Message-State: AOJu0YyiJ5NVL2FjyDguXntmVDSdUyl92yXal7HYUG4q3sXg80rO6oNs
	qa1yNCrhdAZf6qx75ACi6VAP3BhZpkFaycMTibIrHuIW2/MmB0PtbeBesg45ELs7lA==
X-Gm-Gg: ASbGncsprMXOHuH+1GjYE1uxLc7F+FgGPoO1fJH8xiyitxV6R4kDqFRB5Aa/6l3xXyF
	O6aKMimwyfBQdTe8Fw2Pl+gFalcXIW27bQ4NVIRKD2FKSMQ3tIq/eHlIOQPv5o5RjGTRT5yWdDA
	TKWlSxNHtFebKX2QNIc/nmp2ktehhXLPoAgZjmt8PedRoxO4yJu4CowHdaMaCE24ZQQ/JlBKgvH
	o7czk7AEV/I2WAs4iaDk+SXmE7Pg3z3X9RuOSzNv4uhJXxntFUSPpIL9JAoPQt2/I+PkHcoWnPQ
	R5ju0VNXX+PrqycHA/8QMWPVvJogF3mf+OiImt02odobnKJmBCrjrOCgeK0a3v7z5Q==
X-Google-Smtp-Source: AGHT+IFsfx5MgTFFxNPP9UpuBqTLo0Re7CfdCmPk801bj7BN1KDQujSk/EOnRTupB/bvHjXFwNsLLg==
X-Received: by 2002:a05:6a20:72a0:b0:1ee:d07b:5ff2 with SMTP id adf61e73a8af0-1eee5dab919mr2997879637.40.1740043802484;
        Thu, 20 Feb 2025 01:30:02 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732581df0bbsm11052819b3a.156.2025.02.20.01.29.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 01:30:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Huth <huth@tuxfamily.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>,
	qemu-arm@nongnu.org,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Luc Michel <luc.michel@amd.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH v2 3/9] hw/char/pl011: Improve RX flow tracing events
Date: Thu, 20 Feb 2025 10:28:56 +0100
Message-ID: <20250220092903.3726-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220092903.3726-1-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jD+veDJr9g1P

Log FIFO use (availability and depth).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luc Michel <luc.michel@amd.com>
---
 hw/char/pl011.c      | 10 ++++++----
 hw/char/trace-events |  7 ++++---
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 5bb83c54216..f7485e7c541 100644
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
@@ -498,12 +499,13 @@ static int pl011_can_receive(void *opaque)
         qemu_log_mask(LOG_GUEST_ERROR,
                       "PL011 receiving data on disabled RX UART\n");
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
