Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4342872njk;
        Mon, 23 Dec 2024 14:18:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXmAX6K6tIUVRzwmnAks6bHQ5WA16v7SMMJ8Ld1yeywI0BEU5JvgVhVMwOIYPXarDX5Mgw+ACc4JO17Ug==@linaro.org
X-Google-Smtp-Source: AGHT+IF9iJH50LqJ4lTBrOJqPVoQkfhyX0iUCo5o0eO99Bqa8xWSzsmZOkpz8pU9B2rn1LZNVzAW
X-Received: by 2002:a05:622a:1a27:b0:467:5926:fce8 with SMTP id d75a77b69052e-46a4a8b5f9emr231941921cf.9.1734992299181;
        Mon, 23 Dec 2024 14:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734992299; cv=none;
        d=google.com; s=arc-20240605;
        b=GqAtjBx6JhYjTbYQ1quYsTCTnZAhyg3ISj4DBT7GXwECkxQlbOS1EzOqSRxULOWIyj
         TBT8fmUR2HhHb5kE7CVRemmzXgdi7j6gYl/c5rCgq5WNxvyiQOGJ8luM9oaa9FnePcz0
         Cp91mCpDT7BvtlZHomzossFqvyzC2kM7GFsMXiiAW7Ex1Cqpi8/0RuiAOXCU2j98aBQj
         /72Hj62oJ+M+GSLrMbTjoxJEpFcqlnRZgnv3Xz2yh6eBsZsKEB/PS1rXoqwpfjlYwIyL
         eh4fx1hQe/QcDU1QhCERglXTf2iauk41Ym5iyILGKB2f1fxQzZ4/xFFg8OJc954xfNjY
         y3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nSPynu/TsTtjPcRM35CFCvp80g/vZQK7JfvWWbZ1qQU=;
        fh=9Js/gflJrxUPa91HUuKKSoAbUUnMnleCiaqQSrRyVRo=;
        b=g4il1imNBUWU1uuIeFqId/fJIEpjGv5dKNuv8EpNnlD3fk+Xzty8Trm5nBZ9+w9kOq
         r31a1W9WX96FpT1LKgmdUHQG0cFuhJiNW0rPyUwC4I0AukG1R/bn1kwcEcgelOjD9tvl
         k4XssD1zdYoxepY/QVFc6U2LdjKQmPyMHx1/B9vZW9RRzeXrXEkYi5Ms/Z78h6ySCLAg
         hU7JXR5d+XZtKeICvSTgLVyQEcG6A8+OConH48+B5odq0N5iDYoRmloTDU1em4fLmf90
         R7QeyglNDG4LsmT7RwXAzCqA2Y1jVTvAW1+9QDqwg65q8rMUKkaZh05hREhol+d6Cj9R
         L4aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=iXWGXwqW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebc5b92si128083801cf.416.2024.12.23.14.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2024 14:18:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=iXWGXwqW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tPqkB-0002FC-F1; Mon, 23 Dec 2024 17:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tPqjo-00022I-1g
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 17:17:20 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tPqjl-0006yh-DX
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 17:17:19 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso43832705e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Dec 2024 14:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734992230; x=1735597030;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSPynu/TsTtjPcRM35CFCvp80g/vZQK7JfvWWbZ1qQU=;
 b=iXWGXwqWAF+lBd3DDkk14fLLyax8/qU1xdga2RjWgzOl3CVdI3aqnfRf5slpKLh2E8
 lIyzPlaz5ugE4Ycl4YMnjaHDvinI0uOzVVVIY+exDq6bw5Wi7bRzaAv7fYuBBNx327Kr
 71/9SojJac3p6GcQV9wUE0P0R8XCmhhAxLf9ZBFcE7u2FKbcktb1zoUUNNKu9O7EvvvX
 dKaSiNCnj9PX2/sAFjffQbZVQQWJS+boCEiSxlhEQjVwpt87HUgBG2VlwQ3e0P8LyeoI
 Doe34//+exnxFu84Cx3hxiM1pKyatb1KXexAxaYqxbHG9SQbLCka3pesRIG1830wGpI8
 V0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734992230; x=1735597030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSPynu/TsTtjPcRM35CFCvp80g/vZQK7JfvWWbZ1qQU=;
 b=BZR8NWBNa18E/jJm59RXXgi5VC8GgI4BXddQRh+5vsCC2cMafOp3pknCIpas5l6V7T
 jc1SFuUuV4Jum3PVmteTqq9m3dUKAICwfGIBkk4KVFTvE8GtqAOy4d2/E6N5C8DacUYv
 AAUA9+pzW5KoKM/vJiXXDsmBX5j0/8mE1Zxo9kQQ310Ti5TaTu8AK2iYz+KzDQ403GPG
 aClj7FjwJciDLAUz02L+uouXN++SMI8HETbXTKj/Y4PL/tSzHFfL709Trbtx/PokbjmD
 Xi9UPngZhsEXROytInOQV20GNT3mMHE4FJxh8w/sNwLIhiswsd0Rw5Be8c2W2xqnWkjF
 /02w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrqMjlvlK/uj+ThT70/EQDl+dpAYGCV17ptrW8ERV5YdY8TOGC2ADJR/GE7PYMOPJYkxFjq59l4w==@nongnu.org
X-Gm-Message-State: AOJu0YxTJvhgTHnetwsAEhJB9NG05aMSnfG/42/16uJ/VBPNSq6WXuEJ
 xu3cmDdULOlnkUycx5xuSuUS82fkHv1m9YEQyWhY9jRR1WF1SQBwmaiO1S/ObA==
X-Gm-Gg: ASbGncto96ZHdJgsZcKMKW5VOFdOcPLP3hg4Sb2pwKmLiopM34O8GaVOc9psI+3KfwO
 CjPrkIj6En1/tllSaklkfO6eVNeChDa7hIwc+YhPzv6bVy8AxW9xgU9krFkx3wmra8mtw3KRgqj
 e8A42Xe+2D0gEAUoPPWoBTddIuIZvVTWXJikM3xE+5ch5nZCzTfheilDNxJHwYfBIXbCBtyhU/u
 WKuPAWlOreYgcY67anBSwaTPLmN5/MwMaSC/KIYzTICfxvHrURW5EA8V02IxbTo7U5TUUsIdyqP
 OmPZmdtI4kRBNGf+yoRcqzOJ39pYztpp
X-Received: by 2002:a05:600c:1547:b0:434:fd15:3ac9 with SMTP id
 5b1f17b1804b1-4366b2fa09amr112877345e9.22.1734992229965; 
 Mon, 23 Dec 2024 14:17:09 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611fc161sm147561075e9.10.2024.12.23.14.17.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 23 Dec 2024 14:17:09 -0800 (PST)
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
Subject: [PATCH v16 07/14] hw/misc/pvpanic: Add MMIO interface
Date: Mon, 23 Dec 2024 23:16:38 +0100
Message-Id: <20241223221645.29911-8-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241223221645.29911-1-phil@philjordan.eu>
References: <20241223221645.29911-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::334;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x334.google.com
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
X-TUID: b3Hp41icEet6

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
index 1f1baa5dde..5a6c1603b6 100644
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
index d02d96e403..4de4db0a60 100644
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

