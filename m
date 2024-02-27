Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2543035ejf;
        Tue, 27 Feb 2024 00:40:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWgQtIsh0tZSWsKDF/8eLICPZMVC5TeM3Nwq7xHhhBRvy7fCJCm3Niuza44zBIm2VY4GVoZAy522bnyeBJL5QZ0QjYatQKK
X-Google-Smtp-Source: AGHT+IHGurlDN0rbY0r7k41Wot2DDzPSeapluqPrs4r8XYe8B4r786G6ESvkztbbZn6klES99wld
X-Received: by 2002:a1f:d606:0:b0:4c0:1918:27de with SMTP id n6-20020a1fd606000000b004c0191827demr5787223vkg.16.1709023231640;
        Tue, 27 Feb 2024 00:40:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023231; cv=none;
        d=google.com; s=arc-20160816;
        b=tX7JU8TwTIdCmPbQ5v8VB68irbELh9Ewq7b11hmxrYqkquzqNQT3NCmMokVEdeyIWl
         YGr0NRO0Dok93QcsbWs2StePUAoMVooP9XIcB6sh07BTbyoz+f6tY+kPpaadDwtRC7dU
         DnFhLedqivKPrd6qbrOCFKs7B8hYtynVARWNU9MGsSYOEtyaYBbXpuJ1vm93hiIbyS5R
         EUplYAa3wcQXSAATi5UbfDR8WjOoAzOhQoCBTDpx+dVzNzkA8N8s3iW1Cf2i10kgEFCi
         r856FJteKvdOVEhvtCdt4O6esRv4W0cSA66OTi43Myys08Sivr9oxdVdacQBDyj/VW1/
         r+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=RIUtS/ewFcGB+h3mxnRfiJHTgwm3qMy24C28w5Y5/Lc=;
        fh=6TVpauajkIXCLozI+eiDq2oBdJj29nt/gCsRoAXDzQw=;
        b=FWvZTHKNY3Vus6Nbsn83Se3fKBjA1BsUP4lVM4oa8BtxNBoJXwYlphO33cgvVOQTPR
         ufFlg5O9IkJ9t8XObY1sbpALckLnMkC5Cb5JxSrt8sm0aztU2JQoW+XvKkdzpfBtfziW
         K4qNS57XkcguQ+9tKwb0Hs+oCEnTfX5oFyi9QGqtMRNQbsoPsPEuh7f/WvUB2ETa2pYH
         i2ZvnBrG4fAUTJqAoVqwO24HtHty98yixghRnxFSlr9gyX0qnpccB+gW0YeqRNsuq/EL
         meDzyVS/dxkM9sgjVpkkEKB0Rt7rlg8hmWnMdF4JRctnsvde6aUSefrYrAV2vhGFTZ+a
         x5fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E9i2xi6h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16-20020ac85e50000000b0042e6296e5cesi7519545qtx.42.2024.02.27.00.40.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:40:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E9i2xi6h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret0L-0005oy-GW; Tue, 27 Feb 2024 03:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0I-0005nU-VV
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:39:58 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0C-0007LP-Lb
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:39:57 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33dcad9e3a2so1113618f8f.3
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023191; x=1709627991; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RIUtS/ewFcGB+h3mxnRfiJHTgwm3qMy24C28w5Y5/Lc=;
 b=E9i2xi6hFQg9j4qV0JdGh2w69WDKZ6HgP5DfrtUYH6GH/a/celTpTSW9TKgF+AwJxt
 YP83FctcnmfKCoBQOHtSq+uLkR2fgxbGmY3XWA0K+mBuJa2TNIJkkZ73R9+OZWtTKchP
 P2QMdA8LT8Pzts2HGDfzc2iyNFfSArcdf81C6eoF6ksY7kZaxe2UJd34+PCV5Y3SgRch
 nQqmdWGS76h8nfinI66AXHBiJBNVgnMd9Xn+BveuNNRWLz9B04VMjOChB4tTSjg9loTP
 IlugONEKjqJliSxDZeU1mXhsUXVJpuNu9c/O7dDI9ZGDNH4Q2OqqBNDzRCHOjECkj0kA
 7RnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023191; x=1709627991;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RIUtS/ewFcGB+h3mxnRfiJHTgwm3qMy24C28w5Y5/Lc=;
 b=ii1u4rZ8zCoj2/avGw+zKS2dnm5pM/aUghqAAphQNOCsC8rYFzRO4SgPhO2bYfwqkk
 Fnx7e6aVeVBdYlEkn12KgemEp73qtVGk5WiQs3iX114hOXuaGQwzN1F3D+KIxAEoRm24
 N+MiS4UGRMYhwJkkYbhQUsy/psMWe+QvXHUkEzlol2dN4Ws1SpGDDwnwU3p4FDglu4MC
 fH0EpUXIVKfY6/aZwj07lhoZPi5NK9Z0DMO1DYeni5vbwufjgEL2tgljFajJa8yGXq3Y
 9CY4JA/l4Holq2tC6NlOcziSxVqUcM9RAdLmlCAVLWNeznredKI/QyLTNgBAb2TrCILL
 Lhjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzpAzXnY43DnaJvvt5dEk539Bh9Bz8r0NnuBhkVJBhRZZE1UuHgk+IqPc2X4cWn/kydREAcgwKyDb2YaIVdA1xZv5m
X-Gm-Message-State: AOJu0YxHS0qjZ5VThZsBqshSF0smsWpf6ouLjRwQwR7wfDRfKBGZj1ZL
 0n4TmDjSqVjqQAlhaakIS2UvdsoguYNzPWwd3kh+u2wTZy0Klq0451EnPuT/JY8=
X-Received: by 2002:adf:fc01:0:b0:33d:a185:17ed with SMTP id
 i1-20020adffc01000000b0033da18517edmr5656091wrr.56.1709023190930; 
 Tue, 27 Feb 2024 00:39:50 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 a10-20020a5d4d4a000000b0033d13530134sm10515937wru.106.2024.02.27.00.39.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:39:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 00/30] Misc HW patches for 2024-02-27
Date: Tue, 27 Feb 2024 09:39:16 +0100
Message-ID: <20240227083948.5427-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: peoP8XvH8ZCa

The following changes since commit 03d496a992d98650315af41be7c0ca6de2a28da1:

  Merge tag 'pull-qapi-2024-02-26' of https://repo.or.cz/qemu/armbru into staging (2024-02-26 11:22:32 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/hw-misc-20240227

for you to fetch changes up to 0316482e876988f7526ebe62d579ad069f485957:

  hw/ide: Include 'ide-internal.h' from current path (2024-02-27 09:37:30 +0100)

----------------------------------------------------------------
Misc HW patch queue

hw: Remove sysbus_address_space() (Phil)
hw/nubus: Add nubus-virtio-mmio device (Mark)
hw/usb: Remove usb_bus_find() (Paolo)
hw/usb: Extract sysbus-ohci from ohci (Paolo)
hw/nvme: Fix invalid endian conversion
hw/i386: More PC machine housekeeping (Bernhard, Phil)
hw/ide: Restrict "ide-internal.h" (Zoltan, Phil)
qom: Expose object_resolve_type_unambiguous() (Paolo)

----------------------------------------------------------------

BALATON Zoltan (1):
  hw/ide: Remove last two uses of ide/internal.h outside of hw/ide/

Bernhard Beschow (5):
  hw/i386/x86: Let ioapic_init_gsi() take parent as pointer
  hw/i386/pc: Rename "bus" attribute to "pcibus"
  hw/i386/pc_{piix, q35}: Eliminate local pci_bus/pci_host variables
  hw/i386/pc: Remove unneeded class attribute "kvmclock_enabled"
  hw/i386/pc: Populate RTC attribute directly

Klaus Jensen (1):
  hw/nvme: fix invalid endian conversion

Mark Cave-Ayland (3):
  hw/nubus-device: round Declaration ROM memory region address to
    qemu_target_page_size()
  hw/nubus: increase maximum Declaration ROM size from 128k to 1Mb
  hw/nubus: add nubus-virtio-mmio device

Paolo Bonzini (10):
  hw/acpi: move object_resolve_type_unambiguous to core QOM
  hw/ppc/sam460ex: do not use usb_bus_find()
  hw/sh4/r2d: do not use usb_bus_find()
  hw/mips/loongson3_virt: do not require CONFIG_USB
  hw/hppa: do not require CONFIG_USB
  hw/ppc/mac_newworld: do not require CONFIG_USB
  hw/ppc/pseries: do not require CONFIG_USB
  hw/usb: remove usb_bus_find
  hw/usb: extract sysbus-ohci to a separate file
  hw/usb: remove duplicate file in system_ss

Philippe Mathieu-Daudé (10):
  hw/arm: Inline sysbus_create_simple(PL110 / PL111)
  hw/display/pl110: Pass frame buffer memory region as link property
  hw/arm/exynos4210: Inline sysbus_create_varargs(EXYNOS4210_FIMD)
  hw/display/exynos4210_fimd: Pass frame buffer memory region as link
  hw/i386/kvmvapic: Inline sysbus_address_space()
  hw/sysbus: Remove now unused sysbus_address_space()
  hw/i386/sgx: Use QDev API
  hw/i386/q35: Include missing 'hw/acpi/acpi.h' header
  hw/arm/sbsa-ref: Do not open-code ahci_ide_create_devs()
  hw/ide: Include 'ide-internal.h' from current path

 hw/ide/ahci_internal.h                        |   2 +-
 .../ide/internal.h => hw/ide/ide-internal.h   |   0
 include/hw/i386/pc.h                          |   3 +-
 include/hw/i386/x86.h                         |   2 +-
 include/hw/misc/macio/macio.h                 |   2 +-
 include/hw/nubus/nubus-virtio-mmio.h          |  36 +++++++
 include/hw/nubus/nubus.h                      |   2 +-
 include/hw/sysbus.h                           |   1 -
 include/hw/usb.h                              |   1 -
 include/qom/object.h                          |  13 +++
 hw/arm/exynos4210.c                           |  14 ++-
 hw/arm/integratorcp.c                         |   7 +-
 hw/arm/realview.c                             |   7 +-
 hw/arm/sbsa-ref.c                             |  13 +--
 hw/arm/versatilepb.c                          |   8 +-
 hw/arm/vexpress.c                             |  15 ++-
 hw/core/sysbus.c                              |   5 -
 hw/display/exynos4210_fimd.c                  |  19 +++-
 hw/display/pl110.c                            |  20 +++-
 hw/hppa/machine.c                             |  10 +-
 hw/i386/acpi-build.c                          |  22 ++--
 hw/i386/amd_iommu.c                           |   2 +-
 hw/i386/intel_iommu.c                         |   2 +-
 hw/i386/kvm/xen_evtchn.c                      |   2 +-
 hw/i386/kvmvapic.c                            |  11 +-
 hw/i386/microvm.c                             |   2 +-
 hw/i386/pc.c                                  |  17 +--
 hw/i386/pc_piix.c                             |  42 ++++----
 hw/i386/pc_q35.c                              |  26 +++--
 hw/i386/sgx.c                                 |  14 ++-
 hw/i386/x86-iommu.c                           |   2 +-
 hw/i386/x86.c                                 |   7 +-
 hw/ide/ahci.c                                 |   2 +-
 hw/ide/atapi.c                                |   2 +-
 hw/ide/cmd646.c                               |   2 +-
 hw/ide/core.c                                 |   2 +-
 hw/ide/ide-bus.c                              |   2 +-
 hw/ide/ide-dev.c                              |   2 +-
 hw/ide/ioport.c                               |   2 +-
 hw/ide/isa.c                                  |   2 +-
 hw/ide/macio.c                                |   2 +-
 hw/ide/microdrive.c                           |   2 +-
 hw/ide/mmio.c                                 |   2 +-
 hw/ide/pci.c                                  |   2 +-
 hw/ide/piix.c                                 |   2 +-
 hw/ide/sii3112.c                              |   2 +-
 hw/ide/via.c                                  |   2 +-
 hw/mips/loongson3_virt.c                      |   8 +-
 hw/nubus/nubus-device.c                       |  18 +++-
 hw/nubus/nubus-virtio-mmio.c                  | 102 ++++++++++++++++++
 hw/nvme/ctrl.c                                |   2 +-
 hw/ppc/mac_newworld.c                         |   4 +-
 hw/ppc/sam460ex.c                             |   7 +-
 hw/ppc/spapr.c                                |   4 +-
 hw/sh4/r2d.c                                  |   5 +-
 hw/usb/bus.c                                  |  15 +--
 hw/usb/hcd-ohci-sysbus.c                      |  88 +++++++++++++++
 hw/usb/hcd-ohci.c                             |  58 ----------
 qom/object.c                                  |  16 +++
 hw/arm/Kconfig                                |  12 ++-
 hw/display/Kconfig                            |   1 +
 hw/hppa/Kconfig                               |   2 +-
 hw/nubus/meson.build                          |   1 +
 hw/ppc/Kconfig                                |   5 +-
 hw/sh4/Kconfig                                |   1 -
 hw/usb/Kconfig                                |   4 +
 hw/usb/meson.build                            |   3 +-
 67 files changed, 473 insertions(+), 242 deletions(-)
 rename include/hw/ide/internal.h => hw/ide/ide-internal.h (100%)
 create mode 100644 include/hw/nubus/nubus-virtio-mmio.h
 create mode 100644 hw/nubus/nubus-virtio-mmio.c
 create mode 100644 hw/usb/hcd-ohci-sysbus.c

-- 
2.41.0

