Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp703693ejq;
        Thu, 9 Nov 2023 11:28:59 -0800 (PST)
X-Received: by 2002:a17:906:f19a:b0:9e5:ceb5:ada6 with SMTP id gs26-20020a170906f19a00b009e5ceb5ada6mr355878ejb.75.1699558138875;
        Thu, 09 Nov 2023 11:28:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699558138; cv=none;
        d=google.com; s=arc-20160816;
        b=Inwe1hYDU+GNjF/pkVszp9oAISkTFUqg4e+UdxWnKj5XbINx83yLN8T12HLwxsCzKJ
         FycPCTEwKWgNmrln3QItuvW+qYV5Huc/9MtSJF7/a5UuPyJO/Gx9f5zykZEYJZqB5sx0
         tWjeJ+sV3grjIml+SQ12+57N9sDHF7Qxa6Vha/Es2RCYGIImKk7+KDTcTC0EFg975zSO
         M0NvQd0Q6Iy/Z007kXKu+il+ebPv6Ym/YV8WlNjZp2xgchuv2riQfZ4hxhnQDNuIdcoe
         POgHe7g545WarfUWZEOmtl0lVxaBn8vSxU5xMhY5blJ9h66ewUVil5H+TmKumTbkUYWX
         MEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SyyFM5rojPE+uJBRWUA1uUis15hpR5uGCcF147lyuU8=;
        fh=Zi/lk1CoRxouROvt4Eod7oP2jg68ZE5jz0tOr4SBE9g=;
        b=OcENM4Tc0Tsg8hnZuwSzKXFnPGP1lbdLPwkr4ITYczTGJiKMmu0z41XZByFALIT7md
         0W8FTeWf+DIFVBH/JSPz2SDOvS1oz+09n4I/sdNcnFik6mxPwdu/nkM8CLkjV0G2Gkha
         MmQGSJ7DJ+vTMfexB/nCmplftQnOUhhgiWZHB3+IKtBj9aBHlKk9Z++dzmouj6FTqmEm
         ycjYWEV//PZH5yN8oAHLLBnO6wS9tNEIvRu3qbbEAfwyKRN6NUx03GR896tsgGEJjUEy
         BSLvi3kMPaeR2YWddq2AkAXKWlENWqlr3E6siB1ZSizRxm7vmCqhcksl/LlsLHPeZv2q
         TVew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWGErkKt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s15-20020a170906220f00b009ae4b13447asor3260715ejs.19.2023.11.09.11.28.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 11:28:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PWGErkKt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699558138; x=1700162938; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyyFM5rojPE+uJBRWUA1uUis15hpR5uGCcF147lyuU8=;
        b=PWGErkKtGKh2c8d6Wm7nuiRPOt1j9X+pbR/DDnTx+j7TVpa4xxLjRnxVDphJpYmCVB
         yxuER2OgKqGoIqC7sv3U+Y3rQLWyPR7guaxVEdJoixfEG/qQu4emun0CAo/FHvIjmZ98
         ycMhffSjc9Fl9C7Ke/I6cISThZKOHViObkcql0wig9pHEWILV7sZBJLJ1HTIzCarixLa
         w3v/kd5GvK7OEcCf1iLUChM6GcnFj2vOgSBQn6n0eGFn9uoFbu1anSks9X+W0bNsZqU3
         +p3Nu1nhNhpOZLnr77+9yqVvXjESN268Jyfs2krW7k/0HfI1f802gob7py5ENF4XOCke
         o3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699558138; x=1700162938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyyFM5rojPE+uJBRWUA1uUis15hpR5uGCcF147lyuU8=;
        b=HE6amlldWe0Sc2a0P3wPsD5pPcdDsp1hdyjKO58yUO4tnAesffQN3268uh+XZjtKR6
         QcUOEGQrsV/a3SqjiHTG/yAdAKwddBcNWLVWU9pAfpEMJ5gCGAeUv2thlO3KJuvdjcbD
         JmDN376nrfuEJXt7vF8uskOhd6FmyXcGztHe85lscUvmaiLtOu6UFPNcYVR3gPSh7tVW
         FW7fVXXEvICxeV4XisEDhEMkDhuh8MgQtLGSlxW0v68Pt68TjsmiAw4JzGdgKKkVsNsf
         xaeDuuy+vcwDI5gZuqBh6Nt/RcEKs8x0s3qSNa431bWadyYOnzcSuMAAdgT/scg8Zz52
         NIZQ==
X-Gm-Message-State: AOJu0YzV0yEAw/JgXOQS5J77vW+LpLMWyKW6aMT/WFHKng4ThS5AH4Wo
	crW2PO/ryWo1ZxWeXhgpf9ShQNEO
X-Google-Smtp-Source: AGHT+IEEqqr7N64ypg881HZQy8Pe4TRT0j60Rt1LHwaHNJh1J82Hmd1+KXR5zRxwESQEg12Z5PsU9A==
X-Received: by 2002:a17:907:96a5:b0:9c5:7f8b:bafc with SMTP id hd37-20020a17090796a500b009c57f8bbafcmr5691609ejc.22.1699558138606;
        Thu, 09 Nov 2023 11:28:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.161])
        by smtp.gmail.com with ESMTPSA id s3-20020a1709067b8300b009adc77fe164sm2938523ejo.66.2023.11.09.11.28.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Nov 2023 11:28:58 -0800 (PST)
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
Subject: [PATCH-for-8.2 v4 07/10] hw/char/pl011: Check if receiver is enabled
Date: Thu,  9 Nov 2023 20:28:11 +0100
Message-ID: <20231109192814.95977-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109192814.95977-1-philmd@linaro.org>
References: <20231109192814.95977-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GhooZrql8dzN

Do not receive characters when UART or receiver are disabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/pl011.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 9c43cb47bf..ca931be139 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -77,6 +77,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define LCR_BRK     (1 << 0)
 
 /* Control Register, UARTCR */
+#define CR_RXE      (1 << 9)
 #define CR_TXE      (1 << 8)
 #define CR_UARTEN   (1 << 0)
 
@@ -359,9 +360,11 @@ static void pl011_write(void *opaque, hwaddr offset,
 static int pl011_can_receive(void *opaque)
 {
     PL011State *s = (PL011State *)opaque;
-    int r;
+    int r = 0;
 
-    r = s->read_count < pl011_get_fifo_depth(s);
+    if ((s->cr & CR_UARTEN) && (s->cr & CR_RXE)) {
+        r = s->read_count < pl011_get_fifo_depth(s);
+    }
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
-- 
2.41.0
