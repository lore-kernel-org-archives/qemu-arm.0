Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp259514ejs;
        Tue, 9 Jan 2024 01:00:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEj28owLvzfretNyE22jqrTXSj7yv2gffCqDDaukzYbdMoDQH4mH0d+Qr/NhmaHlyzqbeu1
X-Received: by 2002:a05:6808:e83:b0:3bb:bd18:25e with SMTP id k3-20020a0568080e8300b003bbbd18025emr3847111oil.8.1704790855443;
        Tue, 09 Jan 2024 01:00:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704790855; cv=none;
        d=google.com; s=arc-20160816;
        b=gzh+ij78o/BhE039aTm55MEbD0NJWKivy1su4fK+nZ2oybi9rMY6RaFET81H6mOolU
         OfHxVhwzIlgTa3cCtddi4hOe9oNU8m9jD+QdGSxcfPqjQ4d5JCYMH2KF3cjuZt/Iajgh
         SRe6XfXvXHS2Bgv582lfIlLdOIs3nnyKmDf8/ESuAmR6ifp53wrzxS87+PU0Sl7sUxCE
         EyYOnGLLnZXz7gJSIg1cs3dhHOfUJC6kSGZMuHyWDfuFT9DNDyPSnoCtyOCfdHlrTnP7
         3W8HB2Thr2B7Lp08w4mHeeWTi7YBuEYj1hEabVzikpEpXd302DQ6owYH4gvm6W42Kj+n
         QUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=2zEcLeMV3sz7vQsxPzcRivC5Kw+Zi7ajSIoCm6DXUC0=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=Wys40vUotkCvV255m6b/sfIOk38CgW2gBNfMbEl9CTBTae4eh9FSwZ0iKZF4sRQSSL
         Jg3ZLWcPZxC7GSwJ7T1mh+qQ95rob0ogqA7CiMNYTNO/KLkfMeAGOLI5MjoDMAohQNm2
         sdh31pZdaaTnaNaszSDUwMaXZg8WYDoYPfN2f/8REkWPgu5d01ou8Sp6KyP0urpj1dZd
         fZ0dXRfcfygLn4y58r/AeYvlL+ObqW1HmcrUVV3tdpnNA+G5jqupqc7Bv6Dt+II/DDxk
         lY58HFgF2/xJWaF5Ql6P30OvSIEFjW8F3BxZmB5wa5NmPVzHIKYoHLC3VtLwzanRC8r+
         nWvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=RrR6hS68;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id bp17-20020a056808239100b003bd32835762si477891oib.271.2024.01.09.01.00.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jan 2024 01:00:55 -0800 (PST)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=RrR6hS68;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4096jVIE017154;
	Tue, 9 Jan 2024 09:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=2zEcLeM
	V3sz7vQsxPzcRivC5Kw+Zi7ajSIoCm6DXUC0=; b=RrR6hS68FXZxd1JQodUibmT
	pc2ZKqbhPiNJlyqjpMVZZ7js8OjwkUXopwOOL9DrQqS9VjqLn7rxra4OWex9JldP
	3NVUvEHiVQUQvOG1MwCOoFtknOa1lJyuAKtfe0xyvWRS7F1w0B+CnEL9r2LPg9sg
	+Stns+yodVdLz0NqcxjZCDY7MWWesE5ZupmIv9CgClfE5PEN0MSEuhB39b7KOu2F
	Ku7OgjPWaINqJqRa0V124V4xG7pdrqU1J94xgNijJ11hfeDi2D0w5V4+byquDFZR
	mCkl4JqTDMgikWzJ3O3mq6Myb0Ac41wg8TympIm6gXEA3OYeiIReJEsEtWJpbKA=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgxxbgftq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 09:00:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40990rux008755
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 09:00:53 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 9 Jan 2024 01:00:49 -0800
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v1 00/11] Gunyah hypervisor support
Date: Tue, 9 Jan 2024 09:00:28 +0000
Message-ID: <20240109090039.1636383-1-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7yq7SgkyuG72clgwDbbuFJAdBfx3nTV2
X-Proofpoint-GUID: 7yq7SgkyuG72clgwDbbuFJAdBfx3nTV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=841
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1011 mlxscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401090070
X-TUID: Y9dB1rKiDwDE

Gunyah is an open-source Type-1 hypervisor, that is currently supported on ARM64
architecture. Source code for it can be obtained from:

https://github.com/quic/gunyah-hypervisor

This patch series adds support for Gunyah hypervisor via a new
accelerator option, 'gunyah'. This patch series is based on the Linux kernel's
Gunyah driver, which is being actively developed and not yet merged upstream
[1].

This patch series is thus *NOT YET READY* for merge. Early version of this patch
is being published to solicit comments from Qemu community.

This patch has been tested with the open-source version of Gunyah hypervisor.
Instructions to build hypervisor and test this patch are provided in this
patch series.

Changes in v1:

* Fixed SMP boot issues
* Addressed comments received for previous version (v0) of the patches series

Limitations:

Confidential guests (or protected VMs) are not yet supported.

Prior version, v0, of this patch can be referenced at:

	https://lists.nongnu.org/archive/html/qemu-devel/2023-10/msg03202.html

Ref:

1. https://lore.kernel.org/lkml/20230613172054.3959700-1-quic_eberman@quicinc.com/

Base commit on which this series was tested:

0c1eccd368 Merge tag 'hw-cpus-20240105' of https://github.com/philmd/qemu into staging


Srivatsa Vaddagiri (11):
  gunyah: UAPI header (NOT FOR MERGE)
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

 MAINTAINERS                     |  11 +
 accel/Kconfig                   |   3 +
 accel/gunyah/gunyah-accel-ops.c | 180 +++++++++
 accel/gunyah/gunyah-all.c       | 634 ++++++++++++++++++++++++++++++++
 accel/gunyah/meson.build        |   7 +
 accel/meson.build               |   1 +
 accel/stubs/gunyah-stub.c       |  23 ++
 accel/stubs/meson.build         |   1 +
 docs/about/build-platforms.rst  |   2 +-
 docs/system/arm/gunyah.rst      | 358 ++++++++++++++++++
 hw/arm/boot.c                   |   3 +-
 hw/arm/virt.c                   |  28 +-
 hw/intc/arm_gicv3_common.c      |   3 +
 hw/intc/arm_gicv3_gunyah.c      | 106 ++++++
 hw/intc/arm_gicv3_its_common.c  |   3 +
 hw/intc/meson.build             |   1 +
 include/hw/core/cpu.h           |   1 +
 include/sysemu/gunyah.h         |  34 ++
 include/sysemu/gunyah_int.h     |  67 ++++
 linux-headers/linux/gunyah.h    | 311 ++++++++++++++++
 meson.build                     |  12 +-
 meson_options.txt               |   2 +
 scripts/meson-buildoptions.sh   |   3 +
 target/arm/cpu.c                |   3 +-
 target/arm/cpu64.c              |   5 +-
 target/arm/gunyah.c             | 144 ++++++++
 target/arm/meson.build          |   3 +
 27 files changed, 1942 insertions(+), 7 deletions(-)
 create mode 100644 accel/gunyah/gunyah-accel-ops.c
 create mode 100644 accel/gunyah/gunyah-all.c
 create mode 100644 accel/gunyah/meson.build
 create mode 100644 accel/stubs/gunyah-stub.c
 create mode 100644 docs/system/arm/gunyah.rst
 create mode 100644 hw/intc/arm_gicv3_gunyah.c
 create mode 100644 include/sysemu/gunyah.h
 create mode 100644 include/sysemu/gunyah_int.h
 create mode 100644 linux-headers/linux/gunyah.h
 create mode 100644 target/arm/gunyah.c

-- 
2.25.1
