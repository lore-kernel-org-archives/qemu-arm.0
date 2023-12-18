Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp852116eji;
        Mon, 18 Dec 2023 07:03:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6ZJbJglPo0Kz9B+92+DxsQC2hNwxBhyt9fyFoK3U1jm3rmQciFSLLwQ10yp41LNAYAE+r
X-Received: by 2002:a05:6830:615:b0:6d9:f334:f886 with SMTP id w21-20020a056830061500b006d9f334f886mr15088125oti.18.1702911810951;
        Mon, 18 Dec 2023 07:03:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911810; cv=none;
        d=google.com; s=arc-20160816;
        b=BITHbEy8LgvFR9poE80wNhxPgoUl5Kxq0exF2uHGHJeufM/LrlcYHQbQ6+hEs7Yo5U
         Z7wqn3JBARSLxJNdotRidHq50BVTQzGvLTk7VCq3rya/q9uUJ6WAcu0Y64+SfzAMoPhI
         Ww7snSb98GB30QxOM173WmKn0xg/dBVYshlB9fndgjenk9JzAlSbPWED9pQGM8di2k96
         cINlcGf7Afm3KLr95LpB1X8Sdg4NLdcOEE6d5m7za1q69ZVXbQVhUCDutwATg4J4KzK5
         MNBpWFBydi9RWFuXk21vfZmF/8F32p/eTC5YAWnO0Ykau7WXhvZq3ST+5RqKO2TePKB0
         LRdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=IS1D2FDYimeVTg+BnkZ8lK6JJAp7oUKJVZsCLLH9PCk=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=MvXTjuRqnosR1+qfNlHjoQHyyPoDYTWyz6oSfUiBd93xzqsEw8xLhPIZ1vmbKTh9EH
         npieHbeph9BgvGeBFKerep/RYr0ylv6pdGRKt7j7cVRV1ItfsJJoNOx/4b9meSDjLz8I
         ogLbuMqztYWrPhYjiBU5NToEvHJAx2ySrlgY7ek40t3W9uhtLKiwgWwKw40eJGVS312g
         Eqd/HDaqKkV2vKqDNq0GdJ2Nqyt1Fhx09hYHPy42BVptM4BNzkHloshKZrrWuo1XZ6sD
         pp85LC76KR4/1RB9Uu6jOwCcE//OMlomQ8Mis7r7sjjR0h6wvY2N/C1MwloXo/6CRCve
         SvCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=cdq8bWb0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u26-20020a67f65a000000b00466899e3f5esi437615vso.753.2023.12.18.07.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:03:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=cdq8bWb0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFF9B-00016X-1R; Mon, 18 Dec 2023 10:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF98-0000zj-2u
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:03:06 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF91-00077l-7M
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 10:03:05 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6d6d48354ccso430520b3a.1
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 07:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911777; x=1703516577; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IS1D2FDYimeVTg+BnkZ8lK6JJAp7oUKJVZsCLLH9PCk=;
 b=cdq8bWb0IJe77a6gsQtq9EMy+lfEsS4eAGxFXPpTPp2i39Jq10tY/NxuIji1Qn6dC5
 hLpt3jQVaOYc2nvcjxT8ccQosJE5ErT/9QDaV798O+zAK8hgUVWXmdwhXnxUJU20LFMB
 06fAWAEKOXxPjLOEJz7jxe9aLbldi5CCUGJU3xqgcD+7FRn7eKwnvAjPc2RDllpKbB6J
 JcdL/BP4w9KwvPBx0MJPEb/UAOBtHzGS8i39meqDJPGbEgba3m4wxmxBXz6KyH/qx98N
 btyr4r6L5QM34VWhbWW5xkFlmdzv4HY+FbcU2PphlgSUcKymKf6QD8ZViukHOuEXEBPU
 lX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911777; x=1703516577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IS1D2FDYimeVTg+BnkZ8lK6JJAp7oUKJVZsCLLH9PCk=;
 b=u1hnwTE+aJ2+unPbpfVBREAcI2GKJjPMdkv8XWdLPf8PnLlcz/ooPLcbIGjnWw1YAa
 qpohDkGsaFqqGDdcy6zKF5N/Zwm5P1o5wcUsFvX+d6ofBBU8TMYOjCzHtJiw1CZsT0nx
 wt6R32NfGCJ3IpeB94Cw9LDGBDWr6SMTeCwV7QFkA8hjW2JgnIa+yws42AN4nA8n2/ks
 KqbUXfCGhyo7XAAvtqRdRGK6cqD3Ko0lqgZeE7NQ2zr8jVr/IJ3tfKspxRo/j8qRmTrK
 NIk74B+N5ggsMcHVQlGh2RDrA/d/jHqdsHVRkRfc4YA+6InlNZO6g3T6PmYS1WxNvLEm
 2y4Q==
X-Gm-Message-State: AOJu0YzW9X2HiTA3t5ki9sKkVxRyIktwx3Eq8J0ro3JaTrYSlncjsOw6
 9UILtJkMM4hiAx8MwwApLfPAMw==
X-Received: by 2002:a05:6a00:4643:b0:6cb:ccea:e2ed with SMTP id
 kp3-20020a056a00464300b006cbcceae2edmr8259442pfb.13.1702911776952; 
 Mon, 18 Dec 2023 07:02:56 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:02:56 -0800 (PST)
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
Subject: [PATCH v8 00/13] RISC-V: ACPI: Enable AIA, PLIC and update RHCT
Date: Mon, 18 Dec 2023 20:32:34 +0530
Message-Id: <20231218150247.466427-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sEzsZUVenqhZ

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

These changes are also available in  riscv_acpi_b2_v8 branch at:
https://github.com/vlsunil/qemu/

Changes since v7:
	1) Prefixed gpex property names with "x-" as per feedback from Michael Tsirkin.
	2) Rebased to latest riscv-to-apply.next.

Changes since v6:
	1) Fixed the qtest failure issue reported by Daniel in PATCH 2.

Changes since v5:
	1) Fixed the issue in PATCH 2 reported by Daniel found when built with
	   clang + --enable-debug.

Changes since v4:
	1) Updated copyright for new files as per SPDX format suggested by Drew.
	2) Updated RINTC patch to avoid code duplication as suggested by Drew.
	3) Moved mmu offset below cmo in MMU patch as suggested by Drew.
	4) Updated tags.

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
 hw/nvram/fw_cfg-acpi.c          |  23 +++
 hw/nvram/meson.build            |   1 +
 hw/pci-host/gpex-acpi.c         |  13 ++
 hw/pci-host/gpex.c              |  12 ++
 hw/riscv/Kconfig                |   1 +
 hw/riscv/virt-acpi-build.c      | 323 +++++++++++++++++++++++++++++---
 hw/riscv/virt.c                 |  72 ++++---
 hw/virtio/meson.build           |   1 +
 hw/virtio/virtio-acpi.c         |  33 ++++
 include/hw/nvram/fw_cfg_acpi.h  |  15 ++
 include/hw/pci-host/gpex.h      |  28 ++-
 include/hw/riscv/virt.h         |  26 +++
 include/hw/virtio/virtio-acpi.h |  16 ++
 15 files changed, 499 insertions(+), 131 deletions(-)
 create mode 100644 hw/nvram/fw_cfg-acpi.c
 create mode 100644 hw/virtio/virtio-acpi.c
 create mode 100644 include/hw/nvram/fw_cfg_acpi.h
 create mode 100644 include/hw/virtio/virtio-acpi.h

-- 
2.39.2

