Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp617317njc;
        Fri, 19 Jul 2024 11:11:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjY8QFfWsvg4cvGCXJzptEaU3RHJwMNr8a6iXbJRm86YIwE+Dntg7YL298h4sQF1FW96/8ILO2OlO4tacRHUwFARFE6URD
X-Received: by 2002:a05:600c:138b:b0:426:5c9b:dedf with SMTP id 5b1f17b1804b1-427c2cb6112mr61276435e9.12.1721412707955;
        Fri, 19 Jul 2024 11:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721412707; cv=none;
        d=google.com; s=arc-20160816;
        b=CEDiYML6Rn9Vc7lPg4/7t1XUFWIzHgDcfKGo1c8wh9NvtdflxbkPjcN9/x+KzvjrMR
         iduUYqqslFtxyNF/roSkBoXWAMSq8pjriJquk3ce3LEC07KVyJPoUtgMZL7HXudFYvws
         JnjNcD1hC3mG2ebMGujoqBAvAHZIcygjB1Qt4DtOkVj1mFSr0mJSq97bnJR46dNpjSSo
         jIZL1broOxTQRfcYcPjJJGE4HvzzAhZLZhvCRYuSo+Gr2I3Y2bYexLNnfT6X8mJ0F8/E
         c7uDuBTg9GoA11ITArdBK4ZrIjaAwYwH3pg/kfWvPzQPK6uZnwy7ikHDlNYB1FqU5T3w
         J6lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=grsGKEIQC5JMZTvNvSN/qnaW61vNteYTEI5sYVegySE=;
        fh=OIn8WY+lH3K0EjhhJQh7yEnuIAjD6vBYkKO/1/jvR3A=;
        b=FC3oXjTSKJ9LNTJ85PiLhWRY3lGhIjtW62ldyeNOWG9ndPA2klPQsv8OcbVbbQ5+9M
         Fc+NmBlY5bSuIvAkSUXGGq4B6JwB39Nh/hlp0ALw+OGmbu2Nh+By7IE/py3FQZO12AnA
         6foJsCB+pPSD3xdpkpot4JCDR0VCxBfG+yQpqAcZ/U0hQLfgkTactV4YHsZuUoIqbXUF
         Ykr/FzpWVFE0WGxuhces2qTW49azYMMJ9akespe9QP8wWqwB8Vv1wJaqU/eVBk0SzYof
         4fvrnkP0mLxEqoGvCnen3Cn+UKi3gXICDNWkkzzabg/7j5k5HdEXnSxdk4t+N2VAFRJz
         PAaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w932wG9L;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-427d6ed18e2sor6243975e9.5.2024.07.19.11.11.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Jul 2024 11:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w932wG9L;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721412707; x=1722017507; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grsGKEIQC5JMZTvNvSN/qnaW61vNteYTEI5sYVegySE=;
        b=w932wG9LS6D4C/I5PlN8oShjwo8WsOcW8JmTSfpVVOCjVxOVXiX2yGDb8zQWudYLrY
         dfoGVlIloA7VYrppopNoemWsws/MjiWgcW+Pv7DKry5W6lj2eLUcv/ZK9cAYcu6YlCvq
         lMdAqPr2lBAtrtekVzRTBINqZKzr1WtjAqZ1oBSdsuKk3d0y5MckV79xlAoHo9NzGn/M
         NNCMi1UTKjec72CUFVzRgFo25O4DIkC8LaEJZa6GWZZgAJ2biUMagkMuru/x7HPNwUz5
         6fDRasbKuwAEv9E9v3ukuUpLWHQeemr2HwKLJSZoyiZ+XlbuH8rK2E/vOXXcKsPtINqc
         YEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412707; x=1722017507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grsGKEIQC5JMZTvNvSN/qnaW61vNteYTEI5sYVegySE=;
        b=KSx90BrTJiNjBrNMgDkNn1pODP9D08zBc5679IYk8KWnQkSLjLEmyzxNahQNsVI/T1
         8cv+E2k3/6xG5VLQUkyA7x9tzCuBRDvPqVTsZTVgiMb5YAuiAWhxT2ixCIfuEAe+Z/WQ
         Pj8Kr2q33NmHBaJL0CXsL2FNLNB6K40nUi1Qz69LsvVggOlWp2GL/AIoXnYCoX70PE+7
         2/TZcW2qEkgJnGxG7v8xN7oL15m0mtAZWYVqSFCzC9kXCHSZywTGRznJMJsO3ZF+L7us
         6urFUBxocvaPySPfegKAd3kiz3uPAwALVtcUfl4AnCOSpVZ1eQUnA2H4WBGOT/Eta43T
         yBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5Okju5/pVsnSAZrsIGgZpzLJgs1qurK/+MaRcmNbHZXwjSX4Yo/xV2QudNLpfQXwA5UCtaQMmLv8wkcb1o+/Kk6924erX
X-Gm-Message-State: AOJu0YwwMRAW1zVUsKX2bpGLSJMXkQK2u/4IA3ZAupUOKQQeBG2hV7f7
	Ti1jpU0D8OFbV/Pu4c8mkAIaduleaPGdeG+GFh2dj0rdoH1LBLmP4I3tguKvH4c3+A==
X-Google-Smtp-Source: AGHT+IEAoXaf0/G2fVClsxjzD1Mv14qrcJ+tc6r5Tl38cqGiH3clJ3oMaSvWDUTbYP/j+Dred5O2Pg==
X-Received: by 2002:a05:600c:3d9a:b0:426:6ed2:6130 with SMTP id 5b1f17b1804b1-427c2cb6a6bmr54800415e9.14.1721412707456;
        Fri, 19 Jul 2024 11:11:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (52.170.88.92.rev.sfr.net. [92.88.170.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6906a96sm34009935e9.22.2024.07.19.11.11.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jul 2024 11:11:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Tong Ho <tong.ho@amd.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 10/16] hw/char/pl011: Check if receiver is enabled
Date: Fri, 19 Jul 2024 20:10:35 +0200
Message-ID: <20240719181041.49545-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240719181041.49545-1-philmd@linaro.org>
References: <20240719181041.49545-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: a2MnRG10XgvI

Do not receive characters when UART or receiver are disabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/pl011.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c76283dccf..0ce91c13d3 100644
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
@@ -481,9 +482,11 @@ static void pl011_write(void *opaque, hwaddr offset,
 static int pl011_can_receive(void *opaque)
 {
     PL011State *s = (PL011State *)opaque;
-    int r;
+    int r = 0;
 
-    r = s->read_count < pl011_get_fifo_depth(s);
+    if ((s->cr & CR_UARTEN) && (s->cr & CR_RXE)) {
+        r = s->read_count < pl011_get_fifo_depth(s);
+    }
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
-- 
2.41.0
