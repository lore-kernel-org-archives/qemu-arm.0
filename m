Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1409936ejl;
        Thu, 16 May 2024 07:34:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5Ez/oZwcOBd1q8QnHmfw0dvFl0bL/Oyc1wZXFZo/ZVDs9rO/sNedMHf4mCWOpscfX38nHhMbvCOHQkWLgAz4hzuU55PDE
X-Google-Smtp-Source: AGHT+IE0JCyYpf/8exDEClA16pExmKBUIpiKypDCAB7FntjffyG4IHEKmmrJA2FC7HWBRSXzwBJQ
X-Received: by 2002:a25:2b87:0:b0:de5:9f17:1ccc with SMTP id 3f1490d57ef6-dee4f37dbf2mr19120709276.54.1715870081215;
        Thu, 16 May 2024 07:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715870081; cv=none;
        d=google.com; s=arc-20160816;
        b=bzo0/JKx84aypWm15tqjt+M3tYa/IJ41uDEtwFfFpE06wbrgoV4R20Os39U7OwY7b2
         sHbXt3Uot2i77JkFnaUmEzjGB0hvyVGjRuU8wPO+OxQiqI4Jcb8U2bM4ZYctMVv1oOK+
         yV2Qid7RENnnLg5S0SynB3tBht8UMhLqKK/BcTsIPuMBpAGLBiTsce+9EUu6JBvHOLDm
         SP3m3uHNpayWK+FA5cAYBuiGUKYqRt8mA8SbbEv6lSU/9wkT0pa3DygUH76xwQpSBC+Z
         yQOpuf7kKezQ+7qLanPn+Vlfot4Q5vhDvY2jNDVXXrKSxb2NwNnMPCkvjTG7xFzNTqxf
         gceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=diQuupx2W0jCOTed6YvSYWkH5/u7Zh3h3915f87NRrQ=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=pmaYKoGrFCF401dc2QPYBPGLZwbK2OGNp7wRJi/D6IqKoZ+mOrWpx0RDJ9LdfUGLoM
         84m094KXmANrf8XLeLy7L7A3EQE/Hdm0pKhAiyqRBVKPrVHBc+oA47izfob2QMDGFI86
         F6yFkudwqMulop8CBqHXZlgsz5kLYx323/vV395Z2csXd5u3/4eRyxLKgtDPRVL7yClc
         QZ1DcQ2TCZVt0/Q9xJemD57GLOJuwfK+kuqYWmu+BWUjmt3YCPVXNRemcOzyB6vZCxaB
         TwYcg1s2gABTHM6qEsaNxK2M4jqkqEtXPTmAM5sUwSM4JYrdM+LnNT42/ENmobFPujHu
         OA0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=fNNOHznO;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id 3f1490d57ef6-debd37126bcsi7313232276.96.2024.05.16.07.34.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2024 07:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=fNNOHznO;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8nDhJ007619;
	Thu, 16 May 2024 14:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=diQuupx2W0jCOTed6YvSYWkH5/u7Zh3h3915f87NRrQ=; b=fN
	NOHznO5eH+SB4BvqSetNXuIaB6LLWRbeLdxQsc+iE0sJJAsF2tGN6yCXiSio1q1L
	uDpP0oYpxxKrh0Sxu/RgVUEQPT12sMxsPsNB4Qw52Dhgob35eeLpqSLt/PUsYG3k
	f58Qq+eLQ0P8iOetwuPlj0sOXJa1LWERe0m/9M3yf3hrYH1gG31Aljb4RhA7WZSd
	ze7hwoLs0DRkfQrwJxZDFNMzXW1aGfN6M+fHTRp5iydd2gJPwOkP2i991A+EwUdr
	DOQb7+lzFJNHYoLebBiZZURpz/pGvi2oU/2i9BU3rZXBhFwrUkFK3JGQPx13VcK/
	1KVaMACOu6uh/R3wvlNw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47f45uad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEYcb7007332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:38 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 07:34:34 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v2 07/12] gunyah: Add gicv3 interrupt controller
Date: Thu, 16 May 2024 14:33:51 +0000
Message-ID: <20240516143356.1739402-8-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516143356.1739402-1-quic_svaddagi@quicinc.com>
References: <20240516143356.1739402-1-quic_svaddagi@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o982Ok0GBCzhUX00EOCF1kr-sWFcYy6J
X-Proofpoint-ORIG-GUID: o982Ok0GBCzhUX00EOCF1kr-sWFcYy6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160102
X-TUID: tEWDGAXfbtVK

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
 MAINTAINERS                    |   2 +
 include/sysemu/gunyah_int.h    |   3 +
 accel/gunyah/gunyah-all.c      |   5 ++
 hw/arm/virt.c                  |   5 ++
 hw/intc/arm_gicv3_common.c     |   3 +
 hw/intc/arm_gicv3_gunyah.c     | 106 +++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c |   3 +
 hw/intc/meson.build            |   1 +
 8 files changed, 128 insertions(+)
 create mode 100644 hw/intc/arm_gicv3_gunyah.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d8d63b1c3a..d0289ded2f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -529,6 +529,8 @@ S: Maintained
 F: accel/gunyah
 F: include/sysemu/gunyah.h
 F: include/sysemu/gunyah_int.h
+F: target/arm/arm_gicv3_gunyah.c
+F: hw/intc/arm_gicv3_gunyah.c
 
 WHPX CPUs
 M: Sunil Muthuswamy <sunilmut@microsoft.com>
diff --git a/include/sysemu/gunyah_int.h b/include/sysemu/gunyah_int.h
index 8c0b479f62..e19872dae2 100644
--- a/include/sysemu/gunyah_int.h
+++ b/include/sysemu/gunyah_int.h
@@ -44,11 +44,14 @@ struct GUNYAHState {
     int vmfd;
     uint64_t swiotlb_size;
     bool preshmem_reserved;
+    uint32_t preshmem_size;
+    uint32_t nr_irqs;
 };
 
 int gunyah_create_vm(void);
 int gunyah_vm_ioctl(int type, ...);
 void *gunyah_cpu_thread_fn(void *arg);
 int gunyah_add_irqfd(int irqfd, int label, Error **errp);
+GUNYAHState *get_gunyah_state(void);
 
 #endif    /* GUNYAH_INT_H */
diff --git a/accel/gunyah/gunyah-all.c b/accel/gunyah/gunyah-all.c
index 948ccfbeee..d8c3758c59 100644
--- a/accel/gunyah/gunyah-all.c
+++ b/accel/gunyah/gunyah-all.c
@@ -413,6 +413,11 @@ static void gunyah_mem_ioeventfd_del(MemoryListener *listener,
     }
 }
 
+GUNYAHState *get_gunyah_state(void)
+{
+    return GUNYAH_STATE(current_accel());
+}
+
 void *gunyah_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3b0fcf812f..bfb7f3d92e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -694,6 +694,9 @@ static void create_its(VirtMachineState *vms)
         if (!vms->tcg_its) {
             itsclass = NULL;
         }
+    } else if (!strcmp(itsclass, "arm-its-gunyah")) {
+        /* ITS is not yet supported */
+        itsclass = NULL;
     }
 
     if (!itsclass) {
@@ -1996,6 +1999,8 @@ static void finalize_gic_version(VirtMachineState *vms)
                 gics_supported |= VIRT_GIC_VERSION_4_MASK;
             }
         }
+    } else if (gunyah_enabled()) {
+        gics_supported |= VIRT_GIC_VERSION_3_MASK;
     } else {
         error_report("Unsupported accelerator, can not determine GIC support");
         exit(1);
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index bd50a1b079..ec05d31e1b 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -32,6 +32,7 @@
 #include "gicv3_internal.h"
 #include "hw/arm/linux-boot-if.h"
 #include "sysemu/kvm.h"
+#include "sysemu/gunyah.h"
 
 
 static void gicv3_gicd_no_migration_shift_bug_post_load(GICv3State *cs)
@@ -662,6 +663,8 @@ const char *gicv3_class_name(void)
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
index 0b97362cd2..5c424c345b 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -25,6 +25,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
+#include "sysemu/gunyah.h"
 
 static int gicv3_its_pre_save(void *opaque)
 {
@@ -164,6 +165,8 @@ const char *its_class_name(void)
 {
     if (kvm_irqchip_in_kernel()) {
         return "arm-its-kvm";
+    } else if (gunyah_enabled()) {
+        return "arm-its-gunyah";
     } else {
         /* Software emulation based model */
         return "arm-gicv3-its";
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 58140da5f2..39a05af178 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -72,3 +72,4 @@ specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_PIC', if_true: files('loongarch_pch_pic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_PCH_MSI', if_true: files('loongarch_pch_msi.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_EXTIOI', if_true: files('loongarch_extioi.c'))
+specific_ss.add(when: ['CONFIG_ARM_GIC', 'CONFIG_GUNYAH', 'TARGET_AARCH64'], if_true: files('arm_gicv3_gunyah.c'))
-- 
2.25.1
