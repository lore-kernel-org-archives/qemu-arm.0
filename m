Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp513812ejb;
        Thu, 19 Oct 2023 06:27:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDrc4HaEObV81Q4uijuYZIKZ8SKGP/xuGGlfNeh4L2+xdyVepbwwG9648UvfpZxUr2fJt5
X-Received: by 2002:ad4:5ba9:0:b0:66d:544d:8e68 with SMTP id 9-20020ad45ba9000000b0066d544d8e68mr2710902qvq.3.1697722077209;
        Thu, 19 Oct 2023 06:27:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697722077; cv=none;
        d=google.com; s=arc-20160816;
        b=yJKi+P9LD0qjm6i/a0bs/sFzX7hxBD3A+ldUHN5uTFNJVa6VzaM1D7/FOVybECo6Pd
         kL8qRvdojK004sb85wBB7052oIjtbIqmMQP3ABSFy7k1HQ3omUKzdL8QdhpEmu2fQNhT
         U3QKfjbvD5iCN0MNanQnkruBAAB8urk27GX23bQRZt8CCl2zoDU3vmGCt5FMAzwNNDxa
         49AnlIlqY4fKhl7tXSLc+sY7thpEn+dVxZxr/DhZ9KTbgW8Br24/ALpsBq0rvvhZ4r4r
         dSRsFLN0ux8wSG7Olc/m/8dBoDPhOy5mFP8yIV/Tl7ieDFAv8Ww40hoY0/zg8w5IrJKV
         MswA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7kNBu2eX1X8AHgLmoRKI6DQsuRe/7tTX2acgsC1oaaY=;
        fh=qS7HOACB/fnzOG4UkP/DQwrsj+RVK26yEZmW8KA6D/k=;
        b=XZ9tkKpRjoj+5dbLOlRIykDLLZNHV1ydcXY0cH09jikc1J9pvvwcFo2MNuAeitW3G2
         4OhsW1geCY0phtKHQgQtCIHN9GoVZF8LEytKZWNjwKrFlv7+DHuJ5uAj2HcX0aXaqwKn
         GygnESVUEWy6InEnS56RYDwtCn+fqJhjOSTyy+Wp63jp/S01o68tmo+h+/AnXwZcDa6k
         ZNtanppPTu1bWY6nKFJ7B0/RaI/Gg+4evAbc1U8G0/lammInoiQGlbZ4FKPZaBLb6uWA
         MEM0XV3bWMImFe6oX1u8++bNITetFUTXgDtN6bSNWz5ZrzLDRbRwKP/UYb5ISH75bYlN
         D/zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Fhc5TNDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lx13-20020a0562145f0d00b0066ceeacae81si1581241qvb.536.2023.10.19.06.27.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:27:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Fhc5TNDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtT3i-0003d5-BZ; Thu, 19 Oct 2023 09:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT3c-0003aL-Vt
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:27:25 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qtT3a-0006Xk-5c
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:27:24 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1e12f41e496so4900587fac.3
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697722039; x=1698326839; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7kNBu2eX1X8AHgLmoRKI6DQsuRe/7tTX2acgsC1oaaY=;
 b=Fhc5TNDD5fnrf3eLVM+yRnrkXS3XFzV92/itNZ96h9zRvvGl4DBQD6XoUIeDDMCcG3
 Pgxyl0kY5PuppQI8BPx7P+sXiinalNNF9VkdR0Uy5aHNySzOo+zfvY7S2VtDGMk3Jktz
 2MwxAExgv9oBNg4eI6xsO3BK3tcY8NTONd+phk5QRczU01qOmZox3wA29d2U0GoxQXzz
 r956/FeDyYJpcIFd9PghJIQl7tp/4w7c4rCNBoesq7A9WKxJO0ITe9CtJoyCTuxP/MeK
 5aQlDXCe5+JnI2jueHf2iCjk6PohV8WpqY71TLNtzzXK5WLxm7c9Yj/6OQWjKvD44B4n
 5euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697722039; x=1698326839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7kNBu2eX1X8AHgLmoRKI6DQsuRe/7tTX2acgsC1oaaY=;
 b=QBuEIIzwQzQ90gqzUY8aKPa7NiT5a8++IA3VqjMxvgAvxeBBMdKBFqX2/MHASJUNP3
 6qBkL4LOVAm77DZ5N175q57FoJRHGO6CCVfjOfY+Qk//4l2NW84RLTiMfGNycN0VxQ2v
 rskMPucPnYHl5Fxt9SNY4VHyMUR/gyDY8CUkqrfXCLyak4aXMMg97teHNgpL8HVT31u+
 QHGzqCoM3HRLfT+68sKv7Sb2IrN2xwiGu+ER6TFQpQCSTl6m9a6RV89HHedoIqhlal+w
 0BklQpyMMIjWA6evZC3iXNcVpdesoF7gjtcBzMjiD1+kZJnqqtD2eFKnObuUkcrYSeUu
 BAOw==
X-Gm-Message-State: AOJu0YzZbbQ+hSscosldv7fzT6VDbTZmw9EgwFQKdHXxDNHncdoxlHGo
 7VV2ZJVhAyzRBiYfEFOpVxLGog==
X-Received: by 2002:a05:6870:c14f:b0:1ea:2506:3e90 with SMTP id
 g15-20020a056870c14f00b001ea25063e90mr2093805oad.35.1697722039440; 
 Thu, 19 Oct 2023 06:27:19 -0700 (PDT)
Received: from sunil-laptop.dc1.ventanamicro.com
 ([2409:4071:6e8b:3a98:dd76:4e82:7da6:44ab])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a056a00228b00b0068feb378b89sm5273113pfe.171.2023.10.19.06.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 06:27:18 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v3 00/12] RISC-V: ACPI: Enable AIA, PLIC and update RHCT
Date: Thu, 19 Oct 2023 18:56:36 +0530
Message-Id: <20231019132648.23703-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: R6CA/XzI/hXg

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

These changes are also available in  riscv_acpi_b2_v3 branch at:
https://github.com/vlsunil/qemu/

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

Sunil V L (12):
  hw/arm/virt-acpi-build.c: Migrate fw_cfg creation to common location
  hw/arm/virt-acpi-build.c: Migrate virtio creation to common location
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

 hw/arm/virt-acpi-build.c        |  48 +----
 hw/nvram/fw_cfg-acpi.c          |  17 ++
 hw/nvram/meson.build            |   1 +
 hw/pci-host/gpex-acpi.c         |  13 ++
 hw/pci-host/gpex.c              |  12 ++
 hw/riscv/Kconfig                |   1 +
 hw/riscv/virt-acpi-build.c      | 342 +++++++++++++++++++++++++++++---
 hw/riscv/virt.c                 |  72 +++----
 hw/virtio/meson.build           |   1 +
 hw/virtio/virtio-acpi.c         |  28 +++
 include/hw/nvram/fw_cfg_acpi.h  |   9 +
 include/hw/pci-host/gpex.h      |  28 ++-
 include/hw/riscv/virt.h         |  26 +++
 include/hw/virtio/virtio-acpi.h |  11 +
 14 files changed, 492 insertions(+), 117 deletions(-)
 create mode 100644 hw/nvram/fw_cfg-acpi.c
 create mode 100644 hw/virtio/virtio-acpi.c
 create mode 100644 include/hw/nvram/fw_cfg_acpi.h
 create mode 100644 include/hw/virtio/virtio-acpi.h

-- 
2.34.1

