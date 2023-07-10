Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351264eje;
        Mon, 10 Jul 2023 10:51:18 -0700 (PDT)
X-Received: by 2002:a1c:4b17:0:b0:3fb:b008:2003 with SMTP id y23-20020a1c4b17000000b003fbb0082003mr13797148wma.38.1689011478368;
        Mon, 10 Jul 2023 10:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011478; cv=none;
        d=google.com; s=arc-20160816;
        b=wGlUhy7HQTO0BqB8N6SKdRKQIddmTNxjKXgUDNF9QITFyl+7eBr5BU3otQnxXfHw6c
         sxTuzMZgA9ThFzUnnNqzgpzx5kJnLyLJMzEFbeI2nCJN0b+heUw69eok08W68p8ZO9bb
         CQtOpXfWVfXG6QUb0j/3tH+w4zrydulw2k+vByav+m56ZS82bJyRYsSKZp75j1utA/16
         /ilPTLhOLzCTxNXmroHCuPYmqzUWtkxd43CgLb58xG57kzW8o3vtBsX9b9nMDiCMMOWu
         W63GQDOA9XTbPoyeLgRI5ViCPkGfV1B9Pg7f9PoRg/O22/jfNGd7/8g22kQlB5Pj/2no
         hI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g1RcHKWAXUfeEYtWyqPORqFGKPtOv6GOxgVyqiigsFc=;
        fh=4TWVGTMFk+XB48cTX7H3L2FEUZf3X6lSQ5h15kr1III=;
        b=anNHZlhzHXk0vMJdgoLee3VJSmlvIJXpPyWJkdto9B0UDWScXHSetieaVMyEwzwhkh
         FyZ09GcgDTupU38LBCe4dpXIzNAuDnfQgd2RmtHVGhwRLtInzSiA48MJTxGUnx8op9eb
         3fqCHLZ0V3CZSk8plXinrErYYAhFsNELVvzmBnBR/qMQvn3fomWrO7wRjwVsi6MRgTKq
         P+neNhh/807L4ANKFVRlO54fH0CE8oK7AGlrVRtAJC/Rpgd3AsHjX0p8JwTQuE7juNpp
         Q5T3UQThXJeyeNhNI1wl1XbOqQzsi+QyK7UQz1hDGSalggOuqgnL3LvOd5+drGLy+F3s
         Lqbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5uUmDnN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 15-20020a05600c020f00b003fbc54b93ebsor70266wmi.2.2023.07.10.10.51.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:51:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5uUmDnN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011478; x=1691603478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1RcHKWAXUfeEYtWyqPORqFGKPtOv6GOxgVyqiigsFc=;
        b=y5uUmDnNbVC5zDbnaiFYq957DoXqqu8RAxBD+Y31SmxwKYvhYXyDnUznyyrt3IKYDV
         iqU8uy1ucCpoRNmb+IPUTJ4ofA+/rNgc2Tth6iCHJnLAm5qbO2hSYmrUoiZMK7GL3qeW
         0QZWB7Gp25J2NmBuPKqPWWOXDWp/fb2GdD8Zwwv6SI8TmScJ5xxy1GUNkDt1rS3oC+0g
         v6ES36YiNezCPn8K01Pc/kTut1OYRurXHFIfY3Xulq3gg8nLVQotuhIILhzjJ5BIBovw
         RSPSsWpa7cK1yHFhOcGsT+uNY7/Jp0k7V+W+iah2pHSg/CHxE+9pBxPVUcN7ibINQMC7
         179Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011478; x=1691603478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1RcHKWAXUfeEYtWyqPORqFGKPtOv6GOxgVyqiigsFc=;
        b=APrwrMLHWxUELY1cy4QC4nbHeP4IGPNLImUXreBblbs0R0XkAepoKAp9nmFkHAvD8k
         lobLwNnaYAj627IFyObB4s5JXnrNbIOdch1Hwcz0iNGMnfT1wusUSrVPlEkyK+Wg2l+y
         Z6QGrx0mNVxOrI8RWn3U/YWAcod9uVWjOeKXzYMp3LB0JYx6xp/UKWwRh4RJAMGB/rJ6
         wbAD8OJmeg/QzJTw9hQ5+tcg/afoq+L+x5ixwmjBH/alpwu/dUYGKfnpOo6yvp0iAnrP
         RSotVI2e7JqC3UuvFB3L2ajtl44vX6AQAm0yLhTFqmq9dIX/BekGmyLk44m4PXSXn+zq
         GTYA==
X-Gm-Message-State: ABy/qLbEeinXj/neLMQza6KnT2v6GYT30zRkjhySbdQZDP+owrusKCzu
	zS1No+Z011j/XLcDjNGe+6BDoyhe
X-Google-Smtp-Source: APBJJlEx0hBMzdSLWhtqdB4JBGPuHQNxCYSm6BEWNz2s21RtzUHtEVpA3XBVe+QWqAST5dYmUa7SLw==
X-Received: by 2002:a05:600c:11cf:b0:3fc:e7d:ca3e with SMTP id b15-20020a05600c11cf00b003fc0e7dca3emr4982933wmi.2.1689011477981;
        Mon, 10 Jul 2023 10:51:17 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id w13-20020a5d4b4d000000b003143765e207sm30733wrs.49.2023.07.10.10.51.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:51:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/11] hw/char/pl011: Display register name in trace events
Date: Mon, 10 Jul 2023 19:50:53 +0200
Message-Id: <20230710175102.32429-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230710175102.32429-1-philmd@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bPVrh3h7CgBg

To avoid knowing the register addresses by heart,
display their name along in the trace events.

Since the MMIO region is 4K wide (0x1000 bytes),
displaying the address with 3 digits is enough,
so reduce the address format.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/char/pl011.c      | 25 ++++++++++++++++++++++---
 hw/char/trace-events |  4 ++--
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 73f1a3aea2..c3203e5b41 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -51,6 +51,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define PL011_INT_TX 0x20
 #define PL011_INT_RX 0x10
 
+/* Flag Register, UARTFR */
 #define PL011_FLAG_TXFE 0x80
 #define PL011_FLAG_RXFF 0x40
 #define PL011_FLAG_TXFF 0x20
@@ -76,6 +77,24 @@ static const unsigned char pl011_id_arm[8] =
 static const unsigned char pl011_id_luminary[8] =
   { 0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1 };
 
+static const char *pl011_regname(hwaddr offset)
+{
+    static const char *const rname[] = {
+        [0] = "DR", [1] = "RSR", [6] = "FR", [8] = "ILPR", [9] = "IBRD",
+        [10] = "FBRD", [11] = "LCRH", [12] = "CR", [13] = "IFLS", [14] = "IMSC",
+        [15] = "RIS", [16] = "MIS", [17] = "ICR", [18] = "DMACR",
+    };
+    unsigned idx = offset >> 2;
+
+    if (idx < ARRAY_SIZE(rname) && rname[idx]) {
+        return rname[idx];
+    }
+    if (idx >= 0x3f8 && idx <= 0x400) {
+        return "ID";
+    }
+    return "UNKN";
+}
+
 /* Which bits in the interrupt status matter for each outbound IRQ line ? */
 static const uint32_t irqmask[] = {
     INT_E | INT_MS | INT_RT | INT_TX | INT_RX, /* combined IRQ */
@@ -191,7 +210,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
         break;
     }
 
-    trace_pl011_read(offset, r);
+    trace_pl011_read(offset, r, pl011_regname(offset));
     return r;
 }
 
@@ -234,7 +253,7 @@ static void pl011_write(void *opaque, hwaddr offset,
     PL011State *s = (PL011State *)opaque;
     unsigned char ch;
 
-    trace_pl011_write(offset, value);
+    trace_pl011_write(offset, value, pl011_regname(offset));
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
@@ -252,7 +271,7 @@ static void pl011_write(void *opaque, hwaddr offset,
     case 6: /* UARTFR */
         /* Writes to Flag register are ignored.  */
         break;
-    case 8: /* UARTUARTILPR */
+    case 8: /* UARTILPR */
         s->ilpr = value;
         break;
     case 9: /* UARTIBRD */
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 2ecb36232e..babf4d35ea 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -54,9 +54,9 @@ escc_sunmouse_event(int dx, int dy, int buttons_state) "dx=%d dy=%d buttons=0x%0
 
 # pl011.c
 pl011_irq_state(int level) "irq state %d"
-pl011_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
+pl011_read(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_read_fifo(int read_count) "FIFO read, read_count now %d"
-pl011_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
+pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
 pl011_put_fifo(uint32_t c, int read_count) "new char 0x%x read_count now %d"
 pl011_put_fifo_full(void) "FIFO now full, RXFF set"
-- 
2.38.1
