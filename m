Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1740708njc;
        Mon, 16 Jun 2025 02:49:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+UHlgYqrkZa6xy52CJTBiIuVszwE9t3kIUIHfkGQx40G52vLDWnOc/PRTyIvBV8rSyQJUxuWGQN92CA==@linaro.org
X-Google-Smtp-Source: AGHT+IGRqT3dnPuu/znwxsS7m0YS2FHg7tZbMNpkofLz6dBpRWmV7zJifQS+lgPI62axh/qFwhfl
X-Received: by 2002:a17:903:9c4:b0:236:6f5f:caa9 with SMTP id d9443c01a7336-2366f5fcdc0mr81393575ad.32.1750067362994;
        Mon, 16 Jun 2025 02:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067362; cv=none;
        d=google.com; s=arc-20240605;
        b=DOgJQaZohYO6CJG2IQ29HHNpDk9wogSGqfhdfcu4gZOL0f02VS9bh0X/y4JqGaap1B
         oGtOl14tQ0TZiD03XNW9t59K8lH88wy/vGMl6EhPTgrbmmg1fT+493WM7ocxclDRRS1A
         VfBHC4Vq+r1A8TAPp9ZGLUt7/zqFeh5ZCA/qXg7HRHvszZDHwXkHuIlMlmR8pPxlPHa/
         2r8kJj1foOoA/f68Ed8AkxP1yy62kvI/+fD+eXy9+2PqNHx57dyTCOR/v9FrcG3CNJgL
         CzG4FRNmryQgCPRb5xZItmMrM7NGAXmBM9OMO2YtruQXzUvkvLcQ55qhJNqVyyD3V4Z6
         TKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=4soGpEju/KcWgIUqwYQeUC1luRWZueLbuk+rtmDw/t4=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=VgTo85ImIEGyE7tp0EzXdYMBmkyBQ4HUsJ74AmID3xYe7rARRD4GRGYcaLBZqvEqPJ
         4Bus+bOBGuTkz3rPAYLPG4M2b/7ec4vxl0XeOYFfnFYWIFyh0+gYqjonKKSGRp7SqFA+
         wCBd1J4n3POF6Q6QDRI34ZbTGAN4lWZwmUSuUWBDzIl3nLx8uTWfMl3eYh5sDdMomn/g
         TCotuQUA0lg9y4B0QKg8hEhnL9pJeJ7mdG2fOnB1jQjdzk3Q6xYfKvB5knz1IgaOQ7fE
         +JhikM4/0R7qQ7RO9/YsKuCMPF42IkERCGxgtWGkZHkVO6RpUs4rQruPSGdc1Z2p5scy
         j+gQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cAceUYl0;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-2365d8aa7bdsi98963495ad.131.2025.06.16.02.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:49:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cAceUYl0;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4soGpEju/KcWgIUqwYQeUC1luRWZueLbuk+rtmDw/t4=;
	b=cAceUYl0D1Jp7r+ckBuJBZM+EN0mlae4lVZsozL3DY/lmvf3eQtTP0yvBRZOt/CczR6p3I
	nxTZU5y3BHHEW0pCPYvRF0ruMiWPJXMkKFrdX5dNbxZfytMEww/pkY9BwRY3U6EFmRIKzu
	6d6J8jd1EvbLWWxS/U1uZHUYuhiXWGk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-28-ZRFW44EDN0a48LD3JfmVMA-1; Mon,
 16 Jun 2025 05:49:17 -0400
X-MC-Unique: ZRFW44EDN0a48LD3JfmVMA-1
X-Mimecast-MFC-AGG-ID: ZRFW44EDN0a48LD3JfmVMA_1750067355
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 090A319560B5;
	Mon, 16 Jun 2025 09:49:15 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 03ADB19560A3;
	Mon, 16 Jun 2025 09:49:09 +0000 (UTC)
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
Subject: [PATCH v3 00/29] ACPI PCI Hotplug support on ARM
Date: Mon, 16 Jun 2025 11:46:29 +0200
Message-ID: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 5iGPzn7lvGdz

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
https://github.com/eauger/qemu/tree/arm-acpi-pcihp-v3

previous series:
https://github.com/eauger/qemu/tree/arm-acpi-pcihp-v2

History:
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


Eric Auger (25):
  hw/i386/acpi-build: Make aml_pci_device_dsm() static
  hw/acpi/ged: Add a acpi-pci-hotplug-with-bridge-support property
  hw/acpi: Rename and move build_x86_acpi_pci_hotplug to pcihp
  hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to
    acpi_dsdt_add_pci_osc
  hw/pci-host/gpex-acpi: Split host bridge OSC and DSM generation
  hw/pci-host/gpex-acpi: retrieve and use GED acpi_pcihp setting
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
  hw/arm/virt-acpi-build: Modify the DSDT ACPI table to enable ACPI PCI
    hotplug
  hw/acpi/ged: Add a bus link property
  hw/arm/virt: Pass the bus on the ged creation
  hw/acpi/ged: Prepare the device to react to PCI hotplug events
  hw/acpi/ged: Call pcihp plug callbacks in hotplug handler
    implementation
  hw/acpi/ged: Support migration of AcpiPciHpState
  hw/core/sysbus: Introduce sysbus_mmio_map_name() helper
  hw/arm/virt: Use a SysBusDevice variable in create_acpi_ged()
  hw/arm/virt: Let virt support pci hotplug/unplug GED event
  hw/arm/virt: Plug pcihp hotplug/hotunplug callbacks

Gustavo Romero (4):
  tests/qtest/bios-tables-test: Prepare for changes in the DSDT table
  tests/qtest/bios-tables-test: Prepare for addition of acpi pci hp
    tests
  tests/qtest/bios-tables-test: Add aarch64 ACPI PCI hotplug test
  qtest/bios-tables-test: Create DSDT 'acpipcihp" variant blob

 hw/i386/acpi-build.h                          |   4 -
 include/hw/acpi/generic_event_device.h        |   7 +
 include/hw/acpi/pci.h                         |   5 +-
 include/hw/acpi/pcihp.h                       |  17 +-
 include/hw/arm/virt.h                         |   1 +
 include/hw/pci-host/gpex.h                    |   1 +
 include/hw/sysbus.h                           |   1 +
 hw/acpi/generic_event_device.c                |  68 +++
 hw/acpi/pci-bridge.c                          |  54 ++
 hw/acpi/pci.c                                 |  50 ++
 hw/acpi/pcihp.c                               | 435 ++++++++++++++-
 hw/arm/virt-acpi-build.c                      |  27 +
 hw/arm/virt.c                                 | 100 +++-
 hw/core/sysbus.c                              |  11 +
 hw/i386/acpi-build.c                          | 528 +-----------------
 hw/pci-host/gpex-acpi.c                       |  74 +--
 tests/qtest/bios-tables-test.c                |  34 ++
 hw/arm/Kconfig                                |   2 +
 tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5158 bytes
 .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5244 bytes
 tests/data/acpi/aarch64/virt/DSDT.acpipcihp   | Bin 0 -> 5973 bytes
 tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6519 bytes
 tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7603 bytes
 tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5360 bytes
 tests/data/acpi/x86/microvm/DSDT.pcie         | Bin 3023 -> 2985 bytes
 25 files changed, 817 insertions(+), 602 deletions(-)
 create mode 100644 tests/data/acpi/aarch64/virt/DSDT.acpipcihp

-- 
2.49.0
