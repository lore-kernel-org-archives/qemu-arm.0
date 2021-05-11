Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3532302lfg;
        Mon, 10 May 2021 19:18:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweMud8YJNz9clynOgumGf9ZO2BEUHZJgOFYhF91T368z0e4z6cfmACUPmxTxE2B9GlhFWv
X-Received: by 2002:a5e:930e:: with SMTP id k14mr9500806iom.136.1620699504218;
        Mon, 10 May 2021 19:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620699504; cv=none;
        d=google.com; s=arc-20160816;
        b=Xg+q/xtJX/MjtraDuYwUMjXXLn5YwKPSLdBtY3FYMRWKSkPE+vISLKfwrj86ZBaCof
         HgHAK9uHv8wUYE9jCy1XC3CfTo/VJIvsT+u+ZUn1nuV2CMPnrNnbFTbPXN07AoMEIpeU
         Uk/5NOdJIoxghOnTADT1G+jZYZvB1ZZui2dI/gN9hFHSNdiT7QJDmXJmeYB/g7+/OqQM
         Riv9hmnjhhWCOgUkGzSA8FP1Fo33rqdIwvjWQ/3CC+q/9E1i8SnE6L9l/LWnFZrQoH9/
         K1RusXXIbh+itWzlhLyOIf1qbiPoJSm0ETvjoGiFD8V51EiMjBG8WPLFAgRXe9zsnfKK
         Kn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=AJKLG0ir0zfH4eY0mpUKsGT48eTblGduf5ifbcHnAIo=;
        b=iZsuO7GeffMdVUAbooqjrgpAxpGh02c9B2cb7qfHzoX8jK+tw2EYKp0k4TjjnMZ1EH
         w1ufRL2CdYzFDbcBwEC4NMoNz2txSinT8TjWKL49skyrkJfNY5SU7s3huUC4Mb9ei+ho
         Z4rx/xULlVzwluLp2C56dnbQhB6PTelLRO6ZuYdJ+Cgu4tS98/qStHwG8yDvOa+eLE3U
         4l0vw+nzoQi0sjpebgnwXC4pnJErBQ1BQlfyOUjTo30LdpTACuWcgPSVJcN8pRTgc6Dh
         4Cz1k2WUsvpK7KPTIt5WrV5t/EHyuz3Og8VnjPR0s2/VFW2urKxNJDZoR5hj4dQ1dwh5
         NWSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22si7239117ioo.82.2021.05.10.19.18.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 19:18:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:38116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgHyY-0002Ia-RE
	for alex.bennee@linaro.org; Mon, 10 May 2021 22:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyI-0002HR-V4; Mon, 10 May 2021 22:18:06 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyF-0001nQ-Jt; Mon, 10 May 2021 22:18:06 -0400
Received: from dggeml704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FfM0h1Y0dzWgv1;
 Tue, 11 May 2021 10:13:40 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml704-chm.china.huawei.com (10.3.17.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:17:53 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:17:53 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v3 0/4] Add migration support for VFIO PCI devices in
 SMMUv3 nested mode
Date: Tue, 11 May 2021 10:08:12 +0800
Message-ID: <20210511020816.2905-1-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kevin.tian@intel.com, Kunkun Jiang <jiangkunkun@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zJsCdjGl1dCi

Hi all,

Since the SMMUv3's nested translation stages has been introduced by Eric, we
need to pay attention to the migration of VFIO PCI devices in SMMUv3 nested
stage mode. At present, it is not yet supported in QEMU. There are two problems
in the existing framework.

First, the current way to get dirty pages is not applicable to nested stage
mode. Because of the "Caching Mode", VTD can map the RAM through the host
single stage (giova->hpa). "vfio_listener_log_sync" gets dirty pages by
transferring "giova" to the kernel for the RAM block section of mapped MMIO
region. In nested stage mode, we setup the stage 2 (gpa->hpa) and the stage 1
(giova->gpa) separately. So it is inapplicable to get dirty pages by the
current way in nested stage mode.

Second, it also need to pass stage 1 configurations to the destination host
after the migration. In Eric's patch, it passes the stage 1 configuration to
the host on each STE update for the devices set the PASID PciOps. The
configuration will be applied at physical level. But the data of physical
level will not be sent to the destination host. So we have to pass stage 1
configurations to the destination host after the migration.

This Patch set includes patches as below:
Patch 1-2:
- Refactor the vfio_listener_log_sync and added a new function to get dirty
pages for nested mode

Patch 3:
- Added global_log_start/stop interface in vfio_memory_prereg_listener for
nested mode

Patch 4:
- Added the post_load function to vmstate_smmuv3 for passing stage 1
configuration to the destination host after the migration

Best regards,
Kunkun Jiang

History:

v2 -> v3:
- Rebase to v9 of Eric's series 'vSMMUv3/pSMMUv3 2 stage VFIO integration'[1]
- Delete smmuv3_manual_set_pci_device_pasid_table() and reuse
  smmuv3_notify_config_change() [Eric]

v1 -> v2:
- Add global_log_start/stop interface in vfio_memory_prereg_listener
- Add support for repass stage 1 configs with multiple CDs to the host

[1] [RFC v9 00/29] vSMMUv3/pSMMUv3 2 stage VFIO integration
https://lore.kernel.org/qemu-devel/20210411120912.15770-1-eric.auger@redhat.com/

Kunkun Jiang (4):
  vfio: Introduce helpers to mark dirty pages of a RAM section
  vfio: Add vfio_prereg_listener_log_sync in nested stage
  vfio: Add vfio_prereg_listener_global_log_start/stop in nested stage
  hw/arm/smmuv3: Post-load stage 1 configurations to the host

 hw/arm/smmuv3.c  | 33 ++++++++++++++++++----
 hw/vfio/common.c | 73 ++++++++++++++++++++++++++++++++++++++++++------
 2 files changed, 93 insertions(+), 13 deletions(-)

-- 
2.23.0

