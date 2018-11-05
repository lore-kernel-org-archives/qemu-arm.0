Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2029293wro;
        Sun, 4 Nov 2018 17:42:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5cEieh9D7uHLTXRgBDJKGE9ecmooH4LfS4eHOAmFXWxg85Q6vQMaGZCtnfe1f7LZL+1urvP
X-Received: by 2002:a37:2bcf:: with SMTP id r76mr18189784qkr.218.1541382121011;
        Sun, 04 Nov 2018 17:42:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382121; cv=none;
        d=google.com; s=arc-20160816;
        b=Na40pv5EqBQAHL9+IYHxMHpfi4hFJxyIV7NPh9SbkdSi/EbacJTrWoioBAVt73gSXm
         e7uP9f5kk+hXtSFfukAIU8MLkAYNbBOndbTCe3kqiaM34O8OMovQ0IJk6mSSLRRUzSwN
         WO/1GX/axZkrxU4qv0AGZzgj3w+NExuxFNdqoUkIgDqwLuK0V9q3ln4KZ903SoBdEci2
         7pSWlonvgOkzFt+6xrbABzxJPq1XufpMlPdl3tG+bktAMiojX71aM/QwaY7exB65jJqO
         pVFHQegrY6CFLmk8GvLj+7xMKnAdZpqHfqA/Clbb1zKw8xaux9f+hyApawYxtxSARwl+
         xVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=RO80y3JSmDjAMu4JXVQstT/Kp3bSUjh45+ZvLj6Bje8=;
        b=hFiSkmYtR17WnVSwoeGf+ZWNQRMFjwLRw+XHs0iqDpdzTLaQqpeN4Xc9gCFSuU2kjW
         OzS1/XKoFyIxeOrG/jGFstATkNR5Ge5XGJ2C3L9ZNy/MBoA3+DeXaMcqhLrSfLHQRDnQ
         idDwgQec5czl01JhYYdy4+DRq6eYS1svEgCHRriy3rxGFyDLkpE9oHSLLUMzrRfU+FNe
         3DLfMR3WONLTpvxXqBZhWGn7dha8/omHMnLJoPxkJxg+Xzh6fFcQRa5Iyjga2BNhz0Uk
         Al+ZGULbjbHevzzDS6ZeSpGF8YT+jUpmHyjWU0NcL1vgtnZ41oS6VcSCmgtzFkjUS5j0
         2Q8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g10-v6si5013970qtq.103.2018.11.04.17.42.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:42:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJTtw-00061N-Ed
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:42:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTti-0005zg-Ax
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:41:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTth-0000z1-5q
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:41:46 -0500
Received: from mga02.intel.com ([134.134.136.20]:9126)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTta-0000gW-Le; Sun, 04 Nov 2018 20:41:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:41:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074237"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:41:30 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:23 +0100
Message-Id: <20181105014047.26447-1-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-arm] [PATCH v5 00/24] ACPI reorganization for
 hardware-reduced API addition
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kuDBaIkTuaFh

This patch set provides an ACPI code reorganization in preparation for
adding a shared hardware-reduced ACPI API to QEMU.

The changes are coming from the NEMU [1] project where we're defining
a new x86 machine type: i386/virt. This is an EFI only, ACPI
hardware-reduced platform that is built on top of a generic
hardware-reduced ACPI API [2]. This API was initially based off the
generic parts of the arm/virt-acpi-build.c implementation, and the goal
is for both i386/virt and arm/virt to duplicate as little code as
possible by using this new, shared API.

As a preliminary for adding this hardware-reduced ACPI API to QEMU, we did
some ACPI code reorganization with the following goals:

* Share as much as possible of the current ACPI build APIs between
  legacy and hardware-reduced ACPI.
* Share the ACPI build code across machine types and architectures and
  remove the typical PC machine type dependency.

The patches are also available in their own git branch [3].

[1] https://github.com/intel/nemu
[2] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/reduced.c
[3] https://github.com/intel/nemu/tree/topic/upstream/acpi

v1 -> v2:
   * Drop the hardware-reduced implementation for now. Our next patch
   * set
     will add hardware-reduced and convert arm/virt to it.
   * Implement the ACPI build methods as a QOM Interface Class and
   * convert
     the PC machine type to it.
   * acpi_conf_pc_init() uses a PCMachineState pointer and not a
     MachineState one as its argument.

v2 -> v3:
   * Cc all relevant maintainers, no functional changes.

v3 -> v4:
   * Renamed all AcpiConfiguration pointers from conf to acpi_conf.
   * Removed the ACPI_BUILD_ALIGN_SIZE export.
   * Temporarily updated the arm virt build_rsdp() prototype for
     bisectability purposes.
   * Removed unneeded pci headers from acpi-build.c.
   * Refactor the acpi PCI host getter so that it truly is architecture
     agnostic, by carrying the PCI host pointer through the
     AcpiConfiguration structure.
   * Splitted the PCI host AML builder API export patch from the PCI
     host and holes getter one.
   * Reduced the build_srat() export scope to hw/i386 instead of the
     broader hw/acpi. SRAT builders are truly architecture specific
     and can hardly be generalized.
   * Completed the ACPI builder documentation.

v4 -> v5:
   * Reorganize the ACPI RSDP export and XSDT implementation into 3
     patches.
   * Fix the hw/i386/acpi header inclusions.

Samuel Ortiz (16):
  hw: i386: Decouple the ACPI build from the PC machine type
  hw: acpi: Export ACPI build alignment API
  hw: acpi: The RSDP build API can return void
  hw: acpi: Export the RSDP build API
  hw: acpi: Implement XSDT support for RSDP
  hw: acpi: Factorize the RSDP build API implementation
  hw: i386: Move PCI host definitions to pci_host.h
  hw: acpi: Export the PCI host and holes getters
  hw: acpi: Do not create hotplug method when handler is not defined
  hw: i386: Make the hotpluggable memory size property more generic
  hw: i386: Export the i386 ACPI SRAT build method
  hw: i386: Export the MADT build method
  hw: acpi: Define ACPI tables builder interface
  hw: i386: Implement the ACPI builder interface for PC
  hw: pci-host: piix: Return PCI host pointer instead of PCI bus
  hw: i386: Set ACPI configuration PCI host pointer

Sebastien Boeuf (2):
  hw: acpi: Export the PCI hotplug API
  hw: acpi: Retrieve the PCI bus from AcpiPciHpState

Yang Zhong (6):
  hw: acpi: Generalize AML build routines
  hw: acpi: Factorize _OSC AML across architectures
  hw: acpi: Export and generalize the PCI host AML API
  hw: acpi: Export the MCFG getter
  hw: acpi: Fix memory hotplug AML generation error
  hw: i386: Refactor PCI host getter

 hw/i386/acpi-build.h           |    9 +-
 include/hw/acpi/acpi-defs.h    |   14 +
 include/hw/acpi/acpi.h         |   44 ++
 include/hw/acpi/aml-build.h    |   47 ++
 include/hw/acpi/builder.h      |  100 +++
 include/hw/i386/acpi.h         |   28 +
 include/hw/i386/pc.h           |   49 +-
 include/hw/mem/memory-device.h |    2 +
 include/hw/pci/pci_host.h      |    6 +
 hw/acpi/aml-build.c            |  981 +++++++++++++++++++++++++++++
 hw/acpi/builder.c              |   97 +++
 hw/acpi/cpu.c                  |    8 +-
 hw/acpi/cpu_hotplug.c          |    9 +-
 hw/acpi/memory_hotplug.c       |   21 +-
 hw/acpi/pcihp.c                |   10 +-
 hw/arm/virt-acpi-build.c       |   93 +--
 hw/i386/acpi-build.c           | 1072 +++-----------------------------
 hw/i386/pc.c                   |  198 +++---
 hw/i386/pc_piix.c              |   36 +-
 hw/i386/pc_q35.c               |   22 +-
 hw/i386/xen/xen-hvm.c          |   19 +-
 hw/pci-host/piix.c             |   32 +-
 stubs/pci-host-piix.c          |    6 -
 hw/acpi/Makefile.objs          |    1 +
 stubs/Makefile.objs            |    1 -
 25 files changed, 1644 insertions(+), 1261 deletions(-)
 create mode 100644 include/hw/acpi/builder.h
 create mode 100644 include/hw/i386/acpi.h
 create mode 100644 hw/acpi/builder.c
 delete mode 100644 stubs/pci-host-piix.c

-- 
2.19.1

