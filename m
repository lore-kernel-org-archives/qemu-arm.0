Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2979956ejb;
        Mon, 20 Mar 2023 09:05:58 -0700 (PDT)
X-Google-Smtp-Source: AK7set8oN8cP/gN1BpaIVBpjx9GJZMC8eF9v9nBJ/2UwlhXSME/BRA8bm52lFajGDQwURIledn1T
X-Received: by 2002:ac8:5acf:0:b0:3da:aa9b:105a with SMTP id d15-20020ac85acf000000b003daaa9b105amr19866262qtd.17.1679328358079;
        Mon, 20 Mar 2023 09:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679328358; cv=none;
        d=google.com; s=arc-20160816;
        b=DfOTUt3+6Maix0SxDfGUU1PJZq7fOPeqVT9854od5Fbh0wIM277ZDRQyV/41uCPbXB
         p836bxrqxhekfYQSIIRLPKpRJhtH1E+ptsCrvsMjEv8JdOjML2eF3B/FJT4WQ1eoaAmM
         CKy6s8ffFnNoG8or5vqebrjOmA0AzlpQ4PyeSstmMJcByS2kjBGnTNe+olheVCIUtDDF
         tIyov/cg2J0mP0NH1NzcNE/1T5Bju8hr1nqZ0jzax5Cn1t6uxonQ55OJRGgmz0zxZmUa
         jtFCDVCupj+2iAX6sRMllWBRmJH96C2oMjbr5MbWHkRy6FmLEBMrJNSehIJh/qH2MzOU
         KTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sUMv9A7RNpRYk7oPygg+/jkNCczRL3lw9XXXmM/bsQg=;
        b=PqopYXzttBsQDgpXrnt2Xd06lmDfYDEJrRKjrvuBrm7wcQG7wzOxefrSqu6ZrDkdML
         guq+boN9wXkCAmG/g9nuZRjiAm3m0KUv/0Umd2qT5+SwWwihRBNQgirZn5G9Wq8NjEhL
         +9ySFhMtam+//2GshwiUxYKUckO8EVHhStlDqCEXlq5mcFWUjlgqRyvUyIbVBe+/pwN6
         PKIwHrgAchXOTqbkzQukO3aU0uNtwxgyaXxbrJjXSZ7+yn+HElbRN2JWtA4+Sm7Fd+M6
         Ue43MGAm+CaU+VWPBZajJ3TKziURqCXIlaLJbedvnGXbIdq7ImLdMP756gwKQJK3+mZR
         zRWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mn8K5Efg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j64-20020a378743000000b0073ba8b5869fsi5851413qkd.706.2023.03.20.09.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Mar 2023 09:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mn8K5Efg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peI0z-000801-3f; Mon, 20 Mar 2023 12:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peI0w-0007tW-Ud
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 12:05:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1peI0v-000265-B3
 for qemu-arm@nongnu.org; Mon, 20 Mar 2023 12:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679328336;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUMv9A7RNpRYk7oPygg+/jkNCczRL3lw9XXXmM/bsQg=;
 b=Mn8K5EfgsOpMx+OhIp/pF7HtCEtrtNSHCv2r+fnSVJfE6WotUymJBlaAO977zNI0ayuQ7f
 YEzV56ngJUuGsAl4Rh3rJIRuun6HTF61OK864LKPvCh4FTAWsu1t3s48ZKBo6MKah3J+jI
 7Uo72Ek+PAPu8hmQYYN5aj8O1XkYAkY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-kkcEr428Pd-PBLWRGA9JXw-1; Mon, 20 Mar 2023 12:05:35 -0400
X-MC-Unique: kkcEr428Pd-PBLWRGA9JXw-1
Received: by mail-wm1-f69.google.com with SMTP id
 u6-20020a05600c19c600b003ed7cb98a8dso3572305wmq.9
 for <qemu-arm@nongnu.org>; Mon, 20 Mar 2023 09:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679328334;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sUMv9A7RNpRYk7oPygg+/jkNCczRL3lw9XXXmM/bsQg=;
 b=t6kFaoohySu1VUY39VGhpWgIQZzikqRdulXzhF7mTr0QdsURVUUI0E+7aX9vcYeL5b
 P18hLxUo+oIHh/Pjzm64rPee5h3FUGeUoQ6tBgItFqTmP48qdd6JoPnxQfa2T2E02+Qc
 EpTeIX1rNCXLJ90zMRsrLzs/BQchzjMxI0jhM5KGZDbfyW7MEb0qw0jr93HnNi0/XFdy
 9I5pqWoUZwgaP3Bwprou+0lPs+WnKYAZkb8GaZmT7ry6vyHk6IhX9WyyXYVkAUUb3TrF
 2RyuLHd6qOCZvvS8qRTSf16Pn6gJR/SWg6SKTs12BAPGeMlOCAwaW7RW8lNuVa1aph4F
 lOfg==
X-Gm-Message-State: AO0yUKX6iOEZNAC1XdxpeqZxbhMxXxOCx8sL1m6Pb3xiAhsMBUHoETz2
 Ojx6tNO7h3SUenNAh7rfjy682wSObAlj1XfccBylK0vFbI94D782cTKed/p+wULPL2HcHeW7/MN
 Lx+WXwydaq7JM
X-Received: by 2002:a5d:5955:0:b0:2cf:e29f:d7f5 with SMTP id
 e21-20020a5d5955000000b002cfe29fd7f5mr13106317wri.25.1679328334013; 
 Mon, 20 Mar 2023 09:05:34 -0700 (PDT)
X-Received: by 2002:a5d:5955:0:b0:2cf:e29f:d7f5 with SMTP id
 e21-20020a5d5955000000b002cfe29fd7f5mr13106292wri.25.1679328333658; 
 Mon, 20 Mar 2023 09:05:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4481000000b002d2033ec465sm9249725wrq.36.2023.03.20.09.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:05:33 -0700 (PDT)
Message-ID: <45961bdc-cd3a-c35a-8f10-bb9a52dd2e33@redhat.com>
Date: Mon, 20 Mar 2023 17:05:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 06/11] hw/arm/smmuv3: Make TLB lookup work for
 stage-2
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-7-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230226220650.1480786-7-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K/tmgb5LJ44s

Hi Mostafa,

On 2/26/23 23:06, Mostafa Saleh wrote:
> Right now, either stage-1 or stage-2 are supported, this simplifies
> how we can deal with TLBs.
> This patch makes TLB lookup work if stage-2 is enabled instead of
> stage-1.
> TLB lookup is done before a PTW, if a valid entry is found we won't
> do the PTW.
> To be able to do TLB lookup, we need the correct tagging info, as
> granularity and input size, so we get this based on the supported
> translation stage. The TLB entries are added correctly from each
> stage PTW.
>
> When nested translation is supported, this would need to change, for
> example if we go with a combined TLB implementation, we would need to
> use the min of the granularities in TLB.
>
> As stage-2 shouldn't be tagged by ASID, it will be set to -1 if S1P
> is not enabled.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> Changes in v2:
> - check if S1 is enabled(not supported) when reading S1 TT.
> ---
>  hw/arm/smmuv3.c | 45 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 34 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index dc74a5442d..ce193e9598 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -697,6 +697,9 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>      STE ste;
>      CD cd;
>  
> +    /* ASID defaults to -1 (if s1 is not supported). */
> +    cfg->asid = -1;
> +
>      ret = smmu_find_ste(s, sid, &ste, event);
>      if (ret) {
>          return ret;
> @@ -787,6 +790,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      SMMUTLBEntry *cached_entry = NULL;
>      SMMUTransTableInfo *tt;
>      SMMUTransCfg *cfg = NULL;
> +    uint8_t granule_sz, tsz;
>      IOMMUTLBEntry entry = {
>          .target_as = &address_space_memory,
>          .iova = addr,
> @@ -822,21 +826,40 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          goto epilogue;
>      }
>  
> -    tt = select_tt(cfg, addr);
> -    if (!tt) {
> -        if (cfg->record_faults) {
> -            event.type = SMMU_EVT_F_TRANSLATION;
> -            event.u.f_translation.addr = addr;
> -            event.u.f_translation.rnw = flag & 0x1;
> +    if (cfg->stage == 1) {
> +        /* Select stage1 translation table. */
> +        tt = select_tt(cfg, addr);
> +        if (!tt) {
> +            if (cfg->record_faults) {
> +                event.type = SMMU_EVT_F_TRANSLATION;
> +                event.u.f_translation.addr = addr;
> +                event.u.f_translation.rnw = flag & 0x1;
> +            }
> +            status = SMMU_TRANS_ERROR;
> +            goto epilogue;
>          }
> -        status = SMMU_TRANS_ERROR;
> -        goto epilogue;
> -    }
> +        granule_sz = tt->granule_sz;
> +        tsz = tt->tsz;
>  
> -    page_mask = (1ULL << (tt->granule_sz)) - 1;
> +    } else {
> +        /* Stage2. */
> +        granule_sz = cfg->s2cfg.granule_sz;
> +        tsz = cfg->s2cfg.tsz;
> +    }
> +    /*
> +     * TLB lookup looks for granule and input size for a translation stage,
> +     * as only one stage is supported right now, choose the right values
> +     * from the configuration.
> +     */
> +    page_mask = (1ULL << granule_sz) - 1;
>      aligned_addr = addr & ~page_mask;
>  
> -    cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
> +    SMMUTransTableInfo temp = {
Move the declaration at the top. Also rename temp into tt to be more
explicit about what it is?
> +        .granule_sz = granule_sz,
> +        .tsz = tsz,
> +    };
> +
> +    cached_entry = smmu_iotlb_lookup(bs, cfg, &temp, aligned_addr);
>      if (cached_entry) {
>          if ((flag & IOMMU_WO) && !(cached_entry->entry.perm & IOMMU_WO)) {
>              status = SMMU_TRANS_ERROR;
Besides, looks good to me

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

