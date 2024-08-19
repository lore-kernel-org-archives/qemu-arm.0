Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1947446njf;
        Sun, 18 Aug 2024 21:23:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcL8j1QDqMiaCRul6YEtzDLuuyC1Z7sbCSgVOvPm7tzE/RFUIAhgTX/pMpeyeBYe+XHRChYYyr9Zwur+oL8L2xgqokwimh
X-Received: by 2002:a05:6808:1911:b0:3d5:6413:2138 with SMTP id 5614622812f47-3dd3ad0276amr12952480b6e.12.1724041405716;
        Sun, 18 Aug 2024 21:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724041405; cv=none;
        d=google.com; s=arc-20160816;
        b=E467Yaa6jg/w8Hp2K8qRzxSPRJz4sdJydDdZuG7CsOUq8+QhcNqyWdnYcZgrqDv0sg
         Dyd5RXWAoRpXeM3/ryPG1QRumk9TGg4NVPDWdHdH8HMnamTSav+cz2MBwU7iiTdOpxPy
         uUMZCeqrEr5SAPO8mRVRb/YatG3zdk1ou27ANO8MRJQtj1tmurXuGkJ2SycmKbm4oaUd
         RxLWVC8awNqFBjKIIzhyeHqhwD4sgzRnjlCKoMI3SQD6d/oqw+ii0KNHa+0NNAxyE3a0
         cF7qzwXvItZjyU2B9noLyR87G14aAhLsduXVpl9nzsutoEy/GDUdN48cUdGCWflpqAQ1
         D3kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Nuq/AMvAxy3nR8GHaaLSwgI+50j2bTLxILd8fiUV20s=;
        fh=aDhYSJnm+fdzdUSCKXzJCxgK+3dQVEUzNUAghoPQRrs=;
        b=GfeX2nVJF4HNzjbUsFXJrD2DWGLsG1BoWI1093diRLjjQz3pR5FpMP7jAMath4vDke
         WpZYkKUj9nj55x5h0dCw/mLLN1Fqostpsnn1Meouj/Pu7QZ+3jqxilQf852jJQ+E1opd
         RlwfwF5Ey3hmwiwrzg3ULbjmjDh7o78QGpAfzdJWrygW+F6nJlpaV87IKCdVDSmbE8XH
         652HNwbir22Jco3D0jt1hPgj9UuldRzMfIzbozFA2UYJSGGl1xJTnqRYf9fHT4Al9w+3
         oASV8epMisldl460tf7er+PJgKdNdZIomSO0+7usKjA4rUuGVKRpLHa2ad74kY3qSs+8
         3rYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=biuw0Kwm;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3dd33ef9705sor5574355b6e.16.2024.08.18.21.23.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 18 Aug 2024 21:23:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=biuw0Kwm;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724041405; x=1724646205; darn=linaro.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nuq/AMvAxy3nR8GHaaLSwgI+50j2bTLxILd8fiUV20s=;
        b=biuw0KwmvZ2JcLqegYYkHugdhjcOXRciZzsX8Tr6jKIH5waZjAJb5SPiWL1KgQ6eYl
         z7mmDZIqv+eqFI9Bjl3V4g0xtgfLvbngDSep1eQ5/o17uHDUnNPkMfuT9qobAno8pTE6
         uZ/pmM1yNHqzJ0QX4ghfX+nl2xJEY0q8E6lLdxLwmieqIG3uuXLb3fvhI54EmxMeM2Dy
         fDujG+UVZuaM4p+DqyacB/iWrHXIUt9hB3RtQMK8I6DIqQDuSaggCp9YuQr4cKMx/8J6
         QZBlusj+YObNybZu9vnZBPwSTjrPE5zXXkg05cEtTSAifQsP3yY81r+nnacpGrokxcaF
         EuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724041405; x=1724646205;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nuq/AMvAxy3nR8GHaaLSwgI+50j2bTLxILd8fiUV20s=;
        b=giP5Z8nXCUIHRmx8vdtZDXcN3qa11UNhybfoIwG3rVOmHGQUyDjflF1H4NyuDWtP4C
         AUJE/B45UhK/RKwr3+M7X9CjYa6ltYOnrdEcgjSRZ812v5mvOezx1AcVUH/hymUZa5p5
         Z1Z+Ne9rVZ94K36AJWUxFkO+IYHOD64EWXwGIdQZfGz2TywPusIc/N5VN75lgSucS6DO
         9+gYNeLnb7lNNh1YRU+HFFSa5fXqy9r69ZU3WqUfJ68/ZSSJ1V/EydGg0uoSl9vJumDv
         +H8kz0YXthrFsgb3krEiEsmMXcUcFrHAIcMosF+aYWtfaQLHCFwHRUjSr/7gSgE+I9LR
         FPqw==
X-Forwarded-Encrypted: i=1; AJvYcCXbB37qLKj1Lzy8ksIl4Utj41FCVNReckVhijKo1JpND1Z5g2UPOwBy3U5CYfM3vy2owf8kY1ENeOM3M9e7cVXES/AzqVH0
X-Gm-Message-State: AOJu0Yzyw2eStWw2uDIGpWEkF0QoXYNUeo5a6a1iXedB1GhqC4xlFPFE
	/7M46yWFERkwL6rnEy5XoIiN2blFXUeGrcF0aCOs54PNoa4BvW38BJ6z0PkItOo93otciMnBsXr
	BHdQ=
X-Google-Smtp-Source: AGHT+IGKqEgysF5u4hYd/7tihG+Lxf5WNyMpBS+BiaFMvdCJcUD98ktTYeT/KqMAQi99VL21SOjHUA==
X-Received: by 2002:a05:6358:938f:b0:1ac:f346:735a with SMTP id e5c5f4694b2df-1b393315b20mr1431440155d.28.1724041404682;
        Sun, 18 Aug 2024 21:23:24 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.103] ([191.205.40.123])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61a6cffsm6840103a12.2.2024.08.18.21.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 21:23:24 -0700 (PDT)
Subject: Re: [PATCH 6/8] hw/pci-host/designware: Move viewports from root func
 to host bridge
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
 <20231012121857.31873-7-philmd@linaro.org>
From: Gustavo Romero <gustavo.romero@linaro.org>
Message-ID: <bd4f9669-cf91-3fe1-cc3c-bbc529aa4ce3@linaro.org>
Date: Mon, 19 Aug 2024 01:23:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20231012121857.31873-7-philmd@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: f4Vl+kDuX34Q

Hi Phil,

On 10/12/23 9:18 AM, Philippe Mathieu-Daudé wrote:
> As mentioned in previous commit, the PCI root function is
> irrelevant for the ViewPorts. Move the fields to the host
> bridge state.
> 
> This is a migration compatibility break for the machines
> using the i.MX7 SoC (currently the mcimx7d-sabre machine).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I also see the ATU Viewport registers closer to the host
bridge, so from a modeling perspective I think that makes
sense, even if it's hard to tell that for sure when looking
at the DW IP core docs (but of course QEMU model doesn't
have to mimic any verilog code etc).

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo


> ---
>   include/hw/pci-host/designware.h | 13 ++++-----
>   hw/pci-host/designware.c         | 47 ++++++++++++++++----------------
>   2 files changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
> index e1952ad324..702777ab17 100644
> --- a/include/hw/pci-host/designware.h
> +++ b/include/hw/pci-host/designware.h
> @@ -63,13 +63,6 @@ typedef struct DesignwarePCIEMSI {
>   struct DesignwarePCIERoot {
>       PCIBridge parent_obj;
>   
> -    uint32_t atu_viewport;
> -
> -#define DESIGNWARE_PCIE_VIEWPORT_OUTBOUND    0
> -#define DESIGNWARE_PCIE_VIEWPORT_INBOUND     1
> -#define DESIGNWARE_PCIE_NUM_VIEWPORTS        4
> -
> -    DesignwarePCIEViewport viewports[2][DESIGNWARE_PCIE_NUM_VIEWPORTS];
>       DesignwarePCIEMSI msi;
>       DesignwarePCIEHost *host;
>   };
> @@ -79,6 +72,12 @@ struct DesignwarePCIEHost {
>   
>       DesignwarePCIERoot root;
>   
> +    uint32_t atu_viewport;
> +#define DESIGNWARE_PCIE_VIEWPORT_OUTBOUND    0
> +#define DESIGNWARE_PCIE_VIEWPORT_INBOUND     1
> +#define DESIGNWARE_PCIE_NUM_VIEWPORTS        4
> +    DesignwarePCIEViewport viewports[2][DESIGNWARE_PCIE_NUM_VIEWPORTS];
> +
>       struct {
>           AddressSpace address_space;
>           MemoryRegion address_space_root;
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index d12a36b628..2ef17137e2 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -109,20 +109,21 @@ static void designware_pcie_root_update_msi_mapping(DesignwarePCIERoot *root)
>   }
>   
>   static DesignwarePCIEViewport *
> -designware_pcie_root_get_current_viewport(DesignwarePCIERoot *root)
> +designware_pcie_host_get_current_viewport(DesignwarePCIEHost *host)
>   {
> -    const unsigned int idx = root->atu_viewport & 0xF;
> +    const unsigned int idx = host->atu_viewport & 0xF;
>       const unsigned int dir =
> -        !!(root->atu_viewport & DESIGNWARE_PCIE_ATU_REGION_INBOUND);
> -    return &root->viewports[dir][idx];
> +        !!(host->atu_viewport & DESIGNWARE_PCIE_ATU_REGION_INBOUND);
> +    return &host->viewports[dir][idx];
>   }
>   
>   static uint32_t
>   designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int len)
>   {
>       DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(d);
> +    DesignwarePCIEHost *host = root->host;
>       DesignwarePCIEViewport *viewport =
> -        designware_pcie_root_get_current_viewport(root);
> +        designware_pcie_host_get_current_viewport(host);
>   
>       uint32_t val;
>   
> @@ -170,7 +171,7 @@ designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int len)
>           break;
>   
>       case DESIGNWARE_PCIE_ATU_VIEWPORT:
> -        val = root->atu_viewport;
> +        val = host->atu_viewport;
>           break;
>   
>       case DESIGNWARE_PCIE_ATU_LOWER_BASE:
> @@ -294,7 +295,7 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
>       DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(d);
>       DesignwarePCIEHost *host = root->host;
>       DesignwarePCIEViewport *viewport =
> -        designware_pcie_root_get_current_viewport(root);
> +        designware_pcie_host_get_current_viewport(host);
>   
>       switch (address) {
>       case DESIGNWARE_PCIE_PORT_LINK_CONTROL:
> @@ -332,7 +333,7 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
>           break;
>   
>       case DESIGNWARE_PCIE_ATU_VIEWPORT:
> -        root->atu_viewport = val;
> +        host->atu_viewport = val;
>           break;
>   
>       case DESIGNWARE_PCIE_ATU_LOWER_BASE:
> @@ -420,7 +421,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>           const char *direction;
>           char *name;
>   
> -        viewport = &root->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][i];
> +        viewport = &host->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][i];
>           viewport->inbound = true;
>           viewport->base    = 0x0000000000000000ULL;
>           viewport->target  = 0x0000000000000000ULL;
> @@ -443,7 +444,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>           memory_region_set_enabled(mem, false);
>           g_free(name);
>   
> -        viewport = &root->viewports[DESIGNWARE_PCIE_VIEWPORT_OUTBOUND][i];
> +        viewport = &host->viewports[DESIGNWARE_PCIE_VIEWPORT_OUTBOUND][i];
>           viewport->host    = host;
>           viewport->inbound = false;
>           viewport->base    = 0x0000000000000000ULL;
> @@ -490,7 +491,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>        * NOTE: This will not work correctly for the case when first
>        * configured inbound window is window 0
>        */
> -    viewport = &root->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][0];
> +    viewport = &host->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][0];
>       viewport->cr[1] = DESIGNWARE_PCIE_ATU_ENABLE;
>       designware_pcie_update_viewport(root, viewport);
>   
> @@ -563,18 +564,10 @@ static const VMStateDescription vmstate_designware_pcie_viewport = {
>   
>   static const VMStateDescription vmstate_designware_pcie_root = {
>       .name = "designware-pcie-root",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>       .fields = (VMStateField[]) {
>           VMSTATE_PCI_DEVICE(parent_obj, PCIBridge),
> -        VMSTATE_UINT32(atu_viewport, DesignwarePCIERoot),
> -        VMSTATE_STRUCT_2DARRAY(viewports,
> -                               DesignwarePCIERoot,
> -                               2,
> -                               DESIGNWARE_PCIE_NUM_VIEWPORTS,
> -                               1,
> -                               vmstate_designware_pcie_viewport,
> -                               DesignwarePCIEViewport),
>           VMSTATE_STRUCT(msi,
>                          DesignwarePCIERoot,
>                          1,
> @@ -711,14 +704,22 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
>   
>   static const VMStateDescription vmstate_designware_pcie_host = {
>       .name = "designware-pcie-host",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>       .fields = (VMStateField[]) {
>           VMSTATE_STRUCT(root,
>                          DesignwarePCIEHost,
>                          1,
>                          vmstate_designware_pcie_root,
>                          DesignwarePCIERoot),
> +        VMSTATE_UINT32(atu_viewport, DesignwarePCIEHost),
> +        VMSTATE_STRUCT_2DARRAY(viewports,
> +                               DesignwarePCIEHost,
> +                               2,
> +                               DESIGNWARE_PCIE_NUM_VIEWPORTS,
> +                               1,
> +                               vmstate_designware_pcie_viewport,
> +                               DesignwarePCIEViewport),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> 
