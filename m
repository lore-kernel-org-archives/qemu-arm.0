Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2819njc;
        Thu, 31 Oct 2024 13:05:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTLted4AIez4qFBL0uS2th49sGp0RrlpmJki2zeRTVlXL9F5mJqbn9lkojk8rGdX7OmofbCH73YyY97Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFxt+TFLpIkPK9ko7lkXGz4HbWChVr66o22virFpF/Ra1d9wK2yoK5JYHcNutlwwqP7hQTe
X-Received: by 2002:a05:600c:1c04:b0:431:5bf2:2d4 with SMTP id 5b1f17b1804b1-4327b8000efmr44297715e9.29.1730405149101;
        Thu, 31 Oct 2024 13:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730405149; cv=none;
        d=google.com; s=arc-20240605;
        b=lo/cwFTps5xHGzIl/rIXwxpoaKdf1Fuhe9EHYoYaUF6C0rtTgR5RtSDgahcsrAY+4Q
         0d16U7oYBNZ50sv5ZTqsKwQCh4T9ZMhb8UDTsqmfeoyACi+HGMGcp6iYV/mhqke0Fh3Q
         PYPe0CEXsroO2K0eZZ/nvD8KsfGwkhIw6kFHU4HQ6GPv0zBnVuSSaHm40Ou6rYnx4dzL
         F11xujxrseMS9megxFfU9VECwOdF5SCiaWeJTrqlU+6jgx6FS2RvSgm3q86D8ZPMuNi5
         JtTa0U4C31Ww994wG2HWSQKTvetzZwTXYjFFyTRjKYiDCKWQOLHEe3Aeg6lcRIuQ2BCb
         DygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=i8RUYWUiCXx3hSZTn+CohDWE2ufoqunI8wLMYfyYqtk=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=boGtT+LYKd89vcxW2x7aQ+QyEjzVgl9FWZS15DtnuxlxcKdgu1SQFuq2KT7GeQrZQw
         PQIWFdEQA0aIRkfy7KHup+X6ld7dVOA509tQunfW7opjH0Jt+jhbj37m4f3q73iJBPXW
         EdFX+tITL/dqkHfV5ZBND0EXqzV/+f3XugFVb1xowZfgVqEB2YpaYYsJktuqyWFV9h1Z
         TqPmOwzZPssn1z8v6KqpaA6vzZEj64kK+FNY3PRbs4hV/eGiokfiRFrStKMk1qwlgj8J
         f0o8cYHvKbADBCkWL6znr+jl7APHr2Pq3lRM8WtzpbNH58xkmRVzLL8rh1F56xg6W/i7
         pL+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-431bd9cab40si29376075e9.189.2024.10.31.13.05.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XfZcR0Y1sz6L6yZ;
	Fri,  1 Nov 2024 04:00:55 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 1801E140B35;
	Fri,  1 Nov 2024 04:05:48 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.152.207) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 21:05:28 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH V2 0/6] Arch agnostic ACPI changes to support vCPU Hotplug (on Archs like ARM)
Date: Thu, 31 Oct 2024 20:04:56 +0000
Message-ID: <20241031200502.3869-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.152.207]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: 7SwvRg6HRnPi

Change Log
==========

Patch V1 -> V2:
1. Addressed Igor Mammedov's (Redhat) raised issues:
   - Removed `ACPICPUstatus::is_present` State and its handling in the
     ACPI APUs AML code and now all QOM vCPUs are present.
   - Dropped the concept of `acpi_persistent` because now QOM vCPUs
     states and the ACPI vCPU states are consistent.
   - QOM vCPU objects are always present now (accompanying RFC V6)
   - Added .needed() hook to the GED VMSD toconditionally migrate the
     ACPI CPU hotplug state at the source VM.
2. Addressed Zhao Liu's (Intel) reported x86 DSDT Table bios-acpi-test failure 
3. Incorporated Gustavo Romero's comments and added his Tag to [Patches 1,2,4]
4. Addressed Gavin Shan's comment to reduce the inline code comments
   wherever possible.


Brief Recall
============
With the advent of multi-core SoCs, the concept of CPU-level hotplugging
has become less distinct, often functioning as a power on/off event
rather than a full hotplug operation. However, hotplug support at the
die/NUMA/socket level remains meaningful and is architecture-specific.
Virtual CPU hotplug can be supported regardless of architectural support
for physical CPU hotplug, as it serves resource management needs—such as
dynamically scaling VM compute capacity based on demand or SLAs,
optimizing boot times, or reducing memory footprint. Although, its
desing must be scalable and must co-exist with future die/NUMA/socket
level hotplug features.


Motivation for this patch-set
=============================
In architectures that support vCPU hotplug, firmware or the VMM/QEMU
typically reflects vCPU status changes to the OS via the ACPI
`_STA.Present` bit. However, certain CPU architectures prohibit [1]
modifications to CPU presence after kernel boot. This restriction [2][3]
could be due to closely integrated per-CPU components—like interrupt
controllers or other features— that may not support reconfiguration
post-boot and are often in an `always-on` power domain. Consequently,
specifications for these architectures require all CPUs to remain
present i.e.`_STA.Present=True`, once the system is initialized.

To be able to support vCPU Hotplug feature, as a workaround to the above
limitation,  ACPI method `_STA.Enabled` Bit could be used to reflect the
plugged and unplugged states of the QOM vCPUs.

This patch set introduces the following changes:

1. Explicit `ACPICPUstatus::is_enabled` State: Adds an `is_enabled`
   state, initialized during machine setup and updated during CPU
   hotplug and hot-unplug events.
   
2. Support for Migrating ACPI CPU State: Facilitates the migration of
   the ACPI CPU state. (This needs reconsideration as per Igor. Last
   patch can be dropped if this affects the acceptability of other
   patches of this patch-set)

3. Updates the Qtest bios-acpi-test

This patch set is designed to work independently and is meant to ensures
compatibility with existing hotplug support across different
architectures. This patch-set has been tested alongside ARM-specific
vCPU hotplug changes (included in the upcoming RFC V6 [4]), and
hot(un)plug functionalities performed as expected which concerns this
patch-set. Please have a look.

Thank you!


Repository of this patch-set
============================
(*) Latest Architecture Agnostic ACPI changes patch-set:
    https://github.com/salil-mehta/qemu.git   virt-cpuhp-armv8/rfc-v6.arch.agnostic.acpi.v2
    Link: https://github.com/salil-mehta/qemu/commits/virt-cpuhp-armv8/rfc-v6.arch.agnostic.acpi.v2
(*) Works with upcoming ARM architecture specific patch-set RFC V6 [4]


References
==========
[1] Check comment 5 in the bugzilla entry
    Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5
[2] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt CPU Hotplug on
    architectures that don’t Support CPU Hotplug (like ARM64)
    a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf
    b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
[3] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotplug on
    SoC Based Systems (like ARM64)
    Link: https://kvmforum2020.sched.com/event/eE4m
[4] Upcoming RFC V6, Support of Virtual CPU Hotplug for ARMv8 Arch
    Link: https://github.com/salil-mehta/qemu/commits/virt-cpuhp-armv8/rfc-v6-rc4


Salil Mehta (6):
  hw/acpi: Introduce `is_enabled` state in ACPI CPU Hotplug Status
  hw/acpi: Update ACPI CPU Hotplug state during vCPU hot(un)plug
  qtest: allow ACPI DSDT Table changes
  hw/acpi: Update CPUs AML's `is_enabled` state in ACPI _STA method
  tests/qtest/bios-tables-test: Update DSDT golden masters for
    x86/{pc,q35}
  hw/acpi: Update GED with vCPU Hotplug VMSD for migration

 hw/acpi/cpu.c                                 |  22 ++++++++++++++++--
 hw/acpi/generic_event_device.c                |  19 +++++++++++++++
 include/hw/acpi/cpu.h                         |   2 +-
 tests/data/acpi/x86/pc/DSDT                   | Bin 8527 -> 8533 bytes
 tests/data/acpi/x86/pc/DSDT.acpierst          | Bin 8438 -> 8444 bytes
 tests/data/acpi/x86/pc/DSDT.acpihmat          | Bin 9852 -> 9858 bytes
 tests/data/acpi/x86/pc/DSDT.bridge            | Bin 15398 -> 15404 bytes
 tests/data/acpi/x86/pc/DSDT.cphp              | Bin 8991 -> 8997 bytes
 tests/data/acpi/x86/pc/DSDT.dimmpxm           | Bin 10181 -> 10187 bytes
 tests/data/acpi/x86/pc/DSDT.hpbridge          | Bin 8478 -> 8484 bytes
 tests/data/acpi/x86/pc/DSDT.hpbrroot          | Bin 5034 -> 5040 bytes
 tests/data/acpi/x86/pc/DSDT.ipmikcs           | Bin 8599 -> 8605 bytes
 tests/data/acpi/x86/pc/DSDT.memhp             | Bin 9886 -> 9892 bytes
 tests/data/acpi/x86/pc/DSDT.nohpet            | Bin 8385 -> 8391 bytes
 tests/data/acpi/x86/pc/DSDT.numamem           | Bin 8533 -> 8539 bytes
 tests/data/acpi/x86/pc/DSDT.roothp            | Bin 12320 -> 12326 bytes
 tests/data/acpi/x86/q35/DSDT                  | Bin 8355 -> 8361 bytes
 tests/data/acpi/x86/q35/DSDT.acpierst         | Bin 8372 -> 8378 bytes
 tests/data/acpi/x86/q35/DSDT.acpihmat         | Bin 9680 -> 9686 bytes
 .../acpi/x86/q35/DSDT.acpihmat-noinitiator    | Bin 8634 -> 8640 bytes
 tests/data/acpi/x86/q35/DSDT.applesmc         | Bin 8401 -> 8407 bytes
 tests/data/acpi/x86/q35/DSDT.bridge           | Bin 11968 -> 11974 bytes
 tests/data/acpi/x86/q35/DSDT.core-count       | Bin 12913 -> 12919 bytes
 tests/data/acpi/x86/q35/DSDT.core-count2      | Bin 33770 -> 33776 bytes
 tests/data/acpi/x86/q35/DSDT.cphp             | Bin 8819 -> 8825 bytes
 tests/data/acpi/x86/q35/DSDT.cxl              | Bin 13148 -> 13154 bytes
 tests/data/acpi/x86/q35/DSDT.dimmpxm          | Bin 10009 -> 10015 bytes
 tests/data/acpi/x86/q35/DSDT.ipmibt           | Bin 8430 -> 8436 bytes
 tests/data/acpi/x86/q35/DSDT.ipmismbus        | Bin 8443 -> 8449 bytes
 tests/data/acpi/x86/q35/DSDT.ivrs             | Bin 8372 -> 8378 bytes
 tests/data/acpi/x86/q35/DSDT.memhp            | Bin 9714 -> 9720 bytes
 tests/data/acpi/x86/q35/DSDT.mmio64           | Bin 9485 -> 9491 bytes
 tests/data/acpi/x86/q35/DSDT.multi-bridge     | Bin 13208 -> 13214 bytes
 tests/data/acpi/x86/q35/DSDT.noacpihp         | Bin 8235 -> 8241 bytes
 tests/data/acpi/x86/q35/DSDT.nohpet           | Bin 8213 -> 8219 bytes
 tests/data/acpi/x86/q35/DSDT.numamem          | Bin 8361 -> 8367 bytes
 tests/data/acpi/x86/q35/DSDT.pvpanic-isa      | Bin 8456 -> 8462 bytes
 tests/data/acpi/x86/q35/DSDT.thread-count     | Bin 12913 -> 12919 bytes
 tests/data/acpi/x86/q35/DSDT.thread-count2    | Bin 33770 -> 33776 bytes
 tests/data/acpi/x86/q35/DSDT.tis.tpm12        | Bin 8961 -> 8967 bytes
 tests/data/acpi/x86/q35/DSDT.tis.tpm2         | Bin 8987 -> 8993 bytes
 tests/data/acpi/x86/q35/DSDT.type4-count      | Bin 18589 -> 18595 bytes
 tests/data/acpi/x86/q35/DSDT.viot             | Bin 14615 -> 14621 bytes
 tests/data/acpi/x86/q35/DSDT.xapic            | Bin 35718 -> 35724 bytes
 44 files changed, 40 insertions(+), 3 deletions(-)

-- 
2.34.1
