Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1FFC9EC97
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 15:06:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJKE-0008Vg-PT; Mon, 12 Jan 2026 09:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJp-0007qB-OC
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:55:00 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJk-0001ci-Q9
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:57 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b8712507269so170628866b.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768229691; x=1768834491; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8gA+Ri6T2SgxvAr0I5jL2NjeYKgeXs1ivfULeQGhHhE=;
 b=TDt+2T9NCw7x0I44XfJz+JKR/kSiOAhnphEj3R7DTbAN1J2FaHVsddPtMC0lElY6dy
 6Oi0994laFKz+ZT3Jwy1H6S/5J2V9Bk3qA3KAVi2dxntqojdMqUnuebVIZXDB0KM45gk
 qZ86wV6H6RcUguxJmLsSOlea8ZmIkraIHwgTojY1wQe21i3/OhvHpVt5BivCAHjHrT0q
 p/C+bwDYB3VCaGzsvowjr6nEQoy6OSgdXY6c/eGmopzQGcYWy4BvW55JGfeeecuc/9ko
 vypl9z95jqU3KF/idIdjKghZmIYjJ3LvfJGrjwwltehjX52m8vQZKBQZzwHSkzbCvS6o
 FeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229691; x=1768834491;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8gA+Ri6T2SgxvAr0I5jL2NjeYKgeXs1ivfULeQGhHhE=;
 b=dgzS949LWVDZNH5ULR/7K+a6xJcVIqSAnC/aWK2bXki/OgP6mpcJO60rPlAbK0GHYM
 qNfXGNBylk655f02OzNIZaB8zaIQM6NGbMa6Hjunalz5SB3JIAF71fN9di6XQ6WgonrU
 n9kgYnt18erWxlgFFScmpTuwy/bbyXuaiNIdcxPSpx4gUyYFZfY03ShlKV+y0+5TLBfA
 ZvCml0oQDIno9ooBArkrenyDJihgLX+WW2mc8U2tgtcRL1IeRdVdcwPsuPX6nYSP4BED
 C4fyf8SeQ+Fv3a8WwnFRDnG9TmbqH2WdTLj2yuARhQdldz4C7xiSb1eN/UWAzSkLBLSg
 hSkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSPl9kiGSNvLTHfOxNvpH92QoqpyO4spkIgZ7dOv/2tGqLxPGTHmVbdyDr8fBnpTXuLwY86U5OdA==@nongnu.org
X-Gm-Message-State: AOJu0YzWWVfz9MVTz2YtrWalgzu2aReHDqWWo7iex/Ygv+Wvo3Io5O6J
 +GB+KjVZC0pbqqK1zk+7s6u+rIKCpiZalCEfMSNOYodBAEHS8OE079yK
X-Gm-Gg: AY/fxX5yy2+Nc1kV29SyKYI+nYmmBP8NDt/u93QuMhYJBOS23W4/hfy7yCp+lMdMjNu
 TcXgHoXnU62meeAQHyjpaKaSkE6SN4SU2GAttlihWszQ5O+kDrIHmhtoijkTqWUy6ooWECLF775
 E+H+6d4mhGs+2hTCANPIeXED9agQApGhmg/VQZq7uabFoUl6N5wjQGB5GqggqFl4KFKTOYicQBA
 dJX7KjY7qqyXzKLIg4aTY1yekTzl702nsu1FK2xZQs2VfHKOF+x5nWj8mip91D/PRBsaGVxP32l
 wRvdJ+9dJS3UB/NqimHCLKW6GuIA3r0+BSDHAWytCIkPOxnKXFGcaKQLOuEoysA7iT2eJ9vdLhE
 28OM2Y8soz6dswBJlKCGsucXrrqF83xK719vV+k1egZ2qIdwh2dhW+kPWH+QCGlFiSwGal/Iw5s
 bmo/lTyScfNTUw2D7VGAsZPGC0JbCnPvVKIxDLqnOsqlA5VOa7k73apO+wnEg2bFb2lZvbn+TD
X-Google-Smtp-Source: AGHT+IFWywqkm7qft/zv4Zb5OGV+Kmwvx4nKdLfZGkdQFZZdeennuy3wXrtENGgF0mcISnafMb4Mwg==
X-Received: by 2002:a17:907:6090:b0:b87:2d79:61c with SMTP id
 a640c23a62f3a-b872d7908a9mr129565666b.8.1768229691093; 
 Mon, 12 Jan 2026 06:54:51 -0800 (PST)
Received: from archlinux (dynamic-077-188-226-222.77.188.pool.telefonica.de.
 [77.188.226.222]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f0718asm37387966b.67.2026.01.12.06.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:54:50 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 13/14] hw/sd/sdhci: Remove vendor property
Date: Mon, 12 Jan 2026 15:54:17 +0100
Message-ID: <20260112145418.220506-14-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145418.220506-1-shentey@gmail.com>
References: <20260112145418.220506-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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

Now that there are dedicated eSDHC device models it is possible to replace
the "vendor" property (which is really a device-specific property) with a
dynamic cast, "fishing" out only the device models which shall have the
quirk applied.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/sd/sdhci-internal.h | 1 -
 include/hw/sd/sdhci.h  | 4 ----
 hw/sd/sdhci.c          | 5 ++---
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 50fb746a17..4aeed120bf 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -309,7 +309,6 @@ extern const VMStateDescription sdhci_vmstate;
 #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
     DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
     DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
-    DEFINE_PROP_UINT8("vendor", _state, vendor, SDHCI_VENDOR_NONE), \
     \
     /* Capabilities registers provide information on supported
      * features of this specific host controller implementation */ \
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 51551348cf..a9da6203fc 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -98,7 +98,6 @@ struct SDHCIState {
     uint32_t quirks;
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
-    uint8_t vendor;        /* For vendor specific functionality */
     /*
      * Write Protect pin default active low for detecting SD card
      * to be protected. Set wp_inverted to invert the signal.
@@ -107,9 +106,6 @@ struct SDHCIState {
 };
 typedef struct SDHCIState SDHCIState;
 
-#define SDHCI_VENDOR_NONE       0
-#define SDHCI_VENDOR_FSL        2
-
 /*
  * Controller does not provide transfer-complete interrupt when not
  * busy.
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 3b0a26ef53..d7640b3789 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -307,7 +307,8 @@ static void sdhci_reset(SDHCIState *s)
     s->data_count = 0;
     s->stopped_state = sdhc_not_stopped;
     s->pending_insert_state = false;
-    if (s->vendor == SDHCI_VENDOR_FSL) {
+    if (object_dynamic_cast(OBJECT(s), TYPE_FSL_ESDHC_BE) ||
+            object_dynamic_cast(OBJECT(s), TYPE_FSL_ESDHC_LE)) {
         s->norintstsen = 0x013f;
         s->errintstsen = 0x117f;
     }
@@ -1863,7 +1864,6 @@ static void fsl_esdhc_be_init(Object *obj)
     s->io_ops = &esdhc_mmio_be_ops;
     s->quirks = SDHCI_QUIRK_NO_BUSY_IRQ;
     qdev_prop_set_uint8(dev, "sd-spec-version", 2);
-    qdev_prop_set_uint8(dev, "vendor", SDHCI_VENDOR_FSL);
 }
 
 static const MemoryRegionOps esdhc_mmio_le_ops = {
@@ -1889,7 +1889,6 @@ static void fsl_esdhc_le_init(Object *obj)
     s->io_ops = &esdhc_mmio_le_ops;
     s->quirks = SDHCI_QUIRK_NO_BUSY_IRQ;
     qdev_prop_set_uint8(dev, "sd-spec-version", 2);
-    qdev_prop_set_uint8(dev, "vendor", SDHCI_VENDOR_FSL);
 }
 
 static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
-- 
2.52.0


