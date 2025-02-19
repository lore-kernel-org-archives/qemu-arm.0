Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1627837njb;
        Wed, 19 Feb 2025 13:08:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUw+PKgCrOgmdpeCOe81THrGMyPgqbFsp2t77Og80bONSMatcrZAqUyfm+odKfg30A29ODgwJ/LX5oxnw==@linaro.org
X-Received: by 2002:a05:6000:1446:b0:388:da10:ff13 with SMTP id ffacd0b85a97d-38f587955camr6441445f8f.21.1739999334855;
        Wed, 19 Feb 2025 13:08:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739999334; cv=none;
        d=google.com; s=arc-20240605;
        b=jPSaIeNM+pOEAP7319BaDYC/fOceQ0f3eaQYIe1hx5Y7Qah3CP8NxWxJPfU1Vdku6H
         BdXe05R3ZiYAVggQg+3rAdH2xsNlHl36VYjcLmS+8+TqXpXLw4vSf+2kEELljxvS0oyV
         G0vghONgmaAc9k3MJBYLK5qL7hv4IyVgce285mVFCeSicmjL0FwvHR6kHQx/mpcaCiLi
         LC23vxHnOkdOaj5S7e5INiiKSyxxCv4lTqVrawdqSNcap8ZNP9QH1NOelb+yKrLJxYip
         l4GNH+JY1qs4jTj5WuhTf39f0xSUGWILX2N5BRI/VOBcI5Oaj8OohuOo1dgdnw/++9N0
         JeDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3+Molro6lB3lK8nnwO97GajMQTSCSuF9fx6fEvtnGg8=;
        fh=dY5dnEynOothYvYejBdepM2gVLIi/WIpBG86ISznHpc=;
        b=aNzkwi0y4je6aY5p7ZnAoHrpj+LTZC3FQL8RTYbY91OC9xGXyNW6kOsDA1+NSr879N
         61gjh6oUawfSbr0wwK4jkVSlPqVQr6TjvECPbxQ0gc3yRDSiDdTo/wvHzqrSTqINAhDf
         NcO2Jae9jN8gVeaBSxe13SqDFq1XdLAFAxXxMrDRw3j8sOJSE/r2iXkgMuzKsETf4kGT
         5QOyt+GbIXNh/wQ+ADkDzdHCVPuZih7R/zsrn5ngKnEHkGT7ZI9tlGmGqVvOZhc1dylb
         WiwPUNZjtJfwc8rWj76AU5XnlRyjyFZ2dB6KQAeWAllMr+c5TNED6lNZ7dakMTBOaRwi
         4Z+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A9Pu649S;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38f2599688esor5184323f8f.7.2025.02.19.13.08.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 13:08:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A9Pu649S;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999334; x=1740604134; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+Molro6lB3lK8nnwO97GajMQTSCSuF9fx6fEvtnGg8=;
        b=A9Pu649SjElBLmC/MOW6rDKkpTtYTBgoSjK7S7BC+bB/uwQeaUIftjHBTMRveFgJqJ
         CXhReQB0HLz3l7JTAYZLnShF8S2B+3a4ud4ISO4sld2+AwsxHlE5bv7rYF9ymZYnrvoZ
         oaSgFmola3BtpmdjxkSNCQYqETb3UMJaFY7QlTJHJytbLnaBmLyNxrcS1cFQS3lncnkR
         D7lYl3bNI8DqbLUHFUdisAJovOGd+GQzSkg0aelc41eCTro9yWlFrpxe34aUokwgolr8
         7fZOM4E/ZYFDM3uPhBtd1gmTI4nmLBWW+IaLz5KJSc2qNBaQrlPeI/8YwwpQdWrohypY
         bIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999334; x=1740604134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+Molro6lB3lK8nnwO97GajMQTSCSuF9fx6fEvtnGg8=;
        b=naQhTE4gKv1pve3hDUnqFGSYS8sCgnLgqpCPmL0SbeibHshWE6QZZy5XGotx0vvgk+
         AC56Lx0CaY5UxEfuoyVibUypF9CqRtDfxKsW6wzvslcnV58Ml+xBtlxey9IJ3n+rvs5V
         ot2dM9ZDdiWenADV29x41G8m3ps+xdYgSWaqESRUUFw0prqqaOLPHQtjbxbPhD5MGTg/
         JPVVFBsebBcCv4kOmnZPFMvNzCeIbMDdDFwyEI9mGTOX0+jjxu3A5NENjP4GHTZmB8i4
         ecutU6cmpC9FgHM3AVc5intQrnjG6bJqkiSk50pb8b2atrkUDg4FZykWD4Zk8Lr3lwve
         Kekg==
X-Forwarded-Encrypted: i=1; AJvYcCWyIOY2qfUaz+Ms0u/A1dmshh3prfTA8niDMMdn7W200uQoWyNpYfDsWJqYEn7SOm/i54HA0jsveBWyLg==@linaro.org
X-Gm-Message-State: AOJu0YwBn/eRq5kbrFbAurn2fGBBCMC75tAPt7xQ3i9sIf+wIxLID4/8
	1GAc/Rw64WLcy1/byamucTjXtPnhFqWOJh0MX9BOZl1LqAfWfBeGEHj3H8rQ0Rl0kA==
X-Gm-Gg: ASbGncveYj9AnbGgJy6ZS81JYvMfK42J4lHVt+2kU+MCiriP1KYsCVOBd3MWOS/Vpob
	uVqas63wuwPSmGow1sMpxyVx2HXOzgsj1DiIbxhKS7JERTUTc9yvFT2E9OzfNd9rWeq/glrUZ9A
	PjnPAWn/8jbOf/Ko3EDT0LfOcKAXnu2mt3lZ3uVZj08Cg19f5okjCc9QzUBzkQd+GiizvqvDBIr
	m14wjfzPTiwqAw7bF4m5q83jAp/a19BOyt77JOXriRwY3B5X2BEIaqhPuQ+K/rsFNp3s6u6MVai
	aq07IvmT5krYzcVz0oqPghJWpDbFWHKA9P9sremQyOJdJMsnEFJ9xXmquUwYDHvJDA==
X-Google-Smtp-Source: AGHT+IGwngY8yxWMhLwq/KgWntpSf7HRF5XmQjKuJRImATuaSWrYG1I+/eCKEZFC6hsjO91u0/Tffw==
X-Received: by 2002:a5d:47ac:0:b0:38d:e15e:17e9 with SMTP id ffacd0b85a97d-38f587e4e64mr5506069f8f.35.1739999334316;
        Wed, 19 Feb 2025 13:08:54 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm18812959f8f.77.2025.02.19.13.08.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Feb 2025 13:08:53 -0800 (PST)
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
Subject: [PATCH 2/9] hw/char/pl011: Simplify a bit pl011_can_receive()
Date: Wed, 19 Feb 2025 22:08:34 +0100
Message-ID: <20250219210841.94797-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250219210841.94797-1-philmd@linaro.org>
References: <20250219210841.94797-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fYX6a4/WXD8v

Introduce 'fifo_depth' and 'fifo_available' local variables
to better express the 'r' variable use.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 60cea1d9a16..bcd516d682d 100644
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
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled UART\n");
@@ -494,7 +496,6 @@ static int pl011_can_receive(void *opaque)
     if (!(s->cr & CR_RXE)) {
         qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled TX UART\n");
     }
-    r = s->read_count < pl011_get_fifo_depth(s);
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
-- 
2.47.1
