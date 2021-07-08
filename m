Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp299315lfg;
        Thu, 8 Jul 2021 05:58:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMPuTH2ySjEBerOnSFQP9oGvPWvxvLUUMqo5mWD+l88rdQbjE8CS8BUn05aZ7Aw9ioiiVa
X-Received: by 2002:a1f:7d0d:: with SMTP id y13mr22072457vkc.13.1625749133510;
        Thu, 08 Jul 2021 05:58:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625749133; cv=none;
        d=google.com; s=arc-20160816;
        b=q9MQlM9Osl64hhXlrCKtDhVt8men18aIEJP03lXZ3A2fuF9DIvu2i02a7d0f8Sg39+
         XQ4Z1tOCiPUdAYfBIpdVmlok8TzUxmYSTMJwUnorhTdtRj9eomr4wyKJvfuSbXjn/kMM
         viLne80n6fE6G0rJ+Sht/+4UD02s5kA0vRHmeQ6W5VEMj/oJ0jS7g0e4NZE7iJrAmgq1
         a5JrYKDINVy1w5hERxtkY2nz7WBI5GZM/usjThJQNh5yMSRWJcu90dK/46KWadTpqhpW
         LL2q5djDbuN9KgLU/83yYblB+JmM1NG7/n1vs++/axG3/lauZHHIOoI89q8cS9s2pqP4
         OZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=rVAp3P9vcmPesylo5vEB95u601rNXBBh50lylo11nwY=;
        b=KVCpERR3SgZmbOts3J1AIcuxcIpOrudBbEEd4hW5ATqm4FFHDF0bXizeF9/7TzMCEU
         0tEIXBGygGmjqyifNr+6abdFEsYh76Wn4gyKiwM38QyMYeLSlgIAiyTmGQ8sl/hYqQ4T
         VW6HfbT/VGt1CoZfdwORI7hfuU3b6pF5yEBz50AunCacz9nC3tqJ/Xay+tPT5cJaQD3k
         xEXQv1v4cDZO6cWG17SMKFbhmq5HATvLqHPta+Gs0fcaL/AXlKqV6iD+FAXgqMEvZtws
         Rg6ScwcQB55OObuz0QIDa2B8SKrIzUQ3lFEv8pa0yLVYNBRfIcQVFeLpzcp/y3UMXFIl
         utVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t205si2659678vke.46.2021.07.08.05.58.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 05:58:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1TcC-0002V8-Nm
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 08:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZL-0004Ny-7y; Thu, 08 Jul 2021 08:55:55 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZF-0005eJ-7x; Thu, 08 Jul 2021 08:55:54 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GLGQt0SBHzcb9W;
 Thu,  8 Jul 2021 20:52:22 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 20:55:27 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 8 Jul 2021
 20:55:26 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v5 0/9] IOMMU: Add support for IOMMU Bypass Feature
Date: Thu, 8 Jul 2021 12:55:10 +0000
Message-ID: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangxingang5@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VObQsHy60uAH

From: Xingang Wang <wangxingang5@huawei.com>

Traditionally, there is a global switch to enable/disable vIOMMU. All
devices in the system can only support go through vIOMMU or not, which
is not flexible. We introduce this bypass iommu property to support
coexist of devices go through vIOMMU and devices not. This is useful to
passthrough devices with no-iommu mode and devices go through vIOMMU in
the same virtual machine.

PCI host bridges have a bypass_iommu property. This property is used to
determine whether the devices attached on the PCI host bridge will bypass
virtual iommu. The bypass_iommu property is valid only when there is a
virtual iommu in the system, it is implemented to allow some devices to
bypass vIOMMU. When bypass_iommu property is not set for a host bridge,
the attached devices will go through vIOMMU by default.

The bypass iommu feature support PXB host bridge and default main host
bridge, we add a bypass_iommu property for PXB and default_bus_bypass_iommu
for machine. Note that default_bus_bypass_iommu is available only when
the 'q35' machine type on x86 architecture and the 'virt' machine type
on AArch64. Other machine types do not support bypass iommu for default
root bus.

Here is how to use bypass iommu feature:
 (1) PCI expander bridge
     qemu -device pxb-pcie,bus_nr=0x10,addr=0x1,bypass_iommu=true
 (2) Arm default host bridge
     qemu -machine virt,iommu=smmuv3,default_bus_bypass_iommu=true
 (3) X86 default root bus bypass iommu:
     qemu -machine q35,default_bus_bypass_iommu=true

History:

v4 -> v5:
- Suggested by Igor, add docs/bypass-iommu.txt to describe bypass iommu
  feature in more detail, including motivation, usage and limitations.
- Add some small fixes, simplify the logic when building IORT idmap as
  suggested by Eric.
- https://lore.kernel.org/qemu-devel/1621914605-14724-1-git-send-email-wangxingang5@huawei.com/

v3 -> v4:
- simplify the logic in building the IORT idmap

v2 -> v3:
- rebase on top of v6.0.0-rc4
- Took into account Eric's comments, replace with a bypass_iommu
  proerty 
- When building the IORT idmap, cover the whole RID space

v1 -> v2:
- rebase on top of v6.0.0-rc0
- Fix some issues
- Took into account Eric's comments, and remove the PCI_BUS_IOMMU flag,
  replace it with a property in PCIHostState.
- Add support for x86 iommu option

Xingang Wang (9):
  hw/pci/pci_host: Allow PCI host to bypass iommu
  hw/pxb: Add a bypass iommu property
  hw/arm/virt: Add default_bus_bypass_iommu machine option
  hw/i386: Add a default_bus_bypass_iommu pc machine option
  hw/pci: Add pci_bus_range() to get PCI bus number range
  hw/arm/virt-acpi-build: Add IORT support to bypass SMMUv3
  hw/i386/acpi-build: Add DMAR support to bypass iommu
  hw/i386/acpi-build: Add IVRS support to bypass iommu
  docs: Add documentation for iommu bypass

 docs/bypass-iommu.txt               |  89 ++++++++++++++++++++++
 hw/arm/virt-acpi-build.c            | 114 +++++++++++++++++++++++++---
 hw/arm/virt.c                       |  26 +++++++
 hw/i386/acpi-build.c                |  70 ++++++++++++++++-
 hw/i386/pc.c                        |  20 +++++
 hw/pci-bridge/pci_expander_bridge.c |   3 +
 hw/pci-host/q35.c                   |   2 +
 hw/pci/pci.c                        |  34 ++++++++-
 hw/pci/pci_host.c                   |   1 +
 include/hw/arm/virt.h               |   1 +
 include/hw/i386/pc.h                |   1 +
 include/hw/pci/pci.h                |   2 +
 include/hw/pci/pci_host.h           |   1 +
 13 files changed, 349 insertions(+), 15 deletions(-)
 create mode 100644 docs/bypass-iommu.txt

-- 
2.19.1

