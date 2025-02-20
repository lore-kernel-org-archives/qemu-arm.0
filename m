Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1888071njb;
        Thu, 20 Feb 2025 01:30:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUb+bOXFrUkOZTernluGhG4JbnlJYM8gpq//vqgTXNJIRxf4ylFsdFYuEnE1EbTNcCW7glLYZGauQ11Zg==@linaro.org
X-Received: by 2002:a05:6a00:21cc:b0:730:4c55:4fdf with SMTP id d2e1a72fcca58-7341725faf9mr2898779b3a.7.1740043834201;
        Thu, 20 Feb 2025 01:30:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740043834; cv=none;
        d=google.com; s=arc-20240605;
        b=jDogLtktq9uqE0MqsUzGGXTnbN1tgP7jDjDM8gZON2715eh/52iaNXtA7E8uIsM+qh
         pcnt0N7mtWePlRj/JPa0MPOKjKkDvbi3ZJdgkw1Rs4/5WZFhBbC8rCPJXR4ZShORCqAj
         K0AnZwB3SxoomJmLDNoQK2YZpU5Id7yVFd54b2sr858KChi/TEpl+H0BEkp/dapVFjMC
         znishUbuS1grTeunGHmIq/C8wMEG/rvm9XqpC5L/yuyCpnH6W78aYEg7iu6CuYCTLJrg
         /dCdb1q2taR5KnsRZiHJjDC3x3VHywtEUjLSgRNwaIlrqutKI8+n++enFZP4gSltG11a
         eAxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GNUu0QLM1jJD6vp7svI4zxOCu3a+5YIL+dQ3Ih3Jc18=;
        fh=81lNhKd7pFyiNpxq1+PAfH8fqDzQCpywLSNx93oncpM=;
        b=a8MG0LcFhMuumIbQ6tY8piU/3p+EKmyW0Agm8gumJbo54gksqKuNaeWuvSYiQxE9Yg
         PLsR94GCNsYtpNnXtlNyUEHrynlZLRjcwGVqGjpDhe1832eZNEPPBnXpHaXza0ys8AUE
         j+aCvwxDL1k5pJPZrH6MWhX1vva3cxyXn+V8AM+IiO0JaszStHddXQ1EGFSI+0nchgcb
         H+W12lLRDqq8Td6TxxaRfzuM8bGg07fx35mtcZp0e0ta1tNM2gpDvnbK0xElZ3CxmeTv
         QgBJBadWpFbWIp05gfBYUfl4pyLt9hMRGe+RzHMYp+WUXY478rh4oS3rydvRmlwhmT1s
         0ovg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3jvzASb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73271b4a8c1sor6290011b3a.3.2025.02.20.01.30.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 01:30:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3jvzASb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740043834; x=1740648634; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNUu0QLM1jJD6vp7svI4zxOCu3a+5YIL+dQ3Ih3Jc18=;
        b=k3jvzASbUz3DcpVXeWTkanauuvdsUvoWOFkxlKzy3rKpI4wg5mKyZ/FHg5kGiMbi+v
         V+KRcloCOgtUoKIjwIuoFQcLvI1Mc+dIw9R/sxH+BdEb1SCRo4H8CgEfFLbelYTUN4RK
         fhQRMwKFNlkE2ao3uqIQbl+L1TkLRB0PTF5pk7HvsnTrvFGzKplgEcBm1b92+bxG6NDm
         +ZPXFPglqg4d5SniJykSgwTP8LGjSbSydfxUYsTpb93Tf4t9UkxUoTSepC1rT0HLUGVS
         U3NL3/3SuVczUH58bO0016suqDvJY5ixhCmHFUtOIYihWyD8wPe6uUL6g/aXS4JrHwgB
         y12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043834; x=1740648634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNUu0QLM1jJD6vp7svI4zxOCu3a+5YIL+dQ3Ih3Jc18=;
        b=sLTquWkHZvwsx9qfIJbMvWOQK7ygk9PqIkjtleNiU9S9qcXiPf6sM/88tQbzuFNWRk
         Jgp7GX80nTDz7hkP3bEsAwNrr4NgklvY9/HmamU2rXH6FVJPYvmjeE70rigVeMHtrn5d
         zSQw5wYPB37woVafbjLOobXcu46Mo5v5IDGpO7PRR+m2LSHIYBxaQnV+TcF2vQMaoDVK
         pb/q3C3jepgP+S9nFqndOBOAvIOcedw+D/zm4WZiU4dJowN1hhcBVhbsVL54m2ef3XE9
         kOqjh22mFjd1MTCLux6XK1owbmKQf8l2jSH5ltnstf9CWEo1HvhOVnbwgR2CQPL7DkVn
         WaQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNlVgkG1bddUgjRNytXj4SLOwE5GiBdXKio487nKJbvmHr3FrrOxXKoI2y+RA8WFHzFtzpZ7FjlEmPdg==@linaro.org
X-Gm-Message-State: AOJu0Yw5IxrUflI91ooNXL1EwRQSy3CfxqjjCCOthBibOASmVYUwq58z
	8p9t9Qh9/LZ/vIbw36zFUYEVviM3fTNXGzaMUfA503usLNTqXJerS3r3JWH4hH80Wg==
X-Gm-Gg: ASbGncsGdvQH6Q0bYXC6t7HRCC6OttTgME+zEZ/0gXTbUdaiZ4rTLC7I5JQEtROTMdH
	AkoBTbOeozl9EdRic7amuJea9OP5vkCJj+3Muawebz3fQrJ4lVxKjxQyf5p9Lv/GM625STtc/7V
	A32tz7x8GFk15fGJp2Jj22pwHWf+Nd7/BOIuQ8QHo0inKQijt/QHZ76vwrzN0W+7TCUlYym6q2Q
	7glj2SmCPQ8f5irQKSAJgLD2vLPOTEEq5YOPwaErsMnk0TfpPnM/BjHnDlCPecTx5deDt4rqZ0b
	bIJOtOkrn0sE0fp6cySQiIdwjvwQNeAZrDsBxqcvyyJcJ5iGYCIvEIY3VtiRNdNFzQ==
X-Google-Smtp-Source: AGHT+IHtCdGVpk6l604E32RACxb+nA/F1wtoRn4fYgBQOiATMnUaayVbCelxsQJslZPg5LYVQHWVoQ==
X-Received: by 2002:a05:6a00:21cc:b0:730:4c55:4fdf with SMTP id d2e1a72fcca58-7341725faf9mr2898714b3a.7.1740043833647;
        Thu, 20 Feb 2025 01:30:33 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273c8a4sm13283568b3a.85.2025.02.20.01.30.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 01:30:33 -0800 (PST)
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
Subject: [PATCH v2 5/9] hw/char/bcm2835_aux: Really use RX FIFO depth
Date: Thu, 20 Feb 2025 10:28:58 +0100
Message-ID: <20250220092903.3726-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220092903.3726-1-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Gu6FqS3FimHY

While we model a 8-elements RX FIFO since the BCM2835 AUX model
was introduced in commit 97398d900ca ("bcm2835_aux: add emulation
of BCM2835 AUX block") we only read 1 char at a time!

Have the IOCanReadHandler handler return how many elements are
available, and use that in the IOReadHandler handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Luc Michel <luc.michel@amd.com>
---
 hw/char/bcm2835_aux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
index 73ad5934067..c6e7eccf7dd 100644
--- a/hw/char/bcm2835_aux.c
+++ b/hw/char/bcm2835_aux.c
@@ -221,7 +221,7 @@ static int bcm2835_aux_can_receive(void *opaque)
 {
     BCM2835AuxState *s = opaque;
 
-    return s->read_count < BCM2835_AUX_RX_FIFO_LEN;
+    return BCM2835_AUX_RX_FIFO_LEN - s->read_count;
 }
 
 static void bcm2835_aux_put_fifo(void *opaque, uint8_t value)
@@ -243,7 +243,9 @@ static void bcm2835_aux_put_fifo(void *opaque, uint8_t value)
 
 static void bcm2835_aux_receive(void *opaque, const uint8_t *buf, int size)
 {
-    bcm2835_aux_put_fifo(opaque, *buf);
+    for (int i = 0; i < size; i++) {
+        bcm2835_aux_put_fifo(opaque, buf[i]);
+    }
 }
 
 static const MemoryRegionOps bcm2835_aux_ops = {
-- 
2.47.1
