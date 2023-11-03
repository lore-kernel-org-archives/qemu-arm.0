Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp813014eja;
        Thu, 2 Nov 2023 20:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6gx9SX6xG320ZlL7QGd7C5au0iQ00sqkCLMi6i3p6QoZXUuIsRbQJyF9moU7jiqA4nKri
X-Received: by 2002:a37:ac10:0:b0:779:de52:8743 with SMTP id e16-20020a37ac10000000b00779de528743mr19768057qkm.27.1698981513439;
        Thu, 02 Nov 2023 20:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698981513; cv=none;
        d=google.com; s=arc-20160816;
        b=vciA0Gu0K0y/0yZarhdo/P/e4MRj1hVrsQMstIiXMyot+KUuW6H/ekAdXqNLt5fI2h
         Yg/KDAgTB+3tNI+hbBM1YPfBLwerdSJz1Ceb8YVXSy3XLDuu6jioMzlWse8glSJk46Ki
         qUL2/Ks3BFe4NYOotZPRGonPQhgIEEREODd8BBfuKBdXlGH6MzFgCn6+6BlFwO9IlCs/
         XKbso2DuDjb4d2OQjhO84Qk44KE2k0ZnxG/ieRqgwnOyOULKM3jnbTkdX1LCiMBRkvt0
         sRQqD0OKCwYCrRZ6Fkh4l/oJTZH7QL1xRf5wxQ9Po0I2lRh+HyrpymGx2thPDTublK1L
         Y06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pSo8/xWA1h+NiRRDtSfTewm0FT3ASIneHMhutcA3mhY=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=0/aYRfUcTgT6+SXwAXvdmuO2lElFD04XTfOTrT1J6D5ZFxpMnz5Z0ue4Oc1zl867aF
         X5m2sMrhdARsQoYsgc9epkWZTPbu8lB0osuAAnsEJjuc1TSytXL0c4iwCI60tZsOdZT6
         3zHP690yp/87a672v8jiuGg3GnXPGt/ZuFuzvCLx4+FZFDEXnO6TBZsJbBhcyQWDHF8F
         QYSZxeEV3kWSjsW1tqQUlNwbDu0BDpIzg01xQIsVHKLp0wmg1QKzM8XmCuquIj1ZnDaR
         YNzvQFEAmosIz+IJPGNcw7RrvL/RRvW4uIoiWXEpzPp+Jc1Cr/wHkgq1EmvZe1MLoIn1
         4Tbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=htzUSw0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pz19-20020a05620a641300b0077a2f300c7esi773966qkn.768.2023.11.02.20.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 20:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=htzUSw0Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qykgI-0007ji-LU; Thu, 02 Nov 2023 23:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgE-0007hu-11
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:07 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgA-0003Bt-Bl
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:05 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6c3443083f2so948745b3a.0
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 20:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698981420; x=1699586220; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pSo8/xWA1h+NiRRDtSfTewm0FT3ASIneHMhutcA3mhY=;
 b=htzUSw0ZV7BQWb63bnBg0l1vaDbnUG05f8FqNMKqU1lk8I5S+FTYVGKSnOfCJRrwMp
 j0qoAHca7E//XP93B+M3ENX1ugfu0kRiPu8jBwPVmBM8O1qOvYQ/QJv3jIJlFTA6rgKs
 nsGgtlGW8qnFhDm5Ub1oE2prUcf4iJt7dP+TMc2oZvdgE47kk1407tMpdUR1jdByw4X4
 IdxTCH9GfUtEdVqh3uiPZSELyM0zff7c5iiGQfzDDPYMQRFweLbLyxFrciw7qs6hE+C2
 k1URYdyj4s+JP2Bly3EzyD4PR5nWK6lG/Dhgiqciu4J+691wpbF8kQb7SkKxo5XePvOi
 JqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981420; x=1699586220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pSo8/xWA1h+NiRRDtSfTewm0FT3ASIneHMhutcA3mhY=;
 b=UJVAE9qsj/QriOHIBkXPQ4VezP61s78h1pz7vfW5p6JrADpk7ZsXnccEgUn8tHcnRc
 39zixcrx9E4PO8yGivdTaywcJblk+rpr2nAxscFhFMEZIr5FnbU8PSyJPTbNzLT+kM0l
 uqN4clGwgMuJ7QqASIcdtwvPg73aNgo2/gU5e8D9JvFZ4CMz4jVxL9vdtDbhi3h1dFRu
 2iJ/6nNvYBOz8hmu2Edf1OwUYe+ryIRoNA3dWs6MQ6Czb0LvyYfIfIdfKpY2Du0U4HZe
 yPF7VOArg85USbKF7aWoY4KXY1w1qwx+zKpoYiExI171YCfXe6Thyj5aUmtAgvsTYhsk
 rkqw==
X-Gm-Message-State: AOJu0YyLUDg0VPdRHtodz6dZK/ky4AEh8787RtFHSZe2deEhM2RoY6ty
 VRXcfuQgEzkHu33rkOdQL0j8b7NOHaDJLmIgiG0bmw==
X-Received: by 2002:a05:6a20:1453:b0:152:6b63:f1e7 with SMTP id
 a19-20020a056a20145300b001526b63f1e7mr20008900pzi.1.1698981419699; 
 Thu, 02 Nov 2023 20:16:59 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a17090aca9100b0027cf4c554dasm499971pjt.11.2023.11.02.20.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 20:16:59 -0700 (PDT)
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
Subject: [PATCH v7 00/13] RISC-V: ACPI: Enable AIA, PLIC and update RHCT
Date: Fri,  3 Nov 2023 08:46:36 +0530
Message-Id: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: VJ2qJTS/C0mT

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

These changes are also available in  riscv_acpi_b2_v7 branch at:
https://github.com/vlsunil/qemu/

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

