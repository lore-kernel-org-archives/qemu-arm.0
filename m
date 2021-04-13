Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4646311lfr;
        Tue, 13 Apr 2021 01:09:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9ldWtTEIs0A3cjX61BuHPHZOTtRm0IwoyC4TS67DYyyHhXche1d//bMMzLe+TnuYgzuhh
X-Received: by 2002:a05:620a:440a:: with SMTP id v10mr30191814qkp.357.1618301384557;
        Tue, 13 Apr 2021 01:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618301384; cv=none;
        d=google.com; s=arc-20160816;
        b=jBpxD4KSYkkS1GnGMgrcFoNGp9Ldp5Zy6oJ55ChPzD78Pwg81n6AYmJz4JVT5WV+eT
         3AsZYBYAUDPqfHC9PdtMk/Sr+geWmz0OiZb8eYSgNW46QsTsLRJezZBg+Rvz41obkkBu
         RZCdolMVuYwu8Vg9pk/oDwmPQHAPfvizrVYG00tfmV+37tgXQJ2MmWVZQrz0FuX7kTvu
         XRbXJK5QwHR4WPMQJwBCC5gzrR43cRaJ7RXpXndFoINXKIwuHS6yptN9D1kXU7QEwbQt
         95ZcrjAXvGPo/o8ikAECrGjVDXQ63xQVHb/QDqM4xwGmDGALsLTah4kYSpsMgCl3optJ
         bulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=TH8GFDtUT52mr0ni0zraTWWihv14l86LSP/0SmLY3Zs=;
        b=ic3/COqgfIqAcxDippXbjiF18vYTSo6SYQ1cl9bHnEtMEj0i48mN7KW827HvaosspE
         2mPEg238tvl1JjaKCnwX7ELuLlzxozISjyGXBxO3gjuShlbyTrSjd95y7ifcZh1v4PEf
         cWSYofSeVGv+j0nXIRZiwIBvTT10dBv+ovZwA8PgDGWzxn04EiTGhJcnsfDglwjorLZF
         Vux7HK7PG85bFxbcIP/BypOIZIq+PCXP4mfT8QS+PzHPFmnauh68HS0MciYGCvYKiB4D
         WiPrsIQaYVmFZopB6sVsymHxi44XS8Jw5Lsz+ZBg68yRYqO9+TzdPIgYHmVnU9d6Btw8
         afIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si1279170qkj.61.2021.04.13.01.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 01:09:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:36380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWE7D-0005y9-Sa
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 04:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWE5l-00047l-QJ; Tue, 13 Apr 2021 04:08:13 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWE5h-0006Qf-Eh; Tue, 13 Apr 2021 04:08:13 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FKJ8H2BXBzlXcD;
 Tue, 13 Apr 2021 16:06:07 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 16:07:48 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v2 0/6] hw/arm/virt: Introduce cpu topology support
Date: Tue, 13 Apr 2021 16:07:39 +0800
Message-ID: <20210413080745.33004-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangyanan55@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f4V0mxA/gkat

Hi,

This series is a new version of [0] recently posted by Ying Fang
to introduce cpu topology support for ARM platform. I have taken
over his work about this now, thanks for his contribution.

Description:
An accurate cpu topology may help improve the cpu scheduler's decision
making when dealing with multi-core system. So cpu topology description
is helpful to provide guest with the right view. Dario Faggioli's talk
in [1] also shows the virtual topology could have impact on scheduling
performace. Thus this patch series introduces cpu topology support for
ARM platform.

This series originally comes from Andrew Jones's patches [2], but with
some re-arrangement. Thanks for Andrew's contribution. In this series,
both fdt and ACPI PPTT table are introduced to present cpu topology to
the guest. And a new function virt_smp_parse() not like the default
smp_parse() is introduced, which prefers cores over sockets.

[0] https://patchwork.kernel.org/project/qemu-devel/cover/20210225085627.2263-1-fangying1@huawei.com/
[1] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines-friend-or-foe-dario-faggioli-suse
[2] https://github.com/rhdrjones/qemu/commit/ecfc1565f22187d2c715a99bbcd35cf3a7e428fa

Test results:
After applying this patch series, launch a guest with virt-6.0 and cpu
topology configured with: -smp 96,sockets=2,clusters=6,cores=4,threads=2,
VM's cpu topology description shows as below.

Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              96
On-line CPU(s) list: 0-95
Thread(s) per core:  2
Core(s) per socket:  24
Socket(s):           2
NUMA node(s):        1
Vendor ID:           0x48
Model:               0
Stepping:            0x1
BogoMIPS:            200.00
NUMA node0 CPU(s):   0-95

---

Changelogs:
v1->v2:
- Address Andrew Jones's comments
- Address Michael S. Tsirkin's comments
- Pick up one more patch(patch#6) of Andrew Jones
- Rebased on v6.0.0-rc2 release

---

Andrew Jones (3):
  device_tree: Add qemu_fdt_add_path
  hw/arm/virt: DT: Add cpu-map
  hw/arm/virt: Replace smp_parse with one that prefers cores

Yanan Wang (2):
  hw/acpi/aml-build: Add processor hierarchy node structure
  hw/arm/virt-acpi-build: Add PPTT table

Ying Fang (1):
  hw/arm/virt-acpi-build: Distinguish possible and present cpus

 hw/acpi/aml-build.c          |  27 ++++++++
 hw/arm/virt-acpi-build.c     |  77 ++++++++++++++++++++--
 hw/arm/virt.c                | 120 ++++++++++++++++++++++++++++++++++-
 include/hw/acpi/aml-build.h  |   4 ++
 include/hw/arm/virt.h        |   1 +
 include/sysemu/device_tree.h |   1 +
 softmmu/device_tree.c        |  45 ++++++++++++-
 7 files changed, 268 insertions(+), 7 deletions(-)

-- 
2.19.1

