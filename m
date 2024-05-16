Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1409493ejl;
        Thu, 16 May 2024 07:34:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKol4yM73S19qM2Qfhzd2H91ZXh1aQr6tI5iK35pA08RGuhdZsoLp7hA9MZjLVfz8ILHlnPE99esJWYJ8dy9CihxaPq9mt
X-Google-Smtp-Source: AGHT+IEr/dOdaGC4c++EeXyT2LbgK4JJsuApiySaN4eZWZLspzgpD3ZQNToaTWjid2E8Ooh6ProJ
X-Received: by 2002:a05:6902:136b:b0:dee:5dc4:59cf with SMTP id 3f1490d57ef6-dee5dc47983mr14732303276.26.1715870050691;
        Thu, 16 May 2024 07:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715870050; cv=none;
        d=google.com; s=arc-20160816;
        b=j9IwhctffV46kQSOUcYVRVRW+nH4m6WzkhZ0Ks1QSGM/MN/RambphnrKMeE1adTBNH
         ibVm/sSi87R016PqVy1Ea3fCRx/1HfWCYQ3OG889R5xTlBk1kY45n+abDZgV/HSEi6gc
         btI8eza+AY0U4dk6pMscd4bSXmjxbbBW3yJb572x35wgeAcA1dmlxuHrgCa4BAKFR9Im
         TgT5Q4YpIpAfZaRHQ5p04hKPJplAokIfZVirXYggB2e7CMxAi7bbu/FVutKkWtCosxzg
         x1Zxhi8KxEYj+Bov/c5XJfGvb7rh+98LFm3kk/ovKXhAqYYjsvrilQg7E6wpQwPIyLw5
         XwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=xrppgKg1WyBfVrYxSVQmhhj+14n1XeG1Y3GaJ7bORPs=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=sww6ov6bG2FTHbaVVyCN/Bipgi7FhwfcmPQLmt16j+rmF4txl6xzveaRuSdw/itmD2
         p2NKUJz8lyTyQH7H6wESgA3iwi+WKLcY02oLDdJuQBF/r8oISflqQwygdgAbG67S+UYz
         Ojree7bt3GvdmIkJlE8SNTWAia6UHaZF2j0IUvD1DhLjHH/nQRqPgWZph6D/Gv3dYeqf
         qOyNHERhS5bBrFgima937DxFGSFWi61VC4brmsASvUmSxNyrajP2FBTtx43CyNzcNT2g
         LnxjO1b9MPcX1VTmNKSMqMop2neSIY01TOz2IU2tuTQI/DV8RnXCHr5eJ1TX1tUjrm8o
         Jh2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=aJd4u98Z;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id 3f1490d57ef6-debd3711fccsi7717316276.93.2024.05.16.07.34.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2024 07:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=aJd4u98Z;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8ZXWQ026425;
	Thu, 16 May 2024 14:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=xrppgKg
	1WyBfVrYxSVQmhhj+14n1XeG1Y3GaJ7bORPs=; b=aJd4u98ZPac4S2HWtD/IHTo
	XEqkHsNVqgoNRU3Rrm1kzSacCTZIsGobWWGnwdABokXxZCCf9cR27OPX5/TymcOP
	m1eHtPH3AEIZ4ieY7AVWJU829Heoddp+hgfQ0F2u0XiZl2RyFuc6baVu4lg57Ouo
	HG5NkRJRhFv/D9vKUSv712QpO10eJ1/eEwt1VAeIgr6FSvuK7Owu9XdFZ9gT5KJS
	5lRWhHI0fCdYGyp9Ly5tqzv2kl06QMHQ5haxVK2bt2CX3BpHbQOPZFUuKowvOkN1
	dfuKG+9m4q6TUP7czVeoRgQfgnJfz3wMSYz33fuXuI4Ns4nXig6HaQkp51Nfk3w=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47egduh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEY8sZ007922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:08 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 07:34:04 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v2 00/12] Gunyah hypervisor support
Date: Thu, 16 May 2024 14:33:44 +0000
Message-ID: <20240516143356.1739402-1-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m8HfPufXChH08GXQIiKmCipFU3HSmGhw
X-Proofpoint-ORIG-GUID: m8HfPufXChH08GXQIiKmCipFU3HSmGhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160102
X-TUID: XJGv2QInhc5e


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
