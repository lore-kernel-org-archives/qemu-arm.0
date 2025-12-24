Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CC2E75453
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 13:47:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYPCo-0006Br-Q0; Wed, 24 Dec 2025 08:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPCh-00069R-Bx
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 08:47:04 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPCc-0003fP-BB
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 08:47:02 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42fb2314eb0so4393119f8f.2
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 05:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766584016; x=1767188816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/HatAXwMGekb8ws77keU2ufaJzveuprS4Y82gBiI7wk=;
 b=uphasc+o/gWoU+YqAUTLLHUJV/ROVbxETmn/3Dqe23EjyMpNPc5UtsLhASkAsw+lYN
 pyGSeWAN/CM2OAWYzw0ZIP2H4ZfbcqvErYApN6nXZzYY6Z+XO/vH1k78OY3k1xZe3LC7
 l/35jx0qbUVgZSw5u4srs6WvrReTyufMU6b5COyMaglyDcQCmsIv3ykWtji9fe2Y2KVn
 d6g6YzINnTfPKJG3AKx1kcpDFW4OfPMNTbaeVHMVdk8b7YUq6jhQKXuzzrEUNhqovsFC
 7ul4r9BWugJZRJPBzGEyO0vd1hkR0lRiGFR60bxBujVh0scm3Cs+CEqGVn68vzCXlPfW
 IyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766584016; x=1767188816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/HatAXwMGekb8ws77keU2ufaJzveuprS4Y82gBiI7wk=;
 b=vgfzIZu9ObzWXWMIP4ZST6Zn+9jlT2LkVOT08MZnG+8QcQv4s6aGqbYk+jQwS/aIG9
 4t86ffZ886uU1S28UyZiao83GEn0Ff6q3P59U6EGdlGWJrhhhNNqzb8w/lAU6Vx5CMLe
 XDAoadKdRFZjNFKf7+m1em6++AlSosOl1CKBbrruCZvL85hIjR+tkJfYW0lmxpPAtl9f
 wcVgCPUJB8DjIQZa8Zr6J2tF5NC1aFk7AyR3M7EA4nZUgMs9pWU2WIMfdijRq63m5yJq
 MqNykYfRepIxP3cw046z6RXbucvuDOoMJZeCnclqxXcYSsYJiZUAatVYUc0Or9AkhRM5
 vWPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8soHQ1plXYThuhcQ1xIw3VG/+OXljPqwMWcea0uENEOxKIFXq2toPiG+j9gqCUGDxLgK1s+ap4Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx/M6w3Tv7OvevGjkyoJSrVK5NvIiBQc2T4ez+7WmE+SrAlFfRY
 5o0NhR4nO+95LY9yRnuntMB/6hYjt/oLioo8hU65G3bOqCaMxaAHQ9Unt6ULk8nFf6w=
X-Gm-Gg: AY/fxX58oJ4qL4f4IE0PI06nsDfI6+Uz7aB8VMqmQOs6hG/4eLfza9Xr3PeFm2reHCx
 sNsVaLhZDIBlHDN3IIeCG2J6vBmyo02dlFmZkegiiZCVZ9iD/kOzrZgQkBXs1iwVbQWbBYtk8y7
 /SbOmQtd28V8B6nCV7RUe/TZ86eQX3iQeiMzDtNXpqpKCP3pN9Mir+i0U2rgyxbA/gQ9uowRwdg
 r7Yq/200NAJw/8MyzKlQvy0fc5+fDrFcrW4+23G+OPH4TJy7Si3C3h+TaM+WbKn2WWtqwZIDeRr
 j+k69Xrgl+RUBjihh+z+PMfmSbD07lQ8M9q7ZvAyGoB5GNS/fCctqfrpFmBuOW3b22SQyRQ+YOq
 HTHKa4wLNBRh1xPI14BoWMTewG/RT9uV5zwuHapzlI0c5/KKDNaes/uYT1u5CIlFodCNsFlpeJN
 FDml+as30qN67YB4EeR75OnYe9A1uCoUy7DGnAg8iSV84sO6jOEEg1K7a4638/ElcY4mvC4KM=
X-Google-Smtp-Source: AGHT+IFImcLyhNm02bS1bcJPwE+B5F0pKDwOtrfRI74UcvtYUim28G8m3NZ44HEdlcfeOhDjUMMsXw==
X-Received: by 2002:a05:6000:26c3:b0:42f:b581:c69a with SMTP id
 ffacd0b85a97d-4324e4c3e13mr19199452f8f.5.1766584016267; 
 Wed, 24 Dec 2025 05:46:56 -0800 (PST)
Received: from localhost.localdomain (218.170.88.92.rev.sfr.net.
 [92.88.170.218]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4327778e27bsm1073363f8f.12.2025.12.24.05.46.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 05:46:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-rust@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Max Filippov <jcmvbkbc@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 1/8] hw/arm/Kconfig: Have FSL_IMX6UL SoC select IMX_USBPHY
Date: Wed, 24 Dec 2025 14:46:37 +0100
Message-ID: <20251224134644.85582-2-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224134644.85582-1-philmd@linaro.org>
References: <20251224134644.85582-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
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


