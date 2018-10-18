Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2232568wrt;
        Thu, 18 Oct 2018 05:49:40 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60zWvSp9f+RCd+mABPLN1fyCUjfa8IPOMD7NGjzlPcE7vTjzw0dXC0XbgRZmpE/SSSGh/z1
X-Received: by 2002:aed:2c86:: with SMTP id g6-v6mr29355232qtd.15.1539866980552;
        Thu, 18 Oct 2018 05:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539866980; cv=none;
        d=google.com; s=arc-20160816;
        b=r9edzTdy55qyIRwFdP1ZpnPXfGi3u7r/yKxhia23IFHevRUN+pSdhrn1c8N7gJkZtc
         vPhmTqbv8ZDzhUTCPRv533UnkTtwFVFb9qmcTlrmCKAgpMN8Qq5S7B7ZnKxDfBrxYyo5
         U5NjbeDSxkft/wgE6Czu0cS5LArjVkqIOaqDR9Aw/dNfs7izFnWcNnWH2aQYl1uvXkWc
         wIzDSI/AM6TTIpD2AeKmQMk7EKb3li14lgjiQwwSgvVC6qUvJiQrF4ZLT8fIHm836q+f
         zggDxzy2GJ5JcPdg6nznM/tQQRqbMDOaUEW+elHY5D2DwrALNkrN4l1Yoh+jJvGCCdkW
         AtPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=1ePZOn1XEGTVsPL0JMD7DeNqNA6QlC7UqlnCkdm933M=;
        b=Hhw3JiPRGBm6Ru5DaNgL+bPkydipdricScs69bydfEQynSrBtASIbJdi5pNrMgjnAV
         w+PReV7lnpE0ZLd9Dq9F+6r/sLV9lOeuCJW+n0hkoIaDunEkNriZiaUXTzc7fmrVLxDK
         Yorc7AxzKbbzAaq9fyNl0GWkLdJzOhLIgzd2Bk4GkuYeB5ssjnuCF6qe1RlTBuhCghOx
         kKvzvqpfXsBC73Mpd8pm/y8kpH9vZHl/IGULgfx7EVLeLbAeEHHLMD7/oUb8ANyuGjG0
         9crBxo7N0guuYEPxL6HqZvTXbMj+sja5YrFEf5mCiOXZK0TwoX0rdEAZpbzv+DxQlakm
         WOXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23-v6si179108qkl.66.2018.10.18.05.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 05:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD7kC-0000cS-1A
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 08:49:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gD7jv-0000af-Ez
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 08:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gD7jg-0004G6-ON
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 08:49:13 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39996)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gD7jg-0004FJ-FY
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 08:49:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id d2-v6so33558602wro.7
	for <qemu-arm@nongnu.org>; Thu, 18 Oct 2018 05:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1ePZOn1XEGTVsPL0JMD7DeNqNA6QlC7UqlnCkdm933M=;
	b=DqBZOj2o3GLm7zZlyuKFUDtBfuknX9WLAenAZrZt2Mr1utRfkiylz57N/tT9joF8Yq
	jqd246SZE7aYnAWP3RiTH9G/OZ5mt8IVCHfpd0txlQFBD/RTcO7t+eNInNxswDfzU9Qh
	TNSrUPSnbgzyf4ZBegmHdy9uD0RAAn4fstgWgB0QSlOf5leMfnefWwWUFQNTD67fSLCQ
	oRUSqLwoJdS4r4+OMEIo63hXkmOnAPdX9jarDpsnJigbMsUR943RpxAJyXjBT5F3JyVz
	EBb6Wase7wtlZ6Mw1resEFfs9L2oqIJ1NOLkjxqXbAjxieSsSlAqyzJeHokNZ807TPfW
	HbuA==
X-Gm-Message-State: ABuFfogLNQ16W/mVn4G1XeJzvNYmBoRLmGveYvheSsbI+rtHu8pFuWzw
	FudLqGY7HWdkQ8Ccq4Vrk7veXTJsBG9oWw==
X-Received: by 2002:adf:e784:: with SMTP id
	n4-v6mr30736025wrm.187.1539866947325; 
	Thu, 18 Oct 2018 05:49:07 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2eec:b420:d26b:a0d4:f86e:1389?
	([2a01:e35:2eec:b420:d26b:a0d4:f86e:1389])
	by smtp.gmail.com with ESMTPSA id
	y125-v6sm146561wme.12.2018.10.18.05.49.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Oct 2018 05:49:06 -0700 (PDT)
To: peng.hao2@zte.com.cn
References: <201810180855169525575@zte.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f8e8f743-4205-1258-b3ed-a83c15df3507@redhat.com>
Date: Thu, 18 Oct 2018 14:49:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <201810180855169525575@zte.com.cn>
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
X-TUID: gz2efpFnRUEX

On 18/10/2018 02:55, peng.hao2@zte.com.cn wrote:
>> Hi Peng,
>>
>> On 17/10/2018 11:23, Peng Hao wrote:
>>> Add pvpanic mmio device that is similar to x86's pvpanic device.
>>
>>>
>>> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
>>> ---
>>>  default-configs/arm-softmmu.mak |  2 +-
>>>  hw/arm/virt.c                   | 21 ++++++++++++
>>>  hw/misc/Makefile.objs           |  1 +
>>>  hw/misc/pvpanic-mmio.c          | 76 +++++++++++++++++++++++++++++++++++++++++
>>>  include/hw/arm/virt.h           |  1 +
>>>  include/hw/misc/pvpanic-mmio.h  | 12 +++++++
>>>  6 files changed, 112 insertions(+), 1 deletion(-)
>>>  create mode 100644 hw/misc/pvpanic-mmio.c
>>>  create mode 100644 include/hw/misc/pvpanic-mmio.h
>>>
>>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>>> index 2420491..4713c92 100644
>>> --- a/default-configs/arm-softmmu.mak
>>> +++ b/default-configs/arm-softmmu.mak
>>> @@ -43,7 +43,7 @@ CONFIG_USB_MUSB=y
>>>  CONFIG_USB_EHCI_SYSBUS=y
>>>  CONFIG_PLATFORM_BUS=y
>>>  CONFIG_VIRTIO_MMIO=y
>>> -
>>> +CONFIG_PVPANIC_MMIO=y
>>>  CONFIG_ARM11MPCORE=y
>>>  CONFIG_A9MPCORE=y
>>>  CONFIG_A15MPCORE=y
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index a472566..ab41128 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -140,6 +140,7 @@ static const MemMapEntry a15memmap[] = {
>>>      [VIRT_UART] =               { 0x09000000, 0x00001000 },
>>>      [VIRT_RTC] =                { 0x09010000, 0x00001000 },
>>>      [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
>>> +    [VIRT_PVPANIC_MMIO] =       { 0x09020018, 0x00000002 },
>>>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>>>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>>>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
>>> @@ -798,6 +799,24 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>>>      g_free(nodename);
>>>  }
>>>
>>> +static void create_pvpanic_device(const VirtMachineState *vms)
>>> +{
>>> +    char *nodename;
>>> +    hwaddr base = vms->memmap[VIRT_PVPANIC_MMIO].base;
>>> +    hwaddr size = vms->memmap[VIRT_PVPANIC_MMIO].size;
>>> +
>>> +    sysbus_create_simple("pvpanic-mmio", base, NULL);
>>> +
>>> +    nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
>>> +    qemu_fdt_add_subnode(vms->fdt, nodename);
>>> +    qemu_fdt_setprop_string(vms->fdt, nodename,
>>> +                            "compatible", "pvpanic,mmio");
>>> +    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
>>> +                                 2, base, 2, size);
>>> +    g_free(nodename);
>>> +
>>> +}
>>> +
>>>  static void create_virtio_devices(const VirtMachineState *vms, qemu_irq *pic)
>>>  {
>>>      int i;
>>> @@ -1544,6 +1563,8 @@ static void machvirt_init(MachineState *machine)
>>>
>>>      create_pcie(vms, pic);
>>>
>>> +    create_pvpanic_device(vms);
>>> +
>>>      create_gpio(vms, pic);
>>>
>>>      /* Create mmio transports, so the user can create virtio backends
>>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>>> index 6d50b03..6326260 100644
>>> --- a/hw/misc/Makefile.objs
>>> +++ b/hw/misc/Makefile.objs
>>> @@ -71,6 +71,7 @@ obj-$(CONFIG_IOTKIT_SYSCTL) += iotkit-sysctl.o
>>>  obj-$(CONFIG_IOTKIT_SYSINFO) += iotkit-sysinfo.o
>>>
>>>  obj-$(CONFIG_PVPANIC) += pvpanic.o
>>> +obj-$(CONFIG_PVPANIC_MMIO) += pvpanic-mmio.o
>>>  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
>>>  obj-$(CONFIG_AUX) += auxbus.o
>>>  obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
>>> diff --git a/hw/misc/pvpanic-mmio.c b/hw/misc/pvpanic-mmio.c
>>> new file mode 100644
>>> index 0000000..c7f373e
>>> --- /dev/null
>>> +++ b/hw/misc/pvpanic-mmio.c
>>> @@ -0,0 +1,76 @@
>>> +#include "qemu/osdep.h"
>>> +#include "sysemu/sysemu.h"
>>> +#include "qemu/log.h"
>>> +#include "hw/misc/pvpanic-mmio.h"
>>> +
>>> +#define PVPANIC_MMIO_FEAT_CRASHED      0
>>> +
>>> +#define PVPANIC_MMIO_CRASHED        (1 << PVPANIC_MMIO_FEAT_CRASHED)
>>> +
>>> +static void handle_mmio_event(int event)
>>> +{
>>> +    static bool logged;
>>> +
>>> +    if (event & ~PVPANIC_MMIO_CRASHED && !logged) {
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "pvpanic-mmio: unknown event %#x.\n", event);
>>> +        logged = true;
>>> +    }
>>> +
>>> +    if (event & PVPANIC_MMIO_CRASHED) {
>>> +        qemu_system_guest_panicked(NULL);
>>> +        return;
>>> +    }
>>
>> It would be easier to maintain a single pvpanic device. There is no
>> improvement here, it is the same handler than 'pvpanic.c'.
>>
>> The current pvpanic device is not x86-only, it only implements the
>> ioport API.
> But in linux kernel the driver of pvpanic device is x86-only.
> 
>> If you want to use the mmio API, please add it there.
>> Basically you don't have to write any more code that in this patch, but
>> just move it in the pvpanic.c file.
> I want to use pvpanic directly instead of adding a new device emulation.
> But I can't use it. Firstly pvpanic use ioport, but arm don't support ioport.
> secondly pvpanic device is emulated as a isa bus device, but arm don't support
> isa bus.

I tried to explain how to do it, but it was easier to just refactor your
patch to show what I was expecting, so I'll send a series instead.

> thirdly the realization of pvpanic device is depends on ACPI in linux kernel driver and in qemu
> the port info is passed through ACPI , but It is not necessary to configure ACPI for arm guest. 
> 
> Thanks.
>>
>> Thanks,
>>
>> Phil.
