Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp976408njb;
        Sat, 8 Feb 2025 08:39:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvPA4l7Xzz4Rx64b3z0qCxWwZFXVoAb+TnC1p0cOjYp4L4Igah3DLoChvT4f9AkIqWN9md1PZ+plxCJQ==@linaro.org
X-Received: by 2002:a5d:6d8f:0:b0:38d:b6be:bde4 with SMTP id ffacd0b85a97d-38dc8fe4187mr5082225f8f.22.1739032759416;
        Sat, 08 Feb 2025 08:39:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739032759; cv=none;
        d=google.com; s=arc-20240605;
        b=dDTzgxXKaHtc0BhxDb6zb+d6a+RuT0NlFVGLXYCDCXILSMl8L1WkPjffknEO6uO7rk
         1AHs5TiIhAsWeLHKyPKSvHMtPGfvrbYjb/X3+/UhMJY44Un8qhB2w+fEbS+8jsrlJ3Qv
         8OH5GK1LQLZIWPegA8UomlesXtNPtQr90nF6mHXUrAnaAAO8haayanflq7qXwtbMYzEF
         aiP0OOtJxlFFq8Y3jHZEDpdRwO4kyqJHpSrcKG7VmyIpFJJ9nAFEods+jPkLu+R8+wTR
         NT3Xz24NqP9QQdLDMDzrzx77LKVmypl6xQ27qhrMwS7/uiEWUidwyL0SmGe4KtJ95Fo3
         2kJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pnDfQ0pDNHjagyoidO1nQy0wbrzE23spPhP9nSEJCp0=;
        fh=KQRIHze64T4ZRYKw3CyXp8dQCP35vFbCwgtuDxypDsA=;
        b=EYEU8LnK5I1fxrOShCr+JJkRHFXW7y7P2FYEvXcUlOGI8UagqvsSp2gQj8Nd7NvQ8b
         +TlDbcDyXAG+3Dw8kIYC0cG3Ft5DyTvNy+tt+6/sHBTOq6B6pSLT+5WHp2wnrjDQIIpM
         jpa1sr6ZH1Khtl1Ueiv7OjiHV4391Nd4Xa9B77D6PbKjoBwYBUdxis123YIQ9orbOmvb
         PAJSLedlfhWciv79gbdMLWTxZt/uAx9vjnLCxS9Xjrkr6aRXDuAMOR0EhmqwnjharrFJ
         a43FLz9uhVq+2nTkS47KOS4lEbw0flhIIVOXaCwLgvCoduBCYJwQA0HOOfQRD0L8DxxV
         H9MA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cni+dS0l;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38dc6d75e78sor1713075f8f.8.2025.02.08.08.39.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 08 Feb 2025 08:39:19 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cni+dS0l;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739032759; x=1739637559; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnDfQ0pDNHjagyoidO1nQy0wbrzE23spPhP9nSEJCp0=;
        b=Cni+dS0ld2kyBTqFjW242SySqIwVplig0FV+sL/SFeSoIXwsxZj152Zj2UKBvIMrQb
         r+QkXGIKN7e0QgetBlOAQHvpDOVmDu6YXzx4EoVxqV4G8gcqt7v1uvPMx6/HCHL2RS+s
         z9OM28tscbQUgPz+UQJJDctlIVg1kRR+gF0WnbIFgDxfMp4pyMF2oCQpNUhr4rZycNK+
         HLi1nB4zaQB74GMAEQcpkDM0EtIkuaO1kCQjLwGyMKiao3xqMDKvEPivBRWFofrM9X3K
         Yb3JOHd8UHY2Mngszf/sUIBUzIOhZXuOoJDCoSSwhjEsjPNaNwoScN64UMt/0RPDL3Pd
         9C6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032759; x=1739637559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnDfQ0pDNHjagyoidO1nQy0wbrzE23spPhP9nSEJCp0=;
        b=O3AAOvtnpnGzFHWva9f7Kau6zNzi5VmazTunDfQ+jjLA84PS7ywHbm60SOxlaVRkPy
         S9OaexF2xNVjAjgYeUgFDp37DMI44Et2bCFjKxssDPr1pc+t1y6gIgjEjUsxsU8Ogg31
         MP2bkcSkbf/PGxUWR0tC/x60bhqyC/U6jyx4in1DT3fFXn40jweIv9pLGvewKRBfQPQp
         BsESPR6cgkKmXupU5euo7z9PfX4Qsiw3nBgf5Gbh54xrnGZrhL7fJX5YfzlW0gRoLZHQ
         GqFiswovq+WVW9E8Gh34pcOLbT4KEUIjmht5JdHLDQD5fVXyM+S00Jl8+kBpRPiQ7+Fo
         z2Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXHPD3cwCJ6ViONzi2JaOLVfZkjP2T7sU5FsqokEKR9a1mEVJwFPiuWgthYmzyL4hdGPr2jWivXcKlLlg==@linaro.org
X-Gm-Message-State: AOJu0YyYHc20S+VcTFnL7EkJFugT6LKXRjTuBB97RJLMFx6kvFG24Jcd
	Q3rd9novLF46/dliGrd/a80UGSyl2gvvVbBop22KksssC8mV8aLrKdso5iR9OwrLUQ==
X-Gm-Gg: ASbGnct3ncEmyCn06kCQjVLImJoLCSxAYvd12xSBH5m7TGWWPaz3jCRnmSy54AlbOBP
	H2lWn4AVxIdkboptELITUbvBjhM63CxiWO/UERnl8fDEg+gD8Pxy11jFPl0MCmcTz5fmCfJmwP/
	7yGiexjgYtPYOpJuj6SrvHL1ReqX8HQEBM3JGr9aeyc8X9u7anJxY+lMnWJZm+NHzJtWQfNhI34
	IjNOfB9xhX6MZ/VLKQy4H/X1gfD4dw7jt4cOLIu/tEma3ja9Cyf5UlJawQYS4HgOpfAj7XS78HM
	D+AWTaSbdAaVPmugbm8X5LgvQKD6zdW3kHztEUdYDQQxdxbz5i2pZXhwlZbPWT4w3g==
X-Google-Smtp-Source: AGHT+IGtem7OP/J+ciEP6t1sttj6uUucFHKFy2ilA0KO9IbGMYq37p+5gV+Q9tzUmRYGQPuY0zZLXQ==
X-Received: by 2002:a05:6000:1887:b0:386:3356:f3ac with SMTP id ffacd0b85a97d-38dc90edfecmr5468949f8f.26.1739032758923;
        Sat, 08 Feb 2025 08:39:18 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd54624sm7410071f8f.45.2025.02.08.08.39.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 08:39:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 1/7] hw/char/pl011: Warn when using disabled receiver
Date: Sat,  8 Feb 2025 17:39:05 +0100
Message-ID: <20250208163911.54522-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250208163911.54522-1-philmd@linaro.org>
References: <20250208163911.54522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ExS9OCLKqK7I

We shouldn't receive characters when the full UART or its
receiver is disabled. However we don't want to break the
possibly incomplete "my first bare metal assembly program"s,
so we choose to simply display a warning when this occurs.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 06ce851044d..60cea1d9a16 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -85,6 +85,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define CR_OUT1     (1 << 12)
 #define CR_RTS      (1 << 11)
 #define CR_DTR      (1 << 10)
+#define CR_RXE      (1 << 9)
 #define CR_TXE      (1 << 8)
 #define CR_LBE      (1 << 7)
 #define CR_UARTEN   (1 << 0)
@@ -487,6 +488,12 @@ static int pl011_can_receive(void *opaque)
     PL011State *s = (PL011State *)opaque;
     int r;
 
+    if (!(s->cr & CR_UARTEN)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled UART\n");
+    }
+    if (!(s->cr & CR_RXE)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled TX UART\n");
+    }
     r = s->read_count < pl011_get_fifo_depth(s);
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
-- 
2.47.1
