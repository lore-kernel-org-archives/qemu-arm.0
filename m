Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1603414njc;
        Sun, 3 Nov 2024 07:09:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUXvngLGdlT+P+PRRvqNHy6ig9TlIoW4Gqudy239qBHcdcaMWyOmylnt6iosPdFYu/sGDwuGfsi2We71w==@linaro.org
X-Google-Smtp-Source: AGHT+IHo56z5zpjJBtyKzdpnG9Cs9ZZfChEtt1CkYjv1rzkGCvitlfpj3q2tnRjtKNda/EsuRzgc
X-Received: by 2002:a05:622a:347:b0:461:169e:d2de with SMTP id d75a77b69052e-462ab2fcd62mr193276171cf.48.1730646557707;
        Sun, 03 Nov 2024 07:09:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730646557; cv=none;
        d=google.com; s=arc-20240605;
        b=YotoJ5RKgWZlXhIJJdNM/8Wi9OSt6rmg/xNiKgYeCzKoEs4Yljg5ucLaBP1GEDNWjJ
         0tlV1V7rc4yyF8c5ArExa26+M5S7mwOjg6F6cp+H8U9uK58pwXQ7DmYhAXVnlcuoWeBv
         T7kxa56LLO5zJz0NK381UD+WqkQuoooroRaeB4yxlLUpSYabG/ZmJc9ex6TOAvMMUMPI
         wOuOZP5tE1MAc7zeokCWisyYuFqElACBoAWgV32i1KyDvpRTj+s+fbHi269MwahGYfdo
         rsiMLm7LNxH0+v6r/DGs1/7kAws88G6DAVHaZeCmXbYKyuf69fePTvOD90lrwUH1mB1o
         2GiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oRS+0IKfHz5Oswaa/GcDCGPOKlj/D3aQAGpgmUVuXww=;
        fh=jmhBJKqhmGsW0ANYglR3efvrTlOmIa7q87nvbeom198=;
        b=kUD9WO1mBbOLSdqi6vqboAnWF5zmoyPVwAOwstFt6ifJdwC/arRJ6RD0jxUFwwRpEo
         QM87pcGnOkUs9bhMCbnKRIFO3I4zISXz5KMCW0jEZEYF9octtBqQ6sYhOpRgDU/nzsVp
         VwS30pe7A84Zd8TmqiIyBQJgaV9VwzFkzjkNWxBCvFRnnFrU/52IP8edVrBRSWPZqMOZ
         UgKlElGQyOkkG7ATT2dYqvLu2p6lBIR6RZi+QtNCrRTW3JEmy/SvijOKAqB+W+fPIQUc
         5NX4T0na0bxr5Z14ihhnap/47yEjJxwuXYbrP+zJ/rUgJQiz0M4PYVahHhdrZgCqnayo
         HgVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=f9Jcbskx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1ec367si84388461cf.494.2024.11.03.07.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2024 07:09:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=f9Jcbskx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7c73-0000ot-SV; Sun, 03 Nov 2024 10:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t7c6H-0008MK-Af
 for qemu-arm@nongnu.org; Sun, 03 Nov 2024 10:01:09 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t7c6D-0006Zf-Il
 for qemu-arm@nongnu.org; Sun, 03 Nov 2024 10:01:09 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9e71401844so274064066b.3
 for <qemu-arm@nongnu.org>; Sun, 03 Nov 2024 07:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730646063; x=1731250863;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oRS+0IKfHz5Oswaa/GcDCGPOKlj/D3aQAGpgmUVuXww=;
 b=f9JcbskxuKCpPTMkGlbW+MpgllNBl4qnuEXMYJ1Z8jWctFPrqZVWuxubbEVjm3R2kK
 6Xfddy5Sc2i4B4fe1/qKxx80HWNanE/vOoLx3RkTp4yQix+5s4QAaSlt1247rR6eAr4T
 lXm64GGtxQdzr+AUoKizgxZxULH9lZ6m/OVpVOLk0ls9lcdwkeDLBYq7jAYKz0yFktm+
 Qnp5Uz58d/qjTmc+NK1hucxI/HoVoDfpNt986HcZl9RJv+lUFdDl5EiiWdJ0/KAs3KV0
 tH0F005YGHp+QBcQp8Ix22jYGR3wGa8B2o9x8PAM5EJ+JYY1TLoftSSW39rX1lYtfgsg
 zN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730646063; x=1731250863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRS+0IKfHz5Oswaa/GcDCGPOKlj/D3aQAGpgmUVuXww=;
 b=vF7bUX2NrGe9akILEQVUDUGKWbmur0+6/Jl0Il8CvjhKli1cOL2dNxJabvyCZ4R1i0
 njDL66cFcgIVg6S7WSAHzYbYuq9bLFKAO6H1/NZhhTOefEAtd81Goa4GA3kruCpVSqYX
 ptf5hCIYz0GF9Nj3Ipov4PL1aC7KqX6xAZuc9Oxo7ydlxH3gAo3ktsBbAEoeIugIJUci
 edCo8jQXLZE0UFyw/nkP32+v2sxtb0LpL8v2LUun2OVue0pTyr7ejBB6vTkJksGIoGGJ
 6pXmoPJ3XYFvEbedIwSFxycuGK1+CCEFOocqpRLyW/anZIeOlY71EuEZ/but/lwOVSt0
 hq4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWKRUIWobKpcT8YwDyHIhCpBjycr/NFzVGcnXXgEgYGAJprMO3wcuFumClrpT4y/RuV23FgtbK9w==@nongnu.org
X-Gm-Message-State: AOJu0YzNVF8etFBCSfjbt4ai7nVnHCEytRgXCrRZAOCU47xMqHS3HJiY
 JWqDtlbfkmF2gAow383BqLvwQt1mMcs3BSCgmtUKTMsqJ/Z67rftYEs1cJGrQw==
X-Received: by 2002:a17:907:7214:b0:a9a:10c9:f4b8 with SMTP id
 a640c23a62f3a-a9e50cb736fmr1191317366b.61.1730646061853; 
 Sun, 03 Nov 2024 07:01:01 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e5664350esm431536666b.159.2024.11.03.07.01.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 03 Nov 2024 07:01:01 -0800 (PST)
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
Subject: [PATCH v6 07/15] hw/misc/pvpanic: Add MMIO interface
Date: Sun,  3 Nov 2024 16:00:29 +0100
Message-Id: <20241103150037.48194-8-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241103150037.48194-1-phil@philjordan.eu>
References: <20241103150037.48194-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::631;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x631.google.com
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
X-TUID: ajjQ6x3Qdr0G

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

