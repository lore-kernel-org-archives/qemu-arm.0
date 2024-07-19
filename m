Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617178njc;
        Fri, 19 Jul 2024 11:11:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtLjjqs377QdL5KcyopO0GiiF2cd6eRO75/jz0R1dWA8qd5JCf69j3Nkn2+EITeXGJIGvgFnUFNmJRsoT2x9N7xRazY6BE
X-Received: by 2002:a05:6000:184f:b0:368:334d:aad4 with SMTP id ffacd0b85a97d-368334dad25mr8065373f8f.4.1721412694722;
        Fri, 19 Jul 2024 11:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412694; cv=none;
        d=google.com; s=arc-20160816;
        b=N4YC1dFS24owy47SWSQYdBcJx/2Mksz5eEMimqP650GT+42OowjrKp+sJBO7000XJ0
         h909rbneb4nwqOAm+rYcz2K8FQBsIlUPDj7BtWyewgJj6k7a8cLi8cu/Bu7+tkNKHof/
         imSHTN5RVFQaYnAhoOf3HwOzPIQaBOymWHS9BrA8DxON6gNs5Ce6cpN1ONEnuFjdXYLS
         4OvkG9CiRaSuTA4TY7P3csxcmh6bsFECubaNJ03PIVfF3yJonZ14l5HixMx9D6zhObLe
         X93Tw4v+el+JZb32jtTZdf5WndcBf42qDPh0QS10RrjqN4b+7F0EE5rchIVIih+ZdX0g
         Ay0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=k2XEnhFM3nuD2qGNt8O7aO/xmQeeA1+fM2YLyMtjpsg=;
        fh=QKsSJsIMbmX9QAY3i6Nfblyez8brX0d/3lCuBdMG/e4=;
        b=hB6jdOm0v5VXU+sL9kBDz/hoZnJvbCUV6yjYM18Pz2DiUOvf8esNAQ62dhzSudwwpj
         xL5a2vSY1sRaSffVltthrQKregpYih+A8skonU8cr6Sk8Z27Kkl0ssFfeIqidLuAPgSH
         tlqRGRLK5mdKdTZQQEzXaTPI0gOpvfoEFypZip9h7pu6WuFpPfu31Qh9QI85IzX04Mzv
         bDjqOf3+1yQNw/uUQz74Yup7cEL+Cg1hHL2rIxfJfD3IZhwIKE8uaBqiSMfSD3T+3pZT
         xSWUu7eaWZQBwnGw6CI2igZL2ny+62Wh9CqOLVV3vw2F33PQjZTUMKQQvZOdITbodPLr
         nNlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FYvdasGl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d7006ad1sor6158625e9.13.2024.07.19.11.11.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:11:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FYvdasGl;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412694; x=1722017494; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2XEnhFM3nuD2qGNt8O7aO/xmQeeA1+fM2YLyMtjpsg=;
        b=FYvdasGl+H+54VyxfuY+IVgOf1Dyn43IJNRSkgc6EoQi3FppyhNd578uC3NpPWWIFc
         7/515nJEx9ewgQH2tWd6+B05mOg8aRh3rnpncHDTJVlI0Z5qW7cqVZ41C/5KNNRclydT
         1ScPNnfqSYTd6sd1nCMD9LMvkeBhP0jGk/Wn6vCLQHdkpilRZG2sx9C2aZ65uCZ/KO85
         v4e9qsr3vHDzeUU2jVSN9kd/Sy6ZDC6kXWEf1pNpb4b4Gqip0zupQ9pXWyJj1EjmkKLs
         IuteLukDwXwlmYHVK6GdQoXByBV1nVQ5TntpOkvMkvywCD2sVDcLzerQlL2M5aYw6CEB
         988Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412694; x=1722017494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2XEnhFM3nuD2qGNt8O7aO/xmQeeA1+fM2YLyMtjpsg=;
        b=EwBU7Ttxlq62Ekb1bQYlTPK6yARB3M35WE3W1DX072Pjxgz+QoUw0ZBSQO1MEtd+ja
         vD6kguRZJfwhupXg9TmRSLxqcbxoooOz+8ayZGdqm/lEL9mlqeV0R/tZiOsMSElMZmtV
         BsGwkNLCYOi9CWANwojK0hfbvvR1cw9ADi6VkAdZ6Xosb/yJUTlLLCAKqtzXjOlwT2OO
         x+kJs7gmrE/ajVupW+j7GviIEVw34FV95Tq7dLhLqorcHwfG7uOnZywjXoN7bNZFHJoB
         loU8BjCREXTm7wW3+WnQffJp0VSdF1TaaEm0bEGVc2wvhfaOJNtF6MENA0jrE8Q4Gmdq
         Doeg==
X-Forwarded-Encrypted: i=1; AJvYcCXhWIXAb13kdy1NlIxI32Dc7fHAn1KcbtcjRVjNDLyvFB/AfvylLoXt9KVWloqpYvyEocP4l104F1OlZdhueUFGKnhuETTw
X-Gm-Message-State: AOJu0YxBdK/1fvK3VcpHdyzoCI3Ws4zCgAHUiNcdz9rS8fX16A71zceu
	dOeMxw3MD0XkkCYvDRNfq2a8YLY1G7KwYdNCNYae3UGEyDdBu9tlOZ7CtvCe7ikjXr6XwNgYJt/
	DWD0=
X-Google-Smtp-Source: AGHT+IEr89MmK4OUZpr7c5pFLvBB8jJPGvUyda7rkXtYo6bxb/wIkpX5bKrrajVZmNqvyxZbn1T21Q==
X-Received: by 2002:a05:600c:1c21:b0:426:5d0d:a2c9 with SMTP id 5b1f17b1804b1-427c2cd36d1mr63774875e9.10.1721412694282;
        Fri, 19 Jul 2024 11:11:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a7257esm59439785e9.28.2024.07.19.11.11.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:11:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Tong Ho <tong.ho@amd.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 08/16] hw/char/pl011: Warn when using disabled transmitter
Date: Fri, 19 Jul 2024 20:10:33 +0200
Message-ID: <20240719181041.49545-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HQehgVZGxHRq

We shouldn't transmit characters when the full UART or its
transmitter is disabled. However we don't want to break the
possibly incomplete "my first bare metal assembly program"s,
so we choose to simply display a warning when this occurs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/pl011.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 5e44837206..c76283dccf 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -85,7 +85,9 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define CR_OUT1     (1 << 12)
 #define CR_RTS      (1 << 11)
 #define CR_DTR      (1 << 10)
+#define CR_TXE      (1 << 8)
 #define CR_LBE      (1 << 7)
+#define CR_UARTEN   (1 << 0)
 
 /* Integer Baud Rate Divider, UARTIBRD */
 #define IBRD_MASK 0x3f
@@ -223,7 +225,12 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
 
 static void pl011_write_txdata(PL011State *s, uint8_t data)
 {
-    /* ??? Check if transmitter is enabled.  */
+    if (!(s->cr & CR_UARTEN)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled UART\n");
+    }
+    if (!(s->cr & CR_TXE)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled TX UART\n");
+    }
 
     /* XXX this blocks entire thread. Rewrite to use
      * qemu_chr_fe_write and background I/O callbacks */
-- 
2.41.0
