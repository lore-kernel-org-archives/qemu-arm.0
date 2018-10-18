Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2234278wrt;
        Thu, 18 Oct 2018 05:51:15 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61C2/SynvvHyRNAbmkwjGQ1z81pfZuvnRSmkuMiLuSyJXb6sKG0hfXf1k16AqSokRvAh3/d
X-Received: by 2002:ac8:46da:: with SMTP id h26-v6mr29505850qto.369.1539867074883;
        Thu, 18 Oct 2018 05:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539867074; cv=none;
        d=google.com; s=arc-20160816;
        b=R1n06HV076IyZg2BS+HZzCYRVF2BAtqVPxXVXKzwTvgeYwh6GNa2o/GSsMU1Q4sMzf
         X7zud1keI4E55Y0i/Nyu/Q8TJcJIxApM7VtNm7IcyHNcr6rGZRW6lNrsG84Qzgwz4W/H
         DrDufWTmItEpbnBVFFarxBlqDDbBg8daRuOC8n+r1tc3en4CB6naqGgXaFyjAdBOFBIl
         eqFnwRVw/gKfBAiMmxuITfdgUmNbV+k8Vy4eBFczxYa1PRxlmkes2aSvy0pDdep3FyEl
         gZTtfTITl6W69vDoXJhtEONuKU/AAs8UKyliK+ZIoxMwB5jb8/f79ca6q5TttnnHc5Ek
         TtHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=gudZkVOshz/gUh+WpPigKhBnStLlCIlk4qGCYkrJFjs=;
        b=i1w2/o8yWepbOa8v0rvU5mMaCvQ12KdqjtWTaGw+Uz1Pkai5LU2trsCA9yiC8ktts9
         cpRiscPjFLYFTRObdaUZdkdnIKzYe4RdlFRYp2aZGL5ak2mBt2ykLh7UM8fUDhz7qIEP
         nrvGLwFzKBdx68I8KFFiQ70vnWIfXxNmKc0D04C8ZKYxA/oD4hTYb9r6J70MZIYPMMPu
         XqziC2P9qthJphv81ZptnUgwSwA8Gv/r6yRRTIFVmV/yozfWgZDg4NzX4ehWlt5OFRT6
         4dNkyxpFABE8z6nvMyUdjkemRYL+M21D/quH1Vo71gobMCyN0hOgpIJCZlm4oRG3rC8h
         PQdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42si10664488qvn.159.2018.10.18.05.51.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 05:51:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD7li-0001X4-CA
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 08:51:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gD7lR-0001RJ-Cj
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 08:50:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gD7lM-0005Ld-NU
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 08:50:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42831)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gD7lM-0005J7-3n
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 08:50:52 -0400
Received: by mail-wr1-f66.google.com with SMTP id r17-v6so1198576wrt.9
	for <qemu-arm@nongnu.org>; Thu, 18 Oct 2018 05:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gudZkVOshz/gUh+WpPigKhBnStLlCIlk4qGCYkrJFjs=;
	b=VN6qq50xC+h8HTAmPfJmhDnKHlvoRCZPVFS4DX4WuP238XeQ7EbJn4Itsd3WzHlLwD
	Yzjy6vx7qrS/VXX30tKChx1jcnmFFfD29X030y1Jvhn3z/sUyBIx80dmirTpnVD3fksX
	IW8utsoYoRwxtbWRBr1rXa+CFpuXATTctXQJ4bC4oF3/h/G1m4Hv4MJNm+1eqS6w5OIe
	eaWAgTDDNPIOJRzLr9WW0xTA6co2l+LFMboCbWhpdhUu7ptbJ10SdZRTzgVtGc9tLO0f
	RSLf47t+k/vdtUEhRAo8qBrE/IEK9+VCpzcOp8oh11Zqk6M8kY9UTYYUDzhG+DEf6+hj
	mRrQ==
X-Gm-Message-State: ABuFfojMxA4eH1U3ZU4Z7XdNnoN8yloBPeHliMsd/sa8Ml7t2LIFIKru
	GJ4Jxyx73lVLwka7C7uHtq5LwIt9CuFuMA==
X-Received: by 2002:adf:9244:: with SMTP id
	62-v6mr27676354wrj.130.1539867050264; 
	Thu, 18 Oct 2018 05:50:50 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2eec:b420:d26b:a0d4:f86e:1389?
	([2a01:e35:2eec:b420:d26b:a0d4:f86e:1389])
	by smtp.gmail.com with ESMTPSA id
	f16-v6sm18244578wrw.89.2018.10.18.05.50.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Oct 2018 05:50:49 -0700 (PDT)
To: Peng Hao <peng.hao2@zte.com.cn>
References: <1539772017-18735-1-git-send-email-peng.hao2@zte.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e58e9c18-a850-2c57-af80-dd390376149d@redhat.com>
Date: Thu, 18 Oct 2018 14:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1539772017-18735-1-git-send-email-peng.hao2@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] target/arm : add pvpanic
 mmio device
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
X-TUID: 767EqvBe7vBn

On 17/10/2018 12:26, Peng Hao wrote:
> Add pvpanic mmio device that is similar to x86's pvpanic device.
> 
> v1 ---> v2 add copyright and license for new files.
> 

This comment is not useful in the git history.
Everything put below the next '---' line will be ignore from the patch
description, you should put it there instead.

> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---

Here:

v1 ---> v2 add copyright and license for new files.

>  default-configs/arm-softmmu.mak |  2 +-
>  hw/arm/virt.c                   | 21 +++++++++
>  hw/misc/Makefile.objs           |  1 +
>  hw/misc/pvpanic-mmio.c          | 97 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h           |  1 +
>  include/hw/misc/pvpanic-mmio.h  | 33 ++++++++++++++
>  6 files changed, 154 insertions(+), 1 deletion(-)
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
> index 0000000..bcb9791
> --- /dev/null
> +++ b/hw/misc/pvpanic-mmio.c
> @@ -0,0 +1,97 @@
> +/*
> + * pvpanic mmio device emulation
> + *
> + * Copyright (c) 2018 ZTE Ltd.
> + *
> + * Author:
> + *  Peng Hao <peng.hao2@zte.com.cn>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
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
> index 0000000..0c4f728
> --- /dev/null
> +++ b/include/hw/misc/pvpanic-mmio.h
> @@ -0,0 +1,33 @@
> +/*
> + * pvpanic mmio device emulation
> + *
> + * Copyright (c) 2018 ZTE Ltd.
> + *
> + * Author:
> + *  Peng Hao <peng.hao2@zte.com.cn>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
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
