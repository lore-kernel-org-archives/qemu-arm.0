Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1286995ejb;
        Mon, 22 May 2023 08:32:38 -0700 (PDT)
X-Received: by 2002:adf:f306:0:b0:2d8:708a:d84 with SMTP id i6-20020adff306000000b002d8708a0d84mr7337486wro.19.1684769558325;
        Mon, 22 May 2023 08:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769558; cv=none;
        d=google.com; s=arc-20160816;
        b=Dw/AZR+b+Hj9MEZJcfVwtaPS2xdT9MLwrzaOJOeCydSuUb8U6LYsE55LYwNxfQr8yT
         krR4BfqF8XSA30NtkYgpTzPojfhpZvuMRQ/hTjO873pPnqzOz0m7P6SqQyD6mHqVS1o5
         i3iaOKM1S6PotUIj7eMxI/lYTqZUPsMk0W9xCALWvPYYNxnRqR+u0+bweUFN5MakQHRu
         eCIFuwOmVuOMgLRQf6TTAyYow7OO1w9RpmArajt+x858x+nbMsFlxevpNri/wQSqQlyk
         kdjvhpa/1ASfe/SgrlFhFOpEGqu8mCMNr9GZiHDx5uSWr/fJONcw5CpQJY/YQAZzax53
         tfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zbYgJ/CF6X8oXk1c18I3fiTWkENuu1esnlnJzdOgw0U=;
        b=Zy7XAEjjfG2deL2Eo6pw6f13/YoEpoLD9Inb9uFSyKcsy0YKlfKWIk+siRJiulceGM
         pKPJxdhN1K8nBHPnHUUfrSOXIOd5ofjOYNQvLB5Ca2UDU6n6VVEReEstVohwMmB769/q
         MGNK4wxkb0LTKgKgcs2kqf7Bnx8aCnFK58m1bmcdY+PclyP3q2yY59+GAO53g5vBUeve
         hyYb83fhhJAqFCDB8mTHvcLawISQaHqmGX/jlQKwZ5FgveuIslASK/sJs5u+ELz7Wkr1
         qrR1w75uK2Ue2Yl+D4/IsMZLPozVJ/8dwMz7mu2Pu4L/qpwO6+/twechd78MAEByswDD
         TvfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sQTsuO1+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o2-20020a5d47c2000000b0030610f15962sor2131646wrc.6.2023.05.22.08.32.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 May 2023 08:32:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sQTsuO1+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684769558; x=1687361558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbYgJ/CF6X8oXk1c18I3fiTWkENuu1esnlnJzdOgw0U=;
        b=sQTsuO1+IR3wG1880nFla6zQQ4pT1gMu2cJlzad94PzBKPVJQZ1U+TWNTTNFvSXnEk
         S5E+9kvIAUfjTOolpryQJJLDJaL4mkJ5AK3rL5Gd1X3q+j1KYU/ivJH5OScWV+fEDSvv
         /IWAEWg/EpFl/t/nb1SmEBVCbuqMW7cEKesoiLB1uF1B2iJczBnDt+bzz3tBXpu0WM9R
         Thwuq0eIgb36ABh/BtBlJYuMSM+pYVEsjStML30tSr7ngWXXZ5tHnQB+z3Lx10VhZUW7
         qhQylGRGA5IJT1WBRbw1Atx4k0whDA2qDQM7BrQiPDZfgDRkVNyylKwexiX121ORirQ2
         v1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684769558; x=1687361558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbYgJ/CF6X8oXk1c18I3fiTWkENuu1esnlnJzdOgw0U=;
        b=XfbogTBukIjEgeEKuB7vjpkQyAljlfiX9zq6E0vQyDVpELchr+WigLt3V7Pyn92zVr
         Sx1MPbv8+8EKtO+xBSqJ9ToZ3RMyiZG06TIg8fW6GDfySn+2hE/1ADP7/nL2PwFIU4Pz
         6lAOpYjchygWZXKQsYm+W/xIvZspw9g951P9XiCv2Q6qxrl3T/EKQADcyQi2/OWGnywk
         zjeeIAOVQqN+e8cFvnNLhcrkMondDZpBtNNVKNYWuOZIMkJdvb9RkbJ8kQLfB1S1Fy3f
         +1iPhZQcIy84qZDIdsPwnzV5ajPsg1HWWsNuSfUy7oyGUT+/1M0eGI/1aXCa6hCCbHll
         G1Sg==
X-Gm-Message-State: AC+VfDygG39xGcEIImDyyU3hU1VSMMsbkhB1vJWOYzgOvQuSxD4xDy7F
	Idh7jSjnNAutBpwxHaokbm4LZYn+
X-Google-Smtp-Source: ACHHUZ5HXvOYmrb1/Rt7YTNlFxzOSDqkPd+oX8zm7imtF+5ZhV72MJMEdczweHN95gDKYUOPqDPzUA==
X-Received: by 2002:a5d:44cf:0:b0:309:54b6:33b0 with SMTP id z15-20020a5d44cf000000b0030954b633b0mr7758639wrr.44.1684769557960;
        Mon, 22 May 2023 08:32:37 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id f15-20020a0560001b0f00b00307acec258esm8082350wrz.3.2023.05.22.08.32.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 May 2023 08:32:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/12] hw/char/pl011: Check if transmitter is enabled
Date: Mon, 22 May 2023 17:31:41 +0200
Message-Id: <20230522153144.30610-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230522153144.30610-1-philmd@linaro.org>
References: <20230522153144.30610-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IIi9xWN5CtAR

Do not transmit characters when UART or transmitter are disabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c55ef41fbf..30bedeac15 100644
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
@@ -151,7 +155,9 @@ static inline void pl011_reset_tx_fifo(PL011State *s)
 
 static void pl011_write_tx(PL011State *s, const uint8_t *buf, int length)
 {
-    /* ??? Check if transmitter is enabled.  */
+    if (!(s->cr & (CR_UARTEN | CR_TXE))) {
+        return;
+    }
 
     /* XXX this blocks entire thread. Rewrite to use
      * qemu_chr_fe_write and background I/O callbacks */
-- 
2.38.1
