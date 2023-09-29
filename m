Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3220914ejc;
        Fri, 29 Sep 2023 05:44:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqcz6Ci8/xGMWOvPG4Ltm6b1tVw+6/mh3Tr4jRDQoERkSWomAvxVF72npzTHUarZIkCE52
X-Received: by 2002:a5d:6d50:0:b0:323:36a3:8ca with SMTP id k16-20020a5d6d50000000b0032336a308camr3610210wri.28.1695991475884;
        Fri, 29 Sep 2023 05:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695991475; cv=none;
        d=google.com; s=arc-20160816;
        b=Ei3mC0vawm29tu0MmdLqMfOBc1juy4is5QCbML1KLft9iKIbfkUM/2uZzA4cBWs4cr
         eRzGF6CQUA55VMBKlYVwDDk1bYK+kThoBdFpBIFRjmWmcH4GhBdrrdx4l84iH5XnOR9a
         e+8HNrD1WKHOopkqSH46lVyEgoYOhlA4hTLwVD5Xam5543IZSpJDoqh9b8k0XJWl4aky
         nhx5nrwUCDBhvzSHRR63Q8L8+VOPhgLQLSV73FTCGFfYzpU7cj6BiPqaSlsMTD5ah54n
         1wFRfqmlUFBX8W9JlbcybcdAftaJbkP5sEJZ3RoS7Uy2VprV6WCMalgQhJgmGRgDHigg
         yRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from;
        bh=OpE1k0LNeBMzJMmwjreGZ92d1za1z1XQdx1qRACO2KQ=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=A4HTvLpXH1cyZMhqjTF/3kF0UEr62y+cB9BcQBYhq7JBBPhwsQLWXMiKzJ0q7YsGau
         TXyAk7MsL95Og6KDESkPb//SQPgiCeM3pBuT0vIJChJW+uX1/Sv/8yIsJO3JkHJY+54d
         R1fopjZ1stoXH/s8vmW+pJG8JSgKF+c1t++r9hAwChWg7DL5z01QXzqFB6fkB2omW5x7
         N+SGlgzkkgWAboCw+wEcRFKtppDDBzP0jusjpi0auZeSEd5S5+TUIr7Ydw85JwmEIlpG
         VYtypLupyiupmgsEDMqasVHkDQmUIogXZEVKLVvkGH9vzxTtHCFAlx3qQfayKE/TFLtp
         K7nA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id g7-20020a5d6987000000b003258e27ffc9si647761wru.394.2023.09.29.05.44.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:44:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rxql271x9z688jJ;
	Fri, 29 Sep 2023 20:43:10 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.156.153) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 29 Sep 2023 13:44:15 +0100
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
Subject: [PATCH 0/9] Add architecture agnostic code to support vCPU Hotplug
Date: Fri, 29 Sep 2023 13:42:55 +0100
Message-ID: <20230929124304.13672-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.156.153]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: Ov8KnGWO6OVb

Virtual CPU hotplug support is being added across various architectures [1][3].
This series adds various code bits common across all archtiectures:

1. vCPU creation and Parking code refactor [Patch 1]
2. Update ACPI GED framework to support vCPU Hotplug [Patch 4,6,7]
3. ACPI CPUs AML code change [Patch 5]
3. Helper functions to support unrealization of CPU objects [Patch 8]
4. Misc [Patch 2,3,9]


References:
[1] https://lore.kernel.org/qemu-devel/20230926100436.28284-2-salil.mehta@huawei.com/
[2] https://lore.kernel.org/all/20230913163823.7880-1-james.morse@arm.com/
[3] https://lore.kernel.org/qemu-devel/cover.1695697701.git.lixianglai@loongson.cn/

Jean-Philippe Brucker (1):
  target/arm/kvm: Write CPU state back to KVM on reset

Salil Mehta (8):
  accel/kvm: Extract common KVM vCPU {creation,parking} code
  hw/acpi: Move CPU ctrl-dev MMIO region len macro to common header file
  hw/acpi: Add ACPI CPU hotplug init stub
  hw/acpi: Init GED framework with cpu hotplug events
  hw/acpi: Update CPUs AML with cpu-(ctrl)dev change
  hw/acpi: Update GED _EVT method AML with cpu scan
  hw/acpi: Update ACPI GED framework to support vCPU Hotplug
  physmem,gdbstub: Add helper functions to help *unrealize* vCPU object

 accel/kvm/kvm-all.c                    | 61 ++++++++++++++++++++------
 gdbstub/gdbstub.c                      | 13 ++++++
 hw/acpi/acpi-cpu-hotplug-stub.c        |  6 +++
 hw/acpi/cpu.c                          | 25 +++++++----
 hw/acpi/generic_event_device.c         | 22 ++++++++++
 hw/i386/acpi-build.c                   |  2 +-
 include/exec/cpu-common.h              |  8 ++++
 include/exec/gdbstub.h                 |  1 +
 include/hw/acpi/cpu.h                  |  5 ++-
 include/hw/acpi/cpu_hotplug.h          |  4 ++
 include/hw/acpi/generic_event_device.h |  5 +++
 include/hw/core/cpu.h                  |  1 +
 include/sysemu/kvm.h                   |  2 +
 softmmu/physmem.c                      | 25 +++++++++++
 target/arm/kvm.c                       |  8 +++-
 15 files changed, 162 insertions(+), 26 deletions(-)

-- 
2.34.1
