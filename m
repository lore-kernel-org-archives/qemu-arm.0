Received: by 10.28.4.212 with SMTP id 203csp2621419wme;
        Mon, 16 Apr 2018 06:00:36 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49He9EJ+b6SyL0atrZYMP3EuKSlUMnu3jIyXxxClL33dawa9J3pUw8xAAJGbhjgBMYwTb4C
X-Received: by 10.200.55.43 with SMTP id o40mr16080990qtb.94.1523883636200;
        Mon, 16 Apr 2018 06:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523883636; cv=none;
        d=google.com; s=arc-20160816;
        b=BERc9CI7yMy2+OszyApKQy071Xx87vRDQoc1skkB9en6tGv0r6GM7MDXGvA7XCTeUB
         r3GleA6+bX2r15CcCvYSAfv5vJhhx8Uk3XBNlrqfaWH7Pu/T1i35kQ44qjejynVHJQft
         Kt8x/FAWj+cendlte85oV2R0SIOLqcREf/h0DcQ9x4qbqrHEPNDP2gVnWNAzJpH5t/O9
         hvzInwfxW28IWnD1KoTH6fI1bL2FOakvkkU/twiyj6GUPY+a0+qJkKvapHuZWXrViTr5
         m2keaApQ1a0hr8675/DALJ0Aa+wVCGVhRXEZZZFRYx9HR4zsBH/KwBTc3/ihLEalnGwI
         mpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xZgRMIOQnfqLyLohWwwcoOzeRv5OKMeO8fYadBFzjT0=;
        b=zDXTh2N4uyr53YTptyvxgP+K2dsQKDmPeQ8RkpD7Pax9pX5roVzc9AVGPDopRDF/yc
         tt8kXtcxftbkT+6EgiWTwQCYp1nE0E+easpaHsE6Gy2GHXrZhm3aGPG+/iR3H8hDETf7
         oRv7FWtUS3G73DpL9afkY/Mhtc/8GyakOL+0ROmIOTdP3qMAMuGvQNpC9LE0iFqRsxg3
         I6Yo5y9C4MfwtZkujwrT2oKDbzt68n3nb0S7Sj0dErXAVAT/ONb82es00OxKFd7emx/a
         Cs99zDJjOK3vFmRIRXGelTOpR1PW+SDpx1i/kSDznGJu2mggW789cZn9eMPvjKMSkbM1
         OLhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EBb7tsPN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l124si822868qkc.285.2018.04.16.06.00.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 06:00:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EBb7tsPN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f83kJ-0004De-Ng
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 09:00:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f83k5-0004BV-W8
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 09:00:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f83k4-0005rf-PZ
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 09:00:22 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:39064)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f83k4-0005rA-Jd
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 09:00:20 -0400
Received: by mail-oi0-x242.google.com with SMTP id n65-v6so1174029oig.6
	for <qemu-arm@nongnu.org>; Mon, 16 Apr 2018 06:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xZgRMIOQnfqLyLohWwwcoOzeRv5OKMeO8fYadBFzjT0=;
	b=EBb7tsPNddT41wyQTdy6SLw6CLL8bAA/FjIcDi5NjuJxU6t8PYZBJKRRgD1xmk5Rga
	3oeKqIyx8zMcEAphgfFYY1SYZtVLDQzdeYK83A25g5oohPMQkwFM3WJJy33SQMyeQz2s
	8ARY+vmrvxPMXj25c/DhCcFqQHN1kqoOEYDks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xZgRMIOQnfqLyLohWwwcoOzeRv5OKMeO8fYadBFzjT0=;
	b=m4oiKryVKFL/PXY8cYXA0xkRUjBSGdqs50GRU+B1gbSBdWMF8WUKOhcpHuAuQQbLFv
	U7chM0dNVu8D43Kk/pVFv1a/wwiKndODHHWYKCf1eCPvkHlD4ToZMCdJxa8DrnSM+gKs
	XUJb28tc2T8tUOmPXUg01NuZRtYW7EX+jinRElNhWqMlaP+/CwusJjPfuXV6C9mg8Y5P
	47gqlY7QHUWFs0KVGwZJ3Jy79iz6KgxmhE5R74p+AuYaTGau1EyWkHvCN0r91PdbpJTB
	DwNn4Cvn08SR8Zi3jD9fKPlW3R5piHNzdLZo84wu1Nz+jU3aHQW7tgvKxj4jX+jfsr8U
	OREQ==
X-Gm-Message-State: ALQs6tAmOeKp9U/2+uDx4KRTy+Ri2o4NyWHz9JyYaYw1cO+rHBDkeL4x
	Jd6R3letwk6trZ1qH+5Otp6G0FLpgFHdYVkv9nxbwg==
X-Received: by 2002:aca:e043:: with SMTP id
	x64-v6mr13888092oig.164.1523883619752; 
	Mon, 16 Apr 2018 06:00:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 05:59:59
	-0700 (PDT)
In-Reply-To: <1523518688-26674-4-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-4-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 13:59:59 +0100
Message-ID: <CAFEAcA84iZV8vUK4DxPpuO6LwUqE=LEoW63qy=FTiF6KHvYhEw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v11 03/17] hw/arm/smmu-common: VMSAv8-64 page
 table walk
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: beuLhYe+QJv1

On 12 April 2018 at 08:37, Eric Auger <eric.auger@redhat.com> wrote:
> This patch implements the page table walk for VMSAv8-64.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>

> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 9a966bb..6a58948 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -27,6 +27,215 @@
>
>  #include "qemu/error-report.h"
>  #include "hw/arm/smmu-common.h"
> +#include "smmu-internal.h"
> +
> +/* VMSAv8-64 Translation */
> +
> +/**
> + * get_pte - Get the content of a page table entry located t
> + * @base_addr[@index]
> + */

Comment appears to be truncated ?

> +static int get_pte(dma_addr_t baseaddr, uint32_t index, uint64_t *pte,
> +                   SMMUPTWEventInfo *info)
> +{
> +    int ret;
> +    dma_addr_t addr = baseaddr + index * sizeof(*pte);
> +
> +    /* TODO: guarantee 64-bit single-copy atomicity */
> +    ret = dma_memory_read(&address_space_memory, addr,
> +                          (uint8_t *)pte, sizeof(*pte));
> +
> +    if (ret != MEMTX_OK) {
> +        info->type = SMMU_PTW_ERR_WALK_EABT;
> +        info->addr = addr;
> +        return -EINVAL;
> +    }
> +    trace_smmu_get_pte(baseaddr, index, addr, *pte);
> +    return 0;
> +}
> +

> +/**
> + * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
> + *
> + * @cfg: translation configuration
> + * @iova: iova to translate
> + * @perm: tentative access type
> + * @tlbe: returned entry
> + * @info: ptw event handle
> + *
> + * return 0 on success
> + */
> +inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> +             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +{
> +    if (!cfg->aa64) {
> +        /*
> +         * This code path is not entered as we check this while decoding
> +         * the configuration data in the derived SMMU model.
> +         */
> +        assert(0);

Prefer either g_assert_not_reached() or just assert(cfg->aa64).

> +    }
> +
> +    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
> +}
>

> +
> +/*
> + * TODO: At the moment all transactions are considered as priviledged (EL1)

"privileged"

> + * as IOMMU translation callback does not pass user/priv attributes.
> + */
> +#define is_permission_fault(ap, perm) \
> +    (((perm) & IOMMU_WO) && ((ap) & 0x2))
> +
> +#define PTE_AP_TO_PERM(ap) \
> +    (IOMMU_ACCESS_FLAG(true, !((ap) & 0x2)))
> +
> +/* Level Indexing */
> +
> +static inline int level_shift(int level, int granule_sz)
> +{
> +    return granule_sz + (3 - level) * (granule_sz - 3);
> +}
> +
> +static inline uint64_t level_page_mask(int level, int granule_sz)
> +{
> +    return ~(MAKE_64BIT_MASK(0, level_shift(level, granule_sz)));
> +}
> +
> +/**
> + * TODO: handle the case where the level resolves less than
> + * granule_sz -3 IA bits.
> + */
> +static inline
> +uint64_t iova_level_offset(uint64_t iova, int level, int granule_sz)
> +{
> +    return (iova >> level_shift(level, granule_sz)) &
> +            MAKE_64BIT_MASK(0, granule_sz - 3);
> +}
> +
> +#endif

When does the TODO case happen, and what goes wrong?

> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -129,4 +129,18 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>  {
>      return  ((pci_bus_num(sdev->bus) & 0xff) << 8) | sdev->devfn;
>  }
> +
> +/**
> + * smmu_ptw - Perform the page table walk for a given iova / access flags
> + * pair, according to @cfg translation config
> + */
> +int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> +             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info);
> +
> +/**
> + * select_tt - compute which translation table shall be used according

"according to"

> + * the input iova and tranlsation config and return the TT specific info

"translation"

> + */
> +SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
> +
>  #endif  /* HW_ARM_SMMU_COMMON */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
