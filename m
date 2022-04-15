Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1378633lfk;
        Fri, 15 Apr 2022 00:42:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzsDx1rLnLiB5ZptsLHtJ59WOaiSOqkokWq13Izs7YwavAGnbQjMnubKie3SUG9Qa6exw5
X-Received: by 2002:adf:a2d4:0:b0:207:bc3a:b2b5 with SMTP id t20-20020adfa2d4000000b00207bc3ab2b5mr4556019wra.223.1650008563156;
        Fri, 15 Apr 2022 00:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650008563; cv=none;
        d=google.com; s=arc-20160816;
        b=yAe2kiJSpkJH8YkQFBreGRmIyJkcflzwZNwb1pZbaRu4H5Q6Gww7fUu31Oj0qz3VYh
         FTb53bzfYQM7OZw/8pYwL0QUEzxiA/f1/pW+xYIp0nR+LYd87ysM5jahV4ti6o8W6GF3
         TO0KMdwpEnc4f+O2U9/Ynw+5lE/CuziLuUFmum6AgUGrDsEFBP13B7rl4iAI/TnI2YTc
         dm08nuT+vERpJ4xY6L1tLXysQT2SGEtP+0w7Ieim3LfFABN1cgIjVxoQ4AeolTPGD7SK
         WRPV/3IzmXJlxE3AndygomaJZXaQ5fZVdcC1U6HGn8iqArO2GfDeSe/a8tws+L2cCuQ1
         Dg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4Jf8CpUkmHiCcLo2+5odi8xqtOjKp0Qem77ayfImucw=;
        b=j8A9WKuaGAt2sJ9ux9yzycRDNck8SU+pjxmnoZZ9I/50K27qKRof8p8WB4yjHN8lZM
         OOWeJ8KTHDugeQaNKV42SDvcwTj79UoWDb6wulTSHqbN9IfAfO4fi8ipzSI75nTMMZA2
         dK6b6VklLJdzV7gE/1eVCd5ukVA4u6/rDTBR/PjYK/pvu3D1yrOY++vYTWXNAk70LiBE
         F2bD7bAtXF10lNbCO6EQ9Xy1MigVkeG6QiL1RFITD6NArLuDbkf60Ofrdpn3Gy+qT1Hi
         dFJUMmb+Sx2W7v9wviESVyAzBOes0InwDPfF5pwyIM1dAI8b8iwgVdyppEqGR0NmaFa4
         5Leg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=tA1+CUyZ;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id o17-20020a5d6711000000b002078f41df7esi596481wru.900.2022.04.15.00.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 00:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=tA1+CUyZ;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from [192.168.13.13] (unknown [195.68.53.70])
	by beetle.greensocs.com (Postfix) with ESMTPSA id B6A5C20780;
	Fri, 15 Apr 2022 07:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1650008562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Jf8CpUkmHiCcLo2+5odi8xqtOjKp0Qem77ayfImucw=;
	b=tA1+CUyZnAxtRVi+jC0SYCaq5asK5MQYTl2DRuZyn4iqhwFyGZEgg1PsCpPHW74ftP39/U
	HwW+V98hUnwOvD+qjaLk+JwaEQ+SBhRG26YneSF1oPgHZtuNKaywxYssbgnOJrEE63gGmZ
	NNG4X00FbIH3buR6Ru15jU8p4xOzqU0=
Message-ID: <7d1acb03-0a20-6641-16bf-198306c07c7b@greensocs.com>
Date: Fri, 15 Apr 2022 09:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 00/18] user-creatable cpu clusters
Content-Language: en-US-large
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: IJxUfenIkQYz

Ping !

It would be nice to have some rough feedback about this series.
I plan to submit it in 2 sub-series (riscv-array in a separate part) but 
would like to know first if this direction looks ok to you ?

Note that I'm a bit confused by the terminology. Should a "cluster" as 
in "machine topology's cluster" be a 1-1 match with a gdb inferior ?

Thanks,
Damien

On 3/30/22 14:56, Damien Hedde wrote:
> Hi,
> 
> This series add devices to be able to user-create (coldplug) cpu
> clusters. The existing cpu cluster dictates how cpus are exposed
> in gdb, but it does not handle the cpu objects creation. This series
> adds a new device to handle both issues and adds support for two
> architectures: arm and riscv.
> 
> Please look at patches 2 and 3 for more details about the new device.
> 
> Last part concerning the riscv is rfc as I do non-backward compatible
> updates. I'm not sure what migration (or other) constraints we have
> on these machines and I probably need to make some changes to cope
> with them.
> 
> This series almost deprecates the cpu-cluster type as all uses
> but one are replaced.
> 
> It is organized as follows:
> 
> + Patches 1 to 7 adds a new base device to replace cpu-cluster
> 
> + Patches 8 and 9 adds an arm specific version and replace existing
>    clusters in the xlnx-zynqmp machine.
> 
> + patches 10 to 17 updates the riscv_array. It was already used to
>    create cpus but was not a cpu cluster.
> 
> Thanks for any comments,
> --
> Damien
> 
> Damien Hedde (18):
>    define MAX_CLUSTERS in cpu.h instead of cluster.h
>    hw/cpu/cpus: introduce _cpus_ device
>    hw/cpu/cpus: prepare to handle cpu clusters
>    hw/cpu/cluster: make _cpu-cluster_ a subclass of _cpus_
>    gdbstub: deal with _cpus_ object instead of _cpu-cluster_
>    hw/cpu/cluster: remove cluster_id now that gdbstub is updated
>    hw/cpu/cpus: add a common start-powered-off property
>    hw/arm/arm_cpus: add arm_cpus device
>    hw/arm/xlnx-zynqmp: convert cpu clusters to arm_cpus
>    hw/riscv/riscv_hart: prepare transition to cpus
>    hw/riscv: prepare riscv_hart transition to cpus
>    hw/riscv/virt: prepare riscv_hart transition to cpus
>    hw/riscv/spike: prepare riscv_hart transition to cpus
>    hw/riscv/riscv_hart: use cpus as base class
>    hw/riscv/sifive_u&microchip_pfsoc: apply riscv_hart_array update
>    hw/riscv: update remaining machines due to riscv_hart_array update
>    hw/riscv/riscv_hart: remove temporary features
>    add myself as reviewer of the newly added _cpus_
> 
>   include/hw/arm/arm_cpus.h          |  45 +++++++
>   include/hw/arm/xlnx-zynqmp.h       |   8 +-
>   include/hw/core/cpu.h              |   6 +
>   include/hw/cpu/cluster.h           |  26 ++--
>   include/hw/cpu/cpus.h              |  93 ++++++++++++++
>   include/hw/riscv/microchip_pfsoc.h |   2 -
>   include/hw/riscv/riscv_hart.h      |  25 +++-
>   include/hw/riscv/sifive_u.h        |   2 -
>   gdbstub.c                          |  12 +-
>   hw/arm/arm_cpus.c                  |  63 ++++++++++
>   hw/arm/xlnx-zynqmp.c               | 121 +++++++-----------
>   hw/cpu/cluster.c                   |  53 ++++----
>   hw/cpu/cpus.c                      | 195 +++++++++++++++++++++++++++++
>   hw/riscv/boot.c                    |   2 +-
>   hw/riscv/microchip_pfsoc.c         |  28 +----
>   hw/riscv/opentitan.c               |   4 +-
>   hw/riscv/riscv_hart.c              |  44 ++-----
>   hw/riscv/shakti_c.c                |   4 +-
>   hw/riscv/sifive_e.c                |   4 +-
>   hw/riscv/sifive_u.c                |  31 ++---
>   hw/riscv/spike.c                   |  18 +--
>   hw/riscv/virt.c                    |  79 +++++++-----
>   MAINTAINERS                        |   3 +
>   hw/arm/meson.build                 |   1 +
>   hw/cpu/meson.build                 |   2 +-
>   25 files changed, 612 insertions(+), 259 deletions(-)
>   create mode 100644 include/hw/arm/arm_cpus.h
>   create mode 100644 include/hw/cpu/cpus.h
>   create mode 100644 hw/arm/arm_cpus.c
>   create mode 100644 hw/cpu/cpus.c
> 
