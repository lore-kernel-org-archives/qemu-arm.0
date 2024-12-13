Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp520448njb;
        Fri, 13 Dec 2024 07:20:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXho3kMMyU0tP8K8/NImUEtGn/ItSjSXPssWGk3HAZErHNJeaisKKJmiYhsaRWkZF6WN92cAmexzL46cA==@linaro.org
X-Google-Smtp-Source: AGHT+IHr2NT0PiO/pjFyjLrow6HDt7s/EBEUt6bjirND4EbP121/lyBSL4QJGAObvYNMHX889ZE9
X-Received: by 2002:a05:6102:b02:b0:4af:dcbe:4767 with SMTP id ada2fe7eead31-4b25d98d34bmr3047669137.10.1734103240383;
        Fri, 13 Dec 2024 07:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734103240; cv=none;
        d=google.com; s=arc-20240605;
        b=UFbQmva1B6bra8U30+fUmSRXGIzauXRGAXl5An5aT56Iz+FXJlbfhpdk2cetfi+3xW
         LaeQalzzCtGJ1RlZldon7SDR5ejlLT2VSprmZQYFngWM0F9RtS9kgem1F4O2RI89NigP
         Lv2meE3Rhn8eUmKHF3NhaP/TYdprWpqvwLAl84/qgWlBDK5MJ45cqMMsV8ZGUm5/WOrU
         avQh1MK8ZZCagN4tz/ArKbGjuxAoIa0epP2vhWkPSv9s2ZAhjtzylJDdWOyTVafIW6yz
         frTxsL0OJXVJZPZGdo+3zje6TNe7g7DL37+Dtt4a6vX9VatGMFJj1HoeBilczTRRmQJY
         GIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2oYrLMZynfGoehZjWa6pbu2oV1B5fji3Vx4MV4wrlhE=;
        fh=B9RQF8LUi3SGy3gr3JRUojXcCHBMgUmnjl/m3xTH7Vo=;
        b=bz2v64clEbMnOor3YI0yZw1TEf1W0RKCVQ19FFAvqS3QPpEwTHLnUU4hxjcnTCLmyg
         r9GwQkGesNEaSGVqW11AWWdHPfgTQrgDk1aILnj+am1tH22rNo+/dvfvt4lgOWhv6OoI
         Eh2uvLATfMWcMgLI04CK2/JquOj/TnTWhlmNqFgpSJonW3DT55UMMYwYU8at/SH7bOSl
         vspmPguc0chbIhWzWG0u+zMWxxCsfJLbCZkI39StCy8La7kZPtdsOTSqtEWpUYqSrnn6
         0BNoXZAMhc5y55V4JOcvHvfraQYx5dtomJoSBJxWbRbK6uUr43/T6dc/LqU2dNWOJsWw
         G76Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Ac0kufZq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b1111ba5e3si3585855137.377.2024.12.13.07.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Ac0kufZq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM7Sa-0005uX-Nv; Fri, 13 Dec 2024 10:20:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7S3-0004gy-Kb
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:37 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7Rq-0005M0-AL
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:34 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa5f1909d6fso339146366b.3
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 07:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103161; x=1734707961;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2oYrLMZynfGoehZjWa6pbu2oV1B5fji3Vx4MV4wrlhE=;
 b=Ac0kufZqOHVxZ3OzK8cWJSWf7fAWI9SaHETMU4oxidxV7Y41IF0m9gmgctkGHIjNS/
 gCP5htd6mYddGhRNDdSx4LCqgQExFeKAcpNX8D1ArKLH0+z19f/DvkmcObwH1zqFisGM
 RM3m6EvG+ftkuOafJKnO7JH3Qlr/46/F1JFfSVhEBgT4LzEIODouEOMMWNYh8VD2LPty
 e2mdvM6ZDnpMV58Ptz3I9TKyqxp8D1NrqiR5K9H21SrjOTZ/7XTWV8YXUiMrruGr8uWr
 4kG7JSD96RVScT/SCDHgNi+zfH2Z4juCsOSyT+QE8vBNU7wU4R+NmyFoPnI4oU64GvOl
 s6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103161; x=1734707961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2oYrLMZynfGoehZjWa6pbu2oV1B5fji3Vx4MV4wrlhE=;
 b=f/H7TuPHjQT0VdhtEYk2xtxHJ0XVm6rtHOyFzsX3OA3as4+MZdh6V6W8Nz94WwEys8
 YtVB210Qx8mUKc4kbktvkx8LF00fNn6a3bQ42R00L+kWrkraq2bXYlnxDa+Lex4P566h
 RX3QhdttSrMfGOXh7Xgs8P/thlczzn84xtBR95evaj7iLMEfpgauVPgBPWT8FUQaKH9M
 tYrdNwCRlSqL9ychlrcQ1+0H1p25jI3HxwbD7RsJh7Nzdb5lILheAbb+PqHxYsoRWSX2
 G8UjPizKc9Gta8JH3FSDjdY7M/f5FhlKgz7m6JONcdmXd15KLtOl7rm3ZqO9iUKrTtUt
 lkEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTMep+wkC0BLVk6WS14zp8pb/VQG0fyJxNYqMptjAxGKPpvQuZVTA330ZntwuquMr4nPWDMH3p1A==@nongnu.org
X-Gm-Message-State: AOJu0YzMOyazLNcex0zN+Ytq48sxgiZMr3gm2zMI7ScCzIKnnRvckTcn
 AZaS54IX9HewS2T4RrAqgpBCOtGItPPF1y2jH3hE1zC8/H1HMZin2+XUaygi8w==
X-Gm-Gg: ASbGncsZf5Lrxma8XrWgM7KtXPDaQsd0avTIFErD9+tp/T1coVaQTXUtz+fJRlhC7nd
 BI93GeVga2L0OWDcj77iCj6RsskPPUVaUkCat3So5JXbY/W8d7S6WC0e07pjZ6WwKTMJvBY4jNa
 tYm05D6OQs86f9IEEjp6ggS+kMeO8gw8UGQmmabjw3MP5IGSS6DetyDArIgok0/ypgkqYjIr6VE
 uf0KQZfLjwEUS0FHAw2WZaMMkxtDpJSrgsQCzT/YdYk6KDXdl9TV2OgsjxdOEicu/uu+VG+3XCp
 lJa5wrwmc7ECkgICQ5tro9NRBFmAS6NA
X-Received: by 2002:a17:907:9690:b0:aa6:ac19:7502 with SMTP id
 a640c23a62f3a-aab778e0769mr291075466b.4.1734103160901; 
 Fri, 13 Dec 2024 07:19:20 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.19.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:19:20 -0800 (PST)
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
Subject: [PATCH v14 07/15] hw/misc/pvpanic: Add MMIO interface
Date: Fri, 13 Dec 2024 16:18:13 +0100
Message-Id: <20241213151821.65748-24-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62c;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62c.google.com
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
X-TUID: dhPw6jJsXa0V

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
index 00000000000..56738efee53
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
+static Property pvpanic_mmio_properties[] = {
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

