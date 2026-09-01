Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB948C624D4
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 14:10:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1PBl-00043U-5r; Tue, 01 Sep 2026 10:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1PBi-00042o-Ry
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:10:10 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1PBf-0007K0-H6
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:10:10 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6a5f9b036f9so2825a12.1
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 07:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1788271806; x=1788876606; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ElCc54E4Dw+V+Ls01UzslNyHvBtLbrssA+KiyhVYGo4=;
 b=Xc3qFgfnAXhlRZoHp/D774dTfli4Fp4/wiSYozl/qCVSgBNhKv/JJkrhh6b54q46Ak
 j0FT4g/GkBIYLkM2ekZKZDMz5+y3F1DyuD54BKN6gwdeldiwIGY8E81ZUHvekUSjLuED
 kSk/xKZvfg3wtnrYPVvWQu5Xptt6JLulrXI4rRSnly/qXPo97HMnt7aYTZXNRugEQFud
 NV6C609CqM8hUlSEpUc5TISf3p9m8mYaCndGbv+sSNYaERIfAR4ppHs2aHQLhxzKUn3D
 IjgSwtZOlmaXjI83L0LWVxrz0LsvDxrVa5R7V5hN3znuySG/43GHonSORT5lC3Yelo/D
 ASPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788271806; x=1788876606;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ElCc54E4Dw+V+Ls01UzslNyHvBtLbrssA+KiyhVYGo4=;
 b=i24GqiHfRqppk+4Ntn/GHhffcrfb+zh+aoCHV5xmFcE5bCzAjvTqa1krE/eGxT+yUI
 Ccq+xbz8ANBn26UAbn84RY7D1TcSmK0TTCdQVUMQn7Zqkmp4s4Qfm8R45YrXiGdo5E1v
 NUPaSodDE6yk9EtDWkflQINHV3sYOQc0O9CIOof5l2w7qRcsk1pvAmvU67XVoDenXmdR
 88HgZEUuUE47hdflGAopUggTz/tr47p3gD3dl4UOQHXP+V7M865ykCS475E8HW4d+Rpi
 7TW8zaMScAGxMT+hzElg/0U4h5UgxZErVupyqw6DNUeTmb2f1P7jdpPW0USCOnJL8fgc
 KcWw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwCkij+JZh5k5IoYeh1kFV2oSw+dDCBiQO2jP+YCu8Api6/YhNMjaw2WH1sXu4DaY8+WQ4+n4ei0g==@nongnu.org
X-Gm-Message-State: AFuF++n72I6FK04KJhzmmTreD509Maih//qsQHHyCUXQGhDTgR7egWcF
 59IYPz9drD/bYkTuAbD/gUArS0XepVYRAm+7Y1Y22na81o9t9P/QVILpdVsutpFtPg==
X-Gm-Gg: AYBFou2J+aE9OPS0OVLQ5tEW30yT2/Zjp/LHOFkkYLAm4yf/6vUNhtVsmR8JR7DrFwO
 yWlBLF7DROjQZo6fdNmNkfZN+3qBqaoCtmoJ7Y7ID98/oTmyeiSlJ1WIHvUiRtC9/AW4ePU2fpi
 hq7LrJLkbDUvk/J3i7OlHtPEF6i30eJ0Jb1fO0aWVIUcAaaG0B9QYDXDLsLWqrYIm656gvE9zht
 4BDAlD30mUVyJZRComgS/8LNTWZ4/N3DR/cLkGKRKcpIt+cy8gJWMZDPXx9R6g0/yO6PnLeDqCO
 xHDmOJCTF513iURofmNF4Wg8apKskKOh0UierZUr4MiIM6Uyx4m57Rm0l6nfx3/Y2ZI6zz9/yRZ
 pT6MiMRRv2ZIJqip3vaN7/RFgXvz0w06ktMU7xflvViryuiHK/bqSmtcQeM5/2JQ5DA31p05s+r
 ZXLmI+KNKhBWgN5VZ6ajONy6xjjGy94c/MhiQ0OiWfun5g16xWeDm8pahmNKHZfIbZ4yi5F3VKt
 jQlbwboWNONeOHmCgwn/aLAuOey4T9No63EX66Azw==
X-Received: by 2002:aa7:df8b:0:b0:6a6:7825:a873 with SMTP id
 4fb4d7f45d1cf-6a67825c3b7mr10002a12.9.1788271805091; 
 Tue, 01 Sep 2026 07:10:05 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com.
 [35.189.192.250]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2563c74bd8sm569740066b.40.2026.09.01.07.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 07:10:02 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:09:58 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [RFC v5 11/28] hw/arm/smmu-common: Implement secure state
 handling in ptw
Message-ID: <apbctpZhmRAzRia1@google.com>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162512.2807281-1-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162512.2807281-1-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=smostafa@google.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Aug 14, 2026 at 12:25:08AM +0800, Tao Tang wrote:
> Enhance the page table walker to correctly handle secure and non-secure
> memory accesses. This change introduces logic to select the appropriate
> address space and enforce architectural security policies during walks.
> 
> The page table walker now correctly processes Secure Stage 1
> translations. Key changes include:
> 
> - The get_pte() function now uses the effective security state to fetch
> page-table entries from either the Secure or Non-secure address space,
> with explicit transaction attributes matching that address space.
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
> Note: We do not yet support secure stage 2 translations. This patch
> only implements Secure stage 1 page-table walks. Baseline propagation
> of the incoming NS attribute for stage 1 bypass is handled separately
> in this series with ATTR_PERMS_OVR == 0. Full ATTR_PERMS_OVR support
> is left for a separate series.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmu-common.c         | 73 +++++++++++++++++++++++++++++-------
>  hw/arm/smmuv3.c              | 19 ++++++----
>  include/hw/arm/smmu-common.h |  7 ++--
>  3 files changed, 74 insertions(+), 25 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 63c36329a98..317cfafded2 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -408,13 +408,13 @@ void smmu_iotlb_inv_vmid_s1(SMMUState *s, int vmid)
>   * @base_addr[@index]
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
> @@ -488,7 +488,8 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>  static inline int translate_table_addr_ipa(SMMUState *bs,
>                                             dma_addr_t *table_addr,
>                                             SMMUTransCfg *cfg,
> -                                           SMMUPTWEventInfo *info)
> +                                           SMMUPTWEventInfo *info,
> +                                           SMMUSecSID sec_sid)
>  {
>      dma_addr_t addr = *table_addr;
>      SMMUTLBEntry *cached_entry;
> @@ -501,7 +502,7 @@ static inline int translate_table_addr_ipa(SMMUState *bs,
>      asid = cfg->asid;
>      cfg->stage = SMMU_STAGE_2;
>      cfg->asid = -1;
> -    cached_entry = smmu_translate(bs, cfg, addr, IOMMU_RO, info);
> +    cached_entry = smmu_translate(bs, cfg, addr, IOMMU_RO, info, sec_sid);

Should we have an assertion instead as it is not possible to reach
this path with the secure bit?

Thanks,
Mostafa

>      cfg->asid = asid;
>      cfg->stage = SMMU_NESTED;
>  
> @@ -524,6 +525,7 @@ static inline int translate_table_addr_ipa(SMMUState *bs,
>   * @perm: access type
>   * @tlbe: SMMUTLBEntry (out)
>   * @info: handle to an error info
> + * @sec_sid: StreamID Security state
>   *
>   * Return 0 on success, < 0 on error. In case of error, @info is filled
>   * and tlbe->perm is set to IOMMU_NONE.
> @@ -532,12 +534,16 @@ static inline int translate_table_addr_ipa(SMMUState *bs,
>   */
>  static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>                            dma_addr_t iova, IOMMUAccessFlags perm,
> -                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
> +                          SMMUSecSID sec_sid)
>  {
>      dma_addr_t baseaddr, indexmask;
>      SMMUStage stage = cfg->stage;
>      SMMUTransTableInfo *tt = select_tt(cfg, iova);
>      uint8_t level, granule_sz, inputsize, stride;
> +    int nscfg, current_ns, new_nstable;
> +    bool sid_is_ns = sec_sid == SMMU_SEC_SID_NS;
> +    SMMUSecSID table_sec_sid;
>  
>      if (!tt || tt->disabled) {
>          info->type = SMMU_PTW_ERR_TRANSLATION;
> @@ -552,6 +558,7 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>  
>      baseaddr = extract64(tt->ttb, 0, cfg->oas);
>      baseaddr &= ~indexmask;
> +    nscfg = tt->nscfg;
>  
>      while (level < VMSA_LEVELS) {
>          uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
> @@ -560,8 +567,19 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>          uint64_t pte, gpa;
>          dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>          uint8_t ap;
> +        AddressSpace *pte_as;
> +        MemTxAttrs pte_attrs;
> +        SMMUSecSID cur_sec_sid;
>  
> -        if (get_pte(baseaddr, offset, &pte, info)) {
> +        /*
> +         * Start in NS for Non-secure streams or CD.NSCFGx == 1.
> +         * Once walk is in NS, NSTable is ignored on subsequent levels.
> +         */
> +        current_ns = sid_is_ns || nscfg;
> +        table_sec_sid = current_ns ? SMMU_SEC_SID_NS : sec_sid;
> +        pte_as = smmu_get_address_space(bs, table_sec_sid);
> +        pte_attrs = smmu_get_txattrs(table_sec_sid);
> +        if (get_pte(baseaddr, offset, &pte, info, pte_as, pte_attrs)) {
>                  goto error;
>          }
>          trace_smmu_ptw_level(stage, level, iova, subpage_size,
> @@ -582,10 +600,25 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>              }
>              baseaddr = get_table_pte_address(pte, granule_sz);
>              if (cfg->stage == SMMU_NESTED) {
> -                if (translate_table_addr_ipa(bs, &baseaddr, cfg, info)) {
> +                if (translate_table_addr_ipa(bs, &baseaddr, cfg,
> +                                             info, table_sec_sid)) {
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
> +            if (!current_ns) {
> +                new_nstable = PTE_NSTABLE(pte);
> +                nscfg = new_nstable ? 1 : 0;
> +            } else {
> +                nscfg = 1;
> +            }
>              level++;
>              continue;
>          } else if (is_page_pte(pte, level)) {
> @@ -628,6 +661,12 @@ static int smmu_ptw_64_s1(SMMUState *bs, SMMUTransCfg *cfg,
>              goto error;
>          }
>  
> +        if (current_ns) {
> +            cur_sec_sid = SMMU_SEC_SID_NS;
> +        } else {
> +            cur_sec_sid = PTE_NS(pte) ? SMMU_SEC_SID_NS : SMMU_SEC_SID_S;
> +        }
> +        tlbe->entry.target_as = smmu_get_address_space(bs, cur_sec_sid);
>          tlbe->entry.translated_addr = gpa;
>          tlbe->entry.iova = iova & ~mask;
>          tlbe->entry.addr_mask = mask;
> @@ -697,7 +736,10 @@ static int smmu_ptw_64_s2(SMMUState *bs, SMMUTransCfg *cfg,
>          uint64_t pte, gpa;
>          dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>          uint8_t s2ap;
> -        if (get_pte(baseaddr, offset, &pte, info)) {
> +        AddressSpace *pte_as = &bs->memory_as;
> +        MemTxAttrs pte_attrs = MEMTXATTRS_UNSPECIFIED;
> +
> +        if (get_pte(baseaddr, offset, &pte, info, pte_as, pte_attrs)) {
>                  goto error;
>          }
>          trace_smmu_ptw_level(stage, level, ipa, subpage_size,
> @@ -792,7 +834,7 @@ static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
>  }
>  
>  /**
> - * smmu_ptw - Walk the page tables for an IOVA, according to @cfg
> + * smmu_ptw - Walk the page tables for an IOVA, according to @cfg and @sec_sid
>   *
>   * @bs: smmu state which includes TLB instance
>   * @cfg: translation configuration
> @@ -800,18 +842,20 @@ static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
>   * @perm: tentative access type
>   * @tlbe: returned entry
>   * @info: ptw event handle
> + * @sec_sid: StreamID Security state
>   *
>   * return 0 on success
>   */
>  int smmu_ptw(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t iova,
> -             IOMMUAccessFlags perm, SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> +             IOMMUAccessFlags perm, SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info,
> +             SMMUSecSID sec_sid)
>  {
>      int ret;
>      SMMUTLBEntry tlbe_s2;
>      dma_addr_t ipa;
>  
>      if (cfg->stage == SMMU_STAGE_1) {
> -        return smmu_ptw_64_s1(bs, cfg, iova, perm, tlbe, info);
> +        return smmu_ptw_64_s1(bs, cfg, iova, perm, tlbe, info, sec_sid);
>      } else if (cfg->stage == SMMU_STAGE_2) {
>          /*
>           * If bypassing stage 1(or unimplemented), the input address is passed
> @@ -830,7 +874,7 @@ int smmu_ptw(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t iova,
>      }
>  
>      /* SMMU_NESTED. */
> -    ret = smmu_ptw_64_s1(bs, cfg, iova, perm, tlbe, info);
> +    ret = smmu_ptw_64_s1(bs, cfg, iova, perm, tlbe, info, sec_sid);
>      if (ret) {
>          return ret;
>      }
> @@ -846,7 +890,8 @@ int smmu_ptw(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t iova,
>  }
>  
>  SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
> -                             IOMMUAccessFlags flag, SMMUPTWEventInfo *info)
> +                             IOMMUAccessFlags flag, SMMUPTWEventInfo *info,
> +                             SMMUSecSID sec_sid)
>  {
>      SMMUTLBEntry *cached_entry = NULL;
>      SMMUTransTableInfo *tt;
> @@ -888,7 +933,7 @@ SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
>      }
>  
>      cached_entry = g_new0(SMMUTLBEntry, 1);
> -    status = smmu_ptw(bs, cfg, addr, flag, cached_entry, info);
> +    status = smmu_ptw(bs, cfg, addr, flag, cached_entry, info, sec_sid);
>      if (status) {
>              g_free(cached_entry);
>              return NULL;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 6b34f76f11b..cc5d3ab696c 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -394,7 +394,8 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                                                   SMMUEventInfo *event,
>                                                   IOMMUAccessFlags flag,
>                                                   SMMUTLBEntry **out_entry,
> -                                                 SMMUTranslationClass class);
> +                                                 SMMUTranslationClass class,
> +                                                 SMMUSecSID sec_sid);
>  /* @ssid > 0 not supported yet */
>  static int smmu_get_cd(SMMUv3State *s, STE *ste, SMMUTransCfg *cfg,
>                         uint32_t ssid, CD *buf, SMMUEventInfo *event,
> @@ -411,7 +412,7 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, SMMUTransCfg *cfg,
>  
>      if (cfg->stage == SMMU_NESTED) {
>          status = smmuv3_do_translate(s, addr, cfg, event,
> -                                     IOMMU_RO, &entry, SMMU_CLASS_CD);
> +                                     IOMMU_RO, &entry, SMMU_CLASS_CD, sec_sid);
>  
>          /* Same PTW faults are reported but with CLASS = CD. */
>          if (status != SMMU_TRANS_SUCCESS) {
> @@ -796,7 +797,7 @@ int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste, SMMUEventInfo *event,
>  }
>  
>  static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
> -                     CD *cd, SMMUEventInfo *event)
> +                     CD *cd, SMMUEventInfo *event, SMMUSecSID sec_sid)
>  {
>      int ret = -EINVAL;
>      int i;
> @@ -869,7 +870,7 @@ static int decode_cd(SMMUv3State *s, SMMUTransCfg *cfg,
>          /* Translate the TTBx, from IPA to PA if nesting is enabled. */
>          if (cfg->stage == SMMU_NESTED) {
>              status = smmuv3_do_translate(s, tt->ttb, cfg, event, IOMMU_RO,
> -                                         &entry, SMMU_CLASS_TT);
> +                                         &entry, SMMU_CLASS_TT, sec_sid);
>              /*
>               * Same PTW faults are reported but with CLASS = TT.
>               * If TTBx is larger than the effective stage 1 output addres
> @@ -939,7 +940,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>          return ret;
>      }
>  
> -    return decode_cd(s, cfg, &cd, event);
> +    return decode_cd(s, cfg, &cd, event, sec_sid);
>  }
>  
>  /**
> @@ -1004,7 +1005,8 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                                                   SMMUEventInfo *event,
>                                                   IOMMUAccessFlags flag,
>                                                   SMMUTLBEntry **out_entry,
> -                                                 SMMUTranslationClass class)
> +                                                 SMMUTranslationClass class,
> +                                                 SMMUSecSID sec_sid)
>  {
>      SMMUPTWEventInfo ptw_info = {};
>      SMMUState *bs = ARM_SMMU(s);
> @@ -1030,7 +1032,7 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>          cfg->stage = SMMU_STAGE_2;
>      }
>  
> -    cached_entry = smmu_translate(bs, cfg, addr, flag, &ptw_info);
> +    cached_entry = smmu_translate(bs, cfg, addr, flag, &ptw_info, sec_sid);
>  
>      if (desc_s2_translation) {
>          cfg->asid = asid;
> @@ -1176,13 +1178,14 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      }
>  
>      status = smmuv3_do_translate(s, addr, cfg, &event, flag,
> -                                 &cached_entry, SMMU_CLASS_IN);
> +                                 &cached_entry, SMMU_CLASS_IN, sec_sid);
>  
>  epilogue:
>      qemu_mutex_unlock(&s->mutex);
>      switch (status) {
>      case SMMU_TRANS_SUCCESS:
>          entry.perm = cached_entry->entry.perm;
> +        entry.target_as = cached_entry->entry.target_as;
>          entry.translated_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
>          entry.addr_mask = cached_entry->entry.addr_mask;
>          trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 1aa4e3208da..0c5718ea684 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -224,18 +224,19 @@ static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>  
>  /**
>   * smmu_ptw - Perform the page table walk for a given iova / access flags
> - * pair, according to @cfg translation config
> + * pair, according to @cfg translation config and @sec_sid
>   */
>  int smmu_ptw(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t iova,
>               IOMMUAccessFlags perm, SMMUTLBEntry *tlbe,
> -             SMMUPTWEventInfo *info);
> +             SMMUPTWEventInfo *info, SMMUSecSID sec_sid);
>  
>  /*
>   * smmu_translate - Look for a translation in TLB, if not, do a PTW.
>   * Returns NULL on PTW error or incase of TLB permission errors.
>   */
>  SMMUTLBEntry *smmu_translate(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t addr,
> -                             IOMMUAccessFlags flag, SMMUPTWEventInfo *info);
> +                             IOMMUAccessFlags flag, SMMUPTWEventInfo *info,
> +                             SMMUSecSID sec_sid);
>  
>  /**
>   * select_tt - compute which translation table shall be used according to
> -- 
> 2.34.1
> 

