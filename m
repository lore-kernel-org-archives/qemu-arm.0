Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1891267njc;
        Mon, 22 Jul 2024 05:47:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXP0lxB0LbUelSXKCzfYyaUFCVs/EFBFADTEnK5eHFSwXCWmEIPDqpLJDTgoonEj/YK0Kf5c/eyoUSpQQoVYmsftRUlWic6
X-Google-Smtp-Source: AGHT+IGum4TqGxpfvY7G+y7bGA3/s8j11PnveFIFO6OTWRVudXtsuUCCbSr4CyM36t+9a54xxKF9
X-Received: by 2002:a05:6a20:6a06:b0:1c4:19d0:4a0e with SMTP id adf61e73a8af0-1c4285683b8mr5892588637.14.1721652443107;
        Mon, 22 Jul 2024 05:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721652443; cv=none;
        d=google.com; s=arc-20160816;
        b=L74ddHOZNd/O8QRwe71w7B76ZmegXRLP7/KybXdDNvnrUaIbG3VI81fSvG0sRWYFVz
         b3KtB3wwg/rEaBesNI12009mLCZYfdZNP2lWrTZiE+upVC/VkCNzvnDuZaglOYJfhHE5
         UGj42u2+nVnn7TPYf5LnGQkgR/I3RPrsCUZPKhpdHqqsAkBbcJO+IufPB9ueWOtpAxld
         mk3OrkltfjDFg4GnQkyBqne2rV28QOC5xm0AOIwecrbT4AsQKtHVqsTVrVBgonG3XM9C
         h5U3auV+aWnWmqD+rQpbA3UtdIjJoKzQdTgDoT5bBpGa8nm44JYLsLUbeQfP46MBo3kq
         1LVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=fDfzHDZDHCpASQGysqUXZQipv8MkjjILoc47t3rhgXg=;
        fh=jt4Zy3NzMmUgST0sEyRdQDVF0OT2XWa8Qtc4C5tGS+A=;
        b=HvPY2hehytkNscybq7kH3ZDifoaAiFuI8UCOeeAThgnnr/8SoREuDfrSqTu33ZYkUW
         bg5lp+jex4OXE3hTR3Y9Dmop9wP0cIKc1KNNbZwKwVilbHBzbq2hJ/8NBayOGxwviBfm
         GibMfu+3uj1HBgw2+BDLu08ttuY56wQ9jTrKyVOhkZuqPd4d6NhQIi1Sj9QzqIebX3tR
         /1xZsQaHGwYTB5ipbo+i1FpL4wCd4ZOquDPj7Uf9FxgMimFzhCqLViAHLVy8R6X88GNI
         CLZt0pWerrnAZGb5XXS9/BqRQPM4PaBKXSY7prL/bsj7NjAb1FbJN93r0SfsLlrfCIRo
         wAKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-1fd6f25ac57si62679975ad.96.2024.07.22.05.47.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2024 05:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WSKkL6xM9z6K6df;
	Mon, 22 Jul 2024 20:45:14 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 6D725140CF4;
	Mon, 22 Jul 2024 20:47:18 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 22 Jul
 2024 13:47:17 +0100
Date: Mon, 22 Jul 2024 13:47:16 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Eduardo  Habkost <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,  kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH 4/8] hw/core: Check smp cache topology support for
 machine
Message-ID: <20240722134716.000067b8@Huawei.com>
In-Reply-To: <20240704031603.1744546-5-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
	<20240704031603.1744546-5-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: /HONZiLEDEjM

On Thu,  4 Jul 2024 11:15:59 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Add cache_supported flags in SMPCompatProps to allow machines to
> configure various caches support.
> 
> And implement check() method for machine's "smp-cache" link property,
> which will check the compatibility of the cache properties with the
> machine support.

One question inline.

> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
> Changes since RFC v2:
>  * Split as a separate commit to just include compatibility checking and
>    topology checking.
>  * Allow setting "default" topology level even though the cache
>    isn't supported by machine. (Daniel)
> ---
>  hw/core/machine-smp.c | 80 +++++++++++++++++++++++++++++++++++++++++++
>  hw/core/machine.c     | 17 +++++++--
>  include/hw/boards.h   |  6 ++++
>  3 files changed, 101 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index 88a73743eb1c..bf6f2f91070d 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -276,3 +276,83 @@ CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
>  {
>      return ms->smp_cache->props[cache].topo;
>  }
> +
> +static bool machine_check_topo_support(MachineState *ms,
> +                                       CpuTopologyLevel topo,
> +                                       Error **errp)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +
> +    if ((topo == CPU_TOPO_LEVEL_MODULE && !mc->smp_props.modules_supported) ||

I can sort of understand why they will always be supported but why not include
core and socket in here just to avoid the complexity of wondering if they are?

> +        (topo == CPU_TOPO_LEVEL_CLUSTER && !mc->smp_props.clusters_supported) ||
> +        (topo == CPU_TOPO_LEVEL_DIE && !mc->smp_props.dies_supported) ||
> +        (topo == CPU_TOPO_LEVEL_BOOK && !mc->smp_props.books_supported) ||
> +        (topo == CPU_TOPO_LEVEL_DRAWER && !mc->smp_props.drawers_supported)) {
> +        error_setg(errp,
> +                   "Invalid topology level: %s. "
> +                   "The topology level is not supported by this machine",
> +                   CpuTopologyLevel_str(topo));
> +        return false;
> +    }
> +
> +    return true;
> +}



