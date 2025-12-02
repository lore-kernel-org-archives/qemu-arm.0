Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEF9D116F6
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Dec 2025 15:54:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQSh3-0001NG-Vm; Tue, 02 Dec 2025 10:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vQSh1-0001Mz-Pk
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 10:53:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vQSgz-0003Mb-9n
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 10:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764690807;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcix7lIJ92VfKuqTXYGLZJUsWBdoju2FEvA3VpgMf6Q=;
 b=ivxUejcH88po40NPI6xC0W9KoHPmMMC7GgtRDgJdDysFBcbpj3tWNj7ww87QAjhL068I07
 BTE0U8p0w4DU8zl7IjqWzS4jxvyC6SVhJ1Orr1TwqAmIEwRqLFuj58WWksGmcVm8K0eAwB
 /ijcxXzvbTmvW7erf2lTqy2tfDk1c0U=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-O3ImTuh7OlekTwtw5ADohg-1; Tue, 02 Dec 2025 10:53:26 -0500
X-MC-Unique: O3ImTuh7OlekTwtw5ADohg-1
X-Mimecast-MFC-AGG-ID: O3ImTuh7OlekTwtw5ADohg_1764690805
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed7591799eso105984831cf.0
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 07:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764690805; x=1765295605;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lcix7lIJ92VfKuqTXYGLZJUsWBdoju2FEvA3VpgMf6Q=;
 b=vbxXOoYp+E9gOwLnX2J5y0IIeGEcaVJAzX5qMrTt9m5f2BZ4rKLBxcEB+eq5NvCPdO
 1yCW0KkkeqSKP3+1zQBb7DmkTMUaq7o7J2GYkuYUJzEsq8yW0Sxv8f2LoZVJKBml0YA4
 jCYSdY8jqLjB8JcFu7ohExWjWIk30C0DXXgduO9V5dM1xm1gfFBlZOf6XjTw6CWMNiKR
 +w9I8Zv7B19HIVhmr1AeCgBK4qp5l2QKbX6HyyQRuE9pOAaf5vna8rN9hKR3tDeeudoU
 67y1swjG2UibjmY7Ym5WyjkEY6JhUiocj/BCNDbhK/FDmzcESHml66sKE+JBpIVKUXHi
 0VfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJv/K8xLPwnq6UkJ9rlb93GYasK0JdR20V1cvcpmXlYFCVZxN+mRVvrnDOjGFg5Cb3DjgsIayQWg==@nongnu.org
X-Gm-Message-State: AOJu0Yy8/oYOWvTo+l7xT3IJZozGeyuq1zP1ND+uoNPAxlUK5BcVpi+o
 h/W5B6r7FiJ1wYCsgGnzkxyf7f35CrIAhza+E4JwR/aZgCkZRJxe2nLZCBbXGQC83YRvr0uFrOV
 RyymIRiy5Pmof6KfLdIcw5YBLktMA4oJdaxaVeCje9KmUQPfjz/aVLw==
X-Gm-Gg: ASbGncvDLbMxCQw7puZQcB8wSxEBIsgU/+uj1u56oEY/CnpACsAo4UQZQOWL5dqNdVH
 0lgsaMj5gJP7xFGMLUNTmV15yy5/yqPh7peCYyNwtQwJzqzAFHVy86NeSwln3zhZtnq3Yxs+u0f
 Crq/XjzCQ57xZM5HW9+FeI9gaYvcIG8mOJs6pp0RigTTkTJoHLcJbUIp5gHiiV/PkAJVXO5EdQt
 ilHyez+DMN8efj13NzQ3wVzaOsjaWc6w9JmitTV/JgNb0Wq4dNfv9GJ90fG1FsqdvYYWgu+OjeM
 onXGA1pTIEQJMAX8UOviTIm5ytbIfT9lngLkmahB8BwVm0BRyMHpWRD5TGORZ/rj+334/RjeYQO
 lLLSVh5qw20BkX7gG29uD4batpsHOtFBi0JYF1S/KqWbhzt1+QRfCLyTk4g==
X-Received: by 2002:a05:622a:490:b0:4ec:f2e1:483 with SMTP id
 d75a77b69052e-4ee5885307bmr584965061cf.26.1764690805359; 
 Tue, 02 Dec 2025 07:53:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGV98ShQcsEwFEqUCtild6DMyI6kLykA5Xwo4TI838Fu8311/cJAa5pzPnCeIEx1JDb9K6Xeg==
X-Received: by 2002:a05:622a:490:b0:4ec:f2e1:483 with SMTP id
 d75a77b69052e-4ee5885307bmr584964391cf.26.1764690804723; 
 Tue, 02 Dec 2025 07:53:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e?
 ([2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4efd2fbb8d1sm98830531cf.9.2025.12.02.07.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 07:53:24 -0800 (PST)
Message-ID: <274e3061-c4ab-48f6-ba95-ed0eed0e2ce2@redhat.com>
Date: Tue, 2 Dec 2025 16:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 12/21] hw/arm/smmu-common: Implement secure state
 handling in ptw
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
References: <20251012150701.4127034-1-tangtao1634@phytium.com.cn>
 <20251012151200.4129164-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251012151200.4129164-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y6KSRuL3Mj_W4CSANnf1mb8oVlD5jUOB2khhE_JvO7k_1764690805
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 10/12/25 5:12 PM, Tao Tang wrote:
> Enhance the page table walker to correctly handle secure and non-secure
> memory accesses. This change introduces logic to select the appropriate
> address space and enforce architectural security policies during walks.
>
> The page table walker now correctly processes Secure Stage 1
> translations. Key changes include:
>
> - The get_pte function now uses the security context to fetch table
> entries from either the Secure or Non-secure address space.
>
> - The stage 1 walker tracks the security state, respecting the NSCFG
> and NSTable attributes. It correctly handles the hierarchical security
> model: if a table descriptor in a secure walk has NSTable=1, all
> subsequent lookups for that walk are forced into the Non-secure space.
> This is a one-way transition, as specified by the architecture.
>
> - A check is added to fault nested translations that produce a Secure
> IPA when Secure stage 2 is not supported (SMMU_S_IDR1.SEL2 == 0).
>
> - The final TLB entry is tagged with the correct output address space,
> ensuring proper memory isolation.
>
> Stage 2 translations are currently limited to Non-secure lookups. Full
> support for Secure Stage 2 translation will be added in a future series.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmu-common.c | 64 +++++++++++++++++++++++++++++++++++++++-----
>  hw/arm/trace-events  |  2 +-
>  2 files changed, 59 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 5fabe30c75..a092bb5a8d 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -399,20 +399,26 @@ void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid)
>   * @base_addr[@index]
>   */
>  static int get_pte(dma_addr_t baseaddr, uint32_t index, uint64_t *pte,
> -                   SMMUPTWEventInfo *info)
> +                   SMMUPTWEventInfo *info, SMMUSecSID sec_sid)
>  {
>      int ret;
>      dma_addr_t addr = baseaddr + index * sizeof(*pte);
> -
> +    MemTxAttrs attrs = smmu_get_txattrs(sec_sid);
> +    AddressSpace *as = smmu_get_address_space(sec_sid);
> +    if (!as) {
> +        info->type = SMMU_PTW_ERR_WALK_EABT;
is it WALK_EABT or PERMISSION in that case? I fail to find where it is
specified in the spec. Add a reference once?
> +        info->addr = addr;
> +        return -EINVAL;
> +    }
>      /* TODO: guarantee 64-bit single-copy atomicity */
> -    ret = ldq_le_dma(&address_space_memory, addr, pte, MEMTXATTRS_UNSPECIFIED);
> +    ret = ldq_le_dma(as, addr, pte, attrs);
>  
>      if (ret != MEMTX_OK) {
>          info->type = SMMU_PTW_ERR_WALK_EABT;
>          info->addr = addr;
>          return -EINVAL;
>      }
> -    trace_smmu_get_pte(baseaddr, index, addr, *pte);
> +    trace_smmu_get_pte(sec_sid, baseaddr, index, addr, *pte);
>      return 0;
>  }
>  
> @@ -543,6 +549,8 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>  
>      baseaddr = extract64(tt->ttb, 0, cfg->oas);
>      baseaddr &= ~indexmask;
> +    int nscfg = tt->nscfg;
> +    bool forced_ns = false;  /* Track if NSTable=1 forced NS mode */
>  
>      while (level < VMSA_LEVELS) {
>          uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
> @@ -552,7 +560,10 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>          dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>          uint8_t ap;
>  
> -        if (get_pte(baseaddr, offset, &pte, info)) {
> +        /* Use NS if forced by previous NSTable=1 or current nscfg */
> +        int current_ns = forced_ns || nscfg;
> +        SMMUSecSID sec_sid = current_ns ? SMMU_SEC_SID_NS : SMMU_SEC_SID_S;
> +        if (get_pte(baseaddr, offset, &pte, info, sec_sid)) {
>                  goto error;
>          }
>          trace_smmu_ptw_level(stage, level, iova, subpage_size,
> @@ -577,6 +588,26 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>                      goto error;
>                  }
>              }
> +
> +            /*
> +             * Hierarchical control of Secure/Non-secure accesses:
> +             * If NSTable=1 from Secure space, force all subsequent lookups to
> +             * Non-secure space and ignore future NSTable according to
> +             * (IHI 0070G.b)13.4.1 Stage 1 page permissions and
> +             * (DDI 0487H.a)D8.4.2 Control of Secure or Non-secure memory access
> +             */
> +            if (!forced_ns) {
> +                int new_nstable = PTE_NSTABLE(pte);
> +                if (!current_ns && new_nstable) {
> +                    /* First transition from Secure to Non-secure */
> +                    forced_ns = true;
> +                    nscfg = 1;
> +                } else if (!forced_ns) {
> +                    /* Still in original mode, update nscfg normally */
> +                    nscfg = new_nstable;
> +                }
> +                /* If forced_ns is already true, ignore NSTable bit */
> +            }
>              level++;
>              continue;
>          } else if (is_page_pte(pte, level)) {
> @@ -619,6 +650,13 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>              goto error;
>          }
>  
> +        tlbe->sec_sid = PTE_NS(pte) ? SMMU_SEC_SID_NS : SMMU_SEC_SID_S;
> +        tlbe->entry.target_as = smmu_get_address_space(tlbe->sec_sid);
> +        if (!tlbe->entry.target_as) {
> +            info->type = SMMU_PTW_ERR_WALK_EABT;
> +            info->addr = gpa;
> +            goto error;
> +        }
>          tlbe->entry.translated_addr = gpa;
>          tlbe->entry.iova = iova & ~mask;
>          tlbe->entry.addr_mask = mask;
> @@ -688,7 +726,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>          dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>          uint8_t s2ap;
>  
> -        if (get_pte(baseaddr, offset, &pte, info)) {
> +        /* Use NS as Secure Stage 2 is not implemented (SMMU_S_IDR1.SEL2 == 0)*/
I don't really get this as you passed the sel2 in the cfg?
> +        if (get_pte(baseaddr, offset, &pte, info, SMMU_SEC_SID_NS)) {
>                  goto error;
>          }
>          trace_smmu_ptw_level(stage, level, ipa, subpage_size,
> @@ -741,6 +780,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>              goto error_ipa;
>          }
>  
> +        tlbe->sec_sid = SMMU_SEC_SID_NS;
> +        tlbe->entry.target_as = &address_space_memory;
>          tlbe->entry.translated_addr = gpa;
>          tlbe->entry.iova = ipa & ~mask;
>          tlbe->entry.addr_mask = mask;
> @@ -825,6 +866,17 @@ int smmu_ptw(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t iova,
>          return ret;
>      }
>  
> +    if (!cfg->sel2 && tlbe->sec_sid > SMMU_SEC_SID_NS) {
> +        /*
> +         * Nested translation with Secure IPA output is not supported if
> +         * Secure Stage 2 is not implemented.
> +         */
> +        info->type = SMMU_PTW_ERR_TRANSLATION;
pointer to the spec for TRANSLATION error?

Otherwise looks good

Eric
> +        info->stage = SMMU_STAGE_1;
> +        tlbe->entry.perm = IOMMU_NONE;
> +        return -EINVAL;
> +    }
> +
>      ipa = CACHED_ENTRY_TO_ADDR(tlbe, iova);
>      ret = smmu_ptw_64_s2(cfg, ipa, perm, &tlbe_s2, info);
>      if (ret) {
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 96ebd1b11b..a37e894766 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -16,7 +16,7 @@ smmu_ptw_level(int stage, int level, uint64_t iova, size_t subpage_size, uint64_
>  smmu_ptw_invalid_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint32_t offset, uint64_t pte) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" offset=%d pte=0x%"PRIx64
>  smmu_ptw_page_pte(int stage, int level,  uint64_t iova, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t address) "stage=%d level=%d iova=0x%"PRIx64" base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" page address = 0x%"PRIx64
>  smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, uint64_t pte, uint64_t iova, uint64_t gpa, int bsize_mb) "stage=%d level=%d base@=0x%"PRIx64" pte@=0x%"PRIx64" pte=0x%"PRIx64" iova=0x%"PRIx64" block address = 0x%"PRIx64" block size = %d MiB"
> -smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
> +smmu_get_pte(int sec_sid, uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "sec_sid=%d baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64""
>  smmu_iotlb_inv_all(void) "IOTLB invalidate all"
>  smmu_iotlb_inv_asid_vmid(int asid, int vmid) "IOTLB invalidate asid=%d vmid=%d"
>  smmu_iotlb_inv_vmid(int vmid) "IOTLB invalidate vmid=%d"


