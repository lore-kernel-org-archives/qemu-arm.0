Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1688093njb;
        Thu, 15 May 2025 01:05:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfevuL/BnRrpooYwl4LAAWDHnASNzLpHJ2LL5waDLk2fratdc3ZTxo9sjDKA74ltzEYFDUqXQFYNPcVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFILr5lEvo2t1G6w1LLqFnx5l3X8ItTcfESsnH1qb5/ij9IasUymwsWJvReLfn3CevqqtT0
X-Received: by 2002:a05:6214:f26:b0:6e8:ebc6:fd5f with SMTP id 6a1803df08f44-6f896e5b159mr96582276d6.20.1747296300118;
        Thu, 15 May 2025 01:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747296300; cv=none;
        d=google.com; s=arc-20240605;
        b=HlX8fr3ztXD3J8/Qa4ciGwgV9UosLZYaa2YfZTEvwa3c6l1HDWVGDpONifB1ivVRS2
         3THsq+iCsiBFeLN9RWPnPDPg/DxRbFtmK7oO6RreHnqQLoSe7/0cUnyVim+nrnJ0CWLN
         8KbXx3AWcc9HBXSWH0zorFpNKVyd00esZpxMQWJ8xlAgTI8ozsb+2KHNS3zVsoYrH0BF
         iIJi6yKeUK9vY367ESVLyuS2jY3VlExgOVBG312M2yIrSEkpSIJfUa+U065x84q2h48M
         61Oo7uLjvKtzxTrq9f4Hbf7brehUlIlOOByeu15mQODx7fh848oA0RZ/bbJJD7zAWSVG
         v7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aHsU+oxxTJkcMdy9BmDbKmXpTJjkjH/h+n1y0FxV4wI=;
        fh=Q8omI+ATFA/q+WOClFqBZjMkLCUnNMldHOUWFyGFFAk=;
        b=BCYLOgO1vnpWStKr8zk1KePaoR6OAe8oD9kfoJtiCALuMhoA54f7B08PVkJlZMuGnc
         1pVH+WtzYs33z/yV7loG5iZLAnZQmMUHJ15+RX6+zSd1vfTEmZzi5O4YWwXz7TCwf/pe
         SJmGz8nHfM3tqHs+xYGEAwzo8myYqvRZpRHHJ8sjvCOcmCeeQBN0REw6cfuU3ALSN9RA
         LIV1z7ZKLgzhVvx2VgJGou9QP2mKctmFOmv/b+POrZZbuCQPikZjnX8iUw4PazqTDREw
         0kCwiSbYl/Ky6QEpmCEkktpCXEvxmYMLfPa8VxliRZd07j7Q2zgfL2vAz1ZWztjZZ8tu
         qDVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="lAQ/TDks";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a4bdeesi166043386d6.312.2025.05.15.01.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 May 2025 01:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="lAQ/TDks";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFTa9-0004qC-CH; Thu, 15 May 2025 04:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1uFTa5-0004lh-VE; Thu, 15 May 2025 04:04:42 -0400
Received: from mgamail.intel.com ([198.175.65.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1uFTa3-0000B9-Bw; Thu, 15 May 2025 04:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747296279; x=1778832279;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=x2mLUxA+et8iwA9rDXZwVtIWILZ108fGO+5QLFn1iKw=;
 b=lAQ/TDksNEMGj0AfVXn10TGVhINKBhOSdHC06yje6lWBtWC5/zX5QPha
 3APyMGJUsSM0k9Bh1fby5rQD0jWpLIjRxJfagOaQgG0VFxsIBftJYvwLk
 mShhuquzCzuAHB2/bkUp0Ou4Ql9H0gffun49vsrLPUIl5Mrr0vrYJ0tem
 Gwned3pNxvsjrw7Ehr3itBpRzez+3BymRDP2epPy7ibLxnrE64YAhNJVw
 7yQ+IdXGbgScoHi3/xenek8eS6DBug+TNXIDEo0hR+udXP4f5ciErb00P
 Rpsyx/2zqTJa0Ru1+hRAVBHh4cy5EWnNWhCAyB1Xkqpk9Exao4YLsBDvr g==;
X-CSE-ConnectionGUID: stH7jMFJQYOS1Ih7Kob94A==
X-CSE-MsgGUID: uv7k5YXRSEW5MJJoZsSbFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60230381"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="60230381"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:04:35 -0700
X-CSE-ConnectionGUID: i46b0jPrQnaeMMhU2eB1pw==
X-CSE-MsgGUID: ax5soz81Qsezcgk15CnXCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138177647"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1])
 ([10.124.247.1])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 01:04:27 -0700
Message-ID: <1c347ea7-1e33-420e-a666-cd02573d9089@intel.com>
Date: Thu, 15 May 2025 16:04:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/27] hw/nvram/fw_cfg: Rename fw_cfg_init_mem() with
 '_nodma' suffix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jason Wang <jasowang@redhat.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-4-philmd@linaro.org>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250508133550.81391-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=198.175.65.13; envelope-from=xiaoyao.li@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: j0Lbha9xPxng

On 5/8/2025 9:35 PM, Philippe Mathieu-Daudé wrote:
> Rename fw_cfg_init_mem() as fw_cfg_init_mem_nodma()
> to distinct with the DMA version (currently named
> fw_cfg_init_mem_wide).
> 
> Suggested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/nvram/fw_cfg.h | 3 ++-
>   hw/hppa/machine.c         | 2 +-
>   hw/nvram/fw_cfg.c         | 7 +++----
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index d41b9328fd1..d5161a79436 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -307,7 +307,8 @@ bool fw_cfg_add_file_from_generator(FWCfgState *s,
>   
>   FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
>                                   AddressSpace *dma_as);
> -FWCfgState *fw_cfg_init_mem(hwaddr ctl_addr, hwaddr data_addr);
> +FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
> +                                  unsigned data_width);
>   FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
>                                    hwaddr data_addr, uint32_t data_width,
>                                    hwaddr dma_addr, AddressSpace *dma_as);
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index dacedc5409c..0d768cb90b0 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -201,7 +201,7 @@ static FWCfgState *create_fw_cfg(MachineState *ms, PCIBus *pci_bus,
>       int btlb_entries = HPPA_BTLB_ENTRIES(&cpu[0]->env);
>       int len;
>   
> -    fw_cfg = fw_cfg_init_mem(addr, addr + 4);
> +    fw_cfg = fw_cfg_init_mem_nodma(addr, addr + 4, 1);

It does additional job to replace 
fw_cfg_data_mem_ops.valid.max_access_size with a hardcode 1.

It needs clarification at least in commit message that doing it is safe 
that fw_cfg_data_mem_ops.valid.max_access_size is not changed by other code.

It's even better to put this in a seperate patch.

For the pure rename part:

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

>       fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, ms->smp.cpus);
>       fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, HPPA_MAX_CPUS);
>       fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, ms->ram_size);
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 54cfa07d3f5..10f8f8db86f 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -1087,11 +1087,10 @@ FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
>       return s;
>   }
>   
> -FWCfgState *fw_cfg_init_mem(hwaddr ctl_addr, hwaddr data_addr)
> +FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
> +                                  unsigned data_width)
>   {
> -    return fw_cfg_init_mem_wide(ctl_addr, data_addr,
> -                                fw_cfg_data_mem_ops.valid.max_access_size,
> -                                0, NULL);
> +    return fw_cfg_init_mem_wide(ctl_addr, data_addr, data_width, 0, NULL);
>   }
>   
>   

