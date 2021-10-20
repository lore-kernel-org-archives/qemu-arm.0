Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1640141lfc;
        Wed, 20 Oct 2021 07:23:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaOJOBl8h2wi0vPDTeYqPTW2hpjhqioslDttc2tG4QJrMg6I8ZJBFkr86P0Sh6fH1KvFGB
X-Received: by 2002:a05:6830:30ba:: with SMTP id g26mr168770ots.32.1634739800202;
        Wed, 20 Oct 2021 07:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634739800; cv=none;
        d=google.com; s=arc-20160816;
        b=GGRVYydyzpSG1+fNcA01H88ZbaP7uXFEBxt9GhvvB3+2GqYbUP22grrIOiNfUiF3od
         /xLp/Oy4T/NJMQBvrZv9aUtt8w7x0OLvLHYezH5xz4FWvPMzk3XBdRgYZuq+ONQK93zd
         08vy/uSjdkth6FJxShJXx4+5tOiiGi9iE0fbd4j7mcmvQhMb/uXjvhIUk/ep6+fkN5EY
         3LlMVeZRkp+kF80ULdhRh6NiQpL4FBO6c1siLPUNbA/oTQNJjmNLwczefLhxovUSER08
         DR4///1orVfdYxO1LiVWIOtXLTlU6h9kffh5RcbFwpdIi/mMf+1w2Ck6HS3NgkrSYBUJ
         nwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=y8Uis4cZw8rgDBDoOK496Qt87Yi/FAvtcw/SusHCGRY=;
        b=Xa08osvmOeX9lGa0wS3Ms0URQ2iRtASvmuzhbSNzyTgkRj67bi2yUaT4eldbKTyMf8
         lIlODyndOutxmx3/9MTB8d+sEmgFfbLDmsk9cHb+wAqlqXW+zPSbSUKGSVpdYJSdWTIV
         WC4n5EtbXEfBOd5ZbN2GiXNT9mobDcKaD1Zkinbp5fDDvDJgcKoA/N7g2cumtO7UTE+Z
         VxkHcp+b8YSi3qsBM9mySF5Uo7nIhJ6OnGHQYTnw4HjRdqMetQQB+KFGjfyVwhTKM5Zx
         UfyT4gBPmVTp2QWCo/8kmm+yf6pxbKEWdfzcBSlYoOsrqm6kyq4INmGBLvOq/pWFxIZ6
         UfQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w65si2409056oib.291.2021.10.20.07.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 07:23:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:44290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdCUw-0001KM-8c
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 10:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdCTK-0006t4-9v; Wed, 20 Oct 2021 10:21:39 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdCTG-0002A3-UE; Wed, 20 Oct 2021 10:21:37 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HZCMz6rF2z90ML;
 Wed, 20 Oct 2021 22:16:31 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 22:21:27 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 22:21:27 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Eric Auger <eauger@redhat.com>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v9 0/8] hw/arm/virt: Introduce cpu topology support
Date: Wed, 20 Oct 2021 22:21:17 +0800
Message-ID: <20211020142125.7516-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YFBM1LYRKBmh

Hi,

This is the latest v9 series which supports exposing vCPU topology
to the guest for Arm virt machines.

Description of this series:
Once the view of an accurate virtual cpu topology is provided to guest,
with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
e.g., the scheduling performance improvement. See Dario Faggioli's
research and the related performance tests in [1] for reference.

This patch series introduces cpu topology support for Arm platform.
Both cpu-map in DT and ACPI PPTT table are introduced to store the
topology information. And we only describe the topology information
to 6.2 and newer virt machines, considering compatibility.

[1] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
-friend-or-foe-dario-faggioli-suse

Changelog:
v8->v9:
- add Eric's R-bs, thanks!
- address Eric's suggestions to update some function comments and commit msg (patch #5)
- make build_processor_hierarchy_node static as it's only used by build_pptt (patch #4)
- retested.
- v8: https://lore.kernel.org/qemu-devel/20211014132206.19220-1-wangyanan55@huawei.com/

v7->v8:
- rebased on top of master (commit e5b2333f24)
- only add one generic expected file for PPTT instead of four, which works
  fine enough for now (patch #6 and #8 updated)
- v7: https://lore.kernel.org/qemu-devel/20211007030746.10420-1-wangyanan55@huawei.com/

v6->v7:
- rebased on top of master (commit ca61fa4b80)
- use newly introduced acpi_table_begin/acpi_table_end APIs to build PPTT
  (patch #5 updated)
- add reference files for PPTT to fix broken bios-table-test for Aarch64
  virt machine (patch #6-#8 added)
- v6: https://lore.kernel.org/qemu-devel/20210824122016.144364-1-wangyanan55@huawei.com/

Andrew Jones (2):
  hw/arm/virt: Add cpu-map to device tree
  hw/acpi/aml-build: Add PPTT table

Yanan Wang (6):
  hw/arm/virt: Only describe cpu topology since virt-6.2
  device_tree: Add qemu_fdt_add_path
  hw/acpi/aml-build: Add Processor hierarchy node structure
  tests/data/acpi/virt: Add an empty expected file for PPTT
  hw/arm/virt-acpi-build: Generate PPTT table
  tests/data/acpi/virt: Update the empty expected file for PPTT

 hw/acpi/aml-build.c          |  89 +++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c     |   8 +++-
 hw/arm/virt.c                |  71 ++++++++++++++++++++++++----
 include/hw/acpi/aml-build.h  |   3 ++
 include/hw/arm/virt.h        |   4 +-
 include/sysemu/device_tree.h |   1 +
 softmmu/device_tree.c        |  44 ++++++++++++++++-
 tests/data/acpi/virt/PPTT    | Bin 0 -> 76 bytes
 8 files changed, 206 insertions(+), 14 deletions(-)
 create mode 100644 tests/data/acpi/virt/PPTT

--
2.19.1

