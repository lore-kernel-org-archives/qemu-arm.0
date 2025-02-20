Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1888553njb;
        Thu, 20 Feb 2025 01:31:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXWAnqkML3n3CrjyHxH0vNO0G+ys3WVQjQgRt6licHhwBHXX7Ce/DBe/QX9LzsBeU6IySTNmVMk3TnuYg==@linaro.org
X-Received: by 2002:a17:902:c411:b0:220:d078:eb33 with SMTP id d9443c01a7336-221040ac0a7mr378237535ad.36.1740043896312;
        Thu, 20 Feb 2025 01:31:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740043896; cv=none;
        d=google.com; s=arc-20240605;
        b=S/QKSw8UHuexVgk4HC0D+zoTCe2h28ll+IAzOyWdk73RQkKworK7e212vtydpXszy5
         UgTWONLzOg8ir0mLR7KPJMsHdB+96e+bBlYDrFPW0/f/+txN9ZeFbMQ3Ayc4RiZ2FBkd
         IB7qd5r67+vpKrmACVRXU0vyynW9Wks4s2WAVBW4YC2DKfby8JM0YPpbJyXlW0d8cusZ
         zh6f/V4/9SKFrqjPrFMir3hB5BZDFUNib5kp2PkBooSw6KUN9QfwmpZqbhQQVaxzovTt
         GFFaZsQFtqoiHStqIh0ZAQ1ItAxOyI2gZPRqkfltq8CL1MgBdhlhrAj5NRvrFX+5wZ6L
         uPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wrT6wI7eGWijFG9r07os9uEfYAKBYpxue/APgueq34E=;
        fh=mifLLVS5MuYJHgOWg44DbEnpomkmf3estrlfbSXAHro=;
        b=UowmxFNXfTJQzoaiUU0bjyXWn9Y9TpBGUIHxVUfjQqfIF/LwWXb9q8lyKNp9fo+05M
         XTmnZ0m2y19q4mNS3PR2l2/ABqGPfdqyiDgxU3xeaccvMlCmovCEYKGEmmT0UI3IcUto
         oCXdgK0hXnqbbycOGxlSIcFRdHekqZmQpqO1X4wT9IBUjfuxMjDb6El2jU+o8VMjY5Lg
         PfKhrbw2krHreBXjfyOgOzMNqwRGz7ShUBEzU36q4UpDu6JLNeCNysdoouXL9i5ZLxX7
         Aiwp5JXc9zawNNJ9i23xylT6w4zyLj/suvNsqA1sh34E0R25hf7SIRq0Qek0LVjqDt4U
         21uA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oxOHXBzD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-220f5d65bf2sor85788465ad.9.2025.02.20.01.31.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 01:31:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oxOHXBzD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740043896; x=1740648696; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrT6wI7eGWijFG9r07os9uEfYAKBYpxue/APgueq34E=;
        b=oxOHXBzDh47kqTIPlimCBrPUujy18KGT9lUlQoxz7d9fLsAOsbCWSiqBU2qrjsWXOa
         K0WW+s62QvJPYqkkgzARgJZmc0Cajc6fp5mBmV+ELx6Ei+jR5E1cIs1c9Md2GEv0wntd
         QOROEW/5eB1Co3p/conybZ4pNq6IRkVe2Rt6ReXFjkVU9gkl0kpVI3tAnHhKi62jJ/Gl
         +tSMPUZ+WSsLnMyAYbEaEkykwtl8mKJGal3ibFQVV3Cgh/ElPs4Jw87FP+Z1FV0xDO65
         9BJIKmDMteJw2jurj07Si+sdV+rYbAEzcjiUGVjVtqUcADB6upZXSmTReEzTpN7E5zbc
         5vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043896; x=1740648696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrT6wI7eGWijFG9r07os9uEfYAKBYpxue/APgueq34E=;
        b=o89a/jGKM3pXs/4xYXfQ/qcaRVMT76K41q3goFeQy/ciFPWodeCt8fP/tuvjn0wlru
         F7L4XsSokYt/AT0A9FuHBVWmGFo+EfplLiiSQlBXln5C2pV4GobPp2SWujleJr8FwwTr
         g6n/UByN/x7uqe3j2+zpF+/so7bzvK0nxF0raq6R4WLz6gORIjznON//AthNw/UJftwt
         hPMW+6o0RW1OelptLLgATn6dujVTCnk/C4wI1yFht1aFisMWrI37KPgPJZZxN11jqBN5
         jF7zUGI6JNTNmeG9FduCS6EVPHTvIzGmqQL6A61jNbTZoSJPJxiZumXPT9P9BsxiVLTY
         1Ndg==
X-Forwarded-Encrypted: i=1; AJvYcCUdqP8ma9GHrOUChkScyMrmmeOGdsJ7uqm4s/w2Tkf3t6TqcpZEta3/Y/Ksa2tUuPXIfQbLIVdocnGXgw==@linaro.org
X-Gm-Message-State: AOJu0YxostrTTtlM3cp43iQAvU6wbAYsN3ZAkPoBiylTCzDYuYCD+HaS
	XQ9i+jX53lcHuYX0ZxncjfJV6Lmgxi90P/Ah0bkSLjfVHhszCfXeFWFFJbi21mtRkw==
X-Gm-Gg: ASbGncv/FoxIW9Hi3YDtYzJL+U9QFss1/kh6SNLp05g5Mg39sFALkOxITS7sJL5pQOw
	rdV+pIV/vkrCPWHl/7Mj/fYz6ZMElUSdEFj7naPWB9Q76F1f/qBN9KkKxvh7YlN4ZmUOd6vZJbn
	Ve1/5i6mvadEc+/bvGEKBLoBL+CNAzqecc68pTsRvKXwNx/d2znVb9XellYGBpHD6WRqYVnjX0J
	sP6WLGaaiT0MsI9i6Jquzub39zU2DUZ0IUT3bQdkc2IudTklvBQ14b1td3T0llfUrcXuOXy2XYb
	Iy6xGcpPVDscNDR7uc7VrkdUNQs+JC/arVd7N7LO3tfdq7yWecKEDaf3sQaiBKoNnA==
X-Google-Smtp-Source: AGHT+IHzB09fOgQ9JAxm6Hg43hIcwbgKVGg/0WdEobzd0QwenNGTBOK1RXpNvRCYw4fa0qda/VG64w==
X-Received: by 2002:a17:90b:2f8f:b0:2ef:2d9f:8e58 with SMTP id 98e67ed59e1d1-2fc411508famr28637110a91.34.1740043895854;
        Thu, 20 Feb 2025 01:31:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fcbaaf3f38sm1628375a91.1.2025.02.20.01.31.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 01:31:35 -0800 (PST)
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
Subject: [PATCH v2 9/9] hw/char/sh_serial: Return correct number of empty RX FIFO elements
Date: Thu, 20 Feb 2025 10:29:02 +0100
Message-ID: <20250220092903.3726-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220092903.3726-1-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YYjzzTp6OENy

In the IOCanReadHandler sh_serial_can_receive(), if the Serial
Control Register 'Receive Enable' bit is set (bit 4), then we
return a size of (1 << 4) which happens to be equal to 16, so
effectively SH_RX_FIFO_LENGTH.

The IOReadHandler, sh_serial_receive1() takes care to receive
multiple chars, but if the FIFO is partly filled, we only process
the number of free slots in the FIFO, discarding the other chars!

Fix by returning how many elements the FIFO can queue in the
IOCanReadHandler, so we don't have to process more than that in
the IOReadHandler, thus not discarding anything.

Remove the now unnecessary check on 's->rx_cnt < SH_RX_FIFO_LENGTH'
in IOReadHandler, reducing the block indentation.

Fixes: 63242a007a1 ("SH4: Serial controller improvement")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Luc Michel <luc.michel@amd.com>
---
 hw/char/sh_serial.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 247aeb071ac..41c8175a638 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -320,7 +320,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
 
 static int sh_serial_can_receive(SHSerialState *s)
 {
-    return s->scr & (1 << 4);
+    return s->scr & (1 << 4) ? SH_RX_FIFO_LENGTH - s->rx_head : 0;
 }
 
 static void sh_serial_receive_break(SHSerialState *s)
@@ -353,22 +353,20 @@ static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
     if (s->feat & SH_SERIAL_FEAT_SCIF) {
         int i;
         for (i = 0; i < size; i++) {
-            if (s->rx_cnt < SH_RX_FIFO_LENGTH) {
-                s->rx_fifo[s->rx_head++] = buf[i];
-                if (s->rx_head == SH_RX_FIFO_LENGTH) {
-                    s->rx_head = 0;
-                }
-                s->rx_cnt++;
-                if (s->rx_cnt >= s->rtrg) {
-                    s->flags |= SH_SERIAL_FLAG_RDF;
-                    if (s->scr & (1 << 6) && s->rxi) {
-                        timer_del(&s->fifo_timeout_timer);
-                        qemu_set_irq(s->rxi, 1);
-                    }
-                } else {
-                    timer_mod(&s->fifo_timeout_timer,
-                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 15 * s->etu);
+            s->rx_fifo[s->rx_head++] = buf[i];
+            if (s->rx_head == SH_RX_FIFO_LENGTH) {
+                s->rx_head = 0;
+            }
+            s->rx_cnt++;
+            if (s->rx_cnt >= s->rtrg) {
+                s->flags |= SH_SERIAL_FLAG_RDF;
+                if (s->scr & (1 << 6) && s->rxi) {
+                    timer_del(&s->fifo_timeout_timer);
+                    qemu_set_irq(s->rxi, 1);
                 }
+            } else {
+                timer_mod(&s->fifo_timeout_timer,
+                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 15 * s->etu);
             }
         }
     } else {
-- 
2.47.1
