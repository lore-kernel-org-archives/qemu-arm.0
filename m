Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CD1CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:24:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfqh-0008Tq-AP; Mon, 05 Oct 2026 06:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmn-0002Of-Lf
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:19:14 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmj-00013q-Ar
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:19:09 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6350f91so717154f8f.1
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195542; x=1791800342; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3Bx/gBQbJwyEOeNleYcut8SB9gX8DfSUE1/YplwZCUY=;
 b=hh0qoYL12xShSL8VUmTHmCf0//hHHM4c3aOXAGChTezqDl9DC2SGwnkgITCzVJ28P3
 7TrGe1y/BXLmOlXDMF1XKiQWWsvUQ8HEvKvADhRb163vR6FcLIQKYIVG0rHxlDD6yR/6
 VJAyvMw74TojcW/hB0IkOmG0PSpe0F8EEFLe9o6tCNvNZOmUV/CAwrrBiyyPIQMiWYyN
 pCI908G8gqFHo1lx+0b/bmFzxdZLgkkwKxEXUr1z4PmaHhyAxwBcAIyiFXC5ezw5oMKE
 xwbZFDuA4P7wHEOsMfWL/O9Gyy5iLYgp5UHKGEo/dpa+MapFbOI0aIVWSHsv+0DgoU/n
 C3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195542; x=1791800342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3Bx/gBQbJwyEOeNleYcut8SB9gX8DfSUE1/YplwZCUY=;
 b=sM1NP4N+Ha54LCtB3u+iCNHVcUBL9FDMVb+dLllytIRsnFuqTi+ic0qZGiWSmvgttT
 P0OkNZM+tuweiFMufgs7ACi+h5he49prXtaqRopuIuHwxReC7RDvqthadqdB7URmnbQS
 e+YT9j4HjUziet56Zr1JjLv6FK3E8cnZamNdemKRFAB8t2jtoOJ7yeB3zbhJCxtVlMZD
 bvDV0YLKoVyf7RgxbQv/Rd6JH3wu/Qdr87p4fP7obSr/bCrVVeMa9gUoB3JqUXiOEO0v
 aFH2Q8sFrapweId4Cjc8olUHnzxdkfTwv9Iv8nZzP6r4zVsSHz6yjwR1Rdxcl7sZEEMB
 lkTw==
X-Forwarded-Encrypted: i=1;
 AKwUvByuoEPVn+1Ul6maVjAKq+0dApbGO52BNpRZ4OfSF68YcYG1aXpYwnQVlFeDOYKNuTpBK+JtEBEbCg==@nongnu.org
X-Gm-Message-State: AFq9FYISIL///pi9L+nFz/NdRJwYsACSA1zCFSIAVnqBQqpYmvI5o6V0
 m2hKfj8idqYNacxgwyGrCMKM+G6qmDB8YDe5FwJlRpcAFHOi/qK3JgkE
X-Gm-Gg: AYBFou2SuhEfRrB7CQhwLwyXqycnsU2WG4KMynazci7zw5bhlt/4PRmYWIwR5KfeS3d
 uug5TsD+WzXrgwr7Vm+PsM3oUpcg5F3Tj2nZxv6g33n8QHWKdXTSV+8DtJLeFOb5IN5eI+9PfY3
 OCrL0p3psLa9I+6hTcpo8vkgjjlr9UxGsllt+XwfxZePp/f+5DqnxHt4QYZ16CrokXKcNGB+H3k
 j7FMKqRiscsK0vZOFLBz1KwOTCaOLdk9LiYpTLCmJVseaumd+mI3nAiv+r7BDTcMoKdM/PR3473
 g/kSXdBNCd/7TtSy880hltX+LhPzW/MzEu/oCBPqUl4aZjMwueSjO87Pq0vaYrdpEO1GZU5EZMd
 Rell1SV5HN7B/Mqf9/AZFsIzg0byaU+EMvnlPCYoSczz2B6f4ULjQlO1BfvO0BgdqgDMj/uVS2l
 DjHn+0CEIGRJW2E9jaMMJXIOz7ALdXWgbqNozFHBBzHAuSo0VfnglHe5zqtxiKAEBH3/zQ6T4aZ
 2jw8W21wcnHZtt2GzdhflfRJiRLHRHs+MML9+E=
X-Received: by 2002:a05:6000:c7:b0:48b:50e:5dc6 with SMTP id
 ffacd0b85a97d-48b12763406mr12855633f8f.34.1791195541899; 
 Mon, 05 Oct 2026 03:19:01 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:19:01 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 29/31] Kconfig: Extract config IMX_SERIAL from config IMX
Date: Mon,  5 Oct 2026 12:17:56 +0200
Message-ID: <20261005101800.10821-30-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Over time, QEMU has grown a number of i.MX boards and the monolithic
config IMX drags in unneeded dependencies into each SoC model. Extract
config IMX_SERIAL to eventually eliminate config IMX.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 7 +++++++
 hw/char/Kconfig     | 3 +++
 hw/char/meson.build | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3f502685f4..543220be6b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -488,6 +488,7 @@ config FSL_IMX25
     select IMX_GPT
     select IMX_I2C
     select IMX_RNG
+    select IMX_SERIAL
     select USB_CHIPIDEA
     select WDT_IMX2
     select SDHCI
@@ -505,6 +506,7 @@ config FSL_IMX31
     select IMX_EPIT
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select WDT_IMX2
     select LAN9118
 
@@ -522,6 +524,7 @@ config FSL_IMX6
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select IMX_SPI
     select IMX_USBPHY
     select CAN_FLEXCAN
@@ -605,6 +608,7 @@ config FSL_IMX7
     select IMX_GPCV2
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select IMX_SPI
     select WDT_IMX2
     select PCI_EXPRESS_DESIGNWARE
@@ -627,6 +631,7 @@ config FSL_IMX8MP
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select IMX_SPI
     select OR_IRQ
     select PCI_EXPRESS_DESIGNWARE
@@ -656,6 +661,7 @@ config FSL_IMX8MM
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select IMX_SPI
     select OR_IRQ
     select SDHCI
@@ -701,6 +707,7 @@ config FSL_IMX6UL
     select IMX_GPCV2
     select IMX_GPT
     select IMX_I2C
+    select IMX_SERIAL
     select IMX_SPI
     select IMX_USBPHY
     select WDT_IMX2
diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 020c0a84bb..54f9936534 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -48,6 +48,9 @@ config VIRTIO_SERIAL
     default y
     depends on VIRTIO
 
+config IMX_SERIAL
+    bool
+
 config MAX78000_UART
     bool
 
diff --git a/hw/char/meson.build b/hw/char/meson.build
index fc3d7ee506..65351c39de 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -3,7 +3,7 @@ system_ss.add(when: 'CONFIG_CMSDK_APB_UART', if_true: files('cmsdk-apb-uart.c'))
 system_ss.add(when: 'CONFIG_ESCC', if_true: files('escc.c'))
 system_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_apbuart.c'))
 system_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_uart.c'))
-system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_serial.c'))
+system_ss.add(when: 'CONFIG_IMX_SERIAL', if_true: files('imx_serial.c'))
 system_ss.add(when: 'CONFIG_IP_OCTAL_232', if_true: files('ipoctal232.c'))
 system_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
 system_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
-- 
2.56.0


