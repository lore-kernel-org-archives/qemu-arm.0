Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp787555dye;
        Fri, 27 Jun 2025 02:56:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXuNz26K4aPdA72AF2sieUk/quY+YRwfcljs3uIS5mzculMfcJ5KzoZqjy5/gLc1EcC+okd2bBtNyPZw==@linaro.org
X-Google-Smtp-Source: AGHT+IEHkmmmP+07rVf1TSstE6V5G6+qW6GUBkYLzyh5lUhclr8hDpkvsMDh6/Oc41K+Gg8nFvez
X-Received: by 2002:ad4:5d48:0:b0:6f4:c422:53e7 with SMTP id 6a1803df08f44-6ffed7a4292mr49661316d6.8.1751018194106;
        Fri, 27 Jun 2025 02:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018194; cv=none;
        d=google.com; s=arc-20240605;
        b=k9u53qxpsdeQMPSAtyd1PyeelC0Oyes2lmqmGxz8FB8BfU3wamKSMqebaCwkx4n7un
         x0En8gt3BC+jkZj9+aj2UeDycCtUjtvStorcxky4mVuaE338c3WxnV5kN37qQ06j/k+U
         sGx+z05egfYAQdcGMhlru4ascF1yzZsRHrHjTtxr3zJCRetmdykb5bjMb/2pO5NGTLfr
         V4m0SUwJ2hNXv7XP0+Pd4sgnG8IIjr9sM73nvRA1IirnHj+hCs2Ya+B8JVoRczBbihBH
         g+BsBp6xFQL3UIRpaEKTH/T09B9Lt2Oy84QMwCWahGgVc24FyZU8Lamc9jA8Jf5W+mbl
         mZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=S355JKBbdPhEjZ/KXIkxC3zRQlqLVOr3hO2Q9RhYIZ8=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=fOOdMtCvt6S2VOIKfgr02WMeeSHm9fYhYpgVZkZVQ4MTYdnpYInAizGuEh1Belpmwy
         gNlS9kBApqu67K0wKA778PvjaC66UnQcmEbmVJN5yOKLLEDt+bFhrnzjFUQsxEPJpQ+e
         6IgEECAtZGs9z/d5vrLCEM/26eLFXmeEXG2lx/yI2U96GYD2xFAv2gdvN3SxSEhTvJG+
         e8lXUg+Fwi21dzEPC5sslFVwQYsI2MWSxWNbt28owX3Bg2KuYIq+c1w4rdoKK5WHEsFg
         +V6sNYloAtj1pCkgOtUw9NH4dmXCHlJzUNW3W2+o+yQJQOaZaE/iSc341LCE/jZn029g
         j55Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aXNZvVkE;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77385ee5si39384006d6.360.2025.06.27.02.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:56:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aXNZvVkE;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S355JKBbdPhEjZ/KXIkxC3zRQlqLVOr3hO2Q9RhYIZ8=;
	b=aXNZvVkEbnUL8d+ssCWL6nkJ7qwkpRBUq7ZokD23hgSadcQWiQ2KGotGe58uN0JJgq25tl
	KfC6aQQYioTZ/bLt3dW0xBs696V9cWzzC4pPsF9WGxIPRWcZsayPZH6I7eeRoAjKTG4yNs
	oK3wZcb83cRM4FZlZDHK7Cq3OgdY27Y=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-bRFNCjxFPcOTv0YV2OcCVQ-1; Fri,
 27 Jun 2025 05:56:29 -0400
X-MC-Unique: bRFNCjxFPcOTv0YV2OcCVQ-1
X-Mimecast-MFC-AGG-ID: bRFNCjxFPcOTv0YV2OcCVQ_1751018188
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2678A1944AA5;
	Fri, 27 Jun 2025 09:56:28 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 822FF19560A7;
	Fri, 27 Jun 2025 09:56:23 +0000 (UTC)
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
Subject: [PATCH v4 00/32] ACPI PCI Hotplug support on ARM
Date: Fri, 27 Jun 2025 11:54:49 +0200
Message-ID: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: sGK7KcLEkyEc

This series enables ACPI PCI hotplug/hotunplug on ARM.
It is not enabled by default and ACPI PCI hotplug can
be selected by setting:

-global acpi-ged.acpi-pci-hotplug-with-bridge-support=on

Expected benefits should be similar to those listed in [1],
ie. removal of some racy behaviors, improved latencies.

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
https://github.com/eauger/qemu/tree/arm-acpi-pcihp-v4

previous series:
https://github.com/eauger/qemu/tree/arm-acpi-pcihp-v3
https://github.com/eauger/qemu/tree/arm-acpi-pcihp-v2

History:
v3 -> v4:
- toook into account all comments on v3
- static acpi-index is now supported unconditionally
  from acpi pcihp option. See indiviual patches.
- I hit a problem with ref block generation at
  [19/32] tests/qtest/bios-tables-test: Update ARM DSDT reference
  blobs: despite I regenerate the blobs, I get some errors.
v2 -> v3:
- lot of changes taking into account various feedbacks
  (many thanks to all reviewers). Please refer to
  individual patches for details. Main changes:
  - no more machine option, acpi pci hp is not set by
    default.
  - removal of 2 unused variables in the osc method
  - introduction of GED property to set the bus
  - rework of the init/reset sequence
  - fix virtio-mem-pci hotplug regression
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


Eric Auger (28):
  hw/i386/acpi-build: Make aml_pci_device_dsm() static
  hw/acpi: Rename and move build_x86_acpi_pci_hotplug to pcihp
  hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to
    acpi_dsdt_add_pci_osc
  hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
  hw/acpi/ged: Add a acpi-pci-hotplug-with-bridge-support property
  hw/pci-host/gpex-acpi: Use GED acpi pcihp property
  hw/i386/acpi-build: Turn build_q35_osc_method into a generic method
  hw/pci-host/gpex-acpi: Use build_pci_host_bridge_osc_method
  tests/qtest/bios-tables-test: Update DSDT blobs after GPEX _OSC change
  hw/i386/acpi-build: Introduce build_append_pcihp_resources() helper
  hw/acpi/pcihp: Add an AmlRegionSpace arg to build_acpi_pci_hotplug
  hw/i386/acpi-build: Move build_append_notification_callback to pcihp
  hw/i386/acpi-build: Move build_append_pci_bus_devices/pcihp_slots to
    pcihp
  hw/i386/acpi-build: Use AcpiPciHpState::root in acpi_set_pci_info
  hw/i386/acpi-build: Move aml_pci_edsm to a generic place
  hw/arm/virt-acpi-build: Let non hotplug ports support static
    acpi-index
  tests/qtest/bios-tables-test: Update ARM DSDT reference blobs
  hw/arm/virt-acpi-build: Modify the DSDT ACPI table to enable ACPI PCI
    hotplug
  hw/acpi/ged: Add a bus link property
  hw/arm/virt: Pass the bus on the ged creation
  hw/acpi/ged: Call pcihp plug callbacks in hotplug handler
    implementation
  hw/acpi/pcihp: Remove root arg in acpi_pcihp_init
  hw/acpi/ged: Prepare the device to react to PCI hotplug events
  hw/acpi/ged: Support migration of AcpiPciHpState
  hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
  hw/arm/virt: Minor code reshuffling in create_acpi_ged
  hw/arm/virt: Let virt support pci hotplug/unplug GED event
  qtest/bios-tables-test: Create DSDT acpipcihp and hpoffacpiindex
    variant blobs

Gustavo Romero (4):
  tests/qtest/bios-tables-test: Prepare for changes in the DSDT table
  tests/qtest/bios-tables-test: Prepare for changes in the arm virt DSDT
    table
  tests/qtest/bios-tables-test: Prepare for addition of acpi pci hp
    tests
  tests/qtest/bios-tables-test: Add aarch64 ACPI PCI hotplug test

 hw/i386/acpi-build.h                          |   4 -
 include/hw/acpi/generic_event_device.h        |   7 +
 include/hw/acpi/pci.h                         |   5 +-
 include/hw/acpi/pcihp.h                       |  19 +-
 include/hw/arm/virt.h                         |   1 +
 include/hw/pci-host/gpex.h                    |   1 +
 include/hw/sysbus.h                           |   1 +
 hw/acpi/acpi-pci-hotplug-stub.c               |   2 +-
 hw/acpi/generic_event_device.c                |  73 +++
 hw/acpi/ich9.c                                |   7 +-
 hw/acpi/pci-bridge.c                          |  54 ++
 hw/acpi/pci.c                                 |  50 ++
 hw/acpi/pcihp.c                               | 439 ++++++++++++++-
 hw/acpi/piix4.c                               |   5 +-
 hw/arm/virt-acpi-build.c                      |  30 +
 hw/arm/virt.c                                 |  27 +-
 hw/core/sysbus.c                              |  11 +
 hw/i386/acpi-build.c                          | 532 +-----------------
 hw/pci-host/gpex-acpi.c                       |  74 +--
 tests/qtest/bios-tables-test.c                |  52 ++
 hw/arm/Kconfig                                |   2 +
 hw/pci-host/Kconfig                           |   1 +
 tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5310 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5379 bytes
 tests/data/acpi/aarch64/virt/DSDT.acpipcihp   | Bin 0 -> 6294 bytes
 .../acpi/aarch64/virt/DSDT.hpoffacpiindex     | Bin 0 -> 5347 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6654 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7768 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5495 bytes
 tests/data/acpi/riscv64/virt/DSDT             | Bin 3576 -> 3538 bytes
 tests/data/acpi/x86/microvm/DSDT.pcie         | Bin 3023 -> 2985 bytes
 31 files changed, 790 insertions(+), 607 deletions(-)
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.acpipcihp
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex

-- 
2.49.0
