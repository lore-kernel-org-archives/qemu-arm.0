Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp51463njb;
        Thu, 17 Oct 2024 02:06:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQAEXfPg51TXRBGoxx0XqzkYZduPXo7opknA/f/dVF8AkYxJ8P8P8WAGAyLk1+vmvmRIpGJiIIqfyt8g==@linaro.org
X-Google-Smtp-Source: AGHT+IFKepGOxLuuVWxixX/TZ52mYwcAvdfRAvpgq2ERH22W2TurCxIRTaGmS8McnuStJAURDd4M
X-Received: by 2002:a05:600c:4e45:b0:431:1868:417f with SMTP id 5b1f17b1804b1-4314a305f95mr67638755e9.17.1729155967362;
        Thu, 17 Oct 2024 02:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729155967; cv=none;
        d=google.com; s=arc-20240605;
        b=QA7wyKUOR9DXlp2uRc61HMok5bdri5C8K/+WRbcnSjUyrUKHNrr/578B8UUsyzu0oZ
         LGyrXldLNRsDNMuDdIrK2CdIOGAjdXEYfkJksSq9vy97YZTDLoBU+R7VqgZslGgjnnE4
         sx/UjFQOD3ynzr8UylnYgDPGo+i5vRQbvv7Fq923/my89MdKCd6wXdyqC4f+3d62jyyB
         LL9fCtwO910kVy5C3xT1RviXquAfsJzqJk3/QZ0pzvX40rSl4SO+4UNsJrOZ4V/XYRYj
         /eIXeABYGOtrwNuR/NKyTXe4BWo+FTbt+NTxNyrTbRJJqwP+PfGa8gh0aZMZcvovryF4
         FrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=lGvlN0bld/koJ1+UmGqvxmQ2ixE3KXqNFTMVyvsbud0=;
        fh=3b9il47umKWjqKrof5lgN8HMBQZG2Z+dz652rXT+PHY=;
        b=XFYSbcaFKLSwBsVIc5VJkjU0ASOAg4lzLhRNOMCxHb+9yVchBlq8ssrGvmEps88rRm
         W2sB6cuUerbBjD0ttuqr1PYSeUGXOkMxFYaEoLRxfv3/rl5osQv2zK7zUZauaMwh8grm
         AqfkO7oIjNz9DHqDU2W0Y7vqgMd68tMFvYg9lQufim37edMMibtg4Dx5W1ewviKMiP1b
         A10LPEPtUH0rPq+mOznrGUFFN7ztyBnL0MYAw8jvJmI/q6nuALVT9y3I3JacY8RE92EP
         LdUVrY01uMRKFLOgl/H2tuX31NIOUnyiURCN1PghLFiVSju61PBtW1Xp69KDD4Nuor0C
         hJ0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fcca23esi2699997f8f.700.2024.10.17.02.06.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2024 02:06:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XThkZ5DQTz6JBHx;
	Thu, 17 Oct 2024 17:05:26 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 899DE140D1A;
	Thu, 17 Oct 2024 17:06:06 +0800 (CST)
Received: from localhost (10.126.174.164) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Oct
 2024 11:06:04 +0200
Date: Thu, 17 Oct 2024 10:06:03 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>"@domain.invalid
Subject: Re: [PATCH v3 7/7] i386/cpu: add has_caches flag to check smp_cache
 configuration
Message-ID: <20241017100603.00003a57@Huawei.com>
In-Reply-To: <20241012104429.1048908-8-zhao1.liu@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
	<20241012104429.1048908-8-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.164]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: sF2lS+j3hqQB

On Sat, 12 Oct 2024 18:44:29 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> From: Alireza Sanaee <alireza.sanaee@huawei.com>
> 
> Add has_caches flag to SMPCompatProps, which helps in avoiding
> extra checks for every single layer of caches in x86 (and ARM in
> future).
> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
> Note: Picked from Alireza's series with the changes:
>  * Moved the flag to SMPCompatProps with a new name "has_caches".
>    This way, it remains consistent with the function and style of
>    "has_clusters" in SMPCompatProps.
>  * Dropped my previous TODO with the new flag.
> ---
> Changes since Patch v2:
>  * Picked a new patch frome Alireza's ARM smp-cache series.
> ---
>  hw/core/machine-smp.c | 2 ++
>  include/hw/boards.h   | 3 +++
>  target/i386/cpu.c     | 9 ++++-----
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index f3edbded2e7b..16e456678cb6 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -367,6 +367,8 @@ bool machine_parse_smp_cache(MachineState *ms,
>          return false;
>      }
>  
> +    mc->smp_props.has_caches = true;
> +
>      return true;
>  }
>  
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index e4a1035e3fa1..af62b09c89d1 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -153,6 +153,8 @@ typedef struct {
>   * @modules_supported - whether modules are supported by the machine
>   * @cache_supported - whether cache (l1d, l1i, l2 and l3) configuration are
>   *                    supported by the machine
> + * @has_caches - whether cache properties are explicitly specified in the
> + *               user provided smp-cache configuration
>   */
>  typedef struct {
>      bool prefer_sockets;
> @@ -163,6 +165,7 @@ typedef struct {
>      bool drawers_supported;
>      bool modules_supported;
>      bool cache_supported[CACHE_LEVEL_AND_TYPE__MAX];
> +    bool has_caches;
>  } SMPCompatProps;
>  
>  /**
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index c8a04faf3764..6f711e98b527 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7853,12 +7853,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>  
>  #ifndef CONFIG_USER_ONLY
>      MachineState *ms = MACHINE(qdev_get_machine());
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
>  
> -    /*
> -     * TODO: Add a SMPCompatProps.has_caches flag to avoid useless Updates
> -     * if user didn't set smp_cache.
> -     */
> -    x86_cpu_update_smp_cache_topo(ms, cpu);
> +    if (mc->smp_props.has_caches) {
> +        x86_cpu_update_smp_cache_topo(ms, cpu);
> +    }
>  
>      qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
>  
