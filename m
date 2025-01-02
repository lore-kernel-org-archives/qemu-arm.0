Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9470186njk;
        Thu, 2 Jan 2025 02:58:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9QTZ4gbXnisUt5pZITOzSuEeegYAJK8L7RBWcCdVqoNIRaspOU40QIRFBHUw1d87PCtmmwjOW3pRX3g==@linaro.org
X-Received: by 2002:a05:600c:4709:b0:436:1ac2:1acf with SMTP id 5b1f17b1804b1-43668a3a35dmr341454715e9.20.1735815529828;
        Thu, 02 Jan 2025 02:58:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735815529; cv=none;
        d=google.com; s=arc-20240605;
        b=glu4bY1WqCxMqGT5ky8od6hVEhjvE/06ZtHYMxvDLtZs6s4TGq1Mv7sGu2sbTJHa9d
         eYfwf5/hW0nn70L+hiAdQxm0ur/af7f2ugXT2KgNNB/qck9DMm38xoo2kxx/I5jYFVnt
         ek1nj0sW+GKedifCYt1Aq1S9opR8kQkCJotPfkjQWFAgXfNvK98dFuXv9hICp/kv/t5c
         Q07FUoVNm5CrxD3Mftm0Rmq7tn8O32E1e8IHYI/kF31I6qB9GBIttV4mt+g2TVzqFfVH
         aRxdS0UHzqMLPqGzUl385COx7S+nshjPo+eJev4DViAGbaTDqH0ucuT4drjY2owJRIJO
         wC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7PDwfX0ojLlp4yH1fFPzelM0oZpBBYGTWR3yxzH4/fc=;
        fh=ju5hMjpCJgplvGguXJLVQr725bn0nOCLnQhzp8MAmBg=;
        b=M6WyvffoxhBDD7aNq7aPRDnIEfkgtXZKKhkf41jlWO8gh7dA4DvUG25uxw2fcex9QK
         RM/GA+2WPMw5ZIT1imQcpF3DUrlvCFFcQoLJmugL+iegWPPEJ9hp57WqPWVsRcTdUkNV
         RJvgsi8402wTeh6hKZT7JIqQ8/vfQmNvsFOYD3Kc+T8kpufZAWVmJYRAtSV3ljnTacx4
         qfnuFoDzoz0tIcehhB5DL13qRcHeuQUmN/yMAkjj+gi0TjvprCDe56cSIIc/oJsQFzrj
         me/o2mGmtT9DYjA2TL9674K164HTDrjvW5YGd+4cclUAMXiLDAB6M34TXm1ZJ8VAQwDB
         DPjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ULYpP8tZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-436611fa07asor89553785e9.3.2025.01.02.02.58.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Jan 2025 02:58:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ULYpP8tZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735815529; x=1736420329; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PDwfX0ojLlp4yH1fFPzelM0oZpBBYGTWR3yxzH4/fc=;
        b=ULYpP8tZeGVUAHoZjCUqPxY3g0yaVP4iR2L8XZrNVm+K3F24saK6NsoDMf7Db2Hf9L
         8qPhYaEbg6/9Va37m8A3Qmf9SWnejF6WJozoYnH90IT1XG0sWPx4nS2hoB3NqmEDyuAB
         UXmeCsF8JktOjtEqdojx5P2uNlKMCVneLeYGEd+Vq1gyM/J2iDQK1FyLMrrf1MbYuKt9
         ZD7uE6C0Dei2lGxM9lUGdvKecRdXIzE5K36uNxan52bryEGrWPFs4876XGEQtBkrY3ff
         aVD9hBytT5sOSVtAL2RPO1V7m7mCHNzfocY9CJsKaFKaVYjGV+AaN5k74/kurze2Z8Pf
         /Wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735815529; x=1736420329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PDwfX0ojLlp4yH1fFPzelM0oZpBBYGTWR3yxzH4/fc=;
        b=QwanKlHUyI9zqsmfFFBuwQBI7tkN/AWn6f1oFXpfOZ3M1Vjc+lVOdiHK8Y6zhl2WDu
         6H3HnjX15w19LKEMpZ2LFNwYv8QdZHAnf2A0dOR3N7+Z2SQBe2EYG00s/ZpeuJMJ2ai4
         ESpzohJsb8cpJqyzy/DIP+PhvmYoV8WchmtzFdYZ6mpyVn/+EmLEWptkAgBatEKGtWFd
         f7DPZ0P5UOYFMoGgNG6xol6eSjFwkBic+7MluZMFfx23Br+OwMwvGsPliqB0OGNt1Bqw
         l2xRd5B4Bt7kPMsvHUABl4K1FloHb1PobnV0OYo+ubTOM2VBjxEwKzZBL9f7XpOPm246
         MvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRrsSjYUl3TOXQvRLNSAwXHHzFN3KuXX3/pCyFl6w731QAg4iW1U7fHKHPs9kop7vHrPncw69Sctpnng==@linaro.org
X-Gm-Message-State: AOJu0YxR0R82y0brbAe3T280MpxPe5c8a0hSyE5MemPYWcLy0Fg1iJIM
	ig/xosllfVOyb+rstHKaL28KHUlbqwcUgYnn0MfeWsayzzRH9UQwCZylt0EvoCc9TA==
X-Gm-Gg: ASbGncuuZNVuA1zzkIUDYJ0atQeSM3kuHJfKdgqteaD76fedd15qeFOwcl9Gt75qkV/
	y9Lp7vjK2pvpDzjT5Nwyx1CiBSQUCA21XnB18IOsNSMowkYGcvZr4caGxpXgdHS6YE5kBH9nBDv
	l7Eiu3W1tvjNx8wh8cmEfIMRUMOcqDHDuCSumZacFPeeBdAKfOJZh9A2Dt+Y9uSKEnXkGVbmIiV
	rv+OWThjQ19qaL07p/BGxAgBxptT/nEW+/ZOXynRvZkZyQXKqRJPOqzCLZDaWuauhmqB0Ni53qj
	W0EiIlaWE5bVAC0GRbvs7aXWmigzJPwRFedLb/htR0qxdA==
X-Google-Smtp-Source: AGHT+IG+ddtTuGOMtP+yqqCrOaIUyc4c7Ql9T9XdMaXeFXzvhJwWKQTp3nUD4PkVOab5MxntrEXXCw==
X-Received: by 2002:a05:600c:1550:b0:431:4f29:9539 with SMTP id 5b1f17b1804b1-43668b5f892mr336416215e9.32.1735815529296;
        Thu, 02 Jan 2025 02:58:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (161.red-88-29-191.dynamicip.rima-tde.net. [88.29.191.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e1a1sm37393738f8f.69.2025.01.02.02.58.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 02 Jan 2025 02:58:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 4/4] tests/qtest/boot-serial-test: Initialize PL011 Control register
Date: Thu,  2 Jan 2025 11:58:22 +0100
Message-ID: <20250102105822.43532-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102105822.43532-1-philmd@linaro.org>
References: <20250102105822.43532-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YfIodhpBghLQ

The tests using the PL011 UART of the virt and raspi machines
weren't properly enabling the UART and its transmitter previous
to sending characters. Follow the PL011 manual initialization
recommendation by setting the proper bits of the control register.

Update the ASM code prefixing:

  *UART_CTRL = UART_ENABLE | TX_ENABLE;

to:

  while (true) {
      *UART_DATA = 'T';
  }

Note, since commit 51b61dd4d56 ("hw/char/pl011: Warn when using
disabled transmitter") incomplete PL011 initialization can be
logged using the '-d guest_errors' command line option.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index bcfa504826c..6ea7e62e076 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -70,15 +70,20 @@ static const uint8_t kernel_plml605[] = {
 };
 
 static const uint8_t bios_raspi2[] = {
-    0x08, 0x30, 0x9f, 0xe5,                 /*        ldr     r3, [pc, #8]   Get &UART0 */
+    0x10, 0x30, 0x9f, 0xe5,                 /*        ldr     r3, [pc, #8]   Get &UART0 */
+    0x10, 0x20, 0x9f, 0xe5,                 /*        ldr     r2, [pc, #8]   Get &CR */
+    0xb0, 0x23, 0xc3, 0xe1,                 /*        strh    r2, [r3, #48]  Set CR */
     0x54, 0x20, 0xa0, 0xe3,                 /*        mov     r2, #'T' */
     0x00, 0x20, 0xc3, 0xe5,                 /* loop:  strb    r2, [r3]       *TXDAT = 'T' */
     0xff, 0xff, 0xff, 0xea,                 /*        b       -4             (loop) */
     0x00, 0x10, 0x20, 0x3f,                 /* UART0: 0x3f201000 */
+    0x01, 0x01, 0x00, 0x00,                 /* CR:    0x101 = UARTEN|TXE */
 };
 
 static const uint8_t kernel_aarch64[] = {
     0x02, 0x20, 0xa1, 0xd2,                 /*        mov    x2, #0x9000000  Load UART0 */
+    0x21, 0x20, 0x80, 0x52,                 /*        mov    w1, 0x101       CR = UARTEN|TXE */
+    0x41, 0x60, 0x00, 0x79,                 /*        strh   w1, [x2, #48]   Set CR */
     0x81, 0x0a, 0x80, 0x52,                 /*        mov    w1, #'T' */
     0x41, 0x00, 0x00, 0x39,                 /* loop:  strb   w1, [x2]        *TXDAT = 'T' */
     0xff, 0xff, 0xff, 0x17,                 /*        b      -4              (loop) */
-- 
2.47.1
