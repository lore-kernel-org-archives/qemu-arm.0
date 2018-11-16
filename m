Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp587293wrw;
        Fri, 16 Nov 2018 08:29:38 -0800 (PST)
X-Google-Smtp-Source: AJdET5c/GMfbDfqvyOorBc7OX69t09xfVQLNJtWzCw2LZlNzaXR2Wv41EwiyizgimWyXbmVuaxZb
X-Received: by 2002:ac8:5509:: with SMTP id j9mr10413443qtq.287.1542385777979;
        Fri, 16 Nov 2018 08:29:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542385777; cv=none;
        d=google.com; s=arc-20160816;
        b=Lay7VOPchb2gMzihPJAzyzB6togcHzvaTDH2Ry6danf/op6fWpDCsG5LZKgO4/MXQI
         /iZZm4s8LQbe/P1oas3tkOyO99J18ZZXYG3mB1VbD+TUg2gT6htR+QeV7sGU8ut4bFdn
         iUKFbZo6eJHIziPE5vat0KaSZkF/41GjTIGItzvRI0Hw+Z5lL3BaRqt0hJ05xrAkvCCY
         ImhS4arHebou1IY49eB0CuVfn53zwhJhoyNvJzOXae8+Gr5ywo/MDXPSZfsBFh7k1nc4
         J4zd6SPqXYciQcJfC0PYQ1L3gDtkXZV+zUpMqMK2JZlbdVLlBcq8m+cOUh10dEANEtNz
         XphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=cX2re8ICMgQ9/nt/sVFiSWqV1LuKqP1Laf2uOFTnkQc=;
        b=pNyOQ5ebiXwiKkyFlTKPKLvyV2sxZbk1PpsVug879kBtRo3naMSpo7S9crIwXqE23m
         2jTH+xCubFqnmPJoYrNz3jNNtoUfk7pR7XuK5n6d1rQI/mV9iUBE4sZfdbHQyw7jzY1T
         EQUFz5VQ2OQH86ppetb/Jf1lgwJJwec/lHTd3WwXn15xzxrQQugcx7fQrGDpk8AnVKdY
         c5vAa6DlD5SBrog59sClx7YUmOQQpgZ0DHY3O0euMDuRy6AN5Rlr4qwIS76n5n37ZchL
         8rG4XxpwLhS7ja+6eCYIYhUECtphMZuwePtdq9q34z1MpQ9K0ku8vCjig6mLERgu6STx
         OQbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17si157671qvn.203.2018.11.16.08.29.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 08:29:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNgzx-0000v2-EN
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 11:29:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNgzq-0000ul-Jt
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 11:29:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gNgzm-0003cD-Sd
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 11:29:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38738)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gNgzm-0003bp-KE; Fri, 16 Nov 2018 11:29:26 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A41AB30012DF;
	Fri, 16 Nov 2018 16:29:25 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 329B9600C2;
	Fri, 16 Nov 2018 16:29:21 +0000 (UTC)
Date: Fri, 16 Nov 2018 17:29:19 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181116172919.43f3e27d@redhat.com>
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 16 Nov 2018 16:29:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 00/24] ACPI reorganization
 for hardware-reduced API addition
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t+3QOrhYf12l

On Mon,  5 Nov 2018 02:40:23 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> This patch set provides an ACPI code reorganization in preparation for
> adding a shared hardware-reduced ACPI API to QEMU.
> 
> The changes are coming from the NEMU [1] project where we're defining
> a new x86 machine type: i386/virt. This is an EFI only, ACPI
> hardware-reduced platform that is built on top of a generic
> hardware-reduced ACPI API [2]. This API was initially based off the
> generic parts of the arm/virt-acpi-build.c implementation, and the goal
> is for both i386/virt and arm/virt to duplicate as little code as
> possible by using this new, shared API.
> 
> As a preliminary for adding this hardware-reduced ACPI API to QEMU, we did
> some ACPI code reorganization with the following goals:
> 
> * Share as much as possible of the current ACPI build APIs between
>   legacy and hardware-reduced ACPI.
> * Share the ACPI build code across machine types and architectures and
>   remove the typical PC machine type dependency.
> 
> The patches are also available in their own git branch [3].
I think, I'm done with reviewing this patchset, to sum up
thanks for trying generalize acpi parts. It is implemented not
exactly generic way and patches aren't split perfectly but
we can work on it.

General suggestions for this series:
  1. Preferably don't do multiple changes within a patch
     neither post huge patches (unless it's pure code movement).
     (it's easy to squash patches later it necessary)
  2. Start small, pick a table generalize it and send as
     one small patchset. Tables are often independent
     and it's much easier on both author/reviewer to agree upon
     changes and rewrite it if necessary.
  3. when you think about refactoring acpi into a generic API
     think about it as routines that go into a separate library
     (pure acpi spec code) and qemu/acpi glue routines and
      divide them correspondingly.

> [1] https://github.com/intel/nemu
> [2] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/reduced.c
> [3] https://github.com/intel/nemu/tree/topic/upstream/acpi
> 
> v1 -> v2:
>    * Drop the hardware-reduced implementation for now. Our next patch
>    * set
>      will add hardware-reduced and convert arm/virt to it.
>    * Implement the ACPI build methods as a QOM Interface Class and
>    * convert
>      the PC machine type to it.
>    * acpi_conf_pc_init() uses a PCMachineState pointer and not a
>      MachineState one as its argument.
> 
> v2 -> v3:
>    * Cc all relevant maintainers, no functional changes.
> 
> v3 -> v4:
>    * Renamed all AcpiConfiguration pointers from conf to acpi_conf.
>    * Removed the ACPI_BUILD_ALIGN_SIZE export.
>    * Temporarily updated the arm virt build_rsdp() prototype for
>      bisectability purposes.
>    * Removed unneeded pci headers from acpi-build.c.
>    * Refactor the acpi PCI host getter so that it truly is architecture
>      agnostic, by carrying the PCI host pointer through the
>      AcpiConfiguration structure.
>    * Splitted the PCI host AML builder API export patch from the PCI
>      host and holes getter one.
>    * Reduced the build_srat() export scope to hw/i386 instead of the
>      broader hw/acpi. SRAT builders are truly architecture specific
>      and can hardly be generalized.
>    * Completed the ACPI builder documentation.
> 
> v4 -> v5:
>    * Reorganize the ACPI RSDP export and XSDT implementation into 3
>      patches.
>    * Fix the hw/i386/acpi header inclusions.
> 
> Samuel Ortiz (16):
>   hw: i386: Decouple the ACPI build from the PC machine type
>   hw: acpi: Export ACPI build alignment API
>   hw: acpi: The RSDP build API can return void
>   hw: acpi: Export the RSDP build API
>   hw: acpi: Implement XSDT support for RSDP
>   hw: acpi: Factorize the RSDP build API implementation
>   hw: i386: Move PCI host definitions to pci_host.h
>   hw: acpi: Export the PCI host and holes getters
>   hw: acpi: Do not create hotplug method when handler is not defined
>   hw: i386: Make the hotpluggable memory size property more generic
>   hw: i386: Export the i386 ACPI SRAT build method
>   hw: i386: Export the MADT build method
>   hw: acpi: Define ACPI tables builder interface
>   hw: i386: Implement the ACPI builder interface for PC
>   hw: pci-host: piix: Return PCI host pointer instead of PCI bus
>   hw: i386: Set ACPI configuration PCI host pointer
> 
> Sebastien Boeuf (2):
>   hw: acpi: Export the PCI hotplug API
>   hw: acpi: Retrieve the PCI bus from AcpiPciHpState
> 
> Yang Zhong (6):
>   hw: acpi: Generalize AML build routines
>   hw: acpi: Factorize _OSC AML across architectures
>   hw: acpi: Export and generalize the PCI host AML API
>   hw: acpi: Export the MCFG getter
>   hw: acpi: Fix memory hotplug AML generation error
>   hw: i386: Refactor PCI host getter
> 
>  hw/i386/acpi-build.h           |    9 +-
>  include/hw/acpi/acpi-defs.h    |   14 +
>  include/hw/acpi/acpi.h         |   44 ++
>  include/hw/acpi/aml-build.h    |   47 ++
>  include/hw/acpi/builder.h      |  100 +++
>  include/hw/i386/acpi.h         |   28 +
>  include/hw/i386/pc.h           |   49 +-
>  include/hw/mem/memory-device.h |    2 +
>  include/hw/pci/pci_host.h      |    6 +
>  hw/acpi/aml-build.c            |  981 +++++++++++++++++++++++++++++
>  hw/acpi/builder.c              |   97 +++
>  hw/acpi/cpu.c                  |    8 +-
>  hw/acpi/cpu_hotplug.c          |    9 +-
>  hw/acpi/memory_hotplug.c       |   21 +-
>  hw/acpi/pcihp.c                |   10 +-
>  hw/arm/virt-acpi-build.c       |   93 +--
>  hw/i386/acpi-build.c           | 1072 +++-----------------------------
>  hw/i386/pc.c                   |  198 +++---
>  hw/i386/pc_piix.c              |   36 +-
>  hw/i386/pc_q35.c               |   22 +-
>  hw/i386/xen/xen-hvm.c          |   19 +-
>  hw/pci-host/piix.c             |   32 +-
>  stubs/pci-host-piix.c          |    6 -
>  hw/acpi/Makefile.objs          |    1 +
>  stubs/Makefile.objs            |    1 -
>  25 files changed, 1644 insertions(+), 1261 deletions(-)
>  create mode 100644 include/hw/acpi/builder.h
>  create mode 100644 include/hw/i386/acpi.h
>  create mode 100644 hw/acpi/builder.c
>  delete mode 100644 stubs/pci-host-piix.c
> 

