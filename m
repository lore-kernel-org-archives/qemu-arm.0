Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617238njc;
        Fri, 19 Jul 2024 11:11:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlOS1tJIoqS4OXV4/6Imk2zoMMESbh5+cqm0EdM9pY+X6iKUz+KpRftiT6N8OjtoB8zxEAApmYcdbkcS+TI00cCeQbbuhM
X-Received: by 2002:a5d:53ca:0:b0:367:926a:7413 with SMTP id ffacd0b85a97d-3683175207dmr6666096f8f.63.1721412700488;
        Fri, 19 Jul 2024 11:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412700; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3Vw+pvbGXqXZ9Qa1aAcNstqw26z8dOgoRdPUpOj8ur4WonIp1J4NseaalnmkaRK0O
         ihNxpodGjQTd6xaEaNKOR5ZfWm5aCtmKoO09ehueZ9vFLqAMMCDn5Q6H5opWotThfSfP
         OMD7Pl+KkEIbIMvGFj6xHBuaujQC+jlgcKOnFBT+043XpE6E3xmnNl9lmOuKlx6jOuYP
         xtEIXPT1zMuy0dhn4u6VvTozMxOtHkEoGZqHv5a562HXPUrsvnSOZeFa4Y3rQwsU/Jg2
         bWOkvxUHXToTUB1grd955Sdy7uppX0JjZfKe4/sTPgeMHS/jdCQ0Xul7xdX9+eaLmhRC
         wpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g8wjXx2GxaXvhCmT3K/sKVDQtxch9aqIxPKOi+RY35s=;
        fh=dhX/opjK4oP8mWuykhzsxIuHpvYNKX1wZTPr7UArPSY=;
        b=UtNo8EXPitsQlYnscT+yAePpxOp5xJuY2PLU2ptq7IipiGLBbmQA6VXU58isvm85Bt
         eXrT7hLu5y8uTUH80y59r05l4Slk5quf9nShbuzY6FaQPlzrgK8vRfJaTNF9sfeZ9zBl
         qi4sdp0LvuSWlPaSsRgPbEYnbNFqgsAOgTL7ocGLtha/WGZ7BGigz8Xa1AMncJvouhzA
         xAbKdBo+knN16paZNSpr1miK+nxo1uR89ycTmx8l//zcstlJe3mHT+ePPsp7y1lKCzu5
         JVWiUCSYpkzf/AfmHOM558yqvR6Yd86shkpKAyAGZ5auFUGLZ2yQ3UHDZ28ZsGTZB225
         gkGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIPgZPXz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6ecf12asor6045695e9.4.2024.07.19.11.11.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:11:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIPgZPXz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412700; x=1722017500; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8wjXx2GxaXvhCmT3K/sKVDQtxch9aqIxPKOi+RY35s=;
        b=fIPgZPXzwqZCYIXeKehOIAJ5f6LeBrwS1mfxHaYqjR5Kf4UUEFEPxz5KOAjfSzedN4
         QyuwiSIS/lsXWD5Tk6ESLe3ELBIEArtA5a5dfQrr6KFdSIxYzeoT4oyOn+INP3J/njIx
         yzVny24VYGJEtVekCueQa8hYJHwuDWtmbpL15D6Da9PeHN5gjPpH1GQWbtltrEMeaL14
         Qg2HOxKVZVFtDC6BAW1S+h91iW9bCwGlmLMyiFGi5ggaSbRSOdloL8wiAn/YUo84EKS/
         Fh5olkDjdZy566CYdcnhOAYJfak+vwrER12fhK08n7IBpYZw8VzxWSKWuC1LFQQjj3/o
         JG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412700; x=1722017500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8wjXx2GxaXvhCmT3K/sKVDQtxch9aqIxPKOi+RY35s=;
        b=Hi3zjQDAfYdqr3J4D6xWjASDyR9xqu3mT0tJEwvAUSNda1m9oGqJuDsh5ZnMSGPhLY
         pIUThp3x+DSFFqGCB1RKsSRHhSC2HOO/lO1vJ7rezBaU0IIY3+zffnMYa5GfpCmZJyL/
         0VZTZPlur8qeZdWyxPQtIi1ulSA8n7+5rqmQeDE81UQX9nFP2nDmbHe5FjHLhIkP2tmR
         qYleXRSa+PS01cQwF2L+FUrTtUSMn9fyUhQz8K67mB6MrKY76kYuUFopAF8eQ3+oi9yM
         lgu31p5cF5BHGpJfUeIjrUhNl8on6yQs/IiA92p/76s1NWhZh/xy0Mnrcyq2m8N4FOxx
         sJ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbtitX0jaycawhmbR4aNK7jEljpCPNih8CUYmhUBbnWt6TMDGnc/ZfvSWz9wnye5A06cc/r8FNis4iJuwhKfK3H0HOTpCZ
X-Gm-Message-State: AOJu0YytnJfhmw5LylhFj2KnMV3GP9p6vGADNzZzmbhLwBhFZEVwOIop
	WSVJvbnpfdouQloRScdGcUq7trJn3TqLtBmqxv12YASSjtfGfaWiSVMxSO6qooQ8tw==
X-Google-Smtp-Source: AGHT+IEQVsRzjCNWPuwRgcSt5N92vn8toj1j0Vw3yyreHnS3jvRH2VUU2YVFQeZXLjFBymNif10exQ==
X-Received: by 2002:a05:600c:1550:b0:426:68f2:4d7b with SMTP id 5b1f17b1804b1-427c2ca57admr55957355e9.3.1721412700009;
        Fri, 19 Jul 2024 11:11:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868420fsm2232641f8f.3.2024.07.19.11.11.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:11:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Tong Ho <tong.ho@amd.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 09/16] tests/qtest: Update tests using PL011 UART
Date: Fri, 19 Jul 2024 20:10:34 +0200
Message-ID: <20240719181041.49545-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5Z7CsAm0DbHx

We weren't enabling the PL011 TX UART before using it
on the raspi and virt machines. Update the ASM code
prefixing:

  *UART_CTRL = UART_ENABLE | TX_ENABLE;

to:

  while (true) {
      *UART_DATA = 'T';
  }

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3b92fa5d50..5cb309ccf0 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -70,18 +70,23 @@ static const uint8_t kernel_plml605[] = {
 };
 
 static const uint8_t bios_raspi2[] = {
-    0x08, 0x30, 0x9f, 0xe5,                 /* ldr   r3,[pc,#8]    Get base */
+    0x10, 0x30, 0x9f, 0xe5,                 /* ldr     r3,[pc,#8]    Get base */
+    0x10, 0x20, 0x9f, 0xe5,                 /* ldr     r2,[pc,#8]    Get CR */
+    0xb0, 0x23, 0xc3, 0xe1,                 /* strh    r2,[r3, #48]  Set CR */
     0x54, 0x20, 0xa0, 0xe3,                 /* mov     r2,#'T' */
-    0x00, 0x20, 0xc3, 0xe5,                 /* strb    r2,[r3] */
-    0xfb, 0xff, 0xff, 0xea,                 /* b       loop */
+    0x00, 0x20, 0xc3, 0xe5,                 /* strb    r2,[r3]       loop: */
+    0xfd, 0xff, 0xff, 0xea,                 /* b       loop */
     0x00, 0x10, 0x20, 0x3f,                 /* 0x3f201000 = UART0 base addr */
+    0x01, 0x01, 0x00, 0x00,                 /* 0x101      = CR UARTEN|TXE */
 };
 
 static const uint8_t kernel_aarch64[] = {
-    0x81, 0x0a, 0x80, 0x52,                 /* mov     w1, #0x54 */
     0x02, 0x20, 0xa1, 0xd2,                 /* mov     x2, #0x9000000 */
+    0x21, 0x20, 0x80, 0x52,                 /* mov     w1, #0x101 */
+    0x41, 0x60, 0x00, 0x79,                 /* strh    w1, [x2, #48] */
+    0x81, 0x0a, 0x80, 0x52,                 /* mov     w1, #0x54 */
     0x41, 0x00, 0x00, 0x39,                 /* strb    w1, [x2] */
-    0xfd, 0xff, 0xff, 0x17,                 /* b       -12 (loop) */
+    0xff, 0xff, 0xff, 0x17,                 /* b       -4 (loop) */
 };
 
 static const uint8_t kernel_nrf51[] = {
-- 
2.41.0
