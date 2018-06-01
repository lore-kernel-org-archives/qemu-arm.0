Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp489786wre;
        Fri, 1 Jun 2018 04:09:45 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLTIJb87UFRoLFDfojqRNXExAsX05ZH6FMTctPGjXj03OYTG1GMhQZWjyd16vLeawF7xMgJ
X-Received: by 2002:ac8:3b49:: with SMTP id r9-v6mr10751575qtf.368.1527851385530;
        Fri, 01 Jun 2018 04:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527851385; cv=none;
        d=google.com; s=arc-20160816;
        b=JwKq2bk5keKSWra0dN0ya3+qcn14FZJcsiwWIvFNLV/w4hIsvgan6nKVjWVh3DkFdP
         6ybEV40yyknDaUH+tUd1NFRbOc/ncEfjOlJ6K41krJl2iV7AOS/iaXltDFjtGYxqte8L
         is7X+9XDfwJNioWrVBhZR8rl6weCmdOs8Jgy+HkcLxfkkynGsXGY69+2+hGsk+j20mDQ
         dqOuL8xlpEj1ZmcGfjbQLz4LTNyJanQLmXLHgtrbFSXW+20yFq4cQ5ApCGG7o8owlT/9
         iQjK30Xx0S6rLYbNVkCBjOPbp8ny4hhmNbapF27tTGGNZ3KanxI017IB14Vo0N/o7x8s
         35ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=6uZP4H5h/RXpZjWkkvOK2UYaIcmJdcKe7qvhxBTbNmQ=;
        b=0r+WBzkhmouD2AwCKK7v8GFIpHxU4MCILalLrqOpAHW7KdnwD/qq5hfCG0K1Rc0u7P
         nyd0a3UF5yh7GzHoqVgZYGnl9U0+2j/9WpoFOjYszyIhuNTCrhbdEjLiYBtguQ+/vsUq
         g6P3JBIUC70/r1Oin4eisQMh3KGSKLjh00AQV9L4eyakrgFE3zlD69/pAAT+bkkVQVut
         +Q8r4apb5ZeKDh/ps4s2MhsFo7+qOiSg3yFARDXCPHbQYRarG9RpQFg155TZyZy0da0C
         +CprPACJGMEZ/xtPFPPSe1lZUvdIahHaEcGOKkH2hS3NNgElj5z/3J9f3qe8QYfqD7it
         2HYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5-v6si1829122qtc.150.2018.06.01.04.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 04:09:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54811 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOhwG-00007m-Td
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 07:09:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fOhw3-000066-Vj
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 07:09:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fOhvz-0008JL-R8
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 07:09:31 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:4244 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fOhvz-0008GT-FN; Fri, 01 Jun 2018 07:09:27 -0400
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id 823B32801F1A3;
	Fri,  1 Jun 2018 12:09:21 +0100 (IST)
Received: from FRAEMA707-CHM.china.huawei.com (10.206.14.56) by
	lhreml709-cah.china.huawei.com (10.201.108.32) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Fri, 1 Jun 2018 12:09:22 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.176]) by
	FRAEMA707-CHM.china.huawei.com ([169.254.7.63]) with mapi id
	14.03.0382.000; Fri, 1 Jun 2018 13:09:14 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, Andrew Jones <drjones@redhat.com>
Thread-Topic: [Qemu-devel] [RFC v2 5/6] hw/arm: ACPI SRAT changes to
	accommodate non-contiguous mem
Thread-Index: AQHT7SmpYI2NC6rNu0iKJTB5+4o8hKRFT3QAgATtDgCAAQubEA==
Date: Fri, 1 Jun 2018 11:09:13 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8386F539C@FRAEML521-MBX.china.huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-6-shameerali.kolothum.thodi@huawei.com>
	<20180528170226.3ynif3r34yejf7tp@kamzik.brq.redhat.com>
	<27825c1d-07a2-f03e-477a-03e3d778ac35@redhat.com>
In-Reply-To: <27825c1d-07a2-f03e-477a-03e3d778ac35@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.88.227]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.213.3.17
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 5/6] hw/arm: ACPI SRAT changes
 to accommodate non-contiguous mem
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mlKhDZrd2o/N

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Thursday, May 31, 2018 9:16 PM
> To: Andrew Jones <drjones@redhat.com>; Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>
> Cc: peter.maydell@linaro.org; Zhaoshenglong <zhaoshenglong@huawei.com>;
> Linuxarm <linuxarm@huawei.com>; qemu-devel@nongnu.org;
> alex.williamson@redhat.com; qemu-arm@nongnu.org; Jonathan Cameron
> <jonathan.cameron@huawei.com>; imammedo@redhat.com
> Subject: Re: [Qemu-devel] [RFC v2 5/6] hw/arm: ACPI SRAT changes to
> accommodate non-contiguous mem
>=20
> Hi Shameer,
>=20
> On 05/28/2018 07:02 PM, Andrew Jones wrote:
> > On Wed, May 16, 2018 at 04:20:25PM +0100, Shameer Kolothum wrote:
> >> This is in preparation for the next patch where initial ram is split
> >> into a non-pluggable chunk and a pc-dimm modeled mem if  the vaild
> >> iova regions are non-contiguous.
> >>
> >> Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> >> ---
> >>  hw/arm/virt-acpi-build.c | 24 ++++++++++++++++++++----
> >>  1 file changed, 20 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index c7c6a57..8d17b40 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -488,7 +488,7 @@ build_srat(GArray *table_data, BIOSLinker *linker,
> VirtMachineState *vms)
> >>      AcpiSratProcessorGiccAffinity *core;
> >>      AcpiSratMemoryAffinity *numamem;
> >>      int i, srat_start;
> >> -    uint64_t mem_base;
> >> +    uint64_t mem_base, mem_sz, mem_len;
> >>      MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> >>      const CPUArchIdList *cpu_list =3D mc-
> >possible_cpu_arch_ids(MACHINE(vms));
> >>
> >> @@ -505,12 +505,28 @@ build_srat(GArray *table_data, BIOSLinker
> *linker, VirtMachineState *vms)
> >>          core->flags =3D cpu_to_le32(1);
> >>      }
> >>
> >> -    mem_base =3D vms->memmap[VIRT_MEM].base;
> >> +    mem_base =3D vms->bootinfo.loader_start;
> >> +    mem_sz =3D vms->bootinfo.loader_start;
> >
> > mem_sz =3D vms->bootinfo.ram_size;
> >
> > Assuming the DT generator was correct, meaning bootinfo.ram_size will
> > be the size of the non-pluggable dimm.
> >
> >
> >>      for (i =3D 0; i < nb_numa_nodes; ++i) {
> >>          numamem =3D acpi_data_push(table_data, sizeof(*numamem));
> >> -        build_srat_memory(numamem, mem_base, numa_info[i].node_mem,
> i,
> >> +        mem_len =3D MIN(numa_info[i].node_mem, mem_sz);
> >> +        build_srat_memory(numamem, mem_base, mem_len, i,
> >>                            MEM_AFFINITY_ENABLED);
> >> -        mem_base +=3D numa_info[i].node_mem;
> >> +        mem_base +=3D mem_len;
> >> +        mem_sz -=3D mem_len;
> >> +        if (!mem_sz) {
> >> +            break;
> >> +        }
> >> +    }
> >> +
> >> +    /* Create table for initial pc-dimm ram, if any */
> >> +    if (vms->bootinfo.dimm_mem) {
> >> +        numamem =3D acpi_data_push(table_data, sizeof(*numamem));
> >> +        build_srat_memory(numamem, vms->bootinfo.dimm_mem->base,
> >> +                          vms->bootinfo.dimm_mem->size,
> >> +                          vms->bootinfo.dimm_mem->node,
> >> +                          MEM_AFFINITY_ENABLED);
> If my understanding is correct the SRAT table is built only if
> nb_numa_nodes > 0. I don't get how the PC-DIMM region is exposed if NUMA
> nodes are not set?

Yes, SRAT is only build when nb_numa_nodes > 0. I had the same doubt as how=
 the Guest
will see the pc-dimm node on ACPI boot without numa nodes. But during my te=
sts, it did.

This is my qemu command options and please find below logs  with or without=
 the "numa node,nodeid=3D0"

./qemu-system-aarch64 -machine virt,kernel_irqchip=3Don,gic-version=3D3 -cp=
u host \
-kernel Image \
-initrd rootfs-iperf.cpio \
-device vfio-pci,host=3D000a:11:10.0 \
-net none \
-m 12G \
-numa node,nodeid=3D0 \
-nographic -D -d -enable-kvm \
-smp 4 \
-bios QEMU_EFI.fd \
-append "console=3DttyAMA0 root=3D/dev/vda -m 4096 rw earlycon=3Dpl011,0x90=
00000 acpi=3Dforce"
 =20

1. Guest Boot log (without -numa node,nodeid=3D0 )
---------------------------------------------------------------

[    0.000000] Boot CPU: AArch64 Processor [410fd082]
[    0.000000] earlycon: pl11 at MMIO 0x0000000009000000 (options '')
[    0.000000] bootconsole [pl11] enabled
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: EFI v2.60 by EDK II
[    0.000000] efi:  SMBIOS 3.0=3D0x78710000  ACPI 2.0=3D0x789b0000  MEMATT=
R=3D0x7ba44018=20
[    0.000000] cma: Reserved 16 MiB at 0x000000007f000000
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000789B0000 000024 (v02 BOCHS )
[    0.000000] ACPI: XSDT 0x00000000789A0000 000054 (v01 BOCHS  BXPCFACP 00=
000001      01000013)
[    0.000000] ACPI: FACP 0x0000000078610000 00010C (v05 BOCHS  BXPCFACP 00=
000001 BXPC 00000001)
[    0.000000] ACPI: DSDT 0x0000000078620000 0011F7 (v02 BOCHS  BXPCDSDT 00=
000001 BXPC 00000001)
[    0.000000] ACPI: APIC 0x0000000078600000 000198 (v03 BOCHS  BXPCAPIC 00=
000001 BXPC 00000001)
[    0.000000] ACPI: GTDT 0x00000000785F0000 000060 (v02 BOCHS  BXPCGTDT 00=
000001 BXPC 00000001)
[    0.000000] ACPI: MCFG 0x00000000785E0000 00003C (v01 BOCHS  BXPCMCFG 00=
000001 BXPC 00000001)
[    0.000000] ACPI: SPCR 0x00000000785D0000 000050 (v02 BOCHS  BXPCSPCR 00=
000001 BXPC 00000001)
[    0.000000] ACPI: IORT 0x00000000785C0000 00007C (v00 BOCHS  BXPCIORT 00=
000001 BXPC 00000001)
[    0.000000] ACPI: SPCR: console: pl011,mmio,0x9000000,9600
[    0.000000] ACPI: NUMA: Failed to initialise from firmware
[    0.000000] NUMA: Faking a node at [mem 0x0000000000000000-0x00000003bff=
fffff]
[    0.000000] NUMA: Adding memblock [0x40000000 - 0x785bffff] on node 0
[    0.000000] NUMA: Adding memblock [0x785c0000 - 0x7862ffff] on node 0
[    0.000000] NUMA: Adding memblock [0x78630000 - 0x786fffff] on node 0
[    0.000000] NUMA: Adding memblock [0x78700000 - 0x78b63fff] on node 0
[    0.000000] NUMA: Adding memblock [0x78b64000 - 0x7be3ffff] on node 0
[    0.000000] NUMA: Adding memblock [0x7be40000 - 0x7becffff] on node 0
[    0.000000] NUMA: Adding memblock [0x7bed0000 - 0x7bedffff] on node 0
[    0.000000] NUMA: Adding memblock [0x7bee0000 - 0x7bffffff] on node 0
[    0.000000] NUMA: Adding memblock [0x7c000000 - 0x7fffffff] on node 0
[    0.000000] NUMA: Adding memblock [0x100000000 - 0x3bfffffff] on node 0
[    0.000000] NUMA: Initmem setup node 0 [mem 0x40000000-0x3bfffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x3bffef500-0x3bfff0fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000003bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000785bffff]
[    0.000000]   node   0: [mem 0x00000000785c0000-0x000000007862ffff]
[    0.000000]   node   0: [mem 0x0000000078630000-0x00000000786fffff]
[    0.000000]   node   0: [mem 0x0000000078700000-0x0000000078b63fff]
[    0.000000]   node   0: [mem 0x0000000078b64000-0x000000007be3ffff]
[    0.000000]   node   0: [mem 0x000000007be40000-0x000000007becffff]
[    0.000000]   node   0: [mem 0x000000007bed0000-0x000000007bedffff]
[    0.000000]   node   0: [mem 0x000000007bee0000-0x000000007bffffff]
[    0.000000]   node   0: [mem 0x000000007c000000-0x000000007fffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x00000003bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000003bffff=
fff]
[    0.000000] psci: probing for conduit method from ACPI.


2. Guest Boot log (with -numa node,nodeid=3D0 )

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.11.0-rc1-g7426f0c (shameer@shameer-ubuntu) (=
gcc version 4.9.2 20140904 (prerelease) (crosstool-NG linaro-1.13.1-4.9-201=
4.09 - Linaro GCC 4.9-2014.09) ) #228 SMP PREEMPT Mon Apr 24 14:51:06 BST 2=
017
[    0.000000] Boot CPU: AArch64 Processor [410fd082]
[    0.000000] earlycon: pl11 at MMIO 0x0000000009000000 (options '')
[    0.000000] bootconsole [pl11] enabled
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: EFI v2.60 by EDK II
[    0.000000] efi:  SMBIOS 3.0=3D0x78710000  ACPI 2.0=3D0x789b0000  MEMATT=
R=3D0x7ba44018=20
[    0.000000] cma: Reserved 16 MiB at 0x000000007f000000
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000789B0000 000024 (v02 BOCHS )
[    0.000000] ACPI: XSDT 0x00000000789A0000 00005C (v01 BOCHS  BXPCFACP 00=
000001      01000013)
[    0.000000] ACPI: FACP 0x0000000078610000 00010C (v05 BOCHS  BXPCFACP 00=
000001 BXPC 00000001)
[    0.000000] ACPI: DSDT 0x0000000078620000 0011F7 (v02 BOCHS  BXPCDSDT 00=
000001 BXPC 00000001)
[    0.000000] ACPI: APIC 0x0000000078600000 000198 (v03 BOCHS  BXPCAPIC 00=
000001 BXPC 00000001)
[    0.000000] ACPI: GTDT 0x00000000785F0000 000060 (v02 BOCHS  BXPCGTDT 00=
000001 BXPC 00000001)
[    0.000000] ACPI: MCFG 0x00000000785E0000 00003C (v01 BOCHS  BXPCMCFG 00=
000001 BXPC 00000001)
[    0.000000] ACPI: SPCR 0x00000000785D0000 000050 (v02 BOCHS  BXPCSPCR 00=
000001 BXPC 00000001)
[    0.000000] ACPI: SRAT 0x00000000785C0000 0000C8 (v03 BOCHS  BXPCSRAT 00=
000001 BXPC 00000001)
[    0.000000] ACPI: IORT 0x00000000785B0000 00007C (v00 BOCHS  BXPCIORT 00=
000001 BXPC 00000001)
[    0.000000] ACPI: SPCR: console: pl011,mmio,0x9000000,9600
[    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x0 -> Node 0
[    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x1 -> Node 0
[    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x2 -> Node 0
[    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x3 -> Node 0
[    0.000000] NUMA: Adding memblock [0x40000000 - 0x7fffffff] on node 0
[    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x40000000-0x7fffffff]
[    0.000000] NUMA: Adding memblock [0x100000000 - 0x3bfffffff] on node 0
[    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x100000000-0x3bfffffff]
[    0.000000] NUMA: Initmem setup node 0 [mem 0x40000000-0x3bfffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x3bffef500-0x3bfff0fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000003bfffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x00000000785affff]
[    0.000000]   node   0: [mem 0x00000000785b0000-0x000000007862ffff]
[    0.000000]   node   0: [mem 0x0000000078630000-0x00000000786fffff]
[    0.000000]   node   0: [mem 0x0000000078700000-0x0000000078b63fff]
[    0.000000]   node   0: [mem 0x0000000078b64000-0x000000007be3ffff]
[    0.000000]   node   0: [mem 0x000000007be40000-0x000000007becffff]
[    0.000000]   node   0: [mem 0x000000007bed0000-0x000000007bedffff]
[    0.000000]   node   0: [mem 0x000000007bee0000-0x000000007bffffff]
[    0.000000]   node   0: [mem 0x000000007c000000-0x000000007fffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x00000003bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000003bffff=
fff]
[    0.000000] psci: probing for conduit method from ACPI.


In both cases the memblock [0x100000000 - 0x3bfffffff] is present which cor=
responds to the=20
pc-dimm slot. My guess is, this is because the guest kernel retrieves the U=
EFI params from
FDT when EFI boot is detected.

[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: EFI v2.60 by EDK II

May be I am missing something here or there are other boot scenarios where =
this is not the case.

Please let me know your thoughts.

Thanks,
Shameer

> Thanks
>=20
> Eric
> >> +
> >>      }
> >>
> >>      build_header(linker, table_data, (void *)(table_data->data + srat=
_start),
> >> --
> >> 2.7.4
> >>
> >>
> >>
> >
