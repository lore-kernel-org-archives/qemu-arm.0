Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1887044njc;
        Mon, 22 Jul 2024 05:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuThvBQOo1mWkoJYkGJAUcTh+SbvK95O7vfDOZ50CZ2TgK+ifmU3ZEQFumniurySUu8B/7DKt0SNUOZFVEqPvrDm3prbLf
X-Google-Smtp-Source: AGHT+IEx/7QpdcUMZuDD7+Y8IDCBiTwe4Zn/P/2MhFO6KLL02gP1L2zWnbmF10zfyQpWZoAk+uLR
X-Received: by 2002:a17:902:e746:b0:1fa:fc24:afa5 with SMTP id d9443c01a7336-1fd74561476mr46752155ad.27.1721651905137;
        Mon, 22 Jul 2024 05:38:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721651905; cv=none;
        d=google.com; s=arc-20160816;
        b=kI4cvhur8joMKfmDEsc+sxdXGy9ltOkjW58JqYpphvm5frOhMYtL6FQ3jQ9SzBz4XP
         lXHfrUbzUzwvDzIecosnXvGc0M8crGkWQd2Ck5s9+NldD7n27GvIm6wXxrUxEmWVlYf1
         WC1MBjk5H8kZQELlVV9O9xwLaZTSpf/CUZTgPUvOW4vNBR3WFC7gEVVmtPvMhj0e9W5m
         ah5AVhycbW0IGKIgrdpzh79rxKVXyfIdqgTMcPmNh5EpMBObL/8FOiVS2NbmZuNk5geH
         +nT1hrxyqp73ljLCksIIfqN6vCRLYpFzqKP9dLXI//pEkJhR9CkCU5LbpB8c4wDmcHX1
         sT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=/MayvdR897FMGU9yqOmjQqiL6WfaUtvdSp3vpU0bgnw=;
        fh=jt4Zy3NzMmUgST0sEyRdQDVF0OT2XWa8Qtc4C5tGS+A=;
        b=0fm1ooGGKnrJqHK16o+G+CS30y06pc2VupICgAgM02yCIKNMYGE1bD+q77Fu+w3rzn
         wFuoEjipQp/asp4SYeeM5liYheHpLk3+8lG6hwxuiUTuV4hNx+kqOp/CIpu1hBdby8Eu
         8ppXktdmE/k20Ch+y8ScVIIZglhLNIAkrDq0IwJYz0T8vlTmIq2arJe1rEWczwTMcUg+
         HkCdR5YVOzRHIeSrvZKNXDMJXE8M21Rw3wVMNomGR/Jc4R0s/7bSA4QHOZ0QUSmtnJ92
         A8n8d05G7YZmS5UQKe9uRhsz9JJKphHUONu+0Zb4BG1m1R3JfcGVesX7Vjs+05u3HXYv
         tIXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-1fd6f4906f9si65576435ad.612.2024.07.22.05.38.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2024 05:38:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WSKXc12mrz6JB2J;
	Mon, 22 Jul 2024 20:36:48 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id B6B34140B2F;
	Mon, 22 Jul 2024 20:38:20 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 22 Jul
 2024 13:38:20 +0100
Date: Mon, 22 Jul 2024 13:38:19 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Eduardo  Habkost <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,  kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH 2/8] qapi/qom: Introduce smp-cache object
Message-ID: <20240722133819.0000338a@Huawei.com>
In-Reply-To: <20240704031603.1744546-3-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
	<20240704031603.1744546-3-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: 8EadCyOgvpBv

On Thu,  4 Jul 2024 11:15:57 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Introduce smp-cache object so that user could define cache properties.
> 
> In smp-cache object, define cache topology based on CPU topology level
> with two reasons:
> 
> 1. In practice, a cache will always be bound to the CPU container
>    (either private in the CPU container or shared among multiple
>    containers), and CPU container is often expressed in terms of CPU
>    topology level.
> 2. The x86's cache-related CPUIDs encode cache topology based on APIC
>    ID's CPU topology layout. And the ACPI PPTT table that ARM/RISCV
>    relies on also requires CPU containers to help indicate the private
>    shared hierarchy of the cache. Therefore, for SMP systems, it is
>    natural to use the CPU topology hierarchy directly in QEMU to define
>    the cache topology.
> 
> Currently, separated L1 cache (L1 data cache and L1 instruction cache)
> with unified higher-level cache (e.g., unified L2 and L3 caches), is the
> most common cache architectures.
> 
> Therefore, enumerate the L1 D-cache, L1 I-cache, L2 cache and L3 cache
> with smp-cache object to add the basic cache topology support.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Suggested by credit:
>  * Referred to Daniel's suggestion to introduce cache JSON list, though
>    as a standalone object since -smp/-machine can't support JSON.

A comment and a query on the code movement.  Whilst not particularly
elegant (as would be nice if -smp or machine supported json) using
an object isn't too bad.

Given both comments are trivial.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


> diff --git a/qapi/machine-common.json b/qapi/machine-common.json
> index 82413c668bdb..8b8c0e9eeb86 100644
> --- a/qapi/machine-common.json
> +++ b/qapi/machine-common.json

> +
> +##
> +# @SMPCacheName:
> +#
> +# An enumeration of cache for SMP systems.  The cache name here is
> +# a combination of cache level and cache type.
> +#
> +# @l1d: L1 data cache.
> +#
> +# @l1i: L1 instruction cache.
> +#
> +# @l2: L2 (unified) cache.
> +#
> +# @l3: L3 (unified) cache
> +#
> +# Since: 9.1
> +##
> +{ 'enum': 'SMPCacheName',
> +  'prefix': 'SMP_CACHE',
> +  'data': [ 'l1d', 'l1i', 'l2', 'l3' ] }

I guess we can extend this as necessary for other designs
with more caches or split to higher levels. This is a reasonable
place to start.  Splitting and L2 is going to require more
complex code elsewhere but we can deal with that if anyone
needs to do so.


> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index b1581988e4eb..25394f2cda50 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -64,11 +64,11 @@
>  { 'include': 'compat.json' }
>  { 'include': 'control.json' }
>  { 'include': 'introspect.json' }
> -{ 'include': 'qom.json' }
> -{ 'include': 'qdev.json' }
>  { 'include': 'machine-common.json' }
>  { 'include': 'machine.json' }
>  { 'include': 'machine-target.json' }
> +{ 'include': 'qom.json' }
> +{ 'include': 'qdev.json' }
If this is a necessary bit of movement, then a comment on that
in the patch introduction would be good to have.

>  { 'include': 'replay.json' }
>  { 'include': 'yank.json' }
>  { 'include': 'misc.json' }

