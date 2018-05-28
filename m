Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2529807wre;
        Mon, 28 May 2018 07:22:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJpQggazFK1q/XT8u2m/k7FBHyXnBTbSshpdRdMVuYe+VTDZlPRXIinbjCVdL0byoDHKaqG
X-Received: by 2002:ac8:3212:: with SMTP id x18-v6mr5219565qta.44.1527517328644;
        Mon, 28 May 2018 07:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527517328; cv=none;
        d=google.com; s=arc-20160816;
        b=zM8QvJE5tQFHfd++u/qhzsp+iMvkVVladNQ3GIipUfZxgfKet9tnYvXufzbByiYhv2
         iftZgA/SG2+hxDw9JwaSfjr9W6x4XWH6KPLCnNQ90zYZ70qkD6zQq0wqV3Ksmq4tadaa
         jEuyFaQ02oEVyqWKRT6bWIXmPOtR03iX+FcedKrPtcJNaVkK0VYzYo5e5/MVM0nVl7AM
         7kmMxQLifNn5t4InJDsxFstPVkpGPxWsISJ5pYmMAFzxhCnzJE4Df0c8PD5A2c4PyVq/
         kBfpdLRTbNI1xrmKdXtC8VRhshx/UjegN4RwJM1jEYj6gAq45ggfuIP0kbhhOqItaZvo
         deVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=XNxWiIDFsgsyIxisDD3R/8b++KK4xFKrrGak0JFMiqs=;
        b=Gv4QL9p7bsjzOThuc5bL8gNQqb19/ssvmSSd0kbS2nZqE4orDHjLNUdJpKh7FJ6kGs
         2V+JXuDkBzOzvqLjR4oBD5HPXm2HoqdGtuIUdkTESFC80g1vTiYvrfG+ePqMZOq+eZQj
         kJnkjVYhd0dolwnTlHTIYonGCzJw9E4N2Guyx3PPHAc5tkpKed9rbhC/9Bf/mAt/y4+C
         ynvnETTwXoYo96Yg3GBCri7+tcIJY1WJHbd51lVDooEdou543NYScgzlR/EhgrU1l75+
         BIqw3XXd45bO9Ys3LEOUHUyxIOO4KRSBte4puAPKnlXhEOh585MO6UIk+cPJIZ7n1b7A
         +e9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18-v6si814909qvy.277.2018.05.28.07.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 07:22:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNJ2G-0007yg-3m
	for alex.bennee@linaro.org; Mon, 28 May 2018 10:22:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ1y-0007x1-Lc
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:21:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNJ1v-0006O0-FB
	for qemu-arm@nongnu.org; Mon, 28 May 2018 10:21:50 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59172 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNJ1v-0006NS-AD; Mon, 28 May 2018 10:21:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4B29401EF04;
	Mon, 28 May 2018 14:21:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 255151C596;
	Mon, 28 May 2018 14:21:37 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-6-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <12945c4d-97f6-df0c-1046-b5d981624c18@redhat.com>
Date: Mon, 28 May 2018 16:21:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180516152026.2920-6-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 28 May 2018 14:21:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 28 May 2018 14:21:46 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v2 5/6] hw/arm: ACPI SRAT changes to
 accommodate non-contiguous mem
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
X-TUID: UhgWE802mSyA

Hi Shameer,

On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> This is in preparation for the next patch where initial ram is split
> into a non-pluggable chunk and a pc-dimm modeled mem if  the vaild
valid
> iova regions are non-contiguous.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index c7c6a57..8d17b40 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -488,7 +488,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      AcpiSratProcessorGiccAffinity *core;
>      AcpiSratMemoryAffinity *numamem;
>      int i, srat_start;
> -    uint64_t mem_base;
> +    uint64_t mem_base, mem_sz, mem_len;
>      MachineClass *mc = MACHINE_GET_CLASS(vms);
>      const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
>  
> @@ -505,12 +505,28 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          core->flags = cpu_to_le32(1);
>      }
>  
> -    mem_base = vms->memmap[VIRT_MEM].base;
> +    mem_base = vms->bootinfo.loader_start;
> +    mem_sz = vms->bootinfo.loader_start;
>      for (i = 0; i < nb_numa_nodes; ++i) {
>          numamem = acpi_data_push(table_data, sizeof(*numamem));
> -        build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
> +        mem_len = MIN(numa_info[i].node_mem, mem_sz);
same question as in previous patch

Thanks

Eric
> +        build_srat_memory(numamem, mem_base, mem_len, i,
>                            MEM_AFFINITY_ENABLED);
> -        mem_base += numa_info[i].node_mem;
> +        mem_base += mem_len;
> +        mem_sz -= mem_len;
> +        if (!mem_sz) {
> +            break;
> +        }
> +    }
> +
> +    /* Create table for initial pc-dimm ram, if any */
> +    if (vms->bootinfo.dimm_mem) {
> +        numamem = acpi_data_push(table_data, sizeof(*numamem));
> +        build_srat_memory(numamem, vms->bootinfo.dimm_mem->base,
> +                          vms->bootinfo.dimm_mem->size,
> +                          vms->bootinfo.dimm_mem->node,
> +                          MEM_AFFINITY_ENABLED);
> +
>      }
>  
>      build_header(linker, table_data, (void *)(table_data->data + srat_start),
> 
