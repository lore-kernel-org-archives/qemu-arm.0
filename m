Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1627997njb;
        Wed, 19 Feb 2025 13:09:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXBnNf5sbhh1lA1AXd4RyoiQqn0ASErfWorIEvf+ifacR5qnsm9LXCPzOxq4FK3TmkMDTfAQK6QuxTXCA==@linaro.org
X-Received: by 2002:a7b:cd8b:0:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-439a30afaecmr6891795e9.9.1739999352099;
        Wed, 19 Feb 2025 13:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739999352; cv=none;
        d=google.com; s=arc-20240605;
        b=ddIh99gpdgZFeXxc/0kvk8T54WTAsibt5btj8ztKB/1Lp5zlDcyoudaedeqOOXorhl
         FIhVZIvwZ+fAY7NFn0nRsBGOrD6wOSOYrK+4ZXbM91tVO6Ibc57dCZdRgSgSVjkuJJT8
         kbLziZGkF/s37YxhbbkYR/hITYydpnrD38yVJM3BII7bjQnLNWHF0RLgmlkuc3bTNYQo
         1HQrELWMce40IYiIm2nQxarWoU4APpiZrTxx/7rOsqu5CJE/CiZEdvUQ2PTlOkz3tzQg
         5iFSYp4cvqQMLEpXcvwrggaPs8URUJvyd4jR0jonUiCErj6AS8F4aBFgofGZ9EDUZ/1H
         kkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JhwkxvyKpTQZAt9mirHnFUfpe4JfORLzfwmDQNOghTo=;
        fh=4aJpS4KATOauw/uDPkIuZCwzUoU6fXbtp8oIorHPpuo=;
        b=cvZAC1hjASgHWKTSLW1+nmPx8IH7gdxJjp9yD9+PFerSuieOloU8DovrhPaOdbocvP
         uH4AmBCS+Rv4V1QjVoPyERKqXWtyKW8AOCbeCKnQKbPAE+wYFCkv3BmO7cx0OOSY5yxj
         8KXi3OWMOx2/pTsl/fq8AGukWUOXxUmuktQuar4FEznsvlc6lNfFoeNMA6s18rlDDEPA
         LMrhP4LhNhlEjSq2J4LK+p8m0+mXuBsFZ1WZ+OaZxIpbqamjZcUix4j77826wz/5xOmC
         WBVSoHNUjmNCxpggEqblwiKcQBifTioku7/xa6QWZdUqBG7edYysLgEC2daaNK0+nJsU
         UBKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OiI4EBL+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43982438f31sor21489605e9.5.2025.02.19.13.09.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 13:09:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OiI4EBL+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999351; x=1740604151; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhwkxvyKpTQZAt9mirHnFUfpe4JfORLzfwmDQNOghTo=;
        b=OiI4EBL+H3nh++FZOU2HUJBobsega9C4rErDsZ9g6vtQdJHWNHQFnMK4FDeyOHpsik
         cHgqR9ptX9/KVoIWY8dMyotpG8bQRTuLdIh5KTRlHr4dzbsUTZXqZL3hA49Kfn1ksCFk
         tR4esBJLeCqJ0U6oz6JBQqup/WFOUwJu4lbIpgd1+avhnOJezO0M6JsZQbdELTRVif2a
         cZnchmh4xesiaAHoGwGusEHgSbSPweUTKsIvsurIIA2vNb4r/Z7zZt615r0ZphikW3D6
         F25jBZcdKFBRwoq3rRN75k4rKoBc0we5pg0aOZF8TFAcVVmdhziW8BJd9ryHGk1Ah6Oy
         vqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999351; x=1740604151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhwkxvyKpTQZAt9mirHnFUfpe4JfORLzfwmDQNOghTo=;
        b=PdZidiiHbNaO5p8frHiGYZE42GA27Lfgp78hfAbyBr7kWZKosiUHtfYDqiTE3ozG5u
         qoeBbDKczKwd8AvYTHkM67CMZcmOxeNPhxBiMx+w/NL+lGvkmvudq0uvGq/E4AO54VRx
         63jWIhKg1zzgSelYCKGTOBGe7l2xD2NvzRcbiP3NBBpCKOReVgbhwYPKLpoSIebfcfqL
         ZoQDD/vRxVdJTgE5XZT04uXMOQDohxLgWn2VB3Ddpc22J20pA208Lzw+q3sK/a3UJSVP
         Oj+qyUG2GxC2Qo15S2gPzy/zx8y6oMJf+g0FJ840EQGpx83Qv9QrmWREia56Mgp5IBRG
         3ANQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAOsIdZxK/rgeKVWLtS21EhcYVcGjXpm0G4ZSH8fLTJU60vm3sW5g2iyiOHYfqePPuhqEJyKyPmfXB7w==@linaro.org
X-Gm-Message-State: AOJu0Yw+WiSrmGQVW9jHZGeKRPbsLhz3VNRinjF4rP87lJKj4HHCmnwa
	HuX4oKKCjc10GLUMSKDOsrnt/f8bX5sRf4AmpU14zzW+l1X7lWy2yiY7LIMW84G3Gw==
X-Gm-Gg: ASbGncsZm37tIwiss3csPSqAJ3OUCEeBiCVB/BvrZlNM81f5k5mNnU0qvuHHAbZ7dVr
	/AoBpJgu4UFf9RP3S8sxzQ6zhEnW+6Be9Gdj7/vwS2gq2bT3pGz+xJ/qN0TwXbrniJ4clRm5lk+
	iA64MM+XDCrMoWkAYLWNkpPdLQeoVTCcReH5qz0Ore8HBHlDz2/y30JvwjgiGXxGy9rpLYlKF20
	Qk8nSCQjlxy1636KJA6V9ZLJ+yil5zJblXhRYVFtPyUI6NODA3MJ9ckD1xRWcSWR/fdCvOh4fuN
	wwM1I7wY0EC7RlUNWyBtwvMIyIiF+5eYI5tECl35lGZ4RfKkSb42HJLoAyT3dq3CXg==
X-Google-Smtp-Source: AGHT+IEI16QFgqjS4YLiNsbF7FC5EAyrAmAmr5Kq4LgCYvD6TfwsSDQwGj/4TwXMSh/XFWbKXqJFiQ==
X-Received: by 2002:a05:600c:4e8d:b0:439:892c:dfd0 with SMTP id 5b1f17b1804b1-439a30e91femr5924815e9.14.1739999351505;
        Wed, 19 Feb 2025 13:09:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43986320899sm93060315e9.38.2025.02.19.13.09.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Feb 2025 13:09:11 -0800 (PST)
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
Subject: [PATCH 5/9] hw/char/bcm2835_aux: Really use RX FIFO depth
Date: Wed, 19 Feb 2025 22:08:37 +0100
Message-ID: <20250219210841.94797-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250219210841.94797-1-philmd@linaro.org>
References: <20250219210841.94797-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AiAw4nAzRpUh

While we model a 8-elements RX FIFO since the PL011 model was
introduced in commit 97398d900ca ("bcm2835_aux: add emulation
of BCM2835 AUX block") we only read 1 char at a time!

Have the IOCanReadHandler handler return how many elements are
available, and use that in the IOReadHandler handler.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
