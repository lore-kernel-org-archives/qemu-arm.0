Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp224825ejc;
        Wed, 11 Oct 2023 09:53:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRjT+KYEXyMWUrVjRf3SZ9tdz2hyeyibWkwHdsTMaAoXMYC4TEwzlHXITpzUVs+7fM0um6
X-Received: by 2002:a17:90b:1d0d:b0:277:1070:7494 with SMTP id on13-20020a17090b1d0d00b0027710707494mr19215041pjb.46.1697043202654;
        Wed, 11 Oct 2023 09:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697043202; cv=none;
        d=google.com; s=arc-20160816;
        b=VHKa632kGudC/ATtd0ZUmSv4/GPvyJjQPEvkBXhfHj0GDRyBOLcPxMRYKEVfEzV2tU
         bbd4kGXJpi13rgLS5uwa4Vtpt+vzjD+J2QWq9hP8d1s2iypFlOFKolTzrb7xpuK/bUTA
         wtjDhkaDLwyoy85hxjJ/LXYwZO7uN4h0OTD5+WPUWy2e/mYFAgbFe9YLb7XL9Ko7gK/U
         mGqdGyDR9/9SRC47qEiri2THo/mW56OINSY9PlNS1gEEwrSvrygCjuiwCUuVt0G+Z+pj
         TMG2vXrUbWfsDh0E6ITdhz4R/8bQKVK8Jz4a2z4lyuOWCNaUusfZxHEdNeMpz6i+50O3
         06+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=D8ZX6LZuRYc6nni5b88hoSIqLdJHmcONqWQXqoXKxdM=;
        fh=mISachWtBfNM+xwhtkUSxPXJbL9QWI2VyucuYtl+xAM=;
        b=sd8eShJNKzwDCJKrvOvDT6Fny3DfFwP5HrYPlux+vWJtC6mJi0z23rDJfQLpzSS/AW
         G6tJ/9PcVJIHj4H+ulOHpuytNiu6xGURz6GpSTvlKgqZ1F4JMOtRuy1vjXhFwWe5kd2G
         ROqPvviNn/qaO/oJzC/DOvhsFsykKZLMrWfEbx3uvLBQ/+hT6wH2/FgZxN0KnIlLJW/x
         Qn9n30C+IpYKqk7GxWX51ibqrvahFFPHSVK9+i5xBFe2Z/Cq9aOX1HqQZdVea04HignC
         2WcDF97rFStNlBSfNUU3NChTQo5aORjDnr2X7WZy2nzNZBYl4a3DwfY2kU0nVYoYbXCg
         I6ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=oYs7ehwq;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id mi9-20020a17090b4b4900b00276c22ca6a4si231685pjb.147.2023.10.11.09.53.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 09:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=oYs7ehwq;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BCPlIi021200;
	Wed, 11 Oct 2023 16:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=D8ZX6LZuRYc6nni5b88hoSIqLdJHmcONqWQXqoXKxdM=;
 b=oYs7ehwqOUDHNvVMCGautD/cxLKGUZJ7fS146azXdNdgCnwpESoNwgXugXF+B1QFOmAm
 f2j7SDwH87VweDX/zYH/UT8D6NoY68/wPHvqoZGBLhTfiKyk5I64OQF/h2yz8GycBebY
 KQKGNqtgU+LUUskAtaY3r+jrMYjqaehKX4RpFM5y9zi+hg0XLYcLS4jFYpqUOIy4sZyh
 9DQX+6RQ68jxovqG23v58tc/tWX3jCp5W77nUwb/3oCUhCP8GuEvEp6JIJXWHLn5fttI
 KNQ/2oH94u/1V7SAJ+5pMZ28iEBhCKwjkGJAmkCtODiXv04jv68XFjUMqPY4AwvXrECe XA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnstyryst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:53:18 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGrIVQ008078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:53:18 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 11 Oct 2023 09:53:14 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v0 07/12] gunyah: Add gicv3 interrupt controller
Date: Wed, 11 Oct 2023 16:52:29 +0000
Message-ID: <20231011165234.1323725-8-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wfMibsDxk4aOFtJvi7tvicepRX4S5G4P
X-Proofpoint-GUID: wfMibsDxk4aOFtJvi7tvicepRX4S5G4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110148
X-TUID: Kxf3JUSHD7n0

Gunyah hypervisor supports emulation of a GICv3 compatible interrupt
controller. Emulation is handled by hypervisor itself, with Qemu being
allowed to specify some of the properties such as IO address at which
GICv3 should be mapped in guest address space. These properties are
conveyed to hypervisor via the device-tree, which is parsed by
hypervisor (or more specifically Resource Manager VM, which is the
trusted agent of hypervisor), before VM begins execution.

Injection of interrupts inside guest is supported by doorbell API of
Gunyah hypervisor. Each doorbell is associated with a specific
interrupt. An eventfd is created and associated with each doorbell/irq.
Injection of a specific irq is accomplished by writing to the eventfd
associated with that irq.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 MAINTAINERS                    |   1 +
 accel/gunyah/gunyah-all.c      |   5 ++
 hw/arm/virt.c                  |   2 +
 hw/intc/arm_gicv3_common.c     |   3 +
 hw/intc/arm_gicv3_gunyah.c     | 106 +++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c |   4 ++
 hw/intc/meson.build            |   1 +
 include/sysemu/gunyah_int.h    |   2 +
 8 files changed, 124 insertions(+)
 create mode 100644 hw/intc/arm_gicv3_gunyah.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e76dda91d..368ba02dce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -515,6 +515,7 @@ M: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
 S: Maintained
 F: accel/gunyah
 F: include/sysemu/gunyah.h
+F: target/arm/arm_gicv3_gunyah.c
 F: include/sysemu/gunyah_int.h
 
 WHPX CPUs
diff --git a/accel/gunyah/gunyah-all.c b/accel/gunyah/gunyah-all.c
index 6ec60aa8e8..ea6c74fdc6 100644
--- a/accel/gunyah/gunyah-all.c
+++ b/accel/gunyah/gunyah-all.c
@@ -410,3 +410,8 @@ static void gunyah_mem_ioeventfd_del(MemoryListener *listener,
         exit(1);
     }
 }
+
+GUNYAHState *get_gunyah_state(void)
+{
+    return GUNYAH_STATE(current_accel());
+}
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4222183eb5..0d4c5aa819 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1937,6 +1937,8 @@ static void finalize_gic_version(VirtMachineState *vms)
                 gics_supported |= VIRT_GIC_VERSION_4_MASK;
             }
         }
+    } else if (gunyah_enabled()) {
+        gics_supported |= VIRT_GIC_VERSION_3_MASK;
     } else {
         error_report("Unsupported accelerator, can not determine GIC support");
         exit(1);
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 2ebf880ead..74c7117b89 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -32,6 +32,7 @@
 #include "gicv3_internal.h"
 #include "hw/arm/linux-boot-if.h"
 #include "sysemu/kvm.h"
+#include "sysemu/gunyah.h"
 
 
 static void gicv3_gicd_no_migration_shift_bug_post_load(GICv3State *cs)
@@ -614,6 +615,8 @@ const char *gicv3_class_name(void)
 {
     if (kvm_irqchip_in_kernel()) {
         return "kvm-arm-gicv3";
+    } else if (gunyah_enabled()) {
+        return "gunyah-arm-gicv3";
     } else {
         if (kvm_enabled()) {
             error_report("Userspace GICv3 is not supported with KVM");
diff --git a/hw/intc/arm_gicv3_gunyah.c b/hw/intc/arm_gicv3_gunyah.c
new file mode 100644
index 0000000000..f52e82bf9a
--- /dev/null
+++ b/hw/intc/arm_gicv3_gunyah.c
@@ -0,0 +1,106 @@
+/*
+ * QEMU Gunyah hypervisor support
+ *
+ * Copyright(c) 2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "hw/intc/arm_gicv3_common.h"
+#include "qemu/error-report.h"
+#include "qemu/module.h"
+#include "sysemu/gunyah.h"
+#include "sysemu/gunyah_int.h"
+#include "sysemu/runstate.h"
+#include "gicv3_internal.h"
+#include "vgic_common.h"
+#include "migration/blocker.h"
+#include "qom/object.h"
+#include "target/arm/cpregs.h"
+#include "qemu/event_notifier.h"
+
+struct GUNYAHARMGICv3Class {
+    ARMGICv3CommonClass parent_class;
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
+
+#define TYPE_GUNYAH_ARM_GICV3 "gunyah-arm-gicv3"
+typedef struct GUNYAHARMGICv3Class GUNYAHARMGICv3Class;
+
+/* This is reusing the GICv3State typedef from ARM_GICV3_ITS_COMMON */
+DECLARE_OBJ_CHECKERS(GICv3State, GUNYAHARMGICv3Class,
+                     GUNYAH_ARM_GICV3, TYPE_GUNYAH_ARM_GICV3)
+
+static EventNotifier *irq_notify;
+
+static void gunyah_arm_gicv3_set_irq(void *opaque, int irq, int level)
+{
+    GICv3State *s = (GICv3State *)opaque;
+
+    if (irq < s->num_irq - GIC_INTERNAL) {
+        event_notifier_set(&irq_notify[irq]);
+    }
+}
+
+static void gunyah_arm_gicv3_realize(DeviceState *dev, Error **errp)
+{
+    GICv3State *s = GUNYAH_ARM_GICV3(dev);
+    GUNYAHARMGICv3Class *ggc = GUNYAH_ARM_GICV3_GET_CLASS(s);
+    Error *local_err = NULL;
+    int i;
+    GUNYAHState *state = get_gunyah_state();
+
+    ggc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (s->revision != 3) {
+        error_setg(errp, "unsupported GIC revision %d for in-kernel GIC",
+                   s->revision);
+        return;
+    }
+
+    gicv3_init_irqs_and_mmio(s, gunyah_arm_gicv3_set_irq, NULL);
+
+    irq_notify = g_malloc_n(s->num_irq - GIC_INTERNAL, sizeof(EventNotifier));
+
+    for (i = 0; i < s->num_irq - GIC_INTERNAL; ++i) {
+        event_notifier_init(&irq_notify[i], 0);
+        gunyah_add_irqfd(irq_notify[i].wfd, i, errp);
+    }
+
+    state->nr_irqs = s->num_irq - GIC_INTERNAL;
+}
+
+static void gunyah_arm_gicv3_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    GUNYAHARMGICv3Class *ggc = GUNYAH_ARM_GICV3_CLASS(klass);
+
+    device_class_set_parent_realize(dc, gunyah_arm_gicv3_realize,
+                                    &ggc->parent_realize);
+    resettable_class_set_parent_phases(rc, NULL, NULL, NULL,
+                                       &ggc->parent_phases);
+}
+
+static const TypeInfo gunyah_arm_gicv3_info = {
+    .name = TYPE_GUNYAH_ARM_GICV3,
+    .parent = TYPE_ARM_GICV3_COMMON,
+    .instance_size = sizeof(GICv3State),
+    .class_init = gunyah_arm_gicv3_class_init,
+    .class_size = sizeof(GUNYAHARMGICv3Class),
+};
+
+static void gunyah_arm_gicv3_register_types(void)
+{
+    type_register_static(&gunyah_arm_gicv3_info);
+}
+
+type_init(gunyah_arm_gicv3_register_types)
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index abaf77057e..c225c601ab 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -25,6 +25,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
+#include "sysemu/gunyah.h"
 
 static int gicv3_its_pre_save(void *opaque)
 {
@@ -165,6 +166,9 @@ const char *its_class_name(void)
     if (kvm_irqchip_in_kernel()) {
         /* KVM implementation requires this capability */
         return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
+    } else if (gunyah_enabled()) {
+        /* ITS is not yet supported */
+        return NULL;
     } else {
         /* Software emulation based model */
         return "arm-gicv3-its";
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index ed355941d1..6e680cf0f2 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -73,3 +73,4 @@ specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_EXTIOI', if_true: files('loongarch_extioi.c'))
+specific_ss.add(when: ['CONFIG_ARM_GIC', 'CONFIG_GUNYAH', 'TARGET_AARCH64'], if_true: files('arm_gicv3_gunyah.c'))
diff --git a/include/sysemu/gunyah_int.h b/include/sysemu/gunyah_int.h
index 011b5a072c..dc5b4847a9 100644
--- a/include/sysemu/gunyah_int.h
+++ b/include/sysemu/gunyah_int.h
@@ -45,11 +45,13 @@ struct GUNYAHState {
     bool is_protected_vm;
     bool preshmem_reserved;
     uint32_t preshmem_size;
+    uint32_t nr_irqs;
 };
 
 int gunyah_create_vm(void);
 int gunyah_vm_ioctl(int type, ...);
 void *gunyah_cpu_thread_fn(void *arg);
 int gunyah_add_irqfd(int irqfd, int label, Error **errp);
+GUNYAHState *get_gunyah_state(void);
 
 #endif    /* GUNYAH_INT_H */
-- 
2.25.1
