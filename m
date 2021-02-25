Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp174473lfg;
        Thu, 25 Feb 2021 00:57:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyeONVv+4O9AY6ibs/Z4jt9WFS1WxsDPk4kgJ6TLDfTYd3qRsWrsOjlvsbhJ4niJmzVdPFt
X-Received: by 2002:a25:b207:: with SMTP id i7mr2499420ybj.301.1614243475272;
        Thu, 25 Feb 2021 00:57:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614243475; cv=none;
        d=google.com; s=arc-20160816;
        b=HC6W9xoAo0u2ZxgEz1oeITAKaVrxRF6Ni7/eAodm02ec8k5plIdeq9GtDznfMn7y23
         CoJbH6SWABVuFMpyvR1qV8bVv45vhqcwJf81eRCy3fFbxHeC1I7CKqOQLD1iWPZvGRtk
         TqZXme7CpeEg1Xd2ffG7gH69yk6Z2m8EsRwkaJLZjNHCK45pJIVV0G8TCEtg4xg6MtkB
         98Emv0bH4O2ISUJO+2jx68zwPNVMGXrWge8HyK7+IDEKXMAE8Qdu5Hmd9ykGjQeTI06e
         3hCo+TfTtfn70dysnpSk0H7Tq/piLBGGKFVlHTb5i1p/7HM3LAX+EKnMfLcXJJ0UvZ5h
         tabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=9qle4nRYHvu8RuZYDCfxLc8PR88Ci1MUWf1a7Ia61bc=;
        b=AK0LaQM67DC91uAPszuEeoeaBB7Rzz8It3oYgxV44IvY/dlxOYmpykDddFZg2EZ0lS
         N82luMqI/Hze+/r95XNktUV0+AldqnNwBryBGC2Wg9JQjGYrPrlS6WIQnRVsmZqgrQk6
         Zko99pha8ZCFAu4csNPOXLiYx/hHbzdMUwqHduUmMQGsnXh4w3LjUsJ7ts8jOiwBGcoy
         MtH12bhBVe+pHXAm6Uk/EWBKjtlrFIrfAjsuvg006fopp2HWNGz+249cta5hV8jj5aYs
         Dlbk4ENdeXJidgEf6XOqNPwLVnGBVZPXrYuI91a8ajnSvQReKJqG4wbeZa/EF5RaJJSd
         nrIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t29si5110727ybt.231.2021.02.25.00.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 00:57:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFCT4-00086Z-Jh
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 03:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSF-0007Xd-0M; Thu, 25 Feb 2021 03:57:03 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSA-0003sF-Fl; Thu, 25 Feb 2021 03:57:02 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DmRS1224zzMdfg;
 Thu, 25 Feb 2021 16:54:41 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Feb 2021
 16:56:36 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/5] hw/arm/virt: Introduce cpu topology support
Date: Thu, 25 Feb 2021 16:56:22 +0800
Message-ID: <20210225085627.2263-1-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, salil.mehta@huawei.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7cd0gjwhl72K

An accurate cpu topology may help improve the cpu scheduler's decision
making when dealing with multi-core system. So cpu topology description
is helpful to provide guest with the right view. Dario Faggioli's talk
in [0] also shows the virtual topology may has impact on sched performace.
Thus this patch series is posted to introduce cpu topology support for
arm platform.

Both fdt and ACPI are introduced to present the cpu topology. To describe
the cpu topology via ACPI, a PPTT table is introduced according to the
processor hierarchy node structure. This series is derived from [1], in
[1] we are trying to bring both cpu and cache topology support for arm
platform, but there is still some issues to solve to support the cache
hierarchy. So we split the cpu topology part out and send it seperately.
The patch series to support cache hierarchy will be send later since
Salil Mehta's cpu hotplug feature need the cpu topology enabled first and
he is waiting for it to be upstreamed.

This patch series was initially based on the patches posted by Andrew Jones [2].
I jumped in on it since some OS vendor cooperative partner are eager for it.
Thanks for Andrew's contribution.

After applying this patch series, launch a guest with virt-6.0 and cpu
topology configured with sockets:cores:threads = 2:4:2, you will get the
bellow messages with the lscpu command.

-----------------------------------------
Architecture:                    aarch64
CPU op-mode(s):                  64-bit
Byte Order:                      Little Endian
CPU(s):                          16
On-line CPU(s) list:             0-15
Thread(s) per core:              2
Core(s) per socket:              4
Socket(s):                       2
NUMA node(s):                    2
Vendor ID:                       HiSilicon
Model:                           0
Model name:                      Kunpeng-920
Stepping:                        0x1
BogoMIPS:                        200.00
NUMA node0 CPU(s):               0-7
NUMA node1 CPU(s):               8-15

[0] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines-friend-or-foe-dario-faggioli-suse
[1] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02166.html
[2] https://patchwork.ozlabs.org/project/qemu-devel/cover/20180704124923.32483-1-drjones@redhat.com

Ying Fang (5):
  device_tree: Add qemu_fdt_add_path
  hw/arm/virt: Add cpu-map to device tree
  hw/arm/virt-acpi-build: distinguish possible and present cpus
  hw/acpi/aml-build: add processor hierarchy node structure
  hw/arm/virt-acpi-build: add PPTT table

 hw/acpi/aml-build.c          | 40 ++++++++++++++++++++++
 hw/arm/virt-acpi-build.c     | 64 +++++++++++++++++++++++++++++++++---
 hw/arm/virt.c                | 40 +++++++++++++++++++++-
 include/hw/acpi/acpi-defs.h  | 13 ++++++++
 include/hw/acpi/aml-build.h  |  7 ++++
 include/hw/arm/virt.h        |  1 +
 include/sysemu/device_tree.h |  1 +
 softmmu/device_tree.c        | 45 +++++++++++++++++++++++--
 8 files changed, 204 insertions(+), 7 deletions(-)

-- 
2.23.0

