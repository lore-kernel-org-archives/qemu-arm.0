Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp901036ejk;
        Wed, 29 May 2024 16:43:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBCcecB8O9LApuTxNX3Ma6eUuUKFy2lDfAVRuG098RXZtbbJ/+j8PLlWtPwToMk8x2eHUpqG8bBIGZ3YGRC+/6RXxoCEKL
X-Google-Smtp-Source: AGHT+IG1y+dPzA9Gic56Kjo6SuS0FCDFFeVXM4eauy0yc4xcLtw6otoZ50idTjrexPLd7uIhDrG+
X-Received: by 2002:a5d:50c2:0:b0:357:73ca:9c00 with SMTP id ffacd0b85a97d-35dc009a619mr306653f8f.32.1717026211183;
        Wed, 29 May 2024 16:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717026211; cv=none;
        d=google.com; s=arc-20160816;
        b=QJKN5TYNrT8fn75eCxYTb3okon07RIG9YnI79bG9Jb6eSNzDcBq3PVN6WctIAC0B/I
         9Fk93WkMisnyrz06tsLv5w2iK5nvZik+LGZc/0dDriU7uutXdhM16l7j8N/edmGYeuzj
         NGvxBi5fZVloCQNkrnIKfYp0bQoO49fjKgLzwlLR/3vbagcxJiOJPi+u99bas98TYC1C
         i0SWeU5fhwLdzewsFGSWXpqufpXYLBijpxC6Yz+UD3GGJ7ZR11UWPFSyYH+OWql4Dmf/
         mpKMpCpk23QzhOhvAYb5UiwTFzx0ocXzS5RIhUK7+picEP7tPg3fmiErekJ1OKzROSPK
         HF9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=cUi4Je7EPyVQWUrezZ3g9b+APnJfOn7OCfNleEaLOOg=;
        fh=M0HTAxrI6BYZKxYd63sfeObsGy+Uhk81OO6h++LFq4Q=;
        b=JiO0zcFfpJyTMbhfs3kbc9KdXLjRk5v/lB/ZqcIvcdo8q3XYam5Kp6rXbS6thZpvfH
         ptnu5XTY0vpJL9VefVVeQBtlO1wpE7yMnHlzyo+aDkgiQlv4emCFnLLXroca4aX4iQpV
         U1wELPE+eBiI+jamU3kfv/yC3Q0nYtB63FdEjRzhJZxMWr5lqnILyroE++WRvmUyGPOW
         X/6ct5J5gxfJLiZ4mB4CYDZmp+ebSFIPe2C8lkBoA7DYabWyW3CWsS/8dhyLTYWVBemS
         OOrKHdv5gdetbsrRg8HRbDq5RlychMNh6V9Z//rFq/x02xX5il1brrh3Hpio50EFl3uT
         NVdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-35dc982ec63si42644f8f.862.2024.05.29.16.43.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2024 16:43:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VqQnt4s7vz6K5lJ;
	Thu, 30 May 2024 07:39:14 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id C5B951400D7;
	Thu, 30 May 2024 07:43:29 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.246.47) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 00:43:09 +0100
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
Subject: [PATCH V12 0/8] Add architecture agnostic code to support vCPU Hotplug
Date: Thu, 30 May 2024 00:42:33 +0100
Message-ID: <20240529234241.205053-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.195.246.47]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: nKk0BViL0tFo

Virtual CPU hotplug support is being added across various architectures[1][3].
This series adds various code bits common across all architectures:

1. vCPU creation and Parking code refactor [Patch 1]
2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
3. ACPI CPUs AML code change [Patch 4,5]
4. Helper functions to support unrealization of CPU objects [Patch 6,7]
5. Docs [Patch 8]


Repository:

[*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v3.arch.agnostic.v12

NOTE: This series is meant to work in conjunction with Architecture specific patch-set.
For ARM, this will work in combination of the architecture specific part based on
RFC V2 [1]. This architecture specific patch-set RFC V3 shall be floated soon and is
present at below location

[*] https://github.com/salil-mehta/qemu/tree/virt-cpuhp-armv8/rfc-v3-rc1


Revision History:

Patch-set  V11 -> V12
1. Addressed Harsh Prateek Bora's (IBM) comment
   - Changed @cpu to @vcpu_id in the kvm_unpark_vcpu protoype header/
2. Added Zhao Liu's (Intel) Tested-by for whole series
   - Qtest does not breaks on Intel platforms now.
3. Added Zhao Liu's (Intel) Reviewed-by for [PATCH V11 {1/8 - 3/8}]
Link: https://lore.kernel.org/qemu-devel/ZlRSPuJGBgyEUW6w@intel.com/
Link: https://lore.kernel.org/qemu-devel/a5f3d78e-cfed-441f-9c56-e3e78fa5edee@linux.ibm.com/

Patch-set  V10 -> V11
1. Addressed Nicholas Piggin's (IBM) comment
   - moved the traces in kvm_unpark_vcpu and kvm_create_vcpu at the end
   - Added the Reviewed-by Tag for [PATCH V10 1/8]
2.  Addressed Alex Bennée's (Linaro) comments
   - Added a note explaining dependency of the [PATCH V10 7/8] on Arch specific patch-set
Link: https://lore.kernel.org/qemu-devel/D1FS5GOOFWWK.2PNRIVL0V6DBL@gmail.com/ 
Link: https://lore.kernel.org/qemu-devel/87frubi402.fsf@draig.linaro.org/

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

 accel/kvm/kvm-all.c                    | 95 +++++++++++++++++---------
 accel/kvm/kvm-cpus.h                   | 23 +++++++
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
 17 files changed, 212 insertions(+), 48 deletions(-)

-- 
2.34.1
