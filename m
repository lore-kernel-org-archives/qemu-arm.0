Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10326297njk;
        Fri, 3 Jan 2025 09:23:04 -0800 (PST)
X-Received: by 2002:a05:600c:b4c:b0:434:f1d5:1453 with SMTP id 5b1f17b1804b1-43673f02a1amr425035735e9.0.1735924983893;
        Fri, 03 Jan 2025 09:23:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735924983; cv=none;
        d=google.com; s=arc-20240605;
        b=g2mnE06dmOetGYH2t4rY0xfwSGilHBzVcMOPJfx02UbTuIvgK9sRpQyMlzs9ShGUwU
         iUzTS+8Wh/4syGdyB4hLfiv/nZxCKwvI9+hqwzT0wL+o9+tSwLxNPzNEgNRXI8/NuKtI
         dj2njG1DGQ38keGeq9+M2eRW9CE7O0/viWLWdHPJRIyn/rVFcB3H0tCrj7H0mQeQvPRg
         ln+GSuZn0SZZIvakzGGV9qPnTxMUkO88nUwS88Pf93Ztu6kmKYFsYQqRc85CAOXht2z/
         jGBym1TSmuQpAfsoMW38ehh0S4VVuFW3eo154xBW8x+c1/5839EJ00g+r31e3MwmxOFf
         Ykhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yUozoV2sd4YCNhaxO0qe6knCSN/xQB+GkqDltrLuR9M=;
        fh=sOXhaDUqTNtWZrrLHpwVOLbAyi3Of/7BDc3BkRLfsYs=;
        b=XhxsSGQxUNlnujUGj3KLgdi8Dv6j5Jm4kSPDlfpnTJgmFjP6pjAJU8ffFEWLYYUWpx
         3AMu7i47FwCA5JxT5nPmiGK5d9NIYdJZsOEuPzB/6sG1NOGNk0ctSbrkhcDgsCIdKefr
         t4OCJNNCuuD7xsDSy8KPG/fx/Tu2jhdkL4c76sE3GIKol4JSD8FitgHn9u8I+3i6PmO0
         EK0wDNhyHzbn+7Zbg4f4tx6k6NtgGk5hebMMKYV2pazBLbn0CoK7lbV1PsGZUZZFfVye
         /VAosePfc0Ewop0DrTLsuZ6XEwOuekG9H642knEqAtNH8DoKmzBb+2KGU3nOndf+HqK7
         X5+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIaInwaS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-436611db43esor80108505e9.2.2025.01.03.09.23.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Jan 2025 09:23:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIaInwaS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735924983; x=1736529783; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUozoV2sd4YCNhaxO0qe6knCSN/xQB+GkqDltrLuR9M=;
        b=fIaInwaSe5/untTt6E0dZNMzFpSEGeQnaV4LML7zIgwxHtP9U/hGkBeseATQOcl39j
         v2kaxna/T/2E4mU2DMzr8SCoLTs9UIsiTX+a+YrM2rGPkK1NEVgbO50QTY1p9XiYZYUo
         zfMLiP57c0Y4kRT3WXgzF+W2dH4Po/oKeYkeeaJee7Y3HR8unDfcyaslC2QJpquyu78o
         NEyNbUqCXhmM2frxDcbrgWVFMsjb9+nQ6uy0cYxI1dcezuXfZw9c6bGZlfVjOT8YxaxC
         LoaLnmy2DKbnHbMNgAAXQNfIce6wSwDNo9HoE2GBh3/utwj6OfOLy7+q9K+XTIm5El+k
         bWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735924983; x=1736529783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUozoV2sd4YCNhaxO0qe6knCSN/xQB+GkqDltrLuR9M=;
        b=p9CcB3LBxhC2K8VPTwpXJ8aDsTUos3jihZUIOK5wnfx8QcoJHmUeI1X4bVvSX0e1yo
         kG+OXECLMjB9Ta7kKFu7Itn5a/HG2bO+K8rGJcllHP5LPARUpttu1jLr+zWsXqSGc7uH
         tF+2+1r0Mv22It/fCtxCSQSvsKskXF9eG5F08QBooaRvENvPuN/+im7CKRcSAjwu47Ro
         eUWaMWUWRRXpU4ozGw8REEWVw30O0Uo1LtQJWTaosT4+e4alMyBiQKOK0rGK8CL1aqEL
         S13bH3g4AQMdCJ/i0vJ015pA/9LoKP5vYDMtcBdZZGE+YSYSjeDoS9FWOzr8X55dAInq
         7P1A==
X-Gm-Message-State: AOJu0YwJl8ltPQiJaRVZvSy3s69XxsbbVqZJ/m+JNOvanmREC1nR67YT
	48Y7u962GItVmf3E0PZyhNT2CJTWurv1vedxMjAVgx5pCvPDR8cd8PLUV+0x2KJMqQ==
X-Gm-Gg: ASbGnct9TC6giMo1dHx5fZrJiRXVNNt2dcVs4AMOi5OOjNyybG8ngWuSgGQx3Q1Jp2G
	11eE1Sat+AWzmYdSTgqOCcjqGySwejIQ77DwD9d+VOZyDC8MVflswurMynVAGPOPVrqeP5+gJpf
	MaoAYwcYJfIxiX9ZgUW6HQUiY+o4vkmzimBDnplWAdHEX4DnjYT5+VQwMuiznyMXUv7rXYd0UWm
	Zzncule5D7eXaYQZ33Uz+I7cL9l+n1YEa499Gbf34c3wWxOeVuVHkrqSu5St9h7dhUygPoVcScv
	3GS4YIA03/+Gq7AjRQgdeotw/dNZROo=
X-Google-Smtp-Source: AGHT+IHuHyBwdiu6vN6zBS0sMJlcJ6tTdsG6SmA5FtOu3cjwEnui29omhcrLNCOzCVX2SXzORCDUhQ==
X-Received: by 2002:a05:600c:350c:b0:434:fdaf:af2d with SMTP id 5b1f17b1804b1-43668b7850emr440635435e9.30.1735924983340;
        Fri, 03 Jan 2025 09:23:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm531386205e9.33.2025.01.03.09.23.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jan 2025 09:23:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 4/4] tests/qtest/boot-serial-test: Initialize PL011 Control register
Date: Fri,  3 Jan 2025 18:22:39 +0100
Message-ID: <20250103172239.18562-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103172239.18562-1-philmd@linaro.org>
References: <20250103172239.18562-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fU6KILNNa/bb

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index bcfa504826c..ffa9e780ad6 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -70,15 +70,20 @@ static const uint8_t kernel_plml605[] = {
 };
 
 static const uint8_t bios_raspi2[] = {
-    0x08, 0x30, 0x9f, 0xe5,                 /*        ldr     r3, [pc, #8]   Get &UART0 */
+    0x10, 0x30, 0x9f, 0xe5,                 /*        ldr     r3, [pc, #16]  Get &UART0 */
+    0x10, 0x20, 0x9f, 0xe5,                 /*        ldr     r2, [pc, #16]  Get &CR */
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
