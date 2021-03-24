Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp366162lfg;
        Wed, 24 Mar 2021 06:17:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylo0NfFv8F4aKFer7sUQkTioPTOkFT2HUvFBcodCLwqY0ZgKq9ID98Hcyu8Xu3f5G82hkh
X-Received: by 2002:a92:8752:: with SMTP id d18mr2457999ilm.283.1616591872822;
        Wed, 24 Mar 2021 06:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616591872; cv=none;
        d=google.com; s=arc-20160816;
        b=o7VD803BwxW9A833OKXo2KmsNvLoEcp4GYzw24PbrvrBLbQRoAjBZwuNyXd7UYpzp9
         shace96btEvGcaKTelA/ij/07/xe0OVcOGOwwTy5hY/8li1t7VVWCvguvAogyCIzA7hZ
         ZQB+z7CgoSSH56F/G1LsBH2ycQGhCzs1ZpryU36Kn3okJtGLHAuVx1FMuYBgQR2ZoAdd
         athxlRTo/gwoL9ctGUdxdKsCSxSWFOVfJW4lxqtZrkuNEzVIs0O6E+qItCHUD6HUt4kr
         wnYTesESubeHHL/Osg2wQ5Kfx9DZzoL5tQbrE5JNu8FMag7UV2SX6n7ic6+pzzskNu7F
         TezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=spmq4E4B1hTNvlcxVhpQCvvwwhN0nXbG9HuiLELrtfQ=;
        b=iAxioe3bLFqBHhy0W6Q2yPwtJ1prSW+jHIl5MpuZUxKbLO8umlEhrP0Zpzgs7Zgpgm
         mvOplW7j63O3dli9yplQwYDvJLbsRVwDzCAPPtTBCJuIRR/gKiC1UCus0nAR/TrHTsfe
         md1VuwQJE/k8V8hcSrHpzIyksT1W7uEWs1Zw8yoTAuN4ATXdfV/9PtF3MGJBgTk9V7xr
         Nk0JDaaMqCg05ddWtPZeSSY7R8tIP3tXgjck9GwkRZhgmXz/7gmHmZRPtW6Oh94Rum+F
         jR5xqWfYhbn+4SwutIziuUwmucS62XEj/mXt+ZzX6clO/6IuKQKj7OA4G3ZBe8e8L7eW
         3lzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si1747270jad.47.2021.03.24.06.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 06:17:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:35106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lP3OS-0006Yf-1t
	for alex.bennee@linaro.org; Wed, 24 Mar 2021 09:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3Nm-0006Wc-Nz; Wed, 24 Mar 2021 09:17:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3Nk-0005UU-24; Wed, 24 Mar 2021 09:17:10 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F57x94lBZznVm3;
 Wed, 24 Mar 2021 21:14:21 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 21:16:46 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>
Subject: [PATCH RFC v2 0/6] Introduce IOMMU Option For PCI Root Bus
Date: Wed, 24 Mar 2021 13:16:29 +0000
Message-ID: <1616591795-2056-1-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangxingang5@huawei.com; helo=szxga04-in.huawei.com
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 ehabkost@redhat.com, mst@redhat.com, richard.henderson@linaro.org,
 shannon.zhaosl@gmail.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zPtds/DrWJQK

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

