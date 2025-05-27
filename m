Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4647556njc;
        Tue, 27 May 2025 00:42:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvEbPt216ZbLSo/Q/sYtTp+ygI11w7Q40/0Tc+T8swkWp+xZ47mHoXQVaai3dShY8x+wrTqViBg4Qk7w==@linaro.org
X-Google-Smtp-Source: AGHT+IHL6M7t2w2CzjKhejHfIpgWZHuvHJyzHelPUnmiq1ZY7eUr3Ib0XN8T6m3cUWbS3Hm89nHo
X-Received: by 2002:a05:622a:5e14:b0:478:f8bb:b5e with SMTP id d75a77b69052e-49f4655a971mr250848481cf.13.1748331757701;
        Tue, 27 May 2025 00:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748331757; cv=none;
        d=google.com; s=arc-20240605;
        b=lYwZRN+F2VzazxBGVTdlL9dA2Bid9t3qTM2TsAPv8vqnTrQuqjbL6074kY3uyBp7IV
         PaBuPE8y+MAuQ963bU7BLmp2sSGDerRh69GnPQDUbIzTHf18Q9wuEPmEkaHlPBXNhm9Y
         CLdhNgaaJbCsTbOcOBHEFsVBbf0v3LbUw1oXLQdhZ0Bv2gqQ3IhdasH9jJcgRiyuWa3I
         BRtO271P01r+iURbx9pnCO8gRcsoetwnQTFsYa0OxXTKKJoS+fQk/MarAD7BFOELN0Ma
         o8gcBLRFftOQKnWoC5G4KU8IcPRBR/cjWjUz8lvc9MKboPm/9tjqIP6K5b2JOEBaiVEO
         WN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=VYdJRHhX8fm5rqQ85jtoqV7RbpM+0kpirv5uP+BgoFI=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=DPThzcw2PS7boysapVqMqqIlp2W60E+5oh+2vBdGm1TMgJP1xq5XFtIY8xc714UKUP
         EV6TkB9LSPJgodelVutWXekpneFOuqkEuSNyqXfK+qIlf3C0NX4zeQFCFV5xg+b+O8mp
         JoL6Tv8uXZnKTUEOlX9xU1wm/vyXIPUTewLh15cciLfRFeuughLLPlk7b3Su8W/XBsnN
         XqOQEkfv3oIimKvM+/njjpiS6NepZILTufbdjbzkfJOz85YVeNKpBli7e5+MGKUjEHjP
         QZl1gJlccz0vwOqC2FUbo5ilaIviBUCdAfDEDMge4M5rNOxtYxkDKDUyT+LQg35hNDG7
         yCZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d1O+5iP0;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae594755si271931231cf.575.2025.05.27.00.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:42:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d1O+5iP0;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748331757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VYdJRHhX8fm5rqQ85jtoqV7RbpM+0kpirv5uP+BgoFI=;
	b=d1O+5iP0oxfpfAIcGihP3g2ugq+KACGCDa9Khlx6gfH0h+hD+8kNXCey2xp02HQU1kkTpi
	4QbdrVlxh1Y7klSM+ga/46zFg7eitteDBmta38CUIrZxiRf9tpIgdbF7fzs364LscOa+EY
	7mn4T4NjEMXUs3BFjBu8y0FB2JpgDMQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-263-XOU3yxJWNge8Vh10Sy4lGQ-1; Tue,
 27 May 2025 03:42:35 -0400
X-MC-Unique: XOU3yxJWNge8Vh10Sy4lGQ-1
X-Mimecast-MFC-AGG-ID: XOU3yxJWNge8Vh10Sy4lGQ_1748331753
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 799EC180056F;
	Tue, 27 May 2025 07:42:33 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.201])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 96CF719560AA;
	Tue, 27 May 2025 07:42:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 00/25] ACPI PCI Hotplug support on ARM
Date: Tue, 27 May 2025 09:40:02 +0200
Message-ID: <20250527074224.1197793-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: mry4Dd2rx3dW

This series enables ACPI PCI hotplug/hotunplug on ARM
and makes it default for 10.1 machine type. This aligns with
x86 q35 machine. Expected benefits should be similar to
those listed in [1], ie. removal of some racy behaviors,
improved latencies.

It is still possible to disable it using a virt machine
option: virt,acpi-pcihp=off and restore the legacy behavior.

The infrastructure used in x86 is heavily reused and a
huge part of the series consists in moving code from
hw/i386/acpi-build.c to a generic place and slightly
adapting it to make it usable on ARM. The DSDT table is
augmented to support ACPI PCI hotplug elements.

On ARM we use use a GED event to notify the OS about
hotplug events.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/arm-acpi-pcihp-v2

previous series:
https://github.com/eauger/qemu/tree/arm-acpi-pcihp-v1

History:
v1 -> v2:
- collected a bunch of R-bs from Gustavo (many thanks!)
- Fixed the breakage of bios-tables-test in TCG mode by
  incorporating Gustavo's patches (part of
  [PATCH 0/5] ACPI tests for PCI Hotplug on ARM
  https://lore.kernel.org/all/20250526053123.1434204-1-gustavo.romero@linaro.org/)
- Tweeked the dsdt aml changes to avoid any dsdt blob difference when
  acpi-pcihp is off.

RFC -> v1:
- First 3 trivial patches were pulled separately
- Fix of the register region size (0x18), ie. ACPI_PCIHP_SIZE
- addition of aml_pci_edsm which was not called in RFC
- acpi-index feature is now fixed. vms->bus was not set on
  acpi_pcihp_init. The init sequence is still hacky though. Suggestions
  are welcome.

[1] [PATCH v6 0/6] Use ACPI PCI hot-plug for Q35
https://lore.kernel.org/all/20210713004205.775386-1-jusual@redhat.com/


Eric Auger (22):
  hw/i386/acpi-build: Make aml_pci_device_dsm() static
  hw/arm/virt: Introduce machine state acpi pcihp flags and props
  hw/acpi: Rename and move build_x86_acpi_pci_hotplug to pcihp
  hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to
    acpi_dsdt_add_pci_osc
  hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
  hw/pci-host/gpex-acpi: Propagate hotplug type info from virt machine
    downto gpex
  hw/i386/acpi-build: Turn build_q35_osc_method into a generic method
  hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method
  hw/i386/acpi-build: Introduce build_append_pcihp_resources() helper
  hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_hotplug
  hw/i386/acpi-build: Move build_append_notification_callback to pcihp
  hw/i386/acpi-build: Move build_append_pci_bus_devices/pcihp_slots to
    pcihp
  hw/i386/acpi-build: Introduce and use acpi_get_pci_host
  hw/i386/acpi-build: Move aml_pci_edsm to a generic place
  hw/arm/virt-acpi-build: Modify the DSDT ACPI table to enable ACPI PCI
    hotplug
  hw/acpi/ged: Prepare the device to react to PCI hotplug events
  hw/acpi/ged: Call pcihp plug callbacks in hotplug handler
    implementation
  hw/acpi/ged: Support migration of AcpiPciHpState
  hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
  hw/arm/virt: Let virt support pci hotplug/unplug GED event
  hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks
  hw/arm/virt: Use ACPI PCI hotplug by default

Gustavo Romero (3):
  tests/qtest/bios-tables-test: Prepare for changes in the DSDT table
  tests/qtest/bios-tables-test: Update DSDT blobs after GPEX _OSC change
  tests/qtest/bios-tables-test: Keep ACPI PCI hotplug off

 hw/i386/acpi-build.h                          |   4 -
 include/hw/acpi/aml-build.h                   |   2 +
 include/hw/acpi/generic_event_device.h        |   7 +
 include/hw/acpi/pci.h                         |   4 +-
 include/hw/acpi/pcihp.h                       |  19 +-
 include/hw/arm/virt.h                         |   4 +
 include/hw/pci-host/gpex.h                    |   1 +
 include/hw/sysbus.h                           |   1 +
 hw/acpi/aml-build.c                           |  50 ++
 hw/acpi/generic_event_device.c                |  54 ++
 hw/acpi/pci.c                                 |  20 +
 hw/acpi/pcihp.c                               | 482 ++++++++++++++-
 hw/arm/virt-acpi-build.c                      |  23 +
 hw/arm/virt.c                                 | 107 +++-
 hw/core/sysbus.c                              |  11 +
 hw/i386/acpi-build.c                          | 552 +-----------------
 hw/pci-host/gpex-acpi.c                       |  75 +--
 tests/qtest/bios-tables-test.c                |  13 +-
 hw/arm/Kconfig                                |   2 +
 tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5170 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5256 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6531 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7627 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5372 bytes
 24 files changed, 812 insertions(+), 619 deletions(-)

-- 
2.49.0
