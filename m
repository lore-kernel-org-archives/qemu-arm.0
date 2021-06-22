Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2887541lfg;
        Tue, 22 Jun 2021 02:38:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGSq8w/pK9ThXzTX3zRcawE/t6gsue7lOJvTuLeKB5yR+wDgAN7LO2Vxu30Q5id9JZm2v4
X-Received: by 2002:ae9:f106:: with SMTP id k6mr3178413qkg.274.1624354702948;
        Tue, 22 Jun 2021 02:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624354702; cv=none;
        d=google.com; s=arc-20160816;
        b=xWYHiDuM6QmrpV3wpKBF/RigH+m7jVnfZWlml3lgDiv19uy0RWt3aqf5Qk+cqSPaUD
         HKnE5gLh50zfY5RwxzKitrbgJIjMcP2VMY3rGpT4mtnqUGBkT9arZ1B2aecHbeD5Olm5
         YsN1mqs6BM3FYUUws0lPozjwVr0TyBz4cLo0sz4JERhvWQvTR0e5ILc7d3DomC5Azsyl
         Ju9HHMww0IVoIZeJOwiPKTtethvV9yj0ClXSBUfcw/tkWqxCt+nL81Kfiazm7A5wUMGz
         76G+PueH9p6tfo4YH9pEgyuKF85nfpk978kJ8NLY7jjIIHis2TY7DvXdsuQ/JX2Pet9A
         baZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=s8oCLHijviMYOsgywZZytXDFaTqEutegzdVXJlfWOJk=;
        b=inf/FOPJyoRL7voCXy2ZJ9IiDe4OcVfamNNUUCJWJlA6eHAIKPuJrQ3+cF44+Ol8GK
         NPCIFEtT0OMi1HpQBVUm2MYfivFfdcXv+yLLmS2GdkP7g7rkwivRkK8ZeH7GVSil1LZj
         vAf/7sUyPfTMnjeJfc6Fpc+3SX/8VkAjzXaYh+AQ+lTR8sf506DrytC5BHvgk6zotODj
         QwxDxIbmz7+/K9kE9NkBjo+4ZNW4B1Eo3hHdWaMoFDAIFAeJjcsoMmds8cuzwl1IlDHR
         AO8eO6PzUSvQUYxOCjvBpr/mzEAle0hSmQUEFXc6pGfV+kzlN207MDxwITMdqR43JRh8
         4ztQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u62si13220330qkd.284.2021.06.22.02.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 02:38:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:58482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvcrO-0003cx-8k
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 05:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnm-000327-4E; Tue, 22 Jun 2021 05:34:38 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnh-0002ym-0l; Tue, 22 Jun 2021 05:34:37 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G8Lgr2vrWz1BPVv;
 Tue, 22 Jun 2021 17:29:12 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:21 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:20 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
Date: Tue, 22 Jun 2021 17:34:06 +0800
Message-ID: <20210622093413.13360-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9NG0UCFbrpOQ

Hi,

This is v4 of the series [1] that I posted to introduce support for
generating cpu topology descriptions to guest. Comments are welcome!

Description:
Once the view of an accurate virtual cpu topology is provided to guest,
with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
e.g., the scheduling performance improvement. See Dario Faggioli's
research and the related performance tests in [2] for reference. So here
we go, this patch series introduces cpu topology support for ARM platform.

In this series, instead of quietly enforcing the support for the latest
machine type, a new parameter "expose=on|off" in -smp command line is
introduced to leave QEMU users a choice to decide whether to enable the
feature or not. This will allow the feature to work on different machine
types and also ideally compat with already in-use -smp command lines.
Also we make much stricter requirement for the topology configuration
with "expose=on".

Furthermore, both cpu-map in DT and ACPI PPTT table are introduced to
present cpu topology to the guest. And an ARM-specific -smp parsing
function virt_smp_parse is introduced, which shares the same logic
with smp_parse() when "expose=off" and follow the stricter parsing
rule when "expose=on".

[1] https://patchwork.kernel.org/project/qemu-devel/cover/20210516102900.28036-1-wangyanan55@huawei.com/
[2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines-friend-or-foe-dario-faggioli-suse

Test results about exposure of topology:
After applying this patch series, launch an ACPI guest with virt-6.1 on an ARM server.

1) Enable the support:
With cmdline: -smp 96,sockets=2,cores=48,threads=1,expose=on
  or cmdline: -smp 96,maxcpus=96,sockets=2,cores=48,threads=1,expose=on
we get:
Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              96
On-line CPU(s) list: 0-95
Thread(s) per core:  1
Core(s) per socket:  48
Socket(s):           2
NUMA node(s):        1
Vendor ID:           0x48
Model:               0
Stepping:            0x1
BogoMIPS:            200.00
NUMA node0 CPU(s):   0-95

2) Disable the support:
With cmdline: -smp 96
  or cmdline: -smp 96,expose=off
we get:
Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              96
On-line CPU(s) list: 0-95
Thread(s) per core:  1
Core(s) per socket:  96
Socket(s):           1
NUMA node(s):        1
Vendor ID:           0x48
Model:               0
Stepping:            0x1
BogoMIPS:            200.00
NUMA node0 CPU(s):   0-95

---

Changelogs:

v3->v4:
- add new -smp parameter "expose=on|off" for users to enable/disable the feature
- add stricter -smp cmdline parsing rules on "expose=on" case
- move build_pptt to generic aml-build.c
- add default cluster node in the cpu-map
- rebase on top of latest upstream master
- v3: https://patchwork.kernel.org/project/qemu-devel/cover/20210516102900.28036-1-wangyanan55@huawei.com/

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
- v1: https://patchwork.kernel.org/project/qemu-devel/cover/20210225085627.2263-1-fangying1@huawei.com/

---

Andrew Jones (2):
  hw/arm/virt: Add cpu-map to device tree
  hw/acpi/aml-build: Generate PPTT table

Yanan Wang (5):
  vl: Add expose=on|off option support in -smp command line
  hw/arm/virt: Add separate -smp parsing function for ARM machines
  machine: disallow -smp expose=on for non-ARM machines
  device_tree: Add qemu_fdt_add_path
  hw/acpi/aml-build: Add Processor hierarchy node structure

 hw/acpi/aml-build.c          |  75 +++++++++++++++
 hw/arm/virt-acpi-build.c     |   8 +-
 hw/arm/virt.c                | 171 +++++++++++++++++++++++++++++++++--
 hw/core/machine.c            |   7 ++
 hw/i386/pc.c                 |   7 ++
 include/hw/acpi/aml-build.h  |   7 ++
 include/hw/boards.h          |   1 +
 include/sysemu/device_tree.h |   1 +
 qemu-options.hx              |  24 +++--
 softmmu/device_tree.c        |  44 ++++++++-
 softmmu/vl.c                 |   3 +
 11 files changed, 326 insertions(+), 22 deletions(-)

-- 
2.23.0

