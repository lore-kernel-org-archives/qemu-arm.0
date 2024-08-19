Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1947492njf;
        Sun, 18 Aug 2024 21:23:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwY9PEcdOC39YzD6cZ/BYNhktd64Me6HJWnAOm+NWgbpNnJqj/lulLrmAqKNpw9t/LX6wTF7pbFxwzRsL1IPgIuzvQpMej
X-Received: by 2002:a05:6a21:3a81:b0:1be:d1bf:a371 with SMTP id adf61e73a8af0-1c9050477c9mr13230997637.33.1724041419527;
        Sun, 18 Aug 2024 21:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724041419; cv=none;
        d=google.com; s=arc-20160816;
        b=PXNbDH6aHaXzc9xAByYILOdBRcjPIAoComyqsC3Lbo+ivu3SF0cyyFTZOu8iD14/PP
         z68NbOWkTy+aKhvhkOtoIV9nd0zgS7bFNdBnZpqF5PZgpPokPJFvbp976wDeJUECJLcD
         2ElPRTwGAMIGAd6IKFDI2RUMZxA/L5TA5V3JyaL9BzHcZ88VigrUfv4rwiva0VRogRPT
         s3kNAZzRAWVRwOI4JwntsomYJFzTY2P3uoEBSkelt4NelJDgBG4RiNqjpd/YiwAkgV7v
         EPP6vqlgT85kFdFcdcqXcrGJzsGxansqC4CTYAUvrJHSZZLRxLDAA0Hj/5xw1f3Pdras
         45GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=0EVO4TPq7zEeDhrpfxb/u7bFPuWUTGTEzv2yfJHA6xk=;
        fh=3L+twm+5ndoQaw7P8+Nf8Rh8Pl6QthfmAv0vC6t3+7A=;
        b=aM/ciJUvsmcG5IuEVkpn37hENRt5G3TsKb/z5bYuiHRTWEErLhspZmilE3VT7l0SAT
         LXqiVBtcCG/AweDnuK+lkGp1cuTkOymv+WqNtEjqptQRroXPR8wn3iTer+uHRls5PMb3
         myzIs4R06yiXGHIkgnn2rgX6OVF9We76WzX+9t4XdYBKP/tfshWxxRB3z013Mx16BVqk
         4mYKJHx30VYJctqeaktV7sONlRcLtDX1PcHa1JI33KgWxY1/uQbA9maW2jaZTCAK5FC1
         VVSK9TJCTu8PyEtmEz276fRVpZSn9g7iyTC/RcUVk/IYLTby9JFvCYdhxUP8LfDs9qjY
         LmXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lD48Ak7T;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-202371e1919sor25793825ad.8.2024.08.18.21.23.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 18 Aug 2024 21:23:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lD48Ak7T;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724041419; x=1724646219; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0EVO4TPq7zEeDhrpfxb/u7bFPuWUTGTEzv2yfJHA6xk=;
        b=lD48Ak7TljgRJFp0PzrHi6Z2E9EHGyZdoTBBM6dsj/fMdrvaAuuTcY4+u7L3ChncWI
         j3E14Lp7hQX9rOIJgvEHi/VKRHuQe2DKNRB6nftmtsM2i6ZXSB7kuH1lx2jvGX50ivVi
         2t9v5PSqOfAAHHaq0uE9rTV9nuHQV4M0SbFiExinsvU9/MzzgbIrxfZDAt8HN4adks8K
         81VgLkqp1V9E3GC6yRc0ihq1vNedYgtTFpjorU1gWh5mxg3W4BZ8LRzKiseD7a6aXbts
         nL6AyyB5nfOIHx0cpUvzgM6dSetm9PNaGNN3i6KUW5wIOyPrBK1B+E/GaH1PRd7ofZEq
         aECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724041419; x=1724646219;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EVO4TPq7zEeDhrpfxb/u7bFPuWUTGTEzv2yfJHA6xk=;
        b=KklQ2FL6m41XKTXpsi6FvIS/Lzjo+W3hMcZbJz3wr9lJV5/RwwUWliDgO86C9DapK4
         VfSPhjKLTNGD+4Wf4BBL3jwrMk07vxQ6+BuoW3ZrIW1ZEUk9NnEA1ljuUm4PiJ5HDvy3
         JncEqCx0te34XEVe9PvW56iu73MqR5oANs+mIDwM7JlA0IP+fmFa3p5+b7p8JmZ6IdEY
         H8qZIZa8ccsFbSTFVoGkFJpoobgiTMCav1mwc+oMFF4nlr1HO1MScNzZk+AEXxsU9AOk
         qICndO1KLtaHcAnyiyBZuLEpJv05L/Q6jJcnLYLXHalMHM40CJKd6VIG3k7IV5uvgvCu
         CpoA==
X-Forwarded-Encrypted: i=1; AJvYcCV9BJszCpPJ7p4/mLZCw6bEd+nFqNid6kWwOCc/J8KLeTSGiRqp6R82W99l2sKvO0XODuW2dtD53wsBKjmmgQa2+a6FYHgj
X-Gm-Message-State: AOJu0Yw77LMCUiM/pWMir1k/O3PCh8IJ1CKyAyoMAt6RsDJ9svBdtsjm
	zQp4ZgIV64kHaGgUoOW+QMdOP5pYF18jlFf7c8yGstm1EMZRsDt9KhTsEm5PlTfF6lyT3IWOEfK
	vVQc=
X-Google-Smtp-Source: AGHT+IHeXBPBl2nz3ey//IV8NOtCWsyLIU0+2yFfF95IdWYcc3PzNX2iq1/EEBnXDA/NAXk5pPWdwQ==
X-Received: by 2002:a05:6a20:43a8:b0:1c4:a531:bafd with SMTP id adf61e73a8af0-1c904fab22bmr13890308637.18.1724041418718;
        Sun, 18 Aug 2024 21:23:38 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.103] ([191.205.40.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e3d9ab28sm6217384a91.55.2024.08.18.21.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 21:23:38 -0700 (PDT)
Subject: Re: [PATCH 7/8] hw/pci-host/designware: Move MSI registers from root
 func to host bridge
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-8-philmd@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <f9fa0215-006b-5dd1-b634-13e1a2b4448f@linaro.org>
Date: Mon, 19 Aug 2024 01:23:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20231012121857.31873-8-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 55i3KgktUAeP

Hi Phil

On 10/12/23 9:18 AM, Philippe Mathieu-Daudé wrote:
> The MSI registers belong the the host bridge. Move the
> DesignwarePCIEMSI field to the host bridge state.

I would say MSI registers are more tied to the PCI/PCIe network
side than to the host side. The MSI registers control if an
interrupt will be delivered to a host by looking at MSI data
payload to determine which end point sent the MSI packet and
which interrupt vector it corresponds to.

Why do you say the belong to the host bridge?

In 0/8 you mentioned you "noticed few discrepancies due to the
fact that host bridge pieces were managed by the root function",
is this patch addressing some of these discrepancies? What are
them exactly?

This patch also needs a rebase onto master.


Cheers,
Gustavo


> This is a migration compatibility break for the machines
> using the i.MX7 SoC (currently the mcimx7d-sabre machine).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/pci-host/designware.h |  2 +-
>   hw/pci-host/designware.c         | 79 ++++++++++++++++----------------
>   2 files changed, 40 insertions(+), 41 deletions(-)
> 
> diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
> index 702777ab17..fe8e8a9f24 100644
> --- a/include/hw/pci-host/designware.h
> +++ b/include/hw/pci-host/designware.h
> @@ -63,7 +63,6 @@ typedef struct DesignwarePCIEMSI {
>   struct DesignwarePCIERoot {
>       PCIBridge parent_obj;
>   
> -    DesignwarePCIEMSI msi;
>       DesignwarePCIEHost *host;
>   };
>   
> @@ -71,6 +70,7 @@ struct DesignwarePCIEHost {
>       PCIHostState parent_obj;
>   
>       DesignwarePCIERoot root;
> +    DesignwarePCIEMSI msi;
>   
>       uint32_t atu_viewport;
>   #define DESIGNWARE_PCIE_VIEWPORT_OUTBOUND    0
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 2ef17137e2..6cb8655a75 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -57,7 +57,7 @@
>   
>   #define DESIGNWARE_PCIE_IRQ_MSI                    3
>   
> -static uint64_t designware_pcie_root_msi_read(void *opaque, hwaddr addr,
> +static uint64_t designware_pcie_host_msi_read(void *opaque, hwaddr addr,
>                                                 unsigned size)
>   {
>       /*
> @@ -74,22 +74,21 @@ static uint64_t designware_pcie_root_msi_read(void *opaque, hwaddr addr,
>       return 0;
>   }
>   
> -static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
> +static void designware_pcie_host_msi_write(void *opaque, hwaddr addr,
>                                              uint64_t val, unsigned len)
>   {
> -    DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(opaque);
> -    DesignwarePCIEHost *host = root->host;
> +    DesignwarePCIEHost *host = opaque;
>   
> -    root->msi.intr[0].status |= BIT(val) & root->msi.intr[0].enable;
> +    host->msi.intr[0].status |= BIT(val) & host->msi.intr[0].enable;
>   
> -    if (root->msi.intr[0].status & ~root->msi.intr[0].mask) {
> +    if (host->msi.intr[0].status & ~host->msi.intr[0].mask) {
>           qemu_set_irq(host->pci.irqs[DESIGNWARE_PCIE_IRQ_MSI], 1);
>       }
>   }
>   
>   static const MemoryRegionOps designware_pci_host_msi_ops = {
> -    .read = designware_pcie_root_msi_read,
> -    .write = designware_pcie_root_msi_write,
> +    .read = designware_pcie_host_msi_read,
> +    .write = designware_pcie_host_msi_write,
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           .min_access_size = 4,
> @@ -97,12 +96,12 @@ static const MemoryRegionOps designware_pci_host_msi_ops = {
>       },
>   };
>   
> -static void designware_pcie_root_update_msi_mapping(DesignwarePCIERoot *root)
> +static void designware_pcie_host_update_msi_mapping(DesignwarePCIEHost *host)
>   
>   {
> -    MemoryRegion *mem   = &root->msi.iomem;
> -    const uint64_t base = root->msi.base;
> -    const bool enable   = root->msi.intr[0].enable;
> +    MemoryRegion *mem   = &host->msi.iomem;
> +    const uint64_t base = host->msi.base;
> +    const bool enable   = host->msi.intr[0].enable;
>   
>       memory_region_set_address(mem, base);
>       memory_region_set_enabled(mem, enable);
> @@ -147,23 +146,23 @@ designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int len)
>           break;
>   
>       case DESIGNWARE_PCIE_MSI_ADDR_LO:
> -        val = root->msi.base;
> +        val = host->msi.base;
>           break;
>   
>       case DESIGNWARE_PCIE_MSI_ADDR_HI:
> -        val = root->msi.base >> 32;
> +        val = host->msi.base >> 32;
>           break;
>   
>       case DESIGNWARE_PCIE_MSI_INTR0_ENABLE:
> -        val = root->msi.intr[0].enable;
> +        val = host->msi.intr[0].enable;
>           break;
>   
>       case DESIGNWARE_PCIE_MSI_INTR0_MASK:
> -        val = root->msi.intr[0].mask;
> +        val = host->msi.intr[0].mask;
>           break;
>   
>       case DESIGNWARE_PCIE_MSI_INTR0_STATUS:
> -        val = root->msi.intr[0].status;
> +        val = host->msi.intr[0].status;
>           break;
>   
>       case DESIGNWARE_PCIE_PHY_DEBUG_R1:
> @@ -305,29 +304,29 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
>           break;
>   
>       case DESIGNWARE_PCIE_MSI_ADDR_LO:
> -        root->msi.base &= 0xFFFFFFFF00000000ULL;
> -        root->msi.base |= val;
> -        designware_pcie_root_update_msi_mapping(root);
> +        host->msi.base &= 0xFFFFFFFF00000000ULL;
> +        host->msi.base |= val;
> +        designware_pcie_host_update_msi_mapping(host);
>           break;
>   
>       case DESIGNWARE_PCIE_MSI_ADDR_HI:
> -        root->msi.base &= 0x00000000FFFFFFFFULL;
> -        root->msi.base |= (uint64_t)val << 32;
> -        designware_pcie_root_update_msi_mapping(root);
> +        host->msi.base &= 0x00000000FFFFFFFFULL;
> +        host->msi.base |= (uint64_t)val << 32;
> +        designware_pcie_host_update_msi_mapping(host);
>           break;
>   
>       case DESIGNWARE_PCIE_MSI_INTR0_ENABLE:
> -        root->msi.intr[0].enable = val;
> -        designware_pcie_root_update_msi_mapping(root);
> +        host->msi.intr[0].enable = val;
> +        designware_pcie_host_update_msi_mapping(host);
>           break;
>   
>       case DESIGNWARE_PCIE_MSI_INTR0_MASK:
> -        root->msi.intr[0].mask = val;
> +        host->msi.intr[0].mask = val;
>           break;
>   
>       case DESIGNWARE_PCIE_MSI_INTR0_STATUS:
> -        root->msi.intr[0].status ^= val;
> -        if (!root->msi.intr[0].status) {
> +        host->msi.intr[0].status ^= val;
> +        if (!host->msi.intr[0].status) {
>               qemu_set_irq(host->pci.irqs[DESIGNWARE_PCIE_IRQ_MSI], 0);
>           }
>           break;
> @@ -495,7 +494,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>       viewport->cr[1] = DESIGNWARE_PCIE_ATU_ENABLE;
>       designware_pcie_update_viewport(root, viewport);
>   
> -    memory_region_init_io(&root->msi.iomem, OBJECT(root),
> +    memory_region_init_io(&host->msi.iomem, OBJECT(root),
>                             &designware_pci_host_msi_ops,
>                             root, "pcie-msi", 0x4);
>       /*
> @@ -504,8 +503,8 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>        * in designware_pcie_root_update_msi_mapping() as a part of
>        * initialization done by guest OS
>        */
> -    memory_region_add_subregion(address_space, dummy_offset, &root->msi.iomem);
> -    memory_region_set_enabled(&root->msi.iomem, false);
> +    memory_region_add_subregion(address_space, dummy_offset, &host->msi.iomem);
> +    memory_region_set_enabled(&host->msi.iomem, false);
>   }
>   
>   static void designware_pcie_set_irq(void *opaque, int irq_num, int level)
> @@ -564,15 +563,10 @@ static const VMStateDescription vmstate_designware_pcie_viewport = {
>   
>   static const VMStateDescription vmstate_designware_pcie_root = {
>       .name = "designware-pcie-root",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>       .fields = (VMStateField[]) {
>           VMSTATE_PCI_DEVICE(parent_obj, PCIBridge),
> -        VMSTATE_STRUCT(msi,
> -                       DesignwarePCIERoot,
> -                       1,
> -                       vmstate_designware_pcie_msi,
> -                       DesignwarePCIEMSI),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> @@ -704,8 +698,8 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
>   
>   static const VMStateDescription vmstate_designware_pcie_host = {
>       .name = "designware-pcie-host",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>       .fields = (VMStateField[]) {
>           VMSTATE_STRUCT(root,
>                          DesignwarePCIEHost,
> @@ -720,6 +714,11 @@ static const VMStateDescription vmstate_designware_pcie_host = {
>                                  1,
>                                  vmstate_designware_pcie_viewport,
>                                  DesignwarePCIEViewport),
> +        VMSTATE_STRUCT(msi,
> +                       DesignwarePCIEHost,
> +                       1,
> +                       vmstate_designware_pcie_msi,
> +                       DesignwarePCIEMSI),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> 
