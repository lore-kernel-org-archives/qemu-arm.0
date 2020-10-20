Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4780661lfa;
        Tue, 20 Oct 2020 06:18:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgAcM3Dwibu4VR7TfMovNRByTsO2AhIlSQDjvhaiIY1RR4F9KhXB6N0bSySrylmO6wL09Y
X-Received: by 2002:a25:3883:: with SMTP id f125mr4079389yba.29.1603199884649;
        Tue, 20 Oct 2020 06:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603199884; cv=none;
        d=google.com; s=arc-20160816;
        b=GUVhZHu370FEhI0sIj+vIR8Myb3GRJVRxMDWAEoZ6TMlEbAIK+tUMahMLaVnLbn7qr
         opPnYK2Dt+jTkavFScBxikZnAsAjHDje1DE/JulhKIngdLfnAwPjosX9/8WMg3jSZiVX
         o5pOa9eZK+F+pQzGgOqZ5E0kx4ZnDyW+wxjy9JR7bzKnp2mPJTew7gtoGXJQuKce2d4g
         tPtDVY3jInJba+7CX+4GZjtlJGvDGZxp8wKmvHTNaDDHoymf+s/8r8SHKm+BMJVSIGti
         POFmUYNTDOJY7US3i2kTE9ImJ7DA9a9cFRjmtw3kw3IkN2VDAG5CdF2WqK5mUNy8AUcK
         fwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=01VvMzre/MEb65NfoAPu54AZa0x7sFemio239Z0Cd2g=;
        b=EiKUEkxiY42pxcLKmReJeFhkoibFWFu7tyOGwTRHXjPJiOXxl5rarB2Uh/eHfyrLdR
         /MxUnCwrvroJd455GvTk6gVbSYkSKVkD9nlhfL1zQXbS/9ozmVYdGRDWnS9fCyDFDJxr
         MB2o8pFcQkrszQLbt1btdriwbcutCflNqB02OrZQfQT1JFSNRYFlDeVcj4jV4lnJX6HJ
         /hGLwSZygMZLXT32jOpQJ3gXoLcsJrh+y8jVn53Aezpt1Moc4LRO/TadCQdnkkPD2qgn
         c0Yd4s5iVX9OYjFx6hQHoZpRqMTZVMgpdgQiMLPPDEIWGwRiAz7rnjsr7y+ILtI/d7ll
         wTbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 65si1669110ybb.207.2020.10.20.06.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 06:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUrWd-00024j-VE
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 09:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU2-0000DM-Ta; Tue, 20 Oct 2020 09:15:22 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42544 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrTy-000763-P8; Tue, 20 Oct 2020 09:15:22 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9984933EAF0E1FB03819;
 Tue, 20 Oct 2020 21:15:05 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:14:58 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 00/13] hw/arm/virt: Introduce cpu and cache topology
 support
Date: Tue, 20 Oct 2020 21:14:27 +0800
Message-ID: <20201020131440.1090-1-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 09:15:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DqMXN6rh9qgT

An accurate cpu topology may help improve the cpu scheduler's decision
making when dealing with multi-core system. So cpu topology description
is helpful to provide guest with the right view. Cpu cache information may
also have slight impact on the sched domain, and even userspace software
may check the cpu cache information to do some optimizations. Thus this patch
series is posted to provide cpu and cache topology support for arm.

Both fdt and ACPI are introduced to present the cpu and cache topology.
To describe the cpu topology via ACPI, a PPTT table is introduced according
to the processor hierarchy node structure. To describe the cpu cache
information, a default cache hierarchy is given and built according to the
cache type structure defined by ACPI, it can be made configurable later.

The RFC v1 was posted at [1], we tried to map the MPIDR register into cpu
topology, however it is totally wrong. Andrew points it out that Linux kernel
is goint to stop using MPIDR for topology information [2]. The root cause is
the MPIDR register has been abused by ARM OEM manufactures. It is only used as
an identifer for a specific cpu, not representation of the topology. Moreover
this v2 is rebased on Andrew's latest branch shared [4].

This patch series was initially based on the patches posted by Andrew Jones [3].
I jumped in on it since some OS vendor cooperative partner are eager for it.
Thanks for Andrew's contribution.

After applying this patch series, launch a guest with virt-5.3 and cpu
topology configured with sockets:cores:threads = 2:4:2, you will get the
bellow messages with the lscpu command.

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
L1d cache:                       512 KiB
L1i cache:                       512 KiB
L2 cache:                        4 MiB
L3 cache:                        128 MiB
NUMA node0 CPU(s):               0-7
NUMA node1 CPU(s):               8-15

changelog
v1 -> v2:
* Rebased to the latest branch shared by Andrew Jones [4]
* Stop mapping MPIDR into vcpu topology

[1] https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg06027.html
[2] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20200829130016.26106-1-valentin.schneider@arm.com/
[3] https://patchwork.ozlabs.org/project/qemu-devel/cover/20180704124923.32483-1-drjones@redhat.com
[4] https://github.com/rhdrjones/qemu/commits/virt-cpu-topology-refresh


Andrew Jones (5):
  hw/arm/virt: Spell out smp.cpus and smp.max_cpus
  hw/arm/virt: Remove unused variable
  hw/arm/virt: Replace smp_parse with one that prefers cores
  device_tree: Add qemu_fdt_add_path
  hw/arm/virt: DT: add cpu-map

Ying Fang (8):
  hw: add compat machines for 5.3
  hw/arm/virt-acpi-build: distinguish possible and present cpus Message
  hw/acpi/aml-build: add processor hierarchy node structure
  hw/arm/virt-acpi-build: add PPTT table
  target/arm/cpu: Add CPU cache description for arm
  hw/arm/virt: add fdt cache information
  hw/acpi/aml-build: build ACPI CPU cache hierarchy information
  hw/arm/virt-acpi-build: Enable CPU cache topology

 device_tree.c                |  45 +++++-
 hw/acpi/aml-build.c          |  68 +++++++++
 hw/arm/virt-acpi-build.c     |  99 ++++++++++++-
 hw/arm/virt.c                | 270 +++++++++++++++++++++++++++++++----
 hw/core/machine.c            |   3 +
 hw/i386/pc.c                 |   3 +
 hw/i386/pc_piix.c            |  15 +-
 hw/i386/pc_q35.c             |  14 +-
 hw/ppc/spapr.c               |  15 +-
 hw/s390x/s390-virtio-ccw.c   |  14 +-
 include/hw/acpi/acpi-defs.h  |  14 ++
 include/hw/acpi/aml-build.h  |  11 ++
 include/hw/arm/virt.h        |   4 +-
 include/hw/boards.h          |   3 +
 include/hw/i386/pc.h         |   3 +
 include/sysemu/device_tree.h |   1 +
 target/arm/cpu.c             |  42 ++++++
 target/arm/cpu.h             |  27 ++++
 18 files changed, 606 insertions(+), 45 deletions(-)

-- 
2.23.0

