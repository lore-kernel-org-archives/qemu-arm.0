Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1409983ejl;
        Thu, 16 May 2024 07:34:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpFh/E3fg76zycOs0zvdkmKXpUu9mABIREZLLc8sC12zebUHzPA7WDyd+7lFOdhZleVc7rwcQ2VVHSkamH3uu5/gA48qie
X-Google-Smtp-Source: AGHT+IGglUGrAHv+H7nCcWauSCE9KGdMrEPdZlBXg3lntGxWl5Dljx+jtwdwewDEYzLc+ounnStG
X-Received: by 2002:a0d:eb43:0:b0:61b:1792:3ecd with SMTP id 00721157ae682-622af7c5c92mr138366807b3.6.1715870085504;
        Thu, 16 May 2024 07:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715870085; cv=none;
        d=google.com; s=arc-20160816;
        b=vvc0B7DXCugy1RNGsc4XE+Qb8iGkBQth2lE8Unu2hZM/nO/9yP1lFsMoHGB/dMiTRt
         n/h7M1k7QrZTL+a9qfUxUi5wPs94xma8PgRDedwUL35bwSiHda3wtJ8jH/DQN7Vr8NVF
         69u5xpz7PmbL88JKS7rXzofitAyL5FnO0MUnlmu8dcEr80qmUHIwcvjWDOlHqyae4WVT
         VqzEYosnxRfTkeRTF715pGoyXG2Iitjj+3hYfDbqzXxi6BWzEdil8xtmGGClnVT5m/qQ
         6voDdcOJbFxMaL5STsSA0FoXAL7eZlAeiaXbW5yIghWUC+VEEDtIwOEzYmQdNQB9PRIW
         oKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7LcNbMtPfpExWDJYWPvv/A+FLK4Cxq//b0A4RlQj7IE=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=WMBXXx5ylVpMzEQo9pmpp3gSwDY0qXzMSEf9MXPBPWwEpIjWqlwE2ZjfNTjDb+aIKo
         WHs4rr2OKROin9+5A8NRgvx4dmp6hEpdBGHsgf3Im7O2yYgTTW0u/8lvwH+u6yu0OWuU
         kTcQ1HZhbn44oJSo8Q5fFVW44Z1nRlrUWxaZU+OumWZjv+iLFt8i59dJFxzeMZEzO61G
         931E1AKACAdh1j5ezu7XbugpsVmH31cqRyjx1tQ/wSFP7HFfLPpMxexLsM2AVC9PHW5Y
         Aj3ssxxdIHMHnJpE5viAGHCyDwmnTX0ugaWIgDSJ5mTk3kpq0CA1ONi9RuxzFr0UYiEB
         D/Xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=FWY4tSzd;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id 00721157ae682-627797e548bsi5852297b3.185.2024.05.16.07.34.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2024 07:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=FWY4tSzd;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8g6j7021620;
	Thu, 16 May 2024 14:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=7LcNbMtPfpExWDJYWPvv/A+FLK4Cxq//b0A4RlQj7IE=; b=FW
	Y4tSzdJVqwzKC65GAlJPfAogkgkiheQIaYG9NHDiFDmZo1vpNYHWdSReqkfmh2f9
	2OXgMI05aL1hNOFhHBT5HhAo+G33LNexBKtW8X/r+W59ZCBA1/ODPKDq4/4npz9F
	BuGF/B8mYwANN0sZ26eSwSPit1Jo6orUMmlxvA8Wj+nAqVEmyImItA0uHxzzZKg/
	4MpvDu33RF8cm6qOvFXpK4jRLB9uY2ski0/+m+2IwKdaiJxcF6n97uYX/DtE7F7K
	i6BJ2EJ+yOU2WPCikPsHfUw6EoIa4BQQLzr0Rz3ywxtEww/sEcUn5ZRjjPzsgPor
	upjdhfnsRo3qDI2mJYAA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbe0n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEYh1P027055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:43 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 07:34:39 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v2 08/12] gunyah: Specific device-tree location
Date: Thu, 16 May 2024 14:33:52 +0000
Message-ID: <20240516143356.1739402-9-quic_svaddagi@quicinc.com>
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
X-Proofpoint-GUID: pyxsaJ7HTs-ci0Qd-BT5y85e-WaTs44d
X-Proofpoint-ORIG-GUID: pyxsaJ7HTs-ci0Qd-BT5y85e-WaTs44d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=878 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160101
X-TUID: AVNh9QxUprVo

Specify the location of device-tree and its size, as Gunyah requires the
device-tree to be parsed before VM can begin its execution.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 MAINTAINERS               |  1 +
 include/sysemu/gunyah.h   |  2 ++
 accel/stubs/gunyah-stub.c |  5 +++++
 hw/arm/virt.c             |  6 ++++++
 target/arm/gunyah.c       | 45 +++++++++++++++++++++++++++++++++++++++
 target/arm/meson.build    |  3 +++
 6 files changed, 62 insertions(+)
 create mode 100644 target/arm/gunyah.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d0289ded2f..c42fdc2afd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -527,6 +527,7 @@ GUNYAH
 M: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
 S: Maintained
 F: accel/gunyah
+F: target/arm/gunyah.c
 F: include/sysemu/gunyah.h
 F: include/sysemu/gunyah_int.h
 F: target/arm/arm_gicv3_gunyah.c
diff --git a/include/sysemu/gunyah.h b/include/sysemu/gunyah.h
index 78cb80f01e..ba4862a1a6 100644
--- a/include/sysemu/gunyah.h
+++ b/include/sysemu/gunyah.h
@@ -29,4 +29,6 @@ typedef struct GUNYAHState GUNYAHState;
 DECLARE_INSTANCE_CHECKER(GUNYAHState, GUNYAH_STATE,
                          TYPE_GUNYAH_ACCEL)
 
+int gunyah_arm_set_dtb(uint64_t dtb_start, uint64_t dtb_size);
+
 #endif  /* QEMU_GUNYAH_H */
diff --git a/accel/stubs/gunyah-stub.c b/accel/stubs/gunyah-stub.c
index 2028fa04c7..8f6e952938 100644
--- a/accel/stubs/gunyah-stub.c
+++ b/accel/stubs/gunyah-stub.c
@@ -16,3 +16,8 @@ void gunyah_set_swiotlb_size(uint64_t size)
 {
     return;
 }
+
+int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size)
+{
+    return -1;
+}
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index bfb7f3d92e..a485388d3c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1738,6 +1738,12 @@ void virt_machine_done(Notifier *notifier, void *data)
         exit(1);
     }
 
+    if (gunyah_enabled()) {
+        if (gunyah_arm_set_dtb(info->dtb_start, vms->fdt_size)) {
+            exit(1);
+        }
+    }
+
     fw_cfg_add_extra_pci_roots(vms->bus, vms->fw_cfg);
 
     virt_acpi_setup(vms);
diff --git a/target/arm/gunyah.c b/target/arm/gunyah.c
new file mode 100644
index 0000000000..d655cd9a79
--- /dev/null
+++ b/target/arm/gunyah.c
@@ -0,0 +1,45 @@
+/*
+ * QEMU Gunyah hypervisor support
+ *
+ * Copyright(c) 2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "sysemu/gunyah.h"
+#include "sysemu/gunyah_int.h"
+#include "linux-headers/linux/gunyah.h"
+
+/*
+ * Specify location of device-tree in guest address space.
+ *
+ * @dtb_start - Guest physical address where VM's device-tree is found
+ * @dtb_size - Size of device-tree (and any free space after it).
+ *
+ * RM or Resource Manager VM is a trusted and privileged VM that works in
+ * collaboration with Gunyah hypevisor to setup resources for a VM before it can
+ * begin execution. One of its functions includes inspection/modification of a
+ * VM's device-tree before VM begins its execution. Modification can
+ * include specification of runtime resources allocated by hypervisor,
+ * details of which needs to be visible to VM.  VM's device-tree is modified
+ * "inline" making use of "free" space that could exist at the end of device
+ * tree.
+ */
+int gunyah_arm_set_dtb(uint64_t dtb_start, uint64_t dtb_size)
+{
+    int ret;
+    struct gh_vm_dtb_config dtb;
+
+    dtb.guest_phys_addr = dtb_start;
+    dtb.size = dtb_size;
+
+    ret = gunyah_vm_ioctl(GH_VM_SET_DTB_CONFIG, &dtb);
+    if (ret != 0) {
+        error_report("GH_VM_SET_DTB_CONFIG failed: %s", strerror(errno));
+        exit(1);
+    }
+
+    return 0;
+}
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 2e10464dbb..951226b0a2 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -25,6 +25,9 @@ arm_system_ss.add(files(
   'machine.c',
   'ptw.c',
 ))
+arm_system_ss.add(when: 'CONFIG_GUNYAH', if_true: files(
+  'gunyah.c',
+))
 
 arm_user_ss = ss.source_set()
 
-- 
2.25.1
