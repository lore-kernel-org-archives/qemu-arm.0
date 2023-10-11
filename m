Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp224888ejc;
        Wed, 11 Oct 2023 09:53:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGfSuQS0T5GFzpAGIBbBFp1B5yZSa70RESNNma/FsxLQr27YUvlzHzyMWK8TQPh3jh04hU
X-Received: by 2002:a25:6a42:0:b0:d7f:3e2:dd99 with SMTP id f63-20020a256a42000000b00d7f03e2dd99mr17894579ybc.0.1697043208428;
        Wed, 11 Oct 2023 09:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697043208; cv=none;
        d=google.com; s=arc-20160816;
        b=hc7XH22l9kwfKYeYAzDlfbL+9kWSZXP1FWHwD4PkwvzMmkHsFlpYv3Y1dr9EomyHDb
         euKQuctvkbWx2IGMGbJjJsOHP9i6WjbPNdpbTtepy/loRQqmDGXwhM7zYUdODOeSJ9zC
         3RXx5JY8jCQh1KEZbwouEjkpm8VKjmXasFNT056Y7bhRT/97b32lwYSWpBE6MquCt7zL
         9cuG8YbT7PCkw9h6s9Br0YNEp3J0SqRHkU/w1Ef3gdLfNPsl0TruBaO97xj/G+G8PEHn
         N7lvlptSYsiDXvVeA/aq2R1XLxCb5xQvqCG8v6qOs9PwLSTCMLcmLkXsCSlFyFKyjtnb
         6PhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OYCj5FL3OV5QlxZRwhcgh3ou9oCfEtGrdS4IoYFnXsQ=;
        fh=mISachWtBfNM+xwhtkUSxPXJbL9QWI2VyucuYtl+xAM=;
        b=1D9zkUe+Me8BL+VHWw1K1KIizB7+6BBdLigTIRgZW9yakRHQnRBmy+88lTeF+UP1Jo
         6Up0f/yvkLrObyLlYN+cu/vdEHT9nIilWcSg+fK+NSf63GAO0FyC4RDAj079nF2OEr/0
         1s8h3fDDSjuAwBxoKBpnBXy9p7hL+9qXEkknZLGSaa+5FtaytMwcXomctMA4bVD4xpJ9
         q+GZBf2RkN2zBOlb63xC6f68hx5Gq6C0J8DIJ3MOPPlxcIpEQnF90JVcpvn+8iK5uBMK
         L/1MEFtLgqN/EPd7aodUgC6D2eLQHaQCzmfR1i6UVCHPN+bzlh7K2UNXl3/Ak+VALiWH
         AVpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=B16G3WT6;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id p4-20020a25ea04000000b00d894284bad2si4554929ybd.183.2023.10.11.09.53.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 09:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=B16G3WT6;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BFrLb1011628;
	Wed, 11 Oct 2023 16:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=OYCj5FL3OV5QlxZRwhcgh3ou9oCfEtGrdS4IoYFnXsQ=;
 b=B16G3WT69vCdcuOdnZ+55pX8mB1KUEFubHSYZEJifQ0ACnQvEtVYF+Hz0lqfTsbr7C12
 dE8K2JNW1MeVZIRShiypq37jKtns14wtPd8uSmDBg+lxgKd11H1w3qHmwhjc+38n8Cz4
 hnD33+Fakydhpyzb0j8Kd9AjXFnRCJuKyFJNJdVbBwQbkjLqjmiBNvlJ/PGFW/wvI5w0
 jd9u1kFRJv/JhcXGaiLH2v8osSTUP89M5DjUiTVpt8Nvk1/Rnr2gW2WCei0BNeNrhxEx
 +wGPVycmrO704mZr9EHoaqn2bTPJpN7jgS5gY15eVYajowWSyhHYlOBWXO7nkUTBP2DU Hw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnnvw9hhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:53:27 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGrRj6031404
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:53:27 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 11 Oct 2023 09:53:22 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v0 09/12] gunyah: Customize device-tree
Date: Wed, 11 Oct 2023 16:52:31 +0000
Message-ID: <20231011165234.1323725-10-quic_svaddagi@quicinc.com>
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
X-Proofpoint-ORIG-GUID: _F8R9LE1Fet3-AZiB_Sn7-fXrO-ZHsmh
X-Proofpoint-GUID: _F8R9LE1Fet3-AZiB_Sn7-fXrO-ZHsmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110148
X-TUID: M6CbhU1pGwSU

Customize device-tree with Gunyah specific properties. Some of these
properties include specification of doorbells that need to be created
and associated with various interrupts.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 hw/arm/virt.c           | 11 ++++++
 include/sysemu/gunyah.h |  7 ++++
 target/arm/gunyah.c     | 79 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4293e01383..15fdf7be05 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2024,6 +2024,14 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
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
@@ -2335,6 +2343,9 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.skip_dtb_autoload = true;
     vms->bootinfo.firmware_loaded = firmware_loaded;
     vms->bootinfo.psci_conduit = vms->psci_conduit;
+    if (gunyah_enabled()) {
+        vms->bootinfo.modify_dtb = virt_modify_dtb;
+    }
     arm_load_kernel(ARM_CPU(first_cpu), machine, &vms->bootinfo);
 
     vms->machine_done.notify = virt_machine_done;
diff --git a/include/sysemu/gunyah.h b/include/sysemu/gunyah.h
index 101e190619..f077837437 100644
--- a/include/sysemu/gunyah.h
+++ b/include/sysemu/gunyah.h
@@ -35,6 +35,8 @@ DECLARE_INSTANCE_CHECKER(GUNYAHState, GUNYAH_STATE,
                          TYPE_GUNYAH_ACCEL)
 
 int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
+void gunyah_arm_fdt_customize(void *fdt, uint64_t mem_base,
+                uint32_t gic_phandle);
 
 #else   /* CONFIG_GUNYAH_IS_POSSIBLE */
 
@@ -45,6 +47,11 @@ static inline int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size)
     return -1;
 }
 
+static inline void gunyah_arm_fdt_customize(void *fdt, uint64_t mem_base,
+                uint32_t gic_phandle)
+{
+}
+
 #endif  /* CONFIG_GUNYAH_IS_POSSIBLE */
 
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
