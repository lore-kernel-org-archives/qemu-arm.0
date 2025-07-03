Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp505090dyc;
        Thu, 3 Jul 2025 05:37:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWInxzb/trA+qKJGTn229fOcQyRJPUP3MnqZKgkz6OURrg7X6gjISDFnvGz0Bp12l9NicxRwk5BhuaMyA==@linaro.org
X-Google-Smtp-Source: AGHT+IFDbwdbrQR4xyieKkLONBPoHhvIY8I6sRiPEZy7sd4UDzR6iFBPcv4CJXPPXMqn+2hoG+Ck
X-Received: by 2002:a17:902:f690:b0:234:b41e:37a4 with SMTP id d9443c01a7336-23c6e4838fcmr93144995ad.6.1751546264602;
        Thu, 03 Jul 2025 05:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546264; cv=none;
        d=google.com; s=arc-20240605;
        b=ZdoVNSHa1m5X1jAUXwkDHFDOu8jMc8id4K/Vj7YWz044Zl9snl1ptFNMvtuxTvY8p8
         BTjmOne9YAPJ+aL8qu9hrM2S1IZaWt1rg7KNYZ/a3pcK4yQyHvKUC805RyCkwvYw6/gU
         Q8ze2ZdgiXUqW9U0ddBXF97jKiIe5mXhOMJvvUtdpAzK9ha1GemM7lJwN7wgYihFgGwN
         ZBgElMt/FNaKNUXJdH5i6Kz8Tl0mFpW7Xqr1OiUvv8NNZeILous0SQWJ59YU+vGsFDW+
         zkEIXcztllCdUvFr9tG17Ybt9MqAGrI1iFTf2x2QvPigO/q2JTAa8RaM19ModsNRfhwY
         joow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=z89tewoPj7EMabA5/lu/AAJnIjNCMY3CQG8UM5N3cBw=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=L1FxaEFaWPf7tvpwgAZxuTo864QNFpij+4+uZMGuPdSS+VTmvDZNPKYIdwn73pRA7B
         6CbZLrnkwSUtEaEKp38iwYu9h2maVr0T3oJF+jiBka5Gwwo3U2IM9PC6sZ70ZSX3vvu8
         eKINoBm6t1gxDbVVWlRVdZE/LsccdweOOyI4VoBW0c8QpZVcrAWfZzDkABH2cbofGcYD
         CaNIw1Rq6LuKMXTh/j0EqnhrFxx2zlqTG2nTMlCTC9nAdJUcBeJoGIHMkIxgFOxTrMvT
         +tL/B4MdXF+xyIqvkQcOtwCTiPYJB9e8Kbw+l9kFdfssBY3Tl291YuCkAFKOpH+vK+IH
         wi4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VSEGNI5x;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-23acb3c4a99si188904555ad.410.2025.07.03.05.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VSEGNI5x;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z89tewoPj7EMabA5/lu/AAJnIjNCMY3CQG8UM5N3cBw=;
	b=VSEGNI5xm0LRaUde1MCfOEHLTPFoTKX7klXFDceJz1Z/n9WeanvAnV2VXufRFLRhSOcj3I
	w/7UqE3Bgsn3g/7f79szG+Lo5dVAZc6YVfomThxtpIRqe7qVWN5jVof972DHcF6iEc2rV6
	e3P/WWL2LXoKPE2fDZTq6eMgYVPMlwQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-VY-9jgAtNfix9CLyWQ3XSA-1; Thu,
 03 Jul 2025 08:37:38 -0400
X-MC-Unique: VY-9jgAtNfix9CLyWQ3XSA-1
X-Mimecast-MFC-AGG-ID: VY-9jgAtNfix9CLyWQ3XSA_1751546256
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20FFB1801210;
	Thu,  3 Jul 2025 12:37:36 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B53CC1803AFF;
	Thu,  3 Jul 2025 12:37:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	Jonathan.Cameron@huawei.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v5 00/36] ACPI PCI Hotplug support on ARM
Date: Thu,  3 Jul 2025 14:35:00 +0200
Message-ID: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: vnnt0rAQAuHy

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
https://github.com/eauger/qemu/tree/arm-acpi-pcihp-v5

previous series:
https://github.com/eauger/qemu/tree/arm-acpi-pcihp-v4

History:
v4 -> v5:
- Collected Jonathan's R-bs (many thanks!)
- fixed the tests/qtest/bios-tables-test issue by
  creating a variant for the viot test
- use the 3 phase reset API
- fixed qom-test failures that were due to unconditionnal
  fetches of the GED property

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


Eric Auger (32):
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
  qtest/bios-tables-test: Prepare for fixing the aarch64 viot test
  qtest/bios-tables-test: Add a variant to the aarch64 viot test
  qtest/bios-tables-test: Generate DSDT.viot
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
  qtest/bios-tables-test: Generate reference blob for
    DSDT.hpoffacpiindex
  qtest/bios-tables-test: Generate reference blob for DSDT.acpipcihp

Gustavo Romero (4):
  tests/qtest/bios-tables-test: Prepare for changes in the DSDT table
  tests/qtest/bios-tables-test: Prepare for changes in the arm virt DSDT
    table
  tests/qtest/bios-tables-test: Prepare for addition of acpi pci hp
    tests
  tests/qtest/bios-tables-test: Add aarch64 ACPI PCI hotplug test

 hw/i386/acpi-build.h                          |   4 -
 include/hw/acpi/generic_event_device.h        |  17 +-
 include/hw/acpi/pci.h                         |   5 +-
 include/hw/acpi/pcihp.h                       |  17 +-
 include/hw/arm/virt.h                         |   1 +
 include/hw/pci-host/gpex.h                    |   1 +
 include/hw/sysbus.h                           |   1 +
 hw/acpi/acpi-pci-hotplug-stub.c               |   2 +-
 hw/acpi/generic_event_device.c                |  77 +++
 hw/acpi/ich9.c                                |   7 +-
 hw/acpi/pci-bridge.c                          |  54 ++
 hw/acpi/pci.c                                 |  50 ++
 hw/acpi/pcihp.c                               | 439 ++++++++++++++-
 hw/acpi/piix4.c                               |   5 +-
 hw/arm/virt-acpi-build.c                      |  38 ++
 hw/arm/virt.c                                 |  27 +-
 hw/core/sysbus.c                              |  11 +
 hw/i386/acpi-build.c                          | 532 +-----------------
 hw/pci-host/gpex-acpi.c                       |  74 +--
 tests/qtest/bios-tables-test.c                |  53 ++
 hw/arm/Kconfig                                |   2 +
 hw/pci-host/Kconfig                           |   1 +
 tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5293 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5379 bytes
 tests/data/acpi/aarch64/virt/DSDT.acpipcihp   | Bin 0 -> 6202 bytes
 .../acpi/aarch64/virt/DSDT.hpoffacpiindex     | Bin 0 -> 5347 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6654 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7768 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5495 bytes
 tests/data/acpi/aarch64/virt/DSDT.viot        | Bin 0 -> 5310 bytes
 tests/data/acpi/riscv64/virt/DSDT             | Bin 3576 -> 3538 bytes
 tests/data/acpi/x86/microvm/DSDT.pcie         | Bin 3023 -> 2985 bytes
 32 files changed, 811 insertions(+), 607 deletions(-)
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.acpipcihp
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.viot

-- 
2.49.0
