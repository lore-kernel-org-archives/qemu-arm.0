Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp533322ejx;
        Wed, 22 Nov 2023 10:31:44 -0800 (PST)
X-Received: by 2002:a2e:990f:0:b0:2c6:f711:cea1 with SMTP id v15-20020a2e990f000000b002c6f711cea1mr2257512lji.39.1700677904204;
        Wed, 22 Nov 2023 10:31:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677904; cv=none;
        d=google.com; s=arc-20160816;
        b=s5VM0lNitCWDHoVQ36JVBkjVsaASuKz3nhxauJtdCn0EpB4v99sJj5Y0Zu/heVUHxy
         8qh/Kmf5tWPWpP5wDmmKg2otmfNl/bnbxhTt7DEbsYELwhfHTONUD3QIBEMZHYg2pYq9
         0YDut6kVMsEAHYkcJvAwPx9/Lnqp4b86pK3/ehWq6K1WULzesRkAcmsCmZu/ojpsxCyv
         HkmPjAhNe+AuzqMVdpMFlAPhU6XI67Le2FYby4vHyfq9/fPCBidyZ0WDEOitiSP58Zvw
         6Ef5+i/DCTyyQ3xFqdM3AHuOF8ma80XOtakCiwjgnXZJWj03lLTLmCpRyBbmE48i06lp
         fmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Xw/8eweOyz7I3htVuJ6jfziPhJMt4cQLEajxgFqYUSs=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=ojcd1xSlwCZr7SPiP3Pmn4UIoQ+IyIhPdr4WOmGQ9IC8UjL8lVe+pIQ9W2OareMh8Q
         +vQo9VS6K+Fd+n40PL4OZtKVrG2UWiT8XJjAu3cjzBbp5fI8pQ5zXnOrGQE35Yc1dNxb
         JmUiAd8MPMd6UzM8kfrjm2E8xIxLdiv+zrWXrdw7WbfIdjdwDdLqsXlK0mKxS7gfM3fQ
         Ofitu8MN9gp2LSuAqwbgiF1eX86Hm2IOw+b+6oV9rjLaTPWoxjmEJieCGWLdFlYQ6Y2i
         gAiDdvY9V7Q7Q3s5GBMZO1iUaQm1Ik8hqoOWp/ppqF/yCtbhMZlyQAavbrAeH1b0xj0p
         MKlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PiSkjnda;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a12-20020a05600c348c00b0040a4359189esor24677wmq.9.2023.11.22.10.31.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:31:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PiSkjnda;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677904; x=1701282704; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw/8eweOyz7I3htVuJ6jfziPhJMt4cQLEajxgFqYUSs=;
        b=PiSkjndagvj8xahbcnj/JYncOslAQH+JVoAQjwL4o44QMW6NykL+4RVk2cd/C96EH0
         a+e6We5YMbbVpa8OPjOwJLDflE8LQcBI+DzZSESp0/rwgRPhC9yPH8h0C8wvliit849/
         IDykFKE0BzMPe8V1lkF/5fvmV0W8YJLOQ3e8wcmVeEZ2X8tMpXZh2bx4q2h2ZgWYAYUI
         o5k6MhRwhnOcYsJkftW13DkZb1qSmzhxA2GOB84xH1FHQz5E3phn1iDf9kZ2hNcLnlOd
         qQreqDCwV+SDJSkOXb9KnhYPGPxio8LEnfBLS7ey+PdbJBhoh8ljnB4LMwvfAhggdSIL
         9liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677904; x=1701282704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xw/8eweOyz7I3htVuJ6jfziPhJMt4cQLEajxgFqYUSs=;
        b=VVvzSh35H/peU0+msjg1FAFOVCMs812pC8aGYigaLBrAfbvyFnI9zuH1Ylvy3RdnB6
         sOkpxmmUzOQDx5YgqEeSOa4QWb+rB2lDP/k+zPY9wV6WTDSZDcwpBuX78mGCHEKHaSVa
         hQzTzyas0BI3FxDvNyPdB04F/tdjJAbMkb//pHIUBknnCDvHtySjUGOpbDAxxOY/Rd58
         KW2HSDpHXuevYL+jrDTlkSh1nuTloH9ux6jOQtzvatK89o74+i3XZ3DjUEbzS4IISi6G
         pSCHmz6SuhX8ZJ6oSw9Q08/FEHEi62qqqBGSa+G7xsEoTCqu/Dj+n2zuzbmwx/QhcKDd
         gdhg==
X-Gm-Message-State: AOJu0YxCOep3kaXqC3n6YI/cG6KPmDPYL+4YJtIKFHsuZPX1WN9t/BsR
	yW79tDps0Tz9RdLinSFqr48DVbn2
X-Google-Smtp-Source: AGHT+IHEvpExXkkInrxw0CF5q6L6pfzIb5pjEjT/+Avi6nIuMN4o6urEqM0Ex8MQNVh19sVnhpRmvQ==
X-Received: by 2002:a05:600c:35c6:b0:405:4002:825a with SMTP id r6-20020a05600c35c600b004054002825amr2690978wmq.13.1700677903888;
        Wed, 22 Nov 2023 10:31:43 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id hg15-20020a05600c538f00b0040849ce7116sm242754wmb.43.2023.11.22.10.31.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:31:43 -0800 (PST)
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
Subject: [RFC PATCH-for-9.0 10/11] hw/arm/raspi: Build bcm2836.o and raspi.o objects once
Date: Wed, 22 Nov 2023 19:30:46 +0100
Message-ID: <20231122183048.17150-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122183048.17150-1-philmd@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SBdxaoZa9hUg

Use the target_aarch64_available() method to restrict
Aarch64 specific models. They will only be added at runtime
if TARGET_AARCH64 is built in.

The Raspberry Pi models can now be built once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/bcm2836.c   | 5 +----
 hw/arm/raspi.c     | 6 ++----
 hw/arm/meson.build | 6 ++++--
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 4f5acee77e..ecf434c8ce 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -194,7 +194,6 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
     dc->realize = bcm2836_realize;
 };
 
-#ifdef TARGET_AARCH64
 static void bcm2837_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -207,7 +206,6 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
     bc->clusterid = 0x0;
     dc->realize = bcm2836_realize;
 };
-#endif
 
 static const TypeInfo bcm283x_types[] = {
     {
@@ -218,12 +216,11 @@ static const TypeInfo bcm283x_types[] = {
         .name           = TYPE_BCM2836,
         .parent         = TYPE_BCM283X,
         .class_init     = bcm2836_class_init,
-#ifdef TARGET_AARCH64
     }, {
         .name           = TYPE_BCM2837,
         .parent         = TYPE_BCM283X,
         .class_init     = bcm2837_class_init,
-#endif
+        .can_register   = target_aarch64_available,
     }, {
         .name           = TYPE_BCM283X,
         .parent         = TYPE_DEVICE,
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 01c391b90a..979937b9ac 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -349,7 +349,6 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
 
-#ifdef TARGET_AARCH64
 static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -367,7 +366,6 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
     rmc->board_rev = 0xa02082;
     raspi_machine_class_common_init(mc, rmc->board_rev);
 };
-#endif /* TARGET_AARCH64 */
 
 static const TypeInfo raspi_machine_types[] = {
     {
@@ -382,16 +380,16 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi2b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi2b_machine_class_init,
-#ifdef TARGET_AARCH64
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3ap"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3ap_machine_class_init,
+        .can_register   = target_aarch64_available,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3b_machine_class_init,
-#endif
+        .can_register   = target_aarch64_available,
     }, {
         .name           = TYPE_RASPI_MACHINE,
         .parent         = TYPE_MACHINE,
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 68245d3ad1..15d60685d0 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -38,7 +38,6 @@ arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40.c', 'bananapi_m2u.c'))
-arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
@@ -68,7 +67,10 @@ arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
-system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+system_ss.add(when: 'CONFIG_RASPI', if_true: files(
+  'bcm2835_peripherals.c',
+  'bcm2836.c',
+  'raspi.c'))
 system_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
 
 hw_arch += {'arm': arm_ss}
-- 
2.41.0
