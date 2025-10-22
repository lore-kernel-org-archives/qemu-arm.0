Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD40FCCD1BC
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Oct 2025 15:10:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBaTG-0002Fe-0U; Wed, 22 Oct 2025 11:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBaT6-0001gL-2U
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 11:09:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBaT0-0001EC-84
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 11:09:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4270a3464caso3013677f8f.1
 for <qemu-arm@nongnu.org>; Wed, 22 Oct 2025 08:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761145773; x=1761750573; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3ngZPbaDwZJ3E3qgfPsLGR0H4y0FqCGiSlAmIJaKZo=;
 b=TSdmTSN23yD8jGXvzAbey+dWHWM8FxvrfmN1ImrH1NtZ8soN5Eqga/kO/A1xR6qHxh
 +8bH19ilt8w/tPjnk99wB3ttbpjTJt+CHAwf27OaRYRAznCJyDjA8Zlp4ikzb2C8A/bQ
 /jvTXHOcAp1tW24yoQDaFoxjxDTnSQ2vBdKe8GHQShx/a/7YlnGPrKFy9BFvHUUVEdtZ
 2jYF+sq1TkXmFReziIo8se95iuJFVnNzR0gdzVdiBQk1JpkCNFdyUZxRmOFHM8mXIFKx
 4aDAmb+Hlcqiq785T0zu08HByp6691GVVyvcZccPKhzzrdtFuQZsGaozX3ZlV+w+rEAn
 qanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761145773; x=1761750573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f3ngZPbaDwZJ3E3qgfPsLGR0H4y0FqCGiSlAmIJaKZo=;
 b=INRIonPiJq54vGVedrMCutdU6eR5dFJrNlzDdv1axo7LGH8gim9n6TwmLeru64fAi+
 yNX9GYRHQSFA5C5yZlisgDMJzX8gWiSCVdDkMI2XB9b3m9540/s9x7q3/N+7PEmRb4bm
 L/0xrmWZqq+RabqhUDDS87FvAsO+akkbi7D3B78pWs1t8Bvf1cMfzP0vqpzy5HLo2nVC
 BXX5jRKdF3QruPoRgE4zQvGWoyU0rDYkwTFzngmZuOhJnpAd0dW0pjNKHmFJF7pW8JoH
 FnZbeD2MLhWg5WW/wQYoPLzdxCmwHDlFWbWjauzrWjIeoT3tfa69MAZ3I8NSu1X6liAp
 o1DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMIIByKSOgBgDaJXVYtBvYsFasLqa+RkcvIHRidjwLsCLN33dNHypJCkN+YM5872JosxYAMhmxLQ==@nongnu.org
X-Gm-Message-State: AOJu0YzuqOP5U2N1z2i3j2gq21wsMwxI7VDVY7SxboiqXUKXPzDV+Gly
 +Mzr8JEZoygaNDmCY0+nc5ajdplFijPQdm0m0K5N9oGUecM/BWd/05CqNoWzyvHBfTs=
X-Gm-Gg: ASbGncvOX8Axipqq1P5sDy/YrGdB+VE1Jv9NJItYGXxfe4xnfDiEh+PFwYgW3wrTGP8
 ERQOBuOSAiqIYR/xL3y3kHv4EpgQebfsa17xwermSiTgUBUT010u6gKpn+UtN2DoYmehJc5uQlR
 PxXU+Sq9ETDHuqZIkEVdj5hZ6NAK5+H7lBbdrsi9nF2Yer3ytXSNFrYxFGBqjbcoePgcsyfYY/D
 hNfq4QXjsMwZwg5IXJj2gM8IBS5HT7mllQBNxNOQsjs3R+XBT8d5MBocF/yaJLRVbINSDtD0ip/
 OPvt9lMhjQdGuF3EEifSN4m5C9sr+oOy8MkwZ7QkNfmyY3BKzfWh3cAYANreHIcIVf40Lay8lKK
 lkH5ElDcUC15BOJLOyNK4EihRnbZlfX5I/aogwGMrbd9UxiKwUx1XxONIB8DFr/ld2EiWTE2LqD
 OqQhQyHVMofrPo4J+62b8rGVJJ7guda/pMQhZvtEd91wPtvVAL8w==
X-Google-Smtp-Source: AGHT+IEsl/9G9/Zuob4PcW4PSudJtYR4GBXWNfJrFgGghbd5T6mHaj216FQRdNkAzsYiEBWskD5SeA==
X-Received: by 2002:a05:6000:1a8d:b0:428:3be9:b465 with SMTP id
 ffacd0b85a97d-4283be9b5bbmr11554632f8f.51.1761145772667; 
 Wed, 22 Oct 2025 08:09:32 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c34sm25325512f8f.17.2025.10.22.08.09.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Oct 2025 08:09:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 9/9] hw/char: Simplify when qemu_chr_fe_write() could not
 write
Date: Wed, 22 Oct 2025 17:07:43 +0200
Message-ID: <20251022150743.78183-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022150743.78183-1-philmd@linaro.org>
References: <20251022150743.78183-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

If no chars were written, avoid to access the FIFO.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/cadence_uart.c | 2 +-
 hw/char/ibex_uart.c    | 2 +-
 hw/char/sifive_uart.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 0dfa356b6d0..8908ebbe34a 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -316,7 +316,7 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
 
     ret = qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_count);
 
-    if (ret >= 0) {
+    if (ret > 0) {
         s->tx_count -= ret;
         memmove(s->tx_fifo, s->tx_fifo + ret, s->tx_count);
     }
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index d6f0d18c777..b7843c7a741 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -161,7 +161,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCondition cond,
 
     ret = qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_level);
 
-    if (ret >= 0) {
+    if (ret > 0) {
         s->tx_level -= ret;
         memmove(s->tx_fifo, s->tx_fifo + ret, s->tx_level);
     }
diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
index e7357d585a1..e5b381425a9 100644
--- a/hw/char/sifive_uart.c
+++ b/hw/char/sifive_uart.c
@@ -83,7 +83,7 @@ static gboolean sifive_uart_xmit(void *do_not_use, GIOCondition cond,
                                    fifo8_num_used(&s->tx_fifo), &numptr);
     ret = qemu_chr_fe_write(&s->chr, characters, numptr);
 
-    if (ret >= 0) {
+    if (ret > 0) {
         /* We wrote the data, actually pop the fifo */
         fifo8_pop_bufptr(&s->tx_fifo, ret, NULL);
     }
-- 
2.51.0


