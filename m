Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1888421njb;
        Thu, 20 Feb 2025 01:31:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrNCJuH8gTs/IJf6OEqicKPiCSLR+qsi255CvWvM44zuXOF2htGWQtSimTFDQ5kAYH1yfDIIp6/aY6rw==@linaro.org
X-Received: by 2002:a05:6a00:130f:b0:732:a24:7352 with SMTP id d2e1a72fcca58-732617998dcmr36352575b3a.7.1740043880620;
        Thu, 20 Feb 2025 01:31:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740043880; cv=none;
        d=google.com; s=arc-20240605;
        b=JsvCHcWhOuOZNRQqWxRdxFYWy5QOSrAHkOrzLu1FymuP79WFB1Wi/zalIDOdS4xguR
         lfJ6tPT40FAhHtZm/o2YatO6/FvkPt9kpR5ZPmJp2OdG+GdooQQ1L213IMY0ku1+e492
         o+IojeKJxGsnSkGhjzd1TMlLTpYnli//aenIk36M7v1NyPQ5V0o0TiBlrUAYCE3PRtMQ
         YBESNRyoeou9KdzNbpGeP67ZRtd5Z1XTFfZ++/WtT2+KMxwymzi89aLw2ll37T6ZAaR7
         5JlTUAJlocsiwleiLBWP20BUtghCR7/v9EkslDknsmILxURql51Ln376+TF1HyUb2b1/
         CxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HC4oun0jFc0+NwBeUFjNGte1nRrGw6nA41LdkLLgvBM=;
        fh=4Uu0lcVRDD7PLAjFVNg5oD0JJFRMNQJYZgIdHmwwYPk=;
        b=QpQQvj513NjlIBgOgpUw43baG7GLavIBPg6QQpf8vxMC9yjNHmmw02q4lzKt90eQUg
         DJzKo37JPCD5YwuldPaZKETQoYkm7OwlriMdYKgs/Dy8bWulaqdODwJZCGVtXih5n5T2
         8DKyZit8OwfhW0m+D3mgSW0g40cyL/N9Nc2Nn6DJyGLGLtSwVX6kRIsFrVWPfiD+viz/
         x/KtuUPcM/bRny+8scH2FqNuTL1hI90rVdhA3lQbaStiOqoHeL85ADfN052PJ8ofDvac
         SC5vGLNHncXZOPdjeZ0ljWAxYRueXhqQ3OqfVWlZ5ITKpQwlxwiJjHkHjbJGSXwl+3A6
         +Mxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zdx3NhlQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73242454997sor14312492b3a.0.2025.02.20.01.31.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 01:31:20 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zdx3NhlQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740043880; x=1740648680; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HC4oun0jFc0+NwBeUFjNGte1nRrGw6nA41LdkLLgvBM=;
        b=zdx3NhlQj7OLUygBwDiw98b4L41XhdfKgwzfaHqgtGKP4H5jTapBKWE6brzuq9aGMB
         viKOJTV/TUgrc6uK7oT4B6mzeeGUZSvS2EzkPdi5T/6b1Yo/NIoq7ewr3DTfDLBPVdRu
         CBT84vuVMQw1AOcwktIlCmM1bIlyDslJFcbDeTDfm7ITm+0qXI0dZSwJWdOWq5Y1vrKN
         ktOAn+LnfTK1z2pJl6Z3iLcl8iaT7Fj/hmDaLI1rYjNZ4gphb95EvreExgKP77u34WbG
         NTqlZXCVQW3urpSzUljGLOB1SLAH6ZxP3ktu0uCy82A5+jpUfLMjNQcUBLr/KIGQ6nFK
         mZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043880; x=1740648680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HC4oun0jFc0+NwBeUFjNGte1nRrGw6nA41LdkLLgvBM=;
        b=Zx4b8Pry1RCvKvJI4Iec9OzMDzYLsNsJyBXXr7RRYKuQw0arjSZ8E2LQ0F7yYBo5L4
         0Lo6XiftBIHulGl7maARzfI1aseV23PoWH/dQi0fxox043amUK6HqLiW8v3/0ZWQkfvP
         /GaWRYCvpcU9RmJnVrWrG00IG6mCfH0SUPYvan+mXceRkZqp8UET0RmSNifZReMSN48W
         CkNNhhY16dZoZt9RiIetCvK8CJRwg8xDFMcMNTgrtK7IhofHFUntrWt5mBc+clV9Q7+2
         sWXqUYeTuCqIfOV8GnClg3vYMNCZ/IlQEwI+BhKUxrsE0Nk0J92EqlI7Ayv9c+cry3lQ
         XoIw==
X-Forwarded-Encrypted: i=1; AJvYcCXXjQt0ZuHinupzMgKmf1Szt2m7Kgxxw828rCcoogNDGtIbrjV1yT2ZmKPhTWlDLSzIXb4Oe7SFhOzQaA==@linaro.org
X-Gm-Message-State: AOJu0YyHD3/+V2lim7VDUG7ij3raG+tEHczrr/WQFtp3Y6FjbE+Ri3s4
	NAo4TEC5plRnTSBaZE1SVIvI17nLbCL5UFNVKd0ltqMW3nwh1B5/qQSe1ORvgMLt4g==
X-Gm-Gg: ASbGnculckL7Y9NP+aCQHc8qAokesuS2gD3wUSrLFHcZrtKnC5o0OaK4ltpHP6rY3wQ
	wauKPfwBHsEgkkcKGTknpjSiZXlGrjvZrF5Qk7qMjcwet3OuyBiX5UXaFszgTqGu3I/EPPnknSc
	2FrjwEstyRYlOlhu+5sA+z7jI5xHliM3Nux2kYPUMJ0Tfvz5RbRPym+c/2IqtupsAK+THA9UkjR
	lHU/WE7MWK6Bh3jcBgAi2u0cSM0VN8bf+SxvwSZOm5fnB7kcdJRsvyJ6en0lpOqnAvLzPprm4It
	wsSmspbMudryOSBqTS3SoNJVxwPAvB23qbgPf2p4tfxj40kxR7bxxDQhzzG90dHr7w==
X-Google-Smtp-Source: AGHT+IFx+v4FclNABrQD9b4vP9z6wIrsuZioITVmY4/cv4uYCbV2ZK6EAFTucgkbxtN26HJ9CIIBTg==
X-Received: by 2002:a05:6a00:198c:b0:730:8e97:bd74 with SMTP id d2e1a72fcca58-732617756d7mr35402017b3a.2.1740043880114;
        Thu, 20 Feb 2025 01:31:20 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb57c5ea71sm12264684a12.8.2025.02.20.01.31.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 01:31:19 -0800 (PST)
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
Subject: [PATCH v2 8/9] hw/char/mcf_uart: Really use RX FIFO depth
Date: Thu, 20 Feb 2025 10:29:01 +0100
Message-ID: <20250220092903.3726-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220092903.3726-1-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: A6A81THY2aV0

While we model a 4-elements RX FIFO since the MCF UART model
was introduced in commit 20dcee94833 ("MCF5208 emulation"),
we only read 1 char at a time!

Have the IOCanReadHandler handler return how many elements are
available, and use that in the IOReadHandler handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Luc Michel <luc.michel@amd.com>
---
 hw/char/mcf_uart.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index 95f269ee9b7..529c26be93a 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -281,14 +281,16 @@ static int mcf_uart_can_receive(void *opaque)
 {
     mcf_uart_state *s = (mcf_uart_state *)opaque;
 
-    return s->rx_enabled && (s->sr & MCF_UART_FFULL) == 0;
+    return s->rx_enabled ? FIFO_DEPTH - s->fifo_len : 0;
 }
 
 static void mcf_uart_receive(void *opaque, const uint8_t *buf, int size)
 {
     mcf_uart_state *s = (mcf_uart_state *)opaque;
 
-    mcf_uart_push_byte(s, buf[0]);
+    for (int i = 0; i < size; i++) {
+        mcf_uart_push_byte(s, buf[i]);
+    }
 }
 
 static const MemoryRegionOps mcf_uart_ops = {
-- 
2.47.1
