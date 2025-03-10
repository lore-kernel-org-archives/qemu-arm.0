Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp867454njc;
        Sun, 9 Mar 2025 18:29:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDW3WlOiAO/E3RqEf8A7SSR/avZLu1m0ynZSf04ndVLMQ0cDZ8enFakEdHoB5XWfAaDI9p1TiYC/Y5dg==@linaro.org
X-Received: by 2002:a05:6000:144d:b0:38d:d666:5448 with SMTP id ffacd0b85a97d-39132dbb551mr7149115f8f.40.1741570141136;
        Sun, 09 Mar 2025 18:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741570141; cv=none;
        d=google.com; s=arc-20240605;
        b=BZH0eXEirKmBVBsv8GBrmSpeTNw4CUFISaXO1tLykpxC/hMpHnqrFLOpbvQ0ZUpGmL
         Zc9pYvsbxq+WJj+277MzYKHyfihy1GoNoc1oCxUg4x4U+xXPT914q0uVNALFRe82IGpg
         9a1zk3eKIaIZGisZ2GEZ0zQO3NiGWtnHGZlp98YsfVZa8z61BOp22ymYdvIuXzwaQCyg
         TH2aT6W+p3bWAq/GPAbKkZDljyCAYa3hRT7YnPL1r7KGkQDmcC8EbW4HiBsmegCqoTQw
         KO344X9ls6Vz+22Ob5HXkJN7WGq5jMCExWKXHeS8gxGT/K3MJwNcedCJLguqpSOnUu4a
         T1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nKtjkSGQAPRNNqtasOzh5Hz0iRBusUZv23b35HZSLgg=;
        fh=+8XgKeouOmLX4vkX3zRYS4nG/G9gVNdLCBFmbQYWcmw=;
        b=dyBny7WU+xA1RGyyzJNVnYdCfB16CKdW7dW+SiRtQxyRzpTAkGJJGXd2blI6uQpWON
         84E1oRPcZTFRPta8u+BtnOyxVBDcJ+dq/IlBjI3Vghfu4ijcEleiSC4U3TY4SUrzn8Ui
         2hLE4h407tYiH5IBXbAONpLqMJvOHuskVKPfJdl+VFO82RrZKpCC0SZjNzWf6f3W00CG
         L88vuIQsnqgs36sD56Kr3ofb0Yhznw15CWH9VQpj1cm4iRMvnvJB3dEAE4RTEQxUCv0f
         xMm45PvTPUdBCmBvJDhQtm1c7/D8bGbMPB5eucA8jttqJMbKl1pkxGGlbMLEHb8N+gmP
         5YWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j6Ftuqtf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3912bfd9b1dsor2607903f8f.1.2025.03.09.18.29.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 09 Mar 2025 18:29:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j6Ftuqtf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741570140; x=1742174940; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKtjkSGQAPRNNqtasOzh5Hz0iRBusUZv23b35HZSLgg=;
        b=j6FtuqtfgTrpA5kjpPAOTWhhQhs5gnKrFm8pr2h+0+3QD9c/Sd52EBBSCmQ8ZURDwV
         K0fmI8ahyVL2xZky1t9UBJSrMz2szEKhju7573gF7vDXIiUmtdNM7U2p/bizZMDXJM8I
         YDFnU+0B1id9baqXFtTCUldtf/5N/qydBBRiLnAAxS8Ao7CVNDJ7WUOPEQ+vQaJnamKs
         dmok1bcrHtEfDU+HCPips9nH4xFTtUT5cIQIxSm0PUT4MxPVWlqxn9sOr2hXhnVH1Q2C
         6AXQmFOqreWueD4oeLxtZ3VqgJakX1291slcfSNNKlfYOxN/NItQ7OM0ot9jenv5BX6R
         qYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741570140; x=1742174940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKtjkSGQAPRNNqtasOzh5Hz0iRBusUZv23b35HZSLgg=;
        b=c2uSh5YeohkzG4Wwur8ylsPkh9XcE79cShkiAC5TC/pKhDzpJKGEm4Q2ZiitO4Pnw9
         6vYJAti8z81VRvLJ3zgKQFVmkJ/NQY0K7TTqXO34F1VW1Mncri3az3qL5lodab+MMMa3
         yV3DznCmTy5Q6SWC3DQKu/S/1/ZaRjt81etISpMZejzBsybbonmzEs7w/Si7oI4WfROk
         c1ApxIGWsAwZy51//KNymQUJg0iIyzfDGcqajYHf5uUrGRgAb1mOfzpCpve8QRPaN+Mb
         KlO1LlcpCYVQmFOq2WJPy6b6hVXjwjs4Z5eyJBs+IZEApDFaaf/JbLCo6045mIskS17C
         PBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZEIxA0kktupg8M1RF9PrULZPqlR4lc1Fs2mwCWqAgF9qsS2GN/6VF7nPharTXTUVYtvrCoIJnaJ86ig==@linaro.org
X-Gm-Message-State: AOJu0YwCYxUw+nbY7fzHPeb/WGSdqTZ2k0LUw6nEamFUkZ8KF1EntcyL
	lBvUJ9PRw8MTnNpW8GSCa3w6I6NgGJpdY/ajs2FEnbYkFLgVbmDuN5EYHgNbCpYvbA==
X-Gm-Gg: ASbGncvNDo7b7G1b2xInda0kR5hCSMGHVQQ1HItfnXinKUlUo95l4nG2w9Sb+RocRcb
	NagxXgbvOq4sxluZs9uaiNlk6AYB/ROIzsopA6hmax/LCn+3+riv71Ddh1nVhfr0/nRHpASi2+r
	6eYW1twhmXgZiyp6ecwcrvyjC0TJj32ruLg5EblpeOiOo6FBCN4Z9ae2Lo7tzp1BWEeULdnX49N
	1SR7ORcIzJH1ip1OIBWIoYB79nuL69KMx7qBw9qdlvChqXqG1TF6ZzPDpSTSnoeulOCmPaXpRBq
	ZalEmkipaICq91R0Za9Wx/AZnmFsb90uh1Hiz8SKra2W8sqczt8FuoZKPdHPkk98Do0Xcr/Y0Jn
	WW9GRPb//4646ALyuJiU=
X-Google-Smtp-Source: AGHT+IHNntuQ+2t/fvIlVmWKxkKTZizcSizGwVgK0BelP3nmHfAzIaAMvncZimaF2C6X3H/VvhggUg==
X-Received: by 2002:adf:a3cd:0:b0:391:46a6:f0db with SMTP id ffacd0b85a97d-39146a6f2ddmr1260640f8f.37.1741570140590;
        Sun, 09 Mar 2025 18:29:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee22c13fsm51483595e9.40.2025.03.09.18.28.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Mar 2025 18:29:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 6/7] hw/char/pl011: Drain TX FIFO when no backend connected
Date: Mon, 10 Mar 2025 02:28:24 +0100
Message-ID: <20250310012825.79614-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310012825.79614-1-philmd@linaro.org>
References: <20250310012825.79614-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ygSVcJZUlXSj

When no character backend is connected, the PL011 frontend
just drains the FIFO.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c      | 13 +++++++++++++
 hw/char/trace-events |  1 +
 2 files changed, 14 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index f67ce951ac9..6d26a3e13f8 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -241,6 +241,13 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
     pl011_fifo_rx_put(s, value);
 }
 
+static void pl011_drain_tx(PL011State *s)
+{
+    trace_pl011_fifo_tx_drain(fifo8_num_used(&s->xmit_fifo));
+    pl011_reset_tx_fifo(s);
+    s->rsr &= ~RSR_OE;
+}
+
 static gboolean pl011_xmit_cb(void *do_not_use, GIOCondition cond, void *opaque)
 {
     PL011State *s = opaque;
@@ -252,6 +259,12 @@ static gboolean pl011_xmit_cb(void *do_not_use, GIOCondition cond, void *opaque)
     count = fifo8_num_used(&s->xmit_fifo);
     trace_pl011_fifo_tx_xmit_used(count);
 
+    if (!qemu_chr_fe_backend_connected(&s->chr)) {
+        /* Instant drain the fifo when there's no back-end. */
+        pl011_drain_tx(s);
+        return G_SOURCE_REMOVE;
+    }
+
     buf[0] = fifo8_pop(&s->xmit_fifo);
     bytes_consumed = 1;
 
diff --git a/hw/char/trace-events b/hw/char/trace-events
index d52f511a1e2..730d6292a2d 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -71,6 +71,7 @@ pl011_fifo_tx_put(uint8_t byte) "TX FIFO push char [0x%02x]"
 pl011_fifo_tx_xmit_used(unsigned sent) "TX FIFO used %u chars"
 pl011_fifo_tx_xmit_consumed(unsigned sent) "TX FIFO consumed %u chars"
 pl011_fifo_tx_overrun(void) "TX FIFO overrun"
+pl011_fifo_tx_drain(unsigned drained) "TX FIFO draining %u chars"
 pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
 pl011_receive(int size) "recv %d chars"
 
-- 
2.47.1
