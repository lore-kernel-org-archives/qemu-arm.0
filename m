Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp259858ejs;
        Tue, 9 Jan 2024 01:01:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEK4WTAZhcRJAnuikWKRtFX/YjzXApsKgxk0Wzov9tMZRmzYBcZ1y6pG3felTYiHvjJnS5L
X-Received: by 2002:a05:6808:128c:b0:3bd:3efe:f137 with SMTP id a12-20020a056808128c00b003bd3efef137mr319093oiw.96.1704790885940;
        Tue, 09 Jan 2024 01:01:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704790885; cv=none;
        d=google.com; s=arc-20160816;
        b=hEMDk41dXvgif0LDrT2n30L4b54Eah/1o7APD22ho2XwZW0tmA1b5coCQgv6jKRTp2
         +F9Faxithi/IRPcMUfe8Qet6IE//1Tcqn4N56qKvCVfmJYRHFqnTIXAA0sYLEKMLt9xX
         wLntkJVi8dZR7jimHDtjl3I1+KZE58sgRUIckYtEBgCWw9ynMU9PakgHv2sjwmLpm4Ug
         yAFSN0ph3XpwXLSg5eRIPY8ZHlnLy9um82rVA/71bJCgGFrEDM+4thzumZuvU3Txm3vd
         BQ1S0ujddBJ/JtbQiQj4ghiWrjWG9nDbOhFfIUPUXtXw2z8E9r/MEQmJuPtx26NrzVqS
         qrbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qQ+OnwmDLRd9/yjp8Zeaf6SoGLiuUJN8GvojF4kAm0o=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=bKjBP4sMvowxgHYAjJKsPMteHr7HE+wfHHfezKXVI/06SkAC40BxL7xWEpAIpl5Rso
         vvvA4cxQFxCXpjZIkgNH8dR8MfiPWErm/n65AeAIkjyTVGI44mHcjUakWE5aG8gLAzxn
         3PXn+8SP+32vFBK+HztGaQ/6Tn8Bps6P7NVWCpx0kdkGm8ezsSUK3wTgrSKOHgPw0h9z
         b5SoNDdQyWBC/2clPBywId2VFuGy6z7ZvcjN5ikXViyo+7fqfxUe9QOmG0GtL5ryDlp/
         1Xu4cSJZhKvQy8ZM5Y/mGLM9F9NzaPEyV3UquWls1p5LnU5a5gTnzpox5Jo2AjwhCL3v
         /lsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=f638DZ5p;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id d16-20020a05680813d000b003bc3d7eb08fsi481333oiw.279.2024.01.09.01.01.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jan 2024 01:01:25 -0800 (PST)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=f638DZ5p;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4095soxg006699;
	Tue, 9 Jan 2024 09:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=qQ+OnwmDLRd9/yjp8Zeaf6SoGLiuUJN8GvojF4kAm0o=; b=f6
	38DZ5pulavCErSe9XAYi+pbht5l9A4h+svUiHd5Dls9KjynwCXlUbce7yE+kbSGZ
	Sghk0XYCXYOZA3VQF4DaBTksuEtDDEjYY12A56uKiS5Cn70EADbDN12sLR96mUk2
	TnVFe2U8HjWxmfQ+RlgzXYrqpTS/yCX1ygyf+A7iadekbmcBvvM3Q781vbgPD5wH
	OMVtmVnfRR9dfNdceB6mJVubCplN4CJw6xfyT+Jg4Fk1TebIYst4Gm2PpvLoc6Rs
	+06iZlXdMd2Hk8A+o4vAGkWB9Dbs835bPEH4wwy7Xk7GwfnQNv5Gw/ygQh44Rtam
	Dw88gLxvKWAifXP2704A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgwx38k1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 09:01:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40991OaY026659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 09:01:24 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 01:01:20 -0800
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v1 07/11] gunyah: Specify device-tree location
Date: Tue, 9 Jan 2024 09:00:35 +0000
Message-ID: <20240109090039.1636383-8-quic_svaddagi@quicinc.com>
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
X-Proofpoint-GUID: xtO6UimA42mn_gyCY0yu98jq5rC4byLi
X-Proofpoint-ORIG-GUID: xtO6UimA42mn_gyCY0yu98jq5rC4byLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=636
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401090070
X-TUID: EKiUHB1Ids6u

Specify the location of device-tree and its size, as Gunyah requires the
device-tree to be parsed before VM can begin its execution.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 MAINTAINERS               |  1 +
 accel/stubs/gunyah-stub.c |  5 +++++
 hw/arm/virt.c             |  6 ++++++
 include/sysemu/gunyah.h   |  2 ++
 target/arm/gunyah.c       | 45 +++++++++++++++++++++++++++++++++++++++
 target/arm/meson.build    |  3 +++
 6 files changed, 62 insertions(+)
 create mode 100644 target/arm/gunyah.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b90a4558a1..171713bedc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -541,6 +541,7 @@ GUNYAH
 M: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
 S: Maintained
 F: accel/gunyah
+F: target/arm/gunyah.c
 F: include/sysemu/gunyah.h
 F: include/sysemu/gunyah_int.h
 F: target/arm/arm_gicv3_gunyah.c
diff --git a/accel/stubs/gunyah-stub.c b/accel/stubs/gunyah-stub.c
index 1edbe1433e..faeb2af915 100644
--- a/accel/stubs/gunyah-stub.c
+++ b/accel/stubs/gunyah-stub.c
@@ -11,3 +11,8 @@
 #include "sysemu/gunyah.h"
 
 bool gunyah_allowed;
+
+int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size)
+{
+    return -1;
+}
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4f4e10c234..60fbe2f7c4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1656,6 +1656,12 @@ void virt_machine_done(Notifier *notifier, void *data)
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
index 4f26938521..a73d17bfb9 100644
--- a/include/sysemu/gunyah.h
+++ b/include/sysemu/gunyah.h
@@ -27,4 +27,6 @@ typedef struct GUNYAHState GUNYAHState;
 DECLARE_INSTANCE_CHECKER(GUNYAHState, GUNYAH_STATE,
                          TYPE_GUNYAH_ACCEL)
 
+int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
+
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
index 46b5a21eb3..797df04717 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -36,3 +36,6 @@ endif
 
 target_arch += {'arm': arm_ss}
 target_system_arch += {'arm': arm_system_ss}
+arm_system_ss.add(when: 'CONFIG_GUNYAH', if_true: files(
+  'gunyah.c',
+))
-- 
2.25.1
