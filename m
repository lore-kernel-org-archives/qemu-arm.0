Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1888339njb;
        Thu, 20 Feb 2025 01:31:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUMB+2muX1D8xd5m+YMt+Oz3msqb3MGfRnxIlNmVgBV5plBsHcon6AE6qE+/vJmUgUWjKQMsnI9emjS9Q==@linaro.org
X-Received: by 2002:a17:90b:53c3:b0:2ee:8031:cdbc with SMTP id 98e67ed59e1d1-2fcb5a99d80mr9598103a91.23.1740043865641;
        Thu, 20 Feb 2025 01:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740043865; cv=none;
        d=google.com; s=arc-20240605;
        b=aq3AtsRTHibBEpPaWn/BfxUuZQCaOggJ8ZhlpPLo9Maso1kOjCNPJ6GKU76xx3Fn93
         gmOrgcCje2qqCEjWy4mlJeIy8z6jHBa8NmQx+jV2AWDrH3VIcSp3EZ3XHrcRNllIYws5
         HMLeZl78JFGVvLbyWyjLLjEo4PFOMAPzTZZOlDGYm/pUZ4M3LPqBKm19HxT3CjRN83aG
         rsHP7LLPUFmLuQnOik3LJvgjZeWvnO+k9huNour0Rg1KjRRbTyMhJaABgLig4UUe41B9
         Ml4PVT2XtaiX61/ROA90Stg0SMqkVSIt46hHxbg0mZquSFFs6yKM2KstRMH9ifJ5QEtp
         H62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2DkPTvskXfEKDS8ksEDRN9mL+hSgQIvFZ8gbNR3D4CQ=;
        fh=8XdT0YBw02WnYxGH8I4ZeXk61EY8IBya8OksQA9SfCA=;
        b=eaokrQQJLyDTBqEjRyVTW0AqFg2qkjJRWXgwN6KSU9RNtuHWBrZ2xdEe83ehW8Wqqy
         rminBtCzSkqNxTUj74GYpQlVoewCWwXMTbYK9CFmQGEeyM8016OtHUhzJ38BtX09jmq4
         2/6BkBUIdfTokcPg1hrLzzonxhyhsCR0kESeKzOhhlJRi9xjDf/d4n0ThWw6iieMZk3H
         sZt1OUfXB4SEuQp80cY/zMFWnAujPjqtSWX9saZK7QDGxJQ2wBAQ0nHC49ULF80andz9
         5NK2RxtlH6jXkKRscCsOhmKFCsSY8qIe8Sfm7VvfX0j9h+8phDDJWDFmXF28yf0lXCwI
         A/4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWCM0aQj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-220d47beaddsor111363905ad.0.2025.02.20.01.31.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 01:31:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWCM0aQj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740043865; x=1740648665; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DkPTvskXfEKDS8ksEDRN9mL+hSgQIvFZ8gbNR3D4CQ=;
        b=QWCM0aQj8iyG4YOSVk4/6XNB7Df8TfT2m7TOxR62/R4oKWRTFdwk+1GpzibDw46YT/
         mQlo+lDU2lxCZ2MX5ie4KPqdlLugtGquAZptQFqWYLXbakpl5r5BmZpjiIpMHSu2Qosq
         YlajmZ4umrRVfry8+fRybXbqdUXkXYLw+1kxEQhiwbD97orfSLR//2QEOiCdNw85EkHt
         ZKzc37yN2mk4tg2m2t2oWdo7xkXMybpGSzgXYKbf9TdsmKbXk+Xew7cZwjXG9ibgC+Pt
         fKNICeis01VJEhj0Ru77uUvKb+w0PPJvrTBdIPYn1v0DL7tAxxbTBtWy7/jcKUgdonsm
         7Udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043865; x=1740648665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DkPTvskXfEKDS8ksEDRN9mL+hSgQIvFZ8gbNR3D4CQ=;
        b=lq4WBpxjI4PnDmhuuMPNT0zxHcQGZhUQnxt24xIq+PCVNKE7S9ng/D4rsYsnFeqhxM
         kLMHxDqjqUKtmWbVaBaRuQjTcxHJJv5ZfKpANOYTMi8AIwF0pnGnHpWkxKspGRuKvcvx
         luBdjl432P/FthTnzbA3T4c5V1avZ9O83GGZ0sV6Xj24MP7+HnNdZdtmHxShCAq4Vqm8
         78pv0iozt2A8q+zO2DWtHqq+u8jHYNqRknyg8ObzkPy2hY4dEXi+7AuyV9u2lwmK981+
         Wfju6gRnItMdSZVdtTDEy1EaTiCp5FLNABTUYfgeiusj9sTH760gGZxDo6CtbXGEqrnD
         p7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi/LK0pH/Hpso4SMPxfnKgbcHDVOSJ5P+NZm/iC2Lx4Jr2h10ZEFWP5GJvSpLx8lvqGWf9j2ec8xwJGw==@linaro.org
X-Gm-Message-State: AOJu0YyWEfpec0kkfukRdzFxx1aDcBAZnPzNXZUaDSiMv/HN1ayMhuX2
	N+kFKc1VFRXLvRnIbNdDLz1VLl6EdJwrcFN9+rJKDiUMiy45h4BtlruQhXjSFc7zxQ==
X-Gm-Gg: ASbGnctrJZ9KcGQwvrkqKTG72eDABogOwnu/ckHX/o/6m0i8fkBOaGOQrYy8FGQp1BT
	VLeM7PhFTDQS+QEhB6fK5uaiQm6+VJT8gbb1z2WDTVjgQiEtyFU/k8wooiGoaDuim/iYj5tsYjy
	+Pvs3+ZrKszJxN6pVyJT+JJauw9XBp0fLtO26DbKTTOn41neM41mj/5Lr6vioIKfnrMMGhWD7yr
	BdZUVD4qixYMCe5FHo53lrQnHZ2ZbEpZVBDCZDAvk1G6US9rdJzEpr1BoAag3yoRLEgRPE1VYpK
	lVquFedDbarcGqIaQjEfAvQt6TdjYeDKo1S9zB09mLXx07N0nip1i113kBoipy8XDQ==
X-Google-Smtp-Source: AGHT+IHfmzLHtddJkZK0gPhKTcPtzUPZ89z8b0ccPmyhcf7pVBkVxv9DNWrVsElk7Iw2TdScMKzjvA==
X-Received: by 2002:a17:902:d2c6:b0:220:c095:901e with SMTP id d9443c01a7336-2217119ecedmr125278895ad.35.1740043865224;
        Thu, 20 Feb 2025 01:31:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349077sm118268655ad.1.2025.02.20.01.30.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 01:31:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Huth <huth@tuxfamily.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>,
	qemu-arm@nongnu.org,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Luc Michel <luc.michel@amd.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH v2 7/9] hw/char/mcf_uart: Use FIFO_DEPTH definition instead of magic values
Date: Thu, 20 Feb 2025 10:29:00 +0100
Message-ID: <20250220092903.3726-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220092903.3726-1-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: d+JCvbj9gi5E

Defines FIFO_DEPTH and use it, fixing coding style.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Luc Michel <luc.michel@amd.com>
---
 hw/char/mcf_uart.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index 980a12fcb7d..95f269ee9b7 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -17,6 +17,8 @@
 #include "chardev/char-fe.h"
 #include "qom/object.h"
 
+#define FIFO_DEPTH 4
+
 struct mcf_uart_state {
     SysBusDevice parent_obj;
 
@@ -27,7 +29,7 @@ struct mcf_uart_state {
     uint8_t imr;
     uint8_t bg1;
     uint8_t bg2;
-    uint8_t fifo[4];
+    uint8_t fifo[FIFO_DEPTH];
     uint8_t tb;
     int current_mr;
     int fifo_len;
@@ -247,14 +249,16 @@ static void mcf_uart_reset(DeviceState *dev)
 static void mcf_uart_push_byte(mcf_uart_state *s, uint8_t data)
 {
     /* Break events overwrite the last byte if the fifo is full.  */
-    if (s->fifo_len == 4)
+    if (s->fifo_len == FIFO_DEPTH) {
         s->fifo_len--;
+    }
 
     s->fifo[s->fifo_len] = data;
     s->fifo_len++;
     s->sr |= MCF_UART_RxRDY;
-    if (s->fifo_len == 4)
+    if (s->fifo_len == FIFO_DEPTH) {
         s->sr |= MCF_UART_FFULL;
+    }
 
     mcf_uart_update(s);
 }
-- 
2.47.1
