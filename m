Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1286639ejb;
        Mon, 22 May 2023 08:32:10 -0700 (PDT)
X-Received: by 2002:a5d:4587:0:b0:309:3c24:20c6 with SMTP id p7-20020a5d4587000000b003093c2420c6mr7421098wrq.38.1684769530385;
        Mon, 22 May 2023 08:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769530; cv=none;
        d=google.com; s=arc-20160816;
        b=WeZ34mP4QpvJQne2SAwpWnD0R02WrOUZSz9xi9+4W15TkfdjdErFN8Cotfi16iJcJe
         PFzC59QEIiwFCulxlXiDJ6i99oAZO+RKUMposRROz7mYHwxvLKIp5KSzoX2zjJq3BS7r
         GavLTC0lJnZwef7Gk4itVkmXLribZHHkfHc3vtY+dNVJAsRHytJFHxYQrWic3oXzPj1N
         q9gc5MmfveTack4ssOE2qxQ/7brjiHGlRki4DiXNAPZXg/MhF3LS7DbuLD4xZ22RF5Kn
         vhOBiR80ArBoOjamEXsERMwbcwvZYvFON3bSyxsdI7KI/Jq2fQSOupqQLPHNhvq34EfF
         Frxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DeXq+k+iZcDwEahQV3X8F7cWs5VQQu6bE5Hamux2tak=;
        b=lK4o3Cc9YKb2TwP7EOjfXi5cIwxHOyDkHFXq/ipNrkToykhHnJAHhGZ3jalbip9ID/
         82SEUeeTF1FSOdfgXBqHcdQuyiYt2NOKkBN8JzoxfEXuoUinqTeU7t+7dFx/nW9kQ9Bh
         V0RxHG1DK3n4cLQ02plPmW8ctxyc51rjeL5aQNz/6Uhw/KMX774VL4IK7HWDXQmNRe08
         lR944Fq47Dulka7B8NVAX3m5CtEdO4XIwfCsq3FfObfxHv2apEUGouoXeG9Si2LG0Vm4
         jKS2veSHr2O1SA1w5zT9O/3ORUTPXKr7dnHDLyTS2ga81qZjWjqep2vX8Ir5TLt8kFaB
         ReuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TlsPvy9M;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bv5-20020a0560001f0500b003062da8eac8sor2105850wrb.3.2023.05.22.08.32.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:32:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TlsPvy9M;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769530; x=1687361530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeXq+k+iZcDwEahQV3X8F7cWs5VQQu6bE5Hamux2tak=;
        b=TlsPvy9MfS9Tl92mIBU70ctzv29X3LgoBlOL++96iLZmUChBKbFkNb4FhlMw9Ko8XX
         VmhrgBgpOLJmx1zCjuei/gyAsgRORwDzeHJ63CTjc0lI3AGWPs8idGHISVwrl29eYYy9
         b0wzJRFQAsamkNncWQGwxF1bW92OpNs3IcIOAofaJRX6XgAM+TTZs9OZOSJKYJbYKx26
         gR6Y5TnwlYJOsaLYTPHqflzOPMRnmgS040pLIDqWt/PaOwdBB5Pk/vwgi68c2Zw58onS
         +fLGq/LmYkM2H3+SFcWpUAgUn3bRHtm/Q49xR7NjC0UEwyZ/anaVhbA1koOTnxheND04
         T6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769530; x=1687361530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeXq+k+iZcDwEahQV3X8F7cWs5VQQu6bE5Hamux2tak=;
        b=WfHRW+Ij9h6Siv2ulEmyhpr6oIapBuyZwjfpNonVTcCUi/XYmYKBZ4CB6Ie2vL9JMa
         J5DT//5gXICJWjoAwZ3O6ZE2bAw4z4+1DAxui8jYgJeQWBJymihrsOwtEQSRYNH+u54t
         oH63TNOrULM11xkPYiDiU9bz3dv6iqB/kAt0jMLc7lM+28qt6b5Wwej0rucgET5yJzcJ
         LYijeJe0IV3NbeiN0dhd4gjJ2STqfstt4N+CguDgU2C1vq7BNFlgY8p+9Gz2TH5eYA+j
         hCJVQmV10W0VxBPTHpFlMTwtM5f42gbKJulYoWbqm4k49SWmZ8Yc3bIF56pRHSVEkket
         5UkQ==
X-Gm-Message-State: AC+VfDx4xHrL9bnB3zQs229SX1GMBn18nCwCN4qf2sYnW4ZX7ZUcj2kk
	geDJW3uvYFIp5T+TQMclaOmebVc82JSP2FxOjUHoKQ==
X-Google-Smtp-Source: ACHHUZ4LJvxpc80HXLS2C8s3syqktw2me3xxNmUzE/3ZXCbGVJu9SvMT3pnZZTHDTyl6FrFDDsWrlQ==
X-Received: by 2002:adf:ce08:0:b0:309:4d12:64e7 with SMTP id p8-20020adfce08000000b003094d1264e7mr9228156wrn.31.1684769530067;
        Mon, 22 May 2023 08:32:10 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id y21-20020a7bcd95000000b003f4e8530696sm8629406wmj.46.2023.05.22.08.32.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:32:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/12] hw/char/pl011: Display register name in trace events
Date: Mon, 22 May 2023 17:31:36 +0200
Message-Id: <20230522153144.30610-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yPErmgKaE1aq

To avoid knowing the register addresses by heart,
display their name along in the trace events.

Since the MMIO region is 4K wide (0x1000 bytes),
displaying the address with 3 digits is enough,
so reduce the address format.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 25 ++++++++++++++++++++++---
 hw/char/trace-events |  4 ++--
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 77bbc2a982..274e48003f 100644
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
