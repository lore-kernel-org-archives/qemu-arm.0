Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1325242wrq;
        Thu, 5 Jul 2018 01:01:32 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdQj7kbTEH2xUv3k6U6Z+z3d1kmrzkWfaLzQbKQaZdziZKX4SlVm6Zfc14hD+KiTxL8PhFV
X-Received: by 2002:a37:ba02:: with SMTP id k2-v6mr4175066qkf.134.1530777692790;
        Thu, 05 Jul 2018 01:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530777692; cv=none;
        d=google.com; s=arc-20160816;
        b=LoGHFh3ZHdcbqVncWlihWcRWSg540HKmZeoiucGijzUEcghu4V7gv8UAhrt+CaDOWe
         T5fXjXCIrLj2uhkzFq97HzbCFrQ+vZt2KoijGWvvpakSclo2D3YhMVKwTqcsqAmmYAnu
         hNmcorOmyJVvdM9JquYNWBNRxO4GQpk1xUvMrzT9iuNaoGga2oMdJ+uIRw557C7VDqqm
         /tBfaFy7MyUhxTkFyf/tYJwog0Be8muWPzlzEokFBMXyLELXAm2qYlsoIdHag9XW5i7o
         hou8dc5vVzy0HFT65YIGvDdUub46KNNs5LU/UdphRLfahePaeKEJGnI5/7kdUoneOQhH
         yWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:references:to:from
         :arc-authentication-results;
        bh=9jX49T3lMrw9ZLpD84tlnLy9iFGMD0N5p/wdYtlIlko=;
        b=TiptWS5oOutEz3yVp11TlBrOs2YEJ/z7/GXIn5+Bo2Klchz3kRc3ktrEJ8aXn5qAoB
         cefqZ9P0GtWZC66JbymTWA8Zup3v+Is/CwPX+BNPIDZS+MVs8i728xNxoEmZlyMa2FHS
         pPhuvemVa2kq9jl+FCggzgRoEauOnLtwXKtHZ3wR3KqYieHfxfzcB3+qWdSnnaEzrFtz
         pcMnZ1Zfi2dx3sCjTrBd6S+hW41JHd+QTBdjz1+wSV2iVgd9hLIbguwm0DDWskkM/Eta
         Xm83LGguUZ0DgemxHuHRY34CD3AcZ5bnWLk7QvK00lXStEyKqGGewNI6yd2/fKuzndd1
         mx/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x46-v6si1110305qvf.286.2018.07.05.01.01.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 01:01:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50901 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fazCm-0006dR-7H
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 04:01:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fazC5-0006aR-Bb
	for qemu-devel@nongnu.org; Thu, 05 Jul 2018 04:00:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fazC0-0000kw-FB
	for qemu-devel@nongnu.org; Thu, 05 Jul 2018 04:00:49 -0400
Received: from mout.web.de ([212.227.15.3]:44107)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jan.kiszka@web.de>)
	id 1fazC0-0000g5-3c; Thu, 05 Jul 2018 04:00:44 -0400
Received: from [167.87.11.38] ([95.157.57.47]) by smtp.web.de (mrweb004
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0LuZgO-1gIoOz2iHY-00zlCI;
	Thu, 05 Jul 2018 10:00:37 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-21-luc.michel@greensocs.com>
	<d8062fb6-8eef-eff3-fa92-9f9f791ee669@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=jan.kiszka@web.de; prefer-encrypt=mutual; keydata=
	xsDhBEq0i8QRBAD2wOxlC9m/8t/vqjm1U9yQCT6OJ2Wbv/qys9DYM0CvcOTDMWQwmV1/VsZj
	KR5YgB5NPt+To7X6x5cjz15AGnx5Fb8Wnrq8EF9ZfHMwb7YMx1LdPYPDnXr37wE3XupFmkHB
	Mes4htyX7Dz8LvKDLnli4IsAmWG+kV1JI6LWKXLpSwCg8JRq4SWoB4VCQxbH3GjntgvwNc8D
	/2q5Dj0urJ7s7sdXhrH0hcFkpSFRmU5Yd6MCwcbFHm2paL5gqVjNNUUwDBKAL9eZaQVIHKwC
	44BvNGO2gcQ26R3AuCHUQ+pZHg34tok1JCNZ6IEZccb+33Qq0qbcDMJJiDYp7ppp6ozifvc4
	YaqJECX48IydxfE9+41oV7T5vNAzA/QL/UMJyTnu5jiOXcyn5iFQw535lXkwKsqeXzCowLho
	HICZ2jITJPdTT/+9pGWwMQqST/SS35Tx4EnS3z2BWsNMCLuXCPkxF1elaMJqMfMJxFD8rAgS
	9GK6zP6fJlsA1wq/UvKSL8v4QPOnTNCVOsyqJVasGV0ZPcDfcj+ClNO4zR5KYW4gS2lzemth
	IDxqYW4ua2lzemthQHdlYi5kZT7CYwQTEQIAIwIbIwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
	BQJOpoNtAhkBAAoJEIrUrG965ecUOPUAoK+Rh12KgCjplHAS0AoiGKwGOuq7AKDEVnBtRAoy
	VRvp3lOlOx+P2Ay56M7BTQRKtIvEEAgA2/PlX6oyi7dToH0CJCHq0eKmZaa7CmGaVnxyeepK
	vIfiM8n8Td76AbG64fjREMwgSpb4F/UytF3z/03tj4e49W/zKjbBRB2/wmFRlZBC9crg22Q+
	bgvMOsxnC6uHXaWN8fL+jVei/5OoHOoFqaMsX8EvploitlI/BPj+VgW26jksf3YZyk1hncls
	Z/IYhXzgRmVJo4RiTW/YLQAkwndwc+fKPa/IYLEDW1Jc4kNLoK0P90b45zju0hpl0C00pVOR
	TOtzFK9G5Ha7qOAWJfAVJORHKAkkvwftf3hkpPdLyvZUWRHXvUexmA61fLvDBAFhRxYGD8t5
	gz88SF5Tzq+0ywADBQf/YSkaYrEslPWiCA2wU6EW0yaqBQAobFsOMvsufJ6o2ntq5Ncq37VI
	3KCT67eHPE9x+zPcENoZWsRrC9S9PCf1LOsi7ybZsR13AJqDFlRzJZ4klh9QwgwFZxUBzOdI
	vttwzG1QkzHx06RKZluFYpPF3DRduSMukdIJ2wmWCU+ohB+mYefe65JGjYQfHVs8mgYVFOPx
	bRea9VJACCMuspoZWpj43UdR1lLLyIUFYz+jqcPW7Hd/GTIw4N67pYl0dwPDmFd4ohJ5g4Zp
	q61toNysBGEuEm5GCcn0VmGtQpSYnR5cVm5b2yPz4bIuFOSuZUo/l7vitdY0iy0/wvKbBC+N
	K8JJBBgRAgAJBQJKtIvEAhsMAAoJEIrUrG965ecULvAAoKGvxs5T3IhyQT8I8sMsyAvCE4wH
	AJ46S16yab+OxNkvOeoOEX0EnHVHaA==
Message-ID: <a199e550-4576-3a03-a7c1-8c21bb502cf5@web.de>
Date: Thu, 5 Jul 2018 10:00:35 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <d8062fb6-8eef-eff3-fa92-9f9f791ee669@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:9QvYUmjEXloJ/D/IrXs7yVIUHxAyieD/gC/9IdHM01w+zfkRnVt
	rbJSbVaYQWFsvHZCZOZ0+QZx11SlR9hIwtA8IcZovHofugioNBVaHw7Mg4yPWBHQ/OHLn+7
	eRx3iRGRaVUNZkoGjey3yuwLm309xvoVjtliZDsRJcsizmIkx2BdJS4QuMtxbE/CVvBmZwC
	OdWZvjuNO20i9f1gR0NmQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:lcyjEPqRtqU=:1JS2ErCFst7Y6beHRoXJED
	z40m4quVamDHiJwiQJL8eE0jb5G5uCF7DPzELkm4szdJWKMaxLnmDrf4IizJzqqSp61Qb5BZx
	cLPV2F1PoP8pHk7I3A0SHh25hNu7RLEVNKWp3wlw5iKb33pDyzIfBjUuxlLv0aOoynh7Fp3UD
	wonVSJ02plX57d5oQ2tE8CsWb1gF0qPsLLKC87LGURi+dc131s0XUJbZRu9HTmxbJcdHVWd5r
	mdzLYln78x7BaJ4tucSMzLOoPKHhnZVSRQe74lJqPUFYFCLUwNP+DbT/MOj2do2eKA97RNb9l
	lOcg6wOE1bP2a35ZLuofTkJBCnEk/Y15Dib1rw+aIgAKEME8/oUmTxeRHNxTCVScJ/8zTQmzF
	dCshSs0jBGT7Nhq8DlUiF9RXGCrp5xE7ctZEtSbQm0FOEInRSIellA0GVvoPklJdWjabAzXuP
	Sc+dUeYQayMjjzYRxGXrD29o+TmmhJJZZeA4aJqnxCzpIneCfs6Ona5WOBvBbGKwgqlMRhv8F
	YIT/f3sOkX9hzCEa9vtReIFX+CQh9ia7jqI3PDNEz2vqvWFkR1CSM6TuQg5WyYYV1sTy2jgNR
	zg4HwNsZsBfPX4SFsRcU/ryE8VkIc6nVvVItLbg3P9E5uB5n9lVgQw7IKp69yJHVK1qdLI42V
	IIDH//MedmyiOtOEO2DNaFn8UsxiRDZQdwoAl8gaeDlMlKvQv8GvMkfc/lXRlQ0ynF3X1HnNJ
	3R4GnG93zc5ccBNuOZhm/2nEuSz3N4BvXGFYMwzL4GERk5e/8XjDRA5NExVk+l3Wclp/UPk3R
	4T5sBqc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.3
Subject: Re: [Qemu-devel] [PATCH v3 20/20] arm/virt: Add support for GICv2
 virtualization extensions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: saipava@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
	edgari@xilinx.com, qemu-arm@nongnu.org, mark.burton@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q6jJ/K778aZ/

On 2018-07-05 08:51, Jan Kiszka wrote:
> On 2018-06-29 15:29, Luc Michel wrote:
>> Add support for GICv2 virtualization extensions by mapping the necessary
>> I/O regions and connecting the maintenance IRQ lines.
>>
>> Declare those additions in the device tree and in the ACPI tables.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> ---
>>  hw/arm/virt-acpi-build.c |  4 ++++
>>  hw/arm/virt.c            | 50 +++++++++++++++++++++++++++++++++-------
>>  include/hw/arm/virt.h    |  3 +++
>>  3 files changed, 49 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 6ea47e2588..3b74bf0372 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -659,6 +659,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          gicc->length = sizeof(*gicc);
>>          if (vms->gic_version == 2) {
>>              gicc->base_address = cpu_to_le64(memmap[VIRT_GIC_CPU].base);
>> +            gicc->gich_base_address = cpu_to_le64(memmap[VIRT_GIC_HYP].base);
>> +            gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
>>          }
>>          gicc->cpu_interface_number = cpu_to_le32(i);
>>          gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
>> @@ -670,6 +672,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          }
>>          if (vms->virt && vms->gic_version == 3) {
>>              gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV3_MAINT_IRQ));
>> +        } else if (vms->virt && vms->gic_version == 2) {
>> +            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV2_MAINT_IRQ));
>>          }
>>      }
>>  
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 742f68afca..e45b9de3be 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -131,6 +131,8 @@ static const MemMapEntry a15memmap[] = {
>>      [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
>>      [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
>>      [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
>> +    [VIRT_GIC_HYP] =            { 0x08030000, 0x00001000 },
>> +    [VIRT_GIC_VCPU] =           { 0x08040000, 0x00001000 },
>>      /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
>>      [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
>>      /* This redistributor space allows up to 2*64kB*123 CPUs */
>> @@ -438,11 +440,26 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>>          /* 'cortex-a15-gic' means 'GIC v2' */
>>          qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
>>                                  "arm,cortex-a15-gic");
>> -        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>> -                                      2, vms->memmap[VIRT_GIC_DIST].base,
>> -                                      2, vms->memmap[VIRT_GIC_DIST].size,
>> -                                      2, vms->memmap[VIRT_GIC_CPU].base,
>> -                                      2, vms->memmap[VIRT_GIC_CPU].size);
>> +        if (!vms->virt) {
>> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
>> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
>> +                                         2, vms->memmap[VIRT_GIC_CPU].base,
>> +                                         2, vms->memmap[VIRT_GIC_CPU].size);
>> +        } else {
>> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
>> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
>> +                                         2, vms->memmap[VIRT_GIC_CPU].base,
>> +                                         2, vms->memmap[VIRT_GIC_CPU].size,
>> +                                         2, vms->memmap[VIRT_GIC_HYP].base,
>> +                                         2, vms->memmap[VIRT_GIC_HYP].size,
>> +                                         2, vms->memmap[VIRT_GIC_VCPU].base,
>> +                                         2, vms->memmap[VIRT_GIC_VCPU].size);
>> +            qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
>> +                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV2_MAINT_IRQ,
>> +                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>> +        }
>>      }
>>  
>>      qemu_fdt_setprop_cell(vms->fdt, "/intc", "phandle", vms->gic_phandle);
>> @@ -563,6 +580,11 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>              qdev_prop_set_uint32(gicdev, "redist-region-count[1]",
>>                  MIN(smp_cpus - redist0_count, redist1_capacity));
>>          }
>> +    } else {
>> +        if (!kvm_irqchip_in_kernel()) {
>> +            qdev_prop_set_bit(gicdev, "has-virtualization-extensions",
>> +                              vms->virt);
>> +        }
>>      }
>>      qdev_init_nofail(gicdev);
>>      gicbusdev = SYS_BUS_DEVICE(gicdev);
>> @@ -574,6 +596,10 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>          }
>>      } else {
>>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
>> +        if (vms->virt) {
>> +            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_HYP].base);
>> +            sysbus_mmio_map(gicbusdev, 3, vms->memmap[VIRT_GIC_VCPU].base);
>> +        }
>>      }
>>  
>>      /* Wire the outputs from each CPU's generic timer and the GICv3
>> @@ -600,9 +626,17 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>                                                     ppibase + timer_irq[irq]));
>>          }
>>  
>> -        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
>> -                                    qdev_get_gpio_in(gicdev, ppibase
>> -                                                     + ARCH_GICV3_MAINT_IRQ));
>> +        if (type == 3) {
>> +            qemu_irq irq = qdev_get_gpio_in(gicdev,
>> +                                            ppibase + ARCH_GICV3_MAINT_IRQ);
>> +            qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
>> +                                        0, irq);
>> +        } else if (vms->virt) {
>> +            qemu_irq irq = qdev_get_gpio_in(gicdev,
>> +                                            ppibase + ARCH_GICV2_MAINT_IRQ);
>> +            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
>> +        }
>> +
>>          qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
>>                                      qdev_get_gpio_in(gicdev, ppibase
>>                                                       + VIRTUAL_PMU_IRQ));
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 9a870ccb6a..9e2f33f2d1 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -42,6 +42,7 @@
>>  #define NUM_VIRTIO_TRANSPORTS 32
>>  #define NUM_SMMU_IRQS          4
>>  
>> +#define ARCH_GICV2_MAINT_IRQ  9
>>  #define ARCH_GICV3_MAINT_IRQ  9
>>  
>>  #define ARCH_TIMER_VIRT_IRQ   11
>> @@ -60,6 +61,8 @@ enum {
>>      VIRT_GIC_DIST,
>>      VIRT_GIC_CPU,
>>      VIRT_GIC_V2M,
>> +    VIRT_GIC_HYP,
>> +    VIRT_GIC_VCPU,
>>      VIRT_GIC_ITS,
>>      VIRT_GIC_REDIST,
>>      VIRT_GIC_REDIST2,
>>
> 
> This one apparently requires rebasing over master. Did this manually.
> 
> But now I'm running into troubles with reading back GICD ITARGETSR.
> Maybe we are emulating an "early implementation" here?
> 
> [from the related Jailhouse code [1]]
> /*
>  * Get the CPU interface ID for this cpu. It can be discovered by
>  * reading the banked value of the PPI and IPI TARGET registers
>  * Patch 2bb3135 in Linux explains why the probe may need to scans the
>  * first 8 registers: some early implementation returned 0 for the first
>  * ITARGETSR registers.
>  * Since those didn't have virtualization extensions, we can safely
>  * ignore that case.
>  */
> 
> But maybe I'm just off with the configuration, checking...
> 

As suspected, it's a bug in QEMU, this resolves it, and I can run Linux
as root cell and a bare metal non-root cell:

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 7d24348d96..199f953ddb 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -965,7 +965,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             if (irq >= 29 && irq <= 31) {
                 res = cm;
             } else {
-                res = GIC_DIST_TARGET(irq);
+                if (irq < GIC_INTERNAL) {
+                    res = 1 << gic_get_current_cpu(s);
+                } else {
+                    res = GIC_DIST_TARGET(irq);
+                }
             }
         }
     } else if (offset < 0xf00) {

Didn't test Linux as non-root cell (secondary guest) yet, but that
should work as well. I'm seeing issues in an error shutdown path, but
that might be the same on real hw, needs cross-checking.

Jan
