Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp95704nji;
        Wed, 11 Sep 2024 03:00:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEenvlRlcAYPnh7F+PfdHkFg5pbejmbZY40fTleFIxJ5begyVv3xbFXjbftwLBs7f6B3OTLxzJ4hYxUg==@linaro.org
X-Google-Smtp-Source: AGHT+IHLGcIrAVRuqm8jX1aNCHGEKaL0+49F7NirvL6dx6ZhLiBAIwjeOTH0S3wD6wJOr0uiUTKz
X-Received: by 2002:a05:600c:4706:b0:42c:c401:6d67 with SMTP id 5b1f17b1804b1-42ccd30c292mr18003195e9.6.1726048835823;
        Wed, 11 Sep 2024 03:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726048835; cv=none;
        d=google.com; s=arc-20240605;
        b=EOFaclSo75UdOXlRb4nFAlEpJVZp/lU1L7jVHxI3QmZ+6o5lo7LIMSbD+rtIoJmyaI
         v/mFu/2HfEkShX+5hbQGgxgIOFWlLF0UGuSMHJdKagyK8U1M/qmIPxOLakzBhfnrY9n/
         9ruWl5GRaX7D9R6hXcK1MkGsIkn9ZECzarqNFyRg5op8HbZIM2DLulmajH/CeYXrkTJz
         OmJM/SjaN9SQqr87+NTnZUN4XFlUQz4I2bMxreEbCPdUlFNMrSKUg2D6rygPte2pOcYe
         jX/sjdgYvljhNdeZSwXP976+Ka+X9ZmR6NrgAEESU0rw/OHXIt8Q7st9KGSA1RqnFjHL
         efAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=rSFc+qe4tFAGB6AeY2pyXQhSgvb0WHqPRqX89CaQH0k=;
        fh=fBKAgV0VFR+Ei6R5s5VTWgJmJEVL6nWjYl4EAfGjRcA=;
        b=eAf6yI3AW2R0NV1JJS41s90ruf2JDrTljfih/xlYEmqX/RxnOYxxBUPBNLBZwWf80x
         aFXtLdBPzQWt7pjgKVzpyGuQMdEtbwbkPWnli8d7fqbO0KgsBY3t1hh6DDawa7I0cw86
         NmixueN+/UNWOH+3JocGOSW4Z4KAo/6Bf38e5LrrMShmVSHESZv/wKSwEiq9ZXoKo3rm
         grvfFSxbgDqNX8wfOX7ListvxBZtIo5BgEwJp1z7QE8Ub2NbFKHVL+N/bGw85yjYexr4
         yWWGriZukscigJY65JNd3FaHwoMuZ/4C1TW+g8zj/rrfkZuiP+SL7nPcr1pF9kJ9fTT+
         NfuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=alireza.sanaee@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <alireza.sanaee@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-378956cffcdsi3870688f8f.891.2024.09.11.03.00.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Sep 2024 03:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=alireza.sanaee@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X3bYH5mCFz6K6DS;
	Wed, 11 Sep 2024 17:55:47 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id D4871140CB9;
	Wed, 11 Sep 2024 18:00:34 +0800 (CST)
Received: from localhost (10.47.75.248) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 11 Sep
 2024 12:00:33 +0200
Date: Wed, 11 Sep 2024 11:00:28 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Jonathan  Cameron <Jonathan.Cameron@huawei.com>, Sia Jee Heng  <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH v2 6/7] i386/cpu: Update cache topology with machine's
 configuration
Message-ID: <20240911110028.00001d3d@huawei.com>
In-Reply-To: <20240908125920.1160236-7-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
	<20240908125920.1160236-7-zhao1.liu@intel.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.248]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-TUID: Uk2r2bNREj7v

On Sun,  8 Sep 2024 20:59:19 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> User will configure smp cache topology via -machine smp-cache.
> 
> For this case, update the x86 CPUs' cache topology with user's
> configuration in MachineState.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
> ---
> Changes since RFC v2:
>  * Used smp_cache array to override cache topology.
>  * Wrapped the updating into a function.
> ---
>  target/i386/cpu.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index e9f755000356..6d9f7dc0872a 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7597,6 +7597,38 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
>      cpu->hyperv_limits[2] = 0;
>  }
>  
> +#ifndef CONFIG_USER_ONLY
> +static void x86_cpu_update_smp_cache_topo(MachineState *ms, X86CPU
> *cpu) +{
> +    CPUX86State *env = &cpu->env;
> +    CpuTopologyLevel level;
> +
> +    level = machine_get_cache_topo_level(ms,
> CACHE_LEVEL_AND_TYPE_L1D);
> +    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
> +        env->cache_info_cpuid4.l1d_cache->share_level = level;
> +        env->cache_info_amd.l1d_cache->share_level = level;
> +    }
> +
> +    level = machine_get_cache_topo_level(ms,
> CACHE_LEVEL_AND_TYPE_L1I);
> +    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
> +        env->cache_info_cpuid4.l1i_cache->share_level = level;
> +        env->cache_info_amd.l1i_cache->share_level = level;
> +    }
> +
> +    level = machine_get_cache_topo_level(ms,
> CACHE_LEVEL_AND_TYPE_L2);
> +    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
> +        env->cache_info_cpuid4.l2_cache->share_level = level;
> +        env->cache_info_amd.l2_cache->share_level = level;
> +    }
> +
> +    level = machine_get_cache_topo_level(ms,
> CACHE_LEVEL_AND_TYPE_L3);
> +    if (level != CPU_TOPOLOGY_LEVEL_DEFAULT) {
> +        env->cache_info_cpuid4.l3_cache->share_level = level;
> +        env->cache_info_amd.l3_cache->share_level = level;
> +    }
> +}
> +#endif
> +
>  static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs = CPU(dev);
> @@ -7821,6 +7853,13 @@ static void x86_cpu_realizefn(DeviceState
> *dev, Error **errp) 
>  #ifndef CONFIG_USER_ONLY
>      MachineState *ms = MACHINE(qdev_get_machine());
> +
> +    /*
> +     * TODO: Add a SMPCompatProps.has_caches flag to avoid useless
> Updates
> +     * if user didn't set smp_cache.
> +     */
Hi Zhao,

Thanks for sending this patchset so quickly. I really appreciate the
TODO already :) It also helps me avoid going through every single
layer, especially when I want to avoid matching system registers in
ARM, particularly when there's no description in the command line.
> +    x86_cpu_update_smp_cache_topo(ms, cpu);
> +
>      qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
>  
>      if (cpu->env.features[FEAT_1_EDX] & CPUID_APIC || ms->smp.cpus >
> 1) {
