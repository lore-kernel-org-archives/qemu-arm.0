Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp440221wrt;
        Wed, 17 Oct 2018 02:53:33 -0700 (PDT)
X-Google-Smtp-Source: ACcGV633D40on5s8qZhoYH8mtzGWnBol638iy4n2VADehXiQM/Wqf8rEO8HF4t1mJLBIK99O0iI/
X-Received: by 2002:a37:3bc1:: with SMTP id i184-v6mr890727qka.286.1539770013909;
        Wed, 17 Oct 2018 02:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539770013; cv=none;
        d=google.com; s=arc-20160816;
        b=FP6mg5Q7tlWDNMJslYCHSwfS3CKwSbIWt0BMLzjzjfL6wwKApLkr/KafRnfMtHkOPQ
         cuV8aTwyujhKm11yiPmCMKGprj6X7ZSoEPRaqXYF+o5mRfLCpGh+yxxXyu0TbWwiZ9ru
         FaG6buCuZn2VWAmKRcemu6neKoG+DDd923xOwx1Er0SfoJxwXWZMmELqDaqFnWrQ1dQZ
         xpNQeaNbSvac/QHmiI0ubSJ2x/Gks2Lpjoq69KQm1DAJnEsS1jQJMiO3d+yX92hawfAw
         LMlCJeU6JXAGR+ww6gRD30mUMzwXYq4cB+dmSxatowvOW1lWNYtecZwuvwQlGZzulFlK
         8JxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=7DdKRvK836hmoCok/Ak9gOTcBr7eeqW1fhdaGu6xfP4=;
        b=VTN/2lm9ZeoPdC0D/9j1mnhE7pEjgZiTGxZaxE3v743ckCtrEA6xOq9tSrWgudIIWi
         T3ULeEU41MWMMCrBuHcKi2hCXAdO6YxngkenIXXW+mHShMMCv64IkODaCbmPnyDE6e6I
         b1xonoXVAqtwyp/DAzfcgwwIw0wltqcWgK92flMe6te5ZP1gHP3jaS1HGLWbIGz2kGPD
         iP/aFVgPVIm2b2Fcf1rHgpo5Ml5FmNzp1akV+A2SrwAtns9QVpyW+uuPYFUrQkUQSSdq
         6SYljxC1vwQxb5Lh4fMn1y2nAwLFoTo97J10nwzFlaDLoUP8IC++3zLukWKbg8wjxAbr
         ZVjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g134-v6si432327qkg.139.2018.10.17.02.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 02:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCiWD-00081x-C2
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 05:53:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gCiVz-00080O-Kx
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 05:53:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gCiVv-0008Sp-6O
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 05:53:19 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gCiVu-0008QS-TY
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 05:53:15 -0400
Received: by mail-wr1-f67.google.com with SMTP id 61-v6so28913562wrb.6
	for <qemu-arm@nongnu.org>; Wed, 17 Oct 2018 02:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7DdKRvK836hmoCok/Ak9gOTcBr7eeqW1fhdaGu6xfP4=;
	b=Q9fd9DtMhCRwW1MQa13B5W9s2UqAhlD/79mptF6ZrG4j3fgMhuj1hWXQhWUjeg7pib
	R7sFPADMNziJAeEB1JO9M+o+nBfq9mlZCE+OTTFojrx1SCi0QtH1YjXGD5Aw6YSO3/gP
	UxyUKDR1fido/ifPLhyYMdbC+hK5aXXD//XEbDLSnuqzw2FSM8krXb9PVJh7OBhUJob6
	VBSvhdQaMKBY4S9LyLygLtNJfb6t5xkBkIMUg7o7FNiqbuu3A8rWgaFwtjRy7SLQC8UB
	Og6IJyzrOz+D29+j4y5o4OPYsXO7iVHtPw2dimSnL5bCvhnaPesG0HMrKZCouPuhqF0Z
	VIog==
X-Gm-Message-State: ABuFfojU2QHqHhvp3e0ve9v1D9bt2Iu3KI5HHuE01WnUlX7sNNF649Tu
	2bzv83bwkcyVSIz9FeN2/REW7g==
X-Received: by 2002:adf:9367:: with SMTP id
	94-v6mr23910216wro.211.1539769993170; 
	Wed, 17 Oct 2018 02:53:13 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2eec:b420:d26b:a0d4:f86e:1389?
	([2a01:e35:2eec:b420:d26b:a0d4:f86e:1389])
	by smtp.gmail.com with ESMTPSA id
	h82-v6sm946659wmf.14.2018.10.17.02.53.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 02:53:12 -0700 (PDT)
To: Peng Hao <peng.hao2@zte.com.cn>
References: <1539768207-18209-1-git-send-email-peng.hao2@zte.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <61bc5059-e7b1-3371-66b3-5bc10d06935b@redhat.com>
Date: Wed, 17 Oct 2018 11:53:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1539768207-18209-1-git-send-email-peng.hao2@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm : add pvpanic mmio
 device
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nevNYoPwR+TR

Hi Peng,

On 17/10/2018 11:23, Peng Hao wrote:
> Add pvpanic mmio device that is similar to x86's pvpanic device.

> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  default-configs/arm-softmmu.mak |  2 +-
>  hw/arm/virt.c                   | 21 ++++++++++++
>  hw/misc/Makefile.objs           |  1 +
>  hw/misc/pvpanic-mmio.c          | 76 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h           |  1 +
>  include/hw/misc/pvpanic-mmio.h  | 12 +++++++
>  6 files changed, 112 insertions(+), 1 deletion(-)
>  create mode 100644 hw/misc/pvpanic-mmio.c
>  create mode 100644 include/hw/misc/pvpanic-mmio.h
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2420491..4713c92 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -43,7 +43,7 @@ CONFIG_USB_MUSB=y
>  CONFIG_USB_EHCI_SYSBUS=y
>  CONFIG_PLATFORM_BUS=y
>  CONFIG_VIRTIO_MMIO=y
> -
> +CONFIG_PVPANIC_MMIO=y
>  CONFIG_ARM11MPCORE=y
>  CONFIG_A9MPCORE=y
>  CONFIG_A15MPCORE=y
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a472566..ab41128 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -140,6 +140,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_UART] =               { 0x09000000, 0x00001000 },
>      [VIRT_RTC] =                { 0x09010000, 0x00001000 },
>      [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
> +    [VIRT_PVPANIC_MMIO] =       { 0x09020018, 0x00000002 },
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
> @@ -798,6 +799,24 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>      g_free(nodename);
>  }
>  
> +static void create_pvpanic_device(const VirtMachineState *vms)
> +{
> +    char *nodename;
> +    hwaddr base = vms->memmap[VIRT_PVPANIC_MMIO].base;
> +    hwaddr size = vms->memmap[VIRT_PVPANIC_MMIO].size;
> +
> +    sysbus_create_simple("pvpanic-mmio", base, NULL);
> +
> +    nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
> +    qemu_fdt_add_subnode(vms->fdt, nodename);
> +    qemu_fdt_setprop_string(vms->fdt, nodename,
> +                            "compatible", "pvpanic,mmio");
> +    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +    g_free(nodename);
> +
> +}
> +
>  static void create_virtio_devices(const VirtMachineState *vms, qemu_irq *pic)
>  {
>      int i;
> @@ -1544,6 +1563,8 @@ static void machvirt_init(MachineState *machine)
>  
>      create_pcie(vms, pic);
>  
> +    create_pvpanic_device(vms);
> +
>      create_gpio(vms, pic);
>  
>      /* Create mmio transports, so the user can create virtio backends
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 6d50b03..6326260 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -71,6 +71,7 @@ obj-$(CONFIG_IOTKIT_SYSCTL) += iotkit-sysctl.o
>  obj-$(CONFIG_IOTKIT_SYSINFO) += iotkit-sysinfo.o
>  
>  obj-$(CONFIG_PVPANIC) += pvpanic.o
> +obj-$(CONFIG_PVPANIC_MMIO) += pvpanic-mmio.o
>  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
>  obj-$(CONFIG_AUX) += auxbus.o
>  obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
> diff --git a/hw/misc/pvpanic-mmio.c b/hw/misc/pvpanic-mmio.c
> new file mode 100644
> index 0000000..c7f373e
> --- /dev/null
> +++ b/hw/misc/pvpanic-mmio.c
> @@ -0,0 +1,76 @@
> +#include "qemu/osdep.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/log.h"
> +#include "hw/misc/pvpanic-mmio.h"
> +
> +#define PVPANIC_MMIO_FEAT_CRASHED      0
> +
> +#define PVPANIC_MMIO_CRASHED        (1 << PVPANIC_MMIO_FEAT_CRASHED)
> +
> +static void handle_mmio_event(int event)
> +{
> +    static bool logged;
> +
> +    if (event & ~PVPANIC_MMIO_CRASHED && !logged) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "pvpanic-mmio: unknown event %#x.\n", event);
> +        logged = true;
> +    }
> +
> +    if (event & PVPANIC_MMIO_CRASHED) {
> +        qemu_system_guest_panicked(NULL);
> +        return;
> +    }

It would be easier to maintain a single pvpanic device. There is no
improvement here, it is the same handler than 'pvpanic.c'.

The current pvpanic device is not x86-only, it only implements the
ioport API.
If you want to use the mmio API, please add it there.
Basically you don't have to write any more code that in this patch, but
just move it in the pvpanic.c file.

Thanks,

Phil.

> +}
> +
> +static uint64_t pvpanic_mmio_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    return -1;
> +}
> +
> +static void pvpanic_mmio_write(void *opaque, hwaddr addr, uint64_t value,
> +                                 unsigned size)
> +{
> +   handle_mmio_event(value);
> +}
> +
> +static const MemoryRegionOps pvpanic_mmio_ops = {
> +    .read = pvpanic_mmio_read,
> +    .write = pvpanic_mmio_write,
> +    .impl = {
> +        .min_access_size = 1,
> +        .max_access_size = 2,
> +    },
> +};
> +
> +
> +static void pvpanic_mmio_initfn(Object *obj)
> +{
> +    PVPanicState *s = PVPANIC_MMIO_DEVICE(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_io(&s->mmio, OBJECT(s), &pvpanic_mmio_ops, s,
> +                          "pvpanic-mmio", 2);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +}
> +
> +static void pvpanic_mmio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static TypeInfo pvpanic_mmio_info = {
> +    .name          = TYPE_PVPANIC_MMIO,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(PVPanicState),
> +    .instance_init = pvpanic_mmio_initfn,
> +    .class_init    = pvpanic_mmio_class_init,
> +};
> +
> +static void pvpanic_mmio_register_types(void)
> +{
> +    type_register_static(&pvpanic_mmio_info);
> +}
> +
> +type_init(pvpanic_mmio_register_types)
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 4cc57a7..61cc310 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -70,6 +70,7 @@ enum {
>      VIRT_MMIO,
>      VIRT_RTC,
>      VIRT_FW_CFG,
> +    VIRT_PVPANIC_MMIO,
>      VIRT_PCIE,
>      VIRT_PCIE_MMIO,
>      VIRT_PCIE_PIO,
> diff --git a/include/hw/misc/pvpanic-mmio.h b/include/hw/misc/pvpanic-mmio.h
> new file mode 100644
> index 0000000..2e6bec3
> --- /dev/null
> +++ b/include/hw/misc/pvpanic-mmio.h
> @@ -0,0 +1,12 @@
> +#ifndef HW_MISC_PVPANIC_H
> +#define HW_MISC_PVPANIC_H
> +#include "hw/sysbus.h"
> +#define TYPE_PVPANIC_MMIO "pvpanic-mmio"
> +#define PVPANIC_MMIO_DEVICE(obj)    \
> +    OBJECT_CHECK(PVPanicState, (obj), TYPE_PVPANIC_MMIO)
> +#endif
> +
> +typedef struct PVPanicState {
> +    SysBusDevice parent_obj;
> +    MemoryRegion mmio;
> +} PVPanicState;
> 
