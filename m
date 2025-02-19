Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1628170njb;
        Wed, 19 Feb 2025 13:09:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXStsrDuPk/KAFx5tHX4Ic2hqrp1g9VAYH49jKQX/Qdtbp6XzraSlqbG3mjM7JqdRl2KGgYUlCSRPUyfA==@linaro.org
X-Received: by 2002:a05:6000:1aca:b0:38f:4f07:fab7 with SMTP id ffacd0b85a97d-38f58782c55mr3907400f8f.8.1739999367450;
        Wed, 19 Feb 2025 13:09:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739999367; cv=none;
        d=google.com; s=arc-20240605;
        b=W4LWnZZKhrS6eentPLKTHDPPKVtkqGatNH/RrsSp+Ql7iZbVCcozgvw9FJI/qqIn1U
         1nX3bpdBr8yml3MWrAANCNJ+ZTaXTroruW3PcbLu43OtzyZoaqaQ5+fYBriBCnE+F1hv
         44S94uIZC2/wR5gQHtOcqC7NpDGXXK2tYQhC/grzgLfXnkBRA0H4RbWNz7YXPXwaA8TF
         lUu7xPVC+QwFqPJixh3merSZT3m/Uq3vHOnRXNPFlBZA2rTiXdJeV/Ko6hFW/qOZdo5f
         /kQriqD02BY6dzJSbGVsoTH5GYnisDa3cwQf3nftUP37CZNk461hTC+QZRcbSGgRMkhx
         KvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1M+9N1O1172KT1xmekfC3o1CG3P7IIUgC0GICjqwA8E=;
        fh=o5mg9NL2jR3I0DAYxJ6mxPt0P2nIElx3+6x2y5HuNsY=;
        b=QQTlVmUXuIoHTUGV2fKxGPzoW5h/WvO+zUbmYNC72VrZNAIJk6WDs7Mb6Z3iku78Ks
         Le5IO0CJ1zupU0qfyDZGLs8kjLzXaK339i/NEAhSAAeKlTNzBkZgWk00MX3fpoZgejxw
         O4OmGfSh7Bv7h2RfOTmfVGkPi0V8+mxUsus32NLTltJHwyFRq9GK8LSVvZrAyP8xE8EA
         k8l9GtEHe9jl7Yl+Vy9rFno1RIAct9GHEnToyCJnCAu7FBWDTBiyCccoOZt9pMuHVQLz
         Cf5tDP9Xq4l1e7EnuOtm9yENdS1g6mtc+s3pVgv9qEEeSNCQHhOZSffl9ZvgLycEu2v5
         pgOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zwabolJ6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439a0df3f89sor4732245e9.10.2025.02.19.13.09.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 13:09:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zwabolJ6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999367; x=1740604167; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1M+9N1O1172KT1xmekfC3o1CG3P7IIUgC0GICjqwA8E=;
        b=zwabolJ66VYfeqTAdNhtrWrEHflo+6cIVmhuS+flqCdU6FrBEHUNOwqIX2G4eLQduI
         VoXEPczY0BzhfOwZ4bmJsvO8yO0AXZx7PwwyQV8LXo7ihS5pHMlND76jjnCus1q5MzvI
         EYxSK1dBrLrzrCtVWIm4hPdZe6aWPuHpT1N6HfhCt33YMNYp1BJlYFkLBaj1l6YwB8XC
         JQlXWm1JflYsFgF0y38AAOLqIz1q4WAZ17Ex/GiLWOhHlv5zNBnqr1xi6TkDaAlQFBvt
         iz4nVBOWK3z9Zbye0bzQ3wvVYl/ULadiSuNV9AgBwmzFtO16DT0+NXuGlxl/FrQEcFMK
         uUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999367; x=1740604167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M+9N1O1172KT1xmekfC3o1CG3P7IIUgC0GICjqwA8E=;
        b=c4amhgVRfxirMo9rBk4b43nRL2C7c5KfCoCP7JtbjOdgL3WT6LIchUBGZ5x7aGM0kD
         KRT4bkY1fTbTSVqBKnuG9nZC56+KW0tqHIAKeHrwenA0DVysHctseyk0nEPcHTmK24Ev
         UtG75/pNX+l79fbqWYUpUYslrLaplFZ63iawh4apRdHRTsmNjAhhUHb4MgQlqSg7nxAY
         JCwN2CgPwdygIrsVsa8IVBtVSQsrRFqx/L0b2bbi1vUzFx9geEu+Tbsv7nFyYPazUJsp
         o7oh3wGfJj7W9i9/R6a9LkaonaZGGw3kqpxNqkivhsLmQkgAih14fq+jb6PVUn3IR3k1
         6WeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmAiaDWIUu7cJv+RgxuqfAzSDE41UmlfyNCQN+kkTvOkvfoQFqYq72nd9MWvM9M8yyniTyE4+A5/Bzrw==@linaro.org
X-Gm-Message-State: AOJu0Yy4uZ3B63mCO//k9XMlZzT/3ZPottFKMKLl35TcvY5lWLtWo07k
	bAipWpDbC0eOBx0qPlnqaU79ep1PiXjkgSHEkU9e847pGC8Tw44j59kJTCDpRFG7Cg==
X-Gm-Gg: ASbGncubQw/Som15sBGB8jhT75iO0yKdfiI5bI427PhOtAW1/5Q4K77Q6WpXKwn7DnS
	k3LRBw+3kXQOAqbpmbz9zm0rX0OrEW/bBvkqGtFmU2YD3rfC1SP+lvan8PT8JG6S5wqM1fE3KjC
	jZtR862ybtTVkHebNiqdQYBQxZJPboU3Acev9XGwhlldrqzj2eRxmmxnCiBHeLod+mZmNY5fZ0i
	GrcCZVsTZYPJ9PAibQBpDeLK+unWksqI1fiZgfINI0GQM4wIWmOxTDsMGX2ufLPjkVQud5nJiUk
	V97Sr/70QAdVAjrFXcy9XQ0p+WZozFXLI92QrbWSZUXR+yxNIkzJ1GK2g8ldCQAxLA==
X-Google-Smtp-Source: AGHT+IHgQjtyqw6XWw6SOlJ72y8SLFeZ4PIEzvT9q1McUWRWY3RDiPIVRF2x3LtvdBdqtutQZFDrLw==
X-Received: by 2002:a05:600c:458a:b0:439:3d5c:8bfb with SMTP id 5b1f17b1804b1-43999dd11d6mr47685055e9.22.1739999366853;
        Wed, 19 Feb 2025 13:09:26 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04f208sm221457235e9.6.2025.02.19.13.09.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Feb 2025 13:09:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>,
	Luc Michel <luc.michel@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <huth@tuxfamily.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH 8/9] hw/char/mcf_uart: Really use RX FIFO depth
Date: Wed, 19 Feb 2025 22:08:40 +0100
Message-ID: <20250219210841.94797-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250219210841.94797-1-philmd@linaro.org>
References: <20250219210841.94797-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KdAKUm7uKgQH

While we model a 4-elements RX FIFO since the PL011 model
was introduced in commit 20dcee94833 ("MCF5208 emulation"),
we only read 1 char at a time!

Have the IOCanReadHandler handler return how many elements are
available, and use that in the IOReadHandler handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
