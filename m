Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp148158lfg;
        Thu, 25 Mar 2021 00:23:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPsX/HbBs3xPPPshob+OnIC38p+/l6uZrWa689ZfSBJYXmEwtrSu0XRGtfsQdBWdTjmQO3
X-Received: by 2002:a25:d0c7:: with SMTP id h190mr5252536ybg.428.1616657011842;
        Thu, 25 Mar 2021 00:23:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616657011; cv=none;
        d=google.com; s=arc-20160816;
        b=IbpiJ6n/HTaWbXMOdlpV4wfyPxThSaB4ThbGYYAc2McxBDhVU/84BjX969zm+J22bu
         37xD3ykC3QSXDq6BoQh6DSTrb5SIP7T05RIYJ1CJW0d1L1spEB3bm69rMmBL12rJEyxf
         lfp43oAoEHzkJWzMR0eX1b7pEH4NLisvSJH1Qt8jhFyWLqJIpKVoMvYYm5Kn9AzTS4DB
         jTLBK4cHvL2+WKSBPvB7/+ES5bKweQHg8c8JLxQpySTG9nUUD0bKbZwGZuRJ/G9CQXH/
         /umzesFYxEjzrSh2eUjBbfpDCg8M89XurVGge/Rv4LbKEptcUa7qVYlGj17YS+VGT733
         OtLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=kgOqHxGHJjUf8KacQy1/j4paMMYs6uPFjo1xB9GI3Kg=;
        b=KT2empjAtt4ZWZIBoyL/kqY3CfREjpCmXFBkkhXD336sm0/lgFtR2KsABlGUCMGLF0
         5E2peoreifoS1bKKstDQPo8wkxLQJciWnXaKUnNn0f2cDCeDtYCR9ObB+48OUJzSVUoF
         e2KWZyycd4aWbN5UKFrHAERPBBo2kw9ghXk/DtNpCKX58UiQKpT7w+FPb2s052TVdrCY
         OAhj4dUgXemH4UptVOvdr7eSFv6RxcbHZ7zu8nMlRgB5ujILOVZccBzJHTp1jn2xZE8g
         t7peZ4+Swpz69q13ODQzt8OKzwn+2qjM68Peas21r0Edn7EbCQPIm4hdtiuxufX/k5rv
         KUKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i127si3728498yba.371.2021.03.25.00.23.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 00:23:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:50568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPKL5-0004OJ-3X
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 03:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lPKKu-0004NU-Eq; Thu, 25 Mar 2021 03:23:20 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lPKKs-0002zM-5b; Thu, 25 Mar 2021 03:23:20 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F5c3F16x1zrZjK;
 Thu, 25 Mar 2021 15:21:13 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Mar 2021
 15:23:05 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC RESEND v2 0/6] Introduce IOMMU Option For PCI Root Bus
Date: Thu, 25 Mar 2021 07:22:39 +0000
Message-ID: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y/h83yjkUXX4

From: Xingang Wang <wangxingang5@huawei.com>

These patches add support for configure iommu on/off for pci root bus,
including primary bus and pxb root bus. At present, All root bus
will go through iommu when iommu is configured, which is not flexible.

So this add option to enable/disable iommu for primary bus and pxb
root bus.  When iommu is enabled for the root bus, devices attached to it
will go through iommu. When iommu is disabled for the root bus, devices
will not go through iommu accordingly.

The option example for iommu configuration is like the following:

primary root bus option:
arm: -machine virt iommu=smmuv3,primary_bus_iommu=false(or true)
x86: -machine q35,primary_bus_iommu=false(or true)

pxb root bus:
 -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,addr=0x3.0x1,iommu=false 

History:

v1 -> v2:
- rebase on top of v6.0.0-rc0
- Fix some issues
- Took into account Eric's comments, and remove the PCI_BUS_IOMMU flag,
  replace it with a property in PCIHostState.
- Add support for x86 iommu option

Xingang Wang (6):
  hw/pci/pci_host: Add iommu property for pci host
  hw/pci: Add iommu option for pci root bus
  hw/pci: Add pci_root_bus_max_bus
  hw/arm/virt-acpi-build: Add explicit idmap info in IORT table
  hw/i386/acpi-build: Add explicit scope in DMAR table
  hw/i386/acpi-build: Add iommu filter in IVRS table

 hw/arm/virt-acpi-build.c            | 103 ++++++++++++++++++++++------
 hw/arm/virt.c                       |  25 +++++++
 hw/i386/acpi-build.c                |  70 ++++++++++++++++++-
 hw/i386/pc.c                        |  19 +++++
 hw/pci-bridge/pci_expander_bridge.c |   3 +
 hw/pci-host/q35.c                   |   1 +
 hw/pci/pci.c                        |  52 +++++++++++++-
 hw/pci/pci_host.c                   |   2 +
 include/hw/arm/virt.h               |   1 +
 include/hw/i386/pc.h                |   1 +
 include/hw/pci/pci.h                |   2 +
 include/hw/pci/pci_host.h           |   1 +
 12 files changed, 254 insertions(+), 26 deletions(-)

-- 
2.19.1

