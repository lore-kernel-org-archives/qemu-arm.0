Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp44411njg;
        Tue, 17 Sep 2024 01:56:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqofgKeRFUmeCJ9AKofdaJDNXY6Slr47L6dCjJbz1kSj3Tip+PONOdU5BYflF0HLhDAPGi9wzNc7Bg3w==@linaro.org
X-Google-Smtp-Source: AGHT+IEglaliQ1c1kg36dZv+eDVbrDE1YyAb3aGQ2xgx/CIR+Lae8L23rzRlW7jK6pl03Mf6Y34Q
X-Received: by 2002:a05:600c:3514:b0:42c:df67:1d35 with SMTP id 5b1f17b1804b1-42cdf671f9emr135039575e9.1.1726563376493;
        Tue, 17 Sep 2024 01:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726563376; cv=none;
        d=google.com; s=arc-20240605;
        b=QL65HxhVO4Ae6V+NlJ5o/KcMckDIzdMsb9wc/PzpkpSfJmZKxgJh2Ch8iCf6k+JRPy
         YmwLtdAl7BcTJRgvlAs/HlMTntRO+sv6SCqAZ5+Cuy+afym8bYmahbz++pGDWjg+jew1
         bRY3Av9bo3ZPn2K0GbDTPR8zSOyoIgAQErZTAmkpoGaVQYyD1qKn3sQfrcSi0XHf4H85
         bnPQaghCqtc51aUQVjXAxUbjmhtP5oi+jeip3mrgIAuUeo2FENfnxNa/8Q57w/S+1gqE
         b8gpJwMt82fOk9zEK1Af2M/UnrwcrBM8etVrPF2+8uo+DY/lZOoL1r53NyxRaMcz9deQ
         MEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=W8dg0sVmfjDA/H43/5DwLvr8QVbMPzLmcVlJP2mV1Ww=;
        fh=rz0whkzKUoIAfodBYJKNiVKk8Ex0Rrp+MqNzSzdvwN0=;
        b=RpTDTsITpB9XyhJYU+XcgeBaZKujsc52pxexIqWy9ZCkAywrgbxjmVz3u2eVSFXyOJ
         6q1vD12QO1AuTGFE6QjAm7TroNKnAfUzz162Bj5bYuYQ2X0AJaYQMXE5FfdMjAIjPVUm
         hTOtSpkzrWqjAfSQdxUlvy8Ujypips3s7TZh6/iGXOSNvEVQvmpHCf9Y2fJjrRC+qkHW
         qsEbaK132ScpCHR6VoPPHSTthaBoq2AtIUVSCrKz4kfwdXvnw9tpkE6tCZf1GLpUXUv5
         3Q6FsiQ5ZTgVYNNYYTyiVSlqJFO/TAr8aMi6CeHNmzRMLaIgUt2ZxHj1HywVTZCgZdej
         ee/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42d9b1925f9si46053515e9.226.2024.09.17.01.56.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2024 01:56:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X7FsT64S4z6D9Fw;
	Tue, 17 Sep 2024 16:52:29 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C4DF7140CF4;
	Tue, 17 Sep 2024 16:56:15 +0800 (CST)
Received: from localhost (10.48.145.97) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Sep
 2024 10:56:14 +0200
Date: Tue, 17 Sep 2024 09:56:12 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH v2 4/7] hw/core: Check smp cache topology support for
 machine
Message-ID: <20240917095612.00007b5a@Huawei.com>
In-Reply-To: <20240908125920.1160236-5-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
	<20240908125920.1160236-5-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.145.97]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: QeaXpO7SELsO

On Sun,  8 Sep 2024 20:59:17 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Add cache_supported flags in SMPCompatProps to allow machines to
> configure various caches support.
> 
> And check the compatibility of the cache properties with the
> machine support in machine_parse_smp_cache().
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>

Just a few trivial comments inline.

FWIW with or without those changes.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
> Changes since Patch v1:
>  * Dropped machine_check_smp_cache_support() and did the check when
>    -machine parses smp-cache in machine_parse_smp_cache().
> 
> Changes since RFC v2:
>  * Split as a separate commit to just include compatibility checking and
>    topology checking.
>  * Allow setting "default" topology level even though the cache
>    isn't supported by machine. (Daniel)
> ---
>  hw/core/machine-smp.c | 78 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/boards.h   |  3 ++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index b517c3471d1a..9a281946762f 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -261,10 +261,47 @@ void machine_parse_smp_config(MachineState *ms,


>  bool machine_parse_smp_cache(MachineState *ms,
>                               const SmpCachePropertiesList *caches,
>                               Error **errp)
>  {
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>      const SmpCachePropertiesList *node;
>      DECLARE_BITMAP(caches_bitmap, CACHE_LEVEL_AND_TYPE__MAX);
>  
> @@ -293,6 +330,47 @@ bool machine_parse_smp_cache(MachineState *ms,
>          }
>      }
>  
> +    for (int i = 0; i < CACHE_LEVEL_AND_TYPE__MAX; i++) {
> +        const SmpCacheProperties *props = &ms->smp_cache.props[i];
> +
> +        /*
> +         * Allow setting "default" topology level even though the cache
> +         * isn't supported by machine.
I'd flip the comment as the condition is doing the opposite.

            * Reject non "default" topology level if the cache isn't
            * supported by the machine.
> +         */
> +        if (props->topology != CPU_TOPOLOGY_LEVEL_DEFAULT &&
> +            !mc->smp_props.cache_supported[props->cache]) {
> +            error_setg(errp,
> +                       "%s cache topology not supported by this machine",
> +                       CacheLevelAndType_str(node->value->cache));
> +            return false;
> +        }
> +
> +        if (!machine_check_topo_support(ms, props->topology, errp)) {
> +            return false;
> +        }
> +    }
> +
> +    if (smp_cache_topo_cmp(&ms->smp_cache,
> +                           CACHE_LEVEL_AND_TYPE_L1D,

Short line wrap.  Maybe combine the two lines above and similar
cases.  Up to you though, I don't feel that strongly.

> +                           CACHE_LEVEL_AND_TYPE_L2) ||
> +        smp_cache_topo_cmp(&ms->smp_cache,
> +                           CACHE_LEVEL_AND_TYPE_L1I,
> +                           CACHE_LEVEL_AND_TYPE_L2)) {
> +        error_setg(errp,
> +                   "Invalid smp cache topology. "
> +                   "L2 cache topology level shouldn't be lower than L1 cache");
> +        return false;
> +    }
> +
> +    if (smp_cache_topo_cmp(&ms->smp_cache,
> +                           CACHE_LEVEL_AND_TYPE_L2,
> +                           CACHE_LEVEL_AND_TYPE_L3)) {
> +        error_setg(errp,
> +                   "Invalid smp cache topology. "
> +                   "L3 cache topology level shouldn't be lower than L2 cache");
> +        return false;
> +    }
> +
>      return true;
>  }
