Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp976509njb;
        Sat, 8 Feb 2025 08:39:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXOlM8klsu33AHpdAY8gWPbbjynA06KsVtMZG8Cwl5EsE2DSfwlve4yzFIr3INWUpGgz9rAognZDrz5ZA==@linaro.org
X-Received: by 2002:a05:600c:282:b0:434:fdbc:5ce5 with SMTP id 5b1f17b1804b1-439250df461mr60626645e9.29.1739032775998;
        Sat, 08 Feb 2025 08:39:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739032775; cv=none;
        d=google.com; s=arc-20240605;
        b=eTsQ6OcMTnzfCFhVBN0+k3C2kjFq6YSpIZ0aMzxtG8SS05cS+zWL2X91eJAo1OxBLv
         SiSRyuAsn1gC4bcm51Ya3j77tFrpgVxETZTMAEy8Rdn2IxVFEiiS9HUz6Esu2OtLlMvn
         Aiz8fDAIa5SQmVMDUO6Oyf570Bw45cXCv34xAWGAJ8ddc+K/vtSoM2dvnAnMXlJ5BxFx
         pqJkyYTGq/EuyZCCfN20MevYK0eYdFH8Q9/0X2nw5a+1IORlAtFkognCGEVqHNHrewYH
         qEBfqso42PSUFI+PxUzMYaY8b9eLiWxrsouVt8Ji6SSkXmhNGinrATCT5hQzctnXgcg9
         D6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PHdzv7+PANz1XyqKozB4I/EYUC6swY8LmKK++HWkyR0=;
        fh=XvMIsdhz7SkEGRHV2VIpcVwMWsdPfy4XHnTuASLo3rU=;
        b=JasoR9nNFYftdlWNZcc/VsFnV+QPkr/GDFgbcuq9OZtf/LJQ0c/ncUKetQQx9Ophr9
         3EtUXgv2OwKbyiaLbLM5XteJcj4ozmDrm16QZGNu9V5jaSFyRA20wVpWcUFVXkN6VfxF
         EpjhZHBYEJFmkjkEgADfQJXZ0oGL4h70a2Co/0JZ6Hbf6qIlVrI2xCHkFnVyxC2P/qz5
         tKm6xWBpue/70F2igEbBxqhf6Nn0nWGWGKO8vM71clEqnROoUKnAnjIuziY6A2ZAub48
         hwgrR4Lc7wquHcM77zQAtRykLQuFEkcbaehogtzZ7CXZTFPjSchk97TesUcgfOS8Svuj
         u9/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmzzCE7y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4391dfdc15bsor20118375e9.6.2025.02.08.08.39.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 08 Feb 2025 08:39:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmzzCE7y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739032775; x=1739637575; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHdzv7+PANz1XyqKozB4I/EYUC6swY8LmKK++HWkyR0=;
        b=gmzzCE7ynKWCQKEdCECZY2GLcZ7BZeOiGj85bBMSHsu5CFCF9Typ9dHKUG2reYa09h
         wKCz1E0YxBNVwWfefAp5tiZOrqW/hJj/cXYo9XGlX/81QNPVqXs9UETO8E+oVOtSCnQy
         zqBJl/S/WVAjlpMk9x/P4u0jhDbMNBKfygeD5InUpFa8Lz+2SIRroawFoJBlWBCJZUzz
         lqZ7UNPDau47hEGv5l0osf58Zuft0dYsHPT6Bxlb5d2A8HEkzIXu51NejWzCqA8wvBkH
         PLtZgzG6mJuB/ifE3ieMe3jdANkvrrjSxJBvnVVWBCuCyN4AKW+cd49HD8PpqAYO7IM0
         tGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032775; x=1739637575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHdzv7+PANz1XyqKozB4I/EYUC6swY8LmKK++HWkyR0=;
        b=GG6VZfeYwYrD3cRnih/1fNRHmTqv1KYWwC2OnuAht3Sw0NfBNmueyfdQYo4B73s7uS
         wrQeo/HfynfQRIsyXBzq96WdUq4ae8+h8FbnrPSKiN9QXcrBVeZbkpWd/2v2hgGOW+ic
         BgtMESZ61SUzIAd4z3hP1HKlbfT+pDoMYjl1hjWi1c9MRJh2JulKwu3Ix7mcDAuoA1kE
         PieCHYkCSaVmErEbWLMvQrM4VzyaCxm//29D1z6WX5dfT0GmJHlCYCD5ASQh83J/8Or8
         wm9A3C3HF8CsyvZCycvNbczGCM2H8jVB8TI7aCJOJG+ZpQj5rbwyq0e7urbQk3R9Qwik
         XQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtX/3CrsFccxpo8/s7M4rp/rqUVyD2MNrQPtfCDYEZMuhn8mMvtZC91XrAdQqh9zSgSHW5GrExzWhigw==@linaro.org
X-Gm-Message-State: AOJu0YwARPJa+1Lg5DqGZVDuEY+VY94uzECN9tA38xaNMnF9BIqZZmRv
	55TjcCuU67P/jelnx4IeJzZgwH4f1okPMJD2YcQtgudWSyWK3agEFBizRPcIgyS1Ew==
X-Gm-Gg: ASbGncuizBpultYBMIBekl3mMaefDST2ulTw5tzp9Ja+MHOs+LcZeaL6nRSCH70NsCG
	rtQJQilHa25gWI45wVQI8tKBg2iEM7YDBB7qp+T6PejQ0SY+QbBshgG5w3N28SWeLldaHCPHLPD
	0hXHk4JeatUvdwEiAjAsOCKCIM5ENXhxCNeqpNgwSUd/Nh9DJauIdkf561Hgm+L3OOMsqUhC9am
	Y/8O4hFNav6dCABOVPnVzuRtyLwZxpv/Wg65M+HpGFH0Bru90VmCoAw9UWbemHmLAOKVaY98j46
	WAYpG5L4JiVucKMqVk19iAqUc8u43dbyP1FenTwuWkwa7q9IdNytNAP6kE4Z9U1IUA==
X-Google-Smtp-Source: AGHT+IH6YpUMdG322bhbp1b6ekVP+kxaXrw7iSiny0srrOqCy4sWpckqu3Y/SBLQQuH4TYwy4uKzVg==
X-Received: by 2002:a5d:5915:0:b0:38b:f4dc:4483 with SMTP id ffacd0b85a97d-38dc8fe80bcmr4396795f8f.29.1739032775508;
        Sat, 08 Feb 2025 08:39:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d964c7csm124581855e9.17.2025.02.08.08.39.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 08:39:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 4/7] hw/char/pl011: Trace FIFO enablement
Date: Sat,  8 Feb 2025 17:39:08 +0100
Message-ID: <20250208163911.54522-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250208163911.54522-1-philmd@linaro.org>
References: <20250208163911.54522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WmGtscDfuLdb

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c      | 4 +++-
 hw/char/trace-events | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index b9c9e5b5983..447f185e2d5 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -148,6 +148,7 @@ static bool pl011_loopback_enabled(PL011State *s)
 
 static bool pl011_is_fifo_enabled(PL011State *s)
 {
+    trace_pl011_fifo_is_enabled((s->lcr & LCR_FEN) != 0);
     return (s->lcr & LCR_FEN) != 0;
 }
 
@@ -464,8 +465,9 @@ static void pl011_write(void *opaque, hwaddr offset,
         pl011_trace_baudrate_change(s);
         break;
     case 11: /* UARTLCR_H */
-        /* Reset the FIFO state on FIFO enable or disable */
         if ((s->lcr ^ value) & LCR_FEN) {
+            /* Reset the FIFO state on FIFO enable or disable */
+            trace_pl011_fifo_enable(value & LCR_FEN);
             pl011_reset_rx_fifo(s);
             pl011_reset_tx_fifo(s);
         }
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 3d07866be5c..dd635ac6012 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -63,6 +63,8 @@ pl011_read(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x valu
 pl011_read_fifo(int read_count) "FIFO read, read_count now %d"
 pl011_write(uint32_t addr, uint32_t value, const char *regname) "addr 0x%03x value 0x%08x reg %s"
 pl011_can_receive(uint32_t lcr, int read_count, int r) "LCR 0x%08x read_count %d returning %d"
+pl011_fifo_enable(bool enable) "enable:%u"
+pl011_fifo_is_enabled(bool enabled) "enabled:%u"
 pl011_fifo_rx_put(uint32_t c, int read_count) "new char 0x%02x read_count now %d"
 pl011_fifo_rx_full(void) "RX FIFO now full, RXFF set"
 pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
-- 
2.47.1
