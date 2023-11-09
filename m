Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp703645ejq;
        Thu, 9 Nov 2023 11:28:53 -0800 (PST)
X-Received: by 2002:a17:907:3f14:b0:9a5:846d:d81f with SMTP id hq20-20020a1709073f1400b009a5846dd81fmr4522722ejc.17.1699558133136;
        Thu, 09 Nov 2023 11:28:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558133; cv=none;
        d=google.com; s=arc-20160816;
        b=cR+nvwUXJMI9Yn11Na+bwNAwJRuVsJPmI6mRbKRmJWa56pU2xnGUdtcVfzTzJ95kxv
         f7c8iip+em8bpq8uNQnoIh5R9HJHKhbAeZu8f7fCiJixakspaib72/sbhJp/91au5pCe
         ijz38HBlhKq8hLcWAswoHtPklOlVWbW154/4dt2KGGcQNverZMa8kBp2OhbIFJkLM2t/
         wiFu1P9KHzLGzGXrd5eYlIMV+EOAZvyvWf45r8X9ZY4p/VNe3qW/oynQXE+nPqAaFf9T
         lmR4aMMDVa7pTz3qNfNZWSBTWsJMCnr1iIrxenFdZqVS8UJTaD2IlOI5w43RzsUA18Bu
         IN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TEZCH3t9203jXT8Ca8hiOxWdvxGRGRt32KSzy33l+nU=;
        fh=Zi/lk1CoRxouROvt4Eod7oP2jg68ZE5jz0tOr4SBE9g=;
        b=wwRzBYwy6xN2j6S7Fu+FCq4bCMuCC2b6XGiRlsnQwOAtbi5qkUrSAiR0REQ9Yfpf4r
         ntVdcp/9fXyy7Q2E2aLYAUn3mzYkie0ntEAjaIAAP0qUgl7rz817qcwfW0jA9Gsrf3RV
         VVym0zEWnYcuI8RSuFLKPwuZqiT7GcM6O1qieE8Rve9rNlOZi0W34hvgrFcFEEAXXfKv
         pwRy8NdU6DyUpWr5brWxqP15ab2yUAzJJXcFkJs1yJAmH8HdMBCNxu1q8rkldVZU8zzw
         KcNFJ6UwQshF2ILY7cxmPBpQFPQ2jsyePQ9sCSgV4RbQWKz3W6a5l5P0hckADt5b7bWm
         KK0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OMXaLpWp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 24-20020a17090600d800b009de467a25d4sor357733eji.2.2023.11.09.11.28.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:28:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OMXaLpWp;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558133; x=1700162933; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEZCH3t9203jXT8Ca8hiOxWdvxGRGRt32KSzy33l+nU=;
        b=OMXaLpWpQJJoLAcZza/1yuMbBpK9u7+fSqVvRisHhn89cea+0xw0SqltMh1vRnpwXj
         jCgTiIUj+6vyLDw+i3G7wYhXbr4pFAQz4KCDQiQxAaCjsjzn5v+UtqxKUQ4Vpp+UaZiH
         LMY/EF/H5oHmaX0RqpbgUbw1Mm+xU5EY8HTYQ6uV0yHQZwXOoHZNsEQQHuqqUnBcLxEa
         QqaADaLmVcfOoBFodPzI2uxdEBxtqg3ZgniarywgMRYCgdvlsLtIru2rg8wmVh0YLQd/
         iuhNuM6Eo572f7VTN+V45l2cypNtRaAvShDMcYWDk0bgB6VampAf7u6dsdOE7Dw8szPI
         P9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558133; x=1700162933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEZCH3t9203jXT8Ca8hiOxWdvxGRGRt32KSzy33l+nU=;
        b=reyTca85kkOyYL9UKunUyC2qk9qDLBw14QzW3xrognZp+61ssvwlnghfVb7xg23JDP
         yA1pXQr9QTsAC5ZdgtsC7h/Jr1grB1iR5QJD0L8KFHy00YCFl6B2WY6xe1C0Fqed7Hxp
         ymrkXcX33ZVjXb25xHGKo+HKW8qX++NftNucpYkuXpB4rrO5wMEM1KTVMRrvoWcVyvtv
         9Or6igFif0xSL8b/rKuOxY7fNW9GRBQmkMYAFA7SjGQMLP7dDwNG32Nlea8mbupq2+X7
         qSE+EAB3oKyB7e1qGCgjWY9yePMAJBK7cEwXY9BOv7qrAzeomaHFK81vsOU6s4Xg/oV9
         mI7g==
X-Gm-Message-State: AOJu0YxMQXST3NjJ6S4HM/7HqBvvyc30pRuFdIub8d7HQUrV/X+AR82Q
	1dyK1rJQUfo3MzwKPOXhwWsAH4ld
X-Google-Smtp-Source: AGHT+IE4Zyn8KXdktvGc4uyvoiOmwlNKr8f7had+FoLm5D9aXdTdHbdq3c31AhUYwDgoJSY7N+NY1w==
X-Received: by 2002:a17:907:a0b:b0:9bf:9c58:e91e with SMTP id bb11-20020a1709070a0b00b009bf9c58e91emr4392989ejc.56.1699558132912;
        Thu, 09 Nov 2023 11:28:52 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id g2-20020a1709064e4200b009b2c9476726sm2904753ejw.21.2023.11.09.11.28.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Nov 2023 11:28:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH-for-8.2 v4 06/10] hw/char/pl011: Warn when using disabled transmitter
Date: Thu,  9 Nov 2023 20:28:10 +0100
Message-ID: <20231109192814.95977-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
References: <20231109192814.95977-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ErclKFbqlmBF

We shouldn't transmit characters when the full UART or its
transmitter is disabled. However we don't want to break the
possibly incomplete "my first bare metal assembly program"s,
so we choose to simply display a warning when this occurs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/pl011.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 30309337b1..9c43cb47bf 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -76,6 +76,10 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define LCR_FEN     (1 << 4)
 #define LCR_BRK     (1 << 0)
 
+/* Control Register, UARTCR */
+#define CR_TXE      (1 << 8)
+#define CR_UARTEN   (1 << 0)
+
 static const unsigned char pl011_id_arm[8] =
   { 0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
 static const unsigned char pl011_id_luminary[8] =
@@ -151,7 +155,12 @@ static inline void pl011_reset_tx_fifo(PL011State *s)
 
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
