Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5105300lfb;
        Tue, 31 Aug 2021 07:47:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJyf6kjIdrpY8wUdj/E4jkwzw9lvWnocDxvUHSYJPlp1XkNckvkIw/kDRUkRs6h0mOBR5f
X-Received: by 2002:a1f:2715:: with SMTP id n21mr17754802vkn.17.1630421235488;
        Tue, 31 Aug 2021 07:47:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630421235; cv=none;
        d=google.com; s=arc-20160816;
        b=dc2kGLhe6EYMYVORfCLOgPDYFRP5AHkCXLfOILYEjRxYDkvP+CqKHJgQ7W1pE3uY4t
         qfsF9odz3w5tk6xTS044NsYeQZPuVNbwrfJZJlOQYwOgcPGxoS4a9toNrB2oUuwD2BYs
         rx+2YAIt8M3k6Mg1BrfcvVUZVTseVCns9lZRPd6PGoPmKdheK/oueBsl0Nayj8+v+7tu
         MMEsyFMlaRJ/9OZ9YHBM3Gwqlffv6ZUlI6gM1taGTnSq0ZNYIDh0B1wx8cDUhHDLcHbl
         VFUBY4qgOZo9DNK0VFWRJ8YcEN487B04GPSXuLXEFHbSL7vGPwESvEZ1NxKDRbqIzMTB
         wQXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NH+y0otVJ9gmIyVkrddHEbZLJjRgx7PdnT3LMRoKqVs=;
        b=ySgrrRFEJGYDGE6PGO4ajpok8grapfs9cLtrkV0MmcB75dB1sOoSaY+bNWce0bvbEw
         11tOI7yICSCcU8UhKLIpGNBN/3b5DhNFR/Xdcqvk4TZ00COtJalXkp0KGZ8dxOOtkpsL
         qqBu/opBhXHda8kfnu3Wunlw3r8vxwavGLHxYnJrkoRcdgtCtYQMJxTGmyzV3VWF+hpL
         Aml9gZuNkNs6CupIgjGjv0N8HtNRwmhLaQUDHoc6q7/BLNYVeB++XjUuVsuHXS0cTi9n
         K4U3rGPIWNbRP+gJ2MOHkCtxu69mF0eqCl4mQ/i6jn6Pb1WKN1nQ826HGRgbXoj/TW43
         b4oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b3kZYzZw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si7248783uas.35.2021.08.31.07.47.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 07:47:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b3kZYzZw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mL52g-0004a8-Os
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 10:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL525-0004YN-PD
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 10:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mL522-0001fk-Qy
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 10:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630421193;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NH+y0otVJ9gmIyVkrddHEbZLJjRgx7PdnT3LMRoKqVs=;
 b=b3kZYzZw9CoSlYNGBoohEt/LUvNYc4pS6WRqrYI+/+cVh2yTzBEOJKtFBQBgTZ+R/huKJ+
 yKrIMpU7gMtWICdpzRzl0SLIi631Z9C0ixOPknsMrtrF4KZPUNcOBTxyAiWzZGYoTVKCGu
 ugaKtFWWjff571HxkVs0wQ7bqK4toOM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-SGknxmikO-iuPa91OKKymA-1; Tue, 31 Aug 2021 10:46:32 -0400
X-MC-Unique: SGknxmikO-iuPa91OKKymA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m16-20020a7bca50000000b002ee5287d4bfso1420547wml.7
 for <qemu-arm@nongnu.org>; Tue, 31 Aug 2021 07:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NH+y0otVJ9gmIyVkrddHEbZLJjRgx7PdnT3LMRoKqVs=;
 b=XLWp15qkvjPgERUOicOmRiJXniv430A+v6LN29H4l2RkqBGLX8E69YgRdOMBn1MDto
 nYCdgkxGNq9HDvhuVGKMp63WQe9bUu5toobl3cat2qP29LW3RsxCLVwVvjoAQwn/Aq7H
 X/1SGi5AOKq1vOMyoojTUK9Phcunsg+2dHzd9XRvGXuBSk8xTctErAWJURHDddSf8RgA
 PK3xbha1KC+GAv7mczxEsV3sjgTj6NskohwZIzSh6fJttBdqNgkCNpe0BzCEe8uzBASC
 4DjN2u+L2vBAiz5yIedJNMiE7YHlJcfDh8t9v9lwUgdB8WgLiiwsO6XN3/ckw872nmFr
 I5Ww==
X-Gm-Message-State: AOAM5332P5+cuzBNT8mFkwDraG/uVq7xcrRJMCFEq7BMWjFELORukyNL
 XNC/Ekkn8OVSShGAgbZk6EJO4jjwU0rbacAUaz3/1I0H7reA9GslO7W1SVvCdGzzkj0wVbpAVKp
 +XgFJjYhiC5OL
X-Received: by 2002:adf:9e08:: with SMTP id u8mr14751932wre.383.1630421191156; 
 Tue, 31 Aug 2021 07:46:31 -0700 (PDT)
X-Received: by 2002:adf:9e08:: with SMTP id u8mr14751900wre.383.1630421190920; 
 Tue, 31 Aug 2021 07:46:30 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id z2sm2795356wma.45.2021.08.31.07.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 07:46:30 -0700 (PDT)
Subject: Re: [PATCH v2] hw/arm/smmuv3: Simplify range invalidation
To: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6E9940@SHASXM03.verisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <1805dcb3-6f99-0bf1-2d73-be0537c98512@redhat.com>
Date: Tue, 31 Aug 2021 16:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4FA89A717CD8094DBA0FE20FA5F98EAA010E6E9940@SHASXM03.verisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Knb6JCe8U4Fn

Hi Liu,

On 8/23/21 9:50 AM, Liu, Renwei wrote:
> Simplify range invalidation which can avoid to iterate over all
> iotlb entries multi-times. For instance invalidations patterns like
> "invalidate 32 4kB pages starting from 0xffacd000" need to iterate over
> all iotlb entries 6 times (num_pages: 1, 2, 16, 8, 4, 1). It only needs
> to iterate over all iotlb entries once with new implementation.

This wouldn't work. This reverts commit
6d9cd115b9df ("hw/arm/smmuv3: Enforce invalidation on a power of two range")
which is mandated for VFIO and virtio to work. IOTLB invalidations must
be naturally aligned and with a power of 2 range, hence this iteration.

Thanks

Eric
>
> Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
> ---
> v2:
>  - Remove file mode change.
>
>  hw/arm/smmu-common.c   |  6 +++---
>  hw/arm/smmu-internal.h |  2 +-
>  hw/arm/smmuv3.c        | 22 ++++------------------
>  3 files changed, 8 insertions(+), 22 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 0459850a93..ccb085f83c 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -142,8 +142,8 @@ static gboolean smmu_hash_remove_by_asid_iova(gpointer key, gpointer value,
>      if (info->asid >= 0 && info->asid != SMMU_IOTLB_ASID(iotlb_key)) {
>          return false;
>      }
> -    return ((info->iova & ~entry->addr_mask) == entry->iova) ||
> -           ((entry->iova & ~info->mask) == info->iova);
> +    return (entry->iova >= info->iova) &&
> +           ((entry->iova + entry->addr_mask) < (info->iova + info->range));
>  }
>  
>  inline void
> @@ -167,7 +167,7 @@ smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>  
>      SMMUIOTLBPageInvInfo info = {
>          .asid = asid, .iova = iova,
> -        .mask = (num_pages * 1 << granule) - 1};
> +        .range = num_pages * 1 << granule};
>  
>      g_hash_table_foreach_remove(s->iotlb,
>                                  smmu_hash_remove_by_asid_iova,
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index 2d75b31953..f0e3a777af 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -101,7 +101,7 @@ uint64_t iova_level_offset(uint64_t iova, int inputsize,
>  typedef struct SMMUIOTLBPageInvInfo {
>      int asid;
>      uint64_t iova;
> -    uint64_t mask;
> +    uint64_t range;
>  } SMMUIOTLBPageInvInfo;
>  
>  typedef struct SMMUSIDRange {
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 01b60bee49..0b009107d1 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -857,7 +857,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
>  
>  static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>  {
> -    dma_addr_t end, addr = CMD_ADDR(cmd);
> +    dma_addr_t addr = CMD_ADDR(cmd);
>      uint8_t type = CMD_TYPE(cmd);
>      uint16_t vmid = CMD_VMID(cmd);
>      uint8_t scale = CMD_SCALE(cmd);
> @@ -866,7 +866,6 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>      bool leaf = CMD_LEAF(cmd);
>      uint8_t tg = CMD_TG(cmd);
>      uint64_t num_pages;
> -    uint8_t granule;
>      int asid = -1;
>  
>      if (type == SMMU_CMD_TLBI_NH_VA) {
> @@ -880,23 +879,10 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>          return;
>      }
>  
> -    /* RIL in use */
> -
>      num_pages = (num + 1) * BIT_ULL(scale);
> -    granule = tg * 2 + 10;
> -
> -    /* Split invalidations into ^2 range invalidations */
> -    end = addr + (num_pages << granule) - 1;
> -
> -    while (addr != end + 1) {
> -        uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
> -
> -        num_pages = (mask + 1) >> granule;
> -        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> -        smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> -        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
> -        addr += mask + 1;
> -    }
> +    trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
> +    smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
> +    smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
>  }
>  
>  static gboolean

