Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1947302njf;
        Sun, 18 Aug 2024 21:22:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBG5pyqhNmiFJTYBMA5hQ3TouX3kHgaAjGBuKtgYwh7FIsUbQNHfDXPS5VxVY2rFftUueQPc1hxXIyVlmd2BPbCiMUqI5P
X-Received: by 2002:a05:6830:6208:b0:709:4552:1f70 with SMTP id 46e09a7af769-70cac89c417mr13304952a34.24.1724041341161;
        Sun, 18 Aug 2024 21:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724041341; cv=none;
        d=google.com; s=arc-20160816;
        b=HmSOAvqf3lT8SLZIsnwLZNiKUwDDm65FcKx0d7G6bitj/ICy5sqYIbrpujIpGZ+tPg
         Wd2Tbyw8+Xq3G/Bue5wZP9R38M5eG6lDaWar1MO0s+VGAdNN7CIRPxGUUQr1WA+kEctP
         ql+If7sf5Ks3Xrs4noPGjixvvFszEu8cnk8OZd0vxVu6m1mnKcX4oGRtSPps4NvX0jA9
         WWBar+UQY2aIDAspI6/hb3V0VGGRlOoBsul90UlqbXRcfSSUp12lx12OX8Ii2J45YRk4
         L8JGS+2Rchn7XNu9iNJsO06wAe9BcdMSMFo94RadWm1iK/SmwTWoUZfnzt1Skp2FkJf3
         6cgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=MhVjxKzlb1gPaM8MhyonnypDmhA1TCk3CvzcoD1WOGQ=;
        fh=EQ5SzqURimm7pvG+larA3sWjgxsf/TjyCsAshHrd3ho=;
        b=jeaPCmn3FT7xS3LxxtrgoiFh6NrH9dlsyTsgDSVN5XnsYIOqkoIJEsgfzxndWXY5/x
         jUf+TmtOdNPCruWNBgJX6vnd59vmFmhaIqnpr7MfQfsWIFGtZlx7+ldBGl1W92bIKu+o
         A8vQ3zkxx1CPZtC+XuFCH3Nvm0+TJVH0HXFKtvBNS1GiMjNJUN6abjcnEQNq/ni7QABo
         5unqyqlk/KSqGJqyPPIL/qb2isiNOaOOVwXMsBOQunYbtDMFX32obmrVPpdGCO0Pue4I
         TxjU5XphODxXEDuRdP6m6Yv7ZdvFG9Twud17jNtlgprCx5kYbFXfrue/L1BtlB5LG2dm
         EILw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ej0MfzT/";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7c6b6497071sor4180933a12.10.2024.08.18.21.22.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 18 Aug 2024 21:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ej0MfzT/";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724041340; x=1724646140; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MhVjxKzlb1gPaM8MhyonnypDmhA1TCk3CvzcoD1WOGQ=;
        b=ej0MfzT/s0PomDBxWy8T+btlGWQicZEHHQAPKNb6ElH4QQ1fndYsmlh+WwJNY6/wou
         1k+sznvNV1DMeld+sPLMg/ZFBWDDgt8it4C4KLXU3GBB830rUDB/zld6G7BCygxaoh4D
         h+LUOtCUdoD4qA+n1ovqMHVFQ8EcwAzocQSKMz2Jjb3NVH85HjmJfQ8rhZsIqgynmjUd
         XHIS8xJu8hveNFOROCpLfB4J2avk2FmLo7U0+pCynrDxpyygiKvScL28hIJoLR9o7TU9
         hZhdqrjy8CnJ0K4i8DShsH1xj2DEDiVDsGlScNKvIozvFkQ/fCK54YhUOCS1LwzKkHcr
         prTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724041340; x=1724646140;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhVjxKzlb1gPaM8MhyonnypDmhA1TCk3CvzcoD1WOGQ=;
        b=NuVfZ582svo2g7+S8ATcoTaVOPSbwn6bhxpAovQHa6ZGInvpRyy/ykxdJQvG/2camb
         6LaW3UOVo3LnZf8UY+0ElX8eXV4RTIET2yh67Eu7w2wTrMGPF4bGoCrSpSWogvCkUUQk
         RCECT460s2KWHaMr35AfOMEAmdt4+Pn10nF1ee2A9aYpIZLRafKGwnPfY1JJ5DEz8fKB
         WGokdG2k8dTA2sPcvXqQSbNy1NOGCylh4bVdZhGnSdE0c1m+l5ORtDAX6KuUFuOeTgeR
         Vu7lI8MuozKA/YK5wuuTOiADDEeDv8/7L27w8V4DBto2NmHv4S9A+X/GRPn1uHj0C6VI
         W0Vg==
X-Forwarded-Encrypted: i=1; AJvYcCW/4k7C26HR4lqh1PJ2rTig5r0IJ3OKx/Tsd+NbIHFTY7l57oQhx9LizG387XNzLGEijRafTSLjwMRWMBjBcD7ztX7u2KTO
X-Gm-Message-State: AOJu0YyGIdv146H/BhW8pfbyZ39jzZyB9DdrF79GcePwHjfYDpng6uRF
	9YMGrRVJIBDs9BsCDrmhnFF+AVRn6X2SfQa0bv0FrsVKHku8bNB82oW1i9fnvoZ58V+YZZUnWrK
	VJ5Y=
X-Google-Smtp-Source: AGHT+IE1C4U9w1NdIb2cQY3hu2h9LEHPkdW8Us72pIqEzN4ERGq6HyINNt8TJ8faLr7ZJ5F0IY7hiA==
X-Received: by 2002:a17:902:d4cb:b0:202:3617:d546 with SMTP id d9443c01a7336-2023617d843mr24060185ad.62.1724041339909;
        Sun, 18 Aug 2024 21:22:19 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.103] ([191.205.40.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20205a53767sm43743635ad.270.2024.08.18.21.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 21:22:19 -0700 (PDT)
Subject: Re: [PATCH 4/8] hw/pci-host/designware: Hoist host controller in root
 function #0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-5-philmd@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <f9299dfa-6e1a-b0cc-5b13-a8838351ea21@linaro.org>
Date: Mon, 19 Aug 2024 01:22:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20231012121857.31873-5-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: TJEe1KhiwkcM

Hi Phil,

I think the title of this patch is bit misleading. You're not
moving host into root, but rather adding a reference of host
inside the root.

Maybe change it to something like:

  "Add a back-pointer to the host in the root"?


On 10/12/23 9:18 AM, Philippe Mathieu-Daudé wrote:
> There is always an unique root function for the host bridge
> controller. We create this function when the controller is
> realized, in designware_pcie_host_realize().
> 
> No need to call qdev_get_parent_bus() each time the root function
> want to resolve its host part. Hoist a pointer in its state. Set
> the pointer once when the function is realized.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/pci-host/designware.h |  1 +
>   hw/pci-host/designware.c         | 15 +++++----------
>   2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
> index c484e377a8..9e2caa04e9 100644
> --- a/include/hw/pci-host/designware.h
> +++ b/include/hw/pci-host/designware.h
> @@ -71,6 +71,7 @@ struct DesignwarePCIERoot {
>   
>       DesignwarePCIEViewport viewports[2][DESIGNWARE_PCIE_NUM_VIEWPORTS];
>       DesignwarePCIEMSI msi;
> +    DesignwarePCIEHost *host;

Because root is still defined in host and you're actually adding a
reference of host inside root this is a back-pointer to host, so do
you mind adding a comment above this like saying something like:

/* Convenient back-pointer for easy access to the host interface. */

Otherwise:

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo


>   };
>   
>   struct DesignwarePCIEHost {
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index bacb2bdb2d..fb46493a05 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -57,13 +57,6 @@
>   
>   #define DESIGNWARE_PCIE_IRQ_MSI                    3
>   
> -static DesignwarePCIEHost *
> -designware_pcie_root_to_host(DesignwarePCIERoot *root)
> -{
> -    BusState *bus = qdev_get_parent_bus(DEVICE(root));
> -    return DESIGNWARE_PCIE_HOST(bus->parent);
> -}
> -
>   static uint64_t designware_pcie_root_msi_read(void *opaque, hwaddr addr,
>                                                 unsigned size)
>   {
> @@ -85,7 +78,7 @@ static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
>                                              uint64_t val, unsigned len)
>   {
>       DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(opaque);
> -    DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
> +    DesignwarePCIEHost *host = root->host;
>   
>       root->msi.intr[0].status |= BIT(val) & root->msi.intr[0].enable;
>   
> @@ -300,7 +293,7 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
>                                                 uint32_t val, int len)
>   {
>       DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(d);
> -    DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
> +    DesignwarePCIEHost *host = root->host;
>       DesignwarePCIEViewport *viewport =
>           designware_pcie_root_get_current_viewport(root);
>   
> @@ -392,7 +385,8 @@ static char *designware_pcie_viewport_name(const char *direction,
>   static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>   {
>       DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(dev);
> -    DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
> +    DesignwarePCIEHost *host = DESIGNWARE_PCIE_HOST(
> +                                    qdev_get_parent_bus(DEVICE(dev))->parent);
>       MemoryRegion *host_mem = get_system_memory();
>       MemoryRegion *address_space = &host->pci.memory;
>       PCIBridge *br = PCI_BRIDGE(dev);
> @@ -406,6 +400,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>       size_t i;
>   
>       br->bus_name  = "dw-pcie";
> +    root->host = host;
>   
>       pci_set_word(dev->config + PCI_COMMAND,
>                    PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
> 

