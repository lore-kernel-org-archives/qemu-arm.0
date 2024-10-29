Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp540836njj;
        Tue, 29 Oct 2024 14:01:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsLtSX556ZRgqj0NhVmKF/gciDDyTaZz8gnwDHs/hj89jXfCtpejbfWlyPDjTanBeh9efVMhOv1fRmSg==@linaro.org
X-Google-Smtp-Source: AGHT+IHZV2sgZmZ7O1+gTLXog6E+R3T1K9VGjP8ju5/HvKgpQIC9RXqVBZ1o/4xC1YA2r3RRR89x
X-Received: by 2002:a05:6122:3c8d:b0:510:3a9:bb87 with SMTP id 71dfb90a1353d-5101501368cmr9684988e0c.1.1730235678083;
        Tue, 29 Oct 2024 14:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730235678; cv=none;
        d=google.com; s=arc-20240605;
        b=LlrwhU/zgEaJfmLzwstpWlHkormN1q4wzmp7Bufb3EMOcIgMvTP+bDK7K4L+7xiO7U
         wgG/ROtr408dcGyVdw3uiVbCl0ZwSmLH4TeVeoUqMJHHhRs9y/D6SlWCN8eFHoFqDkEo
         p27m3yPIAaeFSCSNLJsY5ioHYR5Nbx1vxev63+dtXxtrkhLIIR9T9JYv+xtB0xKf8LMW
         8LiInZHXvB2CfH7KXvf0rgXRabq3mcbFVmbqPnFal9+uCKpoCqXipIbN5ns1WAx5Gb4V
         8IMFRB+M2fW0wBu99pfSOKDVcbT26j9jqxMvuQDX4fO6/e8m5UgonWLZaQVdN3+EY3EV
         i3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HcuMAuxPQk2Q5bxoaPmhXT9ZvPq6wqNgneX3rODU6Dc=;
        fh=Cz9mr7WFxiYKJBC2Bqqst74qbX4rU+wpTENwEkbsku8=;
        b=NuJqxbnP4zvu1pH31tTur060J2ECORiQELyB7FCIoVTZ6xSFrQErHeEq0z+qXKMu2A
         WuPTaq+gTcmLWP9M/Dp50NZ+1CxjDrAwj4u8w3v5X52ae27U7S+5VkAwdCxF1zN/hE0r
         yNR6DFtSOCSnyyXyH3C1B4MB0ebHUeVAqXfRTYe61qYgGPdlwP277bTgDgyey5SNIXPQ
         D+mulGvMFKc2QqDp49066j5Me49ItSQLvDfVZqJ+WP6Pfi99k4AHfNgEsUPs5JnwK27Q
         BgGSPHAQaa8tB5/P6V1EDxDPA4bxNijuaoXORkoUE0XjVUVLIy7MIMeav9L0v7M7b7Bd
         rF7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=yMUBcToB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5100430d4edsi2931103e0c.63.2024.10.29.14.01.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 14:01:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=yMUBcToB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t5tIs-0003iD-NM; Tue, 29 Oct 2024 16:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t5tIo-0003fY-7f
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 16:58:58 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t5tIm-0005a8-Aw
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 16:58:57 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c94c4ad9d8so7379013a12.2
 for <qemu-devel@nongnu.org>; Tue, 29 Oct 2024 13:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730235535; x=1730840335;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcuMAuxPQk2Q5bxoaPmhXT9ZvPq6wqNgneX3rODU6Dc=;
 b=yMUBcToB7Rsby1qJPPSTr3yTpAybsW1UsvbibMrsiGCH3x3ZBr7nMjFN7BeBayE6wv
 BruyuOmE+yXNSM7PRARI6Tuu9u51bQasidchpfbCVW5+Jbc8drxqQpNvaTAlIKABpNxH
 8xN1rfuWxzHAjay+iPpX270gUgO1UzDQ8+z9GqmgD4LY9Q3bCt1+ARwk0j+eEnc5laZq
 ntjaDWsP1FxTXUC2KcQT+k0IWlmbTvLkU8oVmT59C0cfuhC+o5E8zdtTvTsUm0DuqYwM
 qhBn5xIS5LWXGGcU/b2sq4sbr2c8aILqckMFA3I7qYclGlAEfgAHzrF6MJu6u6r4zpdJ
 SkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730235535; x=1730840335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HcuMAuxPQk2Q5bxoaPmhXT9ZvPq6wqNgneX3rODU6Dc=;
 b=WI/8z/+gIoSBZaiSrHwdjKsDvj9/MfuWEnKJ70eLrS+9+hhZbPg5hYnq+WHiwkvkyF
 oE/G0IFtb2SeHuhPOUh9GIHqsrwShXjOjofXzTIJWdUZ8x/xJESM+5B7o2nDTT9OvOei
 885HBw3X1nj58fbicrO7gdeLxZtKzRkoBHk0NDuDqFDvpPb+kauRMJcUVYTAeTnnr6ZT
 CWCdZYToH+1dplzmXT3N1sro6RdidzYK1LlHcA+f5IkBtf9Zj6FwDCYXUCD+bcTWTKww
 JXwp1mNAQKLOEa2mCgh0YcsZlt5YZFu81jqjILXdfIujEFJ6IDSxhBbjduIQitji6nEZ
 E4Lg==
X-Gm-Message-State: AOJu0YxlqTrOlgPwKLkfHIY2Y8pYX/c/vTXMd7x5ssO0zcXZQ4njq3q0
 Bw6L+ncl5E7tdRYIC716JCx7y1Rgr2eolD19+3OhMgJGklZs7yir++HbVloYF+5dNxRQWW8mI4Y
 Ucg==
X-Received: by 2002:a05:6402:51cb:b0:5c9:45cf:483d with SMTP id
 4fb4d7f45d1cf-5cbbf8c092bmr11408041a12.15.1730235534572; 
 Tue, 29 Oct 2024 13:58:54 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629d5besm4217341a12.33.2024.10.29.13.58.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Oct 2024 13:58:54 -0700 (PDT)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v5 07/15] hw/misc/pvpanic: Add MMIO interface
Date: Tue, 29 Oct 2024 21:58:11 +0100
Message-Id: <20241029205819.69888-8-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241029205819.69888-1-phil@philjordan.eu>
References: <20241029205819.69888-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::536;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c68q+przCwAs

From: Alexander Graf <graf@amazon.com>

In addition to the ISA and PCI variants of pvpanic, let's add an MMIO
platform device that we can use in embedded arm environments.

Signed-off-by: Alexander Graf <graf@amazon.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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
2.39.3 (Apple Git-145)

