Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1394032lfm;
        Thu, 25 Jun 2020 08:14:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHiGIvCnW7m11QxXFD5F2tIsva333UlrzOmcaMeKsxXNcKZZmYKoDU1MTMGwR4IsSMFYcD
X-Received: by 2002:a25:d8d5:: with SMTP id p204mr52444124ybg.28.1593098044339;
        Thu, 25 Jun 2020 08:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593098044; cv=none;
        d=google.com; s=arc-20160816;
        b=eawVVRU9lxwzOIkToMu8xpjrVybdRPPU7uQzUt0k5rXlTifzVjgIe5sBhw4XC+Imyw
         /KZMDH9AZm4Y/TlA0z5RZIhRXtbwr1iUTpcT1e7XyVFZ4v0ii4RA1FEmqlU4hvQ5iXsq
         3pcRVTv8J5wGBubsbMBfr7d9ZhHO+WrDjGBw5k49/pg7T/tOyVgr5fG5gT0LHMa8+I49
         /zFlRh43YWKd0tNnPuDiPsFnXYw0lfLC5vZfgPRFigT0yPk+rMi/a50H7Z4N8GUakjB0
         tF/9W4+/+zOUMntPVUvX2KEivdZXJFAKQvBMDHqothYE/SaY+i10c5cPQxEoTbT8G/oy
         LO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4tnlDch3t3FkKDJqfHzh2a/y8QHemcuTIVsbVvfOu3o=;
        b=U9yN6CQOjgubMF7TxdldQDu/Abtl1d3Ca/ABAntl3sfyYGaZOtU0KqheIvvtmHdcP/
         s6JZUqi+TC/yY0q2pBOQGsBkynVaZHdqxvWeDlAEEvOv/J5I//YY/VmpyM3FSvknGuHN
         9DZwTTdWTS60qddKHMaBGemgIg4v7pxD1OFp7Rg9gWMKpFyXUAxrrpn77PCG7J5FUTrL
         SCPZbxTgEzLOdRNMtJgruZVauL8Xk73euM9IiSt0REvaH23DPb3b94OK1QrSIyYCDZqy
         kzHaEul11PG+TMgoEhBLuZ9+eCgl4IBuqlgwtfpdhZwgPvbzEmiFTohQPW821HfAEfy2
         Ri6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F8NVeYDY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si21936155yba.245.2020.06.25.08.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 08:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F8NVeYDY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joTZj-0003YM-Ou
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 11:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTZT-0003Xi-VJ
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:13:47 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joTZS-0005BU-39
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:13:47 -0400
Received: by mail-ot1-x344.google.com with SMTP id k4so2408753otr.7
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 08:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4tnlDch3t3FkKDJqfHzh2a/y8QHemcuTIVsbVvfOu3o=;
 b=F8NVeYDYFll5ZT42l6nY8loyX5Tno4wZrb4Iws076gYRrEhW9oztZMV0a8Gtv3RpZA
 mN4X4tKotjM0nxJk/jBwXZzlJHkpuPWGmaXuiqbLqFNuG5pztu8fGsUpJDI+OB+7gK5d
 yf8W0Css/ETIaUV90FDLTCXELDfEuklQa1TMQ3crpE3mCVLgx1IyT7tI0N6K+g6AgZT/
 pz9ZMxJyJSQ5Kzfgn16qh68wvXTT410iDTYheKjFbZWezdJyAgCoxkYlWhM0khwaCuef
 CCG1VHN7cWbP6WbgWKjqyAv3D+YHRQIPNUvAg//e9LXEviDAPvztdWeNsETDwtfT4Vh1
 4BPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tnlDch3t3FkKDJqfHzh2a/y8QHemcuTIVsbVvfOu3o=;
 b=gqBRqmU0LtAo0EUO02qWHCJYILCWumo7jY38d+1JdJkPKSZsrihobFN1HTtZY2nzZC
 Cljs7NKBAJ0ux8XMq1OaYj2WaZdhBo6FUj7DdcMcULgxBX2LcDUKhi/mo7/lJpzs9+cf
 Ep2i2Ysfa53TC4tQQgYhVUNtrrP3xBLAkxWZXFIZsqXLqh3mQABCLX7EzKnzndbgUaxt
 IV4X4CT5ZrzwXtuG2t3NjJosjdi6YysP1gpxhXGEHjwV7T8lvA09TBIbvx1zDQBffPmx
 +z+tN575eKrayubkQoYThx+GZjC1I/q+rdMq/gp4mqp2oaK+QVUpjYGU6C6RSn9zQHGm
 8llw==
X-Gm-Message-State: AOAM531WxV1coWE7RVsMugcHYQy25KMKnNSexLedUokWZTShQvEaq/c/
 gGAYV5FaztDz0fkYq30FhOZy4fJ15di4/o8tVBdVTg==
X-Received: by 2002:a4a:9528:: with SMTP id m37mr27956501ooi.85.1593098023221; 
 Thu, 25 Jun 2020 08:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-5-eric.auger@redhat.com>
In-Reply-To: <20200611161500.23580-5-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 16:13:32 +0100
Message-ID: <CAFEAcA9BR4KJQP-M5QswYkWAmTy5OsAdOa6wF3oPMa_EbeBXPg@mail.gmail.com>
Subject: Re: [PATCH RESEND 4/9] hw/arm/smmu: Introduce SMMUTLBEntry for PTW
 and IOTLB value
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7r5rAIOvdBG9

On Thu, 11 Jun 2020 at 17:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> Introduce a specialized SMMUTLBEntry to store the result of
> the PTW and cache in the IOTLB. This structure extends the
> generic IOMMUTLBEntry struct with the level of the entry and
> the granule size.
>
> Those latter will be useful when implementing range invalidation.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  include/hw/arm/smmu-common.h | 14 +++++++++++---
>  hw/arm/smmu-common.c         | 30 ++++++++++++++++--------------
>  hw/arm/smmuv3.c              | 10 +++++-----
>  3 files changed, 32 insertions(+), 22 deletions(-)
>
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 7b9d2f0eb7..f6ee78e16c 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -52,6 +52,14 @@ typedef struct SMMUTransTableInfo {
>      uint8_t granule_sz;        /* granule page shift */
>  } SMMUTransTableInfo;
>
> +struct SMMUTLBEntry {
> +    IOMMUTLBEntry entry;
> +    uint8_t level;
> +    uint8_t granule;
> +};
> +
> +typedef struct SMMUTLBEntry SMMUTLBEntry;

Every other typedef in this header uses
  typedef struct Foo {
      ...
  } Foo;

rather than a separate typedef line; could we be consistent with that?

> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 3101043540..aa88b62efb 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -47,11 +47,11 @@ uint64_t smmu_get_iotlb_key(uint16_t asid, uint64_t iova)
>      return iova >> 12 | (uint64_t)(asid) << SMMU_IOTLB_ASID_SHIFT;
>  }
>
> -IOMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
> +SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>                                   hwaddr iova)

Indent on this second line needs to move in one space now.

>  {
>      uint64_t key = smmu_get_iotlb_key(cfg->asid, iova);
> -    IOMMUTLBEntry *entry = g_hash_table_lookup(bs->iotlb, &key);
> +    SMMUTLBEntry *entry = g_hash_table_lookup(bs->iotlb, &key);
>
>      if (entry) {
>          cfg->iotlb_hits++;

> @@ -303,7 +305,7 @@ error:
>   * return 0 on success
>   */
>  inline int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> -             IOMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +             SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)

might as well fix this indent while we're editing the line...


>  {
>      if (!cfg->aa64) {
>          /*

otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
