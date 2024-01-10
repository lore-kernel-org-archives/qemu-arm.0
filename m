Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1258832ejs;
        Wed, 10 Jan 2024 11:54:22 -0800 (PST)
X-Received: by 2002:a05:600c:3d0b:b0:40e:4ab8:63ac with SMTP id bh11-20020a05600c3d0b00b0040e4ab863acmr817304wmb.135.1704916462664;
        Wed, 10 Jan 2024 11:54:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916462; cv=none;
        d=google.com; s=arc-20160816;
        b=SFKWYou3NZKxz8Hr9JPVSUBjyRYCYunG9ddUB963sUkGvfhEuJfe+fv+EIwzV7de8U
         7mp9jCviddV66HtOTNVpZDxCeCv/SlMV2Ohih+3CdJTiwgmDRFZcJy47iyVgHNe8GUgA
         rkh2YjLII7A2askc2wqcxzMGBDSfKgT5Ar0ArPyx/VjkMYBIxeTtqo4nP7UwFsWTqgG9
         NNpsmWYRxAvvqFIh76oAJajXnF9vte1XXHGg6wW3JaB/Hekb4LMzKHCGKoEwAW6BizZp
         CN2FPm/0SnaR+NMEov2/br48r0oTj8rHXc5tIEK0gfi4v0cogJgmeD6w2sSDQR5xH86z
         ayoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4lFs+peHffZXBVVkShWxuZ7VjcO+rV+nUwkZ0/LL7Zg=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=yDS0TGsI+s/frlu9CvGaPr3hUHzdk7amuzYADfEaD0wQhtOqqS250VtRk6pZp3oiAq
         d4Mm4bjh7gu0pG40e+XDDUpCeg/3YF0gpGPDHvpzb2jYVu+3YkOhzCAG1z5TohF1yrrP
         ZgjbSucsvmP2C2N11XvVZLEvlcOCy5bLgeCFq7NRnXCu05pDayuAhJI0+eQfjAr99EaN
         Zf8j994F1O5hhJ9fXGaxhjMEgtaLteRTyci0h5ecur3bDbculoj4zPi7WWdsYI+D4kk4
         Th4kgrVmj1I8oaELU0vZjCmDrO6gl0jZp5UCZvEWLDnMpGeERutxdIrdJbImUcUcjY+m
         GnwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lpzlQpcf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u30-20020a05600c4d1e00b0040d90c913b4sor2069479wmp.11.2024.01.10.11.54.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:54:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lpzlQpcf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916462; x=1705521262; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lFs+peHffZXBVVkShWxuZ7VjcO+rV+nUwkZ0/LL7Zg=;
        b=lpzlQpcfaaW20QGINM+z/uNX0aStdwPtj0QbSM8C7XkU9ctmXRHYpEpazYY3sdrWd9
         IdlR2z+PiO+nkLSmzAP9wH6MeMFF4UnpeOwx5j2ccdiYQkWlfMmCqWwznAvOWQc3pAag
         9AO66NLP3LRKluQN+1euJShwoSPXX3G+A0xZa240JIGaA0BDKnkTPT4pmvcJ/2UQaABh
         hQ0pgD13WeWCSGIsey5PjLpDcPreXWLPY0qqs6DSqAfGUpFZJXqv+v1D8dD5lkTnuJLY
         yLwnwmMbAE0Av5BS+6cjFJsqc1X399dsKDaEIj4Y/qdjTXr6Yiv2c41DrVb75/C5vTIT
         UBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916462; x=1705521262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lFs+peHffZXBVVkShWxuZ7VjcO+rV+nUwkZ0/LL7Zg=;
        b=Scgf+N5d4DZoUc1Fku+zeE142sGo464FU7/YzV3a14Gyk/7jC48Az4ecjkokgNfi2M
         Lwh5cUfCypRUFh4+TZ4V1i3j1vW/HSilcsNccTU7pNQ5ZCUYnZe3Q/OxUIBPUSfBQZLx
         Ut+uVc+eTM5o/XZBJvcPyvJ9NKnmdLYUf2jZRBEv+08CJTzQInhTkY9bCtL6bMl7XrgY
         JJWydv8M4GdckW7lz4Epktu03TTIkB5YHNt+yzEHj6aBDfp46a4+9QwUOH1KqVUlctQa
         TAgn/tmyKe7h6kxju7jQzrDJT+C3rfs3Sslqb+G5FJVkZExfs/4f9TVkf3vCfWVCUiLY
         vtJQ==
X-Gm-Message-State: AOJu0YyGn2xIp98pc/QNfQSVyz1gVvtCn3us7eql8FZyTX+thBxxKzC/
	jTp+5Nf8HoNxoin2Zzu88m0KXmzMkPugZvy4
X-Google-Smtp-Source: AGHT+IGo64vLyi4J8/55MaWl7n5oNPXeGks42EesEkm5PlwaHr8gvTmJY9i7UaNSbV2yJM7TOxalIA==
X-Received: by 2002:a05:600c:225a:b0:40e:480a:cfa3 with SMTP id a26-20020a05600c225a00b0040e480acfa3mr827220wmm.61.1704916462415;
        Wed, 10 Jan 2024 11:54:22 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id bg3-20020a05600c3c8300b0040d91fa270fsm3245344wmb.36.2024.01.10.11.54.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:54:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 07/14] hw/arm: Prefer arm_feature(V7) over object_property_find(pmsav7-dregion)
Date: Wed, 10 Jan 2024 20:53:21 +0100
Message-ID: <20240110195329.3995-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nwHPCwBz6A81

The "pmsav7-dregion" property is added to ARMCPU when the
ARM_FEATURE_V7 feature is available. Rather than checking
whether the QOM property is present, directly check the
feature.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 0a7ad2b762..7f15318ae3 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -338,8 +338,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
                    "mpu-ns-regions and mpu-s-regions properties must have the same value");
         return;
     }
-    if (s->mpu_ns_regions != UINT_MAX &&
-        object_property_find(OBJECT(s->cpu), "pmsav7-dregion")) {
+    if (s->mpu_ns_regions != UINT_MAX && arm_feature(&s->cpu->env,
+                                                     ARM_FEATURE_V7)) {
         if (!object_property_set_uint(OBJECT(s->cpu), "pmsav7-dregion",
                                       s->mpu_ns_regions, errp)) {
             return;
-- 
2.41.0
