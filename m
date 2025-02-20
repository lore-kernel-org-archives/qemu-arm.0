Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1887694njb;
        Thu, 20 Feb 2025 01:29:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU3o4qFW3u7gK0QM0Y4S4AvYzOf0XDbCq7LBOWV2cpgaAJSNxKFfa0Z/gT058IsYiQ2Bgg1Llyj9hrdvQ==@linaro.org
X-Received: by 2002:a05:6a00:2e97:b0:730:87cf:a7cd with SMTP id d2e1a72fcca58-7329de6ecbdmr12998102b3a.8.1740043787411;
        Thu, 20 Feb 2025 01:29:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740043787; cv=none;
        d=google.com; s=arc-20240605;
        b=YWRUnTCw7bfNV9AuZ1mxPysSrpeS2gzFfoAl7yHsYhY/W61ZB1swazj60A9D9gpB4Y
         Dp8suVUL4iIiFXUx6l6wZhruQG5111zBAbW3ynbtcBj2no0FEB6FJ3/OIRwV8ohbKAw5
         f7ZN9YvfdEsEXkMATo+gqTnuamlJICsv3oST/GVKiLXU1fR38rl9mfTmjJmVHxWDlqWl
         bbUCk5KwRqnopWj2+MRAcfkJ334SI6SBtN+RVmxzHj6ci06vnMeBlP/SARjAdMk85zgv
         IxXe9GM/qt0wEhe+EDfDVr4qOoLV8Jt1Cr6kSO2Plj0luX2lhMvvvTvq08hwsYhs9TpS
         DG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=U+pfJWALs0vQU6dXlJLT5cjO4jcFzB6bulUI2QERKYM=;
        fh=q0sj6BORsV0IyKYSgmlre5xQeFJFZs0b8Z/T1AF3oRQ=;
        b=T/uQd/1BRMd+ri4kdToLdd+vEctK/GoPi3+mBzF2DR9cw8+QjWJNoLKuRVvIH9X4Ql
         rVHM+an4ZzOiWJWpQJ+Zl2BGgnTBjjZk8iIJ1ClguvLs4Q0AA/7iESLEaLFSAelL2VdJ
         y8iTuKgwI1pcdMBBg4Tiym6wo1MU5jvAYUDSaI+1qkgPCbeP1GZ2ObQNTcMpXix8KdRk
         3ArsWRMoZwjOA2FPzE31vqK7XFPix+7GrVp4xh9jGzpBehB1vJQrjKNF4lt/pscDFYqP
         3HJrn/GO9UWwdyMf1Sn2GZkZUb8/HID8irGk5iDmIqxDna5rXctTUaw73wnFYSFqeG1z
         YzXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KkjoIQQY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73268fb0a89sor6697796b3a.8.2025.02.20.01.29.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 01:29:47 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KkjoIQQY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740043787; x=1740648587; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+pfJWALs0vQU6dXlJLT5cjO4jcFzB6bulUI2QERKYM=;
        b=KkjoIQQYLMGMGwTDSNjRyGzb/kFyUZ9gvBPSpqyGD7g5biQ7x1qF8ALHU00ybSL2UK
         +Q0QSkz0RYgttRCnC2/fMQIoR3/VyA22t3tK4ZRfVB1miLoUl5OVUqNEEEK4DeLP9yCL
         IEk5NjYFYFYcWKwFj1fYww/UZFh5adlEnzBBy51DoJkwraadXQY4/dPDpRVS47xTvT0f
         um8JuN5nHL6Lc5VjnS0ccS3zqXujA8p7pCo14sAMAb+M5bqR1qqKRlJ089pULwok7c22
         f48YOQ3ef+tU4YI6otnP/t4YLFYIvyEmHz5UdQsZjd7Ilg7/xjaISKj+N/1DHFL+lDkn
         DdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043787; x=1740648587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+pfJWALs0vQU6dXlJLT5cjO4jcFzB6bulUI2QERKYM=;
        b=bspJkKCbS4jwrhoK7MmrMVnCNKhQZMNyy+/5go+HaBZA7EmPkDdRV0jA5gFsRiW4f3
         OMWxsTeCpFwsLnRlQdbeoXLg3SjjiEBSMr7cR6mvhgDoI2cGZmyWVoPNoLx5/CsqWx66
         kwB29gKMlDSVUOhB7Wmt1AyjzODHSUJIxM2WilPGVJUMSmB7YF1vWZR6ONw29IKbRR37
         1L5DOveOdkEBM/WbWXXLqO+ETf0s3sTE8lEBLgdHsK3Leg7H6LX3lUgIvcKDcSEsCWeQ
         0x6N2RH2UehOqelqZGHFLQeXzUdWO7ALTcO7dPRt+uP8u8k9kHO86P+TOhmNxcAPte9o
         jFVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXo1JA4r5jInBjUgM9KSCS3JWv8ajDryQkn/Ouig6b1Wm9qEIsDa84hpsrOcKISgMciXUNyUZK1IMKEg==@linaro.org
X-Gm-Message-State: AOJu0YzVT1EmbPDSTNwaa9xPPSkKUBxf6vycc7paPewokw6dfJYbmGSR
	BC6WvOGbnxYhDLBRd57trnVD3PChSO9bK02BtPaEBw3VHrlMR0O65RMQaAg5Bua52g==
X-Gm-Gg: ASbGnctCdo9dB9mknxsjlNiU7gZ9c3hAVKWFJkbqDfsX+vSiEhjqygmrS0ZThrgP35M
	a7UJ7inRIYyS2VrDglXCWLZnirpxXK3uq0fz0482TPgtGdQEjuM2yg6UbSsDf7Kr3+7/UKJSoKu
	VlVuElQivA8Dl8pYECe1N2CkaT79iEDEleLrL4WZAVWjr4eCL57Hq7PxiA26dqEj4PLhWe+bRAY
	WrUTwqrWwzCal12z8JIzb6C2Z+UAqlAjwk+w35ZeNy8tWH7YJKzsjj0qig5XP2Nw1KTqG1Quom5
	3Lcjqw6WcdMwIEqBUyLD0peZmusvNJ0EFZ/Zq6jqBHSVYzSldvgbajKpHq2f0qI12g==
X-Google-Smtp-Source: AGHT+IFyDy+RMBEpTTStJH+i0NYoLasO08MPlQLnRqLRNU6PKPwJhJWBkMvplmAlz/1P8as+vVIHJQ==
X-Received: by 2002:aa7:88c5:0:b0:732:1d12:ded4 with SMTP id d2e1a72fcca58-7329de6ecc9mr11147509b3a.7.1740043786895;
        Thu, 20 Feb 2025 01:29:46 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73264729945sm10067857b3a.179.2025.02.20.01.29.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 01:29:46 -0800 (PST)
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
Subject: [PATCH v2 2/9] hw/char/pl011: Simplify a bit pl011_can_receive()
Date: Thu, 20 Feb 2025 10:28:55 +0100
Message-ID: <20250220092903.3726-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220092903.3726-1-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mH92yxzqeEa1

Introduce 'fifo_depth' and 'fifo_available' local variables
to better express the 'r' variable use.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Luc Michel <luc.michel@amd.com>
---
 hw/char/pl011.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 12a2d4bc7bd..5bb83c54216 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -486,7 +486,9 @@ static void pl011_write(void *opaque, hwaddr offset,
 static int pl011_can_receive(void *opaque)
 {
     PL011State *s = (PL011State *)opaque;
-    int r;
+    unsigned fifo_depth = pl011_get_fifo_depth(s);
+    unsigned fifo_available = fifo_depth - s->read_count;
+    int r = fifo_available ? 1 : 0;
 
     if (!(s->cr & CR_UARTEN)) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -496,7 +498,6 @@ static int pl011_can_receive(void *opaque)
         qemu_log_mask(LOG_GUEST_ERROR,
                       "PL011 receiving data on disabled RX UART\n");
     }
-    r = s->read_count < pl011_get_fifo_depth(s);
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
-- 
2.47.1
