Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp346540lfm;
        Sun, 16 May 2021 03:29:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2o+JwSmB4xyzBr0S3bQMYs4o4sNencT06VbbmHYy/uAc3XmaUnXb4vvfM70IaLSJ8mW2Z
X-Received: by 2002:a92:d689:: with SMTP id p9mr8017929iln.242.1621160985089;
        Sun, 16 May 2021 03:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621160985; cv=none;
        d=google.com; s=arc-20160816;
        b=QWtXAiIruFKacE18NN6thaXhv3Qzn8BfiWirzC1fRZoINV76s2/TNWeSnjQxDRasoQ
         I83KSGsvfx4kJGiR9w6pyogM8n9oWN5E6BUDedNTiTkyfJ1uS0LB2N3Q2Ai2RlOoWB1t
         +8Jtoai0yQLpM8oI0D/tCf5buSDLanLvbqGJlj8xhEuSPcq3uN8LYH97f/UgIhgIn2X2
         lNjkzWmvR8tc3oJ40uB12PAtbI2Nm7Q1kwNgsuH/D3qY43V4m2aD/0DEey85na56iilq
         1Gmo6RrEJHpLYy+wrX9ml1x7SRFXD1upzmawhw3guw4dxX8a/o3XyBEPG430pum/NHcQ
         iaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=BeEsWKryNIAt3Jdg0wmgBJXRZnzF8rKe1hvRolSnKaQ=;
        b=0j9T9quySLqZUYEFBza6lJSGLUvlrN89KAerJJ7gf0zU4iBy9UuLi6jZvXQPbqAhUc
         3JjfwzylNxN1p0Hcireo8Z3B3hYWUZ10chdDl4lkV7B+pLKEyU5vGmNEbVkMqZQJZNZa
         MBdqnJ0Xgo1JOrOoZFq4hxSHOj16jajADw659bRq8TkHXoFgnUPRWisF8GBvkGhcbT4u
         pA4+HtXLcco81m/LLtLgnWuyrBj6+Tjr8LMKcFtVQtdIzokdkPA9fnaW8aKwKriMl9rD
         56sm7VdNSzzzrSFbMvKkaIhOUXV8APsG9n2D2Xza0d3C5pAHqBTm+xxWi9GxpaM+U39u
         9H+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si14608034ilv.52.2021.05.16.03.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 03:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:49436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liE1o-0001Pn-CP
	for alex.bennee@linaro.org; Sun, 16 May 2021 06:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1O-0001Pa-DQ; Sun, 16 May 2021 06:29:18 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1K-000799-Oo; Sun, 16 May 2021 06:29:17 -0400
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fjdh05rsvzmhBL;
 Sun, 16 May 2021 18:25:36 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:03 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:02 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, "Alistair
 Francis" <alistair.francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 0/9] hw/arm/virt: Introduce cpu topology support
Date: Sun, 16 May 2021 18:28:51 +0800
Message-ID: <20210516102900.28036-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>, zhukeqian1@huawei.com,
 yangyicong@huawei.com, prime.zeng@hisilicon.com, wanghaibin.wang@huawei.com,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jb562N21rvRa

Hi,

This is v3 of the series [1] that I posted to introduce support of
generating cpu topology descriptions to guest.

Description:
An accurate cpu topology may help improve the cpu scheduler's decision
making when dealing with multi-core system. So cpu topology description
is helpful to provide guest with the right view. Dario Faggioli's talk
in [2] also shows the virtual topology could have impact on scheduling
performace. Thus this patch series introduces cpu topology support for
ARM platform.

In this series, both cpu-map in DT and ACPI PPTT table are introduced
to present cpu topology to the guest. And a new helper virt_smp_parse
not like the default one is introduced, which has more strict parsing
rules for the -smp command line.

[1] https://patchwork.kernel.org/project/qemu-devel/cover/20210413080745.33004-1-wangyanan55@huawei.com/
[2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines-friend-or-foe-dario-faggioli-suse

Test results about exposure of topology:
After applying this patch series, launch a guest with virt-6.1.

Cmdline: -smp 96, sockets=2, cores=48, threads=1
Output:
linux-atxcNc:~ # lscpu
Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              96
On-line CPU(s) list: 0-95
Thread(s) per core:  1
Core(s) per socket:  48
Socket(s):           2
NUMA node(s):        1
Vendor ID:           0x48

Cmdline: -smp 96
linux-atxcNc:~ # lscpu
Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              96
On-line CPU(s) list: 0-95
Thread(s) per core:  1
Core(s) per socket:  96
Socket(s):           1
NUMA node(s):        1
Vendor ID:           0x48

THINGS TO DO SOON:
1) Run some benchmark to test the scheduling improvement of guest kernel
   introduced by virtual cpu topology.
2) Add some QEMU tests about ARM vcpu topology, ACPI PPTT table, and DT
   cpu nodes. Will post in a separate patchset later.

---

Changelogs:
v2->v3:
- address comments from David, Philippe, and Andrew. Thanks!
- split some change into separate commits for ease of review
- adjust parsing rules of virt_smp_parse to be more strict
  (after discussion with Andrew)
- adjust author credit for the patches
- v2: https://patchwork.kernel.org/project/qemu-devel/cover/20210413080745.33004-1-wangyanan55@huawei.com/

v1->v2:
- Address Andrew Jones's comments
- Address Michael S. Tsirkin's comments
- https://patchwork.kernel.org/project/qemu-devel/cover/20210225085627.2263-1-fangying1@huawei.com/

---

Andrew Jones (3):
  device_tree: Add qemu_fdt_add_path
  hw/arm/virt: Add cpu-map to device tree
  hw/arm/virt-acpi-build: Generate PPTT table

Yanan Wang (6):
  hw/arm/virt: Disable cpu topology support on older machine types
  hw/arm/virt: Initialize the present cpu members
  hw/arm/virt-acpi-build: Use possible cpus in generation of DSDT
  hw/arm/virt-acpi-build: Use possible cpus in generation of MADT
  hw/acpi/aml-build: Add Processor hierarchy node structure
  hw/arm/virt: Add separate -smp parsing function for ARM machines

 hw/acpi/aml-build.c          |  26 ++++++
 hw/arm/virt-acpi-build.c     |  99 ++++++++++++++++++++---
 hw/arm/virt.c                | 148 ++++++++++++++++++++++++++++++++++-
 include/hw/acpi/aml-build.h  |   4 +
 include/hw/arm/virt.h        |   2 +
 include/sysemu/device_tree.h |   1 +
 qemu-options.hx              |   4 +
 softmmu/device_tree.c        |  44 ++++++++++-
 8 files changed, 316 insertions(+), 12 deletions(-)

-- 
2.19.1

