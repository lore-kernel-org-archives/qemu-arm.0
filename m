Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2872670lfg;
        Mon, 10 May 2021 04:32:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFliynXH+SCrcEQ39UBhiJEZk0pPPmFslzjvXixTjFaxvKLIMCKKQdwSj7rbLpkm2TvsrK
X-Received: by 2002:a67:df85:: with SMTP id x5mr12144849vsk.9.1620646365390;
        Mon, 10 May 2021 04:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620646365; cv=none;
        d=google.com; s=arc-20160816;
        b=lXvg9ZnlFOpPw0QueRkB6quOKd7mj6mhHzaZlz2VPtZZx3RAgV6vE0qOiJkzss5NHD
         BeDSYklLfnJ516gPzrq/vdNVuWkXfPXvRtS/KyHnt9sDRb9JHwxrlMzlfu021QrRLdvo
         mgJY6eDE8SjsD1p/pqzgSuHM2CcTzg3L7WpGL3Qe+XyreoGx4Dp8vHsXxQHV6VkgtbLN
         ZUEdwp9ZQhsOEFYrUYUgV2sRQt2Oo2dQreukO9SZAhhu1c5ART8MxVXzIEpI45jB4diD
         i5AnTbgeM+jm5/Bi2BFsbGdhU8NH4kxBITxrAN3hQOpVY7mWulFXn78ErwFKGe59TXMm
         VvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CcRJ1mcECD6ljze5xB69l0GAoTn2jD6JD0zuakEXLOE=;
        b=o9YSV5q4+KcMoF9gIwZ7S8vdVb+aUE209OUSAr+YfASAguVMHl+6k/flVPzkrq4ENk
         yTsXbAYkuz9WK8ilCqTOZMlATk16DP2jjWr6eYxnsyl2W3r/sXLnCuU/5X7n0P3iUyPN
         /rAGCoPAoXun2FGpiI/bnC0k6JP4NmyixCMGl5aHI+L1VJpEcJp4EQQIm2HyAM5yxFVW
         O13PE1Tbj6Ta5xhrco9yKgWkXJedaLI+tWEzjz37kAWK9obQpVjiXgJoVkigyoYHmTJb
         rsoByQAGA6rfF6kUAVt8Gsz5h6o0FqeGa8KqTt3PmS06m3CPeiWpMkiIRAlon0Uoyaze
         c6fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mQYzNULt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5si149384vsc.419.2021.05.10.04.32.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 04:32:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mQYzNULt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lg49U-0007Ta-Gi
	for alex.bennee@linaro.org; Mon, 10 May 2021 07:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg49I-0007Qh-Tk
 for qemu-arm@nongnu.org; Mon, 10 May 2021 07:32:32 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg49G-0005bJ-0W
 for qemu-arm@nongnu.org; Mon, 10 May 2021 07:32:32 -0400
Received: by mail-ed1-x530.google.com with SMTP id j26so14614186edf.9
 for <qemu-arm@nongnu.org>; Mon, 10 May 2021 04:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CcRJ1mcECD6ljze5xB69l0GAoTn2jD6JD0zuakEXLOE=;
 b=mQYzNULtWyrS8HDJ9v+FAAfyrHqTlwNPj6tSJDWKoFjb1A8rfcRWXktba+PnxibiYK
 hClp8aPW9BrYyK33mtSGQBPG2DfYRmligAPfbXIF6XMxFo+/ikheJ3MGkXHdzWNhEWxF
 0w9zIt38sNZ7FoICMsdIaCmMTwF/azrFRy2JVOSNyPZkLPaA4ymBgdbYNneDJ23zK5P7
 0QSBZZbAdecnkfN1QsfDog/2F18Y/uTde0Hkzk3w1CS2JpD4Xo8MbWdEoQAzickA+V66
 FB1xsLzXifidPq2ufDREdLgY7NVr45fkJHxMBs6GExuoy0aYc8ve6eVjjDDHaunBNhQQ
 JcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CcRJ1mcECD6ljze5xB69l0GAoTn2jD6JD0zuakEXLOE=;
 b=Bb9wLRCDdkDtgjXf7S0OCKjVLgJc4Z+Ye/EBV3gQCRtSbS80ltCytqI/QUQK2mytGw
 Zad/PYx6do6/WpEs1msxX83Qxh2a2CxK5r76ybg9z65giz0nDc4tHTnELggHWsXKyTI9
 YaF/gN0XEXhDlhY9x+O3PqtjuHBAGo3mXwxOtG46gizAgGM8jMnBYnN1AeyUzFA0YNv5
 c+4tCLQqg8oZKvyBxfUJ+9h+SntYiYnpBPT7cKb9feuQv99edIXCrmKCmPuszcB56RNa
 +lGHtdmlqwDWG0L5v0bAKP1Gq7J7STezuDHYgR60kiC4DFRjocWArICJBDypUfFH12PW
 1FuA==
X-Gm-Message-State: AOAM530mnKLNTdql/ap9C4/umzjQMazRI6TKhJzQZQNbDp2yuAvUjCB+
 2yJhj0E8uaBFLuUhCq0Vjahn2dinl+yjszVnfjCM7A==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr28448352edv.44.1620646346186; 
 Mon, 10 May 2021 04:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210421172910.11832-1-eric.auger@redhat.com>
In-Reply-To: <20210421172910.11832-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 May 2021 12:31:14 +0100
Message-ID: <CAFEAcA_R4UY1vr3ZKEf_egF7e5GmFDWuDV_SGenUkLOygh0hGQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Another range invalidation fix
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kunkun Jiang <jiangkunkun@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MksWpQc9LYBC

On Wed, 21 Apr 2021 at 18:29, Eric Auger <eric.auger@redhat.com> wrote:
>
> 6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
> failed to completely fix misalignment issues with range
> invalidation. For instance invalidations patterns like "invalidate 32
> 4kB pages starting from 0xff395000 are not correctly handled" due
> to the fact the previous fix only made sure the number of invalidated
> pages were a power of 2 but did not properly handle the start
> address was not aligned with the range. This can be noticed when
> boothing a fedora 33 with protected virtio-blk-pci.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: 6d9cd115b9 ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
>
> ---
>
> This bug was found with SMMU RIL avocado-qemu acceptance tests
> ---
>  hw/arm/smmuv3.c | 49 +++++++++++++++++++++++++------------------------
>  1 file changed, 25 insertions(+), 24 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 8705612535..16f285a566 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -856,43 +856,44 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
>
>  static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>  {
> -    uint8_t scale = 0, num = 0, ttl = 0;
> -    dma_addr_t addr = CMD_ADDR(cmd);
> +    dma_addr_t end, addr = CMD_ADDR(cmd);
>      uint8_t type = CMD_TYPE(cmd);
>      uint16_t vmid = CMD_VMID(cmd);
> +    uint8_t scale = CMD_SCALE(cmd);
> +    uint8_t num = CMD_NUM(cmd);
> +    uint8_t ttl = CMD_TTL(cmd);
>      bool leaf = CMD_LEAF(cmd);
>      uint8_t tg = CMD_TG(cmd);
> -    uint64_t first_page = 0, last_page;
> -    uint64_t num_pages = 1;
> +    uint64_t num_pages;
> +    uint8_t granule;
>      int asid = -1;
>
> -    if (tg) {
> -        scale = CMD_SCALE(cmd);
> -        num = CMD_NUM(cmd);
> -        ttl = CMD_TTL(cmd);
> -        num_pages = (num + 1) * BIT_ULL(scale);
> -    }
> -
>      if (type == SMMU_CMD_TLBI_NH_VA) {
>          asid = CMD_ASID(cmd);
>      }
>
> +    if (!tg) {
> +        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
> +        smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
> +        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
> +    }

Is this intended to fall through ?

> +
> +    /* RIL in use */
> +
> +    num_pages = (num + 1) * BIT_ULL(scale);
> +    granule = tg * 2 + 10;
> +
>      /* Split invalidations into ^2 range invalidations */
> -    last_page = num_pages - 1;
> -    while (num_pages) {
> -        uint8_t granule = tg * 2 + 10;
> -        uint64_t mask, count;
> +    end = addr + (num_pages << granule) - 1;
>
> -        mask = dma_aligned_pow2_mask(first_page, last_page, 64 - granule);
> -        count = mask + 1;
> +    while (addr != end + 1) {
> +        uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
>
> -        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, count, ttl, leaf);
> -        smmuv3_inv_notifiers_iova(s, asid, addr, tg, count);
> -        smmu_iotlb_inv_iova(s, asid, addr, tg, count, ttl);
> -
> -        num_pages -= count;
> -        first_page += count;
> -        addr += count * BIT_ULL(granule);
> +        num_pages = (mask + 1) >> granule;
> +        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> +        smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> +        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
> +        addr += mask + 1;
>      }
>  }

thanks
-- PMM
