Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1400085eji;
        Tue, 19 Dec 2023 02:55:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEB/RUTrji71QXOJ4W9Vg66KbAq90MMcZwH1sGZb6ldc1o5B5GNePiI+cIKaLiO7jFqF5Vs
X-Received: by 2002:a05:620a:382:b0:781:75:4ea3 with SMTP id q2-20020a05620a038200b0078100754ea3mr662314qkm.113.1702983351392;
        Tue, 19 Dec 2023 02:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702983351; cv=none;
        d=google.com; s=arc-20160816;
        b=IbYHPx8ZYjvFiQNIDT4tulbLP4EwRisNB+wsYyFV2vGeyyGIRovQYKm2cEWG74D/DU
         9SD4K209r4uHdTfWWtOBuvtiHvbtOoOD2WlneMe2SEacuR6B37LMqSh2HqYo7kaV0fcw
         yv9d0Sm4W0EpoX/8OwEoE6uzfbkHOOJc8n2KQGv0QPI/z3XOwjWffUaBCwe6yOsmCUcp
         NoYurQkfhK0pOcrxpSQ0IyHvoc1Im1KhLBJM569t4Cu+E6arj3+a8T0lsP3FU4d0LS79
         oRm0Hrmt7ib6nXUjXSfHpUDtpYizNn0TNHXxz8VKSgIng5y5ZX1teethzjBZcUJOL2Dv
         gUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=lIRbGwXO6TvwI0IntgDTvlax6D6vei+jQDLXSTHmwHI=;
        fh=iRZvBjYNFikRCMxTsHjYHZF0/bx8HGQ9VfRkjBVh0nc=;
        b=y4lf4eErEmv2v2QzUqeTV/tlM7xhNsSNRfy3CFl3doMsHYEsdWDoblrsZRJqGXqQPv
         KjAgwdmtaChaNXwE+1OTuhZmRHWTiBSdTbXwjf6bLI3owiYJ3pgg3rtsFtoimUmbqCjS
         hkk8ANvJvUR7XEY7OYQ/e5I8cezuf9ZJSeT3k2JUkcgSa/Ppk+Q9zM0LDl/2IUrr6ifD
         1UxpIBnRSJuRIUioX5hgq+H/aIrEZL7BU2BiBY5kokEvoIAI+gzNNDglIYjTBSBN6QyQ
         SEfFZWEsv5HM5+jT6TX9Pt+JgfxI4cnY4qVBqWZNQFG67wgamkZa106uBTCRSYEyqH0i
         EyDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KlP51azA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4-20020a37c404000000b0077dc10f937esi10526qki.485.2023.12.19.02.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 02:55:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KlP51azA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFXlH-0003dx-Cj; Tue, 19 Dec 2023 05:55:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1rFXlE-0003dC-1q; Tue, 19 Dec 2023 05:55:40 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1rFXl8-00082J-Ld; Tue, 19 Dec 2023 05:55:38 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50e384cd6ebso2547621e87.3; 
 Tue, 19 Dec 2023 02:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702983326; x=1703588126; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lIRbGwXO6TvwI0IntgDTvlax6D6vei+jQDLXSTHmwHI=;
 b=KlP51azAP9zkUsdVrHvTf6KJHwzHTMu5C5ccWZAqmVG9UarVsr3v2icwr5abhyfRbt
 ABOx6W0lURqUs2KX+HzDKereY+c7WgBp1i1m0Q86zU+ODwc9YNnWUIOagOzfU6MAYjsK
 XqIIuXRsQ7LTpCFdqpH1z9wagkhLLmQ83IiDDu47HFm5xjuPiuLCBU1Lqs43UCI9MXZl
 ODHkynIyTa+rzhTq6wNbk3OjYZmhN9PM1LCdyKBdi4/cluPxP5TW8B42Gt1yawFghqau
 T1CmAW3RemNA5RAsJObwVw8PVPgwinYzxVxz5ge1XDmQ5G17QI6nDIKz3/yfdI5kMnZG
 Jm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702983326; x=1703588126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lIRbGwXO6TvwI0IntgDTvlax6D6vei+jQDLXSTHmwHI=;
 b=I3oI066zDk9n1p+ZqOkIqaHSGXY4IhASzm5jrT3k0SI5y1GK8Mk+XdhOcWWl/bsARb
 HRR3ZT+2mdRDkFdAdVjjxnxvR6Sbd+T3rTlTWLDx1UmQVIKEkDkOav1F5EKbKOwyyVJ+
 s+6Gf+5HyeIfbMQiiz0BhOLfwqkpG5CrxZDfInX61WxJ+1VWSeOHB7L0iZmSM4FwD9jR
 v9esxUXHDq29bIUgTETJeNkxIg2Hr/JqFmCmW27UWom7JYa+UHDJuzbyH1AfjuchpNcY
 QutKiyo76pt/DA5ZiOx5fLI6IyEgOHvHbm4g18tfp1T8L82JCjRrBblzYNQkudvGyMuy
 axdg==
X-Gm-Message-State: AOJu0YyspiTMXVdDtbnUweGgQrItR2vCIf6nnwplwGAhfwlH6RPW30uO
 +5NZkcrYHhvM9qknuiIdCC4vaR3ecBSld8/7
X-Received: by 2002:a05:6512:4024:b0:50e:4444:b94b with SMTP id
 br36-20020a056512402400b0050e4444b94bmr504873lfb.101.1702983325684; 
 Tue, 19 Dec 2023 02:55:25 -0800 (PST)
Received: from localhost.localdomain ([176.120.189.69])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a056512215000b0050be73a1c27sm3163749lfr.258.2023.12.19.02.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 02:55:25 -0800 (PST)
From: Nikita Ostrenkov <n.ostrenkov@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>
Subject: [PATCH] hw/arm: add cache controller for Freescale i.MX6
Date: Tue, 19 Dec 2023 10:55:10 +0000
Message-Id: <20231219105510.4907-1-n.ostrenkov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=n.ostrenkov@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kINd9C4UxSvE

Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
---
 hw/arm/Kconfig    | 1 +
 hw/arm/fsl-imx6.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3ada335a24..386f06840c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -536,6 +536,7 @@ config FSL_IMX6
     select IMX_I2C
     select IMX_USBPHY
     select WDT_IMX2
+    select PL310  # cache controller
     select SDHCI
 
 config ASPEED_SOC
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 7dc42cbfe6..f56130a7a7 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -154,6 +154,9 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i + smp_cpus,
                            qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_FIQ));
     }
+    
+    /* L2 cache controller */
+    sysbus_create_simple("l2x0", FSL_IMX6_PL310_ADDR, NULL);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->ccm), errp)) {
         return;
-- 
2.34.1

