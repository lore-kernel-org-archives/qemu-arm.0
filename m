Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351520eje;
        Mon, 10 Jul 2023 10:51:52 -0700 (PDT)
X-Received: by 2002:a5d:595e:0:b0:313:df09:acfb with SMTP id e30-20020a5d595e000000b00313df09acfbmr12151087wri.11.1689011512366;
        Mon, 10 Jul 2023 10:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011512; cv=none;
        d=google.com; s=arc-20160816;
        b=bv4UKjMVsgnXwKCZ0V1xNvyPV+Rhhf3ozNvSq+5E20j9uX80Igni79ESOb8q2+/M+y
         amfk/fim6J5GtGfdJ5zE1CD3C5veZptZyxTQoxj+U+INGY7ij9EVIS/nM/FZMCpxkqFt
         +2xCdBtnHEKsEy1Qbg9f2pQukezh8Vp+V5OZmDlpG5nBMVawILd4A0vB6VsKX0PBwkoU
         l9nEBVIZ81EmZu4A4x6S6vWrJ3cRVi/XbvnL/QsaBCjMm/37Zd/0vNcc9BWRya/LDMlk
         bHimOkegucNB7OPPx4r2bXAz5FMVpJkeBd61g9HkpeLGH44vXs7BYmCe6bojp+wM+AuE
         KpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lXGp8ZoE5V8TDGBHBusqjmtpGceSTb5WuIHztmt2l2Q=;
        fh=4TWVGTMFk+XB48cTX7H3L2FEUZf3X6lSQ5h15kr1III=;
        b=NMByDKj9yKM1NPnfWi2clKX6mYDqx3XvSHLHXcw/IHQSXHnRVwLumaxSE4Bgy3C3ao
         bxg/U69E4pfpZ3kbipMcKqRni32CC8Z8UP4Ul8Ao8WMImE5O//odrtOA5+mzdEFr4+Jp
         2Tk3Xm7bSISBWc33Cu23eVfGRlzx7OgR1qCM3EHPZKrQR3K1Iq9IubSFUUhU6GLNjegv
         mIVkA+T+JauLYKS8xUMxquP06qsa5aKu5+JmH81Au0iDxYFCOqB9eW+V5mSGn8jDKQP6
         HgeWaEz12NVLlIVO4E5e8ZcEq/8wJHHiKRxJub0rmFR7sP152uqvQfv6jft/Mkgds/eT
         TGzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vKiyNgJX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q26-20020adfab1a000000b003159ec59f0asor149005wrc.4.2023.07.10.10.51.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:51:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vKiyNgJX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011512; x=1691603512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXGp8ZoE5V8TDGBHBusqjmtpGceSTb5WuIHztmt2l2Q=;
        b=vKiyNgJX8iIZv4oA1W4xd1oYOrqQOsoO5tqSA9CABYVhIW6zZyNKUmqjhn1swM08lS
         aSd7VCYY/aq6YA2U/HS2n1il0FLcNdR/O2R5UkSFxFGMqEdiP2VmAE3Z1zmfSBBj8EkW
         pLt/flTjj6ZUPlo7PT0E6OWR6+IbfGw4L+b5HaEMp5FpRmjojp8KB6vD8ozcsto7qBSM
         B4twRqzXqJHdtOEyvbOnqUFa+p2BL4bPxb7eFfpAcO5Yv3a4XNOxexder47xsZDfirmr
         RFOwFO/d8RXLDbWSZLrj1nEhduoXN+iXvWPKmaWjnfak97IeL5wTJ4/yCiy4TKJrPkFS
         v7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011512; x=1691603512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXGp8ZoE5V8TDGBHBusqjmtpGceSTb5WuIHztmt2l2Q=;
        b=b1UlYoftQ0O534gu04Oj1Q629AHqAs5Mon2j6xSCCUsiLLKirvXq7gmqvlUxRIFOrA
         IGSbrsr6Qzz/ezm6wkkTm8llCpWuZWzZyw+NLHHh6GhMA5/nn5TOZgqOk/Ed9uTqFk+5
         Q8PwOZUuCKTCX5XCpnev+peVkjiKvybVZUZ+oLz5kz6AmD8H56oHKXPAQAXADnhY7ktb
         qn+ecn+4nSwIEe38K6aWBiHw4HMsaCGGExYphOzCVYkZJQx+tXdKwA36l7zPzLw5z+Bh
         MdVnmh9CQj8QOeq6PsJAVvtELXyF7XVx4WJ5usglltaNpTofE1W23JitOyeMQcOhuW8S
         E+Nw==
X-Gm-Message-State: ABy/qLa/1z4RGiM9k6MVeGWq+JqCG/EtaaeWs3wJjR7A5s77u29bJCsL
	cJmi5RSCmYYzW7quYd6EmKQ0F2pB
X-Google-Smtp-Source: APBJJlFSo5owCaQU5SUO/RjRm30UfKsYGg/wMRGZEz3ZkmY/mC0kvVV7xXXhg6u4lcFMHP64asqVFQ==
X-Received: by 2002:a5d:4703:0:b0:314:3e96:bd7e with SMTP id y3-20020a5d4703000000b003143e96bd7emr15193783wrq.4.1689011512134;
        Mon, 10 Jul 2023 10:51:52 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id l3-20020a1ced03000000b003fc0062f0f8sm489126wmh.9.2023.07.10.10.51.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:51:51 -0700 (PDT)
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
Subject: [PATCH v2 08/11] hw/char/pl011: Warn when using disabled transmitter
Date: Mon, 10 Jul 2023 19:50:59 +0200
Message-Id: <20230710175102.32429-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230710175102.32429-1-philmd@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: grYcDBV8Egry

We shouldn't transmit characters when the full UART or its
transmitter is disabled. However we don't want to break the
possibly incomplete "my first bare metal assembly program"s,
so we choose to simply display a warning when this occurs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/char/pl011.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index e2e3d48b91..03dce0a1ec 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -76,6 +76,10 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define LCR_FEN     (1 << 4)
 #define LCR_BRK     (1 << 0)
 
+/* Control Register, UARTCR */
+#define CR_TXE      (1 << 8)
+#define CR_UARTEN   (1 << 0)
+
 static const unsigned char pl011_id_arm[8] =
   { 0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
 static const unsigned char pl011_id_luminary[8] =
@@ -151,7 +155,12 @@ static inline void pl011_reset_tx_fifo(PL011State *s)
 
 static void pl011_write_txdata(PL011State *s, const uint8_t *buf, int length)
 {
-    /* ??? Check if transmitter is enabled.  */
+    if (!(s->cr & CR_UARTEN)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 write data but UART disabled\n");
+    }
+    if (!(s->cr & CR_TXE)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 write data but TX disabled\n");
+    }
 
     /* XXX this blocks entire thread. Rewrite to use
      * qemu_chr_fe_write and background I/O callbacks */
-- 
2.38.1
