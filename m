Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5342066lfk;
        Sun, 21 Nov 2021 04:25:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkCHDmGoOHJoxr6C/rzKPvKmJwz7HAyp+dMC0up2YAXKHTrfALHFlTuMZDcLgR/arjhBr3
X-Received: by 2002:ac8:5d89:: with SMTP id d9mr22852558qtx.49.1637497536596;
        Sun, 21 Nov 2021 04:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637497536; cv=none;
        d=google.com; s=arc-20160816;
        b=Ie9KkLCixSTNhYpROD/3O91vVE2Pi50mjHVOnYWuwp+OXWuPl+v2Qwrc+JNAWmnHme
         DZJj8315Z/DAyJt/LtKcooN4vKbHfzAyifAe/7jGfEBZXj9v78FHNCVKbpDYvbzV5FmF
         X2/gmUC2nmqR9xrNzmMSd8rnfjg4XY9rLaU4bAeqJqaG+KBLxa5C//ivbkN4SQba454S
         pC0/LxCqWJwcnNi+VLF3MrcV7ofjVjxfekoxTY4rJLTOCWWWSU5pGujpL7TdZJJdUoK2
         oXyUTp8wqcLNM2IllVpI2se+dfRLeee95QxXOcklY3idurRQ3MXliWINfNsZAD6BIqXm
         6NzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:subject:cc:to;
        bh=2UY7Nbv/dANlIi9n26ts9X02Dc3mkqLW/OKm6nQFZeU=;
        b=nK8G58cp887Bxm/LyvQXapxFx0AqjgHja5aWX70eybOI0iWIzdMQTzYw/F8J1gx21f
         qEuHryEdyDBPgdy0FXi/HyoFdL5VXdei5Io0q/LVbQlzdDgtjrpDhFUQ/YC4keVLT+GV
         Busa/4P/Mzt1+24ngmYQlCYMFS6p+sdpUwiQX5EQjZUIIT/+gK0/EL5Tl8DLa9ZcskzL
         EQzZV4I7B8HT+T4m8hs1Mv7qL9p62Y4u448vDbA/+Oh3GJyCUe1WmPkdE4fsNdLE9kbx
         cvBdKEFr/YRW5hHR8AF1EmGuqrI5WXyzt3x/ZKrG4x4J5UcFSIrEJHyfwNBHNwgDKqSu
         N5dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si8729665qkm.112.2021.11.21.04.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Nov 2021 04:25:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1moluZ-0003pi-Uj
	for alex.bennee@linaro.org; Sun, 21 Nov 2021 07:25:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluL-0003oq-J7; Sun, 21 Nov 2021 07:25:21 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluH-0005l4-Rl; Sun, 21 Nov 2021 07:25:21 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HxqKp3wH8z1DJQQ;
 Sun, 21 Nov 2021 20:22:38 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 20:25:06 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric
 Blake <eblake@redhat.com>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH v4 00/10] ARM virt: Introduce CPU clusters topology support
Date: Sun, 21 Nov 2021 20:24:52 +0800
Message-ID: <20211121122502.9844-1-wangyanan55@huawei.com>
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
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-arm@nongnu.org>
X-TUID: N6yHXreddlpP

Hi,

This series introduces the new CPU clusters topology parameter
and enable the support for it on ARM virt machines.

Background and descriptions:
The new Cluster-Aware Scheduling support has landed in Linux 5.16,
which has been proved to benefit the scheduling performance (e.g.
load balance and wake_affine strategy) on both x86_64 and AArch64.
We can see Kernel PR [1] and the latest patch set [2] for reference.

So now in Linux 5.16 we have four-level arch-neutral CPU topology
definition like below and a new scheduler level for clusters.
struct cpu_topology {
    int thread_id;
    int core_id;
    int cluster_id;
    int package_id;
    int llc_id;
    cpumask_t thread_sibling;
    cpumask_t core_sibling;
    cpumask_t cluster_sibling;
    cpumask_t llc_sibling;
}

A cluster generally means a group of CPU cores which share L2 cache
or other mid-level resources, and it is the shared resources that
is used to improve scheduler's behavior. From the point of view of
the size range, it's between CPU die and CPU core. For example, on
some ARM64 Kunpeng servers, we have 6 clusters in each NUMA node,
and 4 CPU cores in each cluster. The 4 CPU cores share a separate
L2 cache and a L3 cache tag, which brings cache affinity advantage.

[1] https://lore.kernel.org/lkml/163572864855.3357115.17938524897008353101.tglx@xen13/
[2] https://lkml.org/lkml/2021/9/24/178

In virtualization, on the Hosts which have pClusters, if we can
design a vCPU topology with cluster level for guest kernel and
have a dedicated vCPU pinning. A Cluster-Aware Guest kernel can
also make use of the cache affinity of CPU clusters to gain
similar scheduling performance.

This series consists of two parts:
The first part (patch 1-3):
Implement infrastructure for CPU cluster level topology support,
including the SMP documentation, configuration and parsing.

The second part (part 4-10):
Enable CPU cluster support on ARM virt machines, so that users
can specify a 4-level CPU hierarchy sockets/clusters/cores/threads.
And the 4-level topology will be described to guest kernel through
ACPI PPTT and DT cpu-map.

Changelog:
v3->v4:
- Significant change from v3 to v4, since the whole series is reworked
  based on latest QEMU SMP frame.
- v3: https://lore.kernel.org/qemu-devel/20210516103228.37792-1-wangyanan55@huawei.com/

Yanan Wang (10):
  qemu-options: Improve readability of SMP related Docs
  hw/core/machine: Introduce CPU cluster topology support
  hw/core/machine: Wrap target specific parameters together
  hw/arm/virt: Support clusters on ARM virt machines
  hw/arm/virt: Support cluster level in DT cpu-map
  hw/acpi/aml-build: Improve scalability of PPTT generation
  hw/arm/virt-acpi-build: Make an ARM specific PPTT generator
  tests/acpi/bios-tables-test: Allow changes to virt/PPTT file
  hw/acpi/virt-acpi-build: Support cluster level in PPTT generation
  tests/acpi/bios-table-test: Update expected virt/PPTT file

 hw/acpi/aml-build.c         |  66 ++------------------------
 hw/arm/virt-acpi-build.c    |  92 +++++++++++++++++++++++++++++++++++-
 hw/arm/virt.c               |  16 ++++---
 hw/core/machine-smp.c       |  29 +++++++++---
 hw/core/machine.c           |   3 ++
 include/hw/acpi/aml-build.h |   5 +-
 include/hw/boards.h         |   6 ++-
 qapi/machine.json           |   5 +-
 qemu-options.hx             |  91 +++++++++++++++++++++++++++--------
 softmmu/vl.c                |   3 ++
 tests/data/acpi/virt/PPTT   | Bin 76 -> 96 bytes
 11 files changed, 214 insertions(+), 102 deletions(-)

--
2.19.1

