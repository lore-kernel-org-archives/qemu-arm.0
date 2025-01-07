Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp338021dlb;
        Tue, 7 Jan 2025 11:26:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXV6+R+/egjTPPKb5Fp6ojhjHMIA7STrvyOgOcZ7clT5PoE0dNH9NCFM0LGZmrVYmxRbGVtsGsso6BD6Q==@linaro.org
X-Received: by 2002:a5d:6c65:0:b0:386:1cf9:b993 with SMTP id ffacd0b85a97d-38a221fff31mr52642286f8f.26.1736277999816;
        Tue, 07 Jan 2025 11:26:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736277999; cv=none;
        d=google.com; s=arc-20240605;
        b=dkp2BrOHkSofy64/N3NeZKE81qlUCoMxhjveRI/g19/ncdGia5pevNn4oFbnab2I+F
         5ST/nqddIiJAJ7uPnsCxRi6QtoRSC3ZxcoMga0oa4rqnnHPpyNqbZMCde94aomkJQ3df
         R/iR2TXzNzmcpWGMwyxBfNkbM1LMZNPYWQbTf0z8ThvuacCDrE+rGmtl8eRePFmt1CQZ
         FBCsolf/t3wTBPhuSEuQdn9/+GBorPwWFVaxqtLRuylinaBoXY1C2k3+RAL1sBtWHTug
         2ITtjM2bJ85YZv97Uv0lt2ecwSolsGrUD206CxBAulbbvhw+1QD5UBT8bRw0RZvcrcdp
         jU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=jQpe/t9gE90x9xB1kiTd2LC7ZhqmJPaLIwleQhgmA4g=;
        fh=H4rXfm+fbERW62I4ezCHrvVmTHgImKZak4n6apprDic=;
        b=F4CviGxeZX+dNrOAvEDL2URO/dniSRm2xu9UzBiBzeHkR+JIEeXlCHdQ8gOoG4lBQo
         GthYnrXGw2oX6/fbuqJGTOiGu+aL2bBbvtpBVNhlVzZXT1xqEt79VMCT8O7OaM9Xh2eB
         huVQWHAje9kJTcelwOJIRMrVIQGyKGfLgu2tpJAqpLEBCRwiin6D9he6tgVVtq/eSgqD
         MrgAXXkWW3w4B6pd+eWdm1wGfC/XMTLx47D2DsSEU8o+XgS4+qb1XMsx24utMwRlHJpO
         l1jJ9Kw8HXIXeh03jSo1SRuvwz5CvMRrSFdohEZ7xKpDKHIr7HndkEZQ+e8VZfOKGoaS
         5QVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K7zrsTlr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38a1c833004sor10745820f8f.4.2025.01.07.11.26.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Jan 2025 11:26:39 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K7zrsTlr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736277999; x=1736882799; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQpe/t9gE90x9xB1kiTd2LC7ZhqmJPaLIwleQhgmA4g=;
        b=K7zrsTlrtohLNEKhkSxBXtR1K6leX3IiPzvftDhmmb+xlU3fbeuzETt31mDYaO3kqo
         2qksVTFb4bI5KfSFTEViSSU8xxKKH6KbRnHp3WST4Brob/asrB4BCCdyGb9wGx8q8Qud
         mc5TKODN/wsKi4PNbVnmWX1eriRpAMNIs8/Iszk1m34p0hW4ApagRebXDVeRhxJozzBQ
         z2CYjY8bHUvp0/ESavBF7jO3DUpvO5S+vF6gYesmwIh/BLyCuBsTVCG9YA/Blcb87Y5y
         XwT4Ig83TDFZcxkGiB5ADrxFecAEmfXsDBRbqU9XU0lucO17DwphiBWxAey5Sd/D7LCZ
         VCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736277999; x=1736882799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQpe/t9gE90x9xB1kiTd2LC7ZhqmJPaLIwleQhgmA4g=;
        b=nHM5UyX17BqjxC0PeXEoVCz65BobuFor8WGvhoIJRWS7Mrhe4rZVqj5zLWoE8y9MG0
         0JGvr+9y3J9kUA/GVU8jMLbvobnpB/KODseqwrCnpZF07urUMWZ4ykU5Nbg3p4Vos+li
         VbDLws3wQBmu3KuQMkrHkuE4UVuF+TmY10RtfYXooNygPPEVf9FHQPcTeURScod0YIG6
         eqrvmqnPJkUMBgIR4v2SoIwRrrDGAwmEBXHFTLkUwDK2bZOBiMwiu1aN/2qPQzHwFuGO
         qUh+l8cP8yuG5seZ6gJ2y9civhuZ9IVtr089PSQEs/kt49tzFrGe043ixp8YUPiiaRwE
         LnpA==
X-Forwarded-Encrypted: i=1; AJvYcCXLFPekfxT5qgZ+mMluGNoxoDsEtq3ci4ym8kBCIYBs3sviaa55cKVbvhzMdF1+YtQ/ZLZnVea4a4wfgQ==@linaro.org
X-Gm-Message-State: AOJu0YyvellBYxh+dafFmwkBYe0GCYNom6K3jzMgwLl0VZHvEL6X177k
	6nJsKoPSUqQyMswbv9MjiK7i4jiMFSBeIveo0+YL++0zDErdCWwZDqFpFm/AZgX34A==
X-Gm-Gg: ASbGncvSBlmWpRO2miiGD+tZBkMji5Iis8bAqwPxy1+PpjeRQEE9lsP01a4EOGv7n5U
	UPD2BEr4vUMFVF34mltzSS0sPWsTKUmVmjQLMijdg+Lmluq24rMEhch4J/dN29wm2zEA3FdTmWD
	9y1VPwl6hWhD+dUgRMsy85L5v/520qZSy8t5N83wxtKRrs9ZstLGLiRrAbsmqjdccoqOD6IBF7e
	Zb2HFCfDn1+h0q4AeQmcVNSqZb73a+FMixUy7SgKmYUOrwKy6LALwDykLUlECz4fKToOfuoeghv
	7wlBAEFikARa85oqlmxgiRPgxZrjZm0=
X-Google-Smtp-Source: AGHT+IHLTbv1Vkh/klZ/gKZbygji4sVpVuH+nf3/hXfJlGgADfO39TPn1BJuftl1wlMw79bhQYgFww==
X-Received: by 2002:a05:6000:2c5:b0:385:f195:27f with SMTP id ffacd0b85a97d-38a221f339emr57011373f8f.5.1736277999177;
        Tue, 07 Jan 2025 11:26:39 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828e7asm50601297f8f.21.2025.01.07.11.26.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 07 Jan 2025 11:26:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Samuel Tardieu <sam@rfc1149.net>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH] tests/qtest/stm32l4x5_usart: Avoid accessing NVIC via MMIO
Date: Tue,  7 Jan 2025 20:26:37 +0100
Message-ID: <20250107192637.67683-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: euZdRHm4Cx49

The STM32L4x5 SoC family use a ARM Cortex-M core. Such
core is architecturally tied with a NVIC (interrupt controller),
having the NVIC MMIO mapped in the core address space.

When using the QTest accelerator, we don't emulate vCPU, only
a dummy is created. For now, QTest is only supposed to access
MMIO devices mapped on the main 'SysBus'. Thus it shouldn't
be able to access a NVIC MMIO region, because such region is
specific to a vCPU address space, which isn't available under
QTest.

In order to avoid NVIC MMIO accesses, rather than checking
UART IRQs on the NVIC, intercept the UART IRQ and check for
raised/lowered events.

The sysbus USART1 IRQ output is wired to EXTI #26 input.
Use qtest_irq_intercept_out_named() to intercept it, count
the events with qtest_get_irq_lowered_counter() and
qtest_get_irq_raised_counter().

Remove the then unused check/clear_nvic_pending() methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20241216141818.111255-7-gustavo.romero@linaro.org>
"tests/qtest: Add API functions to capture IRQ toggling"

This patch is to fix the problem reported by Fabiano when
removing the &first_cpu global in qtest, see analysis in:
https://lore.kernel.org/qemu-devel/05820c9b-a683-4eb4-a836-e97aa708d5e5@linaro.org/

Note, while writing that patch I noticed a problem with the
b-l475e-iot01a machine. In bl475e_init() somes output GPIOs
are wired twice. The EXTI outputs are passed to the SoC with
qdev_pass_gpios(), and few are re-wired to the various output
IRQ splitters. I'll open a GitLab issue so it can be cleared
later.
---
 tests/qtest/stm32l4x5_usart-test.c | 33 +++++++-----------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/tests/qtest/stm32l4x5_usart-test.c b/tests/qtest/stm32l4x5_usart-test.c
index 927bab63614..35622e9434d 100644
--- a/tests/qtest/stm32l4x5_usart-test.c
+++ b/tests/qtest/stm32l4x5_usart-test.c
@@ -46,26 +46,7 @@ REG32(ICR, 0x20)
 REG32(RDR, 0x24)
 REG32(TDR, 0x28)
 
-#define NVIC_ISPR1 0XE000E204
-#define NVIC_ICPR1 0xE000E284
-#define USART1_IRQ 37
-
-static bool check_nvic_pending(QTestState *qts, unsigned int n)
-{
-    /* No USART interrupts are less than 32 */
-    assert(n > 32);
-    n -= 32;
-    return qtest_readl(qts, NVIC_ISPR1) & (1 << n);
-}
-
-static bool clear_nvic_pending(QTestState *qts, unsigned int n)
-{
-    /* No USART interrupts are less than 32 */
-    assert(n > 32);
-    n -= 32;
-    qtest_writel(qts, NVIC_ICPR1, (1 << n));
-    return true;
-}
+#define USART1_EXTI_IRQ 26
 
 /*
  * Wait indefinitely for the flag to be updated.
@@ -195,6 +176,8 @@ static void init_uart(QTestState *qts)
     /* Enable the transmitter, the receiver and the USART. */
     qtest_writel(qts, (USART1_BASE_ADDR + A_CR1),
         cr1 | R_CR1_UE_MASK | R_CR1_RE_MASK | R_CR1_TE_MASK);
+
+    qtest_irq_intercept_out_named(qts, "machine/soc/exti", "sysbus-irq");
 }
 
 static void test_write_read(void)
@@ -221,7 +204,7 @@ static void test_receive_char(void)
     g_assert_true(send(sock_fd, "a", 1, 0) == 1);
     usart_wait_for_flag(qts, USART1_BASE_ADDR + A_ISR, R_ISR_RXNE_MASK);
     g_assert_cmphex(qtest_readl(qts, USART1_BASE_ADDR + A_RDR), ==, 'a');
-    g_assert_false(check_nvic_pending(qts, USART1_IRQ));
+    g_assert_cmpuint(qtest_get_irq_lowered_counter(qts, USART1_EXTI_IRQ), ==, 0);
 
     /* Now with the IRQ */
     cr1 = qtest_readl(qts, (USART1_BASE_ADDR + A_CR1));
@@ -230,8 +213,7 @@ static void test_receive_char(void)
     g_assert_true(send(sock_fd, "b", 1, 0) == 1);
     usart_wait_for_flag(qts, USART1_BASE_ADDR + A_ISR, R_ISR_RXNE_MASK);
     g_assert_cmphex(qtest_readl(qts, USART1_BASE_ADDR + A_RDR), ==, 'b');
-    g_assert_true(check_nvic_pending(qts, USART1_IRQ));
-    clear_nvic_pending(qts, USART1_IRQ);
+    g_assert_cmpuint(qtest_get_irq_lowered_counter(qts, USART1_EXTI_IRQ), >, 0);
 
     close(sock_fd);
 
@@ -251,7 +233,7 @@ static void test_send_char(void)
     qtest_writel(qts, USART1_BASE_ADDR + A_TDR, 'c');
     g_assert_true(recv(sock_fd, s, 1, 0) == 1);
     g_assert_cmphex(s[0], ==, 'c');
-    g_assert_false(check_nvic_pending(qts, USART1_IRQ));
+    g_assert_cmpuint(qtest_get_irq_lowered_counter(qts, USART1_EXTI_IRQ), ==, 0);
 
     /* Now with the IRQ */
     cr1 = qtest_readl(qts, (USART1_BASE_ADDR + A_CR1));
@@ -260,8 +242,7 @@ static void test_send_char(void)
     qtest_writel(qts, USART1_BASE_ADDR + A_TDR, 'd');
     g_assert_true(recv(sock_fd, s, 1, 0) == 1);
     g_assert_cmphex(s[0], ==, 'd');
-    g_assert_true(check_nvic_pending(qts, USART1_IRQ));
-    clear_nvic_pending(qts, USART1_IRQ);
+    g_assert_cmpuint(qtest_get_irq_raised_counter(qts, USART1_EXTI_IRQ), >, 0);
 
     close(sock_fd);
 
-- 
2.47.1
