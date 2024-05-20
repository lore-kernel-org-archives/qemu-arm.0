Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1752354ejb;
        Mon, 20 May 2024 16:33:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDgKbNAjc3o/9zPWG2MgLm7cRY1mL5qswDnj5DJc4OXgp4kzZP/XfSne+HmlxJLq1LCwzfjIpIQCxX2wUZo7hU/biRCrOT
X-Google-Smtp-Source: AGHT+IGBtwSU7uPJt+maI4EylQ9VruXNc+ECaIubQ0uAbsC5Xh9qkwXEqkiskfm006AoPGrHL5Qr
X-Received: by 2002:a5d:4402:0:b0:34e:ac9d:8ef3 with SMTP id ffacd0b85a97d-3504a61c98bmr21976038f8f.13.1716248009789;
        Mon, 20 May 2024 16:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716248009; cv=none;
        d=google.com; s=arc-20160816;
        b=I5qgShGttD90HvmUicRnSkT7IJlETYnf7jeIdilNVpP2zC29uc/i1sVtYgKSxQMIAf
         Mlgt7wVJE4CSlLdkjNGM1hd8GNopwmX/pVbbUpTuU9LJpcy5hlHxBJA2fMfCOl0SmygV
         QzITBxl+pl9PChJM+8WDCQGrrHp9bsAsNdDUopV8iBn3Swm2w2KfqnqJ14fl13KDJqJL
         xrfWH4sYs4tNkwDigJlwp2+ZoPSIdaLSX+QyhsMNgvs68VFSlNEvbe92mgCvp8++M++o
         b4AzLMBuDPaTaq/IVzDSJbkAWpBUB9QKEoll8qd71IdThRp0WTrhPlUcJxdrnPOABu0V
         YuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=OyLfN4awpaT//T6a3fZCGE6Kwa4gkQWyR7tCG9MUZFE=;
        fh=M0HTAxrI6BYZKxYd63sfeObsGy+Uhk81OO6h++LFq4Q=;
        b=PXVOYXRQlgm+ByppYdBP7luUAZ2j1hxMKuf9qJ9vY2IXwQbkH8rxDEnqsfT5nxiidi
         gRwRV1czf742J/6vWSuy5GKGgCLwf5z+lwAbi9fUUM09csJ4dctN7wgP9Od+KHfds7HZ
         QY/jKgKf9tB/gVHIF+6Y2IULGc2wAI1vfDw/9/RMvWLfuK5utnDJz9y8IBJzUJkfBHIK
         YqlkLZaEdKPRw5yrSlTcdn015chsDTHsFjWgk8++ouifMMxNgVeLI+iS8mqpSxqHEPMV
         c9A5Cj9+kVNQCN5NSLBWRRXsjTdFlJ2pJkaw+N9xSsXZloFwStUUG9UmqAwlI2tQHskn
         U+NA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-354c86b771dsi1407497f8f.151.2024.05.20.16.33.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2024 16:33:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vjv4S5kTSz6J79X;
	Tue, 21 May 2024 07:32:40 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D274140B35;
	Tue, 21 May 2024 07:33:28 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.126.174.235) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 00:33:06 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>
Subject: [PATCH V10 0/8] Add architecture agnostic code to support vCPU Hotplug
Date: Tue, 21 May 2024 00:32:33 +0100
Message-ID: <20240520233241.229675-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.174.235]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: f1DMHn1Ideuo

Virtual CPU hotplug support is being added across various architectures[1][3].
This series adds various code bits common across all architectures:

1. vCPU creation and Parking code refactor [Patch 1]
2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
3. ACPI CPUs AML code change [Patch 4,5]
4. Helper functions to support unrealization of CPU objects [Patch 6,7]
5. Docs [Patch 8]


Repository:

[*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v3.arch.agnostic.v10

NOTE: For ARM, above will work in combination of the architecture specific part based on
RFC V2 [1]. This architecture specific patch-set RFC V3 shall be floated soon and is present
at below location

[*] https://github.com/salil-mehta/qemu/tree/virt-cpuhp-armv8/rfc-v3-rc1


Revision History:

Patch-set  V9 -> V10
1. Addressed Nicholas Piggin's (IBM) & Philippe Mathieu-Daudé (Linaro) comments
   - carved out kvm_unpark_vcpu and added its trace
   - Widened the scope of the kvm_unpark_vcpu so that it can be used by generic framework
     being thought out
Link: https://lore.kernel.org/qemu-devel/20240519210620.228342-1-salil.mehta@huawei.com/
Link: https://lore.kernel.org/qemu-devel/e94b0e14-efee-4050-9c9f-08382a36b63a@linaro.org/

Patch-set  V8 -> V9
1. Addressed Vishnu Pajjuri's (Ampere) comments
   - Added kvm_fd to trace in kvm_create_vcpu
   - Some clean ups: arch vcpu-id and sbd variable
   - Added the missed initialization of cpu->gdb_num_regs
2. Addressed the commnet from Zhao Liu (Intel)
   - Make initialization of CPU Hotplug state conditional (possible_cpu_arch_ids!=NULL)
Link: https://lore.kernel.org/qemu-devel/20240312020000.12992-1-salil.mehta@huawei.com/

Patch-set V7 -> V8
1. Rebased and Fixed the conflicts

Patch-set  V6 -> V7
1. Addressed Alex Bennée's comments
   - Updated the docs
2. Addressed Igor Mammedov's comments
   - Merged patches [Patch V6 3/9] & [Patch V6 7/9] with [Patch V6 4/9]
   - Updated commit-log of [Patch V6 1/9] and [Patch V6 5/9]     
3. Added Shaoqin Huang's Reviewed-by tags for whole series.
Link: https://lore.kernel.org/qemu-devel/20231013105129.25648-1-salil.mehta@huawei.com/

Patch-set  V5 -> V6
1. Addressed Gavin Shan's comments
   - Fixed the assert() ranges of address spaces
   - Rebased the patch-set to latest changes in the qemu.git
   - Added Reviewed-by tags for patches {8,9}
2. Addressed Jonathan Cameron's comments
   - Updated commit-log for [Patch V5 1/9] with mention of trace events
   - Added Reviewed-by tags for patches {1,5}
3. Added Tested-by tags from Xianglai Li
4. Fixed checkpatch.pl error "Qemu -> QEMU" in [Patch V5 1/9] 
Link: https://lore.kernel.org/qemu-devel/20231011194355.15628-1-salil.mehta@huawei.com/

Patch-set  V4 -> V5
1. Addressed Gavin Shan's comments
   - Fixed the trace events print string for kvm_{create,get,park,destroy}_vcpu
   - Added Reviewed-by tag for patch {1}
2. Added Shaoqin Huang's Reviewed-by tags for Patches {2,3}
3. Added Tested-by Tag from Vishnu Pajjuri to the patch-set
4. Dropped the ARM specific [Patch V4 10/10]
Link: https://lore.kernel.org/qemu-devel/20231009203601.17584-1-salil.mehta@huawei.com/

Patch-set  V3 -> V4
1. Addressed David Hilderbrand's comments
   - Fixed the wrong doc comment of kvm_park_vcpu API prototype
   - Added Reviewed-by tags for patches {2,4}
Link: https://lore.kernel.org/qemu-devel/20231009112812.10612-1-salil.mehta@huawei.com/

Patch-set  V2 -> V3
1. Addressed Jonathan Cameron's comments
   - Fixed 'vcpu-id' type wrongly changed from 'unsigned long' to 'integer'
   - Removed unnecessary use of variable 'vcpu_id' in kvm_park_vcpu
   - Updated [Patch V2 3/10] commit-log with details of ACPI_CPU_SCAN_METHOD macro
   - Updated [Patch V2 5/10] commit-log with details of conditional event handler method
   - Added Reviewed-by tags for patches {2,3,4,6,7}
2. Addressed Gavin Shan's comments
   - Remove unnecessary use of variable 'vcpu_id' in kvm_par_vcpu
   - Fixed return value in kvm_get_vcpu from -1 to -ENOENT
   - Reset the value of 'gdb_num_g_regs' in gdb_unregister_coprocessor_all
   - Fixed the kvm_{create,park}_vcpu prototypes docs
   - Added Reviewed-by tags for patches {2,3,4,5,6,7,9,10}
3. Addressed one earlier missed comment by Alex Bennée in RFC V1
   - Added traces instead of DPRINTF in the newly added and some existing functions
Link: https://lore.kernel.org/qemu-devel/20230930001933.2660-1-salil.mehta@huawei.com/

Patch-set V1 -> V2
1. Addressed Alex Bennée's comments
   - Refactored the kvm_create_vcpu logic to get rid of goto
   - Added the docs for kvm_{create,park}_vcpu prototypes
   - Splitted the gdbstub and AddressSpace destruction change into separate patches
   - Added Reviewed-by tags for patches {2,10}
Link: https://lore.kernel.org/qemu-devel/20230929124304.13672-1-salil.mehta@huawei.com/

References:

[1] https://lore.kernel.org/qemu-devel/20230926100436.28284-1-salil.mehta@huawei.com/
[2] https://lore.kernel.org/all/20230913163823.7880-1-james.morse@arm.com/
[3] https://lore.kernel.org/qemu-devel/cover.1695697701.git.lixianglai@loongson.cn/



Salil Mehta (8):
  accel/kvm: Extract common KVM vCPU {creation,parking} code
  hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
  hw/acpi: Update ACPI GED framework to support vCPU Hotplug
  hw/acpi: Update GED _EVT method AML with CPU scan
  hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
  physmem: Add helper function to destroy CPU AddressSpace
  gdbstub: Add helper function to unregister GDB register space
  docs/specs/acpi_hw_reduced_hotplug: Add the CPU Hotplug Event Bit

 accel/kvm/kvm-all.c                    | 97 +++++++++++++++++---------
 accel/kvm/kvm-cpus.h                   | 23 ++++++
 accel/kvm/trace-events                 |  5 +-
 docs/specs/acpi_hw_reduced_hotplug.rst |  3 +-
 gdbstub/gdbstub.c                      | 13 ++++
 hw/acpi/acpi-cpu-hotplug-stub.c        |  6 ++
 hw/acpi/cpu.c                          | 33 ++++++---
 hw/acpi/generic_event_device.c         | 21 ++++++
 hw/core/cpu-common.c                   |  1 -
 hw/i386/acpi-build.c                   |  3 +-
 include/exec/cpu-common.h              |  8 +++
 include/exec/gdbstub.h                 |  6 ++
 include/hw/acpi/cpu.h                  |  5 +-
 include/hw/acpi/cpu_hotplug.h          |  4 ++
 include/hw/acpi/generic_event_device.h |  4 ++
 include/hw/core/cpu.h                  |  1 +
 system/physmem.c                       | 29 ++++++++
 17 files changed, 214 insertions(+), 48 deletions(-)

-- 
2.34.1
