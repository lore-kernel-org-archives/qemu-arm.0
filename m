Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1410056ejl;
        Thu, 16 May 2024 07:34:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW87zHhH9AQdfmnNTHkdxP1ezFDXl6+KfhIozcBkrdlc9Uks/lcFHMyLpv6M4YkbbZve1o4qdR+JZY5wM/kOqdDdARVccsu
X-Google-Smtp-Source: AGHT+IE0l2qzP4+zHHK2wJD2kFmP71YlIYw8ZBbfpRGBjOjkY+QfteEhhDX0EuHA5TXPV+HkFlbS
X-Received: by 2002:a05:6602:81c:b0:7e2:1556:738a with SMTP id ca18e2360f4ac-7e21556754emr174403039f.3.1715870091639;
        Thu, 16 May 2024 07:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715870091; cv=none;
        d=google.com; s=arc-20160816;
        b=AMu8JvKF1Tn9BUCNiQcp1KvIrX56/ysd1709Y/lBK8kew9lGkbA5WH+LKLuli6LtZs
         JddNL9PxAf7s+bTeApKizZutF/EgmklxeQSwr1mkcpXUjpZalk8c4VYgF0wMFmT7EMHn
         pHmZN/9Rbv/FxXVn1wK1GB3g3eak/ptBf2/KnnEUHbxXy4k1szixmC/pbwE6xUYsQc0U
         vnLm1TRlNup5pS6FogooqW4OTc9EHPFXhuRuXscy0VuJNhbYUQIwAYuBPpPT1/Nlhji0
         3EyPQ2Gc+MOdVSsp8HsswXBzevYUR4WLzAKnAgE7yNIDMW+0YY0Kg58BT2yc4xeqnAF1
         JRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=no241RHkcyhLATyllSF8NpXhL8pA4FWWRbWtBq5VNzY=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=BBAFA70/Zup1YhwmU5ltIuKTWYMmHEOUBGIkLJUdzhrkMwj1xHnm8I6rsvpGlro1VU
         Rne1kpOioI+7D8qeJz3hAebFa2AuEy6q6C2O29UVlG1W46q7U6cFctd0n3QR8E95XBog
         iFzqrlwiXsNsN5I6PPNrwKbWNFud9gfveYBvukEVNb74jT3PiQU1xdXzGScslbZA1rXu
         2qimbCPJm2sfsIw0LQQWHsF34O3CO36hnuVIsGLWEKL0p2cNISplTSi3u+LWfuXJdgrO
         5tDC2DWm+tMiFOz+BLnb8c8Q8Z0lIONeb2+j1B8YUThKZpVtYIa8Hyvi5jXjp0ABR+Yi
         PlRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=JNh+wzdh;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-489372a1a47si7319982173.131.2024.05.16.07.34.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2024 07:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=JNh+wzdh;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GATgUM029906;
	Thu, 16 May 2024 14:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=no241RHkcyhLATyllSF8NpXhL8pA4FWWRbWtBq5VNzY=; b=JN
	h+wzdhAHtlQhCkj1InHqAbZ/qowWysFBqDEWOIS1OBd+NyNsiYStuDMWPKtGer67
	Aqfrvx1kblIgJpm+IAewyVvkE+yusYn+jk0HSboAIwzsCwovCexlrxzCTpR/J0Uv
	1uyrQkz6h0wFeLcQd2mn9pvE1tUT1tlH/E6+fxzjVJQQH+DaWzouWc0RhpRitxjV
	Ml1eafcti486YG7DzNSILd+zWoTvlMe+WePFResukCfN+P6C9bx7ikJ/JeDMpp0S
	a+Z5eDVfolEZx0Um10Wjnt55MO9nCgOKe+HcSv5YWjxIjsxoX/BTVy8if9GrO+6e
	QBntH6CBDB1PV5IEnoNQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y51tuj643-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEYmuk012831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:48 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 07:34:43 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v2 09/12] gunyah: Customize device-tree
Date: Thu, 16 May 2024 14:33:53 +0000
Message-ID: <20240516143356.1739402-10-quic_svaddagi@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 1KmdDbX_pdjBT2qReCIgibWRVt3lCDZj
X-Proofpoint-GUID: 1KmdDbX_pdjBT2qReCIgibWRVt3lCDZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160103
X-TUID: lStH+sE0dtMp

Customize device-tree with Gunyah specific properties. Some of these
properties include specification of doorbells that need to be created
and associated with various interrupts.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 include/sysemu/gunyah.h   |  2 +
 accel/stubs/gunyah-stub.c |  5 +++
 hw/arm/virt.c             | 11 ++++++
 target/arm/gunyah.c       | 79 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)

diff --git a/include/sysemu/gunyah.h b/include/sysemu/gunyah.h
index ba4862a1a6..58d0379b72 100644
--- a/include/sysemu/gunyah.h
+++ b/include/sysemu/gunyah.h
@@ -30,5 +30,7 @@ DECLARE_INSTANCE_CHECKER(GUNYAHState, GUNYAH_STATE,
                          TYPE_GUNYAH_ACCEL)
 
 int gunyah_arm_set_dtb(uint64_t dtb_start, uint64_t dtb_size);
+void gunyah_arm_fdt_customize(void *fdt, uint64_t mem_base,
+                uint32_t gic_phandle);
 
 #endif  /* QEMU_GUNYAH_H */
diff --git a/accel/stubs/gunyah-stub.c b/accel/stubs/gunyah-stub.c
index 8f6e952938..19649ea40b 100644
--- a/accel/stubs/gunyah-stub.c
+++ b/accel/stubs/gunyah-stub.c
@@ -21,3 +21,8 @@ int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size)
 {
     return -1;
 }
+
+void gunyah_arm_fdt_customize(void *fdt, uint64_t mem_base,
+                uint32_t gic_phandle) {
+    return;
+}
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a485388d3c..b0132beddd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2214,6 +2214,14 @@ static void fdt_add_reserved_memory(VirtMachineState *vms)
     g_free(nodename);
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
@@ -2533,6 +2541,9 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.skip_dtb_autoload = true;
     vms->bootinfo.firmware_loaded = firmware_loaded;
     vms->bootinfo.psci_conduit = vms->psci_conduit;
+    if (gunyah_enabled()) {
+        vms->bootinfo.modify_dtb = virt_modify_dtb;
+    }
     arm_load_kernel(ARM_CPU(first_cpu), machine, &vms->bootinfo);
 
     vms->machine_done.notify = virt_machine_done;
diff --git a/target/arm/gunyah.c b/target/arm/gunyah.c
index d655cd9a79..c33a0c0615 100644
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
@@ -43,3 +46,79 @@ int gunyah_arm_set_dtb(uint64_t dtb_start, uint64_t dtb_size)
 
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
