Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1359499wrq;
        Thu, 5 Jul 2018 01:47:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe8f5vsiPPaGzoXwIYv2ze9JYyTbWf6jZwm/MYgFYVrP9gGGJsk0fFdApikqszSHpNZui/s
X-Received: by 2002:ac8:2853:: with SMTP id 19-v6mr4504904qtr.61.1530780457461;
        Thu, 05 Jul 2018 01:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530780457; cv=none;
        d=google.com; s=arc-20160816;
        b=g2dQt1b0AjMRETFqhUD2i3k8waQLB8s1MYQAN1yOQJNbxNWhhFwr1Ar3+7h7OgV7q5
         za5rzEXS3V8Yz35mrpymZSCr62uues9ZR9KfgsjVP8aKPhToG8+btD18+ck8H6kZz6ho
         JnbCDxDhySwmBYQHdh2pQLv3v+i+weeMoDOkUUOaj9gFIahCipjKSYNvvzJ+k6Fo2kwg
         YDXwKu0oSmDgQWghWhiDONIDSCMzDr5c/Uf+pHEbreBoJFcoCTJK/uxnL7SpYuL80brn
         /6TGw9g44FBiPTXEk0sIuyEf/s3D9uMxZs3g4fHgyV1PedC7E+F4JUZgwMbldH92SHbu
         CX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=U8cHBnNP82/YK8mOFXUB5hv1NrkGPyL4HOTc8bfGXWU=;
        b=K2GZ+FDxwJ4Ba5gageVWvQxadk8dj6J9dPngQA2sDWIjZCivX2Z2L1kMzhSn+S5E9j
         E2oH+EO6tL2PYhADVJaMkVMEvaHW8SYFBs4+21ARtmLL3syGH9T6cflxAKOJkIorCYg+
         PR5pfm95QBsSH97iNrQZJ4yskBFIgGc+zl/c5Zs5AcpQGWoNYZXF0FQcYJGq4P6PZoHw
         DZ4KhrolJteW8Z7J80XuKLV9lu5pRaXU37U9egFZjbZYBi/gQ8WenY7BanE1OlOG8QD+
         RCninopQ/IS2+Ggs2qAGv7S2RRJxe0IaYK/FGHrFhoeEgD0j0c32AwCQLsAfYt2U34NA
         3YNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yf6xQeaR;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jRV7Twd6;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jRV7Twd6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e12-v6si2800163qtj.27.2018.07.05.01.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 01:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yf6xQeaR;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jRV7Twd6;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jRV7Twd6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fazvM-0002Hp-Sm
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 04:47:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fazv3-0002G9-DD
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 04:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fazv0-0006BL-4p
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 04:47:17 -0400
Received: from greensocs.com ([193.104.36.180]:34214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fazuz-00061Y-Gh; Thu, 05 Jul 2018 04:47:14 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AACA04434AE;
	Thu,  5 Jul 2018 10:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530780424;
	bh=OZ9ZI3sP9aSosuMRxy+QLfbKyg0VlRPKojQtj2x/LZ8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=yf6xQeaRGF5tsnJWEYFnd1IPImWc5fRxfE770IBRYNZYy8zt1bt4Pf6VSx7wSp4E3
	pal9L7NF6SVfR32qObFr6+8roY1IkytgS1pbZIgZ7P2bxpYzp43cc9fpPJ9I95oo22
	l2YkPWtYAoXErwozKnUHxTdnZ+07OiGDRDLXlYTk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=jRV7Twd6;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=jRV7Twd6
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7gWWSj1DGdYJ; Thu,  5 Jul 2018 10:47:03 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 956A0443497; Thu,  5 Jul 2018 10:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530780423;
	bh=OZ9ZI3sP9aSosuMRxy+QLfbKyg0VlRPKojQtj2x/LZ8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=jRV7Twd6vPRADDkkOIZeHt9rKZWfjquat2Hshp0wvUTU2qyw5WIYV6sQL8Jc7OgE9
	MnOhvs8yaOh7TmfNkmiFx4VVuFKwNWD+H00KeS/G5KLzgyWYwtmH9zlYGuQj5J9mAH
	zPu6JsxBVObiVPLud/duMT9/P6e833mVqeNMC5ZE=
Received: from [192.168.61.102] (LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr
	[2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 37F0844A0F2;
	Thu,  5 Jul 2018 10:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530780423;
	bh=OZ9ZI3sP9aSosuMRxy+QLfbKyg0VlRPKojQtj2x/LZ8=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=jRV7Twd6vPRADDkkOIZeHt9rKZWfjquat2Hshp0wvUTU2qyw5WIYV6sQL8Jc7OgE9
	MnOhvs8yaOh7TmfNkmiFx4VVuFKwNWD+H00KeS/G5KLzgyWYwtmH9zlYGuQj5J9mAH
	zPu6JsxBVObiVPLud/duMT9/P6e833mVqeNMC5ZE=
To: Jan Kiszka <jan.kiszka@web.de>, qemu-devel@nongnu.org
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-21-luc.michel@greensocs.com>
	<d8062fb6-8eef-eff3-fa92-9f9f791ee669@web.de>
	<a199e550-4576-3a03-a7c1-8c21bb502cf5@web.de>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <d4a776fc-2022-979e-cc68-beb3123d35bd@greensocs.com>
Date: Thu, 5 Jul 2018 10:46:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <a199e550-4576-3a03-a7c1-8c21bb502cf5@web.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="D0zGgT5bqN7s9E87qo1zdcviDw0zDYF9y"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
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
X-TUID: BdPeWbN5Xglj

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--D0zGgT5bqN7s9E87qo1zdcviDw0zDYF9y
Content-Type: multipart/mixed; boundary="cZzX1pB6lGnvN5338PlyeoAPBk90h2jUJ";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Jan Kiszka <jan.kiszka@web.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 saipava@xilinx.com, edgari@xilinx.com, mark.burton@greensocs.com
Message-ID: <d4a776fc-2022-979e-cc68-beb3123d35bd@greensocs.com>
Subject: Re: [PATCH v3 20/20] arm/virt: Add support for GICv2 virtualization
 extensions
References: <20180629132954.24269-1-luc.michel@greensocs.com>
 <20180629132954.24269-21-luc.michel@greensocs.com>
 <d8062fb6-8eef-eff3-fa92-9f9f791ee669@web.de>
 <a199e550-4576-3a03-a7c1-8c21bb502cf5@web.de>
In-Reply-To: <a199e550-4576-3a03-a7c1-8c21bb502cf5@web.de>

--cZzX1pB6lGnvN5338PlyeoAPBk90h2jUJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable



On 07/05/2018 10:00 AM, Jan Kiszka wrote:
> On 2018-07-05 08:51, Jan Kiszka wrote:
>> On 2018-06-29 15:29, Luc Michel wrote:
>>> Add support for GICv2 virtualization extensions by mapping the necess=
ary
>>> I/O regions and connecting the maintenance IRQ lines.
>>>
>>> Declare those additions in the device tree and in the ACPI tables.
>>>
>>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>>> ---
>>>  hw/arm/virt-acpi-build.c |  4 ++++
>>>  hw/arm/virt.c            | 50 +++++++++++++++++++++++++++++++++-----=
--
>>>  include/hw/arm/virt.h    |  3 +++
>>>  3 files changed, 49 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index 6ea47e2588..3b74bf0372 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -659,6 +659,8 @@ build_madt(GArray *table_data, BIOSLinker *linker=
, VirtMachineState *vms)
>>>          gicc->length =3D sizeof(*gicc);
>>>          if (vms->gic_version =3D=3D 2) {
>>>              gicc->base_address =3D cpu_to_le64(memmap[VIRT_GIC_CPU].=
base);
>>> +            gicc->gich_base_address =3D cpu_to_le64(memmap[VIRT_GIC_=
HYP].base);
>>> +            gicc->gicv_base_address =3D cpu_to_le64(memmap[VIRT_GIC_=
VCPU].base);
>>>          }
>>>          gicc->cpu_interface_number =3D cpu_to_le32(i);
>>>          gicc->arm_mpidr =3D cpu_to_le64(armcpu->mp_affinity);
>>> @@ -670,6 +672,8 @@ build_madt(GArray *table_data, BIOSLinker *linker=
, VirtMachineState *vms)
>>>          }
>>>          if (vms->virt && vms->gic_version =3D=3D 3) {
>>>              gicc->vgic_interrupt =3D cpu_to_le32(PPI(ARCH_GICV3_MAIN=
T_IRQ));
>>> +        } else if (vms->virt && vms->gic_version =3D=3D 2) {
>>> +            gicc->vgic_interrupt =3D cpu_to_le32(PPI(ARCH_GICV2_MAIN=
T_IRQ));
>>>          }
>>>      }
>>> =20
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 742f68afca..e45b9de3be 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -131,6 +131,8 @@ static const MemMapEntry a15memmap[] =3D {
>>>      [VIRT_GIC_DIST] =3D           { 0x08000000, 0x00010000 },
>>>      [VIRT_GIC_CPU] =3D            { 0x08010000, 0x00010000 },
>>>      [VIRT_GIC_V2M] =3D            { 0x08020000, 0x00001000 },
>>> +    [VIRT_GIC_HYP] =3D            { 0x08030000, 0x00001000 },
>>> +    [VIRT_GIC_VCPU] =3D           { 0x08040000, 0x00001000 },
>>>      /* The space in between here is reserved for GICv3 CPU/vCPU/HYP =
*/
>>>      [VIRT_GIC_ITS] =3D            { 0x08080000, 0x00020000 },
>>>      /* This redistributor space allows up to 2*64kB*123 CPUs */
>>> @@ -438,11 +440,26 @@ static void fdt_add_gic_node(VirtMachineState *=
vms)
>>>          /* 'cortex-a15-gic' means 'GIC v2' */
>>>          qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
>>>                                  "arm,cortex-a15-gic");
>>> -        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>>> -                                      2, vms->memmap[VIRT_GIC_DIST].=
base,
>>> -                                      2, vms->memmap[VIRT_GIC_DIST].=
size,
>>> -                                      2, vms->memmap[VIRT_GIC_CPU].b=
ase,
>>> -                                      2, vms->memmap[VIRT_GIC_CPU].s=
ize);
>>> +        if (!vms->virt) {
>>> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>>> +                                         2, vms->memmap[VIRT_GIC_DIS=
T].base,
>>> +                                         2, vms->memmap[VIRT_GIC_DIS=
T].size,
>>> +                                         2, vms->memmap[VIRT_GIC_CPU=
].base,
>>> +                                         2, vms->memmap[VIRT_GIC_CPU=
].size);
>>> +        } else {
>>> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
>>> +                                         2, vms->memmap[VIRT_GIC_DIS=
T].base,
>>> +                                         2, vms->memmap[VIRT_GIC_DIS=
T].size,
>>> +                                         2, vms->memmap[VIRT_GIC_CPU=
].base,
>>> +                                         2, vms->memmap[VIRT_GIC_CPU=
].size,
>>> +                                         2, vms->memmap[VIRT_GIC_HYP=
].base,
>>> +                                         2, vms->memmap[VIRT_GIC_HYP=
].size,
>>> +                                         2, vms->memmap[VIRT_GIC_VCP=
U].base,
>>> +                                         2, vms->memmap[VIRT_GIC_VCP=
U].size);
>>> +            qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
>>> +                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV2_=
MAINT_IRQ,
>>> +                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>>> +        }
>>>      }
>>> =20
>>>      qemu_fdt_setprop_cell(vms->fdt, "/intc", "phandle", vms->gic_pha=
ndle);
>>> @@ -563,6 +580,11 @@ static void create_gic(VirtMachineState *vms, qe=
mu_irq *pic)
>>>              qdev_prop_set_uint32(gicdev, "redist-region-count[1]",
>>>                  MIN(smp_cpus - redist0_count, redist1_capacity));
>>>          }
>>> +    } else {
>>> +        if (!kvm_irqchip_in_kernel()) {
>>> +            qdev_prop_set_bit(gicdev, "has-virtualization-extensions=
",
>>> +                              vms->virt);
>>> +        }
>>>      }
>>>      qdev_init_nofail(gicdev);
>>>      gicbusdev =3D SYS_BUS_DEVICE(gicdev);
>>> @@ -574,6 +596,10 @@ static void create_gic(VirtMachineState *vms, qe=
mu_irq *pic)
>>>          }
>>>      } else {
>>>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base=
);
>>> +        if (vms->virt) {
>>> +            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_HYP].=
base);
>>> +            sysbus_mmio_map(gicbusdev, 3, vms->memmap[VIRT_GIC_VCPU]=
=2Ebase);
>>> +        }
>>>      }
>>> =20
>>>      /* Wire the outputs from each CPU's generic timer and the GICv3
>>> @@ -600,9 +626,17 @@ static void create_gic(VirtMachineState *vms, qe=
mu_irq *pic)
>>>                                                     ppibase + timer_i=
rq[irq]));
>>>          }
>>> =20
>>> -        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-inter=
rupt", 0,
>>> -                                    qdev_get_gpio_in(gicdev, ppibase=

>>> -                                                     + ARCH_GICV3_MA=
INT_IRQ));
>>> +        if (type =3D=3D 3) {
>>> +            qemu_irq irq =3D qdev_get_gpio_in(gicdev,
>>> +                                            ppibase + ARCH_GICV3_MAI=
NT_IRQ);
>>> +            qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-i=
nterrupt",
>>> +                                        0, irq);
>>> +        } else if (vms->virt) {
>>> +            qemu_irq irq =3D qdev_get_gpio_in(gicdev,
>>> +                                            ppibase + ARCH_GICV2_MAI=
NT_IRQ);
>>> +            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
>>> +        }
>>> +
>>>          qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
>>>                                      qdev_get_gpio_in(gicdev, ppibase=

>>>                                                       + VIRTUAL_PMU_I=
RQ));
>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>> index 9a870ccb6a..9e2f33f2d1 100644
>>> --- a/include/hw/arm/virt.h
>>> +++ b/include/hw/arm/virt.h
>>> @@ -42,6 +42,7 @@
>>>  #define NUM_VIRTIO_TRANSPORTS 32
>>>  #define NUM_SMMU_IRQS          4
>>> =20
>>> +#define ARCH_GICV2_MAINT_IRQ  9
>>>  #define ARCH_GICV3_MAINT_IRQ  9
>>> =20
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
>>  * Patch 2bb3135 in Linux explains why the probe may need to scans the=

>>  * first 8 registers: some early implementation returned 0 for the fir=
st
>>  * ITARGETSR registers.
>>  * Since those didn't have virtualization extensions, we can safely
>>  * ignore that case.
>>  */
>>
>> But maybe I'm just off with the configuration, checking...
>>
>=20
> As suspected, it's a bug in QEMU, this resolves it, and I can run Linux=

> as root cell and a bare metal non-root cell:
>=20
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 7d24348d96..199f953ddb 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -965,7 +965,11 @@ static uint32_t gic_dist_readb(void *opaque, hwadd=
r offset, MemTxAttrs attrs)
>              if (irq >=3D 29 && irq <=3D 31) {
>                  res =3D cm;
>              } else {
> -                res =3D GIC_DIST_TARGET(irq);
> +                if (irq < GIC_INTERNAL) {
> +                    res =3D 1 << gic_get_current_cpu(s);
> +                } else {
> +                    res =3D GIC_DIST_TARGET(irq);
> +                }
>              }
>          }
>      } else if (offset < 0xf00) {
>=20
> Didn't test Linux as non-root cell (secondary guest) yet, but that
> should work as well. I'm seeing issues in an error shutdown path, but
> that might be the same on real hw, needs cross-checking.Hi Jan, thanks =
for your feedback!

Yes I encountered the same issue with Xen in SMP (see my cover letter).
Re-reading the GICv2 specs, it's now clear to me that a read to
ITARGETSR0 to ITARGETSR7 should return "the number of the processor
performing the read". Reading the message of commit 2bb3135 in Linux, it
seems that older versions of the GIC exposed this value in IRQs 29, 30,
31, hence the
   if (irq >=3D 29 && irq <=3D 31) { res =3D cm; }
in the current QEMU implementation.

I should probably add a patch to fix that. I'll have to dig in specs of
older GIC revisions to see when this behaviour actually appeared.

Maybe I wait for some reviews before sending a new re-roll?
Peter, any thoughts?

Thanks.

Luc

>=20
> Jan
>=20


--cZzX1pB6lGnvN5338PlyeoAPBk90h2jUJ--

--D0zGgT5bqN7s9E87qo1zdcviDw0zDYF9y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAls92v8ACgkQd8knW3Qn
Tr4+/Q//XaF2/76RGuV3vXuQljA0WiKb+uAAOkl0o/FrCxQEHiAbDxGYwcZW4Upu
JlMy2U9sIbW8pwaR/Zgnly17YyJ6rIQt8OlcZARtCnJXj51gFdFYadgSMCvVFesY
0Wvxgx5Z8LQuoDjwZPuSAaGNiZ3OMl9xQUnIIKy8EhzUcX3ew+wYV37qrgERchQc
XJtgPjal2ya0hFVUR2NkSuC6WRc2KJk9JZW1fNhh2dpfCuqOLOWeKuTQGAgDnWPe
wzlNv0yUqEH8YX5wnhoB+pIMkwhbZmcOJL8ZLDrtdz/wQsJeTjTQzBBZE/UxmmTB
yRTfei0HW2eVFlq2/sh158rKSPX8Tlm4AznWSBAY0jD04ggJwkRZ+SB+djTZAm9T
+TQ5OHUgnXtdgj2mwyX8GrUP4WM2nrVX1AxgqnMRKbahS+BLw8avp6BlZzsc++Vx
Y9v7Z2DDP0KbmAyEL5SzwL/JJdg9h5mC4S1GQVNdql989Hul78EuFmINhT/xQtyP
VUJOAr7A1DyiRHD8mMgTY5v/OaGwSoRgVar0M5Yk6KkbK+nKWwY8sQSq1CScvGWh
pjN84FCgYC5v++iTRdfB2prltW0qBEoEyV5gHHax/aQDvZ/X9nZMunf8AY8fYGsK
jtNabdgyLzvWXEItOLgkDDrKpiEavkQTaI9E1XlDufdaJ62ZUu0=
=3K39
-----END PGP SIGNATURE-----

--D0zGgT5bqN7s9E87qo1zdcviDw0zDYF9y--
