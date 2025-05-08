Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp426317njb;
        Thu, 8 May 2025 06:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXenMlocf/KWLWdcqVZ3Iuv8H4kNb+fn2827C3ob/OabEE0U6c0mqUSERL+6V3E7qr4hKFxf4hbplB1SA==@linaro.org
X-Google-Smtp-Source: AGHT+IGiN+c5aBQz1fF+SO4dmaOPQY4nboiNH4l1UXyk9NKz1otVcNZOcipd9EPGpS/WZdR81WDK
X-Received: by 2002:a05:620a:4083:b0:7c9:6d26:91b9 with SMTP id af79cd13be357-7caf7406201mr1300689585a.36.1746711385034;
        Thu, 08 May 2025 06:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711385; cv=none;
        d=google.com; s=arc-20240605;
        b=gWcrd/SrAn/CER/MutE/nDhj9HLeFXbzpxL5Q9Gtsc39g5aJpdlYfRsN7Qa3RQ58wY
         G4Fge4u9Dkg5+jb15HCjMpMqHkkuTjyYI68mB6OsM21I1af6g+99YJnNcm8PlP19GT1m
         uZSfAYXBryWEc96ZsSsrMlmHSFitTKecTARB8dqvB5B2j5W5Ii/lK30iDadUc80o0Wo2
         YNeKciKYJ+GIsu37HYZJAvKCt1GtL9/0/lYXBbZk6IyXmV/OnKUnN5CWgeulPaT2x/z9
         +qsV/KGWUM/ud70EgRp2m6dzAoAH+bDFJXldAYpREp36lGMpxhvEisJxyZO4hLzDyaGv
         e7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9KuBrSw61wT1TUDNwR8So3hV4T+jBIcjNnsvQibQhUU=;
        fh=mZiMDdJiWzfY2kHnKtLKIcLCLgCfiO7izcNd8lJ4kq0=;
        b=Y9TVTMeS/BXcctdO5y0shhPmuhgJ3bpJK/lqfcrpyUQN/NYc3PcGRck76cnnti3UxK
         DcAWUOj8uBVuA2VQA12cD5KlXJGkTDjko9CXeV4jPD9OpqvfT7QlfnMxpfxSsyeYJHMs
         lbv1eSJ+b0jyv+KiyiHKPwfM9caIC/ygoXyR3IaaPKr+g56k5B/3P2rYmMbTGeJV3aid
         m7iqsl8OT3KLA4UGqNe1TuR9IIbvZd1vr0s/YmjleoJM6jFEO73jyiwnGkcXzmbCrf8B
         66Gni+7qoCwmBaUfZHbN/YySFme0trUNii4bO+QJuJN7Rqqe6p7g402lmMzs/VNF8ned
         PmDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v7MK66rW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf751d729si462442385a.80.2025.05.08.06.36.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:36:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v7MK66rW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1Q6-00067h-7S; Thu, 08 May 2025 09:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Q5-00067Q-5C
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:36:13 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Q3-0003gc-1W
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:36:12 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22e4db05fe8so10633125ad.0
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711368; x=1747316168; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9KuBrSw61wT1TUDNwR8So3hV4T+jBIcjNnsvQibQhUU=;
 b=v7MK66rWl+/gtcAjLXnjGZ1UPMBUlatDxgLkdFo80EJm+v0uSPfJ/gKS9XZid5Jr6n
 6GNmaZOx5BqV/ZcTb4FihCfxmUdrQmZsqxD/E6fHEV8PWWv2VdA9mDbJcXU2uOKussQH
 O+XLH53pbIjyMBRZ730H7kAvGybtZvbjISjtyOlTlqKiy/trlBrCwJE6GQ+7qrR/Ohbv
 pVzxiYyo4p/CRgSJkQIlz7efrPmj9eKSJ80mLgcKzJbWfi5sb2pNccSHSsb3ESPh026d
 tSrRF+oYPqjfS/X2Jg1Hgz+lnYbDKqmWI+1nOtMnIpHy8WV+7Jzbza4CH5SEHjY0ntPt
 SnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711368; x=1747316168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9KuBrSw61wT1TUDNwR8So3hV4T+jBIcjNnsvQibQhUU=;
 b=HpY+VzeSD+KjyKHiNDtP3la4ttLiAZY7XbjU3//1+ExJge+TnZNC9zbRpvR+EGJHzm
 fg319SzYTAlaXIub5I4Q1Jhs5X0uJOcvY/Gwo2ixCkQfYL/bC+V/FKVLzD/xrgTDDpz3
 pLWvd2OuBN7mL6I2qxe4OOhTAB4BfeMf88sBSlSVKsYePqBxbhb0DZCkJNb0JftgWoBN
 gg4F5CWDJ3KbZLA18se/owM7UYZNFeLTlnnkLVbiBP0wGpv+8nhil92iCSWPJ2d8PcDG
 Iqrrg1VtLfRgi4fqs1RAsLtRWgjYMHASop5BSO0LHpLx+YbqqeZvEEJJebAPXViNzNj8
 +POQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4XopA0XWauMAXgwRMBSpeHkM/Og6a4J6VsNP2wDRvUOS8FZy9foL1ew6hWU8OKQfzoASb37u6Pw==@nongnu.org
X-Gm-Message-State: AOJu0Yzf/7ucyS+IJGoGttSP2sHnPfoDDpQnbJR3IcCAm/q0ls9Q+Kti
 ODwX1QsIPCjllWyR7wg7LkgpSPsoYMfVm+Fo/Ht41jtuqlUy8mX+Hi1qVBWpp0I=
X-Gm-Gg: ASbGncv4FxbhIQfB+0Is+hH0ckfCp40EKcRd61y3sKrp2eCZdxZ7W80JvMubMM1a0zm
 qZlcnMSK+4LKF7Sb2LKaS+GOfbN1etJT3Tnsf9HG+DEk/6oB/SiqZ/LoXSr0c38QiPCo1G0URhl
 76m62tKpmtyr80Isq/Mf2eyTfWeeHB5vjLgGcJt3Oxt3JxsL7kLTAeJMyXZ76z695xvslJchLb6
 ykYGqOrbg78+sK6S1ODIvUvM6XZRbxg9Wcsi+RLgxVDqtEsZSd7bSW2UXrtaqfRDvvJep8V6QE6
 /SAs0+v9zVOSM1aekKDmMoXqAPKlv+V8X44eBaQLg8oO2k/YtC+91RwHgt0afS5WXUTIY2ijtLC
 el9LfKuj3hleB/2xlVPG+onJkoQ==
X-Received: by 2002:a17:903:478d:b0:220:e924:99dd with SMTP id
 d9443c01a7336-22e5ecc52a4mr120970055ad.34.1746711368214; 
 Thu, 08 May 2025 06:36:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1521fd31sm112108055ad.130.2025.05.08.06.35.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:36:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 00/27] hw/i386/pc: Remove deprecated 2.6 and 2.7 PC machines
Date: Thu,  8 May 2025 15:35:23 +0200
Message-ID: <20250508133550.81391-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: NP1UxtdHEsVC

Since v3:
- Addressed Thomas and Zhao review comments
- Rename fw_cfg_init_mem_[no]dma() helpers
- Remove unused CPU properties
- Remove {multi,linux}boot.bin
- Added R-b tags

Since v2:
- Addressed Mark review comments and added his R-b tags

The versioned 'pc' and 'q35' machines up to 2.12 been marked
as deprecated two releases ago, and are older than 6 years,
so according to our support policy we can remove them.

This series only includes the 2.6 and 2.7 machines removal,
as it is a big enough number of LoC removed. Rest will
follow.

Based-on: <20250506143905.4961-1-philmd@linaro.org>

Philippe Mathieu-Daudé (27):
  hw/i386/pc: Remove deprecated pc-q35-2.6 and pc-i440fx-2.6 machines
  hw/i386/pc: Remove PCMachineClass::legacy_cpu_hotplug field
  hw/nvram/fw_cfg: Rename fw_cfg_init_mem() with '_nodma' suffix
  hw/mips/loongson3_virt: Prefer using fw_cfg_init_mem_nodma()
  hw/nvram/fw_cfg: Factor fw_cfg_init_mem_internal() out
  hw/nvram/fw_cfg: Rename fw_cfg_init_mem_wide() ->
    fw_cfg_init_mem_dma()
  hw/i386/x86: Remove X86MachineClass::fwcfg_dma_enabled field
  hw/i386/pc: Remove multiboot.bin
  hw/nvram/fw_cfg: Remove fw_cfg_io_properties::dma_enabled
  hw/i386/pc: Remove linuxboot.bin
  hw/i386/pc: Remove pc_compat_2_6[] array
  target/i386/cpu: Remove CPUX86State::enable_cpuid_0xb field
  target/i386/cpu: Remove CPUX86State::fill_mtrr_mask field
  hw/intc/apic: Remove APICCommonState::legacy_instance_id field
  hw/core/machine: Remove hw_compat_2_6[] array
  hw/virtio/virtio-mmio: Remove
    VirtIOMMIOProxy::format_transport_address field
  hw/i386/pc: Remove deprecated pc-q35-2.7 and pc-i440fx-2.7 machines
  hw/i386/pc: Remove pc_compat_2_7[] array
  target/i386/cpu: Remove CPUX86State::full_cpuid_auto_level field
  target/i386/cpu: Remove CPUX86State::enable_l3_cache field
  hw/audio/pcspk: Remove PCSpkState::migrate field
  hw/core/machine: Remove hw_compat_2_7[] array
  hw/i386/intel_iommu: Remove IntelIOMMUState::buggy_eim field
  hw/intc/ioapic: Remove IOAPICCommonState::version field
  hw/virtio/virtio-pci: Remove VirtIOPCIProxy::ignore_backend_features
    field
  hw/char/virtio-serial: Do not expose the 'emergency-write' property
  hw/virtio/virtio-pci: Remove VIRTIO_PCI_FLAG_PAGE_PER_VQ definition

 hw/intc/ioapic_internal.h           |   3 +-
 include/hw/acpi/cpu_hotplug.h       |   3 -
 include/hw/boards.h                 |   6 -
 include/hw/i386/apic_internal.h     |   1 -
 include/hw/i386/intel_iommu.h       |   1 -
 include/hw/i386/pc.h                |   9 --
 include/hw/i386/x86.h               |   2 -
 include/hw/nvram/fw_cfg.h           |   9 +-
 include/hw/virtio/virtio-mmio.h     |   1 -
 include/hw/virtio/virtio-pci.h      |   2 -
 include/hw/virtio/virtio-serial.h   |   2 -
 pc-bios/optionrom/optionrom.h       |   4 -
 target/i386/cpu.h                   |  15 --
 hw/acpi/cpu_hotplug.c               | 230 ---------------------------
 hw/arm/virt.c                       |   2 +-
 hw/audio/pcspk.c                    |  10 --
 hw/char/virtio-serial-bus.c         |   9 +-
 hw/core/machine.c                   |  17 --
 hw/display/virtio-vga.c             |  10 --
 hw/hppa/machine.c                   |   2 +-
 hw/i386/acpi-build.c                |   4 +-
 hw/i386/fw_cfg.c                    |   5 +-
 hw/i386/intel_iommu.c               |   5 +-
 hw/i386/microvm.c                   |   3 -
 hw/i386/multiboot.c                 |   7 +-
 hw/i386/pc.c                        |  22 +--
 hw/i386/pc_piix.c                   |  23 ---
 hw/i386/pc_q35.c                    |  24 ---
 hw/i386/x86-common.c                |   6 +-
 hw/i386/x86.c                       |   2 -
 hw/intc/apic_common.c               |   5 -
 hw/intc/ioapic.c                    |  18 +--
 hw/intc/ioapic_common.c             |   2 +-
 hw/mips/loongson3_virt.c            |   2 +-
 hw/nvram/fw_cfg.c                   |  48 +++---
 hw/riscv/virt.c                     |   4 +-
 hw/virtio/virtio-mmio.c             |  15 --
 hw/virtio/virtio-pci.c              |  12 +-
 target/i386/cpu.c                   | 152 ++++++++----------
 target/i386/kvm/kvm.c               |  10 +-
 tests/qtest/test-x86-cpuid-compat.c |  11 --
 pc-bios/meson.build                 |   2 -
 pc-bios/multiboot.bin               | Bin 1024 -> 0 bytes
 pc-bios/optionrom/Makefile          |   2 +-
 pc-bios/optionrom/linuxboot.S       | 195 -----------------------
 pc-bios/optionrom/multiboot.S       | 232 ---------------------------
 pc-bios/optionrom/multiboot_dma.S   | 234 +++++++++++++++++++++++++++-
 47 files changed, 349 insertions(+), 1034 deletions(-)
 delete mode 100644 pc-bios/multiboot.bin
 delete mode 100644 pc-bios/optionrom/linuxboot.S
 delete mode 100644 pc-bios/optionrom/multiboot.S

-- 
2.47.1

