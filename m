Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp921426lfm;
        Fri, 26 Jun 2020 16:59:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwRvhxDa5rt+smETnT9NxZasuv4unEFZFAVsXN7v+Hij4y3chxs5sOWs5okZ6veXLUGyWI
X-Received: by 2002:a5b:843:: with SMTP id v3mr9974717ybq.106.1593215991112;
        Fri, 26 Jun 2020 16:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593215991; cv=none;
        d=google.com; s=arc-20160816;
        b=QmpjOn9rkwvZqYxCEYpt7I81p0sBHDll0D5PISo8JCP2m2BA1x4CR8rlKWUHMHw7EU
         uWEm7b37aQhE2FFFKJuxZGpmA6F0c7DcX+rt47hv6+5AvVNvjLqlsQ3DRkEAREeE2/Sd
         tJqcgHp1x3tvQ4JUaWcm/WHc+Lce6TKfCb8EyUdKHppyR1pEVUucp2NdKjCKfQUqeVAs
         r0OJaushdA6gK/F7oHJ6xGWW3NKTXyawQaZYymu7x4Ku/XL9I+37AXkYjb4L15+3fdoW
         p9sDAVbQyxssm0NrTQvP5yqAOj3jmZYnGJZ8KU9+OvJSk3+i78y4y7+tyNFXznejYBIm
         kvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=c4FRN4nMHg8ekZ0T126HkvZJ16z0qmHNtGTXzE8nVaI=;
        b=UvGQBmur6XtFkQsz8UIe9XcK5uiZnjEBjbMS0o/IFOqSkmAB4+UGr+ZZCmon0LGNwl
         H6JHerwmfF9BbhLU8qw+jw56fiSCGbPBa9E1ME6ipZi2K0isO3bPvEuCYWThgQlXR0Hr
         +YUidqHCTkAfsTMi4FwbXDYa3ZXI3QalZP5y4kKjG8578edeKMKjyMlOSoOTffmV/Ltr
         BgfLsFCZRgv4RCRwlLP1ITvxUrYp8M4YkTp58+7EAvE7x1IiAgFnYsFI82LPkteZQwJd
         TvRVbLSpbyKxdiSzOgl1Bek84NYgyJsBNqnK+zHpoPNmKiNiIgIYL9KPcid+5uyojN6f
         vMyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=fI1n0wf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l198si27526269ybl.6.2020.06.26.16.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 16:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=fI1n0wf6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joyG6-0006Yc-Fu
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 19:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3DYv2XgsKCPojumkppgoqgpiqqing.eqosgow-ctopqpipw.qti@flex--hskinnemoen.bounces.google.com>)
 id 1joyCQ-0007xQ-8Q
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 19:56:02 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:56329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3DYv2XgsKCPojumkppgoqgpiqqing.eqosgow-ctopqpipw.qti@flex--hskinnemoen.bounces.google.com>)
 id 1joyCN-0002Ax-8j
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 19:56:01 -0400
Received: by mail-yb1-xb49.google.com with SMTP id e20so11453998ybc.23
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2020 16:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=c4FRN4nMHg8ekZ0T126HkvZJ16z0qmHNtGTXzE8nVaI=;
 b=fI1n0wf6OCtOvFmCQH2flMysGibux5mIw8PsXk/N5j8Jr+s93xan3VLR+Q+QpKpCzn
 Mqakyv5ishfbxJ1UCgnKsJibWaM2/mCEpKnsgN4PgA0IbJKmUn/8vmDLT9p77Qp187ZS
 rS03ycBK3TquyCGfEVGSuNLNgkc8rgc0mKloS9oyyFQee3gKW6npw7Gs8uoiISPL1m5C
 LJVNKxpCp5xBNj6KUDBnnVJ3wKoC6/vYJMxOkd/rSj7fEM+WeZxqKtP4N6xrtlrN5sua
 SMaWqjiX4luw9sE6KWFvYcZnefmlT59uIQEfArGX4lMrjpions5cjlLOalZGP/l0aJrB
 lKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=c4FRN4nMHg8ekZ0T126HkvZJ16z0qmHNtGTXzE8nVaI=;
 b=Hns7SzLoDElbH/WcX+HOJTAe6TF+/WS0NrDZTotsTm8wGjFWiw9WQRc8afZlLhvd+Q
 5zL/7WksuWfe5lkbdsGE7N1K0G1eSxbsnAoPPFoJ2q7POztN3BwxBX1QiWMgi+6Ohj5A
 hksQ3WRMWu0yK9rt+D5jXTBdqU4LckZSSfwOlcA7shW5ZzvTSEBsnSKY8UNgd+Q7wRTq
 KsXFURFMugEwYu7Nphd37pJu+rVHpz/9l+BTs9gSVaoXEr6klGgBWSAk+y4EfWrwkLQo
 Vo3w/KaK1xR85r2KaBvrDd6OucqvXALx74qduVfO1uiUWpMmApMGt1F/EoYIT6RcKJZ8
 2/IA==
X-Gm-Message-State: AOAM531KxiBVrsoEG1RuPEpxdUYgk2KD6Ym7KfkisgYf9UMf7PGPMmO0
 gOrCT6FLzaBg9rh49a95TPNtemuLmD7Ibluzig==
X-Received: by 2002:a05:6902:100b:: with SMTP id
 w11mr6295345ybt.232.1593215757182; 
 Fri, 26 Jun 2020 16:55:57 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:55:16 -0700
In-Reply-To: <20200626235519.591734-1-hskinnemoen@google.com>
Message-Id: <20200626235519.591734-10-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v3 09/12] hw/mem: Stubbed out NPCM7xx Memory Controller model
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, clg@kaod.org, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3DYv2XgsKCPojumkppgoqgpiqqing.eqosgow-ctopqpipw.qti@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jviMO136dszJ

This just implements the bare minimum to cause the boot block to skip
memory initialization.

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx.c            | 10 +++++
 hw/mem/Makefile.objs        |  1 +
 hw/mem/npcm7xx_mc.c         | 83 +++++++++++++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h    |  2 +
 include/hw/mem/npcm7xx_mc.h | 35 ++++++++++++++++
 5 files changed, 131 insertions(+)
 create mode 100644 hw/mem/npcm7xx_mc.c
 create mode 100644 include/hw/mem/npcm7xx_mc.h

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 825910a4bf..4ab7fdd405 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -45,6 +45,7 @@
 #define NPCM7XX_CPUP_BA         (0xF03FE000)
 #define NPCM7XX_GCR_BA          (0xF0800000)
 #define NPCM7XX_CLK_BA          (0xF0801000)
+#define NPCM7XX_MC_BA           (0xF0824000)
=20
 /* Memory blocks at the end of the address space */
 #define NPCM7XX_RAM2_BA         (0xFFFD0000)
@@ -159,6 +160,7 @@ static void npcm7xx_init(Object *obj)
                             TYPE_NPCM7XX_KEY_STORAGE);
     object_initialize_child(obj, "otp2", &s->fuse_array,
                             TYPE_NPCM7XX_FUSE_ARRAY);
+    object_initialize_child(obj, "mc", &s->mc, TYPE_NPCM7XX_MC);
=20
     for (i =3D 0; i < ARRAY_SIZE(s->tim); i++) {
         object_initialize_child(obj, "tim[*]", &s->tim[i], TYPE_NPCM7XX_TI=
MER);
@@ -257,6 +259,14 @@ static void npcm7xx_realize(DeviceState *dev, Error **=
errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->fuse_array), 0, NPCM7XX_OTP2_BA);
     npcm7xx_init_fuses(s);
=20
+    /* Fake Memory Controller (MC) */
+    sysbus_realize(SYS_BUS_DEVICE(&s->mc), &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->mc), 0, NPCM7XX_MC_BA);
+
     /* Timer Modules (TIM) */
     QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_tim_addr) !=3D ARRAY_SIZE(s->tim)=
);
     for (i =3D 0; i < ARRAY_SIZE(s->tim); i++) {
diff --git a/hw/mem/Makefile.objs b/hw/mem/Makefile.objs
index 56345befd0..9a33ef7b35 100644
--- a/hw/mem/Makefile.objs
+++ b/hw/mem/Makefile.objs
@@ -1,3 +1,4 @@
 common-obj-$(CONFIG_DIMM) +=3D pc-dimm.o
 common-obj-y +=3D memory-device.o
+common-obj-$(CONFIG_NPCM7XX) +=3D npcm7xx_mc.o
 common-obj-$(CONFIG_NVDIMM) +=3D nvdimm.o
diff --git a/hw/mem/npcm7xx_mc.c b/hw/mem/npcm7xx_mc.c
new file mode 100644
index 0000000000..03a7fb53dc
--- /dev/null
+++ b/hw/mem/npcm7xx_mc.c
@@ -0,0 +1,83 @@
+/*
+ * Nuvoton NPCM7xx Memory Controller stub
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/mem/npcm7xx_mc.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+
+#define NPCM7XX_MC_REGS_SIZE (4 * KiB)
+
+static uint64_t npcm7xx_mc_read(void *opaque, hwaddr addr, unsigned int si=
ze)
+{
+    /*
+     * If bits 8..11 @ offset 0 are not zero, the boot block thinks the me=
mory
+     * controller has already been initialized and will skip DDR training.
+     */
+    if (addr =3D=3D 0) {
+        return 0x100;
+    }
+
+    qemu_log_mask(LOG_UNIMP, "%s: mostly unimplemented\n", __func__);
+
+    return 0;
+}
+
+static void npcm7xx_mc_write(void *opaque, hwaddr addr, uint64_t v,
+                             unsigned int size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: mostly unimplemented\n", __func__);
+}
+
+static const MemoryRegionOps npcm7xx_mc_ops =3D {
+    .read =3D npcm7xx_mc_read,
+    .write =3D npcm7xx_mc_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4,
+        .unaligned =3D false,
+    },
+};
+
+static void npcm7xx_mc_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxMCState *s =3D NPCM7XX_MC(dev);
+
+    memory_region_init_io(&s->mmio, OBJECT(s), &npcm7xx_mc_ops, s, "regs",
+                          NPCM7XX_MC_REGS_SIZE);
+    sysbus_init_mmio(&s->parent, &s->mmio);
+}
+
+static void npcm7xx_mc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->desc =3D "NPCM7xx Memory Controller stub";
+    dc->realize =3D npcm7xx_mc_realize;
+}
+
+static const TypeInfo npcm7xx_mc_types[] =3D {
+    {
+        .name =3D TYPE_NPCM7XX_MC,
+        .parent =3D TYPE_SYS_BUS_DEVICE,
+        .instance_size =3D sizeof(NPCM7xxMCState),
+        .class_init =3D npcm7xx_mc_class_init,
+    },
+};
+DEFINE_TYPES(npcm7xx_mc_types);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 360cd965a7..8f49f7015c 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -17,6 +17,7 @@
=20
 #include "hw/boards.h"
 #include "hw/cpu/a9mpcore.h"
+#include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
 #include "hw/nvram/npcm7xx_otp.h"
@@ -65,6 +66,7 @@ typedef struct NPCM7xxState {
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxOTPState     key_storage;
     NPCM7xxOTPState     fuse_array;
+    NPCM7xxMCState      mc;
 } NPCM7xxState;
=20
 #define TYPE_NPCM7XX    "npcm7xx"
diff --git a/include/hw/mem/npcm7xx_mc.h b/include/hw/mem/npcm7xx_mc.h
new file mode 100644
index 0000000000..8781f5c979
--- /dev/null
+++ b/include/hw/mem/npcm7xx_mc.h
@@ -0,0 +1,35 @@
+/*
+ * Nuvoton NPCM7xx Memory Controller stub
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+#ifndef NPCM7XX_MC_H
+#define NPCM7XX_MC_H
+
+#include "exec/memory.h"
+#include "hw/sysbus.h"
+
+/**
+ * struct NPCM7xxMCState - Device state for the memory controller.
+ * @parent: System bus device.
+ * @mmio: Memory region through which registers are accessed.
+ */
+typedef struct NPCM7xxMCState {
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+} NPCM7xxMCState;
+
+#define TYPE_NPCM7XX_MC "npcm7xx-mc"
+#define NPCM7XX_MC(obj) OBJECT_CHECK(NPCM7xxMCState, (obj), TYPE_NPCM7XX_M=
C)
+
+#endif /* NPCM7XX_MC_H */
--=20
2.27.0.212.ge8ba1cc988-goog

