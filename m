Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1413848njn;
        Sun, 12 Jan 2025 13:02:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7hqLBKcRiJc4hjBBL73zoRzcbHtNgioS4Dh+o5u/eWsigEUiCBMtYafps/RHmcPd3/vacgoV4TCpsgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHHKUBlKgOQzsz2cQCjAqKAFj988rarLyNXE5wggHvkO/JLcsO5GbQwqk0bMZ244uktU7wB
X-Received: by 2002:ac8:7f14:0:b0:467:5144:8374 with SMTP id d75a77b69052e-46c710a955fmr266404221cf.25.1736715769302;
        Sun, 12 Jan 2025 13:02:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736715769; cv=none;
        d=google.com; s=arc-20240605;
        b=J3btSq+aP6CF8Anvkbtl2DWdEXt8e9GvtrSprsxbkbtzHvwkj0dOb4tvxsLyaULI9R
         +qJBViLH1OdOU0j9qVRrNBSeNMXBDpLi/OSdDQt8fJ8Mf9H4IcSLNRG/QdbvDNrwmXaP
         +lbOrvacGI4SdXNGh3ypXueCQNtIdHooNm05Z26igu7uk7fqzBwUZfaCDKIdv7Rhcqx/
         vqX8tpn2aR+86KkWGT8CbTynbuRRKy0pnmno9aNjgEcjIJrjN6yUPqdaFAWn0T7tPDHs
         EICtcN5XInghRHmmlGWHdd/A3dd5gM1vaS0Ri1LyjB7Ui7RD+YeHCUZi/D6Qy/Qlg7uy
         mE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GvDhEz3acYJceXtOa/E3HfCa+FSJUVu7fX0WjN7zRao=;
        fh=uXLmKlw0iInQOxilD0cn1aDxeXDoVVlZSO/uv6onb6Y=;
        b=QUelyLZQuZqlAcftjOgmXch39Qk9Jb+zZueN2fNcRa1i8CILPFFZoI9OZpICwpA4PS
         9ou3VMxXPpNrGMnq6IJb5fc1lzuML3EB78sNBIsXc2YPcjB10o5PGvSFYYt3anvYkRem
         k5xIShGbqy/R8U3Jo3BnMgKiito2eiowmwW2ptsR8ElHbF/WqlUu57Ma8qfF2og5Ko6L
         GpU7SCi1UdMLZXNnPVlTJ1B52KFpYy40lUs49lJ2zgHmI476HcIozwPmeDyr7CSS0YtT
         OVCxiLepmIg4Asv3OPtidoXWsGGJ0sVIiteD4xDyLRfiOFGO/sUGFqVTp7xs9EEbTh0a
         eKOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Lga7smrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c873e4aedsi72145881cf.277.2025.01.12.13.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 13:02:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Lga7smrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX55f-0004Xm-6L; Sun, 12 Jan 2025 16:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55U-0004St-2M
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:36 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55R-0006NW-8N
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:35 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa684b6d9c7so652967766b.2
 for <qemu-arm@nongnu.org>; Sun, 12 Jan 2025 13:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1736715692; x=1737320492;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvDhEz3acYJceXtOa/E3HfCa+FSJUVu7fX0WjN7zRao=;
 b=Lga7smrX+7rwfPjm4Uq3tZYxoHjCwXUTT/Somkxkqv73E9OWFupTtFgKSVgkW5k7yq
 vbblRRAAqAVefKy7nYwbGaOVJChhwSj7TCzEvfDu0UuKXir2mfKdAy02noY+olcJYCJW
 PVsejBwka9/DodecvfTMkyDBGinD7KC+37f7QVs3GvFYdRIdrdzScUhFnwNZiA6i7aEM
 FwAksMW59klRKeedUSgSkhDIk/xt7k79PMUkcdPn75OzRGCpkca5bfqMBlFI9X/Dw/uR
 8yH1ttdR9cwb9K6aPC6wAKkuiY8Q5HOWmsbriEJJyLSzIJJBo1TGN9sqMihkkj5IhtTx
 btmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736715692; x=1737320492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GvDhEz3acYJceXtOa/E3HfCa+FSJUVu7fX0WjN7zRao=;
 b=PamKH89V1x/ZaPP1HAxV/ncI7NdjxqQec++Yn7ApLqCumP4M5QexrAMtQiI1V6e5qc
 Sc0aD+qoalSj8FN63eEygr2qIDy3nZdLdSNbUCqBvcuanmW711xBESSpnC7PKB2KmSPo
 wNmhjUk+jRbLJPUjJnygEbazSp6vsWqcDIMwKxNJu0H4SQt4wwxftiHyHm3IovaymlCC
 SdfXxO13NUJpOgWlfJiOVlqY9P2NmYJTZpQOgY0aTCs9KZX4GumJuAYi1CxvrU/ksmH8
 PyEpj+9Bu5GHRTdmiacvhFUhQZhwEKCxkjnJUbDUWK/7E1yrCVZImM992BUXzyxUlDqS
 lVxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvj/hWlg93SCUeJCqN84sRxUH1dH+i05AX/zptJLBgYKzwHkyU0vJvlvmKsfh6V0+VIOHVNEyR1A==@nongnu.org
X-Gm-Message-State: AOJu0YxbZ3g3EgwCrbhYXxrYmtzpC7KN1g586pHI0+hyCUabAHht33Z5
 CxRVmaRMg8Iyba1WEZ+x7N4lnPfmT+1ijww5ty0UjqA9s+ZT1SBYsnSKOFqcnA==
X-Gm-Gg: ASbGncvRn5IrOXxUoIGYhUfJfDGc4GN52DEPcNbFaW/F4Q+llEimFfWStn01KmV7gnu
 teBTBXapKz65DE64/kkQVOvuzqcmYVdkMaR5lq0b1QbXY64RFXUKz6k00a4uHQ+yjieZHpWEj4F
 0bMJbX5YlZmbMmyz99o4uVgNbDIbw/T8p3dmOBNTIkYMuZ/o1QqAG5n0bHo4R93HK3ds8hsek2x
 uFmOOpcowPrTIF9BNXGzTB66JFxZKDj0k9k25F4FfqxAZOeF4ZQZPc4eXfQ48MyzGetPpgVypC+
 BgjIS75AhJf94XoXtZl0bCx0D5qrDKfT
X-Received: by 2002:a17:906:3fcf:b0:ab2:f5cb:c039 with SMTP id
 a640c23a62f3a-ab2f5cbc22dmr529508166b.54.1736715691652; 
 Sun, 12 Jan 2025 13:01:31 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905e283sm418276666b.31.2025.01.12.13.01.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Jan 2025 13:01:31 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Alexander Graf <graf@amazon.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v17 04/11] hw/misc/pvpanic: Add MMIO interface
Date: Sun, 12 Jan 2025 22:00:49 +0100
Message-Id: <20250112210056.16658-5-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250112210056.16658-1-phil@philjordan.eu>
References: <20250112210056.16658-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62b;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62b.google.com
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
X-TUID: RPu7hgIpnKKF

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

v16:
 * Removed the DEFINE_PROP_END_OF_LIST marker to match recent upstream
   changes.

 hw/misc/Kconfig           |  4 +++
 hw/misc/meson.build       |  1 +
 hw/misc/pvpanic-mmio.c    | 60 +++++++++++++++++++++++++++++++++++++++
 include/hw/misc/pvpanic.h |  1 +
 4 files changed, 66 insertions(+)
 create mode 100644 hw/misc/pvpanic-mmio.c

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 8f9ce2f68c..16cf872e40 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -150,6 +150,10 @@ config PVPANIC_ISA
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
index 55f493521b..6187caaf71 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -124,6 +124,7 @@ system_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
 
 system_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
 system_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
+system_ss.add(when: 'CONFIG_PVPANIC_MMIO', if_true: files('pvpanic-mmio.c'))
 system_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
 system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_hace.c',
diff --git a/hw/misc/pvpanic-mmio.c b/hw/misc/pvpanic-mmio.c
new file mode 100644
index 0000000000..70097cecc7
--- /dev/null
+++ b/hw/misc/pvpanic-mmio.c
@@ -0,0 +1,60 @@
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
index 9a71a5ad0d..049a94c112 100644
--- a/include/hw/misc/pvpanic.h
+++ b/include/hw/misc/pvpanic.h
@@ -26,6 +26,7 @@
 
 #define TYPE_PVPANIC_ISA_DEVICE "pvpanic"
 #define TYPE_PVPANIC_PCI_DEVICE "pvpanic-pci"
+#define TYPE_PVPANIC_MMIO_DEVICE "pvpanic-mmio"
 
 #define PVPANIC_IOPORT_PROP "ioport"
 
-- 
2.39.5 (Apple Git-154)

