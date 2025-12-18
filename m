Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACA2D6E2CA
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 17:45:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWI3g-0005vd-Mj; Thu, 18 Dec 2025 12:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWI3g-0005vJ-6p
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 12:45:00 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWI3e-0002aS-M6
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 12:44:59 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso8144135e9.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 09:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766079897; x=1766684697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tctWGQftDCd4SRsokna4tQvQ0aCHU55DsJ38Y3PUBsk=;
 b=lmZrvaNaVCGeOMdTZ/yIJRmZh5pHTBDqZ1gRpXEJI7jtQTDoWO0UPhxxnSHfwfl999
 YCZyvxsiqntmknvexKour10zBOd2JXfyPyRyFiKQNRctypaYs9Q90Jbgwa3Hdxkj+41r
 4l50b6YowFrupLbaLWzbh72pLFgVCmsPHyNkQtm6+aGHn4V1k/va84Y9I55K0VlpHMxP
 Ot1dz8bOwHXTFY5mIm+O83sHzHzVrmHjHoZnDlY8adHZLMSHVNWFIHKgDzwfRjTUNfCt
 yDgiuCLtdN3cnDHUcTmlJlzFMlgoVLacykESo3kd9Zs33GRNTO9wkytLCceIVyGj0aaZ
 Eoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766079897; x=1766684697;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tctWGQftDCd4SRsokna4tQvQ0aCHU55DsJ38Y3PUBsk=;
 b=VPV1MVj2jW16hZroBnwgrhpx8PozLhX04XXi/KC2JKcNfHRjOedbWsbJGtLme5mIyC
 jHzhXjZQqmuUzfDS1hU+vfN+25xdEzcMwKLf7rXINDGxSYZmXxmrZenN6ZoCrbj8y/wK
 X9xZsqMokBvlGyzEZejZI9dnmAL+iNqmYjxvpevyO43PI7yRb/4MTx7wJ6YpGOMqNZso
 VPTCxrJIU0xFvFTYg1NK1wI2+tjnLl7M0dGNriL2thLW+eCskc2aq0lUiR7yEFXTuMgV
 a4f9Kp5DKUr1OofUQ78AsvVH/G+SNtaTBhG1TrFYqDdA210IvfypXrcRTuwByIJdqrrT
 fXug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt/V7WaPSaFuHQrGi+l8DaDlFypbu1p4t5sNkKc82IcRbUEyAc7ltfpaV9OeMwkUOflrbfc7w8pw==@nongnu.org
X-Gm-Message-State: AOJu0Yw6+kfNcnks8dJNPlqyrghNfd1NO0LPIvx0zGX96cVSak0FjgPd
 JtJ1nKbN4mb7BT9XL6APJhJd1NJNssvLrXnMz9wutq1Eh0cDAB7feD7ZOI3qpcnMAC0=
X-Gm-Gg: AY/fxX65MdL2Et3ICYQqEsLjKent0duKwZwLly+41Y2mqBAF4lNpBO0c9fQYQaLvrtv
 FiQW3piuLT8K8kP2LXz4sgtzTehCgGg90heSvg5+Zft6u6VqQCby58GTh5DQoZ1HnvhJMX6ywXx
 M/afg1px251ZZjG0fnG1nkVOIThUyyiST9YBY9T5WxU1rbogSdTIOABOqHKfLYyAkKFkwTJ91UL
 d+2ICHpK33hc/ToYij1TJOhtwBQxJ04R1ttqT4QUBsroqh0jpsxXBitkCCD0LPvlpjDfwTRAV/R
 +N5mkyKqGcPEwWjUCqbN2vedH/AWzIEjZI/0dFep7bzELO6/isyLHJarcufPlkClMFR5MgyvN1W
 h9msabEXnAlqPCVo4zOOO/GwXHgN1RQ4+K/2+iRlOEBxl6pVV/2W4639PRd2Gvqy2n1/sY9GFeA
 cqbImzjyAeSLR7M3WDSwH5MJN2EFnPCw97BB4kxYztcGWQdaCvW4jZ8baclo9y
X-Google-Smtp-Source: AGHT+IHOlFYrVOivb/bqfcGgycqDIu22QHDitbIKgm9W+w47o1zst/eAV4uv5NwHOlO7FwIKABUhFw==
X-Received: by 2002:a05:600c:5307:b0:46e:2815:8568 with SMTP id
 5b1f17b1804b1-47d18bd546amr4905105e9.10.1766079896898; 
 Thu, 18 Dec 2025 09:44:56 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be2724fe8sm71067265e9.1.2025.12.18.09.44.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Dec 2025 09:44:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm/Kconfig: Have FSL_IMX6UL SoC select IMX_USBPHY
Date: Thu, 18 Dec 2025 18:44:55 +0100
Message-ID: <20251218174455.57451-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Since commit 17372bd812d, the SoC used by the mcimx6ul-evk
machine requires the IMX USB PHY component.
As this component is only used by 2 machines, do not select
it by default (it will be automatically  selected when
necessary).

Fixes: 17372bd812d ("hw/arm/fsl-imx6ul: Wire up USB controllers")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/Kconfig | 1 +
 hw/usb/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 78775063840..97d747e2062 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -638,6 +638,7 @@ config FSL_IMX6UL
     select IMX
     select IMX_FEC
     select IMX_I2C
+    select IMX_USBPHY
     select WDT_IMX2
     select SDHCI
     select USB_CHIPIDEA
diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 69c663be52f..de95686720c 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -132,7 +132,6 @@ config USB_CANOKEY
 
 config IMX_USBPHY
     bool
-    default y
     depends on USB
 
 config USB_DWC3
-- 
2.52.0


