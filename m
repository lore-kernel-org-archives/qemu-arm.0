Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2998491ejb;
        Wed, 25 Oct 2023 13:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJnuaJMw4nA+cWTseHvUqfxYztbUar6CX1b4KKT4yGER918xAQk6+pVDKQIsYOpQ97utdJ
X-Received: by 2002:a05:6214:4109:b0:66d:1215:6e3 with SMTP id kc9-20020a056214410900b0066d121506e3mr16028104qvb.10.1698264466621;
        Wed, 25 Oct 2023 13:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698264466; cv=none;
        d=google.com; s=arc-20160816;
        b=e7O2gCM85C/cBusIJpEX/E/X7Dq3ku2ZSGKIQdqtbtlxthAdQR4af+DxRofu9Tudjy
         Kj+EROnX5aqweFxJuCCHjjm7QUPJihTTVEKpLGF+W/WgE5k3DZI+wU6W34JQdBSXEUXb
         xZAd4qYGnmR8KhDzDK8siDn28s1kIzZOTd47JQrQMKAapzL1ClqTgXHzywCgxjnOGtmr
         I0iUibuifOUuam+ONEOfFHyBFPl2arxYqx6DJro3PQuZ0Y4ob7eE33A+PFYmZl48RwIf
         7HGqtjwH7k+Cq0vwFXq9mY19rWHxJ2nEOumAR6Yg7fBPUzZi2eSWzx1dXfQLst/DJo39
         yc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Dd+lZHbJZ63yLPKpGaxGttWwXd+npdtCriCkwxmelvI=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=Sro91mJ4btropB36HnTgaDjhFqBxvpGDX1oo0vGknAk2dUHM8E9jAHA+9GiGGfmmXu
         IHfWd8nsr3oaNvUun7scjjKhIw1TR+nf7wHXDc1J3ys/Q+aq1E2RDcAuvQTse3m2kTnI
         oy1yG4NEkRPWuw10vwwvnCofqwKTxAkNDzwKZTMaWMXtgR5zo040cQxb/xEp/YJdaZjI
         2078/Wq4CGQJbbNtdpauBg6ByhCuqxE1qy2yOG1+vTudF6cAU7A96WndubpVE1dAgK2J
         TNVt5UmlmC+ZPuu4DSsXKWbH9P0ipS+ue19xmsGEP7IHazE1oWXYmOIMXyCpHC5IyasG
         v1eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=F5Zxu0YD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a0562140b0e00b00658963f9a46si8783418qvj.277.2023.10.25.13.07.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 13:07:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=F5Zxu0YD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvkAG-0007Ch-Py; Wed, 25 Oct 2023 16:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAE-0007CA-Mk
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:07:38 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkA0-0003OX-Np
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 16:07:38 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6b20577ef7bso110159b3a.3
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264443; x=1698869243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dd+lZHbJZ63yLPKpGaxGttWwXd+npdtCriCkwxmelvI=;
 b=F5Zxu0YDNKXwFLL3ijAg5+EyyE7Hf105EyNr2cN/F4GfhsgZJZ3U8D6Z/xEQIPzNK8
 0kUanPt2Kt6d89mJvnf/BJF44FnHS6fJuzXjmVQ5lL7sTqsbXZ4KRQmL6ev35ubVS5ni
 RmsGN7Ag5JX4GS1nhIziZTG1f439mhfdk20NTEnSAUpzAWyCJmuz3pPuslcReJAahRTV
 n2AYnduGxVRtwjSO60vkZkjA0aG5mSrPURDuz8vwM9JFYCwGhZcVFd5SrXwturpKE32y
 73T4tC5jpMb03cRJXHqjy7rWez9sQunTfR7rY3xsuPiiKwetKhJiEej5cgB5EF4MU1LK
 tv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264443; x=1698869243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dd+lZHbJZ63yLPKpGaxGttWwXd+npdtCriCkwxmelvI=;
 b=XjsZLJGLBRI8rXowXtdDC+bKZZOLTwbCFr++IJG7cn6T+7TNr5D8NWxmVLFpAMDSXC
 Hhwz6O3IgNGz9VJYAzhpLcEJQSW7sMid1CYmn4zD50NFTVG6rdBGVOz/CdrFqFfZDe/z
 N5SMhtWKSkzJPfGmPfdiOcy5HKm6GSKEDyem9GEqRqMwvQNG8+kFLNrQGONghtBpDqHj
 27Y/SxxfUo7kE9Fk8HNibVMXpN6Vs/Miwjkqc1NbbCIvra23rPRSRZdU33ZRH2NuYIZz
 rIIC1yZg2Em0ke4ouTqkJ01+zlNcsTppnPq3bcMdaqLcTc2HkA0yWoWgyF7rLJf4iO5U
 H2QA==
X-Gm-Message-State: AOJu0YzKf98SXqis1v97kKkVYDsR9wm6NKUfaF4zlHkiIqh8Qbl78FWQ
 5RlchgNMh4ZU2ZryQT7RJkbINDaOuckWMM6vJjuM+g==
X-Received: by 2002:a05:6a00:1a09:b0:691:21:d9b9 with SMTP id
 g9-20020a056a001a0900b006910021d9b9mr13243389pfv.30.1698264442517; 
 Wed, 25 Oct 2023 13:07:22 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:07:21 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v4 00/13] RISC-V: ACPI: Enable AIA, PLIC and update RHCT
Date: Thu, 26 Oct 2023 01:37:00 +0530
Message-Id: <20231025200713.580814-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yjw8JeqmGp7C

This series primarily enables external interrupt controllers (AIA and PLIC)
in ACPI tables for RISC-V virt platform. It also updates RHCT with CMO and
MMU related information.

Below ECRs for these changes are approved by ASWG and will be
available in next ACPI spec release.

1) MADT (AIA) - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing
2) RHCT - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view?usp=sharing

First two patches in this series are to migrate a couple of functions from
ARM architecture to common code so that RISC-V doesn't need to duplicate
the same.

The patch set is based on Alistair's riscv-to-apply.next branch.

These changes are also available in  riscv_acpi_b2_v4 branch at:
https://github.com/vlsunil/qemu/

Changes since v3:
	1) Addressed comments from Daniel and Drew.
	2) Added a new patch in microvm to use common function for virtio in DSDT.
	3) Rebased to latest riscv-to-apply.next branch and added tags.

Changes since v2:
        1) Rebased to latest riscv-to-apply.next branch which needed
           changing ext_icboz to ext_zicboz in CMO patch.
        2) Fixed node type in MMU node.
        3) Added latest tags.

Changes since v1:
        1) As per Igor's suggestion, migrated fw_cfg and virtio creation
           functions to device specific file instead of generic aml-build.c.
           Since ACPI is optional, new files are created and enabled for
           build only when CONFIG_ACPI is enabled.
        2) As per Igor's suggestion, properties are added to the GPEX PCI
           host to indicate MMIO ranges. The platform fw can initialize
           these to appropriate values and the DSDT generator can fetch
           the information from the host bus itself. This makes the code
           generic instead of machine specific.
        3) Added PLIC patch from Haibo.
        4) Rebased to latest riscv-to-apply.next and added RB tags as
           appropriate.

Sunil V L (13):
  hw/arm/virt-acpi-build.c: Migrate fw_cfg creation to common location
  hw/arm/virt-acpi-build.c: Migrate virtio creation to common location
  hw/i386/acpi-microvm.c: Use common function to add virtio in DSDT
  hw/riscv: virt: Make few IMSIC macros and functions public
  hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
  hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
  hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
  hw/riscv/virt-acpi-build.c: Add CMO information in RHCT
  hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
  hw/pci-host/gpex: Define properties for MMIO ranges
  hw/riscv/virt: Update GPEX MMIO related properties
  hw/riscv/virt-acpi-build.c: Add IO controllers and devices
  hw/riscv/virt-acpi-build.c: Add PLIC in MADT

 hw/arm/virt-acpi-build.c        |  51 +----
 hw/i386/acpi-microvm.c          |  15 +-
 hw/nvram/fw_cfg-acpi.c          |  44 ++++
 hw/nvram/meson.build            |   1 +
 hw/pci-host/gpex-acpi.c         |  13 ++
 hw/pci-host/gpex.c              |  12 ++
 hw/riscv/Kconfig                |   1 +
 hw/riscv/virt-acpi-build.c      | 344 +++++++++++++++++++++++++++++---
 hw/riscv/virt.c                 |  72 +++----
 hw/virtio/meson.build           |   1 +
 hw/virtio/virtio-acpi.c         |  32 +++
 include/hw/nvram/fw_cfg_acpi.h  |  15 ++
 include/hw/pci-host/gpex.h      |  28 ++-
 include/hw/riscv/virt.h         |  26 +++
 include/hw/virtio/virtio-acpi.h |  17 ++
 15 files changed, 541 insertions(+), 131 deletions(-)
 create mode 100644 hw/nvram/fw_cfg-acpi.c
 create mode 100644 hw/virtio/virtio-acpi.c
 create mode 100644 include/hw/nvram/fw_cfg_acpi.h
 create mode 100644 include/hw/virtio/virtio-acpi.h

-- 
2.39.2

