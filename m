Received: by 10.182.158.201 with SMTP id ww9csp1235924obb;
        Sun, 13 Dec 2015 07:24:45 -0800 (PST)
X-Received: by 10.140.224.207 with SMTP id u198mr26887383qhb.67.1450020285954;
        Sun, 13 Dec 2015 07:24:45 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u67si10509423qgd.34.2015.12.13.07.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Dec 2015 07:24:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55593 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a88Vx-0008MT-K9
	for alex.bennee@linaro.org; Sun, 13 Dec 2015 10:24:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1a88Vu-0008MJ-O6
	for qemu-arm@nongnu.org; Sun, 13 Dec 2015 10:24:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1a88Vq-0002Cj-QL
	for qemu-arm@nongnu.org; Sun, 13 Dec 2015 10:24:42 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:36826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>)
	id 1a88Vq-0002Cf-HB; Sun, 13 Dec 2015 10:24:38 -0500
Received: by mail-wm0-x22e.google.com with SMTP id n186so88212835wmn.1;
	Sun, 13 Dec 2015 07:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=reply-to:subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ujgEHP3LahCTIR3KyDt+rjbT2a5z0aZw2eal6cP4qjA=;
	b=ukE6JNdRcEORm3sjUPbBm5dfug4BBKmjx6UmBX4Rxs7dvPl4N+1vC6ONFtwLXJgbtT
	Wnz7ksyq+aJlJ1283tqvzs1VDDc7lUUy944eTF8fM+anCYlR/tuCdN4ah2wxG3PU3PTT
	vSeafO3eVufo4N8M1WRBXWVYJ6XOZ6Dy9ZLsV+5MlRhDb19fGtoOXCTo8AMjq73pZ48S
	MJfhS67HPXDYM5ekr+uy2jyj4TCzUuvm4Y/OJ2qdWdf8s93eifIAF0zjbbMG0U4vDjCN
	/fIyak8LH0dgr1VdITAj7RZ4tLZC+3K2KPrV4t52oTQL1rVW2FIBH26bUgNeTBZ+DNX5
	PREg==
X-Received: by 10.194.209.195 with SMTP id mo3mr32616791wjc.16.1450020277940; 
	Sun, 13 Dec 2015 07:24:37 -0800 (PST)
Received: from [192.168.1.115] ([46.120.6.143])
	by smtp.googlemail.com with ESMTPSA id
	i84sm12083353wmc.20.2015.12.13.07.24.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Dec 2015 07:24:37 -0800 (PST)
References: <1449704528-289297-1-git-send-email-imammedo@redhat.com>
	<56699FFB.3090208@gmail.com>
	<20151210173137.1a292acf@igors-macbook-pro.local>
To: Igor Mammedov <imammedo@redhat.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <566D8DB3.6030006@gmail.com>
Date: Sun, 13 Dec 2015 17:24:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151210173137.1a292acf@igors-macbook-pro.local>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/74] pc: acpi: convert DSDT to
 AML API and drop ASL templates support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: marcel@redhat.com
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
X-TUID: bPv7wVzeF/eU

On 12/10/2015 06:31 PM, Igor Mammedov wrote:
> On Thu, 10 Dec 2015 17:53:31 +0200
> Marcel Apfelbaum <marcel.apfelbaum@gmail.com> wrote:
>
> [...]
>> Hi Igor,
>> Please consider splinting this series...
>>
>> Maybe ACPI new constructs first, then memhp/cpu, piix/q35. (only a
>> suggestion) In this you will have some "sane" 20 something patches
>> series that can be more easily "swallowed".
> I'd also prefer to do it incrementally but
> I've tried something like this before, but Michael suggested to
> avoid optimizations/refactoring and make it so that conversion would
> pass 'make check' so it would be easy to prove that it hasn't regressed
> anything and to do it the only way is to convert whole DSDT at once.
>
> Nevertheless, the series more or less organized with split in mind,
> so it's possible first commit AML API patches ('acpi:' prefixed)
> and then just go in order the blocks as they are in series:
>
> memhp/cpuhp/misc devices/piix4/q35/final cleanup

Indeed, the way the series is organized, it can be split-ted/committed
into the mentioned blocks without breaking make check.

However, if Michael is willing to take it "as is" ... :)
I'll do my best to go over it this week.
Marcel


>
>
>>
>> Thanks,
>> Marcel
>>
>>>
>>> CC: "Michael S. Tsirkin" <mst@redhat.com> (supporter:ACPI/SMBIOS)
>>> CC: Shannon Zhao <zhaoshenglong@huawei.com> (maintainer:ARM ACPI
>>> Subsystem) CC: Peter Maydell <peter.maydell@linaro.org>
>>> (maintainer:ARM) CC: Paolo Bonzini <pbonzini@redhat.com>
>>> (maintainer:X86) CC: Richard Henderson <rth@twiddle.net>
>>> (maintainer:X86) CC: Eduardo Habkost <ehabkost@redhat.com>
>>> (maintainer:X86) CC: qemu-arm@nongnu.org (open list:ARM ACPI
>>> Subsystem)
>>>
>>> Igor Mammedov (70):
>>>     tests: acpi: print ASL diff in verbose mode
>>>     acpi: add aml_lgreater_equal()
>>>     acpi: add aml_create_qword_field()
>>>     acpi: aml: add helper for Opcode Arg2 Arg2 [Dst] AML pattern
>>>     acpi: extend aml_add() to accept target argument
>>>     acpi: add aml_decrement() and aml_subtract()
>>>     acpi: add aml_call0() helper
>>>     acpi: add aml_to_integer()
>>>     acpi: extend aml_shiftright() to accept target argument
>>>     acpi: add aml_alias()
>>>     acpi: add aml_sleep()
>>>     acpi: add aml_lor()
>>>     acpi: add aml_lgreater()
>>>     acpi: extend aml_field() to support LockRule
>>>     acpi: add aml_to_hexstring()
>>>     acpi: add aml_to_buffer()
>>>     acpi add aml_dma()
>>>     acpi: extend aml_or() to accept target argument
>>>     acpi: extend aml_and() to accept target argument
>>>     acpi: extend aml_interrupt() to support multiple irqs
>>>     pc: acpi: memhp: prepare context in SSDT for moving memhp DSDT
>>> code pc: acpi: memhp: move MHPD._STA method into SSDT
>>>     pc: acpi: memhp: move MHPD.MLCK mutex into SSDT
>>>     pc: acpi: memhp: move MHPD.MSCN method into SSDT
>>>     pc: acpi: memhp: move MHPD.MRST method into SSDT
>>>     pc: acpi: memhp: move MHPD.MPXM method into SSDT
>>>     pc: acpi: memhp: move MHPD.MOST method into SSDT
>>>     pc: acpi: memhp: move MHPD.MEJ0 method into SSDT
>>>     pc: acpi: memhp: move MHPD.MCRS method into SSDT
>>>     pc: acpi: memhp: move MHPD Device into SSDT
>>>     pc: acpi: factor out memhp code from build_ssdt() into separate
>>>       function
>>>     pc: acpi: memhp: move \_GPE._E03 into SSDT
>>>     pc: acpi: memhp: drop not needed stringify(MEMORY_foo) usage
>>>     pc: acpi: drop unused CPU_STATUS_LEN from DSDT
>>>     pc: acpi: cpuhp: move CPEJ() method to SSDT
>>>     pc: acpi: cpuhp: move CPMA() method into SSDT
>>>     pc: acpi: cpuhp: move CPST() method into SSDT
>>>     pc: acpi: cpuhp: move PRSC() method into SSDT
>>>     pc: acpi: cpuhp: move \_GPE._E02() into SSDT
>>>     pc: acpi: factor out cpu hotplug code from build_ssdt() into
>>> separate function
>>>     pc: acpi: move HPET from DSDT to SSDT
>>>     pc: acpi: move DBUG() from DSDT to SSDT
>>>     pc: acpi: move RTC device from DSDT to SSDT
>>>     pc: acpi: move KBD device from DSDT to SSDT
>>>     pc: acpi: move MOU device from DSDT to SSDT
>>>     pc: acpi: move FDC0 device from DSDT to SSDT
>>>     pc: acpi: move LPT device from DSDT to SSDT
>>>     pc: acpi: move COM devices from DSDT to SSDT
>>>     pc: acpi: move PIIX4 isa-bridge and pm devices into SSDT
>>>     pc: acpi: move remaining GPE handlers into SSDT
>>>     pc: acpi: pci: move link devices into SSDT
>>>     pc: acpi: piix4: move IQCR() into SSDT
>>>     pc: acpi: piix4: move IQST() into SSDT
>>>     pc: acpi: piix4: move PCI0._PRT() into SSDT
>>>     pc: acpi: piix4: move remaining PCI hotplug bits into SSDT
>>>     pc: acpi: piix4: acpi move PCI0 device to SSDT
>>>     pc: acpi: q35: move GSI links to SSDT
>>>     pc: acpi: q35: move link devices to SSDT
>>>     pc: acpi: q35: move IQCR() into SSDT
>>>     pc: acpi: q35: move IQST() into SSDT
>>>     pc: acpi: q35: move ISA bridge into SSDT
>>>     pc: acpi: q35: move _PRT() into SSDT
>>>     pc: acpi: q35: move PRTA routing table into SSDT
>>>     pc: acpi: q35: move PRTP routing table into SSDT
>>>     pc: acpi: q35: move _PIC() method into SSDT
>>>     pc: acpi: q35: move PCI0._OSC() method into SSDT
>>>     pc: acpi: q35: move PCI0 device definition into SSDT
>>>     pc: acpi: q35: PCST, PCSB opregions and PCIB field into SSDT
>>>     pc: acpi: switch to AML API composed DSDT
>>>     pc: acpi: remove unused ASL templates and related blobs/utils
>>>
>>> Xiao Guangrong (4):
>>>     acpi: add aml_derefof
>>>     acpi: add aml_sizeof
>>>     acpi: add aml_mutex(), aml_acquire(), aml_release()
>>>     acpi: support serialized method
>>>
>>>    hw/acpi/Makefile.objs               |    4 +-
>>>    hw/acpi/aml-build.c                 |  294 +-
>>>    hw/acpi/cpu_hotplug_acpi_table.c    |  124 +
>>>    hw/acpi/memory_hotplug_acpi_table.c |  249 ++
>>>    hw/arm/virt-acpi-build.c            |   41 +-
>>>    hw/i386/Makefile.objs               |   31 +-
>>>    hw/i386/acpi-build.c                | 1329 ++++--
>>>    hw/i386/acpi-dsdt-cpu-hotplug.dsl   |   90 -
>>>    hw/i386/acpi-dsdt-dbug.dsl          |   41 -
>>>    hw/i386/acpi-dsdt-hpet.dsl          |   48 -
>>>    hw/i386/acpi-dsdt-isa.dsl           |  117 -
>>>    hw/i386/acpi-dsdt-mem-hotplug.dsl   |  171 -
>>>    hw/i386/acpi-dsdt.dsl               |  303 --
>>>    hw/i386/acpi-dsdt.hex.generated     | 2972 --------------
>>>    hw/i386/q35-acpi-dsdt.dsl           |  436 --
>>>    hw/i386/q35-acpi-dsdt.hex.generated | 7610
>>> -----------------------------------
>>> hw/timer/hpet.c                     |    2 +-
>>> include/hw/acpi/aml-build.h         |   66 +-
>>> include/hw/acpi/cpu_hotplug.h       |   10 +
>>> include/hw/acpi/memory_hotplug.h    |    9 +
>>> include/hw/acpi/pc-hotplug.h        |   44 +-
>>> include/hw/timer/hpet.h             |    1 +
>>> scripts/acpi_extract.py             |  367 --
>>> scripts/acpi_extract_preprocess.py  |   51 -
>>> scripts/update-acpi.sh              |    4 -
>>> tests/bios-tables-test.c            |    7 + 26 files changed, 1848
>>> insertions(+), 12573 deletions(-) create mode 100644
>>> hw/acpi/cpu_hotplug_acpi_table.c create mode 100644
>>> hw/acpi/memory_hotplug_acpi_table.c delete mode 100644
>>> hw/i386/acpi-dsdt-cpu-hotplug.dsl delete mode 100644
>>> hw/i386/acpi-dsdt-dbug.dsl delete mode 100644
>>> hw/i386/acpi-dsdt-hpet.dsl delete mode 100644
>>> hw/i386/acpi-dsdt-isa.dsl delete mode 100644
>>> hw/i386/acpi-dsdt-mem-hotplug.dsl delete mode 100644
>>> hw/i386/acpi-dsdt.dsl delete mode 100644
>>> hw/i386/acpi-dsdt.hex.generated delete mode 100644
>>> hw/i386/q35-acpi-dsdt.dsl delete mode 100644
>>> hw/i386/q35-acpi-dsdt.hex.generated delete mode 100755
>>> scripts/acpi_extract.py delete mode 100755
>>> scripts/acpi_extract_preprocess.py delete mode 100644
>>> scripts/update-acpi.sh
>>>
>>
>

