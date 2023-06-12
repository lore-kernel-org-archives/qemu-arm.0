Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp168047ejb;
        Mon, 12 Jun 2023 15:36:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ZZpqXcanYHd6Rl2QXdxJ4PwboMOtlLUU3/0DT41WoFaRNLtgf+T7NK2llYbCtr2legTgW
X-Received: by 2002:a05:620a:9049:b0:75e:cec3:1ab1 with SMTP id rl9-20020a05620a904900b0075ecec31ab1mr9329657qkn.0.1686609365344;
        Mon, 12 Jun 2023 15:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686609365; cv=none;
        d=google.com; s=arc-20160816;
        b=flExYMLA1dGUNoKq9rEY5t9LkFRiK74KdAhoUu0dTeSNcUU0tX8NKz+ttgY0MD09LL
         aAMw/J6mMJF0ttZUxNLvoRy7zQ0RaPZUX8E4IBld7pFuDhTC72pPiQt4zn2Ec3c7SyII
         ehpGfu5y0z998G65dEuqfpVRhSKuRNU42L+/dJ9omCn+xjZxZozF28fBSPh8cWsePBho
         WbWBXQv6c2h1YQ42a+wxWL7/TWvQ+dY1ukCMSXc8o6mjBWfXiwh6DhTnIuH1MR3P9epL
         3dBTG1l9OHzTrE9to6nDDZ2lh9C3uX3EGORc26Py2xZGdWMO42MI8hsPobp0x3W+no8C
         XcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qu0YkZGL/goBV8MNatIwrKy50fK2dB6nGF+E/AAnJcw=;
        b=ILyuGVymsyfrvqZfO5pona2hKUDFG6nLZ+wTaRNjhM94zmOzSxDmOAxS8qLeMWQQRe
         18sD94jJbr6EAkhbUaISvX0EDsvxaT1YcyynvVPLtTWdaNUNZNxu2OA+gP0fwAcxAnXu
         rlz8+XlrERV6ta9SLfySPKMEysAWTubuC/GzvNQmQS2Xl3FFCexINIVikg9vq7Zj81sq
         uZ/IOAh0pZ9BxNqL96q7GGSUpNzQ3+m2GkGGhlvpPId2aBFRcKff/u1Pv+60LiOCuMim
         3IrOR2L2mN0Ex1C0zYlmgm495Rk4DNEY1HPeE8m0Hnhc6cLLwFzZTX0Xs0g2gOA+2RTL
         kddg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ohccGuMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pc33-20020a05620a842100b0075d22c1894asi6298088qkn.781.2023.06.12.15.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Jun 2023 15:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ohccGuMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8q8A-0001fD-Rk; Mon, 12 Jun 2023 18:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8q87-0001e2-Uk
 for qemu-arm@nongnu.org; Mon, 12 Jun 2023 18:35:19 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8q86-0007rN-9Z
 for qemu-arm@nongnu.org; Mon, 12 Jun 2023 18:35:19 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5186c90e3bbso886698a12.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jun 2023 15:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686609317; x=1689201317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qu0YkZGL/goBV8MNatIwrKy50fK2dB6nGF+E/AAnJcw=;
 b=ohccGuMzFzrNl9EFwbE5JDyln4H5edIrf2w3BmuLRfV2Ri7GTzBjZ8vxJEDU7wIOrf
 OqxSfqxU9nOIM0P6Qz+lvNF9FjRktJwRnAY/UdyIVmbNPxunJ6zbqKG+Fh9mb3tLyFU+
 njlaOn2vm48okCkw8Vvn2YaJM4xyvxaSLZ3dEemLiftAxsWkube0dZDvDH5GmErslmlz
 1TEMMeKkmeBpyDALN1P4rfYEF7EjrC1Q9ggHsCVy6mbaGS9SR8bZbYNTIRQb7sQbQXxE
 Qhz0kLSsabEYKV2dx5lnegK8oUOJ7qpUHoiBmJiYAt+5YrjzDK/X3QdXD9W+TMpJHzKw
 Lwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686609317; x=1689201317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qu0YkZGL/goBV8MNatIwrKy50fK2dB6nGF+E/AAnJcw=;
 b=iQk7Rrr/kIv5XiKPWL/NrGxKWsLI5PgarL7FNAWXmOyTxtx0ozRHYEUuufupAs0YS8
 PcpCVaWFO9kS+yK4XTUChh21N5093zOUVp4cICaOmweuABexKzw93S6mJ9t01f7jLHet
 /tlKL0fuBuENOY34xCtSRE/XZKcxR+ORI5P/0fZL85f62O8aIzJes9gMaYJOTjZroizh
 hduBLg0VqdeBT4qKHfqcqEnGlkuMsAZiRKv0Y9U1nwUsNXRTlyQIrNn8CLzVS0y82WXI
 s+uiBtFlykiCRwaVfNXkeNirdszsBiORqlz+sm+pA+7SWVwpXAVSLSi7hgavezid6CmQ
 FhIQ==
X-Gm-Message-State: AC+VfDwiEaDAsuhjV9f1phWtxeP02/zj0wz4sOz5yOedPUlYl2pWnV0R
 AyWoflrSrUfGV5OgiKsH4iROncImNq/Ug4ec7ryRpQ==
X-Received: by 2002:a17:907:320b:b0:96a:3e7:b592 with SMTP id
 xg11-20020a170907320b00b0096a03e7b592mr8758313ejb.25.1686609316954; 
 Mon, 12 Jun 2023 15:35:16 -0700 (PDT)
Received: from localhost.localdomain ([185.140.244.249])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a170906069600b0097461a7ebdcsm5753892ejb.82.2023.06.12.15.35.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jun 2023 15:35:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sergey Kambalin <sergey.kambalin@auriga.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 4/4] hw/misc/bcm2835_property: Handle CORE_CLK_ID
 firmware property
Date: Tue, 13 Jun 2023 00:34:56 +0200
Message-Id: <20230612223456.33824-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230612223456.33824-1-philmd@linaro.org>
References: <20230612223456.33824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: deMGAi6KZFJk

From: Sergey Kambalin <sergey.kambalin@auriga.com>

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
Message-Id: <20230531155258.8361-1-sergey.kambalin@auriga.com>
[PMD: Split from bigger patch: 3/4]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
TOCHECK: seems raspi3-specific freq. Use a per-soc freq? Good enough for now?
---
 include/hw/arm/raspi_platform.h | 1 +
 hw/misc/bcm2835_property.c      | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 83f2588fc5..92a317950a 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -173,6 +173,7 @@
 /* Clock rates */
 #define RPI_FIRMWARE_EMMC_CLK_RATE    50000000
 #define RPI_FIRMWARE_UART_CLK_RATE    3000000
+#define RPI_FIRMWARE_CORE_CLK_RATE    350000000
 #define RPI_FIRMWARE_DEFAULT_CLK_RATE 700000000
 
 #endif
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 2e4fe969bf..4ed9faa54a 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -127,6 +127,9 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             case RPI_FIRMWARE_UART_CLK_ID:
                 stl_le_phys(&s->dma_as, value + 16, RPI_FIRMWARE_UART_CLK_RATE);
                 break;
+            case RPI_FIRMWARE_CORE_CLK_ID:
+                stl_le_phys(&s->dma_as, value + 16, RPI_FIRMWARE_CORE_CLK_RATE);
+                break;
             default:
                 stl_le_phys(&s->dma_as, value + 16,
                             RPI_FIRMWARE_DEFAULT_CLK_RATE);
-- 
2.38.1

