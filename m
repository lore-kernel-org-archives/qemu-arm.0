Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1887926njb;
        Thu, 20 Feb 2025 01:30:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVD6nclgHnnEk0+m1vZajCmT0IA6vbpjT5Exrh4ClNDZuMFvfD5m5P4NlvHDLfjdsnDtHEYvP5jCmgJWQ==@linaro.org
X-Received: by 2002:a17:902:e552:b0:220:cb1a:da5 with SMTP id d9443c01a7336-221711a6fffmr115992195ad.40.1740043818194;
        Thu, 20 Feb 2025 01:30:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740043818; cv=none;
        d=google.com; s=arc-20240605;
        b=eqTwUtMua8ffqoCRrpFw6zsLbADPytnqDycVgno4aXhR2fxOWbif5ydvCI0zI2nT3C
         Yp4cjPMd62nmdrLHVvlsKdhIjCCpMNfAQPJHapfomZwqhG0nA4dGGJP8XoJH/ET5MGCA
         nnlF0wtzKRDCE1KVl7brWMuKVAQrFK4MVPYVkkC6f7ixW6svbLiqgiybWbE6yilq5Wox
         PihwE9xYcxn1CT4/OIAIu5TLolzbgNjWlwP/GrH31L0OHDhVgK3xV8N2nldnvcyO3LVw
         ctasEA+8a9P3vjiiH6iNXFXdE6NLYO9MRJCzs/Io9QW+o4hbzgUCev0II65JuOfcaKX/
         b7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XvVsiU9gHWUTHtLBaCZuBn83g9TL7f813w+LHlaQeOA=;
        fh=eXyIrc+n73BgtIoxBHi5Roxclr6xrWAvW/m2LrLw85A=;
        b=KFKNm4SGJ4XbucXMG5Z8A0zhv0M0UIIReZhyyQiKBO9c2Wio0hI1/Id6fWwxUi0J2H
         gSZ3VpI8E25nyv3ZInWWr9A5B4K0ZYeJDvk/rP6mmFriSWR1hE48xsw8o8HDnpjUYxt/
         tQgCX1EDbrZ8Y3mtii/n56DTvFADBVNtTLcC9H59rukpuIvdenh3XLvfAmv0vrsP/ev0
         yalRZ0t/B4GPIzS6x4papwFa2r/7Cd1XEZUBLdgDCLos7lO/S4Q58wO3l2b59J7T6G2Z
         cL79zqBvPkZp/Nroxho78wRaGKF6VVZf201PSPi2gSy7XVQlFcE18nS0rIdSoCadwaPe
         kq5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cX8//+Ii";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-adb577797a2sor12355541a12.2.2025.02.20.01.30.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 01:30:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cX8//+Ii";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740043818; x=1740648618; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvVsiU9gHWUTHtLBaCZuBn83g9TL7f813w+LHlaQeOA=;
        b=cX8//+IiwurCzHiICBWN9BOMRrscCRloNq4QedFKUNB88BTa5Z9Sswqugidvf2z+Ww
         CK6K9zRkIL/EpKuqdv5hd2oXbBqeTOp7xF0Qkx17y4fn19ngQM6OY9zhiR+p5gneo9JY
         9WW1BbnrL0UeD8Gplph2Sq7g4SUhyplq/6vaAh5Qjt99VdB2ub74qbPpf9/ISOmIN6U6
         GwgO7Ex0Lf3DHnEw/MbtHnCQfWRrc+paI+gBYtGRr/8heDcMC1/N0/uoJqGc01KMkH4j
         2ieOyiUHXiW3uEOXDMji/jJCA2xb5vQrvmgsvgiXyzncnOZzoIjPMbF+dkI/igeh7c87
         HUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043818; x=1740648618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvVsiU9gHWUTHtLBaCZuBn83g9TL7f813w+LHlaQeOA=;
        b=nzXUlg7Ya+3Wxl2l4AHAGyYN9Y/CuXEcvB9qLEPmnBWb5f39W/3L/IPIh1viQPOfMu
         31ijIjSNjjQvC7il+hHFTNnyLbah1Ckx861Mo2v4Wc7n+YBdymvcZ8XOqvBt+hRmZHCM
         4l+n/MMLr6axVlD1ALQfqXuD793leLdxs30Y8RtJhzTg8UIDeqlx9Urd25IwPKp50aC0
         bjxXN1y9efNXF49M1zudwB7ytln9qW53Faig+NgOy0mCS/Vh8Xd+5ScXV9/QMSuw/2mp
         2JD9H867Yx7QNXkxM2L8VXYVWoczxmB5/N+xI85yF/MYZSv6KFGL/EOdZf9DD4fbBIMu
         v6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWEhRj9aw01kmpHUgevsyzsHbanQv9r/Birkzg9hZygPkh8UItJ9y0rM7y4GlOGlYW8ErXRYwqokJ/GlQ==@linaro.org
X-Gm-Message-State: AOJu0Yx5geQ1eMo9xcNdnH1TE/wYFZz4CHke+zzmJibqFLGQEgVPGhgs
	+Bh5/2ZjkeFmBN9tQtHX9l04+8m3NxqvAYm6DN2ap1LApYyljIygaGggMSzvkWHn8w==
X-Gm-Gg: ASbGncs+7klU2Dywb/sltK5kXXH6ux+FoaReKuQidaSPjLIOk9BfS+9h33hxWIgBdtN
	OnijDzi512sb5yyCON5vpeRdlxkiUzt6ZB4+u9B9sX6Df3WnPdNvc0zpphHE8ezys1uUsK1Dr8J
	dcplC6aA45VrGo0WdMWN/NPyKjg/qIhrGuIo+jBhcO6um2NN5Mprg8fB5cxNzl5Fq3q9EJUvP/t
	i2bz0vQ2+J2vfuutbGPQpPpwmHpS5Db4di1lJwjsE5JgJ67N9IlSChmzoCQHT7oeJNzDqPHrQvE
	GN94o9PFW3ZIWpVxjCT2rOVSUOppggvtSVG/2OC/e3SFFGAoR8GiSvQddDSA8ZFLbA==
X-Google-Smtp-Source: AGHT+IHzI2BhsfiokxmBSO07mnhrE1lfDAUfHI43hrZrrWil5lel1nwpv/KfiUdjZbefthfEcx4r8A==
X-Received: by 2002:a17:90b:2e45:b0:2ee:cdea:ad91 with SMTP id 98e67ed59e1d1-2fcb5a3681dmr11780241a91.15.1740043817688;
        Thu, 20 Feb 2025 01:30:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b4c45sm15328183a91.2.2025.02.20.01.30.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 01:30:17 -0800 (PST)
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
Subject: [PATCH v2 4/9] hw/char/pl011: Really use RX FIFO depth
Date: Thu, 20 Feb 2025 10:28:57 +0100
Message-ID: <20250220092903.3726-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220092903.3726-1-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: h/NHKoQxnF1j

While we model a 16-elements RX FIFO since the PL011 model was
introduced in commit cdbdb648b7c ("ARM Versatile Platform Baseboard
emulation"), we only read 1 char at a time!

Have the IOCanReadHandler handler return how many elements are
available, and use that in the IOReadHandler handler.

Example of FIFO better used by enabling the pl011 tracing events
and running the tests/functional/test_aarch64_virt.py tests:

  pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
  pl011_receive recv 5 chars
  pl011_fifo_rx_put RX FIFO push char [0x72] 1/16 depth used
  pl011_irq_state irq state 1
  pl011_fifo_rx_put RX FIFO push char [0x6f] 2/16 depth used
  pl011_fifo_rx_put RX FIFO push char [0x6f] 3/16 depth used
  pl011_fifo_rx_put RX FIFO push char [0x74] 4/16 depth used
  pl011_fifo_rx_put RX FIFO push char [0x0d] 5/16 depth used
  pl011_can_receive LCR 0x70, RX FIFO used 5/16, can_receive 11 chars
  pl011_can_receive LCR 0x70, RX FIFO used 5/16, can_receive 11 chars
  pl011_write addr 0x038 value 0x00000050 reg IMSC
  pl011_irq_state irq state 1
  pl011_can_receive LCR 0x70, RX FIFO used 5/16, can_receive 11 chars
  pl011_read addr 0x03c value 0x00000030 reg RIS
  pl011_write addr 0x044 value 0x00000000 reg ICR
  pl011_irq_state irq state 1
  pl011_read addr 0x018 value 0x00000080 reg FR
  pl011_read_fifo RX FIFO read, used 4/16
  pl011_irq_state irq state 1
  pl011_read addr 0x000 value 0x00000072 reg DR
  pl011_can_receive LCR 0x70, RX FIFO used 4/16, can_receive 12 chars
  pl011_read addr 0x018 value 0x00000080 reg FR
  pl011_read_fifo RX FIFO read, used 3/16
  pl011_irq_state irq state 1
  pl011_read addr 0x000 value 0x0000006f reg DR
  pl011_can_receive LCR 0x70, RX FIFO used 3/16, can_receive 13 chars
  pl011_read addr 0x018 value 0x00000080 reg FR
  pl011_read_fifo RX FIFO read, used 2/16
  pl011_irq_state irq state 1
  pl011_read addr 0x000 value 0x0000006f reg DR
  pl011_can_receive LCR 0x70, RX FIFO used 2/16, can_receive 14 chars
  pl011_read addr 0x018 value 0x00000080 reg FR
  pl011_read_fifo RX FIFO read, used 1/16
  pl011_irq_state irq state 1
  pl011_read addr 0x000 value 0x00000074 reg DR
  pl011_can_receive LCR 0x70, RX FIFO used 1/16, can_receive 15 chars
  pl011_read addr 0x018 value 0x00000080 reg FR
  pl011_read_fifo RX FIFO read, used 0/16
  pl011_irq_state irq state 0
  pl011_read addr 0x000 value 0x0000000d reg DR
  pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
  pl011_read addr 0x018 value 0x00000090 reg FR
  pl011_read addr 0x03c value 0x00000020 reg RIS
  pl011_write addr 0x038 value 0x00000050 reg IMSC
  pl011_irq_state irq state 0
  pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
  pl011_can_receive LCR 0x70, RX FIFO used 0/16, can_receive 16 chars
  pl011_read addr 0x018 value 0x00000090 reg FR
  pl011_write addr 0x000 value 0x00000072 reg DR

Inspired-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Luc Michel <luc.michel@amd.com>
---
 hw/char/pl011.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index f7485e7c541..23a9db8c57c 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -489,7 +489,6 @@ static int pl011_can_receive(void *opaque)
     PL011State *s = (PL011State *)opaque;
     unsigned fifo_depth = pl011_get_fifo_depth(s);
     unsigned fifo_available = fifo_depth - s->read_count;
-    int r = fifo_available ? 1 : 0;
 
     if (!(s->cr & CR_UARTEN)) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -500,7 +499,8 @@ static int pl011_can_receive(void *opaque)
                       "PL011 receiving data on disabled RX UART\n");
     }
     trace_pl011_can_receive(s->lcr, s->read_count, fifo_depth, fifo_available);
-    return r;
+
+    return fifo_available;
 }
 
 static void pl011_receive(void *opaque, const uint8_t *buf, int size)
@@ -515,7 +515,9 @@ static void pl011_receive(void *opaque, const uint8_t *buf, int size)
         return;
     }
 
-    pl011_fifo_rx_put(opaque, *buf);
+    for (int i = 0; i < size; i++) {
+        pl011_fifo_rx_put(opaque, buf[i]);
+    }
 }
 
 static void pl011_event(void *opaque, QEMUChrEvent event)
-- 
2.47.1
