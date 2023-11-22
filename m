Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp533146ejx;
        Wed, 22 Nov 2023 10:31:29 -0800 (PST)
X-Received: by 2002:a2e:a454:0:b0:2c6:f1f6:30fe with SMTP id v20-20020a2ea454000000b002c6f1f630femr3026283ljn.4.1700677888853;
        Wed, 22 Nov 2023 10:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677888; cv=none;
        d=google.com; s=arc-20160816;
        b=z3ZGjBXoJ+YftXMtcf+0zHclJtCE+QEX5uqiC5S5hmiza7csvWYLGFvxmd2yL8kYXx
         /hhnn+xAaK+a5GHJRhSFPEdSnzd2nYqyfF/eIy59i/HcgLANW6IJoP6MDj65kNjFYfeJ
         Bexsg+jWVuefvH35VutSWvQ0/onoM5Jh/L2kOAMhzs5lf6JwN44Yl2od8aLYMq9jniB2
         DAil59duw8vbqVPywn+gVdP+ojmMIstmxrU/CtWh1YNTtlOxGxlMm7OaSwmJgbVtPmav
         hXCMYphL44Yc3Ub5T9PEYy/kCwa7oAtDBeU9+46Y3bXGAyGWCnv1ml7pPKWKimmtZVIE
         Ping==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Lb2/44LPlczFh1Mivxhuq3Cei7H/G9D4OqWoSqq23Aw=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=wqaL3TcWp6EV1bzlcjtpI58Vsk7pfpm5dAb2N7GYVruokN5Haw5rL4Dzz0+g88yruh
         w89uCLas8GXDy5X4nGyPzE5QoswXECOB8qUqqKiUWrBjJZjCqD4wUm5ehdbJcEYA7PV0
         GH7WT2SjOyXRKHGXMIw5zftnEQxfGXQR0Zj+wJscqDgOysVP12ftky9DL/aI7RgXyUYj
         1zQkmhXy1Y1p2XNeNgx4vkzMTvWDKHQaAjItWSz1oCpLF+mzZejgcwipYG8qyGdbfLNZ
         033o8ixFfj4HHsVkT1QMdVk5FP22HckIXGJHDGOrmhiaSXz35bJpKg1WYAIAbzaNeBEN
         EiXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DJnZpMNw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i4-20020a2e0744000000b002c3d7ecdc9fsor35685ljd.14.2023.11.22.10.31.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:31:28 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DJnZpMNw;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677888; x=1701282688; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lb2/44LPlczFh1Mivxhuq3Cei7H/G9D4OqWoSqq23Aw=;
        b=DJnZpMNw4niUP4FJnEUyRz207qS4k3ERo7kNhNIb/VIfs2YqDze0yP/Qh5WWQP0saf
         Jnl3OyDU+Jdq4akDFB44IdBZ8CFJPrwGAg6F2ucTcb/c7owrNeWo+7d9UDSkE/WXItoR
         XIzOdxp/YWv/Q3s66GiD34hFwVIGvacJ7TZ+sf/G2hgAiO7LQcwUlSE+kPq7Fucb7yXp
         3K5v/zy03w9g2ZJl0WGP6H3UbDSy46QzewIpJVz3J7iTFMiL3vw6fIQ6MMj2/Y5FZL7f
         mMxoVTosj2zGmbo0xP1Vmu+KjQN44VtNnyc45mAtT6L9fncXJ1IJw4T6nKSz1/mocNLy
         Pc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677888; x=1701282688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lb2/44LPlczFh1Mivxhuq3Cei7H/G9D4OqWoSqq23Aw=;
        b=dPEvl90liUOy2CpngDtUJYMQbEIHYTzjszjcmnU+32vflrdAqcBj2InuJJnhIag3hH
         zu85AV74gsT4s+mEAjqvm8Gt1U6d8JOT9qaaqoFwwa5V3VwIk/gZH0BJLOvNVlpWMCGM
         yR+ADuA34rEEXQ6qpe/Df0SG7iFOkTL/NF/N9zcdEqmm0vx4DffagUD+1N1niSPkLJj6
         iFbruecAcujlW+yEoPT6bigeUXXrdBMtulFeVp1TwwNvvwY8LZX6rPMEEOxQSM0QB66x
         8aRMFuwMo+S4DH9JRVLE2IZ8aOIGs0eIGPaExbRWYFHIZc7QjKWyLETpkjVjlUSRdd0T
         XGVQ==
X-Gm-Message-State: AOJu0YxbMUp15uCBCkH2AX6OHCuygtDcp1HQ9WxWiK66/1+Uznyem3Dq
	AKIcayk7AbxpOaggg151d6KNDgX4
X-Google-Smtp-Source: AGHT+IFkhrZIsbX/NLV5u7r2FhTAsRQgMEtXNWL5Z5QCEKRjxkWeiCkids1c2PJIQvSmJxDxRtKZcA==
X-Received: by 2002:a2e:b914:0:b0:2c8:744e:dced with SMTP id b20-20020a2eb914000000b002c8744edcedmr2287579ljb.35.1700677888455;
        Wed, 22 Nov 2023 10:31:28 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id q19-20020a05600c46d300b004064e3b94afsm280976wmo.4.2023.11.22.10.31.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:31:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH-for-9.0 07/11] hw/arm/bcm2836: Simplify access to 'start-powered-off' property
Date: Wed, 22 Nov 2023 19:30:43 +0100
Message-ID: <20231122183048.17150-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122183048.17150-1-philmd@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sS4/YMiuVqst

All ARM CPUs have the 'start-powered-off' property since commit
5de164304a ("arm: Allow secondary KVM CPUs to be booted via PSCI").

Note: since commit c1b701587e ("target/arm: Move start-powered-off
property to generic CPUState"), all CPUs for all targets have it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/bcm2836.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 055c909e95..198f9b5730 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -136,12 +136,8 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
                                 bc->peri_base, &error_abort);
 
         /* start powered off if not enabled */
-        if (!object_property_set_bool(OBJECT(&s->cpu[n].core),
-                                      "start-powered-off",
-                                      n >= s->enabled_cpus,
-                                      errp)) {
-            return;
-        }
+        object_property_set_bool(OBJECT(&s->cpu[n].core), "start-powered-off",
+                                 n >= s->enabled_cpus, &error_abort);
 
         if (!qdev_realize(DEVICE(&s->cpu[n].core), NULL, errp)) {
             return;
-- 
2.41.0
