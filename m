Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759A3EC047D
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 09:41:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxMG2-0008Cr-Ko; Tue, 03 Mar 2026 04:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxMFy-0008C9-8P
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 04:41:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxMFt-0007Sj-Iu
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 04:41:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772530888;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OS4LJwUp5xIEpKzyLNqheZWjrtw7rNDgBtf4lecR0Ig=;
 b=cqKjV64O3yev4sOwOLvs5vxmeqS5HoboBboBWNG8Z29xIMr7JyJSaiTCWtknJNF1EzQwb8
 RW6k68VVAKeoKaq+tNgY/D3Pqv1rJplZrsdb8ywZddV/lw2nG4+OkV3w8rDdZkCYloVKkC
 DJX1TNahny6cj62ejxhB9KI/oM7ekUE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-M0ZJW_dyMkaRddNOBQS1cA-1; Tue, 03 Mar 2026 04:41:27 -0500
X-MC-Unique: M0ZJW_dyMkaRddNOBQS1cA-1
X-Mimecast-MFC-AGG-ID: M0ZJW_dyMkaRddNOBQS1cA_1772530886
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-439b3b408f9so2026269f8f.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 01:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772530886; x=1773135686;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OS4LJwUp5xIEpKzyLNqheZWjrtw7rNDgBtf4lecR0Ig=;
 b=bo6tizTGLpas6WKOoLFVRIxStHPUiAwuyZyuGW4iaXL+/FhTpn6V+6iyyS5Gp/StoV
 cCjmTfZen5lRD6GYftFPj/lZNdKQrwPimVeLI/nUlfvYa5s0opj5HXurm1t7yvGOQj1j
 gPfsW9+5GU9a+Hn2JmPJmrHz/kp6FlCGm31md5LArySYv712J81s5TJGDgOQlvInowqb
 7laNYWfblzCEvvkyDd0SjTBZAb4dgP0smRy0cvKdxmVis/q2/Snrum7mkx101CFU/3Vd
 Ke8SoFDEAZwlvoMiNurzWAzyJg01L3KkeRJ9VDdT5ZBczVfEOg5KfBQdN7Jw1FgYX4KL
 OcHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbVJSxOS4iuGpR2OfUce9FMqhg0Az2E14h4hiNc5ati8PyVrvleNgGGOjDbUrdO1nvMxEwidPf+Q==@nongnu.org
X-Gm-Message-State: AOJu0Yzf/haqCdV7gK1+AYsUnwo2902sV8FJeJHR8SVbR7GNWk9DHtCC
 VNDEWr4hM8BWYrR65uPPX4l+P4yrsoJLxKT2/ftlI/tne8Ujw4GNKFV1iqB6PJ5XSGhhL0h55Gc
 TOR2NrNd2if4HEYeqq1O4foEv7wgZH3p3P2NLjGHZmDl465E5mGdVAw==
X-Gm-Gg: ATEYQzxh3bOUnwrpzhOLFTmazhdXg6u+QcuU5NZo05G6gIikd2dC8OLMwkMtcYnJ4iY
 +TJnFako8U6OJLRFGogmZ7GY8HJ6dnZNcnipAdcvbSuB5usMK8rW7o9xy8LhvSq+iKRJ+0A2+y9
 xIOQGVyqbXGL2fEWmc6koZXRognk+aFhJrf4XzC0VzrTGBZ8gPZU0wFOM9Wjh/Kf7R/n1lohtdM
 2pk3m12jx7oMypHYQwF5JbnhUFKbQYDOhhVdZ3AQF7IXDkPuTZVj92mxutMQp0Cd4t0oURdqLLw
 r7BUFxOZ1sr3fSve+GiPYnqFUwiDE1d2Icb78h5xEoDaym9vcnNky7QFqewIyADpWqlOBuwfhWv
 6Z6DF0lWYnVQkXJL4jlIk481oovGOfdta1+eNNRmEcdgs/kcKr4zoF9hCHbImKMd0qGkb6Q==
X-Received: by 2002:a05:6000:24c1:b0:439:c42f:10d3 with SMTP id
 ffacd0b85a97d-439c42f1312mr410273f8f.46.1772530885881; 
 Tue, 03 Mar 2026 01:41:25 -0800 (PST)
X-Received: by 2002:a05:6000:24c1:b0:439:c42f:10d3 with SMTP id
 ffacd0b85a97d-439c42f1312mr410209f8f.46.1772530885325; 
 Tue, 03 Mar 2026 01:41:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c75b272sm32739870f8f.24.2026.03.03.01.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 01:41:24 -0800 (PST)
Message-ID: <0b346363-9450-4397-8e1b-cfd46b45ed9c@redhat.com>
Date: Tue, 3 Mar 2026 10:41:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 14/31] hw/arm/smmu-common: Implement secure state
 handling in ptw
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101649.2993830-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260221101649.2993830-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sVISOzlB6YEzv5lCckL4gQ9ThjBjAhlyCVu4t4x2NW0_1772530886
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.968, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.495,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Tao,

On 2/21/26 11:16 AM, Tao Tang wrote:
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
> - The final TLB entry is tagged with the correct output address space,
> ensuring proper memory isolation.
>
> Note: We do not yet support secure stage 2 translations. So ns_as member
> in SMMUTransCfg is used to cache non-secure AS instead of refactoring
> smmu_ptw_64_s2 to pass SMMUState context.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmu-common.c | 50 ++++++++++++++++++++++++++++++++++++++++----
>  hw/arm/smmuv3.c      |  1 +
>  2 files changed, 47 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index a732303b28b..84e71df6767 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -406,15 +406,16 @@ void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid)
>  /**
>   * get_pte - Get the content of a page table entry located at
>   * @base_addr[@index]
> + * @as: AddressSpace to read from
while at it let's properly document all parameters in the doc comment.
>   */
>  static int get_pte(dma_addr_t baseaddr, uint32_t index, uint64_t *pte,
> -                   SMMUPTWEventInfo *info)
> +                   SMMUPTWEventInfo *info, AddressSpace *as, MemTxAttrs attrs)
>  {
>      int ret;
>      dma_addr_t addr = baseaddr + index * sizeof(*pte);
>  
>      /* TODO: guarantee 64-bit single-copy atomicity */
> -    ret = ldq_le_dma(&address_space_memory, addr, pte, MEMTXATTRS_UNSPECIFIED);
> +    ret = ldq_le_dma(as, addr, pte, attrs);
>  
>      if (ret != MEMTX_OK) {
>          info->type = SMMU_PTW_ERR_WALK_EABT;
> @@ -538,6 +539,9 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>      SMMUStage stage = cfg->stage;
>      SMMUTransTableInfo *tt = select_tt(cfg, iova);
>      uint8_t level, granule_sz, inputsize, stride;
> +    int nscfg, current_ns, new_nstable;
> +    bool sid_is_ns = cfg->sec_sid == SMMU_SEC_SID_NS;
> +    bool forced_ns = false;  /* Once true, NSTable is ignored */
>  
>      if (!tt || tt->disabled) {
>          info->type = SMMU_PTW_ERR_TRANSLATION;
> @@ -552,6 +556,8 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>  
>      baseaddr = extract64(tt->ttb, 0, cfg->oas);
>      baseaddr &= ~indexmask;
> +    nscfg = tt->nscfg;
> +    forced_ns = sid_is_ns || nscfg;
do you really need this forced_ns
can't you simply set current_ns = sid_is_ns || nscfg
with first value of nscfg set to tt->nscfg and next level ones set to
aptable is !current_ns
>  
>      while (level < VMSA_LEVELS) {
>          uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
> @@ -560,8 +566,17 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>          uint64_t pte, gpa;
>          dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>          uint8_t ap;
> +        AddressSpace *pte_as;
> +        MemTxAttrs pte_attrs;
>  
> -        if (get_pte(baseaddr, offset, &pte, info)) {
> +        /*
> +         * Start in NS for Non-secure streams or CD.NSCFGx == 1.
> +         * Once walk is in NS, NSTable is ignored on subsequent levels.
> +         */
> +        current_ns = forced_ns || nscfg;
> +        pte_as = current_ns ? &bs->memory_as : &bs->secure_memory_as;
> +        pte_attrs = current_ns ? MEMTXATTRS_UNSPECIFIED : cfg->txattrs;
> +        if (get_pte(baseaddr, offset, &pte, info, pte_as, pte_attrs)) {
>                  goto error;
>          }
>          trace_smmu_ptw_level(stage, level, iova, subpage_size,
> @@ -586,6 +601,23 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>                      goto error;
>                  }
>              }
> +
> +            /*
> +             * NSTable can switch the walk to NS only while the current walk
> +             * level is Secure. Once switched to NS, NSTable is ignored according
> +             * to hierarchical control of Secure/Non-secure accesses:
> +             * (IHI 0070G.b)13.4.1 Stage 1 page permissions and
> +             * (DDI 0487H.a)D8.4.2 Control of Secure or Non-secure memory access
> +             */
> +            if (!forced_ns) {
> +                new_nstable = PTE_NSTABLE(pte);
> +                if (new_nstable) {
> +                    forced_ns = true;
> +                    nscfg = 1;
> +                } else {
> +                    nscfg = 0;
> +                }
> +            }
>              level++;
>              continue;
>          } else if (is_page_pte(pte, level)) {
> @@ -628,6 +660,13 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>              goto error;
>          }
>  
> +        if (current_ns) {
> +            tlbe->sec_sid = SMMU_SEC_SID_NS;
> +        } else {
> +            tlbe->sec_sid = PTE_NS(pte) ? SMMU_SEC_SID_NS : SMMU_SEC_SID_S;
> +        }
> +        tlbe->entry.target_as = (tlbe->sec_sid == SMMU_SEC_SID_S)
> +                                ? &bs->secure_memory_as : &bs->memory_as;
So I understand you need to set the target_as depending on sec_sid but
not sure why need to store the sec_sid in the tlbe?
>          tlbe->entry.translated_addr = gpa;
>          tlbe->entry.iova = iova & ~mask;
>          tlbe->entry.addr_mask = mask;
> @@ -697,7 +736,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>          dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>          uint8_t s2ap;
>  
> -        if (get_pte(baseaddr, offset, &pte, info)) {
> +        if (get_pte(baseaddr, offset, &pte, info, cfg->ns_as,
> +                    MEMTXATTRS_UNSPECIFIED)) {
>                  goto error;
>          }
>          trace_smmu_ptw_level(stage, level, ipa, subpage_size,
> @@ -750,6 +790,8 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>              goto error_ipa;
>          }
>  
> +        tlbe->sec_sid = SMMU_SEC_SID_NS;
> +        tlbe->entry.target_as = cfg->ns_as;
Shouldn't you handle STE.NSCFG in case STE belongs to the secure stream
table (ns_sid=secure) and stage 1 is disabled?

Also shall we handle SMMU_IDR1.ATTR_PERMS_OVR?
>          tlbe->entry.translated_addr = gpa;
>          tlbe->entry.iova = ipa & ~mask;
>          tlbe->entry.addr_mask = mask;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index b8f2fae9a1d..504161ce06d 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1147,6 +1147,7 @@ epilogue:
>      switch (status) {
>      case SMMU_TRANS_SUCCESS:
>          entry.perm = cached_entry->entry.perm;
> +        entry.target_as = cached_entry->entry.target_as;
>          entry.translated_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
>          entry.addr_mask = cached_entry->entry.addr_mask;
>          trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
Thanks

Eric


