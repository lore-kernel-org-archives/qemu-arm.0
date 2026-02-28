Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15458FEE4EF
	for <qemu-arm@archiver.kernel.org>; Sat, 28 Feb 2026 14:15:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vwL6W-00012N-6m; Sat, 28 Feb 2026 09:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johnny1001s000602@gmail.com>)
 id 1vwEPM-0003UU-Av
 for qemu-arm@nongnu.org; Sat, 28 Feb 2026 02:06:36 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <johnny1001s000602@gmail.com>)
 id 1vwEPK-0000Fn-LH
 for qemu-arm@nongnu.org; Sat, 28 Feb 2026 02:06:36 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2ad617d5b80so18410745ad.1
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 23:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772262392; x=1772867192; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=94kto/7UUYI3pBlCDfVKlf4esEqVWPdkqS7EK14PXXE=;
 b=nSo4CrobpXCdwpRi485UZLVvf8BlTfShp05B5QBR1mxa4INGBHyFOIwvjd1XrR3ckP
 8fs34Dd0XmuSJ4ODyvdRQYWkZyqhU/Umhx9tJg2hz0zOSAFlR9QsM6foM9rS5bJa23jI
 OPtNuYRoF4zo3vcQ6vRD72/gjWex9lbuiBdhJRibI1fkY+od1iSw/2AAlxXFSZkRhRgG
 0Y97j0lb5yeqmprVfr79l/RK8gqY53amObg2YB+64dbGh9z6ePXsAVfb1w0Tmmygy6eN
 kVlUEP/79A0YbZPsYfYSqUNkPl/5yp/k4UQikuZ0d50LSc9MIKAxHrV+KYzBPxB1e4E3
 78NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772262392; x=1772867192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94kto/7UUYI3pBlCDfVKlf4esEqVWPdkqS7EK14PXXE=;
 b=u/4OC06w0tHV7VoNQt1YIBwpXeF5HQcacgGXiO5UsTE0ZjijTFbjgpuiChnCksCir3
 2VsS2tXNiBeUjZCNHSIEQe2y8dblxCwHK9oynTE+/pnhivbzjG8WCDHANo5TlymMOLI1
 PzQ1hKIgwRjzZt8O3DgG4DEkmHz42R2ahz5d9/PWnxbHKl4I9wsgS1RbLG6xe8w7bBzj
 SecenrJzRDZuAywc4P6+icCPMTWZSkzCiClH8rxXy2FtU8yHuNw77P3OLZ/ct/ZcN8fI
 SuiVumthS8mGy+7tHU0EMdB948n9ae7qCz6JqLvBQZAy6SPevvFzBr9SOPUvPtOt7yfj
 mHEA==
X-Gm-Message-State: AOJu0YzET9n4A/ZDp+EvGwcQ5ZQhm9Ah73yZxJUtWBPAoZ6y4NoEd8b5
 2rmHCJdlVO34LntQGUuQ/Kwvi1daUREJi8rYjH5Wr4jv44t5RUq6kwaO
X-Gm-Gg: ATEYQzxAAHZSMum0n2B4T6gujRLMwlslywTabWYqm+NA1MdVuJZkYOH8DNSlUIFbxH7
 33INRcdVQXTTHGJ2W+dMRmjjJR+Ogm8BIOTs2ISgWp3J9UFKJ7IxEVeARL3iaOIojUGqs2pNPSW
 zWym7dSfO1px1OEr8BrG4m8b5ykNdM+uQDlwmnygmTB9rmUW8bhUkjubTeA55ozONKp2ItoZLc/
 mCxmDhXc0a9v2nMWZn3mXhCZ//RlbY52VIJf8QLqr63NdgniIsWgsmxaGnP92KtPh4WqtbyOsw0
 IMSsM+fKJeuXXcOHZBzpuzEvEKEeahEQmRRT2MrxhSHxAiaGk4uzEWwhWWyH/0rQgHlyDPiFJoP
 HrPmXPJVazFQUyCyGlvleFJc/QVymPvyRbmGikxWR2Nps24OY9Oe0aMzxImfQpd43sHffvVoWOU
 iAr+J1VXiwYMvh7pxQiU3lGJM1/9risRLvAacHF9ZQdeNhwzL5G8UwkGC6J9+UbXiIpdmXfvvQ4
 u54+lzA2i/0BXFK7LuQsTDyj6bqBl3U6zkRsGQPIg==
X-Received: by 2002:a17:902:f689:b0:2ad:ba80:df62 with SMTP id
 d9443c01a7336-2ae2e480d5cmr61816305ad.37.1772262392367; 
 Fri, 27 Feb 2026 23:06:32 -0800 (PST)
Received: from localhost.localdomain (1-174-203-116.dynamic-ip.hinet.net.
 [1.174.203.116]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5dbaafsm106134035ad.36.2026.02.27.23.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 23:06:31 -0800 (PST)
From: Chisheng Chen <johnny1001s000602@gmail.com>
To: pbonzini@redhat.com,
	peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Chisheng Chen <johnny1001s000602@gmail.com>
Subject: [PATCH] hw/arm: Add missing dependencies for STM32F405 SoC
Date: Sat, 28 Feb 2026 15:06:22 +0800
Message-ID: <20260228070622.2195836-1-johnny1001s000602@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=johnny1001s000602@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 28 Feb 2026 09:15:31 -0500
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The STM32F405 SoC relies on STM32F2xx peripherals (ADC, SPI, TIMER,
USART) and the unimplemented device (UNIMP). However, they are not
selected in Kconfig. This added these dependencies.

Signed-off-by: Chisheng Chen <johnny1001s000602@gmail.com>
---
When using the following command to configure it and 
enabling `CONFIG_OLIMEX_STM32_H405` in `configs/devices/arm-softmmu/default.mak`,
this problem can be found:
```
$ ./configure --target-list=arm-softmmu --without-default-devices
$ ninja -C build
qemu-system-arm: unknown type 'stm32f2xx-usart'
```

This is because the dependencies were not selected in Kconfig.
---
 hw/arm/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c66c452737..65fd8607c8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -403,8 +403,13 @@ config STM32F405_SOC
     select ARM_V7M
     select OR_IRQ
     select STM32_RCC
+    select STM32F2XX_ADC
+    select STM32F2XX_SPI
+    select STM32F2XX_TIMER
+    select STM32F2XX_USART
     select STM32F4XX_SYSCFG
     select STM32F4XX_EXTI
+    select UNIMP
 
 config B_L475E_IOT01A
     bool
-- 
2.43.0


