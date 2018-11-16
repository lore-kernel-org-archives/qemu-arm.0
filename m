Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7812068wrw;
        Thu, 15 Nov 2018 19:30:18 -0800 (PST)
X-Google-Smtp-Source: AJdET5d707UYNpg49AKbGEeyPDidrZjbV2rbuhvIXdOyTVDL3j+eBpLHlfMS5jKi9SKxNw1Zf6Eo
X-Received: by 2002:a0c:b28e:: with SMTP id r14mr8747183qve.241.1542339018572;
        Thu, 15 Nov 2018 19:30:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542339018; cv=none;
        d=google.com; s=arc-20160816;
        b=hIKbIYS5oQcVkSy0CWfZmVGdrqzA772biPXnY/iVtdGZrAL4syKfuO3IbOprnfcu0B
         AegyuJvj8RHp6CgkZ61UIHRhL/KrycqNdR9fXmlg30yUKMlHssLLtwiRnLEX+JvSvOaO
         ikO1yYZEReOQZ7K5rNxnuP0pQxIKnOwCo/HXeIqTyhSSofqfDYz3HqjmtNQzKKc0Kvbt
         tXYh8tJqZ8HWUMzdzKVBdRY9Pts1rXt4vAMvXqSitEq/gU3lt/KYptXqKD67wkP51qpJ
         +NCVkLvABJGGbFF8vffJDft7/VMy2WzrWeOAQ4RGyD9v876DmKiFKS0cDq0y5d8HAPeK
         N5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=tNSeOOAyA/N6gvKEUTKd0H57YI2BQS+HPmdlsmLuaGU=;
        b=yxYvGCBL2go3BhlMP3vAQQ1z9Tra62aAKLLXzQJX7SRyIhbF/+Ut5tmC1T3Jerj4q6
         vJcVNw4T/sS+bRk/ebPQTQAEFPkB9XZzWNr2nQVkoIf9xzx4ID0HxnxxxO7JUDFx3VTT
         WmTJVWGiMDd2la5WvEx6PBmuaZqqUyh/BEmReD5aH2kiKaYKyD7rxzGHWx3D1thirBqX
         LvvsFBapNNbKqjYWLRJm0KHslS6tyPbCGzXoW8f3FzjxbzvsAPf0GHrzs+/349/7DyWa
         FWNDTk2OesyGcHW9ML7d9SAkz5S2emWQz6Xhu+Bpr8Dfi4M41xUfwUDgXwcwuG42xXo6
         ONZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QNNLJgJO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q45si7734378qte.344.2018.11.15.19.30.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 19:30:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QNNLJgJO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNUpl-000596-T9
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 22:30:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gNUoz-00057Y-6x
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 22:29:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gNUou-0001Ef-1h
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 22:29:27 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1gNUos-0001Df-9b; Thu, 15 Nov 2018 22:29:23 -0500
Received: by mail-oi1-x243.google.com with SMTP id p82-v6so18565376oih.11;
	Thu, 15 Nov 2018 19:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tNSeOOAyA/N6gvKEUTKd0H57YI2BQS+HPmdlsmLuaGU=;
	b=QNNLJgJOScRbfaisn0ZvZZk9uFpgO9ZkQhPdWZ5sc+90BRjH6d2LY1pz9L8o5+FRxq
	llLAW9++pLBJUKEo3ybwq2GAI7FeiDSrt6SV9bW8LzaeTFlMdCe4eYCMBK3AxI90JSvT
	TL6GquPztuuooWl42gcHFVcEsFqXNecwQ8uSAZ2xu8P/zF87U4iHTikPSB1LF59dPg0h
	SEg1X8Qzx0pA/+4AJJuR/87X6iurM3GeO5jBu98jVsaG4xbq3ZZ1gL74xkOPXal4q4ZU
	3lqlMTysV9uz7aYgIfxi33K5jW/U8iMzLUmaxBm5esfrbsePTGw/rCmaTbAMc/xuwPqR
	+MSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tNSeOOAyA/N6gvKEUTKd0H57YI2BQS+HPmdlsmLuaGU=;
	b=dXzk4WLiGsFNHai0gTA4nm4xla5HOTUp2ALoGi1Ovcad9DHRGEsWk0yYixf6EEBYSj
	jQbrge07wTqPldhPFVrvtdwqK3xV55XP+qDweub6yShTjW+5KsVCChgYrea/3vpTsOkB
	YlDLdBnJHTV0xOhPyJugekqFeI1LFrYzIXeZsbKON/UFKsQYkHvPV6Pic356tGG+Z2zD
	LW8We3a0viFCjZ9nuGEft2UNX5qShTEvN12HBo+By4EH/L3ITHKo8MEDGRnAb2UVlBPr
	UdHQ7m3LGY2NB7ecFND4POsXFEVOD/SUo+uMqtJz9W2v1fVYKqVaTVlrOejab1TsciRw
	BZGQ==
X-Gm-Message-State: AGRZ1gLy0RSouYeSAeU+b9gietJgIV8qx1M7h2e0RCC2aQdJ39Y9lc+9
	kz7XtDcCfAnksFwBKcuFYEQtNgQO
X-Received: by 2002:aca:4e92:: with SMTP id c140mr43570oib.97.1542338959304;
	Thu, 15 Nov 2018 19:29:19 -0800 (PST)
Received: from [30.43.105.71] ([47.89.83.45]) by smtp.gmail.com with ESMTPSA id
	x127sm5140001oia.20.2018.11.15.19.29.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Nov 2018 19:29:18 -0800 (PST)
To: Peng Hao <peng.hao2@zte.com.cn>, peter.maydell@linaro.org,
	drjones@redhat.com, philmd@redhat.com
References: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
	<1542365406-81310-5-git-send-email-peng.hao2@zte.com.cn>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <28d47b6b-acfd-3e24-2926-84e9fffee6c8@gmail.com>
Date: Fri, 16 Nov 2018 11:29:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1542365406-81310-5-git-send-email-peng.hao2@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH V7 4/6] hw/arm/virt: Use the
 pvpanic device
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nP/L0+iDoSpF

Hi,

On 2018/11/16 18:50, Peng Hao wrote:
>   Add pvpanic device in arm virt machine.
> 
> Signed-off-by: Peng Hao<peng.hao2@zte.com.cn>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   default-configs/arm-softmmu.mak |  1 +
>   hw/arm/virt.c                   | 21 +++++++++++++++++++++
>   include/hw/arm/virt.h           |  1 +
>   3 files changed, 23 insertions(+)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2420491..50345df 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -159,3 +159,4 @@ CONFIG_PCI_DESIGNWARE=y
>   CONFIG_STRONGARM=y
>   CONFIG_HIGHBANK=y
>   CONFIG_MUSICPAL=y
> +CONFIG_PVPANIC=y
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9f67782..c4f29c8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -59,6 +59,7 @@
>   #include "qapi/visitor.h"
>   #include "standard-headers/linux/input.h"
>   #include "hw/arm/smmuv3.h"
> +#include "hw/misc/pvpanic.h"
>   
>   #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>       static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -143,6 +144,7 @@ static const MemMapEntry a15memmap[] = {
>       [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>       [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>       [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
> +    [VIRT_PVPANIC] =            { 0x09070000, 0x00000002 },
>       [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>       /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>       [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -190,6 +192,23 @@ static bool cpu_type_valid(const char *cpu)
>       return false;
>   }
>   
> +static void create_pvpanic_device(const VirtMachineState *vms)
> +{
> +    char *nodename;
> +    hwaddr base = vms->memmap[VIRT_PVPANIC].base;
> +    hwaddr size = vms->memmap[VIRT_PVPANIC].size;
> +
> +    sysbus_create_simple(TYPE_PVPANIC_MMIO, base, NULL);
> +
> +    nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
> +    qemu_fdt_add_subnode(vms->fdt, nodename);
> +    qemu_fdt_setprop_string(vms->fdt, nodename,
> +                            "compatible", "qemu,pvpanic-mmio");
> +    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +    g_free(nodename);
> +}
> +
>   static void create_fdt(VirtMachineState *vms)
>   {
>       void *fdt = create_device_tree(&vms->fdt_size);
> @@ -1531,6 +1550,8 @@ static void machvirt_init(MachineState *machine)
>   
>       create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>   
> +    create_pvpanic_device(vms);
> +
It should not create pvpanic by default. It should be configurable via 
-device pvpanic.

Thanks,
Shannon
