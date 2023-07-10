Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351287eje;
        Mon, 10 Jul 2023 10:51:24 -0700 (PDT)
X-Received: by 2002:a05:600c:2193:b0:3fb:ff8f:2db0 with SMTP id e19-20020a05600c219300b003fbff8f2db0mr13065124wme.39.1689011483882;
        Mon, 10 Jul 2023 10:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011483; cv=none;
        d=google.com; s=arc-20160816;
        b=ViwNOev5nNgeL4guZ2TQlZl/6UN5uQIMkkI6H6FNh9IyVldvEl/BRNjMfPZ7quVudx
         nNUWiOgJCr95d7rj57FVonbWYUTDmAGWvkIvVaOk2hBV3jvHifiXAeJiXqq+Pd9lyB/Q
         C3mvqs/dQUAC4tD26SVh/VUh/dTA4NXSQVkCPbuK8wzWwyfcSAv8E0JHheuyeOo0vzaX
         ysraGeEUfXif3Z4Vb4EJJ4tY9+HsVFKp6dPupAUUlHIJRc8epltPo3t92vTjYmjoJiQJ
         PKTIVK2W7Qi9tcWhf+AWXQAKxb2SDOfmKaJMr+VE7z5gRH89xEgZTWG1w30jGDkW140A
         Ckhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MFiMwX80BmNyck0DZZOUXh/iAvr0cOgiPWTiwk+R4aM=;
        fh=4TWVGTMFk+XB48cTX7H3L2FEUZf3X6lSQ5h15kr1III=;
        b=TG58IaZlYXB3vTKP7wuVEmo4LtZH/APsFQ4Mewvj925SrC9D7y8eV5/Y76vc21De9d
         88NnYiIm0EzLxurBjEMhlmQhV4dkrDvULBaJq5dkrQudvTX9HwzZYbFMnUoC77tXMAcc
         TfeYi7jVvJFDKlumZBTtkHpUdF64fXZ/+vCLYiuEBLTnS45bCLyiNFi30OqG/08FS7z4
         5kgAu1L+xLDxU//I9/0BPjR2p520hpU4XndVQPNUGujZxL3kW2AHc55RoS4T7wQnyGii
         cNrejy5tsV/05DqyYXWQQyhNnqQr1/wP3DO9mmD7Vx+pSCziBuGmtfyxjLnqEDbAQzQi
         CEMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NJq6cF1M;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y17-20020a1c4b11000000b003fbe356b60asor76432wma.0.2023.07.10.10.51.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NJq6cF1M;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011483; x=1691603483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFiMwX80BmNyck0DZZOUXh/iAvr0cOgiPWTiwk+R4aM=;
        b=NJq6cF1MGbORrPghESeaZMPTdldDqRn8SaJQk9Lx0Bj+YAHX48XODawpstkOvRMiI/
         XMl7JqR/qIg60irlnHtG+Y0+x9i1FVJfzAWsNDGsUEmzfeZiaOPloJG3QWcE2Xn8BW61
         wdYzXLglLG9YPbcp8SFZmzqZUeR01B1IB4LusROjUE+HpsB3feBF8jH+R0urWJQLw7WF
         7f6b5CijJ1cKgScaVZGXV/M5pPI/pl6820Q1hxOZeiIUxQuaPLnyY61ERhK3ilXh0oX3
         XyHjZ7DkDnAwx/+4uIpVkKOimQOe48OFyCTPUf5Y6QFgGXpLkGwgY7EUIvOod4I584Rd
         U+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011483; x=1691603483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFiMwX80BmNyck0DZZOUXh/iAvr0cOgiPWTiwk+R4aM=;
        b=YFz0j0i5AnNuRmSZo2pmnd99v8VlcUwRHCBwrNog0AWXjiaN+NWP6KgT+ocJ0Yh7D8
         VOBRA90b2wZERnxey5jWAtcFN9PtTpMGhObSsKp9alcuO1/9lXNEpRVwPTGY5pwg76o5
         WTrThoQQ8txuW/UgCD80gnWkRvgAM3dtEFlWWuzdjBkGZk1N9esjdw15SzVno2tL+kQb
         YpsPjlMu/DU7DK8R3ZPRk+WJqtPXZQ1NJ81rXkkYm7Khz0b9aeARRIrJNFo4i7v9Y571
         TO5hUwUr6rH8IkXaW4JHCu18snVxqyabiUT4q0xjFB9DRYLU2+kO0dMimzm8gI3UHSv7
         oHkw==
X-Gm-Message-State: ABy/qLYjow46QYAszCVwyNCcTlWYNiVqnltevLsczyQGW+ECDSfowjan
	8rwXQ7Q2AQGJaCmU1ebug1xQhQPp
X-Google-Smtp-Source: APBJJlHAEy1s+HE4KagIs/j7WeU2hp7vyaaYwc90k+EbA8tKvYwDAZwpyGGbebgcXhw7qk/kegNS0A==
X-Received: by 2002:a1c:6a04:0:b0:3fb:b9b7:fb0c with SMTP id f4-20020a1c6a04000000b003fbb9b7fb0cmr16810018wmc.31.1689011483625;
        Mon, 10 Jul 2023 10:51:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id u13-20020a7bcb0d000000b003fbc9b9699dsm433256wmj.45.2023.07.10.10.51.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:51:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 03/11] hw/char/pl011: Remove duplicated PL011_INT_[RT]X definitions
Date: Mon, 10 Jul 2023 19:50:54 +0200
Message-Id: <20230710175102.32429-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230710175102.32429-1-philmd@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FOgaF6f6G1HI

PL011_INT_TX duplicates INT_TX, and PL011_INT_RX INT_RX.
Follow other register fields definitions from this file,
keep the shorter form.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/char/pl011.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c3203e5b41..96675f52cc 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -48,9 +48,6 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
     return dev;
 }
 
-#define PL011_INT_TX 0x20
-#define PL011_INT_RX 0x10
-
 /* Flag Register, UARTFR */
 #define PL011_FLAG_TXFE 0x80
 #define PL011_FLAG_RXFF 0x40
@@ -157,7 +154,7 @@ static uint64_t pl011_read(void *opaque, hwaddr offset,
             s->flags |= PL011_FLAG_RXFE;
         }
         if (s->read_count == s->read_trigger - 1)
-            s->int_level &= ~ PL011_INT_RX;
+            s->int_level &= ~ INT_RX;
         trace_pl011_read_fifo(s->read_count);
         s->rsr = c >> 8;
         pl011_update(s);
@@ -262,7 +259,7 @@ static void pl011_write(void *opaque, hwaddr offset,
         /* XXX this blocks entire thread. Rewrite to use
          * qemu_chr_fe_write and background I/O callbacks */
         qemu_chr_fe_write_all(&s->chr, &ch, 1);
-        s->int_level |= PL011_INT_TX;
+        s->int_level |= INT_TX;
         pl011_update(s);
         break;
     case 1: /* UARTRSR/UARTECR */
@@ -350,7 +347,7 @@ static void pl011_put_fifo(void *opaque, uint32_t value)
         s->flags |= PL011_FLAG_RXFF;
     }
     if (s->read_count == s->read_trigger) {
-        s->int_level |= PL011_INT_RX;
+        s->int_level |= INT_RX;
         pl011_update(s);
     }
 }
-- 
2.38.1
