Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1896710ejb;
        Mon, 9 Oct 2023 04:29:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWxKeH8kBjxOuiO+AxBtHFQf/oSW7hGv6pPCGtxarcSReoONg3enyZLsWU+39gsfA2mKBV
X-Received: by 2002:a17:90b:fd1:b0:274:922d:4b35 with SMTP id gd17-20020a17090b0fd100b00274922d4b35mr12104490pjb.1.1696850971544;
        Mon, 09 Oct 2023 04:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696850971; cv=none;
        d=google.com; s=arc-20160816;
        b=sZNQs/7VmfRjicDJBEZXJGHdPjhKX0Zg9aOZdg1cv9gicLiWk2cv1hnCnkDJ4lVxrt
         ujfzcMNDUZljzt/FG51eEOLH9OT4+L9yXrn0fAhdlQcNDd2z0aLvoL8TKf9RrBy18HBC
         8hYBRpF/QqL5MsmhejAV3CGEGFJICg1CN6GEEDK2jGTzoyHVUzQWzU8u+N38kpl0u5/2
         2rhziy0Pwmbz5IrgGkRO9IWpkAJIcqSgQH4K8TPlDBtOwLaTph+A+rP+zH665G1GoifL
         vKsSNSIDd/a6DknAjoqv47FXJDyh/kVBVNPa4HeSfu0xqw13GHaUvLFtO7XLqHRJ+Jqk
         GDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=Kter8MuZQk8xQaVI+z3bqRfKq4M4PJJ+KvvFK7Dq9nk=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=OuWWunb5oKYv/2NswAvOOI1pdm2BwGhmX255SWjuozzV2Hd22M9E7BRi5D9DMWYyVL
         XfFeZPpcwqjXhBpBL7THkD96nKvHl8HN7NxyaAkI1zfaMDS1ZSma/gHwa4iDBqfRsr8E
         vqIbC3f+GciLTiC/FnFmT/8Ywk1GJITC8wUf1qHUzqsj8O8xK0Pi+BeqpLSB8C2OsNhq
         RNvz/vRJXzfQHD1lMYyvmhW/6VoArJs0ljHgsX7BjDq57OJNi+IPu0CE5wCAMj8oKtSG
         ol2r/NERmx0SlAZ9XJeCZIGO7SftskxgFF6lDxNiZDdwXjCLaW+Pr/9VirOMzh/vX+bA
         lEgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id pj1-20020a17090b4f4100b0027761a3a4b0si10053144pjb.0.2023.10.09.04.29.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S3xYx4F2sz6HJkP;
	Mon,  9 Oct 2023 19:26:29 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.154.91) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 12:29:09 +0100
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
Subject: [PATCH V3 00/10] Add architecture agnostic code to support vCPU Hotplug
Date: Mon, 9 Oct 2023 12:28:02 +0100
Message-ID: <20231009112812.10612-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.154.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: qaFVqclDZgkA

Virtual CPU hotplug support is being added across various architectures[1][3].
This series adds various code bits common across all architectures:

1. vCPU creation and Parking code refactor [Patch 1]
2. Update ACPI GED framework to support vCPU Hotplug [Patch 4,6,7]
3. ACPI CPUs AML code change [Patch 5]
4. Helper functions to support unrealization of CPU objects [Patch 8,9]
5. Misc [Patch 2,3,10]


Repository:

[*] https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v2.common.v3


Revision History:

RFC V2 -> RFC V3
1. Addressed Jonathan Cameron's comments
   - Fixed 'vcpu-id' type wrongly changed from 'unsigned long' to 'integer'
   - Removed unnecessary use of variable 'vcpu_id' in kvm_park_vcpu
   - Updated [Patch V2 03/10] commit-log with details of ACPI_CPU_SCAN_METHOD macro
   - Updated [Patch V2 05/10] commit-log with conditional event handler method details
   - Added Reviewed-by tags for patches {2,3,4,6,7}
2. Addressed Gavin Shan's comments
   - Remove unnecessary use of variable 'vcpu_id' in kvm_par_vcpu
   - Fixed return value in kvm_get_vcpu from -1 to -ENOENT
   - Reset the value of 'gdb_num_g_regs' in gdb_unregister_coprocessor_all
   - Fixed the kvm_{create,park}_vcpu prototypes docs
   - Added Reviewed-by tags for patches {2,3,4,5,6,7,9,10}
3. Addressed one earlier missed comment by Alex Bennée in RFC V1
   - Added traces instead of DPRINTF in the newly added and some existing functions

RFC V1 -> RFC V2
1. Addressed Alex Bennée's comments
   - Refactored the kvm_create_vcpu logic to get rid of goto
   - Added the docs for kvm_{create,park}_vcpu prototypes
   - Splitted the gdbstub and AddressSpace destruction change into separate patches
   - Added Reviewed-by tags for patches {2,10}

References:

[1] https://lore.kernel.org/qemu-devel/20230926100436.28284-1-salil.mehta@huawei.com/
[2] https://lore.kernel.org/all/20230913163823.7880-1-james.morse@arm.com/
[3] https://lore.kernel.org/qemu-devel/cover.1695697701.git.lixianglai@loongson.cn/


Jean-Philippe Brucker (1):
  target/arm/kvm: Write CPU state back to KVM on reset

Salil Mehta (9):
  accel/kvm: Extract common KVM vCPU {creation,parking} code
  hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
  hw/acpi: Add ACPI CPU hotplug init stub
  hw/acpi: Init GED framework with cpu hotplug events
  hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
  hw/acpi: Update GED _EVT method AML with CPU scan
  hw/acpi: Update ACPI GED framework to support vCPU Hotplug
  physmem: Add helper function to destroy CPU AddressSpace
  gdbstub: Add helper function to unregister GDB register space

 accel/kvm/kvm-all.c                    | 64 ++++++++++++++++++++------
 accel/kvm/trace-events                 |  4 ++
 gdbstub/gdbstub.c                      | 15 ++++++
 hw/acpi/acpi-cpu-hotplug-stub.c        |  6 +++
 hw/acpi/cpu.c                          | 27 +++++++----
 hw/acpi/generic_event_device.c         | 22 +++++++++
 hw/i386/acpi-build.c                   |  2 +-
 include/exec/cpu-common.h              |  8 ++++
 include/exec/gdbstub.h                 |  5 ++
 include/hw/acpi/cpu.h                  |  5 +-
 include/hw/acpi/cpu_hotplug.h          |  4 ++
 include/hw/acpi/generic_event_device.h |  5 ++
 include/hw/core/cpu.h                  |  1 +
 include/sysemu/kvm.h                   | 14 ++++++
 softmmu/physmem.c                      | 25 ++++++++++
 target/arm/kvm.c                       |  8 +++-
 16 files changed, 187 insertions(+), 28 deletions(-)

-- 
2.34.1
