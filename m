Received: by 10.182.158.201 with SMTP id ww9csp570343obb;
        Thu, 10 Dec 2015 07:54:17 -0800 (PST)
X-Received: by 10.140.168.8 with SMTP id o8mr7666670qho.28.1449762857012;
        Thu, 10 Dec 2015 07:54:17 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b79si15365537qga.92.2015.12.10.07.54.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 07:54:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a73Xs-0005BV-Qe
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 10:54:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1a73XO-0004u7-A5
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 10:53:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1a73XI-0005P0-2W
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 10:53:46 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:36431)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>)
	id 1a73XC-0005M6-UH; Thu, 10 Dec 2015 10:53:35 -0500
Received: by mail-wm0-x234.google.com with SMTP id w144so29753365wmw.1;
	Thu, 10 Dec 2015 07:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=reply-to:subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ISOn1YcoPJmEhOq6AUldDRnn1/Z2rBu4jmZa05aJHFI=;
	b=g564fvr88pbBkf3Go+VID32llvA4uGT6a4f1VfwPE5F+Ri/PO536Q2oMoPov15Bdnn
	vhz+x7/FjppMs57nD2Z5CsO/hu6MwkekvljI8P2JXdx1Vq8eoDMALLtHpozxddWtdDlc
	K7t2I96sWH1TXTjGnmRsXBTEKlanDjdHHFutTJTDwj1pJtcROxs13EoHCaXialgjKfXW
	xZySUH8L0MhDBHzDQZcJhAZAMMRPtqalmRpZ4rUsqcuLzOBxBVzdGCF5HBf7x1nRbvjP
	rD9se8DyMY3xIMURPgtxpCEqKr9cpomeWwBGwK2F1ELg/w673ymrnyWxmufs4nJkW48d
	6M9A==
X-Received: by 10.28.229.65 with SMTP id c62mr18107929wmh.25.1449762814167;
	Thu, 10 Dec 2015 07:53:34 -0800 (PST)
Received: from [192.168.1.115] ([46.120.6.143])
	by smtp.googlemail.com with ESMTPSA id
	c13sm1395613wmd.14.2015.12.10.07.53.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Dec 2015 07:53:33 -0800 (PST)
References: <1449704528-289297-1-git-send-email-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <56699FFB.3090208@gmail.com>
Date: Thu, 10 Dec 2015 17:53:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1449704528-289297-1-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH 00/74] pc: acpi: convert DSDT to AML API
 and drop ASL templates support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: marcel@redhat.com
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xlzxBpkmYJzA

On 12/10/2015 01:40 AM, Igor Mammedov wrote:
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


Hi Igor,
Please consider splinting this series...

Maybe ACPI new constructs first, then memhp/cpu, piix/q35. (only a suggestion)
In this you will have some "sane" 20 something patches series that
can be more easily "swallowed".

Thanks,
Marcel

>
> CC: "Michael S. Tsirkin" <mst@redhat.com> (supporter:ACPI/SMBIOS)
> CC: Shannon Zhao <zhaoshenglong@huawei.com> (maintainer:ARM ACPI Subsystem)
> CC: Peter Maydell <peter.maydell@linaro.org> (maintainer:ARM)
> CC: Paolo Bonzini <pbonzini@redhat.com> (maintainer:X86)
> CC: Richard Henderson <rth@twiddle.net> (maintainer:X86)
> CC: Eduardo Habkost <ehabkost@redhat.com> (maintainer:X86)
> CC: qemu-arm@nongnu.org (open list:ARM ACPI Subsystem)
>
> Igor Mammedov (70):
>    tests: acpi: print ASL diff in verbose mode
>    acpi: add aml_lgreater_equal()
>    acpi: add aml_create_qword_field()
>    acpi: aml: add helper for Opcode Arg2 Arg2 [Dst] AML pattern
>    acpi: extend aml_add() to accept target argument
>    acpi: add aml_decrement() and aml_subtract()
>    acpi: add aml_call0() helper
>    acpi: add aml_to_integer()
>    acpi: extend aml_shiftright() to accept target argument
>    acpi: add aml_alias()
>    acpi: add aml_sleep()
>    acpi: add aml_lor()
>    acpi: add aml_lgreater()
>    acpi: extend aml_field() to support LockRule
>    acpi: add aml_to_hexstring()
>    acpi: add aml_to_buffer()
>    acpi add aml_dma()
>    acpi: extend aml_or() to accept target argument
>    acpi: extend aml_and() to accept target argument
>    acpi: extend aml_interrupt() to support multiple irqs
>    pc: acpi: memhp: prepare context in SSDT for moving memhp DSDT code
>    pc: acpi: memhp: move MHPD._STA method into SSDT
>    pc: acpi: memhp: move MHPD.MLCK mutex into SSDT
>    pc: acpi: memhp: move MHPD.MSCN method into SSDT
>    pc: acpi: memhp: move MHPD.MRST method into SSDT
>    pc: acpi: memhp: move MHPD.MPXM method into SSDT
>    pc: acpi: memhp: move MHPD.MOST method into SSDT
>    pc: acpi: memhp: move MHPD.MEJ0 method into SSDT
>    pc: acpi: memhp: move MHPD.MCRS method into SSDT
>    pc: acpi: memhp: move MHPD Device into SSDT
>    pc: acpi: factor out memhp code from build_ssdt() into separate
>      function
>    pc: acpi: memhp: move \_GPE._E03 into SSDT
>    pc: acpi: memhp: drop not needed stringify(MEMORY_foo) usage
>    pc: acpi: drop unused CPU_STATUS_LEN from DSDT
>    pc: acpi: cpuhp: move CPEJ() method to SSDT
>    pc: acpi: cpuhp: move CPMA() method into SSDT
>    pc: acpi: cpuhp: move CPST() method into SSDT
>    pc: acpi: cpuhp: move PRSC() method into SSDT
>    pc: acpi: cpuhp: move \_GPE._E02() into SSDT
>    pc: acpi: factor out cpu hotplug code from build_ssdt() into separate
>      function
>    pc: acpi: move HPET from DSDT to SSDT
>    pc: acpi: move DBUG() from DSDT to SSDT
>    pc: acpi: move RTC device from DSDT to SSDT
>    pc: acpi: move KBD device from DSDT to SSDT
>    pc: acpi: move MOU device from DSDT to SSDT
>    pc: acpi: move FDC0 device from DSDT to SSDT
>    pc: acpi: move LPT device from DSDT to SSDT
>    pc: acpi: move COM devices from DSDT to SSDT
>    pc: acpi: move PIIX4 isa-bridge and pm devices into SSDT
>    pc: acpi: move remaining GPE handlers into SSDT
>    pc: acpi: pci: move link devices into SSDT
>    pc: acpi: piix4: move IQCR() into SSDT
>    pc: acpi: piix4: move IQST() into SSDT
>    pc: acpi: piix4: move PCI0._PRT() into SSDT
>    pc: acpi: piix4: move remaining PCI hotplug bits into SSDT
>    pc: acpi: piix4: acpi move PCI0 device to SSDT
>    pc: acpi: q35: move GSI links to SSDT
>    pc: acpi: q35: move link devices to SSDT
>    pc: acpi: q35: move IQCR() into SSDT
>    pc: acpi: q35: move IQST() into SSDT
>    pc: acpi: q35: move ISA bridge into SSDT
>    pc: acpi: q35: move _PRT() into SSDT
>    pc: acpi: q35: move PRTA routing table into SSDT
>    pc: acpi: q35: move PRTP routing table into SSDT
>    pc: acpi: q35: move _PIC() method into SSDT
>    pc: acpi: q35: move PCI0._OSC() method into SSDT
>    pc: acpi: q35: move PCI0 device definition into SSDT
>    pc: acpi: q35: PCST, PCSB opregions and PCIB field into SSDT
>    pc: acpi: switch to AML API composed DSDT
>    pc: acpi: remove unused ASL templates and related blobs/utils
>
> Xiao Guangrong (4):
>    acpi: add aml_derefof
>    acpi: add aml_sizeof
>    acpi: add aml_mutex(), aml_acquire(), aml_release()
>    acpi: support serialized method
>
>   hw/acpi/Makefile.objs               |    4 +-
>   hw/acpi/aml-build.c                 |  294 +-
>   hw/acpi/cpu_hotplug_acpi_table.c    |  124 +
>   hw/acpi/memory_hotplug_acpi_table.c |  249 ++
>   hw/arm/virt-acpi-build.c            |   41 +-
>   hw/i386/Makefile.objs               |   31 +-
>   hw/i386/acpi-build.c                | 1329 ++++--
>   hw/i386/acpi-dsdt-cpu-hotplug.dsl   |   90 -
>   hw/i386/acpi-dsdt-dbug.dsl          |   41 -
>   hw/i386/acpi-dsdt-hpet.dsl          |   48 -
>   hw/i386/acpi-dsdt-isa.dsl           |  117 -
>   hw/i386/acpi-dsdt-mem-hotplug.dsl   |  171 -
>   hw/i386/acpi-dsdt.dsl               |  303 --
>   hw/i386/acpi-dsdt.hex.generated     | 2972 --------------
>   hw/i386/q35-acpi-dsdt.dsl           |  436 --
>   hw/i386/q35-acpi-dsdt.hex.generated | 7610 -----------------------------------
>   hw/timer/hpet.c                     |    2 +-
>   include/hw/acpi/aml-build.h         |   66 +-
>   include/hw/acpi/cpu_hotplug.h       |   10 +
>   include/hw/acpi/memory_hotplug.h    |    9 +
>   include/hw/acpi/pc-hotplug.h        |   44 +-
>   include/hw/timer/hpet.h             |    1 +
>   scripts/acpi_extract.py             |  367 --
>   scripts/acpi_extract_preprocess.py  |   51 -
>   scripts/update-acpi.sh              |    4 -
>   tests/bios-tables-test.c            |    7 +
>   26 files changed, 1848 insertions(+), 12573 deletions(-)
>   create mode 100644 hw/acpi/cpu_hotplug_acpi_table.c
>   create mode 100644 hw/acpi/memory_hotplug_acpi_table.c
>   delete mode 100644 hw/i386/acpi-dsdt-cpu-hotplug.dsl
>   delete mode 100644 hw/i386/acpi-dsdt-dbug.dsl
>   delete mode 100644 hw/i386/acpi-dsdt-hpet.dsl
>   delete mode 100644 hw/i386/acpi-dsdt-isa.dsl
>   delete mode 100644 hw/i386/acpi-dsdt-mem-hotplug.dsl
>   delete mode 100644 hw/i386/acpi-dsdt.dsl
>   delete mode 100644 hw/i386/acpi-dsdt.hex.generated
>   delete mode 100644 hw/i386/q35-acpi-dsdt.dsl
>   delete mode 100644 hw/i386/q35-acpi-dsdt.hex.generated
>   delete mode 100755 scripts/acpi_extract.py
>   delete mode 100755 scripts/acpi_extract_preprocess.py
>   delete mode 100644 scripts/update-acpi.sh
>

