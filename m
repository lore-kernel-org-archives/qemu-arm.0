Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp533204ejx;
        Wed, 22 Nov 2023 10:31:34 -0800 (PST)
X-Received: by 2002:a05:600c:444a:b0:401:bdd7:49ae with SMTP id v10-20020a05600c444a00b00401bdd749aemr2621866wmn.18.1700677894105;
        Wed, 22 Nov 2023 10:31:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677894; cv=none;
        d=google.com; s=arc-20160816;
        b=Fr3DJWd+7zGtsdxcjzh+VQWv0DMf8BxqY22MOWkWbfaKWjLiJ+J5Vfed3+fj+d01KJ
         TsJGLB2Xp2/RopUZ6UhS8SHFCcUJQ1gT119yWlkVx/kgjF7Agbfv+artxmXz1FPwyiOW
         8G0NWM2zyFgArLGG3aR+Tkxw5hqbP711xxyJi0nSO/kuPTiMYms1R6gCifgrl/KGNUc6
         eTZ8IJXs+0vgIUQ8hwFYRRXz96od/NUZx/lrQsLpkcOZuBwl2j8ptIL+5vQGVsoxflAt
         L6zfeyMQKIXR13nW4QrfX/jHxLWbnXtvwPoRb6d5NRWtFfxZxhW6rD0ZG+RovLRgOdSd
         qm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=auZXV6u0sdeAtdGoHPpNxl3A34os5kR+ZbHub0QBvt4=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=TMVoWHh/EyNQ9dL1XLd9SW12CuhfulBwBJziKILtWnsdsR+jFarnQdxoCooWFUgMIP
         UCNVEcbuqovqzxle06LYU1VPxK7nvRuO4ltHKSxFYcMymOjmueX3iNrIiMSCITOocIVe
         zjVeh8B0JS/a2f6bqZ8GsrbXEAZfstjYMT0Vf03aI6jdaFLXCrEWcrxArXZ1xgmiHcWO
         OBjAXw7gil637+Eotg91cED9mSmCrmcUO2jwSVYbsFMNmNOTlbAai9JhrEkhMJ2HGUoB
         wtkVjbQhpXLm3gNYVDFuP3/3ThWIwpgxRbsW+AtRJ1Fp+2jfb0BiiUpqsUwp2SKYwmg4
         nyMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kSU4ERYG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v6-20020a05600c214600b0040a4cc060b4sor26863wml.7.2023.11.22.10.31.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:31:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kSU4ERYG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677893; x=1701282693; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auZXV6u0sdeAtdGoHPpNxl3A34os5kR+ZbHub0QBvt4=;
        b=kSU4ERYGzN8GMmXWYPCHApMCo5muARXWu62cqrwh9m+crtNcBlQMAk617aqUcb2Ves
         su9N3oeQwj2AEBG50ngSSwX/AI3Vy2o2YG7p4IZK/FwuJBHNUv22h2rKG1WQ5fWYcfNZ
         LCkMHsNs5+T3JIBgTXb1MHyKmitBCDQtLMs1s3+Wh55rK9n5YoDJlO9mI/BCmWsoWqfm
         tbUnr50Vkh0kYpp0z4Ns4x/wagCyRebhTtw+MXJkm9Uuz2Q+c8UFh7VBbkMwqyWcwpr/
         kCkEc1tdP+2vbvJoUfAYV37hClanTwv6bVk8lfRRQiVgIkXUUmkwCiCCoysYZMLWjZMu
         nfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677893; x=1701282693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auZXV6u0sdeAtdGoHPpNxl3A34os5kR+ZbHub0QBvt4=;
        b=AGNEeu84iQ3wb4KVbNYqrfdkoR3osx0zAh6L9ck5sqvwnSt5rNRJoGIHxfW4Vw2m1I
         dbpt/nF/BlRsT+AkgobTlYsrwDEJH9qnBGLGLFel/ckfePTji7S3OveUOoL0AmNIbhRI
         WPhdEOzRExyjttKAISzQsojtFcJGtG4de0q9KVhsRe97KUNP3ClfNYEOT2Qe+iza/yLs
         dxRaLsKewNE1Kzg+fSfOuP64j7fQP4snNta2oTudOQsKz6BeLT6n5zYL1t4dw0eZXbFC
         y+XQhJAFjJDAPYNWU2X1UgrEo+XWfSGhEJbCIsc+E7BRGZj72mfWnFtLGETRJMdmeGFp
         zwQg==
X-Gm-Message-State: AOJu0YzzrsSG+IYNZLnnvuhvligqNrr2rPf5LCqa5nPQ975w5uoSWBkU
	RZW6LVA9MTnFg+3sQM6c5LxZiYXk
X-Google-Smtp-Source: AGHT+IGESb8wYuo18nw+OYgfuR8Z7d/jlZCt9RdbLsLVU/QAQzVuLyz/D2Glld5mzqjPtKZ2eSJoYA==
X-Received: by 2002:a05:600c:3590:b0:405:1c14:9227 with SMTP id p16-20020a05600c359000b004051c149227mr2662206wmq.33.1700677893528;
        Wed, 22 Nov 2023 10:31:33 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id u14-20020a05600c138e00b004063ea92492sm187101wmf.22.2023.11.22.10.31.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:31:33 -0800 (PST)
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
Subject: [PATCH-for-9.0 08/11] hw/arm/bcm2836: Use ARM_CPU 'mp-affinity' property
Date: Wed, 22 Nov 2023 19:30:44 +0100
Message-ID: <20231122183048.17150-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122183048.17150-1-philmd@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0aK5Qn291KJz

The 'mp-affinity' property is present since commit 15a21fe028
("target-arm: Add mp-affinity property for ARM CPU class").
Use it and remove a /* TODO */ comment. Since all ARM CPUs
have this property, use &error_abort, because this call can
not fail.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/bcm2836.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 198f9b5730..8031a74600 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -128,8 +128,8 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
 
     for (n = 0; n < BCM283X_NCPUS; n++) {
-        /* TODO: this should be converted to a property of ARM_CPU */
-        s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
+        object_property_set_int(OBJECT(&s->cpu[n].core), "mp-affinity",
+                                (bc->clusterid << 8) | n, &error_abort);
 
         /* set periphbase/CBAR value for CPU-local registers */
         object_property_set_int(OBJECT(&s->cpu[n].core), "reset-cbar",
-- 
2.41.0
