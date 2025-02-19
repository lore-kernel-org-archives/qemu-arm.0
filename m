Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1628213njb;
        Wed, 19 Feb 2025 13:09:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWUzUFPqDwkF8is841Iw45MY+e8UH1U/mdocNxaTPS1yCqXpJuZnde1d9hYu4BkYX0aNoi/D3Vw37IWoA==@linaro.org
X-Received: by 2002:adf:e98f:0:b0:38f:2678:d790 with SMTP id ffacd0b85a97d-38f587ac38cmr3927754f8f.33.1739999372290;
        Wed, 19 Feb 2025 13:09:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739999372; cv=none;
        d=google.com; s=arc-20240605;
        b=P3w11FsC24jITkAEm5yfh09QyppEYfhnLFL0XsNVztl4Ysl5n3GvB1lzc1IJrejdn9
         oQIcdpvn4YKceXCACW5lIWUrnnD7XTHoSbRrrUItwBKPE5YI04SsGM2UWJq4bo1hZ5rQ
         +27uH2Fj2fBoTzyIGd23V3cEzYZLTUIR1MTh+WAnHib2uvhyG/0VOMNFX5HVoefsFIrn
         Sp1LHp9lriZjKhgxpfUVqEkqvLmPrALwsK8S9dKRVCix+kTnOh0TGKDXeoD1V0EG8p3i
         MP5Rt4yU5AGzC9jnW4+14ujMSAfR5VwT4FHwWplf70y7g0BanV2RkGOJHBOsvUb5BpvQ
         8EvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XnXac85husRSdcAW6ArahXIi1CSZu6CjUp+G23JJFB0=;
        fh=MlS07vjF6DHNwqUvBJF4lwmDpzAHckz00PO1qXjjn0c=;
        b=kUrJ6Z79CsuqL+ZNef7JguqP5Z4YnYi1WKRKHEWjbt5a0SFv1cSbVXkdhIa+1au5ce
         3cQe/RMqPlnr0YoHviPwCslI3vOMJdscNrggHf3/0tPPqKKtbO0/MY7pgBweh38on8zT
         JrMmRF0T9OGj4UdjjJynJ2NY78nS7uUDzKLrMjtt8GQYvizKPQnZ3UlKiMw1x2pFHHBb
         1rtSu8R+Ay//uojMaEew3WPujlYNF51qG+E5XcoZQDITQmBKYHd0bkHJNhbr+4MBcc7f
         OfKON+HI2SWolHnpHLGbNAfwtYWx+Spp8zs8cnuu9RYfkdyZhEN7v8UPGp1RBAIrSz2s
         0pOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ALURNJIi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439815ae000sor27480935e9.8.2025.02.19.13.09.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 13:09:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ALURNJIi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999372; x=1740604172; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnXac85husRSdcAW6ArahXIi1CSZu6CjUp+G23JJFB0=;
        b=ALURNJIi3hureH/4yvwqcCelGfY6IUtj+8hKatR5RZDbvrQJfT4x7f2R4PSPw9EKZm
         cfecrK4zp9ewZbryBcY2XRCUYNpbasfvTleFB/qNs900n0TQ5z31N+Ls6JCoxBPEb/Dh
         3rjfFxut7TkUZBpNStUYmSLZQt1YoSTb5khWdHk3AOWUs3EK48300RROmfPKoeL/bvVA
         3EoMtPXwpJ+YvjCHR0m/WreA9CQHV8AcDM2qQpgrnt/PMn3tg36G3e8rt7ffTqxLLYvX
         2JIyE/EvNRvYKorrwblwdFhsX2d2WRYg+x8SQJvRjv8d8rNFoIUjkBNeNochqqcpeaUd
         TRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999372; x=1740604172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnXac85husRSdcAW6ArahXIi1CSZu6CjUp+G23JJFB0=;
        b=D0zWZu3dwl1eLXrXoAkGrDjNsAkr01zmZtNo7UnafFCHBUQbTHCSjtEKxmIoxcplhd
         HkBodjMEIZ5KWt+peiSq8zLe6jsTka5ZnCyAy1K4KPWQRveqbpEHmxm1EoL7hXJ4f9fe
         BAmcDXjEqGOu/Z0oc1eExcpi09Ma8tntmE5MTfraC/R72DmdyaMOv3KaozcqtFcGi8tn
         Sj7B7nPcIkz7TEWDvqpqwXXRKfoR4PPlZdQncdx56j/0S5IumbRSTgl8DNUIYmMfu6nw
         3FNTsUb6edq0k/PpldhT3rQqxFZdQDDgNnoF1S+2knK2VxhLqqcpdrBhRrosDB513MDa
         N5tA==
X-Forwarded-Encrypted: i=1; AJvYcCVY2iVCfuEwEtu67S1jR3Mre7wwnDuzBkjoStDH7bqMAp1jxF8IxjOFh5U6/rbr56V+LqJ0o59mz1TLcQ==@linaro.org
X-Gm-Message-State: AOJu0YyG/DoxTvb0mSyOHnJpJVWx35rBbw94vBTxpwhdBiRzrMi6fSR2
	sitmYK4wWjxgyG2M29FYVXKBVLc6CINDG/avStoS+VZZ3LWLFK+cWty5QTnrKJyyzA==
X-Gm-Gg: ASbGncvgC24Z5SzAPoa3xrCMW9D+g/Xye8UlDXr/2L1jMzzE72u4TAM6Wg3AfBuLL99
	6E0IkIXircJbJy0Jw5ZnCtOJiwHofDkCH14+ufSd90drTufqafwHzm9ze+8rsH4Shgn31m86rHv
	UYoyOW44iZwL3KCX2+PYTT+/a8mLqGHo2UHbuxOwDOC2V4SbYS1kuammzgL3m/oi3vva1X6HwQq
	ttc+wua8MJ6i4ctAgaw/Pncg3Q/38wxl4/zDY6Z98cr3Q4TNSGqiakohJqAtcXrKPW1tVIDFPmP
	Pzp1tbGxS8o+BqyDfHT3nfkrDlmjq6+SrjvzGjX/WgsTdNyLpEjf1nR13MOeAbR6/Q==
X-Google-Smtp-Source: AGHT+IE4Byg70J4EWT04Rr2EIOcLaDr6jugN8hJq25PFZ4HSMwrAbXNiUeRQpkmbDJFI9DGkfshlOg==
X-Received: by 2002:a05:600c:3b26:b0:439:31e0:d9a5 with SMTP id 5b1f17b1804b1-43999dd1e1cmr44430935e9.22.1739999371753;
        Wed, 19 Feb 2025 13:09:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439a0cc11c6sm13165315e9.16.2025.02.19.13.09.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Feb 2025 13:09:31 -0800 (PST)
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
Subject: [PATCH 9/9] hw/char/sh_serial: Return correct number of empty RX FIFO elements
Date: Wed, 19 Feb 2025 22:08:41 +0100
Message-ID: <20250219210841.94797-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250219210841.94797-1-philmd@linaro.org>
References: <20250219210841.94797-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OF4tV3OKDKx3

In the IOCanReadHandler sh_serial_can_receive(), if the Serial
Control Register 'Receive Enable' bit is set (bit 4), then we
returns a size of (1 << 4) which happens to be equal to 16,
so effectively SH_RX_FIFO_LENGTH.

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
