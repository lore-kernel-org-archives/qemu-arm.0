Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp503630wru;
        Wed, 8 Aug 2018 02:44:37 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwuFFoe6RoHGGhz3ZpP8UkklThkog3GctAiHL1vlC6Wv5pHmdtZehMut5Fug2Fm9khnkKHV
X-Received: by 2002:aed:22ed:: with SMTP id q42-v6mr1862509qtc.193.1533721477000;
        Wed, 08 Aug 2018 02:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533721476; cv=none;
        d=google.com; s=arc-20160816;
        b=F+6WD7B5OJ/elQl9MCpmKdlljfenIi7fGJS7LEa/Pbqe6VUUTUyd7b+Dx62PqD/oBE
         LM/YPQcyEVKgr6pRy0ao9Cuy8jduV5T/NkRtBVdeUkII0zxIWznU2K5rcwHVjPa0ngQ4
         XpO2qg3f+Y9ut1v9XZ82lh1fsHSvsU6oOu8+FXVr/SF12t6RCsPSni5OgC+7pPHFqdOM
         fLB3bJpdpWQ1JZOHMH6AD76KnRKXmNa8vklXzEVFxIX+zt5hMQRSia1p1hwfn5mzAAPo
         j+Qod5BE9AugjgYs18Nfph0xErF6IO/hiZHQJIBHT6tJamMjGfYXGEi1UhCDz0JSNtXG
         BRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=PESTjguP2w/VTHNi6PNqdICr6zusIn+ApdS9Md9Odkc=;
        b=R8CtxZ0RTQWuxEWw7FH9lkiBfURpNkZt2NClRNDRsT/21LC619uf0s2FZgeoK8f+B5
         UyOGnd9RioorIAb58516j7YGWXoCEwuVkHARWnxFQUFBev5KEfSS4U3pJJvVtspiNQQf
         NUxOTZxNhExEHvAVYectHYw2DNX6LrjZ5TvvYe1IGTRZcMZ9eUYDyh1B2JWtM61lA7ha
         bByqJBbDkcfDT9qP2hx7pz28t8UfsJ39ePv8i5WOzyD3/4YE/K49+Ax8WHVXmrF1AbUO
         K3OpEXdOvxfhFUfSte7VBv2pEqYKox9hVv0Z9HjEE0JAsX9VpWr8YLalI8UJpzcd0Qnv
         BTMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o41-v6si3553279qvc.181.2018.08.08.02.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Aug 2018 02:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnL1A-0002NC-IR
	for alex.bennee@linaro.org; Wed, 08 Aug 2018 05:44:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fnL0x-0002L7-E1
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 05:44:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fnL0s-0000wi-M4
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 05:44:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47204 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fnL0s-0000wB-F0; Wed, 08 Aug 2018 05:44:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B69744023444;
	Wed,  8 Aug 2018 09:44:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 938AC20180F4;
	Wed,  8 Aug 2018 09:44:15 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-9-git-send-email-eric.auger@redhat.com>
	<20180718160413.5c4dc514@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ff206af7-91fb-1ed7-9f92-c24980044254@redhat.com>
Date: Wed, 8 Aug 2018 11:44:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180718160413.5c4dc514@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 08 Aug 2018 09:44:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 08 Aug 2018 09:44:17 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v3 08/15] hw/arm/boot: introduce
 fdt_add_memory_node helper
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, agraf@suse.de, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9EopHL/rtD1e

Hi Igor,

On 07/18/2018 04:04 PM, Igor Mammedov wrote:
> On Tue,  3 Jul 2018 09:19:51 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>
>> We introduce an helper to create a memory node.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>
>> ---
>>
>> v1 -> v2:
>> - nop of existing /memory nodes was already handled
>> ---
>>  hw/arm/boot.c | 54 ++++++++++++++++++++++++++++++++++--------------------
>>  1 file changed, 34 insertions(+), 20 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index e09201c..5243a25 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -413,6 +413,36 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
>>      }
>>  }
>>  
>> +static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
>> +                               uint32_t scells, hwaddr mem_len,
>> +                               int numa_node_id)
>> +{
>> +    char *nodename = NULL;
>> +    int ret;
>> +
>> +    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
>> +    qemu_fdt_add_subnode(fdt, nodename);
>> +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>> +    ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
>> +                                       scells, mem_len);
>> +    if (ret < 0) {
>> +        fprintf(stderr, "couldn't set %s/reg\n", nodename);
>> +        goto out;
>> +    }
>> +    if (numa_node_id < 0) {
>> +        goto out;
>> +    }
>> +
>> +    ret = qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", numa_node_id);
>> +    if (ret < 0) {
>> +        fprintf(stderr, "couldn't set %s/numa-node-id\n", nodename);
>> +    }
>> +
>> +out:
>> +    g_free(nodename);
>> +    return ret;
>> +}
>> +
> 
> not related question from hotplug POV,
> is entry size fixed?
Sorry I don't get what entry you are referring to?
> can we estimate exact size for #slots number of dimms and reserve it in advance
> in FDT 'rom'?
Not sure I get your drift either.

patch "[RFC v3 09/15] hw/arm/boot: Expose the PC-DIMM nodes in the DT"
builds the DT nodes for each node, by enumerating the MemoryDeviceInfoList.

> 
>>  static void fdt_add_psci_node(void *fdt)
>>  {
>>      uint32_t cpu_suspend_fn;
>> @@ -492,7 +522,6 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>      void *fdt = NULL;
>>      int size, rc, n = 0;
>>      uint32_t acells, scells;
>> -    char *nodename;
>>      unsigned int i;
>>      hwaddr mem_base, mem_len;
>>      char **node_path;
>> @@ -566,35 +595,20 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>          mem_base = binfo->loader_start;
>>          for (i = 0; i < nb_numa_nodes; i++) {
>>              mem_len = numa_info[i].node_mem;
>> -            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
>> -            qemu_fdt_add_subnode(fdt, nodename);
>> -            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>> -            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
>> -                                              acells, mem_base,
>> -                                              scells, mem_len);
>> +            rc = fdt_add_memory_node(fdt, acells, mem_base,
>> +                                     scells, mem_len, i);
>>              if (rc < 0) {
>> -                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
>> -                        i);
>>                  goto fail;
>>              }
>>  
>> -            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
>>              mem_base += mem_len;
>> -            g_free(nodename);
>>          }
>>      } else {
>> -        nodename = g_strdup_printf("/memory@%" PRIx64, binfo->loader_start);
>> -        qemu_fdt_add_subnode(fdt, nodename);
>> -        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
>> -
>> -        rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
>> -                                          acells, binfo->loader_start,
>> -                                          scells, binfo->ram_size);
>> +        rc = fdt_add_memory_node(fdt, acells, binfo->loader_start,
>> +                                 scells, binfo->ram_size, -1);
>>          if (rc < 0) {
>> -            fprintf(stderr, "couldn't set %s reg\n", nodename);
>>              goto fail;
>>          }
>> -        g_free(nodename);
>>      }
>>  
>>      rc = fdt_path_offset(fdt, "/chosen");
> nice cleanup, but I won't stop here just yet if hotplug to be considered.
> 
> I see arm_load_dtb() as a hack called from every board
> where we dump everything that might be related to DTB regardless
> if it's generic for every board or only a board specific stuff.
> 
> Could we split it in several logical parts that do a single thing
> and preferably user only when they are actually need?
> Something along following lines:
> (cleanups/refactoring should be a separate from pcdimm series as it's self sufficient
> and it would be easier to review/merge and could simplify following up pcdimm series):
The refactoring of arm_load_dtb() may be relevant indeed but I prefer to
keep it out of the scope of this series. Please feel free to send a
separate series. As you advise, I will send this very patch separately too.

Thanks

Eric
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index e09201c..9c41efd 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @ -486,9 +486,6 @@ static void fdt_add_psci_node(void *fdt)
>      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
>  }
>  
> -int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
> -                 hwaddr addr_limit, AddressSpace *as)
> -{
> ...
> 
> @@ -1158,9 +1158,14 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>      }
>  
>      if (!info->skip_dtb_autoload && have_dtb(info)) {
> -        if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
> -            exit(1);
> -        }
> +        load_dtb_from_file() /* reuse generic machine_get_dtb() ??? */
> +        create_dtb_memory_nodes() /* non numa variant */
> +        /* move out mac-virt specific binfo->get_dtb into the board */
> +        /* move out modify_dtb() which vexpress hack into vexpress */
> +        /* move out fdt_add_psci_node() into mac-ivrt */
> +        create_dtb_initrd_kernel_nodes()
> +        dump_fdt()
> +        rom_add_blob_fixed_as()
>      }
>  }
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 281ddcd..7686abf 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1285,9 +1285,12 @@ void virt_machine_done(Notifier *notifier, void *data)
>                                         vms->memmap[VIRT_PLATFORM_BUS].size,
>                                         vms->irqmap[VIRT_PLATFORM_BUS]);
>      }
> -    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
> -        exit(1);
> -    }
> +    load_dtb_from_file()/get_dtb() stuff
> +    virt_create_dtb_memory_nodes() /* incl. numa variant nad later pcdimm nodes */                         
> +    fdt_add_psci_node()                         
> +    create_dtb_initrd_kernel_nodes()                                         
> +    dump_fdt()                                                               
> +    rom_add_blob_fixed_as()
>  
>      virt_acpi_setup(vms);
>      virt_build_smbios(vms);
> 
