Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1415142ejc;
        Fri, 13 Oct 2023 03:52:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHshxSQ1nzSCX4cOalFbJuCDSq3C4MYGlayFtizyfIssBRFSKoVlsni06IthHM/40fOUf0b
X-Received: by 2002:a05:6a21:33a1:b0:169:3769:2739 with SMTP id yy33-20020a056a2133a100b0016937692739mr26017043pzb.14.1697194334905;
        Fri, 13 Oct 2023 03:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697194334; cv=none;
        d=google.com; s=arc-20160816;
        b=iC1VanJ9BGkzC1wVuccMyBw5ouohZ1LiG6AGcZpX+v72XvsqOUUVsgr7kK0Gkt/Zb2
         0LalXeLyulfFrgrphE3dA618CDng4nCgUUe/E2GGauh/PBkh9qAVeM++1EOkuHRV/7DW
         7PzJxofe30AK1CVa+l+1JvYtAMJKwKtcZaebT82yrIRWPjiDoJHtspf9GSg4xPm8n+uG
         LWUycLFXy7phqy9w6ksWM5cHhmZ+Sp5rXAHzH8sL+Bot/vMrKh1MgXWZcbPrXWFs0UzE
         ciFWAgraaQ8Ta/x8Z4+Yi1HsYEP3N9an1S2xqKXBeDbF/cN3wlocoYEXmhxYBgjYLk4F
         jzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=uRAuFswWtIhylQPejTu3R+z47mUNLyoIjmAVYdl9BgQ=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=jGUYzVxXhSgRs/71re7XGFcIXXWAVRsgh6oo1xlehByGDWfDAmUFGAXnS6ZnfIYN66
         fTgVK/xGxSwGykZI6InNlugi+mP8yKnpceJuLTM4DhRrSSpIV1sy3+Q6IEwRzoWsN/Xv
         skENIUO/fJnYy0oncfyjv+ROilpJ2U5dfr2OlRMU83Gr26zE1doXGQLEDHMPPtxzBry7
         0cIeJArBzBaVIcQUZb1UOiFrkrLTIElWMW/5AbtzPcPRV9p3sV9JrkeVDOwefH5IUYfE
         xVpy3xcTY5LyAEVTaE6Aymzcz0yic0uYhCADqWEIB14+RtcJB0/oOofuvdP67WC6ubyU
         5o5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id lk15-20020a17090b33cf00b0027d0adde858si4759953pjb.48.2023.10.13.03.52.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2023 03:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S6Nc10vsGz6K8sn;
	Fri, 13 Oct 2023 18:51:45 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.247.32) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 13 Oct 2023 11:51:52 +0100
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
Subject: [PATCH V6 0/9] Add architecture agnostic code to support vCPU Hotplug
Date: Fri, 13 Oct 2023 11:51:20 +0100
Message-ID: <20231013105129.25648-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.195.247.32]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: YEM8XY2vjrB/

Virtual CPU hotplug support is being added across various architectures[1][3].
This series adds various code bits common across all architectures:

1. vCPU creation and Parking code refactor [Patch 1]
2. Update ACPI GED framework to support vCPU Hotplug [Patch 4,6,7]
3. ACPI CPUs AML code change [Patch 5]
4. Helper functions to support unrealization of CPU objects [Patch 8,9]
5. Misc [Patch 2,3]


Repository:

[*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v2.common.v6


Revision History:

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


Salil Mehta (9):
  accel/kvm: Extract common KVM vCPU {creation,parking} code
  hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
  hw/acpi: Add ACPI CPU hotplug init stub
  hw/acpi: Init GED framework with CPU hotplug events
  hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
  hw/acpi: Update GED _EVT method AML with CPU scan
  hw/acpi: Update ACPI GED framework to support vCPU Hotplug
  physmem: Add helper function to destroy CPU AddressSpace
  gdbstub: Add helper function to unregister GDB register space

 accel/kvm/kvm-all.c                    | 64 ++++++++++++++++++++------
 accel/kvm/trace-events                 |  4 ++
 gdbstub/gdbstub.c                      | 12 +++++
 hw/acpi/acpi-cpu-hotplug-stub.c        |  6 +++
 hw/acpi/cpu.c                          | 27 +++++++----
 hw/acpi/generic_event_device.c         | 22 +++++++++
 hw/i386/acpi-build.c                   |  3 +-
 include/exec/cpu-common.h              |  8 ++++
 include/exec/gdbstub.h                 |  5 ++
 include/hw/acpi/cpu.h                  |  5 +-
 include/hw/acpi/cpu_hotplug.h          |  4 ++
 include/hw/acpi/generic_event_device.h |  5 ++
 include/hw/core/cpu.h                  |  1 +
 include/sysemu/kvm.h                   | 16 +++++++
 system/physmem.c                       | 29 ++++++++++++
 15 files changed, 184 insertions(+), 27 deletions(-)

-- 
2.34.1
