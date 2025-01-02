Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9470115njk;
        Thu, 2 Jan 2025 02:58:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6XWeXDWzMDvAQQpjoml8WI2lXIRtqQBds6L67mNksiM+dXnaR7RW1OxeWmWAfbk7pWKc/im0M/7QvuA==@linaro.org
X-Received: by 2002:a05:600c:1c12:b0:434:f9e1:5cf8 with SMTP id 5b1f17b1804b1-4366aabbed2mr411201505e9.31.1735815512879;
        Thu, 02 Jan 2025 02:58:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735815512; cv=none;
        d=google.com; s=arc-20240605;
        b=YH53MAuKUAVYHS5LZBAhtzKRZgTsnF72DQD35r7V3uRFFMNTWwEJ82HSZgJGn2MjKg
         bgSxuPfH72PMj3VEAkXW5LkmXqk3j3zTZZede86iatWdfFzODulUhUKbrz5jw7DGvEDa
         iJceNlHhuSIxQuf67bT+W1CJFI4iURhhn5jeC589HCH0QSSp7WnNa/oblLEBq0yvu7lH
         bH6g1jO/ZC/qVraOfYYt8k41MPzmgfWtDaDWPBcaQocgrhgCzVxbWbIWxaz7P1QmnmU7
         Gffn/Aho/b/f4eSMJVXVwwo+r2ovJXXu8pSR96wnnzFmwC9WJOpbslAsolllyvZScebk
         P67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zX7tyC+IoyNuHMxTftdexw4ZA/q9//BvhZNltMexCoQ=;
        fh=R+SCpYfXjqZuzZDyQejcG1hkdKdBl4aay6qq3V141T0=;
        b=EK5Vnv17/b2HClDktwNnZyhnuUXvoC0ByNC5jEoQg8qfDiAECH1jAx3OxpZRqcsAe8
         E3f/f6RzsbXjHLgRhhcJB6fhT+ohAW/y8NmXlm0DQimp3u5zxwUmjgdXTIL/Q1zvjjMf
         H1F6nGxQ8AADXcBAycnGnHrnA5nbiOKuQ2e5WJBa0IGhzW3vdL+cBSZCJ5U/aN6P9FlH
         sueiO4qWcgSAo+KCMkSywcKltHkw5//2kLkcWpCiLkmHf69G1ofbqAIPYAsJ+xY+o4io
         SBaxFCKrlk0tDu6D/PVBYH2eQtphFs2Y9jg2prIol5bX9nFdnCepT7BGoO6Pasr4HUSx
         cn/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jyc5v59y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43661218206sor83846695e9.5.2025.01.02.02.58.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Jan 2025 02:58:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jyc5v59y;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735815512; x=1736420312; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zX7tyC+IoyNuHMxTftdexw4ZA/q9//BvhZNltMexCoQ=;
        b=jyc5v59yUx7ncePk+qvNXsp3MONFtlmuGNzA949U8qGY3iXK5ndHgh6RwHkbmgN7VD
         oPYLnjlV/mU/ztcUtJuYTJVDfjIEn8lQnneBjvpKbhiL47p4eLGIIfoFZGx6HzeUgmUB
         CcxrBbUSgSs1JStlEDCOr0Au3XI7hQ/CUh+USuf1kYHqvO9UVGOM28M8NKYKDwtbG+Z4
         V6w/c7x8DNyRWArZVZwNwIs2jHODFsmhgjic9lE+ohUsMNAm7Ui9lRBuBT2pSUfKEoY3
         iHhqsXmpxprKO0PMmIStEHXthHG36SiF4DrhE07gk5cZ0HC5w2nGk/yiNU3eItVzFqOx
         /M3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735815512; x=1736420312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zX7tyC+IoyNuHMxTftdexw4ZA/q9//BvhZNltMexCoQ=;
        b=QRWbgnKDuRTNTYyLhyDiuxy9ZEPa0UEVNDZIM+/p0YrZgdZN9iinlEtU1/jSYhEc9k
         yjjjoxloUGjNxgBxUopxAtoTKmkDD/dOOGI1QbktF7b43tck3DHqj7UyENpNzDKtjIzP
         AK2MQWprAGGSXfOngQeOlIv0KQ+gxacoiqOtH0BWMLbIMG9SdU6bmH/vhK8tm4F4ItBn
         x7bGbAWfHfZEfL2CDrNcysSYEiyT3+wccD3EkXzyKoLnjDD/UB1Gvm81Dp4q9U+U+jKG
         XYjcdItzGhy3ot3Dz1KDGQ0scP2e1+zAkHwQ08LuyqDMOdKiSvqVplBn4MqPV+V6pd/E
         O5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUNe1NUBvX4rUkbafmd4TlUw1LdIr0GeQU7H9s7X9BdyZ+6qVBWN8CA8/EtWmOfz9jWWqwtv80VqpknIQ==@linaro.org
X-Gm-Message-State: AOJu0YwsJgA2J3dc/jWUdcQxGYRWkw//Gn++xOr/cw1NkJ/zXOrup+3y
	gbMiQbw7BpUpFVOd6HKLqUZt2qUe/LP6yfHr+sfSO8jmd3/9TjLzBFCoRYP1GZ3aY26KfpMnw0B
	rIFqy22CA
X-Gm-Gg: ASbGnctSC61b+43DljuISqgCjgBKj3BFLz3CRkRKQnxzCis/IYcKbPyplz0GunoewBW
	anp68YaIzUeuAlLTA9Um9/dS8oDMWUwM3lyhcaWuKEI388fgKn5Tcu28IHHQurWldQEo/T1D09l
	pt/jAb0/oZp7mKS15r5h3aWYbklRoBldizergefgwR3ORKWDKHJOmDWXOGVNlhFxVvvfkv2zbfA
	+5PMa/StNPcEJD0ON8AA/VxCy+1SUFdu+laZp63jblrCpkYsjk1gMFs48mvJHNJq+iPBUwijdmR
	SBbdQjx4slspJ/SbYYPHLA6tZ+IjAKUFd+gmpOBAylNRrQ==
X-Google-Smtp-Source: AGHT+IHii8N4pfm5p6MS0RNJwt010PoGN9LwuCakORhwKneS09QTm35pW1YS5NZ/5CkRBu9JP4n/eQ==
X-Received: by 2002:a05:600c:468a:b0:436:1b96:7072 with SMTP id 5b1f17b1804b1-4366854c062mr380870555e9.5.1735815512299;
        Thu, 02 Jan 2025 02:58:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (161.red-88-29-191.dynamicip.rima-tde.net. [88.29.191.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366128a62asm444588155e9.44.2025.01.02.02.58.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 02 Jan 2025 02:58:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 1/4] tests/qtest/boot-serial-test: Improve ASM comments of PL011 tests
Date: Thu,  2 Jan 2025 11:58:19 +0100
Message-ID: <20250102105822.43532-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250102105822.43532-1-philmd@linaro.org>
References: <20250102105822.43532-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EJ89NZePw+M6

Re-indent ASM comments adding the 'loop:' label.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3b92fa5d506..a71d2857807 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -70,18 +70,18 @@ static const uint8_t kernel_plml605[] = {
 };
 
 static const uint8_t bios_raspi2[] = {
-    0x08, 0x30, 0x9f, 0xe5,                 /* ldr   r3,[pc,#8]    Get base */
-    0x54, 0x20, 0xa0, 0xe3,                 /* mov     r2,#'T' */
-    0x00, 0x20, 0xc3, 0xe5,                 /* strb    r2,[r3] */
-    0xfb, 0xff, 0xff, 0xea,                 /* b       loop */
-    0x00, 0x10, 0x20, 0x3f,                 /* 0x3f201000 = UART0 base addr */
+    0x08, 0x30, 0x9f, 0xe5,                 /* loop:  ldr     r3, [pc, #8]   Get &UART0 */
+    0x54, 0x20, 0xa0, 0xe3,                 /*        mov     r2, #'T' */
+    0x00, 0x20, 0xc3, 0xe5,                 /*        strb    r2, [r3]       *TXDAT = 'T' */
+    0xfb, 0xff, 0xff, 0xea,                 /*        b       -12            (loop) */
+    0x00, 0x10, 0x20, 0x3f,                 /* UART0: 0x3f201000 */
 };
 
 static const uint8_t kernel_aarch64[] = {
-    0x81, 0x0a, 0x80, 0x52,                 /* mov     w1, #0x54 */
-    0x02, 0x20, 0xa1, 0xd2,                 /* mov     x2, #0x9000000 */
-    0x41, 0x00, 0x00, 0x39,                 /* strb    w1, [x2] */
-    0xfd, 0xff, 0xff, 0x17,                 /* b       -12 (loop) */
+    0x81, 0x0a, 0x80, 0x52,                 /* loop:  mov    w1, #'T' */
+    0x02, 0x20, 0xa1, 0xd2,                 /*        mov    x2, #0x9000000  Load UART0 */
+    0x41, 0x00, 0x00, 0x39,                 /*        strb   w1, [x2]        *TXDAT = 'T' */
+    0xfd, 0xff, 0xff, 0x17,                 /*        b      -12             (loop) */
 };
 
 static const uint8_t kernel_nrf51[] = {
-- 
2.47.1
