Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617383njc;
        Fri, 19 Jul 2024 11:11:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlx5ppvZNg/f/duJODi470uNPM5BUsZs/i/tX7R0A93n0INdo8FYsDX1uwIn2X/9F9RFfe89MwhbrYO+KnLzN3RnwFfR6A
X-Received: by 2002:adf:fd06:0:b0:368:78ed:994c with SMTP id ffacd0b85a97d-36878ed9ad6mr1702173f8f.17.1721412715168;
        Fri, 19 Jul 2024 11:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412715; cv=none;
        d=google.com; s=arc-20160816;
        b=onV+CJrZDq1iA/yTYAwNELQRIGvM13ytcupfpKILk54/1tfjUIqYYAhoxr2TmPWj3W
         7eAOa6npJxQHV9ZU9T2kpBpWWgtqSuKcW+RWk+EsY+0I45K0VVFOxFIDqY/g2BA/X10u
         e8F0ipBv9Kv/P5Otj0bD0qt7jpnWeQ4/6vN1dfIfitGiuxUcLfiodgIq1rhc02MJKiFI
         S3kkZthPJZ3VX4aiJbkhQX+1/QBLWFPkV4ClbCUOlJ8E4cOV+u/JLtbI+n9Btt3t2yk6
         lfa9nQHGe4r7UWouWd3RaWaZ5iNw002OCaa7EYyXuddhosh8anP5zhL5wczIpAz/ofOr
         zaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Lr9xFBvmiXrV+CsrPSg+/78zPNAgl06z+/3j2DOHoiE=;
        fh=VNzUq0W7W9bUfQuqCi55orXZUqXRgi/JklLYzCCmga4=;
        b=G5vKgpKGttDUyGZxBKpakqSC+hwlYfyhSVK/zhaPRd0gT2D0pVS2t3i8qx6TVhDzNJ
         qK5fipEjjg9f+EWn5VaS3pxIbB14PmOPB3OD5JrRilFp/CyIKDXNz5zKYdx2lahwKHqk
         /hD4520GwcWkd7SbuT5kUP61zdKnNn10ks2xWQp6DfAKQxlWiGjEj302tBMztnkZUxkK
         8Uj+wsBSzaBfKRAxvIc2tB0n6CISTu1TEy54eQoZ0Ze3kVS8ntfV5XsZJYOigCQSyT40
         piGL+TmdavZpk9+EJ60/w+EFCmdW0DtdWS9Cj2aIKHPB+QgNrEvCVbFBeCiX8DS4tZcQ
         FHnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCJMHolm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36878896b63sor604520f8f.5.2024.07.19.11.11.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:11:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCJMHolm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412714; x=1722017514; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lr9xFBvmiXrV+CsrPSg+/78zPNAgl06z+/3j2DOHoiE=;
        b=pCJMHolm54pdFwQ/9GRubPuTcHFtv7j0DvvdIG8IBDbfIYwGbllWeHWD6KESLJ5Gxb
         k4cVrvuFw8M89+dkUZZ5xrv9WMVQISAS+OY8KY1NS5vKsjLmFJD7zMwm7YPPust9akB2
         4ShMtz61cJOQViHsPmkvatbxYIhQEAcygB1EsX44+fpHe5GsoK1rYTGnWy8FxBVjgf60
         SzRdXaXQV5JSe8x8yewplqv7aHjJwp5oop1McoKPjiCnYNykbDgMOA6UvSPeGF7XB+jo
         YjUanJD3e0Pp1u5UihlZ6BOBkhDNsJ/mMUh2qWgNclF2+0SytOZSezvTnAPvNQ0loZeW
         9cLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412715; x=1722017515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lr9xFBvmiXrV+CsrPSg+/78zPNAgl06z+/3j2DOHoiE=;
        b=Wgpe42KVU+lXMOdT5zRubLawAJjRul+kRG6DcsEklqtgvaTTq4zpw2dT8DhQjJ7zpT
         eyVhjRk9uVhTKy5Mcg5lJctsQ+9zCUQ0j1KabSj8xYGXrG8M7ZN3ooLvao09svxKFMhR
         inAdLrtWX//1LObT9dnlWkCtfk5uS4RfTGwoCIRrsF0aAff1Wxgcy8LRQDxaL/eZDBM7
         MDRs3COFsdnk1M/EYui8OK8+hzfcqjGw23c6erXB0lc09BrxnfTtX0PCcxJd3uuy4hgQ
         Y2Qt0eBsMwLKgbQp2XqBGWGhn+pBl34VoKOOlcaB/EkUfUQcnLo72TEnAwKGLvttnQRK
         uJHA==
X-Forwarded-Encrypted: i=1; AJvYcCUW26OU/S9mqMXkXZS0Fvf+r16aP7TrW811ubb9kw6Gr/NXq0Su9cXp+hgAZ4XPNbbKPZiOv9FNoY/GotdiYT74fqMkqvgw
X-Gm-Message-State: AOJu0YxMO4GdqumbVMUZ8NHngSFEAHtiFw0YtzHeNjabXKX0qpcnacQu
	Acv5nl7oOrdoW/vSRyZzI9KWsZl6bGwXuXj3Ri3nvLYTXIL2ybh8emDLdWD9Tt+sxg==
X-Google-Smtp-Source: AGHT+IEqx9LH5SRstVmm6eRi3r01852AxHvWp7MOR3vnRYdIZMpHUdz7EkxQSStRpODYu2p4pEaVVw==
X-Received: by 2002:a05:6000:4026:b0:365:32e0:f757 with SMTP id ffacd0b85a97d-36831737983mr6929266f8f.50.1721412714557;
        Fri, 19 Jul 2024 11:11:54 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a95530sm55455065e9.45.2024.07.19.11.11.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:11:54 -0700 (PDT)
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
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 11/16] hw/char/pl011: Rename RX FIFO methods
Date: Fri, 19 Jul 2024 20:10:36 +0200
Message-ID: <20240719181041.49545-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NeEPzvufeLV3

In preparation of having a TX FIFO, rename the RX FIFO methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/pl011.c      | 12 ++++++------
 hw/char/trace-events |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 0ce91c13d3..c42c6d1ac2 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -174,7 +174,7 @@ static inline void pl011_reset_tx_fifo(PL011State *s)
     s->flags |= PL011_FLAG_TXFE;
 }
 
-static void pl011_put_fifo(void *opaque, uint32_t value)
+static void pl011_fifo_rx_put(void *opaque, uint32_t value)
 {
     PL011State *s = (PL011State *)opaque;
     int slot;
@@ -185,9 +185,9 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
     s->read_fifo[slot] = value;
     s->read_count++;
     s->flags &= ~PL011_FLAG_RXFE;
-    trace_pl011_put_fifo(value, s->read_count);
+    trace_pl011_fifo_rx_put(value, s->read_count);
     if (s->read_count == pipe_depth) {
-        trace_pl011_put_fifo_full();
+        trace_pl011_fifo_rx_full();
         s->flags |= PL011_FLAG_RXFF;
     }
     if (s->read_count == s->read_trigger) {
@@ -221,7 +221,7 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
      *
      * For simplicity, the above described is not emulated.
      */
-    pl011_put_fifo(s, value);
+    pl011_fifo_rx_put(s, value);
 }
 
 static void pl011_write_txdata(PL011State *s, uint8_t data)
@@ -502,13 +502,13 @@ static void pl011_receive(void *opaque, const uint8_t *buf, int size)
         return;
     }
 
-    pl011_put_fifo(opaque, *buf);
+    pl011_fifo_rx_put(opaque, *buf);
 }
 
 static void pl011_event(void *opaque, QEMUChrEvent event)
 {
     if (event == CHR_EVENT_BREAK && !pl011_loopback_enabled(opaque)) {
-        pl011_put_fifo(opaque, DR_BE);
+        pl011_fifo_rx_put(opaque, DR_BE);
     }
 }
 
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 8875758076..59e1f734a7 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -58,8 +58,8 @@ pl011_read(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x valu
 pl011_read_fifo(int read_count) "FIFO read, read_count now %d"
 pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
-pl011_put_fifo(uint32_t c, int read_count) "new char 0x%x read_count now %d"
-pl011_put_fifo_full(void) "FIFO now full, RXFF set"
+pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d"
+pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 
 # cmsdk-apb-uart.c
-- 
2.41.0
