Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp46157njg;
        Tue, 17 Sep 2024 02:00:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTCmWoHnApankvTPUtX+skdYPy796s7BPXxkPvUQf75B1Z0GlEIyMZiHMbNDfpSFgYwYQbZvaTQju8SQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEku2NU0CrZBgvwqX06D+WQpTpBIkUP6WNYgAXyzVfqZBc2lKdygFU599oVmaybqpTBCOv+
X-Received: by 2002:a05:651c:2205:b0:2f4:f472:c4fa with SMTP id 38308e7fff4ca-2f787f3ba7dmr106274531fa.35.1726563652399;
        Tue, 17 Sep 2024 02:00:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726563652; cv=none;
        d=google.com; s=arc-20240605;
        b=gmTRJ3uc3lhvhyU1w4NiOrtfkVYIzFzEYiQsnzY4Cm5TPcq4eUQEPeBAjI6I1vjzRP
         /22sMUNjsj6DU2I2e3fKywFqjJ7mErC5cXseBzP6Kjre/M6u+PXUWovU8p6aSmRDpO6o
         C91Jm9hu4tIbCHBuo7gLX36ygLH45bkuMdSOmZ0dw/GhOWKjxe47ZbCScBdlXD44JeJF
         1Q1X/6RP3elh/RNa9Num9kFovEm03GBQRb9zzG9wM7ef4cn7WL/5cFEW9chmP8YvZIw1
         Gp1fzYx3JsUh05eH9oDm+AqnMsRHmi+jSwdsewrn9jp3NWinWysz022qfXb7wv9tmF2n
         jQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=NJbu4yLVDW+mPHY15JyACqlz4EaCOKdV62qMqyYxIs8=;
        fh=rz0whkzKUoIAfodBYJKNiVKk8Ex0Rrp+MqNzSzdvwN0=;
        b=Z/gsKJyXI3+uJCOiCCkcDUe7JRjlnE8wdkxqbQFFYSxb5ZUuGKTKpjgvPhG785TOIA
         6bayl7n7iFKG9oatSvqLot2ynzJpkYHfi6a80vDJmYFET1jHHJ5U03kjCPGBO4rQt3Ph
         kNZgr7UoAEFBBHuCnP74rKACfFXdLV73vuv39fLNnKWNc1wCgJPx1RNqLlQdv/WjY9E3
         wPF+ibY7Xv1YDLAf2/fC6fGUgbV/MQH369wBS9RxgDO7gtm48WS41Qxi/cSLlsX45iOn
         97vHYQZ6FistJHaLftSfSfShNu9NuGSVjNxC6kb8kacj0ks8cpgbDXjtxBar4U1mck4n
         zRMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-378e7817eb9si2835058f8f.711.2024.09.17.02.00.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2024 02:00:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X7G305kz1z6J6dr;
	Tue, 17 Sep 2024 17:00:44 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8DAD914050D;
	Tue, 17 Sep 2024 17:00:51 +0800 (CST)
Received: from localhost (10.48.145.97) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Sep
 2024 11:00:50 +0200
Date: Tue, 17 Sep 2024 10:00:48 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH v2 3/7] hw/core: Add smp cache topology for machine
Message-ID: <20240917100048.00001bcf@Huawei.com>
In-Reply-To: <20240908125920.1160236-4-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
	<20240908125920.1160236-4-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.145.97]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 6+jA2ukzpXlA

On Sun,  8 Sep 2024 20:59:16 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> With smp-cache object support, add smp cache topology for machine by
> linking the smp-cache object.
> 
> Also add a helper to access cache topology level.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Minor stuff. The property stuff is something I seems to mostly get wrong
so needs more eyes but fwiw looks fine to me.
With the tweaks suggested below.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
> Changes since Patch v1:
>  * Integrated cache properties list into MachineState and used -machine
>    to configure SMP cache properties. (Markus)
> 
> Changes since RFC v2:
>  * Linked machine's smp_cache to smp-cache object instead of a builtin
>    structure. This is to get around the fact that the keyval format of
>    -machine can't support JSON.
>  * Wrapped the cache topology level access into a helper.
> ---
>  hw/core/machine-smp.c | 41 ++++++++++++++++++++++++++++++++++++++++
>  hw/core/machine.c     | 44 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/boards.h   | 10 ++++++++++
>  3 files changed, 95 insertions(+)
> 
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index 5d8d7edcbd3f..b517c3471d1a 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -261,6 +261,41 @@ void machine_parse_smp_config(MachineState *ms,
>      }
>  }
>  
> +bool machine_parse_smp_cache(MachineState *ms,
> +                             const SmpCachePropertiesList *caches,
> +                             Error **errp)
> +{
> +    const SmpCachePropertiesList *node;
> +    DECLARE_BITMAP(caches_bitmap, CACHE_LEVEL_AND_TYPE__MAX);
> +
> +    for (node = caches; node; node = node->next) {
> +        /* Prohibit users from setting the cache topology level to invalid. */
> +        if (node->value->topology == CPU_TOPOLOGY_LEVEL_INVALID) {
> +            error_setg(errp,
> +                       "Invalid cache topology level: %s. "
> +                       "The topology should match the "
> +                       "valid CPU topology level",

I think that's too much wrapping for an error message. Makes them hard
to grep for.

> +                       CpuTopologyLevel_str(node->value->topology));
> +            return false;
> +        }
> +
> +        /* Prohibit users from repeating settings. */
> +        if (test_bit(node->value->cache, caches_bitmap)) {
> +            error_setg(errp,
> +                       "Invalid cache properties: %s. "
> +                       "The cache properties are duplicated",
> +                       CacheLevelAndType_str(node->value->cache));
> +            return false;
> +        } else {

returned anyway in the above path, so can drop the else and reduce
indent a little.

> +            ms->smp_cache.props[node->value->cache].topology =
> +                node->value->topology;
> +            set_bit(node->value->cache, caches_bitmap);
> +        }
> +    }
> +
> +    return true;
> +}
> +

