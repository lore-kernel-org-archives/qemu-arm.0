Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1605798lfb;
        Fri, 7 Jan 2022 00:35:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNZlOE1YuKOAO0rg67NPahzaxQ/QStWZYBtkdBnZ168zEZh1EIVcJv/arlCr2r47CdMxlV
X-Received: by 2002:a05:620a:2808:: with SMTP id f8mr43955268qkp.196.1641544550899;
        Fri, 07 Jan 2022 00:35:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641544550; cv=none;
        d=google.com; s=arc-20160816;
        b=EP2mlJv5BjRLAgsLhjMloWDWhdRJ5o8VB3MDiaaSmZd7w9kVx+p2UnHjGcmJ8UkfOo
         U0QXCnwjbaVFexMr2zZdkly6451YmU68N6+rp1hhMO9PI5wMlzfe+xP0oA3YJkHFgWuY
         WB8lhzyZ1r1GLnml/X7uPzHsPe93X30i5AsX3PPU9LhLns5TT2+RUhW+AvdXpYSsAZM1
         p1jkN8r5LsRqIDcc9Wp0xZFUZaOR2LSHya06tD8W7ENTDvSQG2yNsMqt/RRZicGmqyeC
         mf65ObolDA/hEw8/WuEac4fBl5JC6oOfXCeRW37Y9stnicu4uM/AYGTCMghZd7TE0fbM
         GGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:subject:cc:to;
        bh=UmfMap1s9Qd98ojcFEcxIKA7qIYc9JQbAG0LiYYuxzs=;
        b=DE3HiMF4+jF1/e1Rq3zArrPES6ouArUFZLMbHqOPRGNKV1xblJ2aZxcOROIUc93MBx
         RloRq0pEsQmAAazMUtSO2AOIf/WrYM1N5jQFQu1y1T4t8qZqKV8TAP+Jz5GxNrnjvdeD
         lKPe6fsS1G8tMwVfYqoyYIYObvhppgbJwfutAA5BMSqTyEFK7yv5xLfbN549gwLjqcvN
         Xwco9LquWOdX5wOQco5uT1wxjJAghf9gyh2gD3AOcEDlYhCBlzfGmUCYWzu1oEzMFHYf
         LXTFWBPopYLvPkAg1XxjpiqEjLq2PCRkgQna2BakD62bze6cfLsZT4AjtgIjdALCRc91
         VwRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu12si254289qvb.258.2022.01.07.00.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 00:35:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:42658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5kj0-00038K-Dd
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 03:35:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg3-0000NY-C8; Fri, 07 Jan 2022 03:32:47 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:3262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg0-0001de-9k; Fri, 07 Jan 2022 03:32:47 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JVbwd2fw9z1FCX6;
 Fri,  7 Jan 2022 16:29:05 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:32:34 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v7 0/6] ARM virt: Support CPU cluster topology
Date: Fri, 7 Jan 2022 16:32:26 +0800
Message-ID: <20220107083232.16256-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-devel@nongnu.org>
X-TUID: kXOOh9GW6LHT

This v7 series enables the support for CPU cluster topology on
ARM virt machines. The generic infrastructure for CPU cluster
parameter has been in upstream.

Background and descriptions:
The new Cluster-Aware Scheduling support has landed in Linux 5.16,
which has been proved to benefit the scheduling performance (e.g.
load balance and wake_affine strategy) for both x86_64 and AArch64.
We can see the PR [1] or the actual patch series [2] for reference.

So since Linux 5.16 we have four-level arch-neutral CPU topology
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

In virtualization, on the Hosts which have physical clusters, if we
can design a vCPU topology with cluster level for guest kernel and
have a dedicated vCPU pinning. A Cluster-Aware Guest kernel can also
make use of the cache affinity of CPU clusters to gain similar
scheduling performance. This series only enables clusters support
in the vCPU topology on ARM virt machines. We can also enable it
for other machine types in the future if needed.

The patches in this series do:
- Enable CPU cluster support on ARM virt machines, so that users
  can specify a 4-level CPU hierarchy sockets/clusters/cores/threads.
  And the 4-level topology will be described to guest kernel through
  ACPI PPTT and DT cpu-map.

Changelog:
v6->v7:
- dropped the introduced ARM specific build_pptt() and extend the generic one
- added A-bs/R-bs from Andrew and Ani, thanks.
- v6: https://patchew.org/QEMU/20220103084636.2496-1-wangyanan55@huawei.com/

v5->v6:
- dropped the generic part which is in upstream now
- rebased on latest master
- v5: https://patchew.org/QEMU/20211228092221.21068-1-wangyanan55@huawei.com/

Yanan Wang (6):
  hw/arm/virt: Support CPU cluster on ARM virt machine
  hw/arm/virt: Support cluster level in DT cpu-map
  hw/acpi/aml-build: Improve scalability of PPTT generation
  tests/acpi/bios-tables-test: Allow changes to virt/PPTT file
  hw/acpi/aml-build: Support cluster level in PPTT generation
  tests/acpi/bios-table-test: Update expected virt/PPTT file

 hw/acpi/aml-build.c       |  68 ++++++++++++++++++++++++++++----------
 hw/arm/virt.c             |  16 +++++----
 qemu-options.hx           |  10 ++++++
 tests/data/acpi/virt/PPTT | Bin 76 -> 96 bytes
 4 files changed, 69 insertions(+), 25 deletions(-)

-- 
2.27.0

