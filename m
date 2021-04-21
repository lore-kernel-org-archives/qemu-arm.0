Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp217534lfb;
        Wed, 21 Apr 2021 01:07:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwus16W0UUMRgP+PtMNBpBWg1pbT+smxCRwc/T48xq8ddDXHEOGJ/RepKcBnjC5oBh+9HJv
X-Received: by 2002:a67:71c7:: with SMTP id m190mr10559074vsc.28.1618992420882;
        Wed, 21 Apr 2021 01:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618992420; cv=none;
        d=google.com; s=arc-20160816;
        b=qCQwtOWdhXKEyIxmCFZGrJohJRd7t9YDpsz6v6U2LDBqgwEtSrcDRAIpqiSUVFzm5O
         N86FlLIm3nuphuEC2HUFxMYjnOke6wyPyPsBFyhT4G4tIpEpZRJYeRe8EFd3YNuni101
         saRrKTKlgDv5e9ldYnKdC08f8nmk2t2BNhRb5SU0YdOPNXNsDbJiOPumrQHSVAFtcYnG
         d9PKxmJ98eC+hhqWN531oEtm1sRld4fnXcNK5rvgmpfFenc2fGLkBzbkuJMF3d+Dlk1d
         iYSAPcXT3bbUhr/wddN024e/PS1+KITl+moQ0OJdCSy/+inAEPYKhtFoOSGj3fOtIUKL
         /KKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=bVAQBUF4PCRT37KZXJFRLHZf4kIb6U3fKO9/Z3werPU=;
        b=KD4rP1ivacKf9r2EwnwTYLlqbu0J49Dv3/ip+31G1KCBJZfnUSf+mfNXREFoQOiLpO
         1xmW13XIOtvnNUrG1eOntn2w1NdqCVprC8sWTWsE3kw8NeSN1ZafOpS/hFbtGR2iziGU
         HeUWG5TebjRAkRUvXAyT4YCkmlyEjHQc7NWaNO0dxCnx81nk+gHK37M0GHTNS/GFeges
         pIBwr9Pp3AAsXWUYMvwJ91fWvKADJ893uw3rSy2KXrBBIlEzq9BFyU1FD66dKw8JXVkt
         hS6ExiWkykSsF0K1T78V3R5jv7HakGZHQ1Mbpfz3dPTw8648oFHPUE6RnTAywFBqTnDo
         YS1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r22si553721vsg.108.2021.04.21.01.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 01:07:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZ7sy-0002Ey-5f
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 04:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rZ-00017m-53; Wed, 21 Apr 2021 04:05:33 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rW-0001xv-JN; Wed, 21 Apr 2021 04:05:32 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FQChB39JhzPshm;
 Wed, 21 Apr 2021 16:02:18 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 21 Apr 2021
 16:05:12 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC v3 0/8] Introduce Bypass IOMMU Feature
Date: Wed, 21 Apr 2021 08:04:55 +0000
Message-ID: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
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
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sJ7pcjjH5sy4

From: Xingang Wang <wangxingang5@huawei.com>

These patches add support for configure bypass_iommu on/off for
pci root bus, including primary bus and pxb root bus. At present,
All root bus will go through iommu when iommu is configured,
which is not flexible, because in many situations the need for using
iommu and bypass iommu aften exists at the same time.

So this add option to enable/disable bypass_iommu for primary bus
and pxb root bus. The bypass_iommu property is set to false default,
meaning that devcies will go through iommu if no explicit configuration
is added. When bypass_iommu is enabled for the root bus, devices
attached to it will bypass iommu, otherwise devices will go through
iommu.

This feature can be used in this manner:
arm: -machine virt,iommu=smmuv3,bypass_iommu=true
x86: -machine q35,bypass_iommu=true
pxb: -device pxb-pcie,bus_nr=0x10,id=pci.10,bus=pcie.0,bypass_iommu=true 

History:

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

Xingang Wang (8):
  hw/pci/pci_host: Allow bypass iommu for pci host
  hw/pxb: Add a bypass iommu property
  hw/arm/virt: Add a machine option to bypass iommu for primary bus
  hw/i386: Add a pc machine option to bypass iommu for primary bus
  hw/pci: Add pci_bus_range to get bus number range
  hw/arm/virt-acpi-build: Add explicit IORT idmap for smmuv3 node
  hw/i386/acpi-build: Add explicit scope in DMAR table
  hw/i386/acpi-build: Add bypass_iommu check when building IVRS table

 hw/arm/virt-acpi-build.c            | 128 +++++++++++++++++++++++-----
 hw/arm/virt.c                       |  26 ++++++
 hw/i386/acpi-build.c                |  70 ++++++++++++++-
 hw/i386/pc.c                        |  18 ++++
 hw/pci-bridge/pci_expander_bridge.c |   3 +
 hw/pci-host/q35.c                   |   1 +
 hw/pci/pci.c                        |  33 ++++++-
 hw/pci/pci_host.c                   |   2 +
 include/hw/arm/virt.h               |   1 +
 include/hw/i386/pc.h                |   1 +
 include/hw/pci/pci.h                |   2 +
 include/hw/pci/pci_host.h           |   1 +
 12 files changed, 263 insertions(+), 23 deletions(-)

-- 
2.19.1

