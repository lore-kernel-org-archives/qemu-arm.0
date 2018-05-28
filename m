Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2531930wre;
        Mon, 28 May 2018 07:24:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKis8YBxEhRpooNAjUPTLhdlTe3veU7hmBmaoRWwaUeWXIAdpe0Zwac3vHXG45pUgtx6nXz
X-Received: by 2002:ae9:de85:: with SMTP id s127-v6mr11680236qkf.34.1527517461632;
        Mon, 28 May 2018 07:24:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527517461; cv=none;
        d=google.com; s=arc-20160816;
        b=Oe28BTrvA3mVAPnIWsKIFZf4+uIxcgFubP+kmRGa5Yygkee0nD3JyC5qdC6Go7KbuC
         9JjfKUR0R+Z5XaPFzcsdTLp1toth8Vhta8qvtoNkxTg63s/ghfKFVE1zC6JgF9RTueEO
         DrDuMmfKSlZwDa6vp7+C/SwGNgKd9DrrOX1hKRqu+gxGiFYABiDM/JbA+m8V+bcIJVuU
         dxtTUL4/FB0127QuZjRMz1K73MtQNobj9dfMZ1m+SAZayedaficu7CrzjOcO62fTEk6N
         dPBTVvPuTnLN5wi+Uc6FI/RA4VzbR6IzFOqSQx/gE9Cw67tyTesHCtipdPOAa42sPui8
         wiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=CKqKyteBciPgXpVq+NQxMcJR9tLUPh+lD5TEWv102Jw=;
        b=OBZTpawV1r9E1XKRmJCpPnFl9B8Avauef1EKFBontfl0z7Tta+L29h97NmLOyNOKPc
         M69A6EdzNqrkQvFm39xNXAwc5rWI7Ib+x+nQWjgEJoHrCMhgCkuNUf8oYVJ2A2uYYlvs
         EAgiYPyTh0nC7Ek7x4dm5UCLqEQE0f0yB9z+L4ULxXeTAJ9aWgK6Q53ysWd97YBktAz5
         WuftXWwlIR4Ful/OfeKYtJvazBs7S/xrLOvcv+HAYjX+h0YgAOYAiEM2P5Ghdzstc8qu
         TiZICNWxJv0QjTU3abKCf5iaLa1c8iZFbxaSBVdncG30YSZxGiqQGGjAtNQwYq7RdKaN
         jXeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j32-v6si3986253qtj.47.2018.05.28.07.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 07:24:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNJ4P-0001Fe-46
	for alex.bennee@linaro.org; Mon, 28 May 2018 10:24:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ2D-00088h-JC
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ2A-0006UK-Bc
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:22:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56574 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNJ2A-0006Tr-6O; Mon, 28 May 2018 10:22:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C29E27D84D;
	Mon, 28 May 2018 14:22:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 549E32026609;
	Mon, 28 May 2018 14:22:00 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-3-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <58fb3661-8c2a-7fef-aeaa-ab175ea5bdd9@redhat.com>
Date: Mon, 28 May 2018 16:21:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180516152026.2920-3-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 28 May 2018 14:22:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 28 May 2018 14:22:01 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v2 2/6] hw/arm/virt: Enable dynamic generation
 of guest RAM memory regions
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jonathan.cameron@huawei.com,
	linuxarm@huawei.com, alex.williamson@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OC1TEwiwV5Qb

Hi Shameer,
On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> Register ram_memory_region_init notifier to allocate memory region
> from system memory.

At this stage the commit message does not explain why you need a machine
init done notifier. Also the commit title does not summarize the actual
change.
Thanks

Eric
> 
> Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt.c         | 28 ++++++++++++++++++++++------
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 94dcb12..05fcb62 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1171,6 +1171,19 @@ void virt_machine_done(Notifier *notifier, void *data)
>      virt_build_smbios(vms);
>  }
>  
> +static void virt_ram_memory_region_init(Notifier *notifier, void *data)
> +{
> +    MemoryRegion *sysmem = get_system_memory();
> +    MemoryRegion *ram = g_new(MemoryRegion, 1);
> +    VirtMachineState *vms = container_of(notifier, VirtMachineState,
> +                                         ram_memory_region_init);
> +    MachineState *machine = MACHINE(vms);
> +
> +    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
> +                                         machine->ram_size);
> +    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
> +}
> +
>  static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>  {
>      uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
> @@ -1204,7 +1217,6 @@ static void machvirt_init(MachineState *machine)
>      MemoryRegion *sysmem = get_system_memory();
>      MemoryRegion *secure_sysmem = NULL;
>      int n, virt_max_cpus;
> -    MemoryRegion *ram = g_new(MemoryRegion, 1);
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>  
>      /* We can probe only here because during property set
> @@ -1361,10 +1373,6 @@ static void machvirt_init(MachineState *machine)
>      fdt_add_timer_nodes(vms);
>      fdt_add_cpu_nodes(vms);
>  
> -    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
> -                                         machine->ram_size);
> -    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
> -
>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>  
>      create_gic(vms, pic);
> @@ -1405,15 +1413,23 @@ static void machvirt_init(MachineState *machine)
>      vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
>      vms->bootinfo.get_dtb = machvirt_dtb;
>      vms->bootinfo.firmware_loaded = firmware_loaded;
> +
> +    /* Register notifiers. They are executed in registration reverse order */
>      arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
>  
>      /*
>       * arm_load_kernel machine init done notifier registration must
>       * happen before the platform_bus_create call. In this latter,
>       * another notifier is registered which adds platform bus nodes.
> -     * Notifiers are executed in registration reverse order.
>       */
>      create_platform_bus(vms, pic);
> +
> +    /*
> +     * Register memory region notifier last as this has to be executed
> +     * first.
> +     */
> +    vms->ram_memory_region_init.notify = virt_ram_memory_region_init;
> +    qemu_add_machine_init_done_notifier(&vms->ram_memory_region_init);
>  }
>  
>  static bool virt_get_secure(Object *obj, Error **errp)
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index ba0c1a4..fc24f3a 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -91,6 +91,7 @@ typedef struct {
>  typedef struct {
>      MachineState parent;
>      Notifier machine_done;
> +    Notifier ram_memory_region_init;
>      FWCfgState *fw_cfg;
>      bool secure;
>      bool highmem;
> 
