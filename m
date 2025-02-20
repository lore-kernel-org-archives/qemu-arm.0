Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1887602njb;
        Thu, 20 Feb 2025 01:29:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXNjWm3VthpQoGkOkn74hOuPqzt30mho0xZH8xZTdGJarQGQMhwfgyBlrs3JDT1mnMXr2QaDNihdJ3TmQ==@linaro.org
X-Received: by 2002:a05:6a00:1821:b0:734:b53:581a with SMTP id d2e1a72fcca58-7340b535988mr7606924b3a.7.1740043771559;
        Thu, 20 Feb 2025 01:29:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740043771; cv=none;
        d=google.com; s=arc-20240605;
        b=IE9ZDp/dh/C0PDYJSZAL9TxHLcSEE/ofLO8hkq/Ak+6YTFgLcOf43TNzv3UWPdz4EA
         QsoZNwpfAh2grIYLCRRA3heH2mihHCDdmMsPkvndtj8389Nbj3aO1YPDb5efSPNNm169
         mPmov48XIbYt5KLGEplCEo1gT4LKjRgCk7wv3jbj4pLM4GDkkrNPJJb0hJ8Y0ViXBHya
         Wka+oO0JczddAuFhl6EwPJX4rRMlHIfjomjHQKyT5kDPL7OTkrqhIKMVt8PNjpPL/vui
         URo9DUt0dA0qhWFVp3b1SkDdrhMjMVHJZQ1tzdDboWmLkRJHrFaj+zSku5Mbknl+N5sB
         CYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YvVgNJ/E5bcHmFtQhvSS1dYamLv2zmBpjT3Espofk2I=;
        fh=Qzug5ObLcWoLQkuUBa/UPOwsrwkZJPf7TX/2RYfF6DQ=;
        b=IQaeQ0a3rBUGFqGUW3NqXSyS4haVWi80SSvTtaNeVW63sL0kNLXW/dVJDNYbzeHEsp
         /noBn1PQQGMtHgYR376esEITttm77hoMiM2wHWfqc+yWMGddcRZNUyEaR6O3r57m45gA
         2zNKm8aw+7Dw3Bi1reoWx7rTyteNLEUIx8hGVAH4JYEHlSmAS1KAlP6emFCggkeXGd79
         JPVRfltuwQQMIrIDREG4pqBk0Lq4jq02AC1dbV/zCBfg4JIWDVNC4mjqOwhaimK9eMhj
         nrD508Laj2snMlQeeVTemIKlqLI9H3ms+WCEjt3Yus0qARFwAasbJy7d3iJLfMt3B4+4
         QdIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kkec+xB+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73242759e07sor10497699b3a.5.2025.02.20.01.29.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 01:29:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kkec+xB+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740043771; x=1740648571; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvVgNJ/E5bcHmFtQhvSS1dYamLv2zmBpjT3Espofk2I=;
        b=kkec+xB+Q0Mk31TpnldYbPTLp/KrDxXw9FR+bXX/9qMkCLOfgsuTxi/4/sWMcCuNpl
         Ze/fHQp0Fzqa1ClmV69PJclSn4jVEmXQ78IYziJ2UB5myB3OIHvhc+y9Y6CYs3rLnfQO
         vrLDavIUzRtpByOaiPq2dfLOWd5/eSeYvD1EN58nsn89AHEwem6ULnncEOYIfumm5Vfb
         6pcH9BKA48/j4Dswry9Tvji3Gsm2pWfsEfJntgOBYm5WEqXW2kx5bDdqkEbeCnsttRRP
         wxL5qn3aVdYZiyudJ8RFu44EqD/DwCXRU1RyApjgGIujrDxIHDkVLXl6nEgCf3jjxWJc
         kqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043771; x=1740648571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvVgNJ/E5bcHmFtQhvSS1dYamLv2zmBpjT3Espofk2I=;
        b=n5h4sU2Wk2six0aKR9uyLnam+8MpGEBCjElUG7dT+eVv6iK3H1rGIbHHtDuL5QndMg
         E8qowBoa8pUmrz9BwcJEIYwIxowacBldMNd6e08yviQ+Rg3xViUfmLWvsJ2nb0Kyl27x
         vg0xnaBuPcUHt/ZY3m700MPgMAW3Omz2uoHcG0B/4bYIY/mF1TeGyualfwqanEWtTWkv
         Fv2ApxP7FD3XweqayaKHuUdHPA9vOx6uK9sMqP9tWqoft9JhBTcmJNvSIRqj8jwsKqeI
         6+clHDR7w3QMlPtM91/eF5v9nTR3kuPP9AstxcXg+H0dHsuh6Hh9vc9FvjqWuYTE/bcb
         aRyw==
X-Forwarded-Encrypted: i=1; AJvYcCUh+zvOq/mBuIE29fgWsVnfYBrC02imFz8QArmhTmhNCAd3xLweWXW41cWCJFhZq31WXf0LcPEobdaS1w==@linaro.org
X-Gm-Message-State: AOJu0YwGy62Eewm93vcjltVgfB5oUJ/xShjdHl4ElyOv45DsRzGbiFIf
	LV5FwScICCTMglvWJ0bMISleTCZ/v0FaHPl82pk4WZ1WzV+6GMlKSKzthQEHN1DscQ==
X-Gm-Gg: ASbGncsznY1tP3CyhSFVqvH6U46MfB+yxbZl1tfkYDxFLDOmtq7B3/W7MLgA02REjbW
	0awbEzQbB960ooUFZjlbvlmvl2HKFQDzKlK8m2xMDUPtuxLrAaG+MbIQyh+fBG3KTvnvkV2BVeW
	eCeycZQFb2+KWuncIETQjqoCvrDlrGnt5B36eZZqdnuoYZLpVNVT4RSIcBugo4moI18ODYICPj7
	LErP5YgSkbrtfQFN7InHRgiOPz9Y2XJaQ0gotNw9qEInqoh7h64eRhGIuntc6/K8h65hHoIg4dM
	crUOU1ao2ghgVwFpCaNsYjyRWA0hC3ZMPSp5REmj5E84yb/pVCZfd5/Mu6CMoZTjtQ==
X-Google-Smtp-Source: AGHT+IGz1/2rco9w0NsUMI3Bogl20f+NwzvY99BxTc3Zo+a38NqQzxwOJpfAGgW5KrZjoc4ZoRcQEA==
X-Received: by 2002:aa7:888e:0:b0:730:8d25:4c24 with SMTP id d2e1a72fcca58-7326179e908mr31597617b3a.10.1740043771021;
        Thu, 20 Feb 2025 01:29:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73264729945sm10067375b3a.179.2025.02.20.01.29.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 20 Feb 2025 01:29:30 -0800 (PST)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/9] hw/char/pl011: Warn when using disabled receiver
Date: Thu, 20 Feb 2025 10:28:54 +0100
Message-ID: <20250220092903.3726-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250220092903.3726-1-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lOZhz3ZCf+2O

We shouldn't receive characters when the full UART or its
receiver is disabled. However we don't want to break the
possibly incomplete "my first bare metal assembly program"s,
so we choose to simply display a warning when this occurs.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 06ce851044d..12a2d4bc7bd 100644
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
@@ -487,6 +488,14 @@ static int pl011_can_receive(void *opaque)
     PL011State *s = (PL011State *)opaque;
     int r;
 
+    if (!(s->cr & CR_UARTEN)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "PL011 receiving data on disabled UART\n");
+    }
+    if (!(s->cr & CR_RXE)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "PL011 receiving data on disabled RX UART\n");
+    }
     r = s->read_count < pl011_get_fifo_depth(s);
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
-- 
2.47.1
