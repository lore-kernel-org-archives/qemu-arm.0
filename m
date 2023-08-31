Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5071932ejc;
        Thu, 31 Aug 2023 05:59:17 -0700 (PDT)
X-Received: by 2002:a05:6358:281d:b0:134:e964:134c with SMTP id k29-20020a056358281d00b00134e964134cmr5977987rwb.11.1693486756730;
        Thu, 31 Aug 2023 05:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486756; cv=none;
        d=google.com; s=arc-20160816;
        b=AyYlUwmgSJsN/FjyeVeYF2/LUMYgGl7/GWB/3zGvQclLhPU6ThXm/CZaNW51yAjUd8
         N49+6WsR0M9VfU3DpzWXSKDpmoQkWiDVwE19rV2XTgXQrIO78if0Q4eUXKfDBCnGfm8g
         A+JFuKAHNw7Ojq0laacal+CL/dYVgXBCTeB/iWfZfWrnugCyyAwgS2PKtKrIOUvTStfe
         nX/mT7lBSdxNAELPd+lpblFnkykylIJDRZakVUdumy64cOWJkoKkUDx1UmAObhMvCto5
         G6fHUgqc2PR99DSZTV4Kp3CjNm2oPlGk4AcRa3GneYAlXZ8syU5ck9GQV0YF3jrbOwAu
         ltbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K9fF8pIxAEbO1JVLS8qke83pavQv2lkvy3aArf23uO4=;
        fh=C1g9WbLYbqb5ZMWGblSPCb82pDI9M8ifDDaJhEe0Xjk=;
        b=ny6uAEkxIcbhxCg/ttTTd0j4yTMPPwETTtwo+im+ZjmHZm19Gke+ilGAEHS0ZVVaC6
         3xlZmNsv73uodo+/tlOEBSrOJBDbHB/EFHKDFaoHTDIkoNo8pHsc+7ALyqIMCbAe4qHF
         90YcOoElL7ZjIaEmm9ZoRQ0MUTCe9nniipmP6LZtESE2pfk19OW9h0WkXntw9IF3l7XY
         LJosWYRgnuK3aEEsoPTJz/xTghYMcf/PC4GgGa1plcM30Z2HE++WY0TmadC3lJbh6/kV
         ygQhaHdyUT9XREjhgxLkUIs8QTM4KYrfs16C0r0mjmu1k07uxyniuecWoMngVHWzIKvv
         l8Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=haw1jf2e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e11-20020a05620a208b00b0076d9b4d1f7bsor710801qka.12.2023.08.31.05.59.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Aug 2023 05:59:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=haw1jf2e;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693486756; x=1694091556; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9fF8pIxAEbO1JVLS8qke83pavQv2lkvy3aArf23uO4=;
        b=haw1jf2eWqmvk4OpL5KcHNRrzrG8EbiWXFpV60EeVInK/C30wkHokSaOFPdTLsHpY7
         vropUEZMiGsLpBYnxF3qH0pNV6LqhbgXcgk3a/ace/cz6fWGCryQFoGDUcz9SrcTk663
         xAFtv1+bPi+wtj/KJOODrO1qVKJvlUQCT3LcRk2C4VZ0Rmv9KLkLAYLOKMgMdW6UnkTn
         LimG212fnpLaxBaCI+RP5JxxvLN85szeZMvEz866fEa3Unzt4obxK90fnW/V0gMZAILN
         4oSEWxTki+j8kNqh4SnAB7UpfN1F1DdeI23AmKEnOiGMXFUtT9e4JbDcm9Ilsyru39SH
         C6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693486756; x=1694091556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9fF8pIxAEbO1JVLS8qke83pavQv2lkvy3aArf23uO4=;
        b=laVH8DYywABzbkZVNRVL4ND9zNwgoM0y8SgPyb56kNqJEHjHw4v0bPYHDh1XmUP0Xc
         T2Vi8Mw4XtQ5VFYeVhNAEJtukt/m0sBsE5XZGZOtjuafrP4EGTNKswD+JYch33lMmuif
         Cz8wNoUEUcbEEPPX6sbH6rvLTX5JCs5dd4p0nzRc5wt14bRUxkyKhdj2KEYVGfuKwJek
         qMOVIAiSDSNhePuXcyCWaQJjNlmnLwhqsCabvjA/Rno54q9QcMP3CdA3AATwtpseQr69
         PvrVgGt1X3TtNa9IbAURGG0tnNEeWzF+upW+P4g1DZyrG2e6omPvInmPAojSxv2xHnLw
         fTRg==
X-Gm-Message-State: AOJu0YzAdxhM/hLS1edX+wXeGxvvLQU8NcgOU5Kcm8lu/Afo5t7DDsh8
	OV53YUyvEG1ps4sStAoxTbC9pcPq
X-Google-Smtp-Source: AGHT+IGwjHt9Woz6qrincB4KsE1QT88bhz5+lOlWGReU9TCMWSDsRn3K1so61hSEvDs7bfEfS/oM1w==
X-Received: by 2002:a05:620a:143a:b0:767:915a:ccf6 with SMTP id k26-20020a05620a143a00b00767915accf6mr2254503qkj.65.1693486756318;
        Thu, 31 Aug 2023 05:59:16 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.245])
        by smtp.gmail.com with ESMTPSA id x12-20020ae9f80c000000b00767da10efb6sm565423qkh.97.2023.08.31.05.59.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 31 Aug 2023 05:59:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 24/41] hw/char/pl011: Replace magic values by register field definitions
Date: Thu, 31 Aug 2023 14:56:26 +0200
Message-ID: <20230831125646.67855-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QRZj0ZaYapEv

0x400 is Data Register Break Error (DR_BE),
0x10 is Line Control Register Fifo Enabled (LCR_FEN)
and 0x1 is Send Break (LCR_BRK).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230522153144.30610-7-philmd@linaro.org>
---
 hw/char/pl011.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 96675f52cc..58edeb9ddb 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -54,6 +54,9 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define PL011_FLAG_TXFF 0x20
 #define PL011_FLAG_RXFE 0x10
 
+/* Data Register, UARTDR */
+#define DR_BE   (1 << 10)
+
 /* Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC */
 #define INT_OE (1 << 10)
 #define INT_BE (1 << 9)
@@ -69,6 +72,10 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define INT_E (INT_OE | INT_BE | INT_PE | INT_FE)
 #define INT_MS (INT_RI | INT_DSR | INT_DCD | INT_CTS)
 
+/* Line Control Register, UARTLCR_H */
+#define LCR_FEN     (1 << 4)
+#define LCR_BRK     (1 << 0)
+
 static const unsigned char pl011_id_arm[8] =
   { 0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
 static const unsigned char pl011_id_luminary[8] =
@@ -116,7 +123,7 @@ static void pl011_update(PL011State *s)
 
 static bool pl011_is_fifo_enabled(PL011State *s)
 {
-    return (s->lcr & 0x10) != 0;
+    return (s->lcr & LCR_FEN) != 0;
 }
 
 static inline unsigned pl011_get_fifo_depth(PL011State *s)
@@ -218,7 +225,7 @@ static void pl011_set_read_trigger(PL011State *s)
        the threshold.  However linux only reads the FIFO in response to an
        interrupt.  Triggering the interrupt when the FIFO is non-empty seems
        to make things work.  */
-    if (s->lcr & 0x10)
+    if (s->lcr & LCR_FEN)
         s->read_trigger = (s->ifl >> 1) & 0x1c;
     else
 #endif
@@ -281,11 +288,11 @@ static void pl011_write(void *opaque, hwaddr offset,
         break;
     case 11: /* UARTLCR_H */
         /* Reset the FIFO state on FIFO enable or disable */
-        if ((s->lcr ^ value) & 0x10) {
+        if ((s->lcr ^ value) & LCR_FEN) {
             pl011_reset_fifo(s);
         }
-        if ((s->lcr ^ value) & 0x1) {
-            int break_enable = value & 0x1;
+        if ((s->lcr ^ value) & LCR_BRK) {
+            int break_enable = value & LCR_BRK;
             qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK,
                               &break_enable);
         }
@@ -359,8 +366,9 @@ static void pl011_receive(void *opaque, const uint8_t *buf, int size)
 
 static void pl011_event(void *opaque, QEMUChrEvent event)
 {
-    if (event == CHR_EVENT_BREAK)
-        pl011_put_fifo(opaque, 0x400);
+    if (event == CHR_EVENT_BREAK) {
+        pl011_put_fifo(opaque, DR_BE);
+    }
 }
 
 static void pl011_clock_update(void *opaque, ClockEvent event)
-- 
2.41.0
