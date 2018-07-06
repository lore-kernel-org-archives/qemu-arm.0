Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2493393wrq;
        Fri, 6 Jul 2018 02:25:32 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdJXrpE9TWcZFxOoWyq/lUDdb5vR9PdtJUPllc2lHWX3bOm/mfNQ/IdK7u25qWR7buYYSKM
X-Received: by 2002:ae9:dc43:: with SMTP id q64-v6mr2514556qkf.62.1530869131932;
        Fri, 06 Jul 2018 02:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530869131; cv=none;
        d=google.com; s=arc-20160816;
        b=VGxeAMZ+mWayDYMpDT9cKtJIHqmNIfZAGWRbpOUSsdT6/j2icBDtfeT/u1ZTtKs9gt
         wFAZSsbuSCs76b31ZtSqfM0XLDqfC9H7w9nNEEKDg/bK6JiI24MdrfFNztDgiX+Gboew
         WqQRASD4m4Euw2GEgm5E38v5oPkWrWIMtuSFhx1NNtl6ZOuzYfrZp6Szj3pbm4E6cWQU
         SyhDKnoUMJb7z0BJGtGUtfv0cJS8GGotm+oc9xhU85SGzLANl8woaPRy0SKFdzlk5IHW
         08HFcMS51PxkzuVG3qnrQfVaQMXAItI7qhRPZo7SeJdPZXPS5gOjaDOHFfLpNKx0MjxE
         TFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:references:to:from
         :arc-authentication-results;
        bh=AL78x8JrLPg20ozXOlFHyYxDm9U7RYycIp3GDFioz+M=;
        b=a05uadMwkhc2TI2deQTTvQH5kbjeZjNyba47yWqAh+mJgggygY9nJykpQgWzhxznPx
         oKDG5V1mHgyHa9EV/tKE61ZqXdxbXeZ1F4Z7KdPMtQqPdeDyQtddxNRq7VtUSOCWTXbG
         2MITJMb/2Vg6rctHnZlVnx04ZvKTznMbtgOq17yR0HVUq39nVLdqoRA09kFxpot4HOV9
         3pftkch5XrxP6+Yo1JooIE74WUReEV2vKC48PBJLmkHGdMTs+vR5Y3z2WBa2WPzHaDYP
         uRh02vHs6ZuDs1YLL4TBiYn7gUmwfshK8643LfGU32MDTXtj7VlQsOfgx8zla6fLH/hi
         VYAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p50-v6si8386925qta.67.2018.07.06.02.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jul 2018 02:25:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fbMzb-0006EK-Fc
	for alex.bennee@linaro.org; Fri, 06 Jul 2018 05:25:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fbMzT-0006E5-AH
	for qemu-arm@nongnu.org; Fri, 06 Jul 2018 05:25:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1fbMzP-0006Ep-UD
	for qemu-arm@nongnu.org; Fri, 06 Jul 2018 05:25:23 -0400
Received: from mout.web.de ([212.227.17.12]:53951)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jan.kiszka@web.de>)
	id 1fbMzP-00062D-2g; Fri, 06 Jul 2018 05:25:19 -0400
Received: from [167.87.27.114] ([95.157.57.47]) by smtp.web.de (mrweb101
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0MgOL4-1fmy5B0Fba-00NgBx;
	Fri, 06 Jul 2018 11:25:11 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-21-luc.michel@greensocs.com>
	<d8062fb6-8eef-eff3-fa92-9f9f791ee669@web.de>
	<a199e550-4576-3a03-a7c1-8c21bb502cf5@web.de>
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
Message-ID: <fea850ca-d0cf-75ba-e906-55b11726f354@web.de>
Date: Fri, 6 Jul 2018 11:25:05 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <a199e550-4576-3a03-a7c1-8c21bb502cf5@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:vBUE+EMgVrG7dZt67r/dyAQsN+EaYrR9ojHpu48vutuodS6bAHd
	XK0svxHlziPrcCq1sc3Xq0hpXZu0DS6D97fy/wwyUuGepbjqQGCJ/CzsQP1mVdl65ZyLIVH
	lNDqMlRo8dDsfAX4IUtQdWqEwcQf2ipIfhSzrELkuw9XtFgq8uwkm2LPB+I0EpktayWsbwz
	xbshuSRDdtNgWHb7RNMvw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:9QlMDXK5vds=:sBzx2R6ndntd4IhrXTFaNQ
	r0ckptZ+YYYgdtpgKAKNRu+2p1+BqpJ+ZiaaDaMzF72+d5vE8874P9vgtSl4CFR2MzXmmrHs3
	lsuT26bfD1avkeRe34n8GABK4/ZklIpw00PKnjhywLdz3J7NvH/iPJ33fWnQALYiPWDogz7ZR
	++FuPS4IuB4qvRsY5aUjvcu+kmFBvdQal8giuX33M+VbK/za6GJfiglqma3ro7nBo0tSQZWxA
	uFPVDcBNjU0R56ZiqIBuEU16pQvE9sytfpjq0OI8xNTgu/24gCCytlYqyX16oig224Y78UkcX
	5b7lyaiLdrSwASyOHes0J2j00saCZDnNKlgCQewjYL6eAiS2CfTQrKue17XSmjOkLs4/f7oMN
	Hy89y2Nt5opg39bWXKPtMCYVbuiqS67cU6mP8aOHV+YawDlzIIWLaKP05eaYKbX26WNog69pn
	ouc46DkAlKbw5uCQcxp0ynbMu3xHChd60jDqQT2wD6ysQkCcDGNbM/++PUz69CcK24ANt8Z80
	p2ysgxloLNH+CM/N9nfZL3BEILl3809TNyoy3AeJ/98LYA8ux8dM41xu7HaBy6Pv6SHkMMB1U
	jaI7Qlw1EaMWndtQOcQ+5qGWjEfbz2FNE2Lq9+TtQS3PVMcu/7mMX919T0AQ0xMqripFxZQsz
	qChYzCOaLBALWbnQxoZw/d8a3AZ3qSVJO7a63s9p6yceYECzgpHRqfl+1VOElZ5EP8OD5Ucoo
	4Gpb9qbxsgjavn1wGkTWkM/b2OyL1Nyr2RoNduOJI0iZsbVlCG1GnOKtrGMvCX8CAXVQsU4pX
	sIbrqlF
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.12
Subject: Re: [Qemu-arm] [PATCH v3 20/20] arm/virt: Add support for GICv2
 virtualization extensions
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
Cc: saipava@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
	edgari@xilinx.com, qemu-arm@nongnu.org, mark.burton@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CJZIlkFrLiDz

On 2018-07-05 10:00, Jan Kiszka wrote:
> On 2018-07-05 08:51, Jan Kiszka wrote:
>> On 2018-06-29 15:29, Luc Michel wrote:
>>> Add support for GICv2 virtualization extensions by mapping the necessary
>>> I/O regions and connecting the maintenance IRQ lines.
>>>
>>> Declare those additions in the device tree and in the ACPI tables.
>>>
>>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>>> ---
>>>  hw/arm/virt-acpi-build.c |  4 ++++
>>>  hw/arm/virt.c            | 50 +++++++++++++++++++++++++++++++++-------
>>>  include/hw/arm/virt.h    |  3 +++
>>>  3 files changed, 49 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index 6ea47e2588..3b74bf0372 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -659,6 +659,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>          gicc->length = sizeof(*gicc);
>>>          if (vms->gic_version == 2) {
>>>              gicc->base_address = cpu_to_le64(memmap[VIRT_GIC_CPU].base);
>>> +            gicc->gich_base_address = cpu_to_le64(memmap[VIRT_GIC_HYP].base);
>>> +            gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
>>>          }
>>>          gicc->cpu_interface_number = cpu_to_le32(i);
>>>          gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
>>> @@ -670,6 +672,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>>          }
>>>          if (vms->virt && vms->gic_version == 3) {
>>>              gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV3_MAINT_IRQ));
>>> +        } else if (vms->virt && vms->gic_version == 2) {
>>> +            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV2_MAINT_IRQ));
>>>          }
>>>      }
>>>  
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 742f68afca..e45b9de3be 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -131,6 +131,8 @@ static const MemMapEntry a15memmap[] = {
>>>      [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
>>>      [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
>>>      [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
>>> +    [VIRT_GIC_HYP] =            { 0x08030000, 0x00001000 },
>>> +    [VIRT_GIC_VCPU] =           { 0x08040000, 0x00001000 },
>>>      /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
>>>      [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
>>>      /* This redistributor space allows up to 2*64kB*123 CPUs */
>>> @@ -438,11 +440,26 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>>>          /* 'cortex-a15-gic' means 'GIC v2' */
>>>          qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
>>>                                  "arm,cortex-a15-gic");
>>> -        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>>> -                                      2, vms->memmap[VIRT_GIC_DIST].base,
>>> -                                      2, vms->memmap[VIRT_GIC_DIST].size,
>>> -                                      2, vms->memmap[VIRT_GIC_CPU].base,
>>> -                                      2, vms->memmap[VIRT_GIC_CPU].size);
>>> +        if (!vms->virt) {
>>> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>>> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
>>> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
>>> +                                         2, vms->memmap[VIRT_GIC_CPU].base,
>>> +                                         2, vms->memmap[VIRT_GIC_CPU].size);
>>> +        } else {
>>> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>>> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
>>> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
>>> +                                         2, vms->memmap[VIRT_GIC_CPU].base,
>>> +                                         2, vms->memmap[VIRT_GIC_CPU].size,
>>> +                                         2, vms->memmap[VIRT_GIC_HYP].base,
>>> +                                         2, vms->memmap[VIRT_GIC_HYP].size,
>>> +                                         2, vms->memmap[VIRT_GIC_VCPU].base,
>>> +                                         2, vms->memmap[VIRT_GIC_VCPU].size);
>>> +            qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
>>> +                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV2_MAINT_IRQ,
>>> +                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>>> +        }
>>>      }
>>>  
>>>      qemu_fdt_setprop_cell(vms->fdt, "/intc", "phandle", vms->gic_phandle);
>>> @@ -563,6 +580,11 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>>              qdev_prop_set_uint32(gicdev, "redist-region-count[1]",
>>>                  MIN(smp_cpus - redist0_count, redist1_capacity));
>>>          }
>>> +    } else {
>>> +        if (!kvm_irqchip_in_kernel()) {
>>> +            qdev_prop_set_bit(gicdev, "has-virtualization-extensions",
>>> +                              vms->virt);
>>> +        }
>>>      }
>>>      qdev_init_nofail(gicdev);
>>>      gicbusdev = SYS_BUS_DEVICE(gicdev);
>>> @@ -574,6 +596,10 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>>          }
>>>      } else {
>>>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
>>> +        if (vms->virt) {
>>> +            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_HYP].base);
>>> +            sysbus_mmio_map(gicbusdev, 3, vms->memmap[VIRT_GIC_VCPU].base);
>>> +        }
>>>      }
>>>  
>>>      /* Wire the outputs from each CPU's generic timer and the GICv3
>>> @@ -600,9 +626,17 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>>                                                     ppibase + timer_irq[irq]));
>>>          }
>>>  
>>> -        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
>>> -                                    qdev_get_gpio_in(gicdev, ppibase
>>> -                                                     + ARCH_GICV3_MAINT_IRQ));
>>> +        if (type == 3) {
>>> +            qemu_irq irq = qdev_get_gpio_in(gicdev,
>>> +                                            ppibase + ARCH_GICV3_MAINT_IRQ);
>>> +            qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
>>> +                                        0, irq);
>>> +        } else if (vms->virt) {
>>> +            qemu_irq irq = qdev_get_gpio_in(gicdev,
>>> +                                            ppibase + ARCH_GICV2_MAINT_IRQ);
>>> +            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
>>> +        }
>>> +
>>>          qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
>>>                                      qdev_get_gpio_in(gicdev, ppibase
>>>                                                       + VIRTUAL_PMU_IRQ));
>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>> index 9a870ccb6a..9e2f33f2d1 100644
>>> --- a/include/hw/arm/virt.h
>>> +++ b/include/hw/arm/virt.h
>>> @@ -42,6 +42,7 @@
>>>  #define NUM_VIRTIO_TRANSPORTS 32
>>>  #define NUM_SMMU_IRQS          4
>>>  
>>> +#define ARCH_GICV2_MAINT_IRQ  9
>>>  #define ARCH_GICV3_MAINT_IRQ  9
>>>  
>>>  #define ARCH_TIMER_VIRT_IRQ   11
>>> @@ -60,6 +61,8 @@ enum {
>>>      VIRT_GIC_DIST,
>>>      VIRT_GIC_CPU,
>>>      VIRT_GIC_V2M,
>>> +    VIRT_GIC_HYP,
>>> +    VIRT_GIC_VCPU,
>>>      VIRT_GIC_ITS,
>>>      VIRT_GIC_REDIST,
>>>      VIRT_GIC_REDIST2,
>>>
>>
>> This one apparently requires rebasing over master. Did this manually.
>>
>> But now I'm running into troubles with reading back GICD ITARGETSR.
>> Maybe we are emulating an "early implementation" here?
>>
>> [from the related Jailhouse code [1]]
>> /*
>>  * Get the CPU interface ID for this cpu. It can be discovered by
>>  * reading the banked value of the PPI and IPI TARGET registers
>>  * Patch 2bb3135 in Linux explains why the probe may need to scans the
>>  * first 8 registers: some early implementation returned 0 for the first
>>  * ITARGETSR registers.
>>  * Since those didn't have virtualization extensions, we can safely
>>  * ignore that case.
>>  */
>>
>> But maybe I'm just off with the configuration, checking...
>>
> 
> As suspected, it's a bug in QEMU, this resolves it, and I can run Linux
> as root cell and a bare metal non-root cell:
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 7d24348d96..199f953ddb 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -965,7 +965,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>              if (irq >= 29 && irq <= 31) {
>                  res = cm;
>              } else {
> -                res = GIC_DIST_TARGET(irq);
> +                if (irq < GIC_INTERNAL) {
> +                    res = 1 << gic_get_current_cpu(s);
> +                } else {
> +                    res = GIC_DIST_TARGET(irq);
> +                }
>              }
>          }
>      } else if (offset < 0xf00) {
> 
> Didn't test Linux as non-root cell (secondary guest) yet, but that
> should work as well. I'm seeing issues in an error shutdown path, but
> that might be the same on real hw, needs cross-checking.

The shutdown issue actually turned out to be a Jailhouse bug. Fixed now
as well, and we run smoothly in GICv2 mode over QEMU, also with the
secondary Linux guest!

Jan
