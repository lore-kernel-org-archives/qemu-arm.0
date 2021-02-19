Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8876959lfc;
        Fri, 19 Feb 2021 01:46:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjgrZYhl0g32AfCw1g6PVfFBw+C0TGzRerATD+xyOX17/IdUAQwePVoojjDpfpmsNJG0Gh
X-Received: by 2002:a25:ca88:: with SMTP id a130mr12770997ybg.414.1613728014363;
        Fri, 19 Feb 2021 01:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613728014; cv=none;
        d=google.com; s=arc-20160816;
        b=L+b4TD1CbPYRBjrWFv2dNrc+cyOfzcMzUmlRqtZRrCkoKWcb43t8wYdw7GEIDDGfU3
         48hmAqESQs3K4nFCVy/1dN+oORw6EGIECwP9dUWSLiOukI3IeVkSCwJOathJxaCD5pV0
         Y2nCJxgTPGmPVRhJcMwQSh+IDwD/wlrED6wLwK4wsRiLxtB9jUpzgZTP6GAyu5vwFTGw
         zd6icg7KupWmD0Y8xEo2KYOEVaYC+6sIF9/iu8cEc73c65OqC0NpiaVCy+7XC7Sqe1MX
         XoIEZA+oKcVbpUrxGoHeXyrLnf/ucX8GoUPNJzdfcWSMImaFY7wslXxWDkZZu82pM1ue
         jOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=ZO1FJhDWxGt94kOLg6rZWvcTkMTXVF8XMrq5h5yphmo=;
        b=bSIXMghjXrZgKaUf+z2X3mpo4z64ELTBVY/zlcdsqHX3/YzbJkkGcCE7hJNc/Kx5i/
         DiiX0M39GFuxWF9SNTuugGmo+twEZ+edrMk+SVVscILxxfvaagGNfhtEu9j+TnOYX4/A
         8Z635ay2ltb4Rry7Mud3Yfk5B91fJtJmR0vG7tDfVbtQK+Xkt8vjqAirYce02ZRjY2sS
         EVSdbyz87N4X/q7ZhJ2iQ6OOd4TRSF3EEzSEjkYRkMHNltgw+uDG7iuQVHXK+lobecYK
         W10zx8F3+mLZ5DrwW91W8e6v+9fRKAkhX83YoPPckYEHMEuRbuCJ4YDwy8bjafhsEIgu
         tcRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si8974790ybm.8.2021.02.19.01.46.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 01:46:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD2NB-0003Ob-NH
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 04:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lD2KQ-0000vE-Ra; Fri, 19 Feb 2021 04:44:03 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lD2K8-0006XQ-Tp; Fri, 19 Feb 2021 04:44:02 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DhmnC5HLCzjPyN;
 Fri, 19 Feb 2021 17:41:51 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Feb 2021 17:43:13 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/3] Add migration support for VFIO PCI devices in SMMUv3
 nested stage mode
Date: Fri, 19 Feb 2021 17:42:27 +0800
Message-ID: <20210219094230.231-1-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=jiangkunkun@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3A7P6s8dkojE

Hi all,

Since the SMMUv3's nested translation stages[1] has been introduced by Eric, we
need to pay attention to the migration of VFIO PCI devices in SMMUv3 nested stage
mode. At present, it is not yet supported in QEMU. There are two problems in the
existing framework.

First, the current way to get dirty pages is not applicable to nested stage mode.
Because of the "Caching Mode", VTD can map the RAM through the host single stage
(giova->hpa). "vfio_listener_log_sync" gets dirty pages by transferring "giova"
to the kernel for the RAM block section of mapped MMIO region. In nested stage
mode, we setup the stage 2 (gpa->hpa) and the stage 1(giova->gpa) separately. So
it is inapplicable to get dirty pages by the current way in nested stage mode.

Second, it also need to pass stage 1 configurations to the destination host after
the migration. In Eric's patch, it passes the stage 1 configuration to the host on
each STE update for the devices set the PASID PciOps. The configuration will be
applied at physical level. But the data of physical level will not be sent to the
destination host. So we have to pass stage 1 configurations to the destination
host after the migration.

This Patch set includes patches as below:
Patch 1-2:
- Refactor the vfio_listener_log_sync and added a new function to get dirty pages
in nested stage mode.

Patch 3:
- Added the post_load function to vmstate_smmuv3 for passing stage 1 configuration
to the destination host after the migration.

@Eric, Could you please add this Patch set to your future version of
"vSMMUv3/pSMMUv3 2 stage VFIO integration", if you think this Patch set makes sense? :)

Best Regards
Kunkun Jiang

[1] [RFC,v7,00/26] vSMMUv3/pSMMUv3 2 stage VFIO integration
http://patchwork.ozlabs.org/project/qemu-devel/cover/20201116181349.11908-1-eric.auger@redhat.com/

Kunkun Jiang (3):
  vfio: Introduce helpers to mark dirty pages of a RAM section
  vfio: Add vfio_prereg_listener_log_sync in nested stage
  hw/arm/smmuv3: Post-load stage 1 configurations to the host

 hw/arm/smmuv3.c     | 60 +++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events |  1 +
 hw/vfio/common.c    | 47 +++++++++++++++++++++++++++++------
 3 files changed, 100 insertions(+), 8 deletions(-)

-- 
2.23.0

