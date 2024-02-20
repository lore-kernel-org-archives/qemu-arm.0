Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1523056ejb;
        Tue, 20 Feb 2024 12:07:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUdGTBvOtNYJFjGz45wirt4Y2MXypbwOGCsitJcFVoIu1dmDdyCuJGxmsTAhvQ1eJxk2Dui2omTTP0G91/9a48xtk/uurmb
X-Received: by 2002:a05:6512:ba0:b0:512:cad4:243 with SMTP id b32-20020a0565120ba000b00512cad40243mr2017424lfv.17.1708459645040;
        Tue, 20 Feb 2024 12:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708459645; cv=none;
        d=google.com; s=arc-20160816;
        b=aeBwif4lsG2JZyM8QY9Cj2p991TGZX8yBH/plmjls8qyyrnMFcMqXZZzp9OAR5vsVs
         sTWqCILJPSTnvbL7u/MMqpweSpiVPGlui7zTHZ7/flOduvKxhQYjysCTzABxjv9zabI3
         AGJjZhB6FjRZnSvtN1SrddxfCZmXAudTFmYM9cdJLcexIAXmmyoUPkCByTP086YzSGzm
         oshAiOAimUgpi/B79ro8RDxkSzZ92XOyJHQhjMiMN7/aQ9d/yYmQtmEtkKl1vUSS7PBl
         /R2qjgS+xr44mWvFb/Rf/IH7aLXV9mnShtPh0+PSH5U5CLuzcTiThXQl625FvQSs2fqH
         q9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=k6QpmIrhO156cbOXHJUpDUKmevIjeRjpwIrR8hjtAbQ=;
        fh=OFYr5ZsqNDAiHo9rfJonKvo7SODQ/bGDDlXuZ0Mbm5Q=;
        b=oMO+dmPB3coRagZDSYQxH4jrrpBvjCy0jXw0AeUSVQ9BvxTxw7tsWK1W66Wwqd4tp4
         Kwnx8c0FOCTRIIbLt9KoTiEcH924TheCgtUwi/h1NpD6ro0lvDnHQzCYk6gTCKas9YVC
         mtBgazaZgVmeJmI+tGYjpjd37AvggOAyi2FNpSn+BUt4W46qMAVM1wVwFxhcMDMPiVsB
         A/wdpgunW9MqjJ8DNKGqUc6zBV+XgxnboMJ68WEqWTMqh7NIM/IMCyiuhCAFOxXdC0di
         My5q6cwb/iVYVowy7MFydS/EyRRK4Ei5FspGjg2yNknKY3+j6b20wkPU7zNOTLMaNlTU
         WUew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bmz7WEla;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o16-20020a05600c4fd000b0040ee2e4f6fdsor2901275wmq.7.2024.02.20.12.07.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Feb 2024 12:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bmz7WEla;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708459644; x=1709064444; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6QpmIrhO156cbOXHJUpDUKmevIjeRjpwIrR8hjtAbQ=;
        b=bmz7WEla23FHTWZwJsdxysPR9jjqUGlOvm7/gFRkG6dWWhOq+jVUjebvaVkBPH882v
         XjtWqZq0k/iqilTnGlZA82T52ffQMroJBIV//enspRCc2+FiO34m7l9SDdTYee6J9TbZ
         XEzlex1A/mibBLR8i8534k2OSDxnVy9BUvji+4338G8fY0yAIFLMUDLGUNwmCoXORrYE
         4h4vMHobwOWX0pXfIfJhin4W94oYqmaT4wyiDunf5REbsRY1FURWBobLosEzAlKnZeSL
         uL2/dTFG/D7aKrzOgQULom9HE8cCW5ZMt9l1OxPCUXGHab7E1lfaBKAeHg6/Bitzptzf
         ArBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708459644; x=1709064444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6QpmIrhO156cbOXHJUpDUKmevIjeRjpwIrR8hjtAbQ=;
        b=XA79ca2mCmrlAljSxsue3b/v/+8GNBrRcZw0DmOjn2PRYfKO/K8z5D1co1ij87NMaf
         Rcj3bZkVtNcxuLYhR1bzhj/DdU+KdRKVp3GHtsYNotSXsXxxIjhyfcf91BVPqifL2Ydf
         hgcFZLD77cFZEXkIeB5tV72BXb+2SI9MU5M2FZbp+Zg7n0G2/NNEMHe90AqqlCtIJrOX
         EFkIxAMBnowRUpPEmkFz2wGFpEP7P0Lgxl//XeDHjwPA5rBQgLu6mxgrDlDshDJinRnL
         MuoftXqmBANEDMfa8wjhsVJYvU2D9+wVlwAeM8DoUZMWVcnDvSAOQ+wcxl8ayDQOIgQC
         E2qg==
X-Forwarded-Encrypted: i=1; AJvYcCWLAINaPxzOyHtU0jkBM/AHW8r2Wu9ixAIslwoxcvPXw5Jg6Ataama8S63KhcL1BqXpN41bTKuG+JP6LbRjhH/h6CfO2kj9
X-Gm-Message-State: AOJu0Yw2vv7iG7Qgpi1We53duJkDo0+qqq4XuTD81W6PYzHvBDTamdVl
	XIh7crtirbc8Ox1mlN/cmcfRlfxKAf7VVLBcCg5ewfZKxTP6btOwrOQdsPaeYbEhgQ==
X-Google-Smtp-Source: AGHT+IEK4McQ9T2zv4lpqwKdXmWgKuJpwjl6tPduodUX7Bi2cOqfM4N4H1y3ia21UAyHWI4vOXM/4A==
X-Received: by 2002:a05:600c:3550:b0:412:6e2f:5f9c with SMTP id i16-20020a05600c355000b004126e2f5f9cmr2164615wmq.7.1708459644586;
        Tue, 20 Feb 2024 12:07:24 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (mek33-h02-176-184-23-7.dsl.sta.abo.bbox.fr. [176.184.23.7])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c471000b004126f8c68eesm3020698wmo.3.2024.02.20.12.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 12:07:23 -0800 (PST)
Message-ID: <66cf4c35-5f19-4e5e-a0a1-adb1ab7cf8f4@linaro.org>
Date: Tue, 20 Feb 2024 21:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/8] Introduce SMP Cache Topology
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: bXG0u/zWYAgK

+Igor

On 20/2/24 10:24, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Hi list,
> 
> This's our proposal for supporting (SMP) cache topology in -smp as
> the following example:
> 
> -smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32,\
>       l1d-cache=core,l1i-cache=core,l2-cache=core,l3-cache=die
> 
> With the new cache topology options ("l1d-cache", "l1i-cache",
> "l2-cache" and "l3-cache"), we could adjust the cache topology via -smp.
> 
> This patch set is rebased on our i386 module series:
> https://lore.kernel.org/qemu-devel/20240131101350.109512-1-zhao1.liu@linux.intel.com/
> 
> Since the ARM [1] and RISC-V [2] folks have similar needs for the cache
> topology, I also cc'd the ARM and RISC-V folks and lists.
> 
> 
> Welcome your feedback!
> 
> 
> Introduction
> ============
> 
> Background
> ----------
> 
> Intel client platforms (ADL/RPL/MTL) and E core server platforms (SRF)
> share the L2 cache domain among multiple E cores (in the same module).
> 
> Thus we need a way to adjust the cache topology so that users could
> create the cache topology for Guest that is nearly identical to Host.
> 
> This is necessary in cases where there are bound vCPUs, especially
> considering that Guest scheduling often takes into account the cache
> topology as well (e.g. Linux cluster aware scheduling, i.e. L2 cache
> scheduling).
> 
> Previously, we introduced a x86 specific option to adjust the cache
> topology:
> 
> -cpu x-l2-cache-topo=[core|module] [3]
> 
> However, considering the needs of other arches, we re-implemented the
> generic cache topology (aslo in response to Michael's [4] and Daniel's
> comment [5]) in this series.
> 
> 
> Cache Topology Representation
> -----------------------------
> 
> We consider to define the cache topology based on CPU topology level for
> two reasons:
> 
> 1. In practice, a cache will always be bound to the CPU container -
>     "CPU container" indicates to a set of CPUs that refer to a certain
>     level of CPU topology - where the cache is either private in that
>     CPU container or shared among multiple containers.
> 
> 2. The x86's cache-related CPUIDs encode cache topology based on APIC
>     ID's CPU topology layout. And the ACPI PPTT table that ARM/RISCV
>     relies on also requires CPU containers (CPU topology) to help
>     indicate the private shared hierarchy of the cache.
> 
> Therefore, for SMP systems, it is natural to use the CPU topology
> hierarchy directly in QEMU to define the cache topology.
> 
> And currently, separated L1 cache (L1 data cache and L1 instruction
> cache) with unified higher-level caches (e.g., unified L2 and L3
> caches), is the most common cache architectures.
> 
> Thus, we define the topology for L1 D-cache, L1 I-cache, L2 cache and L3
> cache in MachineState as the basic cache topology support:
> 
> typedef struct CacheTopology {
>      CPUTopoLevel l1d;
>      CPUTopoLevel l1i;
>      CPUTopoLevel l2;
>      CPUTopoLevel l3;
> } CacheTopology;
> 
> Machines may also only support a subset of the cache topology
> to be configured in -smp by setting the SMP property of MachineClass:
> 
> typedef struct {
>      ...
>      bool l1_separated_cache_supported;
>      bool l2_unified_cache_supported;
>      bool l3_unified_cache_supported;
> } SMPCompatProps;
> 
> 
> Cache Topology Configuration in -smp
> ------------------------------------
> 
> Further, we add new parameters to -smp:
> * l1d-cache=level
> * l1i-cache=level
> * l2-cache=level
> * l3-cache=level
> 
> These cache topology parameters accept the strings of CPU topology
> levels (such as "drawer", "book", "socket", "die", "cluster", "module",
> "core" or "thread"). Exactly which topology level strings could be
> accepted as the parameter depends on the machine's support for the
> corresponding CPU topology level.
> 
> Unsupported cache topology parameters will be omitted, and
> correspondingly, the target CPU's cache topology will use the its
> default cache topology setting.
> 
> In this series, we add the cache topology support in -smp for x86 PC
> machine.
> 
> The following example defines a 3-level cache topology hierarchy (L1
> D-cache per core, L1 I-cache per core, L2 cache per core and L3 cache per
> die) for PC machine.
> 
> -smp 32,sockets=2,dies=2,modules=2,cores=2,threads=2,maxcpus=32,\
>       l1d-cache=core,l1i-cache=core,l2-cache=core,l3-cache=die
> 
> 
> Reference
> ---------
> 
> [1]: [ARM] Jonathan's proposal to adjust cache topology:
>       https://lore.kernel.org/qemu-devel/20230808115713.2613-2-Jonathan.Cameron@huawei.com/
> [2]: [RISC-V] Discussion between JeeHeng and Jonathan about cache
>       topology:
>       https://lore.kernel.org/qemu-devel/20240131155336.000068d1@Huawei.com/
> [3]: Previous x86 specific cache topology option:
>       https://lore.kernel.org/qemu-devel/20230914072159.1177582-22-zhao1.liu@linux.intel.com/
> [4]: Michael's comment about generic cache topology support:
>       https://lore.kernel.org/qemu-devel/20231003085516-mutt-send-email-mst@kernel.org/
> [5]: Daniel's question about how x86 support L2 cache domain (cluster)
>       configuration:
>       https://lore.kernel.org/qemu-devel/ZcUG0Uc8KylEQhUW@redhat.com/
> 
> Thanks and Best Regards,
> Zhao
> 
> ---
> Zhao Liu (8):
>    hw/core: Rename CpuTopology to CPUTopology
>    hw/core: Move CPU topology enumeration into arch-agnostic file
>    hw/core: Define cache topology for machine
>    hw/core: Add cache topology options in -smp
>    i386/cpu: Support thread and module level cache topology
>    i386/cpu: Update cache topology with machine's configuration
>    i386/pc: Support cache topology in -smp for PC machine
>    qemu-options: Add the cache topology description of -smp
> 
>   MAINTAINERS                     |   2 +
>   hw/core/cpu-topology.c          |  56 ++++++++++++++
>   hw/core/machine-smp.c           | 128 ++++++++++++++++++++++++++++++++
>   hw/core/machine.c               |   9 +++
>   hw/core/meson.build             |   1 +
>   hw/i386/pc.c                    |   3 +
>   hw/s390x/cpu-topology.c         |   6 +-
>   include/hw/boards.h             |  33 +++++++-
>   include/hw/core/cpu-topology.h  |  40 ++++++++++
>   include/hw/i386/topology.h      |  18 +----
>   include/hw/s390x/cpu-topology.h |   6 +-
>   qapi/machine.json               |  14 +++-
>   qemu-options.hx                 |  54 ++++++++++++--
>   system/vl.c                     |  15 ++++
>   target/i386/cpu.c               |  55 ++++++++++----
>   target/i386/cpu.h               |   2 +-
>   tests/unit/meson.build          |   3 +-
>   tests/unit/test-smp-parse.c     |  14 ++--
>   18 files changed, 399 insertions(+), 60 deletions(-)
>   create mode 100644 hw/core/cpu-topology.c
>   create mode 100644 include/hw/core/cpu-topology.h
> 
