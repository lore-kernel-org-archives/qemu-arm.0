Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074651njc;
        Mon, 30 Sep 2024 00:36:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWiIIcIJylrVRpUt3iGgmJjM0PGEzPwct7+bdK6TieGBlDAGiuYRP2U7xxXkUj2owEt3i4JvB4DtbWiQw==@linaro.org
X-Received: by 2002:adf:e44c:0:b0:374:c92e:f6b1 with SMTP id ffacd0b85a97d-37cd5a9c92cmr6408975f8f.23.1727681802683;
        Mon, 30 Sep 2024 00:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681802; cv=none;
        d=google.com; s=arc-20160816;
        b=XJG9vGZFK13a+qzmP1C7IoSI6eez3zmh87ArWTX8nMxx27UBohSAvBaD8SbG+Gl0ly
         t+Y24MVEerwxUsFbfZXqtGRy/2PwHRpgyAzI94yhEPwF5rVIY5NmaJeCIVrdStbVT6HC
         xXRao4Jw6JRKR3ZPsB1QToAxVQMqAGf8D1N4mZpxub4YsntUYc1eA5JsMqNH85QsN9UO
         I9bjatd53Pi0+PggzHzmJFCEGwN45fK/VJuNVwmLcFknXg4Xm9GXg8zBUAbHCQMY2cLI
         ulQMBD+6Ce9ocpS4t+Hf2M3XtEd2sn67sI+jDoOXdF0VjE4JMVsDae7FiBvGPibIvrHl
         nQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qgFNx5loGg07bkVRCAPUaZ+t66SDahiEcwbYBeR9pKk=;
        fh=bBnE0AsyoLW1n+3gL42Gjs285LPt5jxMu5KNstASZ6k=;
        b=H1EwPOnl7i+yFwv8A5S+BhEO3KHFXdFWInDKeJw5d1vbCDKADMOREeO+05rss3JAme
         EYY3jnORJtpw/P1MToY5jF23AH3qnxuxQY9m8RIAjXcAXodB0ThbXm6Qg4Jko5YMUCyb
         mtNntWwrNPi+HcEyOq0B1bTrH7PTTNViuaNJt7932DcdQBvS3rbv06lgfaMNmFihBAfe
         VlKDIaUJhwyTlbYUzqH/2kzRHPZsLpd0pXpoHd+lHD2n1TLsoQwub4+KThvCdRXbnHxh
         5cKOWJbn3bIgdidTDu9l7qtaS8mVqw6EdeOtL7j7evelxK7MaaiDcO1wSQrGWxS/AN3K
         tyAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UiRI9Ejk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-37cd565dd7asor1176205f8f.3.2024.09.30.00.36.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:36:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UiRI9Ejk;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681802; x=1728286602; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgFNx5loGg07bkVRCAPUaZ+t66SDahiEcwbYBeR9pKk=;
        b=UiRI9EjkoIbdAI2sEXJ+dCb68BhbmoGK8w/RkQU7L0sohkhpAxX8CIJPsY7z7CPJVP
         qjua2YLHfFyfTd8Rqu8+8Ttze+AC0XeXS4iT2J4LrMoGue34K4LjG8HgErCyud2pVVC7
         Fe+qktwP3XwyOdYr4ov/x5FYSOYCtNilK+eoNO8ZTcRxfmYmL9dwmxqoqyKWqekv3fms
         bVtmj1cAdkfW1CrIAh5QRB7qBHIcm4q3UxhUw8v7HGlobhwCpJaOwVur/kdHv4L9V/HY
         5wmiTnpg8sixHfn9MG6s1a89AhTmUYiMYRJ0mtS+c+JIbqkqZMnjtrJ7JovQ3WllOOw1
         XwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681802; x=1728286602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgFNx5loGg07bkVRCAPUaZ+t66SDahiEcwbYBeR9pKk=;
        b=A9anyPjA+kSDc5gX3AUgpEvbo9mINfNm4kMfV7FjhTf8gu9coakHbM4DtnKTjzPkt9
         JBfh0Y5bGEOVGhINNUiZG8bdB/tC10KsRlWp9CAOTgKzEQOH3qg2P481w1DiWOvNg7EZ
         WZeh7paxuC+nNsSGduJK0W5mMBhqpi9ppe90KT13j4VoetPFzlO8BTfc9ErlgUKwTofN
         ZlonnNAXVKnD3qdhd4L3glJisYDHhmiIOFSmjMzfkQsE+WEL62PgkU9uKdDoNgfYTkGC
         bsYTQvzCJTyU/9TpN21oUMku7ds0zB3cEUnRJyzQi6sKn+7xMir0VShS3k0SBQDWScOj
         bCpw==
X-Forwarded-Encrypted: i=1; AJvYcCU+eH5cShQZ0tKsWAvbPy9yfMPvD/Lbto1RyEvYi2AzEeMCK498IIAAwrSQ6HauyXP+DLur5LZzuqjI7Q==@linaro.org
X-Gm-Message-State: AOJu0YyO04kCxZjj74woN6Bpacd2dot1QQ4EXHK2ykIZYGP8QnGVnV/l
	4/JcJlUiv8LfAe8fo+ptvG8lQC1Dc3e3hiERZRP9Qhiq6nr305IRt8nZDuCz0fhQhg==
X-Google-Smtp-Source: AGHT+IFvV+g71WyrICzKtY9MUw0GkbE1ssnGCcVYI5UdtoKHuB2gzrZM3sxXfntbw5eYtIk8XvapDw==
X-Received: by 2002:adf:8bd3:0:b0:37c:cd0d:3433 with SMTP id ffacd0b85a97d-37cd5a9e0f3mr6507614f8f.29.1727681802055;
        Mon, 30 Sep 2024 00:36:42 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd57427c6sm8356329f8f.96.2024.09.30.00.36.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:36:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jason Wang <jasowang@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Sven Schnelle <svens@stackframe.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Subject: [PATCH 13/13] hw/net/tulip: Use ld/st_endian_pci_dma() API
Date: Mon, 30 Sep 2024 09:34:50 +0200
Message-ID: <20240930073450.33195-14-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QIFuyfd06uUw

Refactor to use the recently introduced ld/st_endian_pci_dma()
API. No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/tulip.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 9df3e17162..6c67958da7 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -71,36 +71,24 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
     const MemTxAttrs attrs = { .memory = true };
+    bool use_big_endian = s->csr[0] & CSR0_DBO;
 
-    if (s->csr[0] & CSR0_DBO) {
-        ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
-        ldl_be_pci_dma(&s->dev, p + 4, &desc->control, attrs);
-        ldl_be_pci_dma(&s->dev, p + 8, &desc->buf_addr1, attrs);
-        ldl_be_pci_dma(&s->dev, p + 12, &desc->buf_addr2, attrs);
-    } else {
-        ldl_le_pci_dma(&s->dev, p, &desc->status, attrs);
-        ldl_le_pci_dma(&s->dev, p + 4, &desc->control, attrs);
-        ldl_le_pci_dma(&s->dev, p + 8, &desc->buf_addr1, attrs);
-        ldl_le_pci_dma(&s->dev, p + 12, &desc->buf_addr2, attrs);
-    }
+    ldl_endian_pci_dma(use_big_endian, &s->dev, p, &desc->status, attrs);
+    ldl_endian_pci_dma(use_big_endian, &s->dev, p + 4, &desc->control, attrs);
+    ldl_endian_pci_dma(use_big_endian, &s->dev, p + 8, &desc->buf_addr1, attrs);
+    ldl_endian_pci_dma(use_big_endian, &s->dev, p + 12, &desc->buf_addr2, attrs);
 }
 
 static void tulip_desc_write(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
     const MemTxAttrs attrs = { .memory = true };
+    bool use_big_endian = s->csr[0] & CSR0_DBO;
 
-    if (s->csr[0] & CSR0_DBO) {
-        stl_be_pci_dma(&s->dev, p, desc->status, attrs);
-        stl_be_pci_dma(&s->dev, p + 4, desc->control, attrs);
-        stl_be_pci_dma(&s->dev, p + 8, desc->buf_addr1, attrs);
-        stl_be_pci_dma(&s->dev, p + 12, desc->buf_addr2, attrs);
-    } else {
-        stl_le_pci_dma(&s->dev, p, desc->status, attrs);
-        stl_le_pci_dma(&s->dev, p + 4, desc->control, attrs);
-        stl_le_pci_dma(&s->dev, p + 8, desc->buf_addr1, attrs);
-        stl_le_pci_dma(&s->dev, p + 12, desc->buf_addr2, attrs);
-    }
+    stl_endian_pci_dma(use_big_endian, &s->dev, p, desc->status, attrs);
+    stl_endian_pci_dma(use_big_endian, &s->dev, p + 4, desc->control, attrs);
+    stl_endian_pci_dma(use_big_endian, &s->dev, p + 8, desc->buf_addr1, attrs);
+    stl_endian_pci_dma(use_big_endian, &s->dev, p + 12, desc->buf_addr2, attrs);
 }
 
 static void tulip_update_int(TULIPState *s)
-- 
2.45.2
