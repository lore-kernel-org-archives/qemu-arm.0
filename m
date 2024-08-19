Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1947536njf;
        Sun, 18 Aug 2024 21:23:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjc/TOmlITCkimj3JaEI2r6nPZ3OigyIZYbgWkazQenC/jWyqq+4QXUDIzYqnczokVDJalSVy32G2i8g==@linaro.org
X-Received: by 2002:a17:902:dac3:b0:202:4480:1d58 with SMTP id d9443c01a7336-20244802251mr27843625ad.12.1724041433721;
        Sun, 18 Aug 2024 21:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724041433; cv=none;
        d=google.com; s=arc-20160816;
        b=DoM3BAod/XNa7Kn1OFnr3TIIIj1vX0gXLa6Ha2E2t+nlKuCcKrJ8zOXYL17v9Ln5aH
         WnharoKqs96E3XUv44v96+ormaRlU58KMsE5r31DvkJwfCg5zadcdjEpWBTQtL/xhV5V
         0ZYGOou4VAA/m2V/Se+uNkGvBkXyNKCeFpfwoS8OyXp3hRjwbw3j2zrjyuLaFTa2G9Fq
         DKwnlndCxLiZkrAjPcrbCXgde9ToXxbhQYG0Lqhlz/LdV/YTEX3LJw9+wenstCbxiYma
         vmRX3urKjJLNN/TYtUOYZmwK4Y9vM2jDj00O2AyiyRUfFxbgPS9pk/1ChKJ7ERvuUROo
         iV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=cOy4FBOY+w4yjrjdybUBQRfN32zP+ViihPCMJnkV6PY=;
        fh=uOIbojGHrvLI6gmINDa7CXdFJ6xqt3t7FUXPyb0jepc=;
        b=zF11lN/hH/GAcdXGSKhrMA6GZoXTp8kOjmFWcNZ8iyJyhN+IOqa1HuWozUf/y4kEYG
         ONP6Q7c3uhbwIuq5gKv0nc8bRFzFLIuaJDEMnvn7q9/Iq4pdLRlvLOI1ahMYGh08r+9f
         59L3Bc/uZPWrD75KumxBnwmMAvRK/oi0Mg+4C5UI74I9JIagMZf6H7TmXvweXwjItSyi
         v8IG4rWGflxGlfFqMlYcKqQJl4SHSv5EnPXMrwZAMBHy+wPjUqWPQ4yagfcQxQ6hcsv2
         /qb8vIeR4hFNdHvZtq5rZQYKTxY/ROiD1Blq/wO+IcnDbq2/BvWTjpGEXvA+9pPDZs+J
         Vc9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rUHBxmfC;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-201f0308ef4sor61947525ad.1.2024.08.18.21.23.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 18 Aug 2024 21:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rUHBxmfC;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724041433; x=1724646233; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOy4FBOY+w4yjrjdybUBQRfN32zP+ViihPCMJnkV6PY=;
        b=rUHBxmfCw5WfKLS2rVv2XqEQfW8s/xN1b+C1eOA4TrXnjhhHrzPDHAbwZ6rfPE1+Oi
         V1cDn1nr9J7OQS72E0iYjv7UEW6wd64X5tELOC2KgxonCX3N5C64X+68i19BXQzL0kHd
         Qvkk9lFeOr/JIw7m6Ns6BvAzgaVwoOu/hSFQozDjqaEBapoTI3nIIY/III9qzUykOuP1
         5mWkUdz8qc8bPFyG7XpxfE2cTnzIDCyhK9QIpiB5fSfN3xEm9xZ9YR7eVmWCe3hjaVG+
         6LEs+aNeCfJSIplRGVtdNFrgjpGVWFDjM1VI1qe82F2ipaayb1K5xKJmYtFN7YBv74oE
         8Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724041433; x=1724646233;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOy4FBOY+w4yjrjdybUBQRfN32zP+ViihPCMJnkV6PY=;
        b=Y5unHH3Q/FSJX9ZoYsELNC23YLWmgwa7y1Khpo5dDW8qGOzuRgft+tg/8RjW1oO7+i
         QxMDDDJFBPtJUM0QYQ2Qaxb/q2QfHus81Aj7fWIh/Km/Zw6yZR/oyxeHi2s5geAfN+gx
         yh8J2eH31ut5RbTVi2Sh3z/uOj0ydxE/K3i4NPJOtRPBRvbI+Xvxl0SnIyAezu1G20XE
         OuNBsCYhc1f9r2H/MqszytvsJ9QyD2IOIdTPxMagPVfoDmwZpH5h0s2qPWiaInwz5qxR
         rTxiOSwuC7Ylw2sygiqWEQI2wXgeWOhoR1e/GDWIviQmG0+2MK5KkP7ZpClbyYyd5YnH
         fBEg==
X-Forwarded-Encrypted: i=1; AJvYcCVmGg8hqbbHGcRltNEXPwLEI0el1OP9m4sjW8VrI9iY10W97oPu+Sktym9tR7PtAE1Mmx9V/3JQu8RJaA==@linaro.org
X-Gm-Message-State: AOJu0YwebqdZe0futWFGPK5f3dfMKKQO8SjJZ35slKnZm/qkT2CAkYtd
	SR+d13d4FaVB3kYrMNuJmy8Klrz2gfKz7LGU+KXprXx6xY37b5fQ0W/WD2knOL7BwLd+old/TEN
	PDI8=
X-Google-Smtp-Source: AGHT+IGdybo0m9uhUSM4jzlw9tJnEGCX3c4CZ3yJwXqIyQW+ASxZqta1M7bC6VE9mSY/TIfyXtljPA==
X-Received: by 2002:a17:903:2309:b0:1fb:2ebc:d16b with SMTP id d9443c01a7336-201ee49e74emr208796915ad.7.1724041432643;
        Sun, 18 Aug 2024 21:23:52 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.103] ([191.205.40.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03b0e0bsm56169755ad.300.2024.08.18.21.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 21:23:52 -0700 (PDT)
Subject: Re: [PATCH 8/8] hw/pci-host/designware: Create ViewPorts during host
 bridge realization
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-9-philmd@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <9ce96a75-ad19-2d3e-50a3-640aae63dc4e@linaro.org>
Date: Mon, 19 Aug 2024 01:23:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20231012121857.31873-9-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: i5zvKOnO2yNR

Hi Phil,

On 10/12/23 9:18 AM, Philippe Mathieu-Daudé wrote:
> ViewPorts are managed by the host bridge part, so create them
> when the host bridge is realized. The host bridge become the

nit: becomes


> owner of the memory regions.
> 
> The PCI root function realize() method now only contains PCI
> specific code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

> ---
>   hw/pci-host/designware.c | 207 +++++++++++++++++++--------------------
>   1 file changed, 102 insertions(+), 105 deletions(-)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 6cb8655a75..e5dc9b4b8d 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -384,22 +384,10 @@ static char *designware_pcie_viewport_name(const char *direction,
>   static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>   {
>       DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(dev);
> -    DesignwarePCIEHost *host = DESIGNWARE_PCIE_HOST(
> -                                    qdev_get_parent_bus(DEVICE(dev))->parent);
> -    MemoryRegion *host_mem = get_system_memory();
> -    MemoryRegion *address_space = &host->pci.memory;
>       PCIBridge *br = PCI_BRIDGE(dev);
> -    DesignwarePCIEViewport *viewport;
> -    /*
> -     * Dummy values used for initial configuration of MemoryRegions
> -     * that belong to a given viewport
> -     */
> -    const hwaddr dummy_offset = 0;
> -    const uint64_t dummy_size = 4;
> -    size_t i;
>   
>       br->bus_name  = "dw-pcie";
> -    root->host = host;
> +    root->host = DESIGNWARE_PCIE_HOST(qdev_get_parent_bus(DEVICE(dev))->parent);
>   
>       pci_set_word(dev->config + PCI_COMMAND,
>                    PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
> @@ -414,97 +402,6 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>   
>       msi_nonbroken = true;
>       msi_init(dev, 0x50, 32, true, true, &error_fatal);
> -
> -    for (i = 0; i < DESIGNWARE_PCIE_NUM_VIEWPORTS; i++) {
> -        MemoryRegion *source, *destination, *mem;
> -        const char *direction;
> -        char *name;
> -
> -        viewport = &host->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][i];
> -        viewport->inbound = true;
> -        viewport->base    = 0x0000000000000000ULL;
> -        viewport->target  = 0x0000000000000000ULL;
> -        viewport->limit   = UINT32_MAX;
> -        viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
> -
> -        source      = &host->pci.address_space_root;
> -        destination = host_mem;
> -        direction   = "Inbound";
> -
> -        /*
> -         * Configure MemoryRegion implementing PCI -> CPU memory
> -         * access
> -         */
> -        mem  = &viewport->mem;
> -        name = designware_pcie_viewport_name(direction, i, "MEM");
> -        memory_region_init_alias(mem, OBJECT(root), name, destination,
> -                                 dummy_offset, dummy_size);
> -        memory_region_add_subregion_overlap(source, dummy_offset, mem, -1);
> -        memory_region_set_enabled(mem, false);
> -        g_free(name);
> -
> -        viewport = &host->viewports[DESIGNWARE_PCIE_VIEWPORT_OUTBOUND][i];
> -        viewport->host    = host;
> -        viewport->inbound = false;
> -        viewport->base    = 0x0000000000000000ULL;
> -        viewport->target  = 0x0000000000000000ULL;
> -        viewport->limit   = UINT32_MAX;
> -        viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
> -
> -        destination = &host->pci.memory;
> -        direction   = "Outbound";
> -        source      = host_mem;
> -
> -        /*
> -         * Configure MemoryRegion implementing CPU -> PCI memory
> -         * access
> -         */
> -        mem  = &viewport->mem;
> -        name = designware_pcie_viewport_name(direction, i, "MEM");
> -        memory_region_init_alias(mem, OBJECT(root), name, destination,
> -                                 dummy_offset, dummy_size);
> -        memory_region_add_subregion(source, dummy_offset, mem);
> -        memory_region_set_enabled(mem, false);
> -        g_free(name);
> -
> -        /*
> -         * Configure MemoryRegion implementing access to configuration
> -         * space
> -         */
> -        mem  = &viewport->cfg;
> -        name = designware_pcie_viewport_name(direction, i, "CFG");
> -        memory_region_init_io(&viewport->cfg, OBJECT(root),
> -                              &designware_pci_host_conf_ops,
> -                              viewport, name, dummy_size);
> -        memory_region_add_subregion(source, dummy_offset, mem);
> -        memory_region_set_enabled(mem, false);
> -        g_free(name);
> -    }
> -
> -    /*
> -     * If no inbound iATU windows are configured, HW defaults to
> -     * letting inbound TLPs to pass in. We emulate that by explicitly
> -     * configuring first inbound window to cover all of target's
> -     * address space.
> -     *
> -     * NOTE: This will not work correctly for the case when first
> -     * configured inbound window is window 0
> -     */
> -    viewport = &host->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][0];
> -    viewport->cr[1] = DESIGNWARE_PCIE_ATU_ENABLE;
> -    designware_pcie_update_viewport(root, viewport);
> -
> -    memory_region_init_io(&host->msi.iomem, OBJECT(root),
> -                          &designware_pci_host_msi_ops,
> -                          root, "pcie-msi", 0x4);
> -    /*
> -     * We initially place MSI interrupt I/O region at address 0 and
> -     * disable it. It'll be later moved to correct offset and enabled
> -     * in designware_pcie_root_update_msi_mapping() as a part of
> -     * initialization done by guest OS
> -     */
> -    memory_region_add_subregion(address_space, dummy_offset, &host->msi.iomem);
> -    memory_region_set_enabled(&host->msi.iomem, false);
>   }
>   
>   static void designware_pcie_set_irq(void *opaque, int irq_num, int level)
> @@ -590,7 +487,7 @@ static void designware_pcie_root_class_init(ObjectClass *klass, void *data)
>       dc->reset = pci_bridge_reset;
>       /*
>        * PCI-facing part of the host bridge, not usable without the
> -     * host-facing part, which can't be device_add'ed, yet.
> +     * host-facing part.
>        */
>       dc->user_creatable = false;
>       dc->vmsd = &vmstate_designware_pcie_root;
> @@ -650,8 +547,17 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
>       PCIHostState *pci = PCI_HOST_BRIDGE(dev);
>       DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(dev);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    MemoryRegion *host_mem = get_system_memory();
> +    DesignwarePCIEViewport *viewport;
>       size_t i;
>   
> +    /*
> +     * Dummy values used for initial configuration of MemoryRegions
> +     * that belong to a given viewport
> +     */
> +    const hwaddr dummy_offset = 0;
> +    const uint64_t dummy_size = 4;
> +
>       for (i = 0; i < ARRAY_SIZE(s->pci.irqs); i++) {
>           sysbus_init_irq(sbd, &s->pci.irqs[i]);
>       }
> @@ -694,6 +600,97 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
>       qdev_prop_set_int32(DEVICE(&s->root), "addr", PCI_DEVFN(0, 0));
>       qdev_prop_set_bit(DEVICE(&s->root), "multifunction", false);
>       qdev_realize(DEVICE(&s->root), BUS(pci->bus), &error_fatal);
> +
> +    memory_region_init_io(&s->msi.iomem, OBJECT(s),
> +                          &designware_pci_host_msi_ops,
> +                          s, "pcie-msi", 0x4);
> +    /*
> +     * We initially place MSI interrupt I/O region at address 0 and
> +     * disable it. It'll be later moved to correct offset and enabled
> +     * in designware_pcie_host_update_msi_mapping() as a part of
> +     * initialization done by guest OS
> +     */
> +    memory_region_add_subregion(&s->pci.memory, dummy_offset, &s->msi.iomem);
> +    memory_region_set_enabled(&s->msi.iomem, false);
> +
> +    for (i = 0; i < DESIGNWARE_PCIE_NUM_VIEWPORTS; i++) {
> +        MemoryRegion *source, *destination, *mem;
> +        const char *direction;
> +        char *name;
> +
> +        viewport = &s->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][i];
> +        viewport->inbound = true;
> +        viewport->base    = 0x0000000000000000ULL;
> +        viewport->target  = 0x0000000000000000ULL;
> +        viewport->limit   = UINT32_MAX;
> +        viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
> +
> +        source      = &s->pci.address_space_root;
> +        destination = host_mem;
> +        direction   = "Inbound";
> +
> +        /*
> +         * Configure MemoryRegion implementing PCI -> CPU memory
> +         * access
> +         */
> +        mem  = &viewport->mem;
> +        name = designware_pcie_viewport_name(direction, i, "MEM");
> +        memory_region_init_alias(mem, OBJECT(s), name, destination,
> +                                 dummy_offset, dummy_size);
> +        memory_region_add_subregion_overlap(source, dummy_offset, mem, -1);
> +        memory_region_set_enabled(mem, false);
> +        g_free(name);
> +
> +        viewport = &s->viewports[DESIGNWARE_PCIE_VIEWPORT_OUTBOUND][i];
> +        viewport->host    = s;
> +        viewport->inbound = false;
> +        viewport->base    = 0x0000000000000000ULL;
> +        viewport->target  = 0x0000000000000000ULL;
> +        viewport->limit   = UINT32_MAX;
> +        viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
> +
> +        destination = &s->pci.memory;
> +        direction   = "Outbound";
> +        source      = host_mem;
> +
> +        /*
> +         * Configure MemoryRegion implementing CPU -> PCI memory
> +         * access
> +         */
> +        mem  = &viewport->mem;
> +        name = designware_pcie_viewport_name(direction, i, "MEM");
> +        memory_region_init_alias(mem, OBJECT(s), name, destination,
> +                                 dummy_offset, dummy_size);
> +        memory_region_add_subregion(source, dummy_offset, mem);
> +        memory_region_set_enabled(mem, false);
> +        g_free(name);
> +
> +        /*
> +         * Configure MemoryRegion implementing access to configuration
> +         * space
> +         */
> +        mem  = &viewport->cfg;
> +        name = designware_pcie_viewport_name(direction, i, "CFG");
> +        memory_region_init_io(&viewport->cfg, OBJECT(s),
> +                              &designware_pci_host_conf_ops,
> +                              viewport, name, dummy_size);
> +        memory_region_add_subregion(source, dummy_offset, mem);
> +        memory_region_set_enabled(mem, false);
> +        g_free(name);
> +    }
> +
> +    /*
> +     * If no inbound iATU windows are configured, HW defaults to
> +     * letting inbound TLPs to pass in. We emulate that by explicitly
> +     * configuring first inbound window to cover all of target's
> +     * address space.
> +     *
> +     * NOTE: This will not work correctly for the case when first
> +     * configured inbound window is window 0
> +     */
> +    viewport = &s->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][0];
> +    viewport->cr[1] = DESIGNWARE_PCIE_ATU_ENABLE;
> +    designware_pcie_update_viewport(&s->root, viewport);
>   }
>   
>   static const VMStateDescription vmstate_designware_pcie_host = {
> 
