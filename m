Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp552819ejs;
        Tue, 9 Jan 2024 10:09:59 -0800 (PST)
X-Received: by 2002:adf:f9cf:0:b0:337:674c:a01b with SMTP id w15-20020adff9cf000000b00337674ca01bmr807650wrr.82.1704823799033;
        Tue, 09 Jan 2024 10:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823799; cv=none;
        d=google.com; s=arc-20160816;
        b=mkGCKESFWiTGUbCnw047Qu0sNNwpNuPXVwBT0aC8F2yto/N2kJG4yMgeimnoy5C4jb
         hLTb0FqQ/3/bA2D3YPKQTsRgDrLyR/j5DOECIgjLno6nWkxh+veXHKKCrS6nmmQrCL8U
         VxMWgj0yqYdBd7owvFFVBsVFvLDWuigBk5tYcNU0dFc0aXB66mHKTsVJfKY6W5Bo0ZgW
         SCAT+cSj4xcJTXGdJzbxXwwvldDfPQGFi4Rb1p1uEuEOue0zzteQkhJ7ka/fciMcgNIf
         KMukVGZBLqPZ6kCGRqTknyCX2EDNkCyUzo2MaPsjD3sUPYRHbCx9bq/Ziyzwy6tpK5de
         yLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=znfL4d0kUd7PQLWgd/IbU4xVCADxWCmjPBLUUJRZlJU=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=B7lpqj9f+5bn53FTysxpC+0ILaPlqdHGwnsvaGTklO/FyFVe8NM55xQnMZqpaJ615w
         1FoMh0VuHlSDWoLLaj77beajufSP7FR9K/ecryj8QOLOxVL6nw/UQaCl+9ko9nLJc88i
         yv50NRDP4iKPZdAX68GAupAptX9XT+gJSCJP7PaKJ8aCxEZ85rICNkXUAkosntD7Q6iy
         rD8mCd3DJ1i4z1sEm81gJy/xC10Sr63da59O8IvtIdke1d+YXu/A+uAHwR2CS5JMAC8+
         0dlJ5OaERWHbeu+k36Dlcq8w8FC45qlqLPQZsxN2Zl0iKW2pU9W1wyfHZNdRlFSAEX0z
         gJWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B11lvvpK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f17-20020adf9c11000000b0033686645563sor1033342wrc.10.2024.01.09.10.09.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:09:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B11lvvpK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823798; x=1705428598; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znfL4d0kUd7PQLWgd/IbU4xVCADxWCmjPBLUUJRZlJU=;
        b=B11lvvpKI8cxwJweAH92bZdm8Pedxc7evQhyN0SYMXIKITAKVI6bYw0XrH9O+W4bNF
         4tFGmE7OJ+/copzRepFmXfD0ASdzLYV8frHsGn6xfR1iW6wKKYROVWRUqsaJ5r0UbQLq
         vioIZpChnCHXQMMVdBdjiHn1PmpUOg+0EswLOfkZdFQm1I2qbT5/4jvL+QxmUBWlagTc
         EmWfNtVspdxWFQKaNhuEqhNHxR1fSi59hgDe+ij6e4clVmgwgdYyxV4XlV4Dak36VmEZ
         bRPVO/cKlZQXO+p8He1KcuxEegrJLVVAjadKJQQCl5/MklX42PSH1RD72ipyU/jyV8ki
         MQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823798; x=1705428598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znfL4d0kUd7PQLWgd/IbU4xVCADxWCmjPBLUUJRZlJU=;
        b=S3jMD0snccYTbiPlMv93o5xkrP3wz/g/AdVhmGzZYIdUhFY3Eyu0t8Q6Yl6hZkRflS
         sap/o8MjzcgNCJxyAt3g38HfKrxLhIQ4IaTHFHB9x83x5K2YYWlZX7tv8TCqPfURo44/
         S02DFqRny9l8FTqgEMk9GwEvTOZOSdt7tg+SS5S7PDqHqr/NSugYMbWrxG2oqvPEQtPM
         gB3raOsasvyiLzeRDJj8D4IHXxHvSQRBq6o6dRePuRWjTbhSGqfH2cLdamRV/EUAshF7
         iSsPqTmanD+RmLvr1Plivku1EYGeapSxtNOFApr5YZBrZh1KSJPh8ZqbjXcNFbqp0Za5
         f6Vw==
X-Gm-Message-State: AOJu0YyyZ2EI2G+y0EIHf/9RY+wjJfj2maCmCpFazeEs2KtoR4LmDMwC
	z8dsYPHyswFln5Ln8XfpC0FdEUM3rHQpMnp7
X-Google-Smtp-Source: AGHT+IHadGAKCd5gSButumHgjloExnl9xj8kKKS1xRfyJwZ1NXHqvCwQv0MINefNrE/fapdxrbYdDA==
X-Received: by 2002:a05:6000:235:b0:333:2f1e:cbc4 with SMTP id l21-20020a056000023500b003332f1ecbc4mr852249wrz.13.1704823798697;
        Tue, 09 Jan 2024 10:09:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id r14-20020a5d494e000000b003364a0e6983sm2975178wrs.62.2024.01.09.10.09.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:09:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/14] hw/arm/armv7m: Move code setting 'start-powered-off' property around
Date: Tue,  9 Jan 2024 19:09:19 +0100
Message-ID: <20240109180930.90793-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CdrlKqBNPivK

Reorganize a bit by first setting properties which are not
dependent of CPU features (and can not fail).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 8900730e53..b752049add 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -308,6 +308,7 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
 
     object_property_set_link(OBJECT(s->cpu), "memory", OBJECT(&s->container),
                              &error_abort);
+    qdev_prop_set_bit(cpudev, "start-powered-off", s->start_powered_off);
     if (object_property_find(OBJECT(s->cpu), "idau")) {
         object_property_set_link(OBJECT(s->cpu), "idau", s->idau,
                                  &error_abort);
@@ -334,7 +335,6 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
-    qdev_prop_set_bit(DEVICE(s->cpu), "start-powered-off", s->start_powered_off);
 
     /*
      * Real M-profile hardware can be configured with a different number of
-- 
2.41.0
