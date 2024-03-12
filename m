Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1552856ejc;
        Mon, 11 Mar 2024 19:00:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOxAUVBnekSE3MhphGKlW7l9W7qDDPPajhOsN/Y/weSZuNmbjqXHtV0ojKLasX6JAvWtKiB5BnNe0o09YMiadq1Sz/g+C6
X-Google-Smtp-Source: AGHT+IGV3P2ORgp5ZCMFNOM9KFK+sCFzdcCtJgzhOe8G4E+8GROOF/XuADd1w8Frmi8W2yCL1uT8
X-Received: by 2002:a05:600c:474b:b0:413:216d:b23d with SMTP id w11-20020a05600c474b00b00413216db23dmr6216177wmo.9.1710208842225;
        Mon, 11 Mar 2024 19:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710208842; cv=none;
        d=google.com; s=arc-20160816;
        b=sQnt2axSuZlESDSr5nC8miqVTXJskTbaJ/YJgcW2yTynxqDgJlmC0eHEgleYklAC+e
         Pn9u/dBMmvOe4YPKkSxKq1exMSZX04kt4We8GrBxu4YmzrNGgF6kRke8PDkDBwn4h9Cl
         q2BMAiDhqrFPcZLXRp433BKRJctHFSOAHCiuzH6S25dfbJLJAkDxy0c1RKglB85jfHZe
         hod+A4lKOFVMo5hiWItD6GJP0nCbYtgJ3eCOhz4CoMyFI4d/KvqDzb3VJnSDXOaszs2r
         FWnw7KZo5ncvjOD0k037rda/3WOlS/Zjr+22ab7x+px6W0BYhwN5QUFYdM3YaCMWS6o6
         W89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=BMlR3nPf8XamxGrBxAjYuXRPIW/3W/HmHQ8ZsFAyhd8=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=uC3UEGO45XydVnNeD4atAEW9+9jg9R25ndW/RnEpyGMdFPqRmn6WZndaMzsQxT8+qx
         1r2QY2AYmJk1fgNw/BC1/oz1LjqB2voaFHansZ8G6+Ra4sLbGX6wlAR7t5RbatMRu/NB
         9wY4rTIzid6FMwaWGNhP6/F9rZgEdAThAUQ+rkWLsmbJNXuSlg4vwaWoHPmmNgXsPPwv
         84qcS6E/CQp6MFEKSF53afZj8bzQ9ElWFI7uWDemi/4/+j95U46yHzDTHRpGN9QEZreb
         ViDOpZ2B0UfQ3+0j9oA5FBmFdR/S4DkBeU6EMnBonlKmY6jeVVSgRJMy4QqjJ/uR2sTS
         rDSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id v22-20020a05600c429600b00412a12324f0si3617333wmc.229.2024.03.11.19.00.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2024 19:00:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TtxZr0hYHz6K9Q2;
	Tue, 12 Mar 2024 09:56:36 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id DBFC1140CB9;
	Tue, 12 Mar 2024 10:00:40 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.148.5) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 02:00:23 +0000
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
	<linuxarm@huawei.com>
Subject: [PATCH V8 0/8] Add architecture agnostic code to support vCPU Hotplug
Date: Tue, 12 Mar 2024 01:59:52 +0000
Message-ID: <20240312020000.12992-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.148.5]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: SYn9NeiOTzPa

Virtual CPU hotplug support is being added across various architectures[1][3].
This series adds various code bits common across all architectures:

1. vCPU creation and Parking code refactor [Patch 1]
2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
3. ACPI CPUs AML code change [Patch 4,5]
4. Helper functions to support unrealization of CPU objects [Patch 6,7]
5. Docs [Patch 8]


Repository:

[*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v2.common.v8


Revision History:

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

 accel/kvm/kvm-all.c                    | 64 ++++++++++++++++++++------
 accel/kvm/trace-events                 |  5 +-
 docs/specs/acpi_hw_reduced_hotplug.rst |  3 +-
 gdbstub/gdbstub.c                      | 12 +++++
 hw/acpi/acpi-cpu-hotplug-stub.c        |  6 +++
 hw/acpi/cpu.c                          | 27 +++++++----
 hw/acpi/generic_event_device.c         | 21 +++++++++
 hw/i386/acpi-build.c                   |  3 +-
 include/exec/cpu-common.h              |  8 ++++
 include/exec/gdbstub.h                 |  6 +++
 include/hw/acpi/cpu.h                  |  5 +-
 include/hw/acpi/cpu_hotplug.h          |  4 ++
 include/hw/acpi/generic_event_device.h |  4 ++
 include/hw/core/cpu.h                  |  1 +
 include/sysemu/kvm.h                   | 16 +++++++
 system/physmem.c                       | 29 ++++++++++++
 16 files changed, 185 insertions(+), 29 deletions(-)

-- 
2.34.1
