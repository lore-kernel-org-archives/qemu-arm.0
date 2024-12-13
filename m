Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp521932njb;
        Fri, 13 Dec 2024 07:22:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmydl89CcLmhxfhCGLxzL4ASfHpNozlOHAo11wo+01A/nL8LS1D9yY7ix3tdZR0zUGw9aJnbTZ3m36Jw==@linaro.org
X-Google-Smtp-Source: AGHT+IEO+3QxeaZ7roNjX8RQlMffZ11arlaIeEOy7tbO2JJ2VxlsESy88/UCKUu/VQxJBi7/FVt3
X-Received: by 2002:a05:6122:6590:b0:517:4d53:4272 with SMTP id 71dfb90a1353d-518ca4685f8mr2565653e0c.7.1734103355662;
        Fri, 13 Dec 2024 07:22:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734103355; cv=none;
        d=google.com; s=arc-20240605;
        b=DMdVClJ7y5ecueixU/k0j/p7XP2uNAgtoy8OI3hKpjAm4oVcutlFTLG6YXmBX+ElCF
         vS8T0+eln+CqYrfA09BS05+WU1imwefvRJswWUEJ99itMCT7vEZMlnb8Eyg8tEX2Y4iN
         /0nBr5wrdqcfrtdwu4uLbOjadQCLmG7s79hosS1L146mS773yU2o2TTe7d/I8MDAE/Ua
         odcdK1KNk6XKkPxQTj/f+CEPwRXJBibMWS2gzStvCmzw3GBKTx/ZCr8jNnfE11pJn9l1
         ZLxi9EtUU13U/dGgbamPe/fv/0xTBIeAajM8E37CBr7BxfUn7Di+Sc2N1qLWYFkD2Tgk
         lUIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2oYrLMZynfGoehZjWa6pbu2oV1B5fji3Vx4MV4wrlhE=;
        fh=+VjnrGvjeQQD7yexb7VCprNpWRZMsTpIL8oodPazyOY=;
        b=G6uj1cjlUUKZQiE00pMZa44fUDN3ni8qNYhuFiOtjicDIlSoG9uu5WR8iB4Vo/6yGt
         lLeMWgc2k8WUeKOKLNBunY1l6BP6pWGiOJUunUMviORVKXXWjQM3LabqUIzDJIK17/Fn
         LyYB4vgvRUPyj4u8YZ7tJc3DhOpVj5CTr3knRJHv9M2FXf8ULxdY3AuZAYLHNyqX3pZt
         oMf+DNQaLXu7Dcbd76Pl2/2Il0piJS7V0EUW1w9nKTuqKf1Ypu2RkUYti7+q8ijNbsm1
         TszBhhgbenI/KavIvTOdVnXXp9q3bTzeKkKUOsv88YU25aOS9Zohjnhp8pUB/GM2OU9C
         UF3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=CqEwo0Qb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-518b16ce1b3si1939393e0c.265.2024.12.13.07.22.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:22:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=CqEwo0Qb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tM7SC-0004xD-FS; Fri, 13 Dec 2024 10:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7Ra-0004Qa-L5
 for qemu-devel@nongnu.org; Fri, 13 Dec 2024 10:19:06 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RQ-00058D-6Q
 for qemu-devel@nongnu.org; Fri, 13 Dec 2024 10:19:04 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa670ffe302so343771966b.2
 for <qemu-devel@nongnu.org>; Fri, 13 Dec 2024 07:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103130; x=1734707930;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2oYrLMZynfGoehZjWa6pbu2oV1B5fji3Vx4MV4wrlhE=;
 b=CqEwo0QbFJ9+nVlxP4xTwEbVqz72N5Uqoef4chm9TYmnoJOfJsh+JtXCadSyg+NsGS
 DqnTiAUz6WAdS7yBoVad1nY47+kHOqdrfJJIXENwQKfZ7lgHvrj+YO7nhH5rYfim6EkY
 ihpjTPJqxKGe0/2hXL+oV+Xd+xIrpRY72h+4YPWj/XMR1B39fo/p6FcGSisKmQVTcZNf
 uPXLDcHUfMCjhb6np3r9gN2wYTrTdkB3EL9NnzDs8c6AATKpTN7RwXuC+lwxjyfVIEkh
 TzdwiTrkiYf1imai58AnYysl9/11Iz/I/oapn1KQdrJ9YDUXcpUBPeiICllk0TwsxFga
 jitQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103130; x=1734707930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2oYrLMZynfGoehZjWa6pbu2oV1B5fji3Vx4MV4wrlhE=;
 b=qMXqgj5Rn6vZWSgsQWejBPyG52dtsr80Zdx705TX7c+rn4A/9uSWr3z0qaJDgh4u0W
 P7LWaJmJ8bufjc79Dc+t4KzvTMtcu4H6ZgLJv2Eij9C5bVvcKTrvNavmrIEj1DMgtvai
 INIQg3IjPqo3dVFND8V1IG/uPio41TTIlRW1frQHC/WUJVbfLcHf7tkys4QzugKHTSG0
 HQJCTR8d6T2j5cf0xD+IQt8dRF3AmFqbkb4rZcvICj3FpWl5UtpCJNulQrK+mAfnDWhe
 S3JCp4C1ig4DPC9y6N0O6q+xZWScHyGPFodQ+6oV8vOUGqaJir0mSEvkD4enW/HMMjgF
 3WyQ==
X-Gm-Message-State: AOJu0YyJ5PpyCdcUlSxNvMHvzDFHRwY0Ju0l7v/nXw5EoOaB23jK1Uo2
 f7Ohx6+0SRx6IizaDO6sPXnszi5eBsauX7P5369sZcN5poZ4Ld6dRd7XV0pD1fnmJIucD5GeMsW
 BPQ==
X-Gm-Gg: ASbGncszjiKHYnWFn610HwBVdyu/lYbXffJk8x5YYzURTBnn6gUHey8+lebxhVV/WA1
 xvLhe5XuPZgs1Yr8BqCDgoP7fovnYWr57/MfEUm/TWQx0/6bihhos8Oe7TCbfF6o6nNHxS59b47
 cWYlgj+NJUnFYVhdzw637SH7uYLc8iYqDwlBvQccBuG6gle+2GnHr3MFpEZsy7TRpTcmAQO0Z1g
 JLJV79AmCpJ9ufekizmS4qcZrZuYZjiWolMAlBFhoNCJ94snoJ65SaiDpzwXIjeB6cpdjb26x8w
 fPDQphStwwtYdMefsQCTaCTAk71G/syP
X-Received: by 2002:a17:906:6ad1:b0:aab:9257:248d with SMTP id
 a640c23a62f3a-aab92572532mr33295966b.57.1734103130388; 
 Fri, 13 Dec 2024 07:18:50 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.18.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:18:50 -0800 (PST)
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
Subject: [PATCH v13 07/15] hw/misc/pvpanic: Add MMIO interface
Date: Fri, 13 Dec 2024 16:17:57 +0100
Message-Id: <20241213151821.65748-8-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
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
X-TUID: ARg7APIR+A90

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

