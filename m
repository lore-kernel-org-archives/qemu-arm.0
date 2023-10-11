Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp224870ejc;
        Wed, 11 Oct 2023 09:53:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMskLSPiw1iDVPvJ/3FAgRvHCMSn3alr8Is36lEIUzd5SeN7gWPMTOHM4Ekh5uDjIUuwyE
X-Received: by 2002:a17:90a:b785:b0:274:7db1:f50f with SMTP id m5-20020a17090ab78500b002747db1f50fmr29348076pjr.15.1697043206770;
        Wed, 11 Oct 2023 09:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697043206; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbaAFN+RxaWLRktDlRK6/cWmzVZ4SSYPeRWo4l+g/emyL8BLZD3bcRcwaIly+fw+yL
         LUbnMBscX5t0UBJOw2moVvI8AGOtrAp5V69It4nmN7b1wAukvPPp746yCPzJfv2gM+rJ
         AW2OUZUzwb6ft4eSQyjKxQVAiYkq7UfF1JexZZ26TqgFaxQbjsjGhu3TWkWYorcOYvBP
         DMidV4bpUyL2zm+VwiwL4VkPAk8UCg94IZI4b7CeQY8WxKbHPQ0CazuZ1HdKWmsyjpGa
         0RlBILPlZjYpCEJaMpArsLPDcQ5nF6tMev2H5iXfKW+tcvIxEoRLnApBoNwa3VERuNP7
         knhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YC8WJoHv3EEAPm/gyIVIf4+UPhjtjeW1AWLoEKJUZE0=;
        fh=mISachWtBfNM+xwhtkUSxPXJbL9QWI2VyucuYtl+xAM=;
        b=T374vIWElyxC7QQflb9uuCI2ouVsFrL8BNfSdpvBr7lxk9Dmer5oTjjs8ggCXcv5dP
         2HN2wF56wPkxBPmVBZXACWGUicbDmS6Dh3HrUZv+NUnmmPqmceAZJly2Zckw6JEp4vOD
         RXfMmdEakPU29dYgksjlTaDmcA7HjJcL/611bC+U6lTiUy1D0YpgDfPPXmusF1AaGQnS
         KcfkolvYwhLF5V40T6gXxz2AwGcLRb4g9Nb4KQyo8COkZvvHibuQz/PkfuXeRqT2qdcH
         QJLnu7LBZHT6FUHul0jAMR1bbaS2s0E2ueqCwtWCu9C3yTy/066woWfBqxGJNSMRaAHV
         iukA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=QKgwEJtV;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id me4-20020a17090b17c400b00276b35bc424si229747pjb.26.2023.10.11.09.53.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 09:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=QKgwEJtV;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BFOUoX021103;
	Wed, 11 Oct 2023 16:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=YC8WJoHv3EEAPm/gyIVIf4+UPhjtjeW1AWLoEKJUZE0=;
 b=QKgwEJtV9U+G/640sAYpLuJ9lrvIXTFZZyhsFtonNTbMUf2YrhWLiYL6KJ4OR+fIKRDD
 djKqK24WkG9SOnC6D4A2XKLVboyBEmZba8isZuTka2+SEWaoSQ+Fab4B1GrrDfHZRGxk
 T/Ql1MSvNCYuc3pQ26QhWfwI+N6JtAW9BOLMkz1aqYaIvPisLk703n2Qp4PrXxHs+7Ur
 Vuhrf3vBDhyLDLmWZLg63MvNImXdfsvGyXmc2kZ9EpbH3cnxlbdBhDgsVBoEWV9g5+nn
 TCxjEJPWVhR9SZ2//XbQd6llTmp576cyQ6lvraam2y1PkyAneMCyLZDaSBuAz78vXly8 7w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tngtpa1rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:53:23 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGrMnK008355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:53:22 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 11 Oct 2023 09:53:18 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v0 08/12] gunyah: Specific device-tree location
Date: Wed, 11 Oct 2023 16:52:30 +0000
Message-ID: <20231011165234.1323725-9-quic_svaddagi@quicinc.com>
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
X-Proofpoint-ORIG-GUID: SrTUJc0BlPIy-IGoXwL9pKfa_q2rvLzi
X-Proofpoint-GUID: SrTUJc0BlPIy-IGoXwL9pKfa_q2rvLzi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxlogscore=701
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110148
X-TUID: XN3gR9rvYqrP

Specify the location of device-tree and its size, as Gunyah requires the
device-tree to be parsed before VM can begin its execution.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 MAINTAINERS             |  1 +
 hw/arm/virt.c           |  6 ++++++
 include/sysemu/gunyah.h |  7 +++++++
 target/arm/gunyah.c     | 45 +++++++++++++++++++++++++++++++++++++++++
 target/arm/meson.build  |  4 ++++
 5 files changed, 63 insertions(+)
 create mode 100644 target/arm/gunyah.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 368ba02dce..5a51633d11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -514,6 +514,7 @@ GUNYAH
 M: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
 S: Maintained
 F: accel/gunyah
+F: target/arm/gunyah.c
 F: include/sysemu/gunyah.h
 F: target/arm/arm_gicv3_gunyah.c
 F: include/sysemu/gunyah_int.h
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0d4c5aa819..4293e01383 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1676,6 +1676,12 @@ void virt_machine_done(Notifier *notifier, void *data)
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
diff --git a/include/sysemu/gunyah.h b/include/sysemu/gunyah.h
index aded49cdf6..101e190619 100644
--- a/include/sysemu/gunyah.h
+++ b/include/sysemu/gunyah.h
@@ -34,10 +34,17 @@ typedef struct GUNYAHState GUNYAHState;
 DECLARE_INSTANCE_CHECKER(GUNYAHState, GUNYAH_STATE,
                          TYPE_GUNYAH_ACCEL)
 
+int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
+
 #else   /* CONFIG_GUNYAH_IS_POSSIBLE */
 
 #define gunyah_enabled()    0
 
+static inline int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size)
+{
+    return -1;
+}
+
 #endif  /* CONFIG_GUNYAH_IS_POSSIBLE */
 
 #endif  /* QEMU_GUNYAH_H */
diff --git a/target/arm/gunyah.c b/target/arm/gunyah.c
new file mode 100644
index 0000000000..73c1c2a88a
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
+int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size)
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
index e645e456da..c7da15ca89 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -36,3 +36,7 @@ endif
 
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_system_ss}
+
+arm_system_ss.add(when: 'CONFIG_GUNYAH', if_true: files(
+  'gunyah.c',
+))
-- 
2.25.1
