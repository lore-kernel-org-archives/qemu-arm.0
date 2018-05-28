Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2662693wre;
        Mon, 28 May 2018 09:47:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKJnPijP3xKNrUO0p4rso5ejA7Ui0cOjJ9/hUyUVVQ0HhBMeYtteQMIDeC9CAlfPlrliUX4
X-Received: by 2002:a37:4bc5:: with SMTP id y188-v6mr12097178qka.309.1527526049791;
        Mon, 28 May 2018 09:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527526049; cv=none;
        d=google.com; s=arc-20160816;
        b=u4rLWMLe9AmEwFsbm8HVVJg4SZDft48s+K3u8m7Sv/4zixKPPNDbjv2vJ1CG581yQ8
         VlY5Eg2NeYnGZWKo1Z+49xfPnZVmvDjggVCBEyxFv2Sy/wbg7mVWiBUWpq36SXcShc3r
         de+Fq7R8rfzlRLmYNGDuab8MiyRtMU2jCuHmHht10pmD9PcCvA5rfz+vZ2i99kyYaZaN
         ycE3tYKhdg8rgZtIWcTp69Et6qs6db80HJVeV892J6CePGHLgx6eelVcMYmfKJF+Ox6u
         4oZo6JrEjrJLcNVN870oaWJDtv+Oksg7e+7eMFcsAafe7xI+ClmTEvnOzCnD7HY+O1Ix
         iXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=yA5c1caq+UVH/LJXL6YFxiid7zOWdHgurPrKE795+nQ=;
        b=G1BUorKJvSamy03+jk5VKR9DdvsPlV5LdZw0uT1fC9AIoWYFe9SZ6kKg654gIVRgM4
         0QT+QukFZZUrYJXHa+1Ii7fC2mxRmO9q1AcVjclXRAVG0X7rCrVJentlGWhH7qJ3ZVKU
         2AD/4iP7sZ4wAS/NpEwdnuNQ3tnoZae+MtaW2uiukx0cpSMzDQ+1cfmpzvmIaG/TD7tk
         fpzgrMuhbvRwSzl9INnrzgmFZAYDAc3LWBokv1SuZrMA9Pc03xTMV3YV6kKSUxq1+wO2
         u+AfToknWOBI7HpJL0jbcaaZD5k4oPWaAwHCBsw33eeTeMyiixfxMkOLJ2oS930Lczff
         YN9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 50-v6si8130656qvi.158.2018.05.28.09.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 09:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNLIv-0001wJ-9t
	for alex.bennee@linaro.org; Mon, 28 May 2018 12:47:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fNLIn-0001wE-P1
	for qemu-arm@nongnu.org; Mon, 28 May 2018 12:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fNLIj-0004Zd-Nv
	for qemu-arm@nongnu.org; Mon, 28 May 2018 12:47:21 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33848 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fNLIj-0004ZP-Gb; Mon, 28 May 2018 12:47:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C77A07C6C4;
	Mon, 28 May 2018 16:47:15 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B8002024CA1;
	Mon, 28 May 2018 16:47:14 +0000 (UTC)
Date: Mon, 28 May 2018 18:47:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20180528164712.y5rjhu7xixqkjgoe@kamzik.brq.redhat.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-3-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180516152026.2920-3-shameerali.kolothum.thodi@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 28 May 2018 16:47:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 28 May 2018 16:47:15 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 2/6] hw/arm/virt: Enable
 dynamic generation of guest RAM memory regions
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
Cc: peter.maydell@linaro.org, zhaoshenglong@huawei.com, linuxarm@huawei.com,
	qemu-devel@nongnu.org, eric.auger@redhat.com,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	jonathan.cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cQBjGfXtBvdf

On Wed, May 16, 2018 at 04:20:22PM +0100, Shameer Kolothum wrote:
> Register ram_memory_region_init notifier to allocate memory region
> from system memory.
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

I realize we've been slow to get to this for reviewing, but a lot has
changed here since this patch was written. virt now only has a single
machine done notifier. On rebase we should attempt to integrate with
that one rather than introduce a new one.

Thanks,
drew


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
> -- 
> 2.7.4
> 
> 
> 
