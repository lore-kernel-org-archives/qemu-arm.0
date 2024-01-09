Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp259911ejs;
        Tue, 9 Jan 2024 01:01:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERnvtH5lWEwlgAA2b5rWpdv+jIO5gWHCC2ThZwkUm+4CE2wtRL30yPvlrVaIsJx7XALIMJ
X-Received: by 2002:a0d:e381:0:b0:5ec:ab18:ba7e with SMTP id m123-20020a0de381000000b005ecab18ba7emr4287524ywe.3.1704790890553;
        Tue, 09 Jan 2024 01:01:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704790890; cv=none;
        d=google.com; s=arc-20160816;
        b=npYQdBQ1Vdst4W6A0HzzVgG16LUb74Hdv3Zv2pV/AmUWwAwDy8jF54gCcErmxYR8Bl
         w5xkzWS/rhrRAfFCT1tCQKxzrtPQdKTdcVUx8m2StHMBkQ+jgpGuANyd0/dl4FVJG6Hs
         kJpDq2+uiVq8CJZZ9qTmb7kHh4bDIv9N/YpZbr/vI6D8EHmv/8F1Q/BecnUGb6BGmdZW
         gcZMobxKuV6tWvCSx88XtSPSdNW6lRnSKMgAP8496XezeVjUJu0YvhdG3kwlf1MCkIIx
         OfIQyn/evb+ezESBxOsqMrjFV1j8sQ3E/DhmgDzXb0y0AB8YkArFjtQ6ZtGRBPczLZiV
         UVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qg6et82kQFPHGaGzJ9Fv3XINC5+HT9KBW7Q2TRZWo0M=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=VUUcZSFmo+eXtdCCJg/4DvtDLVrDpak6KM2csfIk+efwSBAJ0ne7dIR4cFwqutApu+
         DEq13OX03MhpzPi7VebLANQ6DniutwzgtOyNEA4U76789upATv9VqNZsVrikiri/+rpB
         HYPx4os/E0voEWueZw2OA+ewF1Ltmicy4PXz+ikUdWIMMyZgo97Rpwm9eR2O7BTJnZwB
         HOJ4oxfXKoAhYD+sRjRRmqu6iEJtEUDA9ZiSJmN+gFf44ZL+XfdLBFmbvgpwGbykL+r5
         MCq+/acQPf162UqVSmADDu4cZvq1Gg5Fl/GMMJ3e4nkhRbPOyO80SkPjW3Irwt1OWXz2
         KQeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=ClBuAWkk;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id l17-20020a81ad11000000b005d7690328b8si613810ywh.241.2024.01.09.01.01.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jan 2024 01:01:30 -0800 (PST)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=ClBuAWkk;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4093qk6B030231;
	Tue, 9 Jan 2024 09:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Qg6et82kQFPHGaGzJ9Fv3XINC5+HT9KBW7Q2TRZWo0M=; b=Cl
	BuAWkk+jAQQZ70MJuVKIaFGmzzjHADanYpFH7NYlQscz/Lc4S2ejeNiW2/RJZwfH
	dS7kxDJFV+gzOR8PfRZkrt4a3XlBXym6NcLTcpIKTLyRD+5Fpv6tdCMy9kX+f8Xf
	u7dw9nO3oqjbsCajcnSSqXmB6f4HwXqggzR3gXLxyew2Twuv/wAv4+gvKkGTe2c1
	eiEX3MBZ1zWB1xzF63NxmIY5UIPxgMUkB/Vxfq8gG+nrfrCcnBHxxfnzGwwIxyoL
	eNjcEaS1J5NKWbpsWb1C8f/cxsmokVTE9mFtLGoNiJFEbcwacPh+PCI+WL0fZY+1
	uRbBmG/eHq67HITKO+mA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgwsjrkrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 09:01:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40991SLO026771
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 09:01:28 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 01:01:24 -0800
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v1 08/11] gunyah: Customize device-tree
Date: Tue, 9 Jan 2024 09:00:36 +0000
Message-ID: <20240109090039.1636383-9-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109090039.1636383-1-quic_svaddagi@quicinc.com>
References: <20240109090039.1636383-1-quic_svaddagi@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d5M5TsRJt9QdCWpH_zocoRj0VLdTeKQP
X-Proofpoint-ORIG-GUID: d5M5TsRJt9QdCWpH_zocoRj0VLdTeKQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401090070
X-TUID: 6N9pmLw52qmW

Customize device-tree with Gunyah specific properties. Some of these
properties include specification of doorbells that need to be created
and associated with various interrupts.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 accel/stubs/gunyah-stub.c |  5 +++
 hw/arm/virt.c             | 11 ++++++
 include/sysemu/gunyah.h   |  2 +
 target/arm/gunyah.c       | 79 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/accel/stubs/gunyah-stub.c b/accel/stubs/gunyah-stub.c
index faeb2af915..e9a8752bb4 100644
--- a/accel/stubs/gunyah-stub.c
+++ b/accel/stubs/gunyah-stub.c
@@ -16,3 +16,8 @@ int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size)
 {
     return -1;
 }
+
+void gunyah_arm_fdt_customize(void *fdt, uint64_t mem_base,
+                uint32_t gic_phandle) {
+    return;
+}
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 60fbe2f7c4..1aaadc1e1d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2005,6 +2005,14 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
     }
 }
 
+static void virt_modify_dtb(const struct arm_boot_info *binfo, void *fdt)
+{
+    const VirtMachineState *vms = container_of(binfo, VirtMachineState,
+                                                 bootinfo);
+
+    gunyah_arm_fdt_customize(fdt, vms->memmap[VIRT_MEM].base, vms->gic_phandle);
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
@@ -2311,6 +2319,9 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.skip_dtb_autoload = true;
     vms->bootinfo.firmware_loaded = firmware_loaded;
     vms->bootinfo.psci_conduit = vms->psci_conduit;
+    if (gunyah_enabled()) {
+        vms->bootinfo.modify_dtb = virt_modify_dtb;
+    }
     arm_load_kernel(ARM_CPU(first_cpu), machine, &vms->bootinfo);
 
     vms->machine_done.notify = virt_machine_done;
diff --git a/include/sysemu/gunyah.h b/include/sysemu/gunyah.h
index a73d17bfb9..d0c1d8564c 100644
--- a/include/sysemu/gunyah.h
+++ b/include/sysemu/gunyah.h
@@ -28,5 +28,7 @@ DECLARE_INSTANCE_CHECKER(GUNYAHState, GUNYAH_STATE,
                          TYPE_GUNYAH_ACCEL)
 
 int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
+void gunyah_arm_fdt_customize(void *fdt, uint64_t mem_base,
+                uint32_t gic_phandle);
 
 #endif  /* QEMU_GUNYAH_H */
diff --git a/target/arm/gunyah.c b/target/arm/gunyah.c
index 73c1c2a88a..1521f2d414 100644
--- a/target/arm/gunyah.c
+++ b/target/arm/gunyah.c
@@ -11,6 +11,9 @@
 #include "sysemu/gunyah.h"
 #include "sysemu/gunyah_int.h"
 #include "linux-headers/linux/gunyah.h"
+#include "exec/memory.h"
+#include "sysemu/device_tree.h"
+#include "hw/arm/fdt.h"
 
 /*
  * Specify location of device-tree in guest address space.
@@ -43,3 +46,79 @@ int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size)
 
     return 0;
 }
+
+void gunyah_arm_fdt_customize(void *fdt, uint64_t mem_base,
+            uint32_t gic_phandle)
+{
+    char *nodename;
+    int i;
+    GUNYAHState *state = get_gunyah_state();
+
+    qemu_fdt_add_subnode(fdt, "/gunyah-vm-config");
+    qemu_fdt_setprop_string(fdt, "/gunyah-vm-config",
+                                "image-name", "qemu-vm");
+    qemu_fdt_setprop_string(fdt, "/gunyah-vm-config", "os-type", "linux");
+
+    nodename = g_strdup_printf("/gunyah-vm-config/memory");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 2);
+    qemu_fdt_setprop_cell(fdt, nodename, "#size-cells", 2);
+    qemu_fdt_setprop_u64(fdt, nodename, "base-address", mem_base);
+
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/gunyah-vm-config/interrupts");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "config", gic_phandle);
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/gunyah-vm-config/vcpus");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "affinity", "proxy");
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/gunyah-vm-config/vdevices");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "generate", "/hypervisor");
+    g_free(nodename);
+
+    for (i = 0; i < state->nr_slots; ++i) {
+        if (!state->slots[i].start || state->slots[i].lend ||
+                state->slots[i].start == mem_base) {
+            continue;
+        }
+
+        nodename = g_strdup_printf("/gunyah-vm-config/vdevices/shm-%x", i);
+        qemu_fdt_add_subnode(fdt, nodename);
+        qemu_fdt_setprop_string(fdt, nodename, "vdevice-type", "shm");
+        qemu_fdt_setprop_string(fdt, nodename, "push-compatible", "dma");
+        qemu_fdt_setprop(fdt, nodename, "peer-default", NULL, 0);
+        qemu_fdt_setprop_u64(fdt, nodename, "dma_base", 0);
+        g_free(nodename);
+
+        nodename = g_strdup_printf("/gunyah-vm-config/vdevices/shm-%x/memory",
+                                                                        i);
+        qemu_fdt_add_subnode(fdt, nodename);
+        qemu_fdt_setprop_cell(fdt, nodename, "label", i);
+        qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 2);
+        qemu_fdt_setprop_u64(fdt, nodename, "base", state->slots[i].start);
+        g_free(nodename);
+    }
+
+    for (i = 0; i < state->nr_irqs; ++i) {
+        nodename = g_strdup_printf("/gunyah-vm-config/vdevices/bell-%x", i);
+        qemu_fdt_add_subnode(fdt, nodename);
+        qemu_fdt_setprop_string(fdt, nodename, "vdevice-type", "doorbell");
+        char *p = g_strdup_printf("/hypervisor/bell-%x", i);
+        qemu_fdt_setprop_string(fdt, nodename, "generate", p);
+        g_free(p);
+        qemu_fdt_setprop_cell(fdt, nodename, "label", i);
+        qemu_fdt_setprop(fdt, nodename, "peer-default", NULL, 0);
+        qemu_fdt_setprop(fdt, nodename, "source-can-clear", NULL, 0);
+
+        qemu_fdt_setprop_cells(fdt, nodename, "interrupts",
+                GIC_FDT_IRQ_TYPE_SPI, i, GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+
+        g_free(nodename);
+    }
+}
-- 
2.25.1
