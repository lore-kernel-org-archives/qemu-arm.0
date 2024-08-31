Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp551610njf;
        Sat, 31 Aug 2024 04:32:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOMCbsTzuDkzJwpI3bP0njoRcLBRIt33pHYEVlqhEyWRmY/aniwBGjJnPmyT4pftPsT2QHbPCip1pVtQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHewo7FtWIyd3+bYT0UFy7IOEEPhxuaYX1h/h5aSB1cIIk+iX8P/nR7E+DxqFoovZuCgQUJ
X-Received: by 2002:a05:6808:152a:b0:3da:a793:f0df with SMTP id 5614622812f47-3df1c943524mr1633768b6e.9.1725103935288;
        Sat, 31 Aug 2024 04:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725103935; cv=none;
        d=google.com; s=arc-20160816;
        b=DL6HAXyhlAdlj7uBsqkhnpr/x9riMO72x+tWY10qTGNIkkeMwUmsp9DmxbsQ1XarPt
         eZk3vdI2B5v15JuofoX6c66F0OTT5nPd+S01Boho0P+gsjLskEFtf47yWvEVUC4d77jZ
         JRlW3XI3W8dVNtHFzZ55tXrvhtVZcZd2QN7pWyeH4PvwL4Yz86qrB/6J3u+dh9fY2hds
         LgqsGY2BuIKI2aH+npkF3YVtyfxB6W771HBVvxLplNiD1sdfujE2p52SFJZDiL4yss58
         yIblcyoJzI48HaKwvYna6adqTJjrDe3EupWjYAdC4wSOERatyD650gtgQPujIgW9jO8o
         UdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=lkd/5/P+JOimT3pJF4lCiJEgWaM/ukGugq0p1KeBEvI=;
        fh=lu+wOHEYZO1oZq4R0p5rj+pV6gbzqyjP6WYQYAObjOk=;
        b=hjUPasYTeH97OWX8n53fPVfr41dBrTSuXrS8nk5td3EYFm/LzIk7ZwxYCMsUrfAcFf
         TudPcV1kT/0RHvuw/mrkZJawDPvF/p7SX8TzKPGOVI049HzE/8pZxAA/UhTpmsqaFNBD
         CJ1QROJM7m0QytL0V5qT/51IBRD13j9ENIJe6Xu6TYKgzmQBq8eE9jpcqh5qj41oKC57
         sdlWBN4Va/Emva73Oz6lhKVb8soM4h1hp/3mDbkWc1XVdasCJRdTFTpUalKaR8OfQyIp
         dM7XUXAbwjEHimBhGlf5uwT0CKw8bDcWD9BlRHS49c1AFdJllnkXFNsfwdBvPTSfU/ty
         fOBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=EZYOmO24;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682dc14b3si58031771cf.579.2024.08.31.04.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Aug 2024 04:32:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=EZYOmO24;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1skMKp-0005Sj-RF; Sat, 31 Aug 2024 07:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1skMKm-0005Qk-JV; Sat, 31 Aug 2024 07:32:01 -0400
Received: from mgamail.intel.com ([192.198.163.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1skMKk-00014S-L6; Sat, 31 Aug 2024 07:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725103918; x=1756639918;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6uNMHpxaj+ivxkzstyBO1rbu0+125vnKHN4tTD6PoCs=;
 b=EZYOmO24fMJ/7aFdCKTdLMZPUsIWiz78wmiJDV4X8Jqwlk0ZCRrwWjuw
 OiNpaiNZpMXAegRGPXbRwdM5f5vNYstXzEOka6R9oWDOpDgFwpA/MQBOh
 H35Pa+GFHLN4x8YqgRV5Rk4e1cTQ28bxrI4H5Wp0toN9JwZR8wWHxWzm5
 14xweneFlVVIqVbsN9NRscip/V+nBunz/dl8Ute3j4VLYwzc2zAb3xdfk
 p0oBZy8Tn64es/1rQwTDm/hv106V15HA6odJy+znqJH8quNENTLBoGYdu
 Jcyho0mYv1SRlKjybAZkoClKC6S05lgztT4+hpVLih/nSEhljeFG4WvfZ w==;
X-CSE-ConnectionGUID: amfmdHGnQx6oJQCHyaE1mw==
X-CSE-MsgGUID: zWleT8yJQxWJ/7Adb/MSgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23256824"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; d="scan'208";a="23256824"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2024 04:31:55 -0700
X-CSE-ConnectionGUID: 5FitaHdGS7WP/YEJf2/TAA==
X-CSE-MsgGUID: uqCpOO/sQhWzRMfQv5pZyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; d="scan'208";a="64101388"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by orviesa009.jf.intel.com with ESMTP; 31 Aug 2024 04:31:50 -0700
Date: Sat, 31 Aug 2024 19:47:49 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, zhenyu.z.wang@intel.com,
 dapeng1.mi@linux.intel.com, yongwei.ma@intel.com, armbru@redhat.com,
 farman@linux.ibm.com, peter.maydell@linaro.org, mst@redhat.com,
 anisinha@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mtosatti@redhat.com, berrange@redhat.com,
 richard.henderson@linaro.org, linuxarm@huwei.com,
 shameerali.kolothum.thodi@huawei.com, Jonathan.Cameron@huawei.com,
 jiangkunkun@huawei.com, zhao1.liu@intel.com
Subject: Re: [PATCH 2/2] hw/acpi: add cache hierarchy node to pptt table
Message-ID: <ZtMC5Y5AJW3mAmO2@intel.com>
References: <20240823125446.721-1-alireza.sanaee@huawei.com>
 <20240823125446.721-3-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823125446.721-3-alireza.sanaee@huawei.com>
Received-SPF: pass client-ip=192.198.163.18; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ivRU0kEo9B+9

Hi Alireza,

On Fri, Aug 23, 2024 at 01:54:46PM +0100, Alireza Sanaee wrote:

[snip]

> +static int partial_cache_description(MachineState *ms, ACPIPPTTCache* caches,
> +                                 int num_caches)
> +{
> +    int level, c;
> +
> +    for (level = 1; level < num_caches; level++) {
> +        for (c = 0; c < num_caches; c++) {
> +            if (caches[c].level != level) {
> +                continue;
> +            }
> +
> +            switch (level) {
> +            case 1:
> +                /*
> +                 * L1 cache is assumed to have both L1I and L1D available.
> +                 * Technically both need to be checked.
> +                 */
> +                if (machine_get_cache_topo_level(ms, SMP_CACHE_L1I) ==
> +                        CPU_TOPO_LEVEL_DEFAULT) {

This check just concerns L1i, but it looks not covering L1d, is L1d being
missed?  

> +                    assert(machine_get_cache_topo_level(ms, SMP_CACHE_L1D) !=
> +                           CPU_TOPO_LEVEL_DEFAULT);

I understand you don't want user to configure other different levels for
L1d in this case...If so, it's better to return error (error_steg or
error_report or some other error print ways) to tell user his cache
configuration is invalid.

> +                    return level;
> +                }
> +                break;
> +            case 2:
> +                if (machine_get_cache_topo_level(ms, SMP_CACHE_L2) ==
> +                        CPU_TOPO_LEVEL_DEFAULT) {
> +                    return level;
> +                }
> +                break;
> +            case 3:
> +                if (machine_get_cache_topo_level(ms, SMP_CACHE_L3) ==
> +                        CPU_TOPO_LEVEL_DEFAULT) {
> +                    return level;
> +                }
> +                break;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +

[snip]

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b0c68d66a3..b723248ecf 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3093,6 +3093,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      hc->unplug = virt_machine_device_unplug_cb;
>      mc->nvdimm_supported = true;
>      mc->smp_props.clusters_supported = true;
> +    /* Supported cached */
> +    mc->smp_props.cache_supported[SMP_CACHE_L1D] = true;
> +    mc->smp_props.cache_supported[SMP_CACHE_L1I] = true;
> +    mc->smp_props.cache_supported[SMP_CACHE_L2] = true;
> +    mc->smp_props.cache_supported[SMP_CACHE_L3] = true;
>      mc->auto_enable_numa_with_memhp = true;
>      mc->auto_enable_numa_with_memdev = true;
>      /* platform instead of architectural choice */
> diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> index bf6f2f9107..de95ec9c0f 100644
> --- a/hw/core/machine-smp.c
> +++ b/hw/core/machine-smp.c
> @@ -274,7 +274,11 @@ unsigned int machine_topo_get_threads_per_socket(const MachineState *ms)
>  CpuTopologyLevel machine_get_cache_topo_level(const MachineState *ms,
>                                                SMPCacheName cache)
>  {
> -    return ms->smp_cache->props[cache].topo;
> +    if (ms->smp_cache) {
> +        return ms->smp_cache->props[cache].topo;
> +    }
> +
> +    return CPU_TOPO_LEVEL_DEFAULT;
>  }
>  
>  static bool machine_check_topo_support(MachineState *ms,

Maybe it's better to split smp-cache support/check on Arm in a seperate
patch.

Regards,
Zhao


