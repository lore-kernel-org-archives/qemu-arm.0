Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp867384njc;
        Sun, 9 Mar 2025 18:28:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVV2SxejC/mjMRmLPpDV/UyASo9KSXn2Pbb2R6UVlpUPpBTTR7QjQef2uWeu11+0i7qcxj3gSnWWH2KUQ==@linaro.org
X-Received: by 2002:adf:a38d:0:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3913aaf1e51mr3418434f8f.52.1741570125673;
        Sun, 09 Mar 2025 18:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741570125; cv=none;
        d=google.com; s=arc-20240605;
        b=iJQWmSc+k6yLmOc5IV2eSOV3p/guG8hzDT/cPLCP+BPaoKZwyXEw4aG3fk445g9HG6
         4/2zqVikpONy8NsEccoZyADxsOFkTBtXq+X+tfNh0+uVVupOl5aKaUydyeX2/qnW3JNU
         6WlF5Q39+MDidSHO+3K9VnQWg25u4DjggE7JXJh1ls/05+YIY5obGZ9DvMCWNhTj10eb
         jeWqWh2t0C/HLpY+c63J3+LUxkUKVICaAP/YstSGgEpTTgZDKQG4UcCXNd1JNs6M+Ikn
         gfV3QrYR3HomMoTW81cns6ElAJqElr/uVKoQ+xAD/qGvqbOcv0qmLuJP/cNK8oDkOOPV
         nSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8ce/6NRq1JPvdEj2O0uStpJg+L6PTsOBLcGGWbCWAug=;
        fh=02tHzVmcrvhfAV++YyfU3uhvdJ/CJGErWKsD/z4Q+nQ=;
        b=FcVCuMQ5I8+eNHD6SY+MXCW45//JvWrxoAp1Efxf78s8tYVS9kvMwsQxMwE6Bowqvn
         p9+Kgiu8L0PCTrjc41FJRZW8qfrxp0UpFYzcdJukt9DTJX36fX97rGQdp/pCGswpjXUC
         9Wt9ig3ET0TqXRuJ1oWWYrfasiDbyjPDxgOZ97ImJqs5lUnO4s6ECPEDy/Po+rhFLny5
         yz2Fi72AV5ygnPzXP4dhF/+GXo8zM5lUM1kSsUDungAM9yAtO4eR2/AP4tyGE6FoCAoX
         c8Lb9YaH4GVoso5tzd8TyhAWSnCFnbgNfz3XZ9sXe+K3UazSxi5riT0xHWMdJhdm+Yl+
         pi9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p89kpSQ3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3912bfe017csor1950155f8f.2.2025.03.09.18.28.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 09 Mar 2025 18:28:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p89kpSQ3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741570125; x=1742174925; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ce/6NRq1JPvdEj2O0uStpJg+L6PTsOBLcGGWbCWAug=;
        b=p89kpSQ3zDFBKSh06jGD0YCEriUB+sRDT32tNdtACqbziEQu7K48lR7HC1EFvEQLI/
         4n/5xDJ4uvSY7b2ea7uVT8OeUS2egs+ILnYJ+B5MoXvNO6TXAzOBPaoKQknkwvThZzcO
         SSN/HGVkL+wDOepUMpVPZbUPmPFH7tBYBLa6wlCt/ApPiKPUdHhVBGnQCPTINbpNW+m4
         RZ95OuPDayEyTwTalT37T6m+m0zyV+ckq2Fq3DCoIuuerymNmeQ/6HmQGPc1TJlOR2Hx
         D9AVKtvBzb7BA5+KhiDtTo+voKbrtpFgnMFVt/sAg+wbcEfyFmeWPPZjnw26a7kLv8mi
         x5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741570125; x=1742174925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ce/6NRq1JPvdEj2O0uStpJg+L6PTsOBLcGGWbCWAug=;
        b=UylRWZlRXyEWS08cgaJAb/Xx72+7AVob+PHsk2+H+A1hOwdysWLOn44gU5ZYBmVFXv
         W6s+buO6H5eAa986oSKal0ljYp7J2cVe9MFu5qwyB2KwZjpqgrZMAkxBACSaU4xVM/U9
         oVcIJIy708dXXB/2Z6meeznmUMBxKLyqk0Y83eUN0XKXxR2lnN3jOlm9ibEkH8KbGCpk
         Tqn0ROW6z66my0CjDH8WMuSPHxEUVFKQu0pAWL4Uytyj6WtjvReP6LBRvkYB7WOvqBAU
         peDu0lN7Gi/qlQKjcp9f7iGGcdTebsv81JhZ/025XfK1e3rQ/esd8UUEaGU/FG7R+wlL
         wZfg==
X-Forwarded-Encrypted: i=1; AJvYcCVYd5Bb6of84UWB38zvUnzJmoyq3KMcZUZl4a/1FC7GI/wwJvMhZ6yXcvaqFzICL09iGGZkipkrRgOjdw==@linaro.org
X-Gm-Message-State: AOJu0YwGvBcdYbafPQLneqL6zrvinOBn78IGcSc09QLuvzW0fQP4tauW
	NJK8dSgjQORlwb5NtAgU6LZM/GRKTsIncps6kElktCX5g59aVBANMLk5Rue68yrxivRt/c/63vK
	6NUxifQ==
X-Gm-Gg: ASbGnctxdD0iuW9pwJjuHhKDy0hP+602MYwP5BDJtpn2/y3feYU9CdRGQ90V/flyrq8
	hDjUjIoBf1zYix/9OzA4j2P0Q9ymppMwcWHYQN2bs4XjNtZGInbK6P6+jASPzN6A6FMkUnVMexV
	9zidXGngCMfq8tCF0q1zGNWy6uzgVHX69JospjF6F96PVoeujltdq242OwlgVJsbRLCj5+8rGLv
	MHGzFiQPTh5T6xhSi1Zx1zzSOgBY/QdxUvYUzjebK/6DMmIlGvWUiXvV9S0idV34U7eQpuA5xVJ
	Korxgc0e/Hvg6omjgNZJtvaE2uDc17gVyFyviQO/lLjVtUIsQjUAtzI4Jlwvc8odE9hfEJNQC9u
	UZezORS4IP6gEnZeWs4XTLkrtNyQnow==
X-Google-Smtp-Source: AGHT+IHMH17IYR5Ovj/m37Ab6pmHw+/2HW5zZIKNLc6UOxDZXcPHSvolywRQoMV9c6kqY3HkAiGxkA==
X-Received: by 2002:a05:6000:410a:b0:391:4559:8761 with SMTP id ffacd0b85a97d-39145598929mr1319845f8f.36.1741570125026;
        Sun, 09 Mar 2025 18:28:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfba83csm13154773f8f.6.2025.03.09.18.28.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Mar 2025 18:28:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 3/7] hw/char/pl011: Factor pl011_xmit_cb() out as GSource
Date: Mon, 10 Mar 2025 02:28:21 +0100
Message-ID: <20250310012825.79614-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310012825.79614-1-philmd@linaro.org>
References: <20250310012825.79614-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: S/RNRWmBc63b

Implement pl011_xmit_cb() using the FEWatchFunc prototype
to register it as GSource. While the return value is not
yet used, we return G_SOURCE_REMOVE, meaning the GSource is
removed from the main loop (because we only send one char).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 113b29cd9e6..18ea03a52f4 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -226,8 +226,9 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
     pl011_fifo_rx_put(s, value);
 }
 
-static void pl011_xmit(PL011State *s)
+static gboolean pl011_xmit_cb(void *do_not_use, GIOCondition cond, void *opaque)
 {
+    PL011State *s = opaque;
     int bytes_consumed;
     uint8_t buf[PL011_FIFO_DEPTH];
     uint32_t count;
@@ -254,6 +255,13 @@ static void pl011_xmit(PL011State *s)
     }
 
     pl011_update(s);
+
+    return G_SOURCE_REMOVE;
+}
+
+static void pl011_xmit(PL011State *s)
+{
+    (void)pl011_xmit_cb(NULL, G_IO_OUT, s);
 }
 
 static void pl011_write_txdata(PL011State *s, uint8_t data)
@@ -630,6 +638,11 @@ static int pl011_post_load(void *opaque, int version_id)
         s->read_pos = 0;
     }
 
+    if (!fifo8_is_empty(&s->xmit_fifo)) {
+        /* Reschedule another transmission */
+        qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP, pl011_xmit_cb, s);
+    }
+
     s->ibrd &= IBRD_MASK;
     s->fbrd &= FBRD_MASK;
 
-- 
2.47.1
