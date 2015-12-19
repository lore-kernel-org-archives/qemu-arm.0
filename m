Received: by 10.182.158.201 with SMTP id ww9csp1881983obb;
        Sat, 19 Dec 2015 12:38:54 -0800 (PST)
X-Received: by 10.140.133.144 with SMTP id 138mr15656399qhf.0.1450557534535;
        Sat, 19 Dec 2015 12:38:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y128si22679929qka.62.2015.12.19.12.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 12:38:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAOHG-0003Kr-8s
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 15:38:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aAOHD-0003Kj-IW
	for qemu-arm@nongnu.org; Sat, 19 Dec 2015 15:38:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aAOHA-0003eU-A2
	for qemu-arm@nongnu.org; Sat, 19 Dec 2015 15:38:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37655)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aAOHA-0003eP-2p; Sat, 19 Dec 2015 15:38:48 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 8696BA8B;
	Sat, 19 Dec 2015 20:38:46 +0000 (UTC)
Received: from redhat.com (vpn1-5-67.ams2.redhat.com [10.36.5.67])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id tBJKcgwk029048; Sat, 19 Dec 2015 15:38:43 -0500
Date: Sat, 19 Dec 2015 22:38:41 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20151219203841.GC25389@redhat.com>
References: <1449704528-289297-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449704528-289297-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH 00/74] pc: acpi: convert DSDT to AML API and
 drop ASL templates support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3+D2mwIQy76q

On Thu, Dec 10, 2015 at 12:40:54AM +0100, Igor Mammedov wrote:
> Due to huge size, CCing only cover letter instead of individual patches.
> 
> Series consist of 2 parts the 1st part prefixed 'acpi:' adds necessary
> AML API functions and the second part converts DSDT using existing and
> new AML API.
> 
> Series does exact byte by byte conversion and passes ACPI tables
> 'make check' tests.
> The conversion first moves common for PIIX4/Q35 parts, getting rid of *.dsl
> includes and then converts PIIX4 and Q35 parts of DSDT.
> 
> Diff-stat looks nice but actual code base is reduced by ~2000LOC
> while the rest of 10000 removals is dropping precompiled AML
> templates from tree.
> 
> There are some AML parts that could be optimized/simplified and shared
> between PIIX4/Q35/ARM but doing it will break exact match with original
> tests, hence it's left out of the scope of this series.
> 
> CC: "Michael S. Tsirkin" <mst@redhat.com> (supporter:ACPI/SMBIOS)
> CC: Shannon Zhao <zhaoshenglong@huawei.com> (maintainer:ARM ACPI Subsystem)
> CC: Peter Maydell <peter.maydell@linaro.org> (maintainer:ARM)
> CC: Paolo Bonzini <pbonzini@redhat.com> (maintainer:X86)
> CC: Richard Henderson <rth@twiddle.net> (maintainer:X86)
> CC: Eduardo Habkost <ehabkost@redhat.com> (maintainer:X86)
> CC: qemu-arm@nongnu.org (open list:ARM ACPI Subsystem)

I think this is a nice series, and I think we can live with the fact
make check warns in the middle.

I sent some comments I'd like to see addressed.

Main points
	- one v2 patch seems garbled
	- please don't create functions with tons of parameters
	  which just do if (a) on each of these internally.
	  instead, move common code into a small function that
	  can be reused without so many conditionals.
	- I really dislike local variables starting with a_ for
	  no good reason.

Thanks!

> Igor Mammedov (70):
>   tests: acpi: print ASL diff in verbose mode
>   acpi: add aml_lgreater_equal()
>   acpi: add aml_create_qword_field()
>   acpi: aml: add helper for Opcode Arg2 Arg2 [Dst] AML pattern
>   acpi: extend aml_add() to accept target argument
>   acpi: add aml_decrement() and aml_subtract()
>   acpi: add aml_call0() helper
>   acpi: add aml_to_integer()
>   acpi: extend aml_shiftright() to accept target argument
>   acpi: add aml_alias()
>   acpi: add aml_sleep()
>   acpi: add aml_lor()
>   acpi: add aml_lgreater()
>   acpi: extend aml_field() to support LockRule
>   acpi: add aml_to_hexstring()
>   acpi: add aml_to_buffer()
>   acpi add aml_dma()
>   acpi: extend aml_or() to accept target argument
>   acpi: extend aml_and() to accept target argument
>   acpi: extend aml_interrupt() to support multiple irqs
>   pc: acpi: memhp: prepare context in SSDT for moving memhp DSDT code
>   pc: acpi: memhp: move MHPD._STA method into SSDT
>   pc: acpi: memhp: move MHPD.MLCK mutex into SSDT
>   pc: acpi: memhp: move MHPD.MSCN method into SSDT
>   pc: acpi: memhp: move MHPD.MRST method into SSDT
>   pc: acpi: memhp: move MHPD.MPXM method into SSDT
>   pc: acpi: memhp: move MHPD.MOST method into SSDT
>   pc: acpi: memhp: move MHPD.MEJ0 method into SSDT
>   pc: acpi: memhp: move MHPD.MCRS method into SSDT
>   pc: acpi: memhp: move MHPD Device into SSDT
>   pc: acpi: factor out memhp code from build_ssdt() into separate
>     function
>   pc: acpi: memhp: move \_GPE._E03 into SSDT
>   pc: acpi: memhp: drop not needed stringify(MEMORY_foo) usage
>   pc: acpi: drop unused CPU_STATUS_LEN from DSDT
>   pc: acpi: cpuhp: move CPEJ() method to SSDT
>   pc: acpi: cpuhp: move CPMA() method into SSDT
>   pc: acpi: cpuhp: move CPST() method into SSDT
>   pc: acpi: cpuhp: move PRSC() method into SSDT
>   pc: acpi: cpuhp: move \_GPE._E02() into SSDT
>   pc: acpi: factor out cpu hotplug code from build_ssdt() into separate
>     function
>   pc: acpi: move HPET from DSDT to SSDT
>   pc: acpi: move DBUG() from DSDT to SSDT
>   pc: acpi: move RTC device from DSDT to SSDT
>   pc: acpi: move KBD device from DSDT to SSDT
>   pc: acpi: move MOU device from DSDT to SSDT
>   pc: acpi: move FDC0 device from DSDT to SSDT
>   pc: acpi: move LPT device from DSDT to SSDT
>   pc: acpi: move COM devices from DSDT to SSDT
>   pc: acpi: move PIIX4 isa-bridge and pm devices into SSDT
>   pc: acpi: move remaining GPE handlers into SSDT
>   pc: acpi: pci: move link devices into SSDT
>   pc: acpi: piix4: move IQCR() into SSDT
>   pc: acpi: piix4: move IQST() into SSDT
>   pc: acpi: piix4: move PCI0._PRT() into SSDT
>   pc: acpi: piix4: move remaining PCI hotplug bits into SSDT
>   pc: acpi: piix4: acpi move PCI0 device to SSDT
>   pc: acpi: q35: move GSI links to SSDT
>   pc: acpi: q35: move link devices to SSDT
>   pc: acpi: q35: move IQCR() into SSDT
>   pc: acpi: q35: move IQST() into SSDT
>   pc: acpi: q35: move ISA bridge into SSDT
>   pc: acpi: q35: move _PRT() into SSDT
>   pc: acpi: q35: move PRTA routing table into SSDT
>   pc: acpi: q35: move PRTP routing table into SSDT
>   pc: acpi: q35: move _PIC() method into SSDT
>   pc: acpi: q35: move PCI0._OSC() method into SSDT
>   pc: acpi: q35: move PCI0 device definition into SSDT
>   pc: acpi: q35: PCST, PCSB opregions and PCIB field into SSDT
>   pc: acpi: switch to AML API composed DSDT
>   pc: acpi: remove unused ASL templates and related blobs/utils
> 
> Xiao Guangrong (4):
>   acpi: add aml_derefof
>   acpi: add aml_sizeof
>   acpi: add aml_mutex(), aml_acquire(), aml_release()
>   acpi: support serialized method
> 
>  hw/acpi/Makefile.objs               |    4 +-
>  hw/acpi/aml-build.c                 |  294 +-
>  hw/acpi/cpu_hotplug_acpi_table.c    |  124 +
>  hw/acpi/memory_hotplug_acpi_table.c |  249 ++
>  hw/arm/virt-acpi-build.c            |   41 +-
>  hw/i386/Makefile.objs               |   31 +-
>  hw/i386/acpi-build.c                | 1329 ++++--
>  hw/i386/acpi-dsdt-cpu-hotplug.dsl   |   90 -
>  hw/i386/acpi-dsdt-dbug.dsl          |   41 -
>  hw/i386/acpi-dsdt-hpet.dsl          |   48 -
>  hw/i386/acpi-dsdt-isa.dsl           |  117 -
>  hw/i386/acpi-dsdt-mem-hotplug.dsl   |  171 -
>  hw/i386/acpi-dsdt.dsl               |  303 --
>  hw/i386/acpi-dsdt.hex.generated     | 2972 --------------
>  hw/i386/q35-acpi-dsdt.dsl           |  436 --
>  hw/i386/q35-acpi-dsdt.hex.generated | 7610 -----------------------------------
>  hw/timer/hpet.c                     |    2 +-
>  include/hw/acpi/aml-build.h         |   66 +-
>  include/hw/acpi/cpu_hotplug.h       |   10 +
>  include/hw/acpi/memory_hotplug.h    |    9 +
>  include/hw/acpi/pc-hotplug.h        |   44 +-
>  include/hw/timer/hpet.h             |    1 +
>  scripts/acpi_extract.py             |  367 --
>  scripts/acpi_extract_preprocess.py  |   51 -
>  scripts/update-acpi.sh              |    4 -
>  tests/bios-tables-test.c            |    7 +
>  26 files changed, 1848 insertions(+), 12573 deletions(-)
>  create mode 100644 hw/acpi/cpu_hotplug_acpi_table.c
>  create mode 100644 hw/acpi/memory_hotplug_acpi_table.c
>  delete mode 100644 hw/i386/acpi-dsdt-cpu-hotplug.dsl
>  delete mode 100644 hw/i386/acpi-dsdt-dbug.dsl
>  delete mode 100644 hw/i386/acpi-dsdt-hpet.dsl
>  delete mode 100644 hw/i386/acpi-dsdt-isa.dsl
>  delete mode 100644 hw/i386/acpi-dsdt-mem-hotplug.dsl
>  delete mode 100644 hw/i386/acpi-dsdt.dsl
>  delete mode 100644 hw/i386/acpi-dsdt.hex.generated
>  delete mode 100644 hw/i386/q35-acpi-dsdt.dsl
>  delete mode 100644 hw/i386/q35-acpi-dsdt.hex.generated
>  delete mode 100755 scripts/acpi_extract.py
>  delete mode 100755 scripts/acpi_extract_preprocess.py
>  delete mode 100644 scripts/update-acpi.sh
> 
> -- 
> 1.8.3.1
> 
