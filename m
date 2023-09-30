Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1519ejb;
        Fri, 29 Sep 2023 17:20:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC2/Zu6wSYDRgx1F7SvIXK14ofGKcMARFy/ER5AH47S+4sHpzOFwxNGtSFlwji5BIZMdBz
X-Received: by 2002:a05:600c:2991:b0:405:3f19:fc49 with SMTP id r17-20020a05600c299100b004053f19fc49mr5646650wmd.34.1696033208817;
        Fri, 29 Sep 2023 17:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696033208; cv=none;
        d=google.com; s=arc-20160816;
        b=dS9l3JDhPQccvWxEiFFmG1EPSvxJDZc14j/Fn5lMQZgx+VkGfEdisqwTVUppGV0vt3
         zo/7qEAvIYgNDfejv+F9KHNcZSpol37epnYUjNa6iqo+i9oteNw6a2oZEQ5QZZ+AAH6z
         Nrx4QK7E7mIBIxp0ALHd02AluOP7apUrGrhkGdJ+KmaTWjq85lO3RNQGoP+td3uIFYpq
         QTTU39nJbvlNx5Inok/12XNSd3xJL7RWCMcFoQtAok/sa68GeWBT4K4FlPP9C7+evFdL
         AmUTuuDpg6Cu5MEPtgp+qyEMOHEogqYMF2PGArn4U2QzMd4IxVnCs0EAwETh0PpkUYed
         foeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from;
        bh=EpEjwAG3meO8nOBCX5r6cjHpQnQDKbdqqwSfGR6xQqY=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=j9vl1YVnFzYwJ+Yyh5ee2BTsdbc/MIRXEt5wcC+j6f1/y3v2HyZ8OiOES2fzgbqvtE
         UhW5/HXEIxIuAea4/IgzagB/Qa7ZPP9KqtjRKL3vPiW0rDFb0nQpJXh7TMkNNRv2WJTD
         d96DoNR7pCaWUPGbLaRcd/hXVIHrXxBkXgQqwlyradOfphQfWEo3io2StpvQZ+6zgoG6
         hKUyFN/7vRNH6oQ4EpQk7B719vHdYXL3NqfeYFaJWrNlijn9/9wO4woUw+bH8AGdsvpC
         3EleiD1LY8zIGGcFPwKFBadRtshUYyClrVSE5hYaCUjxN7w3dmDkrOAQJI7OeoWdvJGW
         5NcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id c12-20020a05600c0acc00b004063c6c812asi1331932wmr.91.2023.09.29.17.20.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 17:20:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ry79Y6Wjyz6K5mP;
	Sat, 30 Sep 2023 08:18:41 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.35.96) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 30 Sep 2023 01:19:46 +0100
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
Subject: [PATCH V2 00/10] Add architecture agnostic code to support vCPU Hotplug
Date: Sat, 30 Sep 2023 01:19:23 +0100
Message-ID: <20230930001933.2660-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.35.96]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: Q1htHNdw7Fu8

Virtual CPU hotplug support is being added across various architectures [1][3].
This series adds various code bits common across all architectures:

1. vCPU creation and Parking code refactor [Patch 1]
2. Update ACPI GED framework to support vCPU Hotplug [Patch 4,6,7]
3. ACPI CPUs AML code change [Patch 5]
3. Helper functions to support unrealization of CPU objects [Patch 8,9]
4. Misc [Patch 2,3,10]


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
  hw/acpi: Update GED _EVT method AML with cpu scan
  hw/acpi: Update ACPI GED framework to support vCPU Hotplug
  physmem: Add helper function to destroy CPU AddressSpace
  gdbstub: Add helper function to unregister GDB register space

 accel/kvm/kvm-all.c                    | 63 +++++++++++++++++++-------
 gdbstub/gdbstub.c                      | 14 ++++++
 hw/acpi/acpi-cpu-hotplug-stub.c        |  6 +++
 hw/acpi/cpu.c                          | 25 ++++++----
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
 15 files changed, 179 insertions(+), 28 deletions(-)

-- 
2.34.1
