Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1409057ejl;
        Thu, 16 May 2024 07:33:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXA8yKUpFwdM/RjMQ2H/FOfNPgGeQmwQA2h3PQguJsRyYsDsltjg52ulsnZbbUowrwMrAGmWgTIlu4UuT9DOnhgYRw9bB5x
X-Google-Smtp-Source: AGHT+IFu/9GL725YFqaKQXErcS9CvF/GQWlqS2aA/QZM9d4UnW1BV9zXzEdi7Uyt/nwPDo+taWYs
X-Received: by 2002:a25:9848:0:b0:df4:773c:178e with SMTP id 3f1490d57ef6-df4773c1a8bmr1238256276.40.1715870015314;
        Thu, 16 May 2024 07:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715870015; cv=none;
        d=google.com; s=arc-20160816;
        b=JPbKD7oSF1iH34ZuTvWW3bIMTEZ0a+YkoI5jT66erM6d5REe+A4zeCFvd1okl4mrS2
         dieDFQHUgwGKGslI22LovhPR9hxzopHiZ9aeSkQ3uJ1YUjJyU+E9BIFc+9bGQaAO0wBH
         Q0MJib1vp0ipO21DWekZJ8ZXJb3+WE5QqJw8Yu8k8Jm4ExoLD56SFI+47f3WuzCiS0gT
         QNqOxF/Xfj2zB4Vo+W30W0GiR52DutbgqLua3V058/KUyFk3wDY2TWtbf+1iUg+SdmhJ
         zQZ+kgkL7PjQpr1xBf2GCGFiR5cwP0LzcJSUBJJkSN6/wy96Oqp32KwOtNp4TQos92sM
         t7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Vg+TqVvk0ka4+3POtqGbOxcGCLEO0Hf+do5UQ+dZcFc=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=UKiI4EpSGH+Yp5vMGmm9MMf2V62AZa0Vf3fjwKRs1V8OM17Ba91Am5d+Dydwx8YsKS
         3+Y/7ufEFsfwbSgBE4nPrUYAV6DxGkjFFIHBNTx/8K9QRGHr6xt4/K6ybxi/WbZZnHE4
         67alS/fkEdfrxQBNynl2xxulj8OQ4h3JTpF5T5YIGGZ3PD2IG4vIsbKq6uKcNzyAtbhj
         +tgO9US+KKpfeJIHXNHvVMGdTNNcZxYgbRwI/p7Yu0Tc0EgmBiGLRItYWy3XlFXX+DXF
         RGa2939jn6PE3ZCGIcsTSv/OdnbwCcKHZEC36Io2tpCrHZ2WjiAQkME9V12qlQs0iHB1
         IEIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Fcwue2qD;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id 3f1490d57ef6-debd388b394si8093522276.613.2024.05.16.07.33.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2024 07:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=Fcwue2qD;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8X64V027367;
	Thu, 16 May 2024 14:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=Vg+TqVv
	k0ka4+3POtqGbOxcGCLEO0Hf+do5UQ+dZcFc=; b=Fcwue2qDzLapcMXbfxLW2ft
	0/wJnZc06CvXXQw0t3cWf1CO2EGtwBiwNBVlCrcFykgZ+lJ3iUn33rM2yzDCk/Tt
	K0Syr/XyGMJdWFGu/wbm9EypfW1ICyYXyp9P8xIsi+PqZ6fRkKOT0zeFPboV89Uc
	+buEkNQn4V6eN2/gVruGwXpur8B8r8XGePVcuccXv8rVt6v1e46sSF0C87daEy3n
	2JDuDoyM3Ld6wgVRR9jU/zXmtJXrzusnBuxTc869YQDmqmfHQ3IJGmpNdiAaCUHe
	b4QD1Z76Trl7y9qC7K5gF2Yfd5iWXUDN9uMiDVR4IsHUDAvKysaZtpGn0XtYbEg=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y42kvxgp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:33:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEXWgQ006308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:33:32 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 07:33:28 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v2 00/12] Gunyah hypervisor support
Date: Thu, 16 May 2024 14:33:08 +0000
Message-ID: <20240516143320.1739118-1-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: I16LP_QJSrxPgInVWPf7kEX8CSBqLnHw
X-Proofpoint-ORIG-GUID: I16LP_QJSrxPgInVWPf7kEX8CSBqLnHw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160102
X-TUID: S0qGWrIzsC/I


Appreciate any quick comments you have. This is v2 that I intend to publish on
qemu lists. Main changes since v1 is adding support for protected VM. 

===


Gunyah is an open-source Type-1 hypervisor, that is currently supported on ARM64
architecture. Source code for it can be obtained from:

https://github.com/quic/gunyah-hypervisor

This patch series adds support for Gunyah hypervisor via a new
accelerator option, 'gunyah'. This patch series is based on the Linux kernel's
Gunyah driver, which is being actively developed and not yet merged upstream
[1, 2].

This patch series is thus *NOT YET READY* for merge. Early versions of this patch
is being published to solicit comments from Qemu community.

This patch has been tested with the open-source version of Gunyah hypervisor and
using v14 Linux Gunyah driver [1]. Instructions to build hypervisor and test
this patch are provided in this patch series.

Changes in v2:
* Extended ARM virt machine to support confidential guests 
* Extended CPU run loop to recognize VM shutdown

Changes in v1:

* Fixed SMP boot issues
* Addressed comments received for previous version (v0) of the patches series

Limitations:

* Confidential guests (or protected VMs) are not yet supported by Linux
  Gunyah driver published upstream. I have tested it using a variant of the driver
  available in Android Common Kernel [3].

* Instructions provided to test with open-source Gunyah is based on v14 Gunyah driver
  [1]. Updated instruction that is based on v17 Gunyah driver will be provided
  later.

Prior version, v1, of this patch can be referenced at:

	https://lists.nongnu.org/archive/html/qemu-devel/2024-01/msg01397.html

Ref:

1. https://lore.kernel.org/lkml/20230613172054.3959700-1-quic_eberman@quicinc.com/
2. https://lore.kernel.org/lkml/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/
3. https://android.googlesource.com/kernel/common/+/refs/heads/android14-6.1/drivers/virt/gunyah/

Base commit on which this series was tested:

4e66a08546 (origin/master, origin/HEAD) Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging


Srivatsa Vaddagiri (12):
  gunyah: UAPI header (NOT FOR MERGE)
  accel: Introduce check_capability() callback
  hw/arm/virt: confidential guest support
  gunyah: Basic support
  gunyah: Support memory assignment
  gunyah: Add IRQFD and IOEVENTFD functions
  gunyah: Add gicv3 interrupt controller
  gunyah: Specific device-tree location
  gunyah: Customize device-tree
  gunyah: CPU execution loop
  gunyah: Workarounds (NOT FOR MERGE)
  gunyah: Documentation

 MAINTAINERS                     |  11 +
 docs/about/build-platforms.rst  |   2 +-
 docs/system/arm/gunyah.rst      | 326 +++++++++++++++
 meson.build                     |  12 +-
 qapi/qom.json                   |  14 +
 include/hw/arm/virt.h           |   1 +
 include/sysemu/accel-ops.h      |   8 +
 include/sysemu/gunyah.h         |  36 ++
 include/sysemu/gunyah_int.h     |  67 +++
 linux-headers/linux/gunyah.h    | 311 ++++++++++++++
 accel/gunyah/gunyah-accel-ops.c | 128 ++++++
 accel/gunyah/gunyah-all.c       | 698 ++++++++++++++++++++++++++++++++
 accel/stubs/gunyah-stub.c       |  28 ++
 hw/arm/boot.c                   |  17 +-
 hw/arm/virt.c                   | 173 +++++++-
 hw/intc/arm_gicv3_common.c      |   3 +
 hw/intc/arm_gicv3_gunyah.c      | 106 +++++
 hw/intc/arm_gicv3_its_common.c  |   3 +
 target/arm/cpu.c                |   3 +-
 target/arm/cpu64.c              |   5 +-
 target/arm/gunyah.c             | 142 +++++++
 accel/Kconfig                   |   3 +
 accel/gunyah/meson.build        |   7 +
 accel/meson.build               |   1 +
 accel/stubs/meson.build         |   1 +
 hw/intc/meson.build             |   1 +
 meson_options.txt               |   2 +
 scripts/meson-buildoptions.sh   |   3 +
 target/arm/meson.build          |   3 +
 29 files changed, 2107 insertions(+), 8 deletions(-)
 create mode 100644 docs/system/arm/gunyah.rst
 create mode 100644 include/sysemu/gunyah.h
 create mode 100644 include/sysemu/gunyah_int.h
 create mode 100644 linux-headers/linux/gunyah.h
 create mode 100644 accel/gunyah/gunyah-accel-ops.c
 create mode 100644 accel/gunyah/gunyah-all.c
 create mode 100644 accel/stubs/gunyah-stub.c
 create mode 100644 hw/intc/arm_gicv3_gunyah.c
 create mode 100644 target/arm/gunyah.c
 create mode 100644 accel/gunyah/meson.build

-- 
2.25.1
