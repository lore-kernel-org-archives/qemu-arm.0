Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp52854njg;
        Tue, 17 Sep 2024 02:16:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1zhq19nnkqUBuybFSezR4kebvbh1t8vaCmNTk7Xu5O3mguMqP1VYz6ChYUq7Fu5998vM5E4J/eSjrdw==@linaro.org
X-Google-Smtp-Source: AGHT+IGzcYhq3lShdQdqKKTixjzF6vFrG7uZhy7mnYnIoARAvjCvCAx+E6zy2GZ+EQDLI4rjiWYB
X-Received: by 2002:adf:ec07:0:b0:374:c87c:6648 with SMTP id ffacd0b85a97d-378c2d04ea2mr9536374f8f.25.1726564596579;
        Tue, 17 Sep 2024 02:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726564596; cv=none;
        d=google.com; s=arc-20240605;
        b=douiOVsbA0xxmj1KMn3mp8K8ff6TKfz8iS6kKsLanPacdGNhYrBSVujHIn0YKa3B8C
         7vP7Af6P+odV2ZPxx+96QzgjPGvCsZ/boFr4iTLu/Q93aGRcUOsNiBg5tUig/JmghMGn
         VhqzNFCEEDWvwrYIYUWQkt+JXGy5fb1wwFZJq32ZLGysAawktco04+Gg25rcUCUQ8E85
         dSPg1/Svr8R0G1LVT0qSpYWZZXTBIuBe486eViQv+7JIC9NYqWPIN3YLnw/D4k5iZNR2
         qLVfXvHpGOGtpy3/lWpqP7tXaOb53R6CzhIzoA74v+38gphFRb7DPsSvHHtxV6eUp3j8
         BEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=xq4tB8B4a3XHQJTGDxuLg1mDyXyEYPoATa8dAXci0ws=;
        fh=rz0whkzKUoIAfodBYJKNiVKk8Ex0Rrp+MqNzSzdvwN0=;
        b=NvgWOm4t+jag/pDLTO6g/qIUcxb7rdp0+9rYEIScreNQ+0CSQlQESWD2njVT8HPkgN
         AKfFNkeuNipI9+W2opAcMBLV+/v+UAZ/SnY75QVpu4raq5ItFINIjt2K+u9ESLo3veNn
         t+j34wf9NEhIWqEePtqApDkGgpq0nMGlaL726nncA+4MM06J8bAy1ONXt13pGlWpUjQN
         x6pJ2GkbEDoOmrpyDTvJ2RslkMOMM4L4u4kAGcuB1wt0Qp4FWCbG7iZ+kJdnhkeGicPY
         YMVrJiHNWKD0jABb3+qydIlKSwBBsD/oBkWJN3PpCRpEeORSTTsXX0Mmc+k7xIWUr7y/
         eXmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-378e78186a1si2950300f8f.763.2024.09.17.02.16.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2024 02:16:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X7GP80RQfz6J6FX;
	Tue, 17 Sep 2024 17:16:28 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D4B2B1400F4;
	Tue, 17 Sep 2024 17:16:34 +0800 (CST)
Received: from localhost (10.48.145.97) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Sep
 2024 11:16:33 +0200
Date: Tue, 17 Sep 2024 10:16:31 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH v2 7/7] i386/pc: Support cache topology in -machine for
 PC machine
Message-ID: <20240917101631.00003dcb@Huawei.com>
In-Reply-To: <20240908125920.1160236-8-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
	<20240908125920.1160236-8-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.145.97]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: rkcGrbHuLMRn

On Sun,  8 Sep 2024 20:59:20 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Allow user to configure l1d, l1i, l2 and l3 cache topologies for PC
> machine.
> 
> Additionally, add the document of "-machine smp-cache" in
> qemu-options.hx.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Trivial language suggestions.
In general looks good to me.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Hopefully QOM maintainers and others will get to this soon. 
I'd like Ali's ARM series to land this cycle as well
as the lack of this support has been a pain point for us
for a while.

Jonathan

> ---
> Changes since Patch v1:
>  * Merged document into this patch. (Markus)
> 
> Changes since RFC v2:
>  * Used cache_supported array.
> ---
>  hw/i386/pc.c    |  4 ++++
>  qemu-options.hx | 28 +++++++++++++++++++++++++++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index ba0ff511836c..d562fd25aad2 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1788,6 +1788,10 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      mc->nvdimm_supported = true;
>      mc->smp_props.dies_supported = true;
>      mc->smp_props.modules_supported = true;
> +    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L1D] = true;
> +    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L1I] = true;
> +    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L2] = true;
> +    mc->smp_props.cache_supported[CACHE_LEVEL_AND_TYPE_L3] = true;
>      mc->default_ram_id = "pc.ram";
>      pcmc->default_smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_AUTO;
>  
> diff --git a/qemu-options.hx b/qemu-options.hx
> index d94e2cbbaeb1..3936ff3e77f9 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -39,7 +39,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
>      "                hmat=on|off controls ACPI HMAT support (default=off)\n"
>      "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n"
> -    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n",
> +    "                cxl-fmw.0.targets.0=firsttarget,cxl-fmw.0.targets.1=secondtarget,cxl-fmw.0.size=size[,cxl-fmw.0.interleave-granularity=granularity]\n"
> +    "                smp-cache.0.cache=cachename,smp-cache.0.topology=topologylevel\n",

Now my cxl-fmw stuff has competition for most hideous element :)
When we add a few more properties maybe we'll get an even longer line!

>      QEMU_ARCH_ALL)
>  SRST
>  ``-machine [type=]name[,prop=value[,...]]``
> @@ -159,6 +160,31 @@ SRST
>          ::
>  
>              -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
> +
> +    ``smp-cache.0.cache=cachename,smp-cache.0.topology=topologylevel``
> +        Define cache properties (now only the cache topology level) for SMP
> +        system.

I'd drop the 'now only' bit.  Just means we have add noise updating that
later.   It's easy enough to look down and see what is available anyway give
the parameter docs follow immediately after this.

> +
> +        ``cache=cachename`` specifies the cache that the properties will be
> +        applied on. This field is the combination of cache level and cache
> +        type. Currently it supports ``l1d`` (L1 data cache), ``l1i`` (L1

Drop the word Currently as I don't think it adds anything to he meaning.
We are never going to add docs that say 'previously it supported' or 'in the
future it will support'.

	   "Supports ...

> +        instruction cache), ``l2`` (L2 unified cache) and ``l3`` (L3 unified
> +        cache).
> +
> +        ``topology=topologylevel`` sets the cache topology level. It accepts
> +        CPU topology levels including ``thread``, ``core``, ``module``,
> +        ``cluster``, ``die``, ``socket``, ``book``, ``drawer`` and a special
> +        value ``default``. If ``default`` is set, then the cache topology will
> +        follow the architecture's default cache topology model. If other CPU
If another topology level is set

would be clearer.   I briefly read this as saying the topology for another CPU
rather than a different value here.
> +        topology level is set, the cache will be shared at corresponding CPU
> +        topology level. For example, ``topology=core`` makes the cache shared
> +        in a core.
"by all threads within a core." perhaps?

> +
> +        Example:
> +
> +        ::
> +
> +            -machine smp-cache.0.cache=l1d,smp-cache.0.topology=core,smp-cache.1.cache=l1i,smp-cache.1.topology=core
>  ERST
>  
>  DEF("M", HAS_ARG, QEMU_OPTION_M,
