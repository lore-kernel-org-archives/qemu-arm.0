Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp533088ejx;
        Wed, 22 Nov 2023 10:31:23 -0800 (PST)
X-Received: by 2002:a05:6512:3ba3:b0:502:afea:dfdd with SMTP id g35-20020a0565123ba300b00502afeadfddmr3226679lfv.13.1700677883624;
        Wed, 22 Nov 2023 10:31:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677883; cv=none;
        d=google.com; s=arc-20160816;
        b=FVEiqrTB3Fvigkc14LYFUStmjgQsi6iiDcJ11fFIoFLPiMZ7Qgp3PCdVLsiav+JECj
         18nO7SaIjZRj49AZQXD3AOQ5hVmLrpIEsizPebv0VlMy5NOthHXNZqylFfY2ImPM6NRL
         ux0ptj/9uTGEMglKiRuptntJfKNb9LCf8VBaKWLlfkoIpJGpQPUmB1RjZzhSp66PlU0a
         kOrv6Oe+2upSNa3xshFDBFbdesIY5+9sXbg0r1NBC6GB7gHwKvFIa8sKrSGaSf//OI4B
         rfnnAKUb0gT0Oh4kwfoTP2DfbaFA4krGMuErCjJR24RSBduEWilU19lK8XaJnR2AvGv9
         HnJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wy7RMjyw0Q7UvKTe0+LJtz1uxwDhQNO7f4wPUgjAVa0=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=vRCVbHi7FAccI+odvDn6A6KzsSiF1DIzCMRqP2+3Qkvd9rKwqDvCHkg1GMkOzPfTli
         ecyvd5SKWinmhaYT06/jwmvfMQJzHeD5SiZXsd3HJw7DuxsXyJE7kAVFLm4PKyhoMMXu
         77SIvmpwHlq2pq0EBbfoh1CTool4kr0ch0M+o62CYmXRssYPbcvN7wBSvNj+hH+kEQUQ
         h0XQ/OzNM1K/JQncCP3hk4nBFjd7Kzp4p7UDvaTXQyCTj7dpj0o48yWgdRjbDSmvrkT8
         7FXVqq+RCJ/5EPkQdP+Oe9/E1xUkkMiiThH6qHjpuWA1nuEkzxvrzMwXkHw5lzscoB23
         Ey6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahnVzQeC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x9-20020a056512046900b0050a76406a8asor3259983lfd.23.2023.11.22.10.31.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:31:23 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahnVzQeC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677883; x=1701282683; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy7RMjyw0Q7UvKTe0+LJtz1uxwDhQNO7f4wPUgjAVa0=;
        b=ahnVzQeCyNZ/Sv4LlE3uS0DJk+/X4kE1/wMyM937BxwqpoBTSWwt8xHcpSsCpJsmBE
         fhoMZXrvz210IIPJlTpSUPzm/Iei64P3mZYQefzYlUy+cDoLZbrYY5wTdD2jNDEnUeTd
         VOePuQ+hVoiBuH8KYRbOKfNIa80qN+Nd5heYJqP21GDXQ3xVV7Q5E+eF8DRW2BHQj1aC
         rCfgD81inatT1pSz8a023pYwa/npwzXE91l7JwVaDxNSWJskOY6MaeFLOZvSrD5htibi
         ucjS9S+xTlqH6kxdzVsHf2iAE7++X1813jgQb7o22XSqerMdE5fglsvMIuKPWS4IHlJZ
         PP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677883; x=1701282683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wy7RMjyw0Q7UvKTe0+LJtz1uxwDhQNO7f4wPUgjAVa0=;
        b=ceZFsjtCPGmSREtLeEBRQhW1byklYpz0DnX2a4PXqRGXNsV4lFOB+eIGLdoS6WkwXC
         DRzK9/o/qcCsZSK+O3QkFaLnekD04E+qITN/vvubVHPlseEf1vECXmwLDPbLZEhhTHN/
         ZGwN3p+PPoAOHZMqLHXYqqgd0mC/Grgc+AMgsPMWVNErkalpT7m4VR8Z7oPpw/iYEZA/
         l8Pjbb6jOqZLKUVlChBjE/ErPCx5VE6+Q/ofM23CMbSSI/UsKqC/+x/q1fcBbCKIG1xC
         HelZhmF4lRITo1on2khKMFEUbCDbGPuSRbDx1BVOXfif0yQRQwBhL9scb0bWNaEa6jbu
         gNBA==
X-Gm-Message-State: AOJu0Yzn9bATWK+3ekyAKr5vNSBaxhWNgP06PAzUiWOXRH9iThL9HNyD
	NwjcUHvdVmYCWn528iGWjxqiXFMN
X-Google-Smtp-Source: AGHT+IEmMQjXUiyiLKGtUufCPQsRblLgydZGbL1JsNZSAIzcHo454I3CyBFJaRr1B79zPj8koxrWfA==
X-Received: by 2002:a05:6512:158e:b0:507:a766:ad27 with SMTP id bp14-20020a056512158e00b00507a766ad27mr3346315lfb.16.1700677883188;
        Wed, 22 Nov 2023 10:31:23 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d6b91000000b003140f47224csm67155wrx.15.2023.11.22.10.31.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:31:22 -0800 (PST)
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
Subject: [PATCH-for-9.0 06/11] hw/arm/bcm2836: Simplify use of 'reset-cbar' property
Date: Wed, 22 Nov 2023 19:30:42 +0100
Message-ID: <20231122183048.17150-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122183048.17150-1-philmd@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UVcMs6/pfk8B

bcm2836_realize() is called by

 - bcm2836_class_init() which sets:

    bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a7")

 - bcm2837_class_init() which sets:

    bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-a53")

Both Cortex-A7 / A53 have the ARM_FEATURE_CBAR set. If it isn't,
then this is a programming error: use &error_abort.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/bcm2836.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 6986b71cb4..055c909e95 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -132,10 +132,8 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         s->cpu[n].core.mp_affinity = (bc->clusterid << 8) | n;
 
         /* set periphbase/CBAR value for CPU-local registers */
-        if (!object_property_set_int(OBJECT(&s->cpu[n].core), "reset-cbar",
-                                     bc->peri_base, errp)) {
-            return;
-        }
+        object_property_set_int(OBJECT(&s->cpu[n].core), "reset-cbar",
+                                bc->peri_base, &error_abort);
 
         /* start powered off if not enabled */
         if (!object_property_set_bool(OBJECT(&s->cpu[n].core),
-- 
2.41.0
