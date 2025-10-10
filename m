Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FFDCCA476
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 13:50:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7DPn-0002Wm-BO; Fri, 10 Oct 2025 09:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DPg-0002Tn-BO
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:44:05 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DOq-00084R-ML
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:44:02 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e37d10f3eso15696365e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103782; x=1760708582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TwAzvO9gvcfrUDpFLGxwbVJ7FPHxQaLieV6nfbJhlno=;
 b=q4MWCMfQNBPXg3A6nbpj0bJXV1rOdBextWwOtk0+a2sAw6O5N0YZPIkI8vtsRF1PN7
 nAShrmlT2CV7qEFDgU35JQXWLTjqmSfDxz+g7cy8AUcZCbSYKYXaxRD1GCk80Gu2d6VG
 v8oxDY+92mWisUZdyb6xj/GHdMpbufw/xON/FedHC543e+FYRpcM8wdSISDXpu8gvZdi
 NvLV786qi4xZiduSjIRD4IhMiE09bEkgKG7tfD+D3raMxGUfa9bHIEDMKolRIOIaqj1T
 eHxofA0UGtZYFoK6k2/NPy2hd2bttkB8+B0YeqX3+1+4KLaIRdTQn/rZdyJ9ySiMGOEk
 hkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103782; x=1760708582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TwAzvO9gvcfrUDpFLGxwbVJ7FPHxQaLieV6nfbJhlno=;
 b=usJB0ZXVD5zjf82e+NOlWlX807uDE0C24pvZKfhBWL/4atmPOq9wK0iObewpEyGaUT
 4DvZLFINg6kgD29VNW60lOxUYaN0Rr2ZY/9DNGEr4oAHB2+1l7Mjh1fZOusZka+nVEtT
 UPTEW/I3lwcuIO9uqQoaU47AM6ZeDnFTDj/BzLAgKVPHZR4SZ+AhOpeYhJLZvQ+oXxpR
 56k4ErIdaMU1oUZW55L3X5XWC5BoaxlGIZH26Wnmtz2G7H4Ebba83NUHte7sQ4LNmj04
 kmTWMa9RO4SXrzQyTcttuUEoJ+JMAtx4TgueUaBaJ78kVQko36y2XtNk/KKVqUkEqEC2
 VG3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXOmLoMshmw20LGFc1NbzasJFqDXxPJ00SSR0x2EmglvV6MOEuQsAMyBmndYC7zWysOXNCv7U0EQ==@nongnu.org
X-Gm-Message-State: AOJu0YyGKBqBAIwSdkHe0bJD6axzujik0vTxjZ7J9PZec8pM1/Tnmk3x
 wS/rbf4L6V1n7xGXhLYweQLl1+BlHy4ZbQF+T4K7m1ZJs9lZmICGlRg9ROzI29zFTQE=
X-Gm-Gg: ASbGncumA8rKocRumN4bVpQDoQNuYY6t0/eCS9xxch2zxDQzoA7+klgNXLSWMX5we8R
 kP47ISB4glf91cVZoJDVnssWj6aQsyGrgIhR95dGgw7HxdKMUhmuxfSU0mqY6w5+AT2eveI3+gC
 rHoEQGQYTAE/MiMvC4FkKvIOr/ctrsX4Z8ZggZGo/D/O6pPzUqsrZpIymVvllsdtFDjbggSNHH1
 aK2gYQKMHtvkXjk0ESoYYtOuMbgiqsP7sF/rqhQH8R6wZ5j419zA5ztrJXB/Pge4ixdZPiM3ppx
 Ci/IWCnzqwp817NwiUclT4GpYrZLEPb1dLPXqwwnHcd0FZYWcMIOET1ERTH695OyBv/Wt4UYWK4
 lJfz+X/Zfq/UJ3+UASenA8ouNOWnaVjUKeYk4n73wQFkhq7m5qArZ26Uo4rI+JAvz6AD5FyhlYg
 6cVO18677p3tIcKaKyD+mdaNDvZWSsBA==
X-Google-Smtp-Source: AGHT+IHajMtSeTIEyh6n8MyR6pgrCZEB1nqfEHOw6v3cOEm9Bb6+kEevt48OwTYU3ThjT8h4iDk1yw==
X-Received: by 2002:a05:600c:1d18:b0:45f:2869:c3b2 with SMTP id
 5b1f17b1804b1-46fa9b1834dmr84819305e9.33.1760103782247; 
 Fri, 10 Oct 2025 06:43:02 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb497aec2sm48065605e9.1.2025.10.10.06.42.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:43:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/16] hw/core/loader: Replace HOST_BIG_ENDIAN #ifdef with
 runtime if() check
Date: Fri, 10 Oct 2025 15:42:15 +0200
Message-ID: <20251010134226.72221-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010134226.72221-1-philmd@linaro.org>
References: <20251010134226.72221-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/loader.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 477661a0255..aef10cb3f2b 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -491,7 +491,9 @@ ssize_t load_elf_ram_sym(const char *filename,
 
 static void bswap_uboot_header(uboot_image_header_t *hdr)
 {
-#if !HOST_BIG_ENDIAN
+    if (HOST_BIG_ENDIAN) {
+        return;
+    }
     bswap32s(&hdr->ih_magic);
     bswap32s(&hdr->ih_hcrc);
     bswap32s(&hdr->ih_time);
@@ -499,7 +501,6 @@ static void bswap_uboot_header(uboot_image_header_t *hdr)
     bswap32s(&hdr->ih_load);
     bswap32s(&hdr->ih_ep);
     bswap32s(&hdr->ih_dcrc);
-#endif
 }
 
 
-- 
2.51.0


