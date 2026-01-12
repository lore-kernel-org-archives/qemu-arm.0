Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C74C9EC97
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 15:01:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJJm-0007nP-Ej; Mon, 12 Jan 2026 09:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJj-0007ka-8r
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:51 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJf-0001Yx-HT
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:50 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b8722834679so115520966b.0
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768229686; x=1768834486; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FukVwTxoJHIN3FNbcOHO2weFoJlsrxf5RmTepg8qvQg=;
 b=KhkhYIkUkZDRe4vrPe32L6ODkp9qM/CaKkJTekNl4ju3xkeRltXI37rHRlSCX+Bt6G
 0MwD73JqXw8z8PPZJ/VKA5SsCQe5oUnAsGAMyBhsw6mGu4eZF784UxXTd/w38xqEcWBl
 LnZEm5T4uQG/rj1C6+EpSHz/7ihfo+pWNJZ793lPOfpwSL0hGSj/2fpazmDqHVzivXgj
 T+VelILRcUjDuVC9dMcamoNCKYzUEaDCEMZ2K1ea2hCeFkDjZgS57QhjqR/hXEKYhZRO
 7Qx7BKi+eu4iFlv7MiaFCHaALJEm8EwoK5L9H+21yrHQ8bY9cKoOFbHFJ40jhC+uQKEX
 fXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229686; x=1768834486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FukVwTxoJHIN3FNbcOHO2weFoJlsrxf5RmTepg8qvQg=;
 b=M5em7QOa6JvrlSe5TS8UMhxGUhCNVhm7wQrdFMCOVoe+xgi56jovy0DL9TdFqf6Iko
 yPJZ/s0OTcAcgPd67/7QCB7O9f4ujRi2MTWBnch/H1enMFfkNn7rhgVmGHSl5FP9mmHP
 rYMBYRJJBcCek/+U9q7BkO9C2sUDRsACGxM6vvaN22kmAa3klEM1oM2sDoesyfbYmQQd
 V6olJClBCyNbICHa8BcuU8rUkPrlzYDXfNGPpTnr2CmMe3dM5zEX7kMAQEOD5Ku+VB17
 pz9rabN5715sF2kBSA4+JH4GDb5xyIgBA7eqjxyBpfYYde4M4bzEqdr6pqsfqjEtx0p5
 pMyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEb8NOa4huZdjW/YEO84EaKAXPqcPpGfkOthE7vHjUMjFIGganUbSZXHzqdIt+utCiliG/XYtzPQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy9pAPuSDO80yNYAKD561c7TIM9ReqJr4KzyA+vLym9JpVRa8WE
 jsySIpIeoB9BROzwUNDVaE+GtrE8IaqoGLtBLgeJIC07pW3DkmJYwYbC
X-Gm-Gg: AY/fxX72M5h8PR0iKIBr9dI0FSz+hF6O8rQjf8wjcsNpKB0AUREFq2SbMN/xfZnn63b
 yESKBcExiKM1Jp/AjekJeoZCPyzYNm8BDkW1F6ubkIxHDFevGBBzSboZh5c/saAK+ZnjE3EVB9l
 y0G0B63zlyq+GQggzy8RnTvd298IIniXAcCiQoNXrWRiLxxICEIeI9ZhNbYKgRyrTydRy5iZgDK
 b+eyJcs7nyUbtsoLFJUUwldKjBWPAEjHlX+mZECyAbGUV+H090ncoz1QZThTZz1VHi2qzJ1WgZB
 8b6qCxDQl9yNfpgXzmDYBPjvXLAeacQMdN4mCUIDNmeFlcwusNnNTV8nLNElxzizoZrE4tqavg+
 QlSpBHyyZLtXvgD8pkbs33JkHPIY0ziUkFykIdw/dux1FAcSJ49+pqV2NHskyGq20Hm7E54sesL
 XZCaSy3S43LNRt/nkXfHUpfRgGW4duDipSN5CHzUsGbrEcE0HYTy/D35ovrAR24lSFHJJT0cIb
X-Google-Smtp-Source: AGHT+IEyXT6Z2o39BteTzkxetNHbnp+sLXbZ+aq+UjAQcUtQp+l2biGMItp19RwvYrc73lEUdbJANA==
X-Received: by 2002:a17:906:ef0d:b0:b76:bcf5:a38a with SMTP id
 a640c23a62f3a-b8444b8adafmr1794843066b.0.1768229685983; 
 Mon, 12 Jan 2026 06:54:45 -0800 (PST)
Received: from archlinux (dynamic-077-188-226-222.77.188.pool.telefonica.de.
 [77.188.226.222]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f0718asm37387966b.67.2026.01.12.06.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:54:45 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 08/14] hw/sd/sdhci: Add TYPE_FSL_ESDHC_BE
Date: Mon, 12 Jan 2026 15:54:12 +0100
Message-ID: <20260112145418.220506-9-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145418.220506-1-shentey@gmail.com>
References: <20260112145418.220506-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

For now, TYPE_FSL_ESDHC_BE is basically a big-endian variant of
TYPE_IMX_USDHC. It will be used in the e500 machines in the next step which
prevents Linux to flood the console with "mmc0: Internal clock never
stabilised" messages.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/sd/sdhci.h |  2 ++
 hw/sd/sdhci.c         | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 32962c210d..3eb0684a89 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -128,6 +128,8 @@ DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
 DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
                          TYPE_SYSBUS_SDHCI)
 
+#define TYPE_FSL_ESDHC_BE "fsl-esdhc-be"
+
 #define TYPE_IMX_USDHC "imx-usdhc"
 
 #define TYPE_S3C_SDHCI "s3c-sdhci"
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 531dd3c291..6277abe870 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1871,6 +1871,32 @@ esdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
     }
 }
 
+static const MemoryRegionOps esdhc_mmio_be_ops = {
+    .read = esdhc_read,
+    .write = esdhc_write,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+        .unaligned = false
+    },
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void fsl_esdhc_be_init(Object *obj)
+{
+    SDHCIState *s = SYSBUS_SDHCI(obj);
+    DeviceState *dev = DEVICE(obj);
+
+    s->io_ops = &esdhc_mmio_be_ops;
+    s->quirks = SDHCI_QUIRK_NO_BUSY_IRQ;
+    qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+    qdev_prop_set_uint8(dev, "vendor", SDHCI_VENDOR_FSL);
+}
+
 static const MemoryRegionOps usdhc_mmio_ops = {
     .read = esdhc_read,
     .write = esdhc_write,
@@ -1965,6 +1991,11 @@ static const TypeInfo sdhci_types[] = {
         .instance_finalize = sdhci_sysbus_finalize,
         .class_init = sdhci_sysbus_class_init,
     },
+    {
+        .name = TYPE_FSL_ESDHC_BE,
+        .parent = TYPE_SYSBUS_SDHCI,
+        .instance_init = fsl_esdhc_be_init,
+    },
     {
         .name = TYPE_IMX_USDHC,
         .parent = TYPE_SYSBUS_SDHCI,
-- 
2.52.0


