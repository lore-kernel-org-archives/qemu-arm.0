Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp224490ejc;
        Wed, 11 Oct 2023 09:52:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXo0CqOff2ibnPkHcTCmF6hMm4WZUeClT+RJugO0BJ+TUBV+Tj2GEd3iHudXo/4hxwf+sD
X-Received: by 2002:a81:9292:0:b0:56f:fbc6:3b0 with SMTP id j140-20020a819292000000b0056ffbc603b0mr24336500ywg.14.1697043169763;
        Wed, 11 Oct 2023 09:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697043169; cv=none;
        d=google.com; s=arc-20160816;
        b=ntM0nKJCNa5XEch9Ufik6GOUGX795bcn1VQh8ctgpKX3YW2XcBSIXDq+SNaUIaQJt/
         G4DE40qgLBSo9cikKuzS4LE4T7C3KZpbP0xtEFs+VWc/SCKkj3Jtc7BY7D2jsjrFTVeL
         /dY3+7THBnX+vjD3G4b5/BF5dEPjFpUwy3m6PFReFwUeH6x15zJTxg1xQOVSm5B/q85Q
         YkMcErXffM0YF2t5aEGCfEbQQs62JfaM9aYBFX70KSAsax9SSq+tqiuZ3vUO34S8rCve
         onzDCu3G0MGCTb0+sQmmsoBfMvfgKUyGyT/tdUoeJgZC7le8KExHPXGq4XtfqUDiXf14
         5bQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Zp+LyRF+nJYCLmnOgk8btPd3hFzUI710Z3cxs6LSsvI=;
        fh=mISachWtBfNM+xwhtkUSxPXJbL9QWI2VyucuYtl+xAM=;
        b=lV2IVNzEHOz3WDuXzcNisyaN9VoBPYAqBh/V4yRU90al42V/gmjRn1eXol+cfdjeJW
         pQ6mPCxXmqHybag+bKKNZ3Wq3funrGP0fFRK4SCMxz6FriziKJySxUgZbm1ubt+iSs9j
         +e7D0oaO4fS3vuEvQz1tTq7CZLRT/ADcO5/7BSBgG1c4STszjusb9uz1b9w96HRytzaK
         /gFN1mXLgqrw/3W9xoElHT7kh0pWLADmp+cRB52DgOmTsMyQBdhDMgsV1Eo4O3/DUy7E
         s8q7EaJidsZQKDqLDMAiCYGsDMZhjUmv7d573drhYYA/L1gFprcJXbPUE1gaN6hy+Dl0
         /SAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=IKB3HqXA;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id y132-20020a0dd68a000000b0058c99180384si5132068ywd.440.2023.10.11.09.52.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Oct 2023 09:52:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=IKB3HqXA;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BFqhE4006699;
	Wed, 11 Oct 2023 16:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Zp+LyRF+nJYCLmnOgk8btPd3hFzUI710Z3cxs6LSsvI=;
 b=IKB3HqXAV/mprZgApyrUvtE6MCHKqt5XDUue1fVYCq9aU2spHrov/2M0BtvoKZmpjNtu
 Owwclu2Yj0JqOw56UCFysoNs9nCQ3JcaiqNrdh7hWsnkK6mUwXX9EBdu6Arz0BlrluBm
 0BwnnBwahBXZeQKyu3KP9pKNzM1fgRhZWTAMjSXKBADMObN+JgmITaxG7smcDjl5mXvC
 ca0I+9uhvweAQjD2QC7t/3P1L55TEURFPPH/SvDErvGSaAEkNiFSPYOh/11lAj80qc0E
 AHsClpVexjhWtMDIWP/aJjuINsbhOim+9hTrVKEHmVNScAx7gs7/HR/ax3qp5E2S6kw4 6w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnv1r8k20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:52:48 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39BGqmcr030247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 16:52:48 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 11 Oct 2023 09:52:43 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v0 00/12] Gunyah hypervisor support
Date: Wed, 11 Oct 2023 16:52:22 +0000
Message-ID: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7ylMCTAv2g-BG4d65Rnkhd7sDiTu0g-y
X-Proofpoint-GUID: 7ylMCTAv2g-BG4d65Rnkhd7sDiTu0g-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 clxscore=1011 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxlogscore=475 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310110148
X-TUID: BYRcfya3FC4j

Gunyah is an open-source Type-1 hypervisor, that is currently supported on ARM64
architecture. Source code for it can be obtained from:

https://github.com/quic/gunyah-hypervisor.

This patch series adds support for Gunyah hypervisor via a new
accelerator option, 'gunyah'. This patch series is based on the Linux kernel's
Gunyah driver, which is being actively developed and not yet merged upstream
[1].

This patch series is thus *NOT YET READY* for merge. Early version of this patch
is being published to solicit comments from Qemu community.

This patch has been tested with the open-source version of Gunyah hypervisor.
Instructions to build hypervisor and test this patch are provided in this
patch series.

Limitations:

1) SMP is not yet supported. This restriction will be removed in the next version
of this patch series.

2) virtio-pci is not yet supported. hw/virtio/virtio-pci.c seems to support only
KVM and would need changes to support other hypervisors. If there is any ongoing
work in this regard, would like to build upon it and add support for Gunyah
hypervisor.


Ref:

1. https://lore.kernel.org/lkml/20230613172054.3959700-1-quic_eberman@quicinc.com/

Base commit on which this series was tested:

d77b7b28a8 target/arm: Fix 64-bit SSRA


Srivatsa Vaddagiri (12):
  hw/arm/virt: Avoid NULL pointer de-reference
  update-linux-headers: Include gunyah.h
  gunyah: Basic support
  gunyah: Add VM properties
  gunyah: Support memory assignment
  gunyah: Add IRQFD and IOEVENTFD functions
  gunyah: Add gicv3 interrupt controller
  gunyah: Specific device-tree location
  gunyah: Customize device-tree
  gunyah: CPU execution loop
  gunyah: Workarounds (NOT FOR MERGE)
  gunyah: Documentation

 MAINTAINERS                     |  10 +
 accel/Kconfig                   |   3 +
 accel/gunyah/gunyah-accel-ops.c | 168 +++++++++
 accel/gunyah/gunyah-all.c       | 629 ++++++++++++++++++++++++++++++++
 accel/gunyah/meson.build        |   7 +
 accel/meson.build               |   1 +
 accel/stubs/gunyah-stub.c       |  13 +
 accel/stubs/meson.build         |   1 +
 docs/about/build-platforms.rst  |   2 +-
 docs/system/arm/gunyah.rst      | 214 +++++++++++
 hw/arm/boot.c                   |   3 +-
 hw/arm/virt.c                   |  27 +-
 hw/intc/arm_gicv3_common.c      |   3 +
 hw/intc/arm_gicv3_gunyah.c      | 106 ++++++
 hw/intc/arm_gicv3_its_common.c  |   4 +
 hw/intc/meson.build             |   1 +
 include/hw/core/cpu.h           |   6 +
 include/sysemu/gunyah.h         |  58 +++
 include/sysemu/gunyah_int.h     |  61 ++++
 meson.build                     |   9 +
 meson_options.txt               |   2 +
 scripts/meson-buildoptions.sh   |   3 +
 scripts/update-linux-headers.sh |   3 +-
 target/arm/cpu64.c              |   5 +-
 target/arm/gunyah.c             | 144 ++++++++
 target/arm/meson.build          |   4 +
 26 files changed, 1480 insertions(+), 7 deletions(-)
 create mode 100644 accel/gunyah/gunyah-accel-ops.c
 create mode 100644 accel/gunyah/gunyah-all.c
 create mode 100644 accel/gunyah/meson.build
 create mode 100644 accel/stubs/gunyah-stub.c
 create mode 100644 docs/system/arm/gunyah.rst
 create mode 100644 hw/intc/arm_gicv3_gunyah.c
 create mode 100644 include/sysemu/gunyah.h
 create mode 100644 include/sysemu/gunyah_int.h
 create mode 100644 target/arm/gunyah.c

-- 
2.25.1
