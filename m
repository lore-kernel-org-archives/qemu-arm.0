Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919200lfb;
        Wed, 30 Mar 2022 05:56:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9A0xN+Jij8pdFQlUBaSOSZSJwBR1M7blh96DVrR40m+Ri26AwkzHu7i3Ui54be/l7Ktux
X-Received: by 2002:a05:600c:4e06:b0:38d:6ff:62df with SMTP id b6-20020a05600c4e0600b0038d06ff62dfmr4248010wmq.145.1648645016552;
        Wed, 30 Mar 2022 05:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645016; cv=none;
        d=google.com; s=arc-20160816;
        b=ebiZEodE0X92Dld9apmv2TK5pF9ASxkt0IAk6nNzpGYsMSz2KiMNPULCjzKjawBGaP
         OqQ4I9b3oVI12KNQ0qhzOymOtXKoUEs9nHM7yp5S13oPo/3EmeLmbg2jVpdR81T/ZHyH
         X1dndB2PB208e/MLYhrtTowa1HM2EK+UrDXdJa1Da6C/YwuSnbf4BFhCgDkUWXHbUNdh
         LFiABrTFf50U3DFBsPqwrCetRDtuWEUxmVZd7OXXT5MyLZNmigCiXG1I/YeJyDu7qPd/
         xycWCMalj6s4vUOQ5xLeJ9/LkZeMn+JCsjTs0SxkdZHuF6etV3wz1eUL9z9tWraekgc3
         fenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nd0l66pK/eqKazwea3zL1B+q/z68d1eWANZjxDruLgA=;
        b=puOJD63j9omdzmqhraG0gp0WUjcYwYkMJCtiZrzjtX72v9W2tQlVcYVfg+NjA77TPE
         Z0XzV/JLntg7Y9P1Fdji/v3w34oJGOQCgJ1pjPoTrMYPlbM66SoLXlX213On4GfPvRqS
         PEBfDRaEfhqCcc4C/6UpUpya9c/UjTTPRK6OuUyZIXkY3SNc6pXHUX1pEQTueTpMqXkh
         BAcfrDwi63BNCHndbs4yan6xPl4aADvNmzanZzS0SKx8hY2u7a0erpYJkr2UPP2Xk1js
         zwtEFr8GxafN13uP9Ki1Dfncyalw87eVJn6oM1kV8G9BoPxbBOBr/LTSLizFV93ykwIW
         eeMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=DpL7ux4F;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id l42-20020a05600c1d2a00b0038ceb9cbd41si5860237wms.108.2022.03.30.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=DpL7ux4F;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id C363B21ECF;
	Wed, 30 Mar 2022 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nd0l66pK/eqKazwea3zL1B+q/z68d1eWANZjxDruLgA=;
	b=DpL7ux4Fho7/Trlxj2KjAch7Uqcq5FMCJGSF7ohDfZIa0Shqb7lvdRjxLocbRr9tOX0Dr4
	DhZ8LfA0ddZP9EGvqxdgKowkIRxXQJMrVlC2UBZa8+2wSwiUBDocgP5kS7w8g+sM/CSXHk
	WdKvvqLl7PY+FkEbT6aDT8UELAe7WVg=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Vijai Kumar K <vijai@behindbytes.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 14/18] hw/riscv/riscv_hart: use cpus as base class
Date: Wed, 30 Mar 2022 14:56:35 +0200
Message-Id: <20220330125639.201937-15-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: FBTgK2LXkELJ

This is a drastic update: qom-path of riscv harts are changed
by this patch from "/path/to/array/hart[n]" to "/path/to/array/cpu[n]".

This object is now not anymore a SYS_BUS_DEVICE.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

I expect it is an issue regarding migration of riscv machines.
It is possible to keep an "hart[n]" alias to "cpu[n]" or even
to be able to configure the cpu child basename to "hart".

I'm not sure what we need to keep migration working: Does qom-path
has to stay identical ? Or having aliases is ok ?

Any ideas or comments ?

Any of these changes could be fixed by adding support in the base class
(child name, sysbus device, ...) if needed.
---
 include/hw/riscv/riscv_hart.h | 17 ++++++------
 hw/riscv/riscv_hart.c         | 49 ++++++++++++++---------------------
 2 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 71747bf37c..65ac0d2bc4 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -21,7 +21,7 @@
 #ifndef HW_RISCV_HART_H
 #define HW_RISCV_HART_H
 
-#include "hw/sysbus.h"
+#include "hw/cpu/cpus.h"
 #include "target/riscv/cpu.h"
 #include "qom/object.h"
 
@@ -31,30 +31,29 @@ OBJECT_DECLARE_SIMPLE_TYPE(RISCVHartArrayState, RISCV_HART_ARRAY)
 
 struct RISCVHartArrayState {
     /*< private >*/
-    SysBusDevice parent_obj;
+    CpusState parent_obj;
 
     /*< public >*/
-    uint32_t num_harts;
     uint32_t hartid_base;
-    char *cpu_type;
     uint64_t resetvec;
-    RISCVCPU *harts;
 };
 
 /**
  * riscv_array_get_hart:
+ * Helper to get an hart from the container.
  */
-static inline RISCVCPU *riscv_array_get_hart(RISCVHartArrayState *harts, int i)
+static inline RISCVCPU *riscv_array_get_hart(RISCVHartArrayState *s, int i)
 {
-    return &harts->harts[i];
+    return RISCV_CPU(CPUS(s)->cpus[i]);
 }
 
 /**
  * riscv_array_get_num_harts:
+ * Helper to get the number of harts in the container.
  */
-static inline unsigned riscv_array_get_num_harts(RISCVHartArrayState *harts)
+static inline unsigned riscv_array_get_num_harts(RISCVHartArrayState *s)
 {
-    return harts->num_harts;
+    return CPUS(s)->topology.cpus;
 }
 
 /* Temporary function until we migrated the riscv hart array to simple device */
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 780fd3a59a..1b4ff7e3c6 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -22,67 +22,58 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "sysemu/reset.h"
-#include "hw/sysbus.h"
 #include "target/riscv/cpu.h"
 #include "hw/qdev-properties.h"
 #include "hw/riscv/riscv_hart.h"
+#include "hw/cpu/cpus.h"
 
 void riscv_hart_array_realize(RISCVHartArrayState *state, Error **errp)
 {
-    sysbus_realize(SYS_BUS_DEVICE(state), errp);
+    /* disable the clustering */
+    cpus_disable_clustering(CPUS(state));
+    qdev_realize(DEVICE(state), NULL, errp);
 }
 
 static Property riscv_harts_props[] = {
-    DEFINE_PROP_UINT32("num-harts", RISCVHartArrayState, num_harts, 1),
     DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
-    DEFINE_PROP_STRING("cpu-type", RISCVHartArrayState, cpu_type),
     DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
                        DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void riscv_harts_cpu_reset(void *opaque)
+static void riscv_harts_configure_cpu(CpusState *base, CPUState *cpu,
+                                      unsigned i)
 {
-    RISCVCPU *cpu = opaque;
-    cpu_reset(CPU(cpu));
-}
+    RISCVHartArrayState *s = RISCV_HART_ARRAY(base);
+    DeviceState *cpudev = DEVICE(cpu);
+    CPURISCVState *cpuenv = cpu->env_ptr;
 
-static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
-                               char *cpu_type, Error **errp)
-{
-    object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_type);
-    qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec);
-    s->harts[idx].env.mhartid = s->hartid_base + idx;
-    qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
-    return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
+    qdev_prop_set_uint64(cpudev, "resetvec", s->resetvec);
+    cpuenv->mhartid = s->hartid_base + i;
 }
 
-static void riscv_harts_realize(DeviceState *dev, Error **errp)
+static void riscv_harts_init(Object *obj)
 {
-    RISCVHartArrayState *s = RISCV_HART_ARRAY(dev);
-    int n;
-
-    s->harts = g_new0(RISCVCPU, s->num_harts);
-
-    for (n = 0; n < s->num_harts; n++) {
-        if (!riscv_hart_realize(s, n, s->cpu_type, errp)) {
-            return;
-        }
-    }
+    /* add a temporary property to keep num-harts */
+    object_property_add_alias(obj, "num-harts", obj, "num-cpus");
 }
 
 static void riscv_harts_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    CpusClass *cc = CPUS_CLASS(klass);
 
     device_class_set_props(dc, riscv_harts_props);
-    dc->realize = riscv_harts_realize;
+
+    cc->base_cpu_type = TYPE_RISCV_CPU;
+    cc->configure_cpu = riscv_harts_configure_cpu;
 }
 
 static const TypeInfo riscv_harts_info = {
     .name          = TYPE_RISCV_HART_ARRAY,
-    .parent        = TYPE_SYS_BUS_DEVICE,
+    .parent        = TYPE_CPUS,
     .instance_size = sizeof(RISCVHartArrayState),
+    .instance_init = riscv_harts_init,
     .class_init    = riscv_harts_class_init,
 };
 
-- 
2.35.1
