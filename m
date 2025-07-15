Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04392C83F17
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 08:58:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubbUD-0007uQ-AI; Tue, 15 Jul 2025 04:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubbU5-0007n4-5q
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 04:57:58 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubbU1-0000ss-8W
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 04:57:56 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e897c8ca777so4546658276.2
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 01:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752569872; x=1753174672; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=menFouMnGpxjQATkO3BVA/X/pp5Y4Sq0tefbdD20wEY=;
 b=I1eTSAMH0IjEODKnE2bzPtJhK7ZaJR/AYwhb2XQca7VPgI7+I0c4JZner9zR75KYy1
 pFkGbk61guI1vQmT2VzFBN14XZ+f1LeBmoZ5uiMYWWKi8QX47Q0xOg2Z0eqTRnNUfSg8
 kcPFKDHd79iUK2nLXuYfKBraGajWjWSqoyTrct2ci6i34m+0vO1kdqek4u+g/kYJ1ywp
 EIKaBuF6hicqDHGNlE67/HDkSvFQqYXTqz2pCvIBlDbSC3F2Ndh5uns//RcdMh8wEjFh
 tAvAK5LDBwWd2BpiM8RchJ8m9KCbCa7oJw4xmUk2j48m9Z0Nfw7+P8c33elAnt0jckSn
 GYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752569872; x=1753174672;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=menFouMnGpxjQATkO3BVA/X/pp5Y4Sq0tefbdD20wEY=;
 b=OevzDPsDuNk8qNgqlGTvtEuIgg5+nKICWlfOYKsd56R/hyA++yeb6Oda57JzBNKuRp
 H9SCD4LDTkQLWVTsWncBHimxxlenBQPqqTeTLh9LNiRqjU3OLZLGQUe3yki6USyHVqwx
 CXukOyA2ECA6bAu+n+XOEfs6IBBtcRoqThulEyMkJIWdy8LV0qzCetYHgPau1UDtNG+o
 c76GdE/tXTJY2AxFVcsAOxOuOPTbfl7PTxMEtBBvE3nPY1HN/Mu05MSrNvrsTKL0qQXN
 ekdk7WpMt9X6kvo/a60bP3bdp2QghQ/v9AzitvuigWLINEMy5pF+UEBhdBQz9Lfj3QvQ
 PZBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9uvpqpZ1KmnG8aTZy4xTrwM9EH7NJ1TpA+/7D0qb1A/q1AE/p97u4MR+gRKnk8zlwqMxhdY1OgA==@nongnu.org
X-Gm-Message-State: AOJu0YzgLjZuU6OfP8hsC/mNQWL8qYhJ4crBJex+FZGVYajqG/4AICgS
 E99DFScmOfxVd5RtDrNZ8G57fIpYF5fR25jhFH5eIydqUijfg8mF5TTNO5lrZGG4IG63QWRiCz9
 bpxh7uNlDeKc0tuZpYYCpnjTYdWJkUuSGZ558rJlIBLT/sqpxvyUu
X-Gm-Gg: ASbGncswFGQCJ7LMysk5gRl9e1K/wJXwG0AanaFYvS2E60ZWrsJBu2t+ZK/6vY2BlBg
 kYRjHN0CXBmJSs7gBFLW6habL+CbNnT7AWfc7EXProK4LzgxBymjCBjsxuEbAhNYoQrRD5EURXb
 0WrsFUIjt779ZALN3/I67hjB/lqDlQHKA7fNGIxmozSRAA97oZ3VT6Pj6/vrtjtrzYAefRMbZUF
 p7A0Bhj
X-Google-Smtp-Source: AGHT+IHez/iyjfSeSl46ctCfFuLK1bb8AN2lYtHG46gp1v8AZAFh2cVwRj38ypwuAlZZs7vTFkU1AGrgHD0r3ZaizeI=
X-Received: by 2002:a05:690c:62c9:b0:716:5986:e4c7 with SMTP id
 00721157ae682-71824af6a20mr28550807b3.11.1752569871487; Tue, 15 Jul 2025
 01:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250715073251.2376473-1-zhangzhijie@bosc.ac.cn>
In-Reply-To: <20250715073251.2376473-1-zhangzhijie@bosc.ac.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jul 2025 09:57:38 +0100
X-Gm-Features: Ac12FXxZO2KWQUxCWcItPTizvuXX18BdMit8Cyz119ihYdN4gH33Vc_YqoKJRK8
Message-ID: <CAFEAcA_Vfrc7Riz-GguzdRHXaeNYBW6_MM3UQp9S6-TWNqgEhA@mail.gmail.com>
Subject: Re: [PATCH v1] hw/pci-host/designware: Support 64Bit resource for
 DesignwarePCIEHost
To: zhangzhijie <zhangzhijie@bosc.ac.cn>
Cc: wangran@bosc.ac.cn, zhangjian@bosc.ac.cn, andrew.smirnov@gmail.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 15 Jul 2025 at 08:33, zhangzhijie <zhangzhijie@bosc.ac.cn> wrote:
>
> 0. DW pcie support 64bit resource
> 1. DW version type using Linux kernel
>
> Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
> ---
>  hw/pci-host/designware.c         | 12 +++++++++---
>  include/hw/pci-host/designware.h |  2 +-
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index f6e49ce9b8..99d791c0a7 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -41,6 +41,8 @@
>  #define DESIGNWARE_PCIE_MSI_INTR0_ENABLE           0x828
>  #define DESIGNWARE_PCIE_MSI_INTR0_MASK             0x82C
>  #define DESIGNWARE_PCIE_MSI_INTR0_STATUS           0x830
> +#define PCIE_VERSION_NUMBER                        0x8F8
> +#define PCIE_VERSION_TYPE                          0x8FC
>  #define DESIGNWARE_PCIE_ATU_VIEWPORT               0x900
>  #define DESIGNWARE_PCIE_ATU_REGION_INBOUND         BIT(31)
>  #define DESIGNWARE_PCIE_ATU_CR1                    0x904
> @@ -144,6 +146,10 @@ designware_pcie_root_config_read(PCIDevice *d, uint32_t address, int len)
>      uint32_t val;
>
>      switch (address) {
> +    case PCIE_VERSION_NUMBER:
> +    case PCIE_VERSION_TYPE:
> +        val = 0x3534302a;

What is this magic number ?

> +        break;
>      case DESIGNWARE_PCIE_PORT_LINK_CONTROL:
>          /*
>           * Linux guest uses this register only to configure number of
> @@ -427,7 +433,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>          viewport->inbound = true;
>          viewport->base    = 0x0000000000000000ULL;
>          viewport->target  = 0x0000000000000000ULL;
> -        viewport->limit   = UINT32_MAX;
> +        viewport->limit   = UINT64_MAX;
>          viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
>
>          source      = &host->pci.address_space_root;
> @@ -451,7 +457,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
>          viewport->inbound = false;
>          viewport->base    = 0x0000000000000000ULL;
>          viewport->target  = 0x0000000000000000ULL;
> -        viewport->limit   = UINT32_MAX;
> +        viewport->limit   = UINT64_MAX;
>          viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
>
>          destination = &host->pci.memory;
> @@ -558,7 +564,7 @@ static const VMStateDescription vmstate_designware_pcie_viewport = {
>      .fields = (const VMStateField[]) {
>          VMSTATE_UINT64(base, DesignwarePCIEViewport),
>          VMSTATE_UINT64(target, DesignwarePCIEViewport),
> -        VMSTATE_UINT32(limit, DesignwarePCIEViewport),
> +        VMSTATE_UINT64(limit, DesignwarePCIEViewport),
>          VMSTATE_UINT32_ARRAY(cr, DesignwarePCIEViewport, 2),
>          VMSTATE_END_OF_LIST()
>      }

This breaks migration compatibility. Depending on which boards
use this you might either need to just bump the version numbers,
or else do something more elaborate to ensure migration compat.

> diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
> index a35a3bd06c..6e06f54801 100644
> --- a/include/hw/pci-host/designware.h
> +++ b/include/hw/pci-host/designware.h
> @@ -46,7 +46,7 @@ typedef struct DesignwarePCIEViewport {
>
>      uint64_t base;
>      uint64_t target;
> -    uint32_t limit;
> +    uint64_t limit;
>      uint32_t cr[2];

Last time that something related to this pci controller
and the size of this limit came up, this appeared to be
something that differed between different versions of the
hardware. See discussions on the thread in

https://lore.kernel.org/qemu-devel/CAFEAcA_x4CyQ0wF7-x-4oq4OUYsuJcbL3xLrz3D0cmWYmfs75w@mail.gmail.com/

Maybe we need to model both, with a device property to
select which one?

thanks
-- PMM

