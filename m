Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2133078ejf;
        Mon, 26 Feb 2024 07:39:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9pydP/A3NKWlq7FZTDqmjTxqy2vpXweqbxqogJ2Sah6r1apI78rX7x2KhqjF5Pk8UWFqz2Ho7vBByYRiDKWirC7My/iF0
X-Google-Smtp-Source: AGHT+IGmQinzpW38HOdvyF9Aq8jDl1wd1ceE/gXCVWY4/ufjOOEFEhB+sBves7XFgQN9WyEkorMB
X-Received: by 2002:a05:600c:4f46:b0:412:9434:fa38 with SMTP id m6-20020a05600c4f4600b004129434fa38mr5915540wmq.7.1708961991025;
        Mon, 26 Feb 2024 07:39:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708961991; cv=none;
        d=google.com; s=arc-20160816;
        b=y7xJyxs6iHAYx24eIrLcVrAAlfYxzm8xxI6FdtSa4aaZTqmIu/lL/aL8AXJgNfaHbV
         43SNzIjwJ7TOAQx56FfpeBB2tK93rT/T+O42cr+Kq9sSMWJfGc00tp9cJ8pgnFtZGasa
         08E90R2VZK9oU9YqM573N0Y3G9fKBxg+qw5tIclJlqx3MNSJl8PusZU0H8A4bfUHSbWW
         N/KdU0zKZnK7JOfhpyb91WzAJkcwiPjgW/6TKBezLJdNY1EN9tcw59R9xjO80CHbw6j1
         /93SAO7yDxFi7LfaTyCDePxOCVQvncbtjzUI93EBMonbCRDKfA0C1RXXWwWZUKBPktG4
         8y1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=iUcL1XIZLF0a7CA5RSVpjPI8y2fmv/TcAoiKhsS2+r8=;
        fh=etCafUcGIfuy9fpedZpS24JHtYkPJpeDuHj2A+BIf6Y=;
        b=oVEX/XHa1Yg7rIsmORrvIR8HOyxitjAiK6PeSQe7o9YjyyjeyVTEa3ger21VfMv0H8
         T/aeRnnbDhy4x4maBwGGa6WH6+SFu41up1cpNJP9TKZv6RX/uUp3kDqSLm6iZ50N6Zqp
         ztU/J/r9mvAlnQOjzAjQbA4iKTlsiMwST/bwYXKYe/ScN6zBWgJYyw6rJryCyyk6oTXG
         70I3mpyZFXlBa/d0Y9uNeHRsAidWjYGgMLnHjpCp+1rDoG8TFhsn7BHR/kqPnHi03UVM
         WP74UBJcm6JaQoJzcY0uXKGzh3nCa6xunjfp+SuW9tmMzclQKj8vr6frp4ZFK2z+prmc
         EZGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id v10-20020adfe28a000000b0033ce5b3390dsi2668209wri.11.2024.02.26.07.39.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Feb 2024 07:39:51 -0800 (PST)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tk4Sg116Hz6K6VK;
	Mon, 26 Feb 2024 23:35:31 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 1708B140A08;
	Mon, 26 Feb 2024 23:39:50 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 26 Feb
 2024 15:39:49 +0000
Date: Mon, 26 Feb 2024 15:39:47 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
CC: "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>, "Eduardo
 Habkost" <eduardo@habkost.net>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
	<philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, "Sia Jee Heng" <jeeheng.sia@starfivetech.com>,
	<qemu-devel@nongnu.org>, <kvm@vger.kernel.org>, <qemu-riscv@nongnu.org>,
	<qemu-arm@nongnu.org>, "Zhenyu Wang" <zhenyu.z.wang@intel.com>, Dapeng Mi
	<dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, Zhao Liu
	<zhao1.liu@intel.com>
Subject: Re: [RFC 4/8] hw/core: Add cache topology options in -smp
Message-ID: <20240226153947.00006fd6@Huawei.com>
In-Reply-To: <20240220092504.726064-5-zhao1.liu@linux.intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
	<20240220092504.726064-5-zhao1.liu@linux.intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: UrI4bQFkyCKM

On Tue, 20 Feb 2024 17:25:00 +0800
Zhao Liu <zhao1.liu@linux.intel.com> wrote:

> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Add "l1d-cache", "l1i-cache". "l2-cache", and "l3-cache" options in
> -smp to define the cache topology for SMP system.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Hi Zhao Liu

I like the scheme.  Strikes a good balance between complexity of description
and systems that actually exist. Sure there are systems with more cache
levels etc but they are rare and support can be easily added later
if people want to model them.

A few minor comments inline.

Jonathan
> ---
>  hw/core/machine-smp.c | 128 ++++++++++++++++++++++++++++++++++++++++++
>  hw/core/machine.c     |   4 ++
>  qapi/machine.json     |  14 ++++-
>  system/vl.c           |  15 +++++
>  4 files changed, 160 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index 8a8296b0d05b..2cbd19f4aa57 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -61,6 +61,132 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
>      return g_string_free(s, false);
>  }
>  
> +static bool machine_check_topo_support(MachineState *ms,
> +                                       CPUTopoLevel topo)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +
> +    if (topo == CPU_TOPO_LEVEL_MODULE && !mc->smp_props.modules_supported) {
> +        return false;
> +    }
> +
> +    if (topo == CPU_TOPO_LEVEL_CLUSTER && !mc->smp_props.clusters_supported) {
> +        return false;
> +    }
> +
> +    if (topo == CPU_TOPO_LEVEL_DIE && !mc->smp_props.dies_supported) {
> +        return false;
> +    }
> +
> +    if (topo == CPU_TOPO_LEVEL_BOOK && !mc->smp_props.books_supported) {
> +        return false;
> +    }
> +
> +    if (topo == CPU_TOPO_LEVEL_DRAWER && !mc->smp_props.drawers_supported) {
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static int smp_cache_string_to_topology(MachineState *ms,

Not a good name for a function that does rather more than that.

> +                                        char *topo_str,
> +                                        CPUTopoLevel *topo,
> +                                        Error **errp)
> +{
> +    *topo = string_to_cpu_topo(topo_str);
> +
> +    if (*topo == CPU_TOPO_LEVEL_MAX || *topo == CPU_TOPO_LEVEL_INVALID) {
> +        error_setg(errp, "Invalid cache topology level: %s. The cache "
> +                   "topology should match the CPU topology level", topo_str);
> +        return -1;
> +    }
> +
> +    if (!machine_check_topo_support(ms, *topo)) {
> +        error_setg(errp, "Invalid cache topology level: %s. The topology "
> +                   "level is not supported by this machine", topo_str);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static void machine_parse_smp_cache_config(MachineState *ms,
> +                                           const SMPConfiguration *config,
> +                                           Error **errp)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +
> +    if (config->l1d_cache) {
> +        if (!mc->smp_props.l1_separated_cache_supported) {
> +            error_setg(errp, "L1 D-cache topology not "
> +                       "supported by this machine");
> +            return;
> +        }
> +
> +        if (smp_cache_string_to_topology(ms, config->l1d_cache,
> +            &ms->smp_cache.l1d, errp)) {

Indent is to wrong opening bracket.
Same for other cases.


> +            return;
> +        }
> +    }

> +}
> +
>  /*
>   * machine_parse_smp_config: Generic function used to parse the given
>   *                           SMP configuration
> @@ -249,6 +375,8 @@ void machine_parse_smp_config(MachineState *ms,
>                     mc->name, mc->max_cpus);
>          return;
>      }
> +
> +    machine_parse_smp_cache_config(ms, config, errp);
>  }
>  
>  unsigned int machine_topo_get_cores_per_socket(const MachineState *ms)
