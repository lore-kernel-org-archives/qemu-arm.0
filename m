Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9470129njk;
        Thu, 2 Jan 2025 02:58:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVManaWCLnqsW0lkgQBOlqb4WJn2nWU6p90/M35cOtQYBx0PKiPgWxVoNV/WKJB7BySBu4hfeDLt9U4OA==@linaro.org
X-Received: by 2002:a05:600c:5850:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-436699ffa24mr342305015e9.9.1735815518504;
        Thu, 02 Jan 2025 02:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735815518; cv=none;
        d=google.com; s=arc-20240605;
        b=OvNpbcj/3h3iF0LDwjy9TZelGTDMYv7dSrwiMh9E8MnVBJ4/0x/4JgYfe6waihe0El
         Q6WVhrb/CQ20SbpqyuKMftcPIv0m3q9+L2SVUj7ufVLwudAouKfzJfdZpXhUvtrFuAow
         lENC/4DzpslnBa8UGp04dUHMT6BpHmASHN7Vj6Qvg6krxTIVOZ3YuFoVbGzeHAd/pXxy
         i8+usaONHMioEd6KqMJCD9pgKBoYEe9CMqVVwa0cGyyoTn9j9qkNsrpfgxBTfD8dO7lg
         Wa5DN4hfJiw431dtzP4Zs5QqxMhV7a8Z9RSzS3Q76XkawIcKw5etlm7KNolpu8Y2qO8t
         WpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BHcoHA/RQIZe+ped96wKcqmPBxHPHj0rhc9qRvCdUxE=;
        fh=0lpK7HFSRCZ6hksoUeQyR2ht6vzNeQWNQywbZCnrG80=;
        b=U1ffOzc+yeFl7xdsmBuT1T9W1ycM+tSZqitXo8SoHIdrdeQpjcyYw3OzBsaOdZyRPD
         M5VZv/XhiQWFkjGI1U5OY9wB8du4nR6xl+Vndb2E7J2paTuPnf4Pd6qI4GYFe1jFxJ4a
         Qdu60NQyifdGARAv9K1KWxafGPQTyAwWKOuiLSrf/wj4OYF5IlupHViWEry9fPnvI89J
         jgYweJRKhj6YXWbIGsz02J1ZL8j0ze9lwG0tkqfIPEBhScBGYntygm06K59JGDDj/qki
         53YSvJSDZUqjX/MnYmyLrllhHkrBq+cyKH0Gjg4PjcUg/CcsRGIBqnfA8ICKHFYYiA/i
         DakA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xKYuzhUR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43656b00847sor70157505e9.2.2025.01.02.02.58.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Jan 2025 02:58:38 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xKYuzhUR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735815518; x=1736420318; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHcoHA/RQIZe+ped96wKcqmPBxHPHj0rhc9qRvCdUxE=;
        b=xKYuzhURQpZIo4riQ292Y4Aby8cajpbb/xTU4TEyVIh0GC3SRBZZcP0l6CAnHd+0Eg
         OHGZqUc5wKpqssWvls+LEJqUK4p7YdQG2zc56g1xkWvDn/GMKUW9yiNG8/Oo1TANBLSU
         AgiTkRc2IF5/GJPKAFbDNKG2lU6jZrIkOTvK1QyaC0r+p0CFgdpfnIhUwR9rsrOZDohv
         tISSK6scqPJXEtA5z8HCOcBBN8Pp2Q0/y0k7b3omIqNgxKzZ4I2nW1RjI/PxZCcy6SmF
         4Sc94k5i3wEbNk1SVMIJHmJ4JdZF+ny2C6V67yV9Vv/0UuCnRaqMDezfrKAAJu6ILMaE
         SD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735815518; x=1736420318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHcoHA/RQIZe+ped96wKcqmPBxHPHj0rhc9qRvCdUxE=;
        b=FQM8+n5fw5fAJF9mCTBiqSMz7P1ylUIBq8MBste440DP8fK8H8Axqyb4RM5LyXyeU3
         Y26muIb9TXaKnqwA7a8Z5ogKhOHzRevINL91xFjbSSP74QR8POn7s5l/P+QmerlGuMeY
         J5eafaV1sKFbt5fXJuebjwa3xwuKExu4vvaIfJb2qSxPbI4+Gr6BfUk1euGU5DZISljX
         XXPvfyC6FWtKSZFGfYXTFkMOFPt122e1FtiAb4Fn6EoArk2OMtCPtomHWiQTe4fje97+
         uhtEAEDE6AMEXGKHlRW+pIWSPv/7p85NX3Sc6Z9CR72otWmjoKNpjhP8+/gkfwnJLqDF
         3fVA==
X-Forwarded-Encrypted: i=1; AJvYcCXnPTl25RDGMXCgFm3tOT+wWwE2+Qvka7J6PHU79hDpcRaamU6m2sL4XMWd84Wmffvd5LX8dY7xQttQ+A==@linaro.org
X-Gm-Message-State: AOJu0YyGqAxioRN2A6p0Dxl/VQyFMOdk81dEiTyAhOSHXqBcT747ydma
	LXjVh1mBNdaOSqCmbgDEtG42b8yNLOqFv77Ylr8ZUBOYEGzD4dbcK5wJ+ePrywc+6A==
X-Gm-Gg: ASbGncsRhuun6hSaar+AnZ5Rj4yAeZGFqikMN91RmUZTlJzx25YUR6m75/jOo0gfOU5
	bdq7fnjL+YC8Td5hc9avHeFDiVvmKROn7ZXyPmoSeAd58lvSaAoMHQK7HN7Ag3YeYXLzyTQw+XU
	klJt61Bg+VcvMpos3gT2ReirdfaY+kC/jwu9zGLPbzNoy+wre4dFK7F8SQXTO+DS0TCQGVSZfMl
	g3oP1p245Rh7OhCIWsupi8OT7Ul1zVeHZdfEjBezehB8IDWWuL6PXNYz5l5b3fpdfK9gZy21wBN
	nAA/ANQz0aIU7n6jq4F00bOF3d7crNLWHHoTKrf1QrY34Q==
X-Google-Smtp-Source: AGHT+IEKRCky/yyUHMRuXOE9UXP6e4nrziMa9ersCHkpgsDo8ZraJEler8Y5EuFdnm7k2zrq1NX41g==
X-Received: by 2002:a05:600c:5850:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-436699ffa24mr342304835e9.9.1735815517971;
        Thu, 02 Jan 2025 02:58:37 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (161.red-88-29-191.dynamicip.rima-tde.net. [88.29.191.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b2afsm493916515e9.35.2025.01.02.02.58.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 02 Jan 2025 02:58:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 2/4] tests/qtest/boot-serial-test: Reduce for() loop in PL011 tests
Date: Thu,  2 Jan 2025 11:58:20 +0100
Message-ID: <20250102105822.43532-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102105822.43532-1-philmd@linaro.org>
References: <20250102105822.43532-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BgHu7dFrpAgt

Since registers are not modified, we don't need
to refill their values. Directly jump to the previous
store instruction to keep filling the TXDAT register.

The equivalent C code remains:

  while (true) {
      *UART_DATA = 'T';
  }

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index a71d2857807..553575ca75c 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -70,18 +70,18 @@ static const uint8_t kernel_plml605[] = {
 };
 
 static const uint8_t bios_raspi2[] = {
-    0x08, 0x30, 0x9f, 0xe5,                 /* loop:  ldr     r3, [pc, #8]   Get &UART0 */
+    0x08, 0x30, 0x9f, 0xe5,                 /*        ldr     r3, [pc, #8]   Get &UART0 */
     0x54, 0x20, 0xa0, 0xe3,                 /*        mov     r2, #'T' */
-    0x00, 0x20, 0xc3, 0xe5,                 /*        strb    r2, [r3]       *TXDAT = 'T' */
-    0xfb, 0xff, 0xff, 0xea,                 /*        b       -12            (loop) */
+    0x00, 0x20, 0xc3, 0xe5,                 /* loop:  strb    r2, [r3]       *TXDAT = 'T' */
+    0xff, 0xff, 0xff, 0xea,                 /*        b       -4             (loop) */
     0x00, 0x10, 0x20, 0x3f,                 /* UART0: 0x3f201000 */
 };
 
 static const uint8_t kernel_aarch64[] = {
-    0x81, 0x0a, 0x80, 0x52,                 /* loop:  mov    w1, #'T' */
+    0x81, 0x0a, 0x80, 0x52,                 /*        mov    w1, #'T' */
     0x02, 0x20, 0xa1, 0xd2,                 /*        mov    x2, #0x9000000  Load UART0 */
-    0x41, 0x00, 0x00, 0x39,                 /*        strb   w1, [x2]        *TXDAT = 'T' */
-    0xfd, 0xff, 0xff, 0x17,                 /*        b      -12             (loop) */
+    0x41, 0x00, 0x00, 0x39,                 /* loop:  strb   w1, [x2]        *TXDAT = 'T' */
+    0xff, 0xff, 0xff, 0x17,                 /*        b      -4              (loop) */
 };
 
 static const uint8_t kernel_nrf51[] = {
-- 
2.47.1
