Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1947377njf;
        Sun, 18 Aug 2024 21:22:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxpMjPi9KodrVExtt7d+2t8RuSobq9vw0NVqk76Y2qUSjmCdAcU2WDTSOFmW+t2Zn4ILqt8/zFX/U5EZKUOPNhWwgdCCm7
X-Received: by 2002:a05:6871:594:b0:261:7c5:f018 with SMTP id 586e51a60fabf-2701c343c82mr11528062fac.4.1724041372813;
        Sun, 18 Aug 2024 21:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724041372; cv=none;
        d=google.com; s=arc-20160816;
        b=K/I7z2+0fWry0V5zn7sc/1Vke/Pfumdy68ygKPkW3e5cYWpjzye4EdkTpRsFBWz6+D
         CPuN3WsHIh60vTaId4Rc6iacx23Mx1RqtIDnMjFW9WHiibZLd7327GqbsZlKA6/+QI8p
         aL1LNIZvPpBJ99TvGaTmBxVfc8AFS1SKUDF3btkSceE5/jOXud1x9lOyEolWiYsA+Bdo
         tvYmEJVaTRSsjOyL/815rRX3d50vvnRq80xJX0U0qmIqvOzSRdThXu/SNXgWlx1K9UJ5
         4+FQVs+84On16mZjZM1ZOkTzB9lTPba3UUEgiKzNcmG5IwQol3RPVxkIvm+SiunuLQSI
         OMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=YNlpiX6ZjhJonIHprrBdtOd2a6QnQVc8x7RmgqoCj/I=;
        fh=ZSIC8SIllllY66ne8mFBU+ZZFcu4eiX7CUFn3AhdsRk=;
        b=kdgep8JZHl13LXPdn+G1HQHyEgSbQZyi4AlSlffmx6hXgFxbs8sKi879oAvNeJA3nM
         QWFP/sX14aPhDtiFGurgX0sx/pqe3iggfG7tdmR+di3aP0jD1fWmsmcisG94MWYSG8gm
         R1KpiNbU4QtKnPxtqkrCQzT7+WvOqnGl6T4vSPRTbyGrWdtfX3XdlkbElI5c6elTjZVt
         NBjn6Qei7Pb6IqXTaGFN2Re2inwXBmLjs+g5x4JVfCH9uMCdt+U8J3dKbyWyyw2dxoPs
         RzcE/8OZqlOmZm968+OYGegIg2aIL8kUz8KXhJPGSmU4nW/uxSSwRGbFnD8C4ElNz634
         FobA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZ8zqlJL;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 586e51a60fabf-2700478ed5dsor2726199fac.14.2024.08.18.21.22.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 18 Aug 2024 21:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZ8zqlJL;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724041372; x=1724646172; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNlpiX6ZjhJonIHprrBdtOd2a6QnQVc8x7RmgqoCj/I=;
        b=mZ8zqlJLOutocErVr6t1O9aR8j7Rh2IJ4hxM/P07YQE6hDr944dfJmr1SuL+2RqAW0
         Ld3MvmuNqrPltel8oKYW5pEM2D6f+TzsZAF2WG1Ik5tksbJr+xzGPRLo5BR4Q2CgvZkW
         lgovV72LB9HBEuLNulx8BfjvomrZvOgwXA5gfPY900sU84fjvf3xNE3Ijr0vSZ0hzTfX
         ZYGiaGiYjOvJxg0go34TSoIMNHlsX5yCKSrIEen54gR/jpy8oa/mF27cvT5COotTtu06
         rxtKggNSDE8QjJDhFZGVWtsWfMq6K8xshJrE3HgiQG4mHKsgpeurO4yI2fQ39H3nfAYu
         VpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724041372; x=1724646172;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNlpiX6ZjhJonIHprrBdtOd2a6QnQVc8x7RmgqoCj/I=;
        b=Ko66kXMxN4ZkiXyUSLAuhd51+yA8u2R1EA79LhNw9JDM64N0la7IQ5OkrIjOMe31jB
         0lpu7iFKPLY8HiyU5NBPY8iXogIp4P3yw1K+wxcylTQc4HgF1ruX/loC9ZXdqKtl1Q7H
         qD5IDDkja4t7CiTS9QVzw2V2I1wBp1KxadKmvdX/MEvWCLgMYOYxoUcvYQMr1IgWBTPe
         Mpi+QoWJ9LrCz9LhGT1UNSeiYXQ/qiQLZRyp/hVdkhlwoEdMiSBnrGQ3Z7+OEeHi/UCF
         ESRBlLtYsCY8tQRvgZVcDLXeZPfzAc9LJ0957wXrm+FCZF3KfId26kpU1PTgLXljBe/n
         hlKw==
X-Forwarded-Encrypted: i=1; AJvYcCVhiI7UaEPuB1eWJSDpY/VfrbdNh2dqaUoiyE0NDZ8wngA+wfdPupchuD9uipJi0HKAy+m1RiYpZsLV9RTS18Jr+o3lr4q0
X-Gm-Message-State: AOJu0YwzcrjNXsHMGuS9APQpLHJEVKF3e5z+AqzI15e4kQ0mFC82VUXq
	L7X/WaxIfGyBYpQKxMQE77Asn6g0UL4NCJD8IttlfvM9L8vTL3udDKgnlmzdd1C5wSqKFti5YmW
	yWlU=
X-Google-Smtp-Source: AGHT+IHHqztJoSsF/4Bun+MTB3I6lsRAbu+IK7ae6YNv+UZtN9RznZXk/Mrh0C1uKABYTqZHUHZf6g==
X-Received: by 2002:a05:6870:a489:b0:250:7465:d221 with SMTP id 586e51a60fabf-2701c3f73b9mr11020910fac.28.1724041372106;
        Sun, 18 Aug 2024 21:22:52 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.103] ([191.205.40.123])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127ae0f466sm5848580b3a.53.2024.08.18.21.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 21:22:51 -0700 (PDT)
Subject: Re: [PATCH 5/8] hw/pci-host/designware: Keep host reference in
 DesignwarePCIEViewport
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-6-philmd@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <dc7de9ff-5add-fb1f-a1b1-5c4db7d4e5e1@linaro.org>
Date: Mon, 19 Aug 2024 01:22:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20231012121857.31873-6-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: WrXCn5mf+FfE

Hi Phil,

I think the title of this patch is also a bit misleading.
The host reference is not present only in DesigwarePCIEViewport,
it's also present, for instance, in DesignwarePCIERoot after the
previous patch. This is also a back-pointer to host, so how about
something like:

"Add a back-pointer to the host in viewport"

Anyways,

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo


On 10/12/23 9:18 AM, Philippe Mathieu-Daudé wrote:
> The PCI root function is irrelevant for the ViewPort; only
> a reference to the host bridge is required. Since we can
> directly access the PCI bus, remove the pci_get_bus() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/pci-host/designware.h | 2 +-
>   hw/pci-host/designware.c         | 7 +++----
>   2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
> index 9e2caa04e9..e1952ad324 100644
> --- a/include/hw/pci-host/designware.h
> +++ b/include/hw/pci-host/designware.h
> @@ -32,7 +32,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIEHost, DESIGNWARE_PCIE_HOST)
>   OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIERoot, DESIGNWARE_PCIE_ROOT)
>   
>   typedef struct DesignwarePCIEViewport {
> -    DesignwarePCIERoot *root;
> +    DesignwarePCIEHost *host;
>   
>       MemoryRegion cfg;
>       MemoryRegion mem;
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index fb46493a05..d12a36b628 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -211,12 +211,11 @@ static uint64_t designware_pcie_root_data_access(void *opaque, hwaddr addr,
>                                                    uint64_t *val, unsigned len)
>   {
>       DesignwarePCIEViewport *viewport = opaque;
> -    DesignwarePCIERoot *root = viewport->root;
> +    PCIHostState *pci = PCI_HOST_BRIDGE(viewport->host);
>   
>       const uint8_t busnum = DESIGNWARE_PCIE_ATU_BUS(viewport->target);
>       const uint8_t devfn  = DESIGNWARE_PCIE_ATU_DEVFN(viewport->target);
> -    PCIBus    *pcibus    = pci_get_bus(PCI_DEVICE(root));
> -    PCIDevice *pcidev    = pci_find_device(pcibus, busnum, devfn);
> +    PCIDevice *pcidev    = pci_find_device(pci->bus, busnum, devfn);
>   
>       if (pcidev) {
>           addr &= pci_config_size(pcidev) - 1;
> @@ -445,7 +444,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>           g_free(name);
>   
>           viewport = &root->viewports[DESIGNWARE_PCIE_VIEWPORT_OUTBOUND][i];
> -        viewport->root    = root;
> +        viewport->host    = host;
>           viewport->inbound = false;
>           viewport->base    = 0x0000000000000000ULL;
>           viewport->target  = 0x0000000000000000ULL;
> 
