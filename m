Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DB9CCF9F8
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 13:50:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJBEF-0007FF-Rw; Wed, 12 Nov 2025 08:49:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJB7c-0004Ij-TZ
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 08:42:53 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJB7b-0001PU-9O
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 08:42:52 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b2a0c18caso694011f8f.1
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 05:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762954969; x=1763559769; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+FKtjjNLglLvZKO2jnLzMl6gZsHlOg0FzPTza935NrQ=;
 b=Mhf4m2aqs3yszqewGtCnGGJ0V2BJl3o80Zp+X1JPYhkGQhy6krI5wJlfKMfEDQn28y
 ibrfCm4/RWarUjy3RkIRqE7dGrGUKUrH5RniAav6RQLu0Dc4qEPdvnof2mDQodtuyLn3
 bu36gIX1eZgbq2dMSBCeAofxxMwQYnJSjNXAemPCddgxrSTQHeuLEDsPEw3PEW0VQIA4
 AyGk4IglBy3OUZjnWIIk56xkILhdYQapJuJDth3mTEpkZyy9nPdgKl2f9OM8wcJaAdFl
 9HwN45p3B+2DMiQibvWSaKU0xzsbHy1JhtrIGFgL377B0M3oNmnwirIlu73otq20n3fZ
 ys9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762954969; x=1763559769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+FKtjjNLglLvZKO2jnLzMl6gZsHlOg0FzPTza935NrQ=;
 b=EfVqi5RtL8a9TD+zXqQbs3cHfUPUnwknQr9v0q3itdugy2wK9Z72Hv77TBb2Cy3Dn6
 0uJz40y5sUNMmiyqkG/oPIYB9fTnteNA+Qn2nTdb3sHbEd4c0qxPBxGvmkXn8Q9kWhkn
 q7FuOpKvHN1UicxXV+p+eEO2DR3MboCAcexL8HyaspnhblSSekXzL5Mo2YGW8xrdfbaU
 ExgnEbPq2J4/MxWs3Z1ZKdVSAldc44ntWZsq9B8O8NfUCoAkVHzCHqyJJRs1XqwVCsDU
 zoRkg8lXw9ZUzVC7ifw8RSFQQb9jwZNLO9mhKxV4HWSqsVDxelXIcoVIh0aOP/axGL4j
 bubg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2eGZclw+uRAY2S9+33uZemAiBGcnhbqmE9rsYvXb+z/TIqgNYGeYetDcZ9yNrOfQn2E1GkqOORw==@nongnu.org
X-Gm-Message-State: AOJu0YxmuxLJQL5cE1IeiztPOE8sXvTteisLPRf5xhweVO0SQvBSQa6v
 kLmWq/LopSRAYrDlSYAsoWzQoj8K6kN7poYZvzF2P2h+l9dWNAOeRnLagA5S++9CU6U=
X-Gm-Gg: ASbGnctrghLW0Y2U9cQDHj2bxWWxJW1UEt07JXGLl3wM1Ys2jvneNMo4mUIm0qUNWZI
 ljpXBq/N7fj3YcBxh6+7swekYoSqOiCldR5WyApt/s7RA0PeCKPgNfvcZpYZJ4L8arZlvlETO30
 2QsceXlgp+YLoV+4M4EP+ugJGpBnhYOHpxI8hmuxe3ZPDreLInmct/D2RjQ5PNezAH+CHfCKiD0
 kGVUZb3saEhydW4uHseOYJxgFQxaaJrgiD3t+DVN1h3xMGGSdC3aLn0a9qDNc5U/AWqOemRI+EK
 q1EvaGxL+r4avhg8Wux9uEp59D0iir57HwxvWUP9tdO4tcRMX4R/v17OZLQWm2tzXvvRVoDr14L
 glaK3/hCj0h7ZEOF/WzO8fcmeSCE8pJMujAujQgQzA0/KQ4MjWeUHmXBcLZPzLltYWq6GGt/9N+
 cUeP49HPY7XMMRAgnqMIfWWUXmeO9VxhHMYk982+JnJdkuqVN413E5nZY=
X-Google-Smtp-Source: AGHT+IE6U1v+SxSpbcd7fRn/IKD99tBQOXOF7AIL563l2AwmeycAM8BBAUsouxCh8B0yHer2RLgpKA==
X-Received: by 2002:a05:6000:2f82:b0:42b:2fc8:186 with SMTP id
 ffacd0b85a97d-42b4bdb7e9dmr2826173f8f.46.1762954968588; 
 Wed, 12 Nov 2025 05:42:48 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b2e052f32sm27479368f8f.17.2025.11.12.05.42.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Nov 2025 05:42:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 09/10] hw/char: Simplify when qemu_chr_fe_write() could not
 write
Date: Wed, 12 Nov 2025 14:41:42 +0100
Message-ID: <20251112134143.27194-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112134143.27194-1-philmd@linaro.org>
References: <20251112134143.27194-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


