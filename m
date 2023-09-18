Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp2803412ejb;
        Mon, 18 Sep 2023 03:17:48 -0700 (PDT)
X-Received: by 2002:a5d:46c4:0:b0:31f:d8ba:c997 with SMTP id g4-20020a5d46c4000000b0031fd8bac997mr7074032wrs.41.1695032268656;
        Mon, 18 Sep 2023 03:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695032268; cv=none;
        d=google.com; s=arc-20160816;
        b=HYgHfdYYZOsLUJrgIKTU8najG/SvUPB2HM98RXp2HUvwivEuM3I6/VebirKYeJy4Vi
         srYmhJl4fJvrHjNg3dbNW8C1FFG531rJAYcyAffDC2Ej1av4GRA2/nFKNWWpXtCfCzTi
         2tQ2qtte9gihWYeFH/HCLBKFxgjqa3w+SKMiFLk9EYT2hVZbZxX9cv+cmGD/okl7EbwT
         IV9c15tGE9dLe6TBJiVOfZ4Q+A7ikb5DGKliRHyiJeADvIXiR5CFekZ3jIxB/6d/TZUl
         IF9ChrGr/e9/4Y1f/yboGbRTpJJgCiH/l3uuIO3XPBv+cSAs6nxGXzVvllnTWtvCZ16a
         sDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+N+N/3iRKVrfEHVPUQcucmLszQ7ytIQTEiwcco5Pois=;
        fh=9n/Cm2KnMX6Qk7SoVbKt4LcEa/gSBuZo6NwnCSpbrp4=;
        b=EreINMoOjMdEANVNR3iPbGp7W58FgKvqmfasOXJ3kNjt5gIPVZ9P8QGmTV5bgILxLG
         p2HurZKGcLsebcBNeRdG/Cv0FWqNoQhYHuATfit/+vUgZ4T1izwTpkbZg53z3c/uaXT6
         o9D/nw4LBROrqEjCfCD+EI7aicQGOyNoqvogvR+y4f06Wo3jptK3jSmbX4QNnv7xBDjc
         RUr+C7LrLTYj1MgwZ8QoOP9T7CREQATa2pjV82rTmWeAweEaU2zs3AkjrN2nYhciR4jd
         b+vC7loVbJC7nySuFWPMrAWMHfw+GO23uswFKHR3v1R0+Ia+5zTsZWh+frY3eNxPzxQc
         OkIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HzCyS+Do;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v14-20020adfa1ce000000b0030fcaa3eff8sor2957562wrv.9.2023.09.18.03.17.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 03:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HzCyS+Do;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695032268; x=1695637068; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N+N/3iRKVrfEHVPUQcucmLszQ7ytIQTEiwcco5Pois=;
        b=HzCyS+DoV2hDtZ8ex1fTr6raMML5VEq1ckHLNinJ2ZWFBAb2GbYyOMwJDfdLKk06Di
         +uHf8LK9LwqeFgDLiyGr1CpYzYsFIqp0eM8+BMm26vGEWT3mxcS2RLTY8CPbKnYeRsz0
         stT7QwCA/e58x5CZDRxbX3YBWZNZNtdk72hgEn4nn1hLKJ6pbAETgFN2S9deDXWFcbhv
         GY+N3hDAV9QjJtA8cW97oBLfe/lwiJDDAXqnwQZzRFApfz1K6RxgyAKX4yggtoWd26W0
         pPCOjRmxnMEzHcV1ADqVkj9hhmrcZygUxrjOYyFyR5WJkD8+Ep3AqvzrC9LcYXvUbFg5
         F7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695032268; x=1695637068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+N+N/3iRKVrfEHVPUQcucmLszQ7ytIQTEiwcco5Pois=;
        b=aIo7j/ybexdmb4A8tEE1Y2F1t6Rf0vmg4LJwEv/v0kcutq/HX+R/w/wtBbSD/LVvt3
         U15CIDlJ4PkD6d++DxEt3pBEP+A/inFMhsANqH1skXhY6PTYCvlj3aWjjMMeYvv1VkwF
         z2KgwCVegiNNkKFWDDg/sLKA6H5gLEWJs7svHwiQ+7cS0SZ5EHWJVMBUobAo/ZKR5J0q
         ywpEKF32aaHhJ+o4GN3RQYOQnxh78j3BO2yLHkpmsPrNBkDPG7oi47J64p3bb27LhaAP
         RYhrSaVeQZdVVW08doYOvQo+MTAAL4FG0Ohu0geI1iKstNcfuVLgpQYxoKiLMlj+mdcg
         c3Ow==
X-Gm-Message-State: AOJu0YyxO8a5dia0Y427fv25UzHe5xCGTaUJpe8+t47/m7z2H+1wEon6
	99MPd/EmZN8zKeM0//Zlw353iuO9
X-Google-Smtp-Source: AGHT+IHWMSpr0y6MCVX2hooNyuRT1fVi428WYsZ88A7x03zFL0krS2oMP2+1KEjkccO2CaSgsJp+4Q==
X-Received: by 2002:a05:6000:703:b0:320:121:2300 with SMTP id bs3-20020a056000070300b0032001212300mr5316225wrb.1.1695032268227;
        Mon, 18 Sep 2023 03:17:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (5.red-88-29-175.dynamicip.rima-tde.net. [88.29.175.5])
        by smtp.gmail.com with ESMTPSA id z2-20020adfd0c2000000b0030ada01ca78sm1139386wrh.10.2023.09.18.03.17.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 03:17:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alistair Francis <alistair@alistair23.me>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Bernhard Beschow <shentey@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alessandro Di Federico <ale@rev.ng>,
	qemu-arm@nongnu.org,
	Luc Michel <luc@lmichel.fr>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] hw/sd/omap_mmc: Do not reset SDCard until being fully realized
Date: Mon, 18 Sep 2023 12:17:35 +0200
Message-ID: <20230918101736.23905-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918101736.23905-1-philmd@linaro.org>
References: <20230918101736.23905-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YRuMuxEwAyoe

We shouldn't call QDev DeviceReset() before DeviceRealize().

Since the OMAP MMC model is not QDev'ified, it has to manually
call the SDCard reset() handler. This breaks QDev assumptions
that DeviceReset() is never called before a device is fully
realized. In order to avoid that, pass a 'realized' argument
to omap_mmc_reset(). All cases are explicit manual resets,
except in omap_mmc_write() where we expect the sdcard to be
realized.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/omap.h |  2 +-
 hw/arm/omap1.c        |  2 +-
 hw/arm/omap2.c        |  2 +-
 hw/sd/omap_mmc.c      | 21 ++++++++++++---------
 4 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 067e9419f7..d331467946 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -808,7 +808,7 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
 struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
                 BlockBackend *blk, qemu_irq irq, qemu_irq dma[],
                 omap_clk fclk, omap_clk iclk);
-void omap_mmc_reset(struct omap_mmc_s *s);
+void omap_mmc_reset(struct omap_mmc_s *s, bool realized);
 void omap_mmc_handlers(struct omap_mmc_s *s, qemu_irq ro, qemu_irq cover);
 void omap_mmc_enable(struct omap_mmc_s *s, int enable);
 
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index d5438156ee..3afeba6f86 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -3728,7 +3728,7 @@ static void omap1_mpu_reset(void *opaque)
     omap_uart_reset(mpu->uart[0]);
     omap_uart_reset(mpu->uart[1]);
     omap_uart_reset(mpu->uart[2]);
-    omap_mmc_reset(mpu->mmc);
+    omap_mmc_reset(mpu->mmc, false);
     omap_mpuio_reset(mpu->mpuio);
     omap_uwire_reset(mpu->microwire);
     omap_pwl_reset(mpu->pwl);
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index d5a2ae7af6..ef9b0dd60a 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -2253,7 +2253,7 @@ static void omap2_mpu_reset(void *opaque)
     omap_uart_reset(mpu->uart[0]);
     omap_uart_reset(mpu->uart[1]);
     omap_uart_reset(mpu->uart[2]);
-    omap_mmc_reset(mpu->mmc);
+    omap_mmc_reset(mpu->mmc, false);
     omap_mcspi_reset(mpu->mcspi[0]);
     omap_mcspi_reset(mpu->mcspi[1]);
     cpu_reset(CPU(mpu->cpu));
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index edd3cf2a1e..3c906993eb 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -287,7 +287,7 @@ static void omap_mmc_pseudo_reset(struct omap_mmc_s *host)
     host->fifo_len = 0;
 }
 
-void omap_mmc_reset(struct omap_mmc_s *host)
+void omap_mmc_reset(struct omap_mmc_s *host, bool realized)
 {
     host->last_cmd = 0;
     memset(host->rsp, 0, sizeof(host->rsp));
@@ -314,11 +314,14 @@ void omap_mmc_reset(struct omap_mmc_s *host)
 
     omap_mmc_pseudo_reset(host);
 
-    /* Since we're still using the legacy SD API the card is not plugged
-     * into any bus, and we must reset it manually. When omap_mmc is
-     * QOMified this must move into the QOM reset function.
-     */
-    device_cold_reset(DEVICE(host->card));
+    if (realized) {
+        /*
+         * Since we're still using the legacy SD API the card is not plugged
+         * into any bus, and we must reset it manually. When omap_mmc is
+         * QOMified this must move into the QOM reset function.
+         */
+        device_cold_reset(DEVICE(host->card));
+    }
 }
 
 static uint64_t omap_mmc_read(void *opaque, hwaddr offset, unsigned size)
@@ -556,7 +559,7 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
         break;
     case 0x64:	/* MMC_SYSC */
         if (value & (1 << 2))					/* SRTS */
-            omap_mmc_reset(s);
+            omap_mmc_reset(s, true);
         break;
     case 0x68:	/* MMC_SYSS */
         OMAP_RO_REG(offset);
@@ -613,7 +616,7 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
         exit(1);
     }
 
-    omap_mmc_reset(s);
+    omap_mmc_reset(s, false);
 
     return s;
 }
@@ -643,7 +646,7 @@ struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
     s->cdet = qemu_allocate_irq(omap_mmc_cover_cb, s, 0);
     sd_set_cb(s->card, NULL, s->cdet);
 
-    omap_mmc_reset(s);
+    omap_mmc_reset(s, false);
 
     return s;
 }
-- 
2.41.0
