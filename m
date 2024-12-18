Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1201935njk;
        Wed, 18 Dec 2024 12:21:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWJLBPeVhVg5xkhNOTyEgrdz3cr8ck68mJhbVYRcN2jm2Bsu+PzIkf2rpFViTi2zwRhvCs2D0gugO489g==@linaro.org
X-Google-Smtp-Source: AGHT+IFR7eVN3Hs8mzcWcju+sjGinJcVhp3Xg7gbUHZTRsOF4ej+DCUOxWtUAIFk7ibzeRuM3Esb
X-Received: by 2002:a05:622a:58b:b0:466:9763:9de5 with SMTP id d75a77b69052e-46908db23a3mr79633361cf.2.1734553312571;
        Wed, 18 Dec 2024 12:21:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734553312; cv=none;
        d=google.com; s=arc-20240605;
        b=Z2N6OrKW0NRzvs/sG1yHEiyvveyIt0LiAtzdXg52LEqL/PY02P87gKvYYaFgvm7H2e
         WZ5FuJwi2W+jx5+DUCBXek0IW+3QbneCdAmXQ/XQYJMJfmvuEwfqlemx4HwP1U4zfONo
         gJDGWUarioBIlxrC3UJnRi+XISditdV5qpzoaNzssA6ghqw6JlLK2sifk7hq3XqIWD2I
         z9oAP7YbVssUOj8qLJ8yN7+bZ68nE8kgKGUSEzKWwXtNo7+QxhP9fycXPJXYEXUA1NOY
         N3rl2yU1UJ0ETQrIJSryo9iO8+qYL8p+QMJoBClSgV5Y4b321TaSFwL3JU2MIcW1OR8c
         7pEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/1RcxqE6P8+YctCXM2ifD7rgvfYUSb2HG9H5VG9x+xU=;
        fh=NO9SoMzF642kH08INnxibSoo/Dc7vt0FlzeUJXg2xLA=;
        b=UULvKnADpgLcxVxOWX6bnLtjUn+Eha7oiD9eLpWBN5EHyLIl0vEvb86swlZNQuwipN
         5ILVrbH5+4e0H0AJKgvXrFtbSiRcS5WEv3m+iGbBd4Tzc8hWc/iCKOoD4m4JMnwyIt76
         hX2MznOHRlfkuryXt6EuUs1IDG1uHjoa6XgubsTQqGry/TK+3j3WaJjpKFQ5xaIaTJEu
         uCgGbDZcIJEBG04zxPWsdkKLsGa3jnk4IOfWLO23uQqt7XefLeT376YDeuZNxuPnszPT
         scm7bXsrnZuhlUErZ/mH0oR1haIObs65lZ7ibuDsiJHmPKKtinaZg24TQWl0efAI04l0
         9/OQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=NCtHPTlo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2c966c9si155717751cf.106.2024.12.18.12.21.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2024 12:21:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=NCtHPTlo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tO0Xh-0001TO-F5; Wed, 18 Dec 2024 15:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tO0Xb-0001ME-JO
 for qemu-arm@nongnu.org; Wed, 18 Dec 2024 15:21:07 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tO0XY-0000ID-9W
 for qemu-arm@nongnu.org; Wed, 18 Dec 2024 15:21:07 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so796394f8f.0
 for <qemu-arm@nongnu.org>; Wed, 18 Dec 2024 12:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734553263; x=1735158063;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/1RcxqE6P8+YctCXM2ifD7rgvfYUSb2HG9H5VG9x+xU=;
 b=NCtHPTloqLPFeFZ5PVdAdF1dZhZ98pQMbGcN257w3xACs1nI+/sOuTtImunkY8VgdH
 SUSNQMzxjp+aaOeAa95yDzcv4RRhAsezB1zuSC5dUA/RRiVbtB2sYwhNsd7FBiKZB4HW
 flPIv+TGOkt2hAJJxlLqkFSrsiFhdb2T7/UVz/KBQr5iKmQRG+k7g6sS/jrbVxz9Wc0g
 92zxuq/9/I/iamgpkvVhym2+LEGsS/eq1+g73RcnqicL4TRwECdklGX9YSZkcZ6UbBSQ
 ZH/eOaf9RRcSBIzPjfQj0B2z9Z65/jinVn+u7DZMf0WC3WLuHHUzT8AUkVNQrzPuaRn6
 TvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734553263; x=1735158063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/1RcxqE6P8+YctCXM2ifD7rgvfYUSb2HG9H5VG9x+xU=;
 b=qmYRpzm11e6UQZfP7nVpD+uqVl5KKLYpL6nxSL4px1t3D4saH5oA1aNyLaHkjFX1O7
 4f6AIKNr+xpnRqAHTsmjKB2eF9v1ukSrR0eRB9m/vj1ZgU+t3pEh7UygQCopAXDG3oR1
 /pRubT4POiD7hr7uegjzKITWAW8kpBOlWEisgtVWWUv7G0H9yV6fBFDlG3iXRgbJlOy9
 VvyHedlbaA7GDLQWnqksIWbN7M6/sd+w3+GrKhT+ROoY8YVfJu3uJ/rPdw61KwJSkpMO
 rcT5+0iV518YDMFdXxwGwL9TJY9cyoxZ2wvaamgXbgXFrsEnCURa+7ZEYqt4PdMc2qAt
 xOug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXR84yiiOywMjeY1gnQA7Pcx363HnyOnrfxz7+cVA/vBMx0i2YciGS/i1hMv2dtnlSka1LzhP0BQ==@nongnu.org
X-Gm-Message-State: AOJu0YyocKFBk7V3FaXUomLeDVBD50omfSnzFev/CKJL5tCofsVKjE5d
 gvi++wieEEdBHS80x7VkW/5n/HQxqSnOfKvFZuHweu4A3MLK3fMfX9hMXmZhyQ==
X-Gm-Gg: ASbGncvzPomGjTiXVAmIViKcoQ7HBfOBfavY7epTLRRnHKQW2RhbVwkCrMmYOSZ9SXJ
 5p44wvbktcNS0W9NBFXUyjAp13GhG8WGov3xQMaIcCKU3moHlCuQIls/Y4v9dJTHqIu3Y6Pe050
 F6UpwdivRHdXpz3hiTJbN8a4ohtYQiobWWI0Etn191F3mCqwtTdMEdycpL2T41rud/z1DLX9zFQ
 FtDpWzn7vJlcwiNVz6G8da2/PskfnyOA3qRsMltDaJj/3my7W6mN9+rd314ToPzkAVapfoWawcd
 azqXvB4JUW3AgLCfgnRa1dQufoZD6YlU
X-Received: by 2002:a05:6000:18a5:b0:386:3672:73e4 with SMTP id
 ffacd0b85a97d-38a1a2746a3mr591775f8f.26.1734553262679; 
 Wed, 18 Dec 2024 12:21:02 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80120c7sm14842267f8f.13.2024.12.18.12.21.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Dec 2024 12:21:02 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Subject: [PATCH v15 07/15] hw/misc/pvpanic: Add MMIO interface
Date: Wed, 18 Dec 2024 21:20:28 +0100
Message-Id: <20241218202036.80064-8-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241218202036.80064-1-phil@philjordan.eu>
References: <20241218202036.80064-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::429;
 envelope-from=phil@philjordan.eu; helo=mail-wr1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: f2/+uPOboyNP

From: Alexander Graf <graf@amazon.com>

In addition to the ISA and PCI variants of pvpanic, let's add an MMIO
platform device that we can use in embedded arm environments.

Signed-off-by: Alexander Graf <graf@amazon.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---

v3:
 * Rebased on upstream, updated a header path

v15:
 * Constified the property table.


 hw/misc/Kconfig           |  4 +++
 hw/misc/meson.build       |  1 +
 hw/misc/pvpanic-mmio.c    | 61 +++++++++++++++++++++++++++++++++++++++
 include/hw/misc/pvpanic.h |  1 +
 4 files changed, 67 insertions(+)
 create mode 100644 hw/misc/pvpanic-mmio.c

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 1f1baa5dde9..5a6c1603b60 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -145,6 +145,10 @@ config PVPANIC_ISA
     depends on ISA_BUS
     select PVPANIC_COMMON
 
+config PVPANIC_MMIO
+    bool
+    select PVPANIC_COMMON
+
 config AUX
     bool
     select I2C
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index d02d96e403b..4de4db0a600 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -122,6 +122,7 @@ system_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 
 system_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
 system_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
+system_ss.add(when: 'CONFIG_PVPANIC_MMIO', if_true: files('pvpanic-mmio.c'))
 system_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_hace.c',
diff --git a/hw/misc/pvpanic-mmio.c b/hw/misc/pvpanic-mmio.c
new file mode 100644
index 00000000000..2d762bd957a
--- /dev/null
+++ b/hw/misc/pvpanic-mmio.c
@@ -0,0 +1,61 @@
+/*
+ * QEMU simulated pvpanic device (MMIO frontend)
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/qdev-properties.h"
+#include "hw/misc/pvpanic.h"
+#include "hw/sysbus.h"
+#include "standard-headers/misc/pvpanic.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(PVPanicMMIOState, PVPANIC_MMIO_DEVICE)
+
+#define PVPANIC_MMIO_SIZE 0x2
+
+struct PVPanicMMIOState {
+    SysBusDevice parent_obj;
+
+    PVPanicState pvpanic;
+};
+
+static void pvpanic_mmio_initfn(Object *obj)
+{
+    PVPanicMMIOState *s = PVPANIC_MMIO_DEVICE(obj);
+
+    pvpanic_setup_io(&s->pvpanic, DEVICE(s), PVPANIC_MMIO_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->pvpanic.mr);
+}
+
+static const Property pvpanic_mmio_properties[] = {
+    DEFINE_PROP_UINT8("events", PVPanicMMIOState, pvpanic.events,
+                      PVPANIC_PANICKED | PVPANIC_CRASH_LOADED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pvpanic_mmio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, pvpanic_mmio_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo pvpanic_mmio_info = {
+    .name          = TYPE_PVPANIC_MMIO_DEVICE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(PVPanicMMIOState),
+    .instance_init = pvpanic_mmio_initfn,
+    .class_init    = pvpanic_mmio_class_init,
+};
+
+static void pvpanic_register_types(void)
+{
+    type_register_static(&pvpanic_mmio_info);
+}
+
+type_init(pvpanic_register_types)
diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
index 9a71a5ad0d7..049a94c1125 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -26,6 +26,7 @@
 
 #define TYPE_PVPANIC_ISA_DEVICE "pvpanic"
 #define TYPE_PVPANIC_PCI_DEVICE "pvpanic-pci"
+#define TYPE_PVPANIC_MMIO_DEVICE "pvpanic-mmio"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
-- 
2.39.5 (Apple Git-154)

