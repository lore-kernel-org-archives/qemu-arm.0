Received: by 10.223.150.237 with SMTP id u100csp3683773wrb;
        Tue, 14 Nov 2017 06:47:28 -0800 (PST)
X-Google-Smtp-Source: AGs4zManCllqSZZpqNbt0xNDwTtVFsHPYf85tjMl4AFOECFBEjmhGEtnH+OHRMQlc1A9DUcMkvm6
X-Received: by 10.13.239.7 with SMTP id y7mr8002747ywe.122.1510670848630;
        Tue, 14 Nov 2017 06:47:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510670848; cv=none;
        d=google.com; s=arc-20160816;
        b=Dr8dZw6meJU686ZFSFEQ8eMMM5pMn1a2SOpNHAjChN8ycs2N979NrI45IYJnr7I5tO
         SsjyBTv+U+Yg7aiYvOdXaylP14lv2JaudTxMTQj+8+Z8OmRTtep0OUJtO187fzCLmlSq
         XruKhP+7YFk6h7msbtjf4pDq+3fqZZ9jqYYyeZNbQdG48QmbalS126rv9vWMNIKy83Wf
         LWEHAAkXCB8waBTVk30UJEuXsS7a+JZh2zf2HeXO75Ro5o/Skrb57Hcp8vcrxOMIqVXN
         iudcdZ54BjabdyykQmRzY3Uj7JnumotKEi0ODO0tKrYC7KbkYKKDQufebOsx+0galD67
         NH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=Jhsi1wijFgoTuB45kR8/ancl6phygjC+mZOIBnsAO4U=;
        b=RxALw1yw9FGfnTBNvHw917KVxdx/4JcJY3QaHG1jTvunRnWQGPqki9z2aekNVtnRmD
         HOLYDKk3o5R0zLKwOe8ttpXyLKOWD1htakh8qtygTNr0kVt6aXyKJT/UFQZYThgfMT0T
         iITyp74kcl64X4HNuAeRS6S/5J8pnAfdUU9vY18JGZn0N0v7vYDVcwQJSW+u0DSximJn
         DmGulhb34Hk3nlIlHQJQEg30CNO/UuE59SuNYQgR1jcBoDfgHGnXORhJesec0QpUJb/v
         JEux0Tke46N1ZMKyZDoA12soBnVTVAutUW6mUymiM1ZHYlO5McKDjGz4IfsjnSaHCOxa
         9CAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g67si3953141yba.486.2017.11.14.06.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Nov 2017 06:47:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEcUq-00018d-3n
	for alex.bennee@linaro.org; Tue, 14 Nov 2017 09:47:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eEcUi-00017A-S1
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 09:47:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eEcUf-0004hQ-NI
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 09:47:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45694)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eEcUf-0004gF-DU; Tue, 14 Nov 2017 09:47:17 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 961B3C0587CB;
	Tue, 14 Nov 2017 14:47:15 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D91D293535;
	Tue, 14 Nov 2017 14:47:10 +0000 (UTC)
Date: Tue, 14 Nov 2017 15:47:08 +0100
From: Andrew Jones <drjones@redhat.com>
To: zhuyijun@huawei.com
Message-ID: <20171114144708.uzh6mkmjygojfpbu@kamzik.brq.redhat.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-3-git-send-email-zhuyijun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510622154-17224-3-git-send-email-zhuyijun@huawei.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 14 Nov 2017 14:47:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 2/5] hw/arm/virt: Enable dynamic
 generation of guest RAM memory regions
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fzt0pB//5nDq

On Tue, Nov 14, 2017 at 09:15:51AM +0800, zhuyijun@huawei.com wrote:
> From: Zhu Yijun <zhuyijun@huawei.com>
> 
> Register a ram_memory_region_init notify to allocate memory region
> from system memory and add them as subregions.
> 
> Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> ---
>  hw/arm/virt.c         | 21 ++++++++++++++++-----
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9e18b41..ddde5e1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1225,6 +1225,19 @@ void virt_machine_done(Notifier *notifier, void *data)
>      virt_build_smbios(vms);
>  }
>  
> +static void virt_ram_memory_region_init(Notifier *notifier, void *data)
> +{
> +    MachineState *machine = MACHINE(qdev_get_machine());

No need to use qdev_get_machine(), you can get it with MACHINE(vms).

> +    MemoryRegion *sysmem = get_system_memory();
> +    MemoryRegion *ram = g_new(MemoryRegion, 1);
> +    VirtMachineState *vms = container_of(notifier, VirtMachineState,
> +                                         ram_memory_region_init);
> +
> +    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
> +                                         machine->ram_size);
> +    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
> +}
> +
>  static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>  {
>      uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
> @@ -1258,7 +1271,6 @@ static void machvirt_init(MachineState *machine)
>      MemoryRegion *sysmem = get_system_memory();
>      MemoryRegion *secure_sysmem = NULL;
>      int n, virt_max_cpus;
> -    MemoryRegion *ram = g_new(MemoryRegion, 1);
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>  
>      /* We can probe only here because during property set
> @@ -1409,10 +1421,6 @@ static void machvirt_init(MachineState *machine)
>      fdt_add_cpu_nodes(vms);
>      fdt_add_psci_node(vms);
>  
> -    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
> -                                         machine->ram_size);
> -    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
> -
>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>  
>      create_gic(vms, pic);
> @@ -1462,6 +1470,9 @@ static void machvirt_init(MachineState *machine)
>       * Notifiers are executed in registration reverse order.
>       */
>      create_platform_bus(vms, pic);
> +
> +    vms->ram_memory_region_init.notify = virt_ram_memory_region_init;
> +    qemu_add_machine_init_done_notifier(&vms->ram_memory_region_init);

Does this notifier need to be the first one executed? If so, then a
comment should be added to state that. Actually the comment above
create_platform_bus() could be replaced with a comment above the first
notifier that states all notifier dependencies.

>  }
>  
>  static bool virt_get_secure(Object *obj, Error **errp)
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 33b0ff3..38906b8 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -90,6 +90,7 @@ typedef struct {
>  typedef struct {
>      MachineState parent;
>      Notifier machine_done;
> +    Notifier ram_memory_region_init;
>      FWCfgState *fw_cfg;
>      bool secure;
>      bool highmem;
> -- 
> 1.8.3.1
> 
> 
>

Thanks,
drew 
