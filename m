Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp921687wrt;
        Mon, 11 Mar 2019 11:00:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVSRECGORG5PIS/AflfWoPs3MfEJyFgi/a2rA8PajCWnWCIWAYnMdLoxC4WN91/5UsdZHs
X-Received: by 2002:a25:cc1:: with SMTP id 184mr28190835ybm.395.1552327207409;
        Mon, 11 Mar 2019 11:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552327207; cv=none;
        d=google.com; s=arc-20160816;
        b=ima75IGnZoJR1wjJKHH8qlH3/dHkZXF/5POPdDPcy7bn95hSKK8JUWikfPpcrUGbXQ
         xFNsx7CNkepE0c+GzlaupUecz4EwL010EBTpkrZPPOSA2VSV/SCZiayqCyJUqOi4zMHV
         zJgCAbrisT8pGyu5AVA/8P4cEbD99WdweUwoE3Jabs5RzwyeBcLwigS1G3p4k5iQWMAY
         e4K8FWnUziPTxsFxGfARaw0iUUNfPxCoRhz7Is2FLccg7ownhE0niRU/hQgWZlyKw3r1
         lzS5VToLfCU7DPiCLVn+kKhbmLPxQITDLt3Z7rEVVcWvbWAM0EVO4kfvKF1BMRN7j6Du
         1HbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=r+85HAbnrAMITWiqNt1wPtiPQxZAxDltnwwXTV72QXw=;
        b=ELKWWl+jktNNR9FfSV7gwS1tvGfEBqDG9+HG31pLgfkl/11cVCBz4NivCtLaQfb/Dk
         rdmLTHSvdxqkET2zsrGLqNzty9ddWFmnOZw0MXbfHzO0s0h0vbHPKuS3//2du/wYeI6R
         cKriju3gWbisrVUtvfOhXMAYUpKyU4UenlAJ8k0wHK0AZUFNQVdycHW1fuGkh9BJX7rs
         Klq89ruVgWNxnEH2WDEHiZtmzQBXdWdzladOhb5IvHl/qnWWbc0xct+uGjyKhpuE+JMq
         hwG+T2gObhtyRWl3phwmr1AX1HGKkP2Q2Vs5enZiQM9VdEPsGLQ0wgVuZZYx6X++SNqY
         RMwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s188si2785963yws.32.2019.03.11.11.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Mar 2019 11:00:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3PDa-0000CY-R6
	for alex.bennee@linaro.org; Mon, 11 Mar 2019 14:00:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3PC5-0007Et-Md
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 13:58:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h3PBr-0004FL-J2
	for qemu-arm@nongnu.org; Mon, 11 Mar 2019 13:58:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35373)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h3PBr-0004Em-8G; Mon, 11 Mar 2019 13:58:19 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C94C308425A;
	Mon, 11 Mar 2019 17:58:18 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3C5F60BF1;
	Mon, 11 Mar 2019 17:58:15 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-7-shameerali.kolothum.thodi@huawei.com>
	<3c656ef1-a58e-6461-254e-140976b01d4e@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839304E27@lhreml524-mbb.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5b73e82c-8fb3-6968-0c1b-5ec4378c0143@redhat.com>
Date: Mon, 11 Mar 2019 18:58:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA839304E27@lhreml524-mbb.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 11 Mar 2019 17:58:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 06/11] hw/arm/virt: Add ACPI support for
 device memory cold-plug
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
Cc: Linuxarm <linuxarm@huawei.com>, "xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bKT2Ht8oDe3E

Hi Shameer,
On 3/11/19 6:37 PM, Shameerali Kolothum Thodi wrote:
>=20
>=20
>> -----Original Message-----
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: 11 March 2019 13:32
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> qemu-devel@nongnu.org; qemu-arm@nongnu.org; imammedo@redhat.com;
>> peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
>> sameo@linux.intel.com; sebastien.boeuf@intel.com
>> Cc: Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>
>> Subject: Re: [PATCH v2 06/11] hw/arm/virt: Add ACPI support for device
>> memory cold-plug
>>
>> Hi Shameer,
>>
>> On 3/8/19 12:42 PM, Shameer Kolothum wrote:
>>> This adds support to build the aml code so that Guest can see the
>> s/Guest/the guest
>>> cold-plugged device memory.
>>
>> Isn't the colplug part only related to acpi_dsdt_add_memory_hotplug()?=
 I
>> understand the patch also adds some hotplug infra?
>=20
> Hmm..build_memory_hotplug_aml() doesn=E2=80=99t do much if io_base addr=
ess
> Is not initialized. So we need the acpi_memory_hotplug_init().
Yes that's correct, we need it for cold-plug.
>=20
> Also, I think acpi_memory_plug_cb() needs to be called for cold-plugged=
 dimm
> otherwise the scan wont detect it.
You may be right as some MemStatus fields are updated also in coldplug ca=
se.

Worth to double check the bare minimal to make cold-plug OK in ACPI mode
(without the dt node generation in ACPI mode as suggested by Igor), and
augment the commit message with more details.

Thanks

Eric

> =20
>> Can't you just keerp the dsdt additions here, move the virt-acpi chang=
es
>> in the original patch and move the virt-acpi instantiation in a
>> subsequent patch?
>=20
> Ok, will take look if there is any scope for reordering this.
>=20
> Thanks,
> Shameer
> =20
>> Thanks
>>
>> Eric
>>>
>>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com=
>
>>> ---
>>>  default-configs/arm-softmmu.mak |  1 +
>>>  hw/arm/virt-acpi-build.c        |  9 +++++++++
>>>  hw/arm/virt-acpi.c              | 23 +++++++++++++++++++++++
>>>  hw/arm/virt.c                   | 11 +++++++++++
>>>  include/hw/arm/virt.h           |  2 ++
>>>  5 files changed, 46 insertions(+)
>>>
>>> diff --git a/default-configs/arm-softmmu.mak
>> b/default-configs/arm-softmmu.mak
>>> index fbc4564..b3bac25 100644
>>> --- a/default-configs/arm-softmmu.mak
>>> +++ b/default-configs/arm-softmmu.mak
>>> @@ -167,3 +167,4 @@ CONFIG_HIGHBANK=3Dy
>>>  CONFIG_MUSICPAL=3Dy
>>>  CONFIG_MEM_DEVICE=3Dy
>>>  CONFIG_DIMM=3Dy
>>> +CONFIG_ACPI_MEMORY_HOTPLUG=3Dy
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index d7e2e48..87d66da 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -40,6 +40,7 @@
>>>  #include "hw/loader.h"
>>>  #include "hw/hw.h"
>>>  #include "hw/acpi/aml-build.h"
>>> +#include "hw/acpi/memory_hotplug.h"
>>>  #include "hw/pci/pcie_host.h"
>>>  #include "hw/pci/pci.h"
>>>  #include "hw/arm/virt.h"
>>> @@ -49,6 +50,13 @@
>>>  #define ARM_SPI_BASE 32
>>>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>>>
>>> +static void acpi_dsdt_add_memory_hotplug(Aml *scope, MachineState
>> *ms)
>>> +{
>>> +    uint32_t nr_mem =3D ms->ram_slots;
>>> +
>>> +    build_memory_hotplug_aml(scope, nr_mem, "\\_SB", NULL,
>> AML_SYSTEM_MEMORY);
>>> +}
>>> +
>>>  static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
>>>  {
>>>      uint16_t i;
>>> @@ -740,6 +748,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
>> VirtMachineState *vms)
>>>       * the RTC ACPI device at all when using UEFI.
>>>       */
>>>      scope =3D aml_scope("\\_SB");
>>> +    acpi_dsdt_add_memory_hotplug(scope, MACHINE(vms));
>>>      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
>>>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>>>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
>>> diff --git a/hw/arm/virt-acpi.c b/hw/arm/virt-acpi.c
>>> index df8a02b..18ebe94 100644
>>> --- a/hw/arm/virt-acpi.c
>>> +++ b/hw/arm/virt-acpi.c
>>> @@ -26,9 +26,11 @@
>>>  #include "hw/arm/virt.h"
>>>
>>>  #include "hw/acpi/acpi.h"
>>> +#include "hw/acpi/memory_hotplug.h"
>>>
>>>  typedef struct VirtAcpiState {
>>>      SysBusDevice parent_obj;
>>> +    MemHotplugState memhp_state;
>>>  } VirtAcpiState;
>>>
>>>  #define TYPE_VIRT_ACPI "virt-acpi"
>>> @@ -44,6 +46,16 @@ static const VMStateDescription vmstate_acpi =3D {
>>>  static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
>>>                                  DeviceState *dev, Error **errp)
>>>  {
>>> +    VirtAcpiState *s =3D VIRT_ACPI(hotplug_dev);
>>> +
>>> +    if (s->memhp_state.is_enabled &&
>>> +        object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>> +            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state,
>>> +                                dev, errp);
>>> +    } else {
>>> +        error_setg(errp, "virt: device plug request for unsupported
>> device"
>>> +                   " type: %s", object_get_typename(OBJECT(dev)));
>>> +    }
>>>  }
>>>
>>>  static void virt_device_unplug_request_cb(HotplugHandler *hotplug_de=
v,
>>> @@ -62,6 +74,15 @@ static void virt_send_ged(AcpiDeviceIf *adev,
>> AcpiEventStatusBits ev)
>>>
>>>  static void virt_device_realize(DeviceState *dev, Error **errp)
>>>  {
>>> +    VirtMachineState *vms =3D VIRT_MACHINE(qdev_get_machine());
>>> +    const MemMapEntry *memmap =3D vms->memmap;
>>> +    VirtAcpiState *s =3D VIRT_ACPI(dev);
>>> +
>>> +    if (s->memhp_state.is_enabled) {
>>> +        acpi_memory_hotplug_init(get_system_memory(), OBJECT(dev),
>>> +                                 &s->memhp_state,
>>> +
>> memmap[VIRT_PCDIMM_ACPI].base);
>>> +    }
>>>  }
>>>
>>>  DeviceState *virt_acpi_init(void)
>>> @@ -70,6 +91,8 @@ DeviceState *virt_acpi_init(void)
>>>  }
>>>
>>>  static Property virt_acpi_properties[] =3D {
>>> +    DEFINE_PROP_BOOL("memory-hotplug-support", VirtAcpiState,
>>> +                     memhp_state.is_enabled, true),
>>>      DEFINE_PROP_END_OF_LIST(),
>>>  };
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 40a1273..9427f4f 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -133,6 +133,7 @@ static const MemMapEntry base_memmap[] =3D {
>>>      [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
>>>      [VIRT_SECURE_UART] =3D        { 0x09040000, 0x00001000 },
>>>      [VIRT_SMMU] =3D               { 0x09050000, 0x00020000 },
>>> +    [VIRT_PCDIMM_ACPI] =3D        { 0x09070000, 0x00010000 },
>>>      [VIRT_MMIO] =3D               { 0x0a000000, 0x00000200 },
>>>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of th=
at
>> size */
>>>      [VIRT_PLATFORM_BUS] =3D       { 0x0c000000, 0x02000000 },
>>> @@ -1648,6 +1649,8 @@ static void machvirt_init(MachineState *machine=
)
>>>
>>>      create_platform_bus(vms, pic);
>>>
>>> +    vms->acpi =3D virt_acpi_init();
>>> +
>>>      vms->bootinfo.ram_size =3D machine->ram_size;
>>>      vms->bootinfo.kernel_filename =3D machine->kernel_filename;
>>>      vms->bootinfo.kernel_cmdline =3D machine->kernel_cmdline;
>>> @@ -1832,11 +1835,19 @@ static void
>> virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>>>  static void virt_memory_plug(HotplugHandler *hotplug_dev,
>>>                               DeviceState *dev, Error **errp)
>>>  {
>>> +    HotplugHandlerClass *hhc;
>>>      VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
>>>      Error *local_err =3D NULL;
>>>
>>>      pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), &local_err);
>>> +    if (local_err) {
>>> +        goto out;
>>> +    }
>>> +
>>> +    hhc =3D HOTPLUG_HANDLER_GET_CLASS(vms->acpi);
>>> +    hhc->plug(HOTPLUG_HANDLER(vms->acpi), dev, &error_abort);
>>>
>>> +out:
>>>      error_propagate(errp, local_err);
>>>  }
>>>
>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>> index 6076167..e46a051 100644
>>> --- a/include/hw/arm/virt.h
>>> +++ b/include/hw/arm/virt.h
>>> @@ -77,6 +77,7 @@ enum {
>>>      VIRT_GPIO,
>>>      VIRT_SECURE_UART,
>>>      VIRT_SECURE_MEM,
>>> +    VIRT_PCDIMM_ACPI,
>>>      VIRT_LOWMEMMAP_LAST,
>>>  };
>>>
>>> @@ -132,6 +133,7 @@ typedef struct {
>>>      uint32_t iommu_phandle;
>>>      int psci_conduit;
>>>      hwaddr highest_gpa;
>>> +    DeviceState *acpi;
>>>  } VirtMachineState;
>>>
>>>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM :
>> VIRT_PCIE_ECAM)
>>>
