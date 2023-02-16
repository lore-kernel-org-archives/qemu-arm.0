Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp415304ejb;
        Thu, 16 Feb 2023 03:57:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8XLAtcin/o253JqDHNlDsI/xH2QH3Cz9ug7kuyb78g5CzuvvgoLBtPl/vbIfhaK/y+Vf+K
X-Received: by 2002:ac8:5f07:0:b0:3b6:a1c2:f63c with SMTP id x7-20020ac85f07000000b003b6a1c2f63cmr9062368qta.33.1676548673896;
        Thu, 16 Feb 2023 03:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676548673; cv=none;
        d=google.com; s=arc-20160816;
        b=D1paW3LmaUjHoEYw19ipReZmnr7qSjntoYXG08oThLJedaUhclT5F3m/zDnjeLri5y
         eM6nPu1S+CBT7dKMaXPkGXmgY4gpIcsXspBWIwzpzXUTCvTESIcbx64LNgdmN6McMhIN
         rPL8lH3G20G7L25ltgEz3jzITAK2ahfLn6uc4U+/qYR5RxC3HQ8y+Dv60ZUKJNoxFeza
         XQDBctBUzXDzCD0bDIOHh307ef3hdIJp300wQRjVD4Uu+vctjpWpxBbJQ2q9pYOCnKUr
         1LCDIr3Fh2nc8xcYG8woSso3+TOqTfNq7LA5Xlwv4H0HINXw+P6XmGmFdCCz4txbm92R
         k6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qnSewl5Hv1dJ2NRZNJuGLKjQF2/JIyjwP8/rW4Jpoaw=;
        b=B+QQeQWrZ4aZplbfPIw4qf6ND7PV5TLXF6pId+XA0c0nQxBId3GLST9j75OnnX7vwg
         CH6Z800Paefjyi/Gh+Y8vnNpPXiGEW1MejBIftvEbG5LCZ2h3wg6py7pf0scHsVf2aqX
         xlz6gawctwjR8lBoa7E3Iiw84pioyo1FDP5czeUQpBbn6iSnZBzsd6Yt84V/XWHVR3fi
         5OUihjLUk0cnBJSF3sia5OwrJ3fyOSCUPihQArnB9P2Z9iO+CQcCsj0TwnZVAgyGhP9s
         K980qlut2R9oW+Ahxw4klrlWruH5EItm5T7FDmQNhkLcFA8D4vOp9DFZ63g3MgAAgsvX
         x7hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vk9xYM6P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3-20020a376403000000b00706b15a6e8fsi1291576qkb.578.2023.02.16.03.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 03:57:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vk9xYM6P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSctB-000712-C1; Thu, 16 Feb 2023 06:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSct6-00070g-9M
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 06:57:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pSct4-0007Qx-20
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 06:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676548618;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnSewl5Hv1dJ2NRZNJuGLKjQF2/JIyjwP8/rW4Jpoaw=;
 b=Vk9xYM6PKM4wCf4kITqGB7IPB4wLxH6knRNXT6iQqkPPDdN+XOoNgCViIwu7nsoeeJ9oO0
 fC6R+Sectqaw6KcaiVf5rPn1nJZLwrGf3MWXlbK7Khz6vPyZc9wYPP0SOKGeOYwlKmgETu
 xDJvVVFnqLKgyNkuSoaM85L3n4hjNeA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-324-4tp4V9l5N12EOyxxe6J-jg-1; Thu, 16 Feb 2023 06:56:56 -0500
X-MC-Unique: 4tp4V9l5N12EOyxxe6J-jg-1
Received: by mail-qt1-f198.google.com with SMTP id
 p6-20020a05622a048600b003b9a3ab9153so1066132qtx.8
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 03:56:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qnSewl5Hv1dJ2NRZNJuGLKjQF2/JIyjwP8/rW4Jpoaw=;
 b=YJ0AR9bKNJWRCtI7b0PtNghiDpb3M+Skav2QK/19cyd+jfGRTXwlL9P4hHWUBsq/L4
 C34bilMtaB9bbUVJiUHdqokovfUb1/E2enTPgbLbSt8PLdtEZvSZejLZdoi8Y42o3edk
 paoHpi9GvT4RzVwg9wFRCZzV1Mj2L+KHIe7FDqt1Rj79BT7TF1H+cksE6133DZ+3k/K9
 HS41nyxYhWU+1ZJQYVI71SG60CtLW9N/9Bd1jPm1O8fF2fZWlKu+Q89qFFx8CVBdahGu
 zO1eYhVb8Z0JFFs1vj5jjkhxvCQzm4nIIqH/gwQi3wEm3z/DGL+RjG0ZE7wuwRTn3tGm
 2pFA==
X-Gm-Message-State: AO0yUKXXAF0J8pC90TqyPuFmSOk3lsvhAB1GQTUQqlgUM3d9cHDH/JYY
 NF1ud6M6sbDu8dHkyKULpcOeieyiZJcOwdzh5Pf0y3lNBihkEA/DrRXpAjx5QmvH8AbUo5onrGc
 Yox3TcPMxaGy6
X-Received: by 2002:ac8:5fd0:0:b0:3b0:e83e:4331 with SMTP id
 k16-20020ac85fd0000000b003b0e83e4331mr9336427qta.44.1676548616241; 
 Thu, 16 Feb 2023 03:56:56 -0800 (PST)
X-Received: by 2002:ac8:5fd0:0:b0:3b0:e83e:4331 with SMTP id
 k16-20020ac85fd0000000b003b0e83e4331mr9336408qta.44.1676548615923; 
 Thu, 16 Feb 2023 03:56:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 o62-20020a374141000000b0073b676274e7sm1026674qka.94.2023.02.16.03.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 03:56:55 -0800 (PST)
Message-ID: <7ebe5091-54ae-d5a2-09c4-0ae1e8276cb8@redhat.com>
Date: Thu, 16 Feb 2023 12:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 13/16] hw/arm/smmuv3: Add CMDs related to stage 2
To: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-14-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230205094411.793816-14-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: pFGqzK09SGhX

Hi Mostafa,

On 2/5/23 10:44, Mostafa Saleh wrote:
> CMD_TLBI_S2_IPA: As S1+S2 is not enabled, for now this can be the
> same as CMD_TLBI_NH_VAA.
>
> CMD_TLBI_S12_VMALL: Added new function to invalidate TLB by VMID.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 16 ++++++++++++++++
>  hw/arm/smmuv3.c              | 25 +++++++++++++++++++++++--
>  hw/arm/trace-events          |  2 ++
>  include/hw/arm/smmu-common.h |  1 +
>  4 files changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 028a60949a..28089d94a6 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -133,6 +133,16 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
>  
>      return SMMU_IOTLB_ASID(*iotlb_key) == asid;
>  }
> +
> +static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
> +                                         gpointer user_data)
> +{
> +    uint16_t vmid = *(uint16_t *)user_data;
> +    SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
> +
> +    return SMMU_IOTLB_VMID(*iotlb_key) == vmid;
> +}
> +
>  static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
>                                                gpointer user_data)
>  {
> @@ -185,6 +195,12 @@ void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
>      g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
>  }
>  
> +inline void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
> +{
> +    trace_smmu_iotlb_inv_vmid(vmid);
> +    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
> +}
> +
>  /* VMSAv8-64 Translation */
>  
>  /**
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 8b070f6bb5..2b563a5b1b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1174,14 +1174,35 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          case SMMU_CMD_TLBI_NH_VA:
>              smmuv3_s1_range_inval(bs, &cmd);
>              break;
> +        case SMMU_CMD_TLBI_S12_VMALL:
> +            uint16_t vmid = CMD_VMID(&cmd);
> +
> +            if (!STAGE2_SUPPORTED(s->features)) {
if you add such checks for S2, may you should consider adding similar
ones for existing S1?
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +
> +            trace_smmuv3_cmdq_tlbi_s12_vmid(vmid);
> +            smmu_inv_notifiers_all(&s->smmu_state);
> +            smmu_iotlb_inv_vmid(bs, vmid);
> +            break;
> +        case SMMU_CMD_TLBI_S2_IPA:
> +            if (!STAGE2_SUPPORTED(s->features)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +            /*
> +             * As currently only either s1 or s2 are supported
> +             * we can reuse same function for s2.
> +             */
> +            smmuv3_s1_range_inval(bs, &cmd);
Shouldn't we rename the function then?

Eric
> +            break;
>          case SMMU_CMD_TLBI_EL3_ALL:
>          case SMMU_CMD_TLBI_EL3_VA:
>          case SMMU_CMD_TLBI_EL2_ALL:
>          case SMMU_CMD_TLBI_EL2_ASID:
>          case SMMU_CMD_TLBI_EL2_VA:
>          case SMMU_CMD_TLBI_EL2_VAA:
> -        case SMMU_CMD_TLBI_S12_VMALL:
> -        case SMMU_CMD_TLBI_S2_IPA:
>          case SMMU_CMD_ATC_INV:
>          case SMMU_CMD_PRI_RESP:
>          case SMMU_CMD_RESUME:
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 2dee296c8f..61e2ffade5 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -12,6 +12,7 @@ smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, ui
>  smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
>  smmu_iotlb_inv_all(void) "IOTLB invalidate all"
>  smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
> +smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
>  smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
>  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
>  smmu_iotlb_lookup_hit(uint16_t asid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> @@ -48,6 +49,7 @@ smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t
>  smmuv3_s1_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
>  smmuv3_cmdq_tlbi_nh(void) ""
>  smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
> +smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
>  smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
>  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 5cca1c17f5..46ba1f6329 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -181,6 +181,7 @@ SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level);
>  void smmu_iotlb_inv_all(SMMUState *s);
>  void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
> +void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
>  

