Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1949371lfg;
        Sat, 27 Feb 2021 00:34:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJum4NVEIeg2BtbN/3mgJu8+0/0ig+g2wRoOmuHARcqpLXP29siOrjvsQ1QooHUpK+u6v4
X-Received: by 2002:a25:1104:: with SMTP id 4mr9730517ybr.164.1614414880016;
        Sat, 27 Feb 2021 00:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614414880; cv=none;
        d=google.com; s=arc-20160816;
        b=VuAik0glg/LVTntZIa1d2qL/8m7B7WsCqGjoHu1KlEAKrjzn0CzsCiaYvHt/3Xbpq9
         UsutAwxWD0veqKTWOcmSWH2yQeympFVNJPly9bnncXhLNQ7JF1nz4TwkcoFLDe7wB/GM
         p8Hwkl+ebkA6d3TVx0O5OXFoDJIspv9b/N/tIcu+ysq1i5QX0f8+QLomc6cA1YIB+pzr
         zSO/hE1rpsar5QbElWwQ+y4r/bop7226KJqNFuIN5S1lmzqXhhoeX9riLlvcHJBpuBRB
         pvc5CKzKv9XeyD5eCD14moedIyr/6om0O8jbn9sFJnVi8HlVy0uY7DoaBt9sBYjIo3qz
         xB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=gkiK5ILReK2pWgrSSdEyUB9AIvEVkFahiLSLXJCsh6M=;
        b=s2mtZbYIV1S/biQZ1CthxMekbjhR1IfI7Hyl/ziT1RL8GCm2j20f2sps3mfmBao7Gs
         W+AiRjGfdZphEyN/TpxUepcCLue4eIciLAHtzuC+ZM+FP6jA+2bKEX0R6fRYXQQ0gQlR
         TimfagASYuX7ifQsLBNT+/P1ppxcczkDaX7uMpcEozaaI6ljICqenZtDgI4ip7SqFus2
         9d4pH7VLwBanX8C7W+hLi0JNxbaRjsKJxa4mK7QyURA3/yqF+DrB3PeRXy8y9GcjoIR0
         0F9DCZqmmWlCiKhi+biaYX639Ov3WH00MhIULZWWfuuu2hiA5eSmCTd4DPvHStuFSESM
         H+YA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h37si11072191ybj.201.2021.02.27.00.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Feb 2021 00:34:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFv3f-0004Z9-Bz
	for alex.bennee@linaro.org; Sat, 27 Feb 2021 03:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3O-0004VP-Gi; Sat, 27 Feb 2021 03:34:22 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFv3J-0007vv-DR; Sat, 27 Feb 2021 03:34:22 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DnfsT48FRzjSGJ;
 Sat, 27 Feb 2021 16:32:29 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Sat, 27 Feb 2021
 16:33:57 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC RESEND PATCH 0/4] hw/arm/virt-acpi-build: Introduce iommu option
 for pci root bus
Date: Sat, 27 Feb 2021 08:33:47 +0000
Message-ID: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 wangxingang5@huawei.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5MKW1LF63NDs

From: Xingang Wang <wangxingang5@huawei.com>

These patches add support for configure iommu on/off for pci root bus,
including primary bus and pxb root bus. At present, All root bus will go
through iommu when iommu is configured, which is not flexible.

So this add option to enable/disable iommu for primary bus and pxb root bus.
When iommu is enabled for the root bus, devices attached to it will go
through iommu. When iommu is disabled for the root bus, devices will not
go through iommu accordingly.

Xingang Wang (4):
  pci: Add PCI_BUS_IOMMU property
  hw/pci: Add iommu option for pci root bus
  hw/pci: Add pci_root_bus_max_bus
  hw/arm/virt-acpi-build: Add explicit idmap info in IORT table

 hw/arm/virt-acpi-build.c            | 92 +++++++++++++++++++++--------
 hw/arm/virt.c                       | 29 +++++++++
 hw/pci-bridge/pci_expander_bridge.c |  6 ++
 hw/pci/pci.c                        | 35 ++++++++++-
 include/hw/arm/virt.h               |  1 +
 include/hw/pci/pci.h                |  1 +
 include/hw/pci/pci_bus.h            | 13 ++++
 7 files changed, 153 insertions(+), 24 deletions(-)

-- 
2.19.1

