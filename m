Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919132lfb;
        Wed, 30 Mar 2022 05:56:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvc7lAOUp8wADJAVvfp19jH9t3RfCaaGpf/U6Tuou+hZO/mY2hSXIUpFQTcYda68Otjfvp
X-Received: by 2002:a05:6000:2a4:b0:204:f41:13da with SMTP id l4-20020a05600002a400b002040f4113damr37186838wry.0.1648645011344;
        Wed, 30 Mar 2022 05:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645011; cv=none;
        d=google.com; s=arc-20160816;
        b=eZx+MYtSe9Ggwvn8PZsFKr/i4L+qPn2EH/Zwoxx08VPGgbwWwcW4oTa8Qlm6w+xfpZ
         woYvFcfzhnEbsTZiSEi7u1gD8STG6xtCArtU1mZiHTh0h3zFnfzhJN2wRIMK393rdlfm
         SIsX9TqpqCmfgC+5ami7p2thiNZhTWKsPx/QgVudvWMVorehghqGuNgl1Et7fhmA7q4p
         JO7mXVfm4YZfaa3R0im9bSNTouiz6jEiNdcOEMTiMrFBAl6jiI8ko/050EptHhAH4wMa
         1jZQTR9J+Yr1jtN0b5vvxGQnF2o/0fP+7jcsKbynKv2qe7e+3cYk5RfWhJ8TSsHFkDw/
         ccNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H96vv1RcBAGoFgvB1HCk9RCwLFA8TM2qjMuhFojhGew=;
        b=N4v8EIERF1n8/RL73UdyVVoDmo8iOKUnRbxmPBrBYXZmFrYj85CjyqlVAFG4OowNv1
         4/GkmKB+zO3tdF+b/5/Ys4AcO5HxnvmcCbMMD44hHqqAn0fWVLXRhd0tBuEYRJ4z4irf
         shg8U7uFKqrFuADta1gmZT3kPxgh0uoO964njNvL+PsL/vlXWJDJwSG3p5vJAsFjJOAm
         mNd53EFubFkPQ84iOc7OZpD9hvr9OgdiiPIJSjzS0cmoczqsApSUiByd3PUWNgZ1M/cr
         wJVftUd4+M2HBMk7xJXmZjtSkwJPVvf5pwvfaRR705zGeK/7C1wOPnEtgH0Fg/R77Kqg
         9S0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=xfXg4bxk;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id h23-20020adfa4d7000000b00203e9019491si17939189wrb.533.2022.03.30.05.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=xfXg4bxk;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id 371AB21EC1;
	Wed, 30 Mar 2022 12:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H96vv1RcBAGoFgvB1HCk9RCwLFA8TM2qjMuhFojhGew=;
	b=xfXg4bxk57Fa1BbhihiAaRZLREESNXaV9HG3/3R7a13lWAaTN5VjOk9u3RY9v+8rgwzRog
	XYL6DfT40i2BgxHkfDpAJnc/yTZPvK0Q2TOczMQe+MYZx8RFjdCld4P5FFEgnDfp9vjkKD
	jCINTVviGCrLGmbEedUh5BsdmGvc2K8=
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
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 08/18] hw/arm/arm_cpus: add arm_cpus device
Date: Wed, 30 Mar 2022 14:56:29 +0200
Message-Id: <20220330125639.201937-9-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: 3Z31h2eHj3yu

This object can be used to create a group of homogeneous
arm cpus.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/arm/arm_cpus.h | 45 ++++++++++++++++++++++++++++
 hw/arm/arm_cpus.c         | 63 +++++++++++++++++++++++++++++++++++++++
 hw/arm/meson.build        |  1 +
 3 files changed, 109 insertions(+)
 create mode 100644 include/hw/arm/arm_cpus.h
 create mode 100644 hw/arm/arm_cpus.c

diff --git a/include/hw/arm/arm_cpus.h b/include/hw/arm/arm_cpus.h
new file mode 100644
index 0000000000..8c540d9853
--- /dev/null
+++ b/include/hw/arm/arm_cpus.h
@@ -0,0 +1,45 @@
+/*
+ * ARM CPUs
+ *
+ * Copyright (c) 2022 Greensocs
+ *
+ * This work is licensed under the terms of the GNU GPLv2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_ARM_CPUS_H
+#define HW_ARM_CPUS_H
+
+#include "hw/cpu/cpus.h"
+#include "target/arm/cpu.h"
+
+#define TYPE_ARM_CPUS "arm-cpus"
+OBJECT_DECLARE_SIMPLE_TYPE(ArmCpusState, ARM_CPUS)
+
+/**
+ * ArmCpusState:
+ * @reset_hivecs: use to initialize cpu's reset-hivecs
+ * @has_el3: use to initialize cpu's has_el3
+ * @has_el2: use to initialize cpu's has_el2
+ * @reset_cbar: use to initialize cpu's reset-cbar
+ */
+struct ArmCpusState {
+    CpusState parent_obj;
+
+    bool reset_hivecs;
+    bool has_el3;
+    bool has_el2;
+    uint64_t reset_cbar;
+};
+
+/*
+ * arm_cpus_get_cpu:
+ * Helper to get an ArmCpu from the container.
+ */
+static inline ARMCPU *arm_cpus_get_cpu(ArmCpusState *s, unsigned i)
+{
+    return ARM_CPU(CPUS(s)->cpus[i]);
+}
+
+#endif /* HW_ARM_CPUS_H */
diff --git a/hw/arm/arm_cpus.c b/hw/arm/arm_cpus.c
new file mode 100644
index 0000000000..ed6483f45b
--- /dev/null
+++ b/hw/arm/arm_cpus.c
@@ -0,0 +1,63 @@
+/*
+ * ARM CPUs
+ *
+ * Copyright (c) 2022 Greensocs
+ *
+ * This work is licensed under the terms of the GNU GPLv2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/arm/arm_cpus.h"
+#include "hw/cpu/cpus.h"
+#include "hw/qdev-properties.h"
+#include "cpu.h"
+
+static Property arm_cpus_props[] = {
+    /* FIXME: get the default values from the arm cpu object */
+    DEFINE_PROP_BOOL("reset-hivecs", ArmCpusState, reset_hivecs, false),
+    DEFINE_PROP_BOOL("has_el3", ArmCpusState, has_el3, false),
+    DEFINE_PROP_BOOL("has_el2", ArmCpusState, has_el2, false),
+    DEFINE_PROP_UINT64("reset-cbar", ArmCpusState, reset_cbar, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void arm_cpus_configure_cpu(CpusState *base, CPUState *cpu,
+                                   unsigned i)
+{
+    ArmCpusState *s = ARM_CPUS(base);
+    DeviceState *cpudev = DEVICE(cpu);
+
+    qdev_prop_set_uint32(cpudev, "core-count", base->topology.cpus);
+    qdev_prop_set_bit(cpudev, "reset-hivecs", s->reset_hivecs);
+    qdev_prop_set_bit(cpudev, "has_el3", s->has_el3);
+    qdev_prop_set_bit(cpudev, "has_el2", s->has_el2);
+    qdev_prop_set_uint64(cpudev, "reset-cbar", s->reset_cbar);
+}
+
+static void arm_cpus_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    CpusClass *cc = CPUS_CLASS(klass);
+
+    device_class_set_props(dc, arm_cpus_props);
+
+    cc->configure_cpu = arm_cpus_configure_cpu;
+    cc->base_cpu_type = TYPE_ARM_CPU;
+}
+
+static const TypeInfo arm_cpus_info = {
+    .name              = TYPE_ARM_CPUS,
+    .parent            = TYPE_CPUS,
+    .instance_size     = sizeof(ArmCpusState),
+    .class_init        = arm_cpus_class_init,
+};
+
+static void arm_cpus_register_types(void)
+{
+    type_register_static(&arm_cpus_info);
+}
+
+type_init(arm_cpus_register_types)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 721a8eb8be..feeb301c09 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -58,5 +58,6 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c', 'smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
+arm_ss.add(files('arm_cpus.c'))
 
 hw_arch += {'arm': arm_ss}
-- 
2.35.1
