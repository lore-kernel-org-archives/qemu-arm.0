Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp103754njb;
        Tue, 20 Aug 2024 18:06:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCZQND/LaxGRX9yREYGjnyjMh0okeobHfdSCZINHfI1NNp5zYZ4fxZGmwVW41t+xKHDV1zMn6KiXpG2Q==@linaro.org
X-Google-Smtp-Source: AGHT+IF+BjvCQCKg6MIpTi+cVoitG4jdtlGUSwnO7O0cNK911kIKS6yy0WmRRpY1h8DF3GzCdYwE
X-Received: by 2002:a05:687c:2be8:b0:260:ff24:fb32 with SMTP id 586e51a60fabf-2737eebda51mr720333fac.1.1724202379254;
        Tue, 20 Aug 2024 18:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724202379; cv=none;
        d=google.com; s=arc-20160816;
        b=jVNwI+wSPEAamLmPWpiymaIMKgENXztB4Yh4/pU/sajmdr7gXONqjP9v9Qo4Lm2j/r
         VEAq9DdFUw5pofgn68le03R52Fpj2FvL4feuOhS3xiMCNevOGsyzGZrAtasBDOtQdf+i
         b2yfx0sNiKgl1cHHarfH9/POJjXS7Sz86e/Y4h3bBJstXgyrEEICKmi5kqGJms1z1xV1
         MU502oymmZxg3ETFqyCs4IJuweHy22F6K4MWmzjQ7C8UNUtib6m9zdjODjm9wrgcg8mB
         jbsN76bqPUMLYrVwd1lUbCfmA+/lllzDEEuUvYhukIlNxif6rFi1O2kan64ONarIIHft
         tklw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:from:date:dkim-signature;
        bh=4Ma7bPKw+6tyKK4UQmBRR5Sz4iy0w26OsZ0fXybnepo=;
        fh=Ug+pXI9+HXYIt7BDs0h6rTDu/NKL8sq/RkmAlhQApNM=;
        b=hyarg7MNxQYlzsYrIhpFYzxndOyhciyXtpmvz1h1OhAu7o8uHjWjJUoy+Y6JGSNLKy
         RYQq4u6AU+JV8Um1PlM05S4BCYcK1+B3k7+WCRVFTB4J+iiUF+Fm+ksS0Yw/LdO+tBVs
         Rvh3sPexyDYkTjgWq07igPMPOCWakTQAhmsp3kUikbvy2MdD+o/5zgpV3rsnhFYhJ82M
         hLnk44SGNE+Dywh6cnVM+eB5Djg+YznziboDJXXid57I2J/AJsHJKCWs0YvIKflyTUwr
         frdd7twYSUb/kvO4cqwFkh5pw7rVxVsuEwyHESbzAdTWVrvHR47TApGry4dAoUIQIdCC
         w+Sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ZxYLv8Q6;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <sstabellini@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id 586e51a60fabf-27004a34778si6013390fac.315.2024.08.20.18.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 18:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ZxYLv8Q6;
       spf=pass (google.com: domain of sstabellini@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=sstabellini@kernel.org;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DCE9260F8B;
	Wed, 21 Aug 2024 01:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7532C4AF09;
	Wed, 21 Aug 2024 01:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724202378;
	bh=BH13lVKJeuyYp6L1+dnUtBn/qLzJxA6G2U25oUKFM4I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZxYLv8Q6Y3WJJSFg30UoNe13lZII8LCgE6umdvgR6zt6BDmswGS45cenceElKsTmQ
	 CPNB49rZ21GTH0S1NK8rCAQpWowBtU66rWXV2yhPk9tM7uedSMzanFk8lXN0Xp3tPS
	 vJEGax8nAJQ0AKB83On5f/M1SxFJEdoInu7p6qKjwTOobZaUTrlXYC45TqD7IDr0Km
	 8De3/KVo2yNGF9NWWG6jNUnB6eY6+EuAN2hece54HuzRlkoCQFUMpMsosC/++QwxZB
	 AFutFtDqqve8dJOHx+sIywc+UPI6OcvBZG6HIDUkoHs5P1/lJm9iKH6dIR+dkOWGL0
	 qqELwFAvYsUYQ==
Date: Tue, 20 Aug 2024 18:06:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, alex.bennee@linaro.org, 
    xenia.ragiadakou@amd.com, jason.andryuk@amd.com, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 06/12] hw/arm: xenpvh: Move stubbed functions to
 xen-stubs.c
In-Reply-To: <20240820142949.533381-7-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2408201806100.298534@ubuntu-linux-20-04-desktop>
References: <20240820142949.533381-1-edgar.iglesias@gmail.com> <20240820142949.533381-7-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TUID: YVOxm3+4g8u0

On Tue, 20 Aug 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/meson.build |  5 ++++-
>  hw/arm/xen-stubs.c | 32 ++++++++++++++++++++++++++++++++
>  hw/arm/xen_arm.c   | 20 --------------------
>  3 files changed, 36 insertions(+), 21 deletions(-)
>  create mode 100644 hw/arm/xen-stubs.c
> 
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 0c07ab522f..074612b40c 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -59,7 +59,10 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
>  arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
>  arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
>  arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
> -arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
> +arm_ss.add(when: 'CONFIG_XEN', if_true: files(
> +  'xen-stubs.c',
> +  'xen_arm.c',
> +))
>  
>  system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
>  system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
> diff --git a/hw/arm/xen-stubs.c b/hw/arm/xen-stubs.c
> new file mode 100644
> index 0000000000..4ac6a56a96
> --- /dev/null
> +++ b/hw/arm/xen-stubs.c
> @@ -0,0 +1,32 @@
> +/*
> + * Stubs for unimplemented Xen functions for ARM.
> + *
> + * SPDX-License-Identifier: MIT
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "qapi/qapi-commands-migration.h"
> +#include "hw/boards.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/xen/xen-hvm-common.h"
> +#include "hw/xen/arch_hvm.h"
> +
> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
> +{
> +    hw_error("Invalid ioreq type 0x%x\n", req->type);
> +    return;
> +}
> +
> +void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
> +                         bool add)
> +{
> +}
> +
> +void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
> +{
> +}
> +
> +void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
> +{
> +}
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index 16b3f00992..f0868e7be5 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -115,26 +115,6 @@ static void xen_init_ram(MachineState *machine)
>      memory_region_add_subregion(sysmem, XEN_GRANT_ADDR_OFF, &xen_grants);
>  }
>  
> -void arch_handle_ioreq(XenIOState *state, ioreq_t *req)
> -{
> -    hw_error("Invalid ioreq type 0x%x\n", req->type);
> -
> -    return;
> -}
> -
> -void arch_xen_set_memory(XenIOState *state, MemoryRegionSection *section,
> -                         bool add)
> -{
> -}
> -
> -void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
> -{
> -}
> -
> -void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
> -{
> -}
> -
>  #ifdef CONFIG_TPM
>  static void xen_enable_tpm(XenArmState *xam)
>  {
> -- 
> 2.43.0
> 
