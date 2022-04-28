Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1553471lfu;
        Thu, 28 Apr 2022 00:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn0/kx/8wcBvPYuCfeDnttrnEKJyUO7/PokKTuup9DbUdTveuXG4h/5YBQA1XnvCsOloEb
X-Received: by 2002:a05:620a:69c:b0:69e:b200:d929 with SMTP id f28-20020a05620a069c00b0069eb200d929mr19043805qkh.722.1651132675605;
        Thu, 28 Apr 2022 00:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651132675; cv=none;
        d=google.com; s=arc-20160816;
        b=HYNJRI78VtjRcKn7AF3+CwYdEfPmapAy91Intlri0yhpaVFqzKKZudcgs66ttSZRar
         +vm65FoaB8/P1TdKwhC98K23XTiVWSoYijbuXO5FwnCy7MLzCYsTOvY9WR/YHbScmDr5
         13R4qioutrRHbmIz+yIai+HLP9QwIjPWzmMkbk9Jp6db68c/tc9g09dfm2GxsTdjqJyq
         mGQPv10ElTOyzo3opkPbcbLjgljIpituTyMcVjt9LpyWlAbIhw6Xx3RpEInXYYKsXnJy
         Dvh6lKE71swA4VbVvCoyXfaPkZfCrjAueD0MPPig69fMVarWcsxwblBlgLYNSLjP8ms6
         IEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=x2Vc1B7ycdjerUtqsdh74YcYfas9ITL6yK9Ldu4kCEI=;
        b=LtJGUTETB4O/9w6lwK5lm2MxqnBQySkSWU79ReoMor4NzP81VfiYjNWosdpaT1mKVK
         5cE/3Ibe/tLjnFT4DdB32gXaIydRhmc5ICI/a4N6xDlFApMWdhi1Pqhq3ZcdrqWJbxMg
         zwJGBR1gT5SseoxIZbCMSc83BWW8aZZsT4K43vtpVDC+1dUAu1EeQ9ATCFoBLjd5XHvo
         MKIMogtfq3Gup7BAMqPKW+lEYQFX87CMLufnzwqg7DxcmrjMn0mfkJpAI++bvkADUs8l
         XY+WyZT7Z+bX/wZQ1LlnBRnCmsY9aVix6B4oZtTtKyMtxr6mI/XrVITXz86k/xjnBTOW
         W2eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P0Js3GGi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13-20020ac85b8d000000b002f36b64966csi1460695qta.388.2022.04.28.00.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 00:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P0Js3GGi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njz2B-0005ct-27
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 03:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njylf-0004C1-6V
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 03:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njylZ-0003Oo-UW
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 03:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651131644;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2Vc1B7ycdjerUtqsdh74YcYfas9ITL6yK9Ldu4kCEI=;
 b=P0Js3GGi8+/03K3rkXk0992dJs5X56MEyJ1mwt+by15sLuVc34TBa7M4zBQC64lAEZalwk
 uOXdf2smvzf0ejSmCYf6xKWppOoKU5112m0KwK6pQG4KE7fevU0+6RSyaT5p83pcUKy2Se
 OABWJJZZNnHxNhqq0yUl1B8sMd1bbUE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-sujbEyKOPcKCBE6-GEEYBw-1; Thu, 28 Apr 2022 03:40:43 -0400
X-MC-Unique: sujbEyKOPcKCBE6-GEEYBw-1
Received: by mail-qk1-f197.google.com with SMTP id
 bl27-20020a05620a1a9b00b0069994eeb30cso2712505qkb.11
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 00:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x2Vc1B7ycdjerUtqsdh74YcYfas9ITL6yK9Ldu4kCEI=;
 b=Aq1wFoQpW9hrYoh4zKn7UfVB4hRmD+mUrfShgG8/kd92JUfzUic2zr6w+FfRtrujQN
 rWlfKmxdwckwqG5D7p81MJycXFmCxfDeHuuxRf/lefY7AT7LiyV2gTxY0Xj5vgH7Tpm6
 EetTztBez78BT5yp2POHVj9kVT7u579qa50Aswrz9G2ChjHRv1Ad8ysgw3nxaObcZkff
 9YfFZe+pd5k+XlEoUrpsoflitxYpZiB60taxwg/EE+rZjCBUIaxQDt5jgIWCg39OG0it
 0zRvYHz88RoEGAcRm0EK2847Fw09/urxccA5tXjV/W0tEgqWvmwPfXQnZAQPHxkX/b1l
 7VVA==
X-Gm-Message-State: AOAM531irmuMOnFXO+6cj7M7B+buVhG8skYUKHyWSe+Sxc74rWvbh5V1
 F2mLD0tAAbR7Bc0IX4JMNsixSurawI+Cc7RwYI5JKuK0CA4z7vPyPoVGMt33upiEF5LVAHCFxUY
 xxStj4wXfcyIC
X-Received: by 2002:a05:6214:caf:b0:456:4027:90ee with SMTP id
 s15-20020a0562140caf00b00456402790eemr11125572qvs.35.1651131642759; 
 Thu, 28 Apr 2022 00:40:42 -0700 (PDT)
X-Received: by 2002:a05:6214:caf:b0:456:4027:90ee with SMTP id
 s15-20020a0562140caf00b00456402790eemr11125551qvs.35.1651131642374; 
 Thu, 28 Apr 2022 00:40:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a05622a15c100b002f373d233d3sm5228803qty.71.2022.04.28.00.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:40:41 -0700 (PDT)
Message-ID: <1f0cfaef-8b75-b13f-7713-d945cab6cbbb@redhat.com>
Date: Thu, 28 Apr 2022 09:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] hw/arm/smmuv3: Cache event fault record
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220427111543.124620-1-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220427111543.124620-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nM8Zh13xuY/S

Hi Jean,

On 4/27/22 13:15, Jean-Philippe Brucker wrote:
> The Record bit in the Context Descriptor tells the SMMU to report fault
> events to the event queue. Since we don't cache the Record bit at the
> moment, access faults from a cached Context Descriptor are never
> reported. Store the Record bit in the cached SMMUTransCfg.
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
>
> Fixes: 9bde7f0674fe ("hw/arm/smmuv3: Implement translate callback")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/smmuv3-internal.h     |  1 -
>  include/hw/arm/smmu-common.h |  1 +
>  hw/arm/smmuv3.c              | 14 +++++++-------
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index d1885ae3f2..6de52bbf4d 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -387,7 +387,6 @@ typedef struct SMMUEventInfo {
>      SMMUEventType type;
>      uint32_t sid;
>      bool recorded;
> -    bool record_trans_faults;
>      bool inval_ste_allowed;
>      union {
>          struct {
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 706be3c6d0..21e62342e9 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -71,6 +71,7 @@ typedef struct SMMUTransCfg {
>      bool disabled;             /* smmu is disabled */
>      bool bypassed;             /* translation is bypassed */
>      bool aborted;              /* translation is aborted */
> +    bool record_faults;        /* record fault events */
>      uint64_t ttb;              /* TT base address */
>      uint8_t oas;               /* output address width */
>      uint8_t tbi;               /* Top Byte Ignore */
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 707eb430c2..8b1d8103dc 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -527,7 +527,7 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>          trace_smmuv3_decode_cd_tt(i, tt->tsz, tt->ttb, tt->granule_sz, tt->had);
>      }
>  
> -    event->record_trans_faults = CD_R(cd);
> +    cfg->record_faults = CD_R(cd);
>  
>      return 0;
>  
> @@ -680,7 +680,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>  
>      tt = select_tt(cfg, addr);
>      if (!tt) {
> -        if (event.record_trans_faults) {
> +        if (cfg->record_faults) {
>              event.type = SMMU_EVT_F_TRANSLATION;
>              event.u.f_translation.addr = addr;
>              event.u.f_translation.rnw = flag & 0x1;
> @@ -696,7 +696,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      if (cached_entry) {
>          if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
>              status = SMMU_TRANS_ERROR;
> -            if (event.record_trans_faults) {
> +            if (cfg->record_faults) {
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
>                  event.u.f_permission.rnw = flag & 0x1;
> @@ -720,28 +720,28 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>              event.u.f_walk_eabt.addr2 = ptw_info.addr;
>              break;
>          case SMMU_PTW_ERR_TRANSLATION:
> -            if (event.record_trans_faults) {
> +            if (cfg->record_faults) {
>                  event.type = SMMU_EVT_F_TRANSLATION;
>                  event.u.f_translation.addr = addr;
>                  event.u.f_translation.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_ADDR_SIZE:
> -            if (event.record_trans_faults) {
> +            if (cfg->record_faults) {
>                  event.type = SMMU_EVT_F_ADDR_SIZE;
>                  event.u.f_addr_size.addr = addr;
>                  event.u.f_addr_size.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_ACCESS:
> -            if (event.record_trans_faults) {
> +            if (cfg->record_faults) {
>                  event.type = SMMU_EVT_F_ACCESS;
>                  event.u.f_access.addr = addr;
>                  event.u.f_access.rnw = flag & 0x1;
>              }
>              break;
>          case SMMU_PTW_ERR_PERMISSION:
> -            if (event.record_trans_faults) {
> +            if (cfg->record_faults) {
>                  event.type = SMMU_EVT_F_PERMISSION;
>                  event.u.f_permission.addr = addr;
>                  event.u.f_permission.rnw = flag & 0x1;

