Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp54654lff;
        Wed, 4 Aug 2021 11:11:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOJVzeaOn6hCFuxPPcWE9xPtKWVDbZmzqOdn/4jCV5gHH3ooUQbd6ElV+VcNsWIbmD8f9E
X-Received: by 2002:a05:6102:a2e:: with SMTP id 14mr1297392vsb.47.1628100675095;
        Wed, 04 Aug 2021 11:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628100675; cv=none;
        d=google.com; s=arc-20160816;
        b=y39keSwvF1fL4IH2lP6sVj9vqvqDUOQZUVnv8HljaTsypoL56xnRSKq/zNSA0EixpH
         /bexSwA4fCEGtMBTU16jX+ZWOsVcmZTDQGSJOIncqmyeKsdZNOHt7tPyH8pCVFB7TCP9
         LXF9BheBTjnjmy8KMYK13xLzT5zosBEBAhX3U4mYETW6ctw12Y+dg+VLiYepV3ZYJzuz
         1kWMbyJtCQY/cc9vGiZVf3P4dPETxdTK5x7uT+1j/uWo8MSKV3npx66BVL0Hi9UD+y/7
         NwKARw8QfTBTUnRxUTN/5KIcq8EVIKcE4ToLMJlCUhpGdCg9+lR9G8COOIKIFsV0QNGR
         w1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GyWXuO04ZEfjFluj7tiRsdXaqPipWmcwBUfHogVSjW8=;
        b=o90F9rYzqmDj3AxKQ3y0oTaP/uMe2imMtOT3Vmk0lfnhNy/Atx/vEjuMuqHLK4zR/V
         b3Ovgfw6MnOWO8ouZcPFkOxtU9ma2K/ExuQxgVmN55RN5ZB/OrfoX2eTCwsdhNgth3IW
         NFmLumHHjCCG9jsAACKMNo4RdykYo5uBe5/YLdtFuhjI65g1BDRymPJsI2cLiNIqqkV/
         7NmrHk0hwHTt9+8mwD+MlUQC36L3s3cXBH/EymRZe6qYA/SLvTfs1AA7fMmYgBSXcNio
         PVful2+RVrWI3RAmao0neQbMvDMABSjM9KOKvPqqa+WDt3893aMOZ21MeAN1ZpO9z9Ec
         DOeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XhnJqAt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16si1616170uar.51.2021.08.04.11.11.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Aug 2021 11:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XhnJqAt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBLMI-00017q-C0
	for alex.bennee@linaro.org; Wed, 04 Aug 2021 14:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mBK1V-0000Bf-Q6
 for qemu-arm@nongnu.org; Wed, 04 Aug 2021 12:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mBK1L-0007WL-Es
 for qemu-arm@nongnu.org; Wed, 04 Aug 2021 12:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628095527;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyWXuO04ZEfjFluj7tiRsdXaqPipWmcwBUfHogVSjW8=;
 b=XhnJqAt9dYJRcLRwgFcQRP/eoDEwUPebaAvfF/kPEYct0tf5YpVJQGJwc54MsppsRUD+ff
 G9LHyDQ+LygvGEllqBrJ1DMPxynkvUceP/2enhcIS1kb/F7rnCaZgS2b1/reON/VfLunE5
 cWJqhIjRkdqg7f7kGFill6LHzR6+r0A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-uDzNpLAYOTuOxD3sgUpj0g-1; Wed, 04 Aug 2021 12:45:26 -0400
X-MC-Unique: uDzNpLAYOTuOxD3sgUpj0g-1
Received: by mail-wm1-f71.google.com with SMTP id
 a197-20020a1c98ce0000b029025831695a2eso454855wme.4
 for <qemu-arm@nongnu.org>; Wed, 04 Aug 2021 09:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=GyWXuO04ZEfjFluj7tiRsdXaqPipWmcwBUfHogVSjW8=;
 b=Jju2KjWqWYsAYAmCegINe+uzAWcPvWgJLp+uBxSh1Kfkk5bB4YR6wgcCgrE+58MXbx
 7Cp/GkaLp/rK7izF9z5vd/dk+mJWtGb8qZjxwLOOE4HYNY60P6zt44OLAT0S0yY7pDoI
 iCvQFzyBZ35p3hamhoYboYbOW4UF9haSYD07HUNh2QbhJ9RBaFH69PMvtUUi+jiDQCb8
 dVZzm3/084gtPFyKrWKr79+t/Xp5baGVKpvZ2tvdkMrAKQh9GuQZ/C1EYk9wGYuHKW5E
 zx1XHiZ2++lBEltxc1eK16avHsE/V4Rol2W7xn5a8+oDA7786eO8Bn7VarDaGxpF51hQ
 JVxQ==
X-Gm-Message-State: AOAM533ISSH4cE/uPuBND3QAlpqY7gqrZAQ4tBNsvRbktyF0Ji7iJp2f
 ugwO7fiq3RY9xxc1JTqz+mfm+xw520jEqFNmMbQp83HM/UzVqGGQ865eNUtoiFeKKkQDxh0oGTA
 4S3ctdMZeJSHlVAqu8JwofZaNnNRgS5VMp9Ah7esqbsXYyXbQdbKSSYWkT1KvhBgA8mc=
X-Received: by 2002:a1c:7509:: with SMTP id o9mr537986wmc.32.1628095524702;
 Wed, 04 Aug 2021 09:45:24 -0700 (PDT)
X-Received: by 2002:a1c:7509:: with SMTP id o9mr537961wmc.32.1628095524422;
 Wed, 04 Aug 2021 09:45:24 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id t8sm3408137wmj.5.2021.08.04.09.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 09:45:23 -0700 (PDT)
Subject: Re: [PATCH 1/1] hw/arm/smmu: Add access flag handling
To: Joe Komlodi <joe.komlodi@xilinx.com>, qemu-devel@nongnu.org
References: <1627687022-366528-1-git-send-email-joe.komlodi@xilinx.com>
 <1627687022-366528-2-git-send-email-joe.komlodi@xilinx.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <0931b4da-a8e2-ba61-e759-9855ff64b137@redhat.com>
Date: Wed, 4 Aug 2021 18:45:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1627687022-366528-2-git-send-email-joe.komlodi@xilinx.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SpMRUGUUeRY3

Hi Joe,

On 7/31/21 1:17 AM, Joe Komlodi wrote:
> The SMMU should access fault if AF == 0 in a TTD, and if AFFD == 0 in the CD.
>
> Per the spec, an access fault has a higher priority over a permission fault.
> For instance, a write to a writable clean (temporarily non-writable) page with
> AF == 0 && AFFD == 0 will cause an access fault.
> If AF == 1 in this situation, then a permission fault would occur.
>
> Access flag handling is more complicated if HTTU is supported and HA != 0 in
> the CD, however we currently do not support HTTU.
>
> Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
> ---
>  hw/arm/smmu-common.c         | 7 +++++++
>  hw/arm/smmu-internal.h       | 8 ++++++++
>  hw/arm/smmuv3-internal.h     | 1 +
>  hw/arm/smmuv3.c              | 1 +
>  include/hw/arm/smmu-common.h | 1 +
>  5 files changed, 18 insertions(+)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 0459850..0fcc65c 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -305,6 +305,7 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
>          uint64_t pte, gpa;
>          dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>          uint8_t ap;
> +        bool af;
>  
>          if (get_pte(baseaddr, offset, &pte, info)) {
>                  goto error;
> @@ -341,6 +342,12 @@ static int smmu_ptw_64(SMMUTransCfg *cfg,
>                                       pte_addr, pte, iova, gpa,
>                                       block_size >> 20);
>          }
> +        af = PTE_AF(pte);
> +        if (is_access_fault(af, perm)) {
I don't get the perm argument here.
 
Below there is this macro definition

+#define is_access_fault(af, cfg) \
+    (!cfg->affd && !af)

Thanks

Eric

> +            info->type = SMMU_PTW_ERR_ACCESS;
> +            goto error;
> +        }
> +
>          ap = PTE_AP(pte);
>          if (is_permission_fault(ap, perm)) {
>              info->type = SMMU_PTW_ERR_PERMISSION;
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index 2d75b31..9d3b22c 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -58,6 +58,11 @@
>      ((level == 3) &&                                                    \
>       ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_L3_PTE_TYPE_PAGE))
>  
> +/* access flag */
> +
> +#define PTE_AF(pte) \
> +    (extract64(pte, 10, 1))
> +
>  /* access permissions */
>  
>  #define PTE_AP(pte) \
> @@ -66,6 +71,9 @@
>  #define PTE_APTABLE(pte) \
>      (extract64(pte, 61, 2))
>  
> +#define is_access_fault(af, cfg) \
> +    (!cfg->affd && !af)
> +
>  /*
>   * TODO: At the moment all transactions are considered as privileged (EL1)
>   * as IOMMU translation callback does not pass user/priv attributes.
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index d1885ae..0ccad1d 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -587,6 +587,7 @@ static inline int pa_range(STE *ste)
>  #define CD_EPD(x, sel)   extract32((x)->word[0], (16 * (sel)) + 14, 1)
>  #define CD_ENDI(x)       extract32((x)->word[0], 15, 1)
>  #define CD_IPS(x)        extract32((x)->word[1], 0 , 3)
> +#define CD_AFFD(x)       extract32((x)->word[1], 3 , 1)
>  #define CD_TBI(x)        extract32((x)->word[1], 6 , 2)
>  #define CD_HD(x)         extract32((x)->word[1], 10 , 1)
>  #define CD_HA(x)         extract32((x)->word[1], 11 , 1)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 01b60be..df5a194 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -483,6 +483,7 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>      cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
>      cfg->tbi = CD_TBI(cd);
>      cfg->asid = CD_ASID(cd);
> +    cfg->affd = CD_AFFD(cd);
>  
>      trace_smmuv3_decode_cd(cfg->oas);
>  
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 706be3c..b0e82ad 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -71,6 +71,7 @@ typedef struct SMMUTransCfg {
>      bool disabled;             /* smmu is disabled */
>      bool bypassed;             /* translation is bypassed */
>      bool aborted;              /* translation is aborted */
> +    bool affd;                 /* Access Flag Fault Disabled */
>      uint64_t ttb;              /* TT base address */
>      uint8_t oas;               /* output address width */
>      uint8_t tbi;               /* Top Byte Ignore */

