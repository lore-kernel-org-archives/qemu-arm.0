Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp173808njb;
        Thu, 17 Oct 2024 06:16:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWP6fln2BTJwgackD937BA8xY48XOqB6YPdyENX7O/s1LfoRz4LiTKg47iFOZFU/kW1HhiZR7N0ySTNqg==@linaro.org
X-Google-Smtp-Source: AGHT+IFnTDCEJ3Rn+uRrwEN++kGq5ZaUqg39vskdKA5CcZkTzGnRY2PiwG5Xw0uiT1SjJ6ncQCrp
X-Received: by 2002:adf:f64e:0:b0:37d:2e74:2eea with SMTP id ffacd0b85a97d-37d93dcc0d5mr2066312f8f.5.1729170976949;
        Thu, 17 Oct 2024 06:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729170976; cv=none;
        d=google.com; s=arc-20240605;
        b=RPCwVYrhT5R39IctQWVSNvpsn78PYYLny/nYrf9uGxFSmjtSe3z8HrKfTfde0/aRWk
         Fv/CzU72fSzW/eL4B0QOtHrEOuK/nl3xC/h7qJerdu8XR8PTOLdAgxjgdkSbACJuYZkK
         4qBZMdKUzvUEbGoP86Ds4S11dB+hdgMK1SWfT4LFG7twR9iobLQ5JCVHh+aSxMv7XJ4Z
         6yMj4E+7seoy6UKHUy8OnRNlkdibUtEaDCaTPzl9tpX959a/K0e/ND+hlvwORAmuH3UW
         EJ9o/lq4O8UOJRF2P17O/aX1COUJSoNp2gEjCeMNkitxXr27NJIPVb9Fzui6/r2yrjUJ
         86tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=7OYs/iGuc9hGDWURJ+udy+ALewqygO9N67GjruodCsc=;
        fh=LPBeeAAheqr1015aaa2RBrvbo5b2UcjJD1ORJet6QLY=;
        b=EeaDPSBaMfwLGNpbNVUjokRYPnVYXZGNxgIv3XloTDZaZ4R+Zf4qfvlYbSu44qRWAx
         JC5RSyKHZhEGMJdqEnTN5Zv4tEmWdtI3R/8X4DKKp0pW8VE2sY6wTCqc6bzGkSj/FukW
         USOAIsImPfJx/5F/Wv4prPv4Xq9cebyQWvBYbMDGbONoA1TFYhymE4JM5pWGHaRoKe3P
         slFAlfmbKo9AggjM3hGX4BiQ41wVsOXYxDwzxSJBHrjfMk/nmUPIbtrqq3EWQJaUb889
         qoeDw0rD/BGL/pFHrRnWyQXdDwok0e8P7OGb4jrWq7DnGO0pCd0j5jbmkOQ0d5aqLx1x
         u7mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fcc9e94si2782651f8f.726.2024.10.17.06.16.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2024 06:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XTpBl0XCzz6LDG1;
	Thu, 17 Oct 2024 21:11:43 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A46701400C9;
	Thu, 17 Oct 2024 21:16:14 +0800 (CST)
Received: from localhost (10.126.174.164) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Oct
 2024 15:16:13 +0200
Date: Thu, 17 Oct 2024 14:16:11 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=
 =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
	<wangyanan55@huawei.com>, "Michael S.Tsirkin " <mst@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, <qemu-devel@nongnu.org>,
	<kvm@vger.kernel.org>, <qemu-riscv@nongnu.org>, <qemu-arm@nongnu.org>,
	"Zhenyu Wang" <zhenyu.z.wang@intel.com>, Dapeng Mi
	<dapeng1.mi@linux.intel.com>
Subject: Re: [PATCH v3 7/7] i386/cpu: add has_caches flag to check smp_cache
 configuration
Message-ID: <20241017141611.00007566@Huawei.com>
In-Reply-To: <20241012104429.1048908-8-zhao1.liu@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
 <20241012104429.1048908-8-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.164]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: eYlYvSENqaz+

RESEND as rejected by server (header issue, hopefully fixed)

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
