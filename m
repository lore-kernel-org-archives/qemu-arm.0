Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41C1C61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 09:08:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzW5O-0006Hd-DN; Thu, 27 Aug 2026 05:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wzW5J-0006Gr-K7
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wzW5H-0003rr-4Q
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787821661;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BffBeBFXJjw2CjII6VfC4MCdq9z0kEc+2g8FBs774/Y=;
 b=VGGULcvFYxWKlbrbK2BslpF9Kxf9vdLac7HLplpQQrEsluS2fZ+PuX3I+Fvo9P/gBvhUAx
 QeMeeou21bOevMFc8EVBP8i3gUMQKlAI6IbONvmmnsKEkDJbnOcePuhywybAlVKuudxcEM
 H34CfrVDW0UvUz72RygcYaxxmaaPNl8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-wmjBdpFEO6iz8Cb9GM02YQ-1; Thu, 27 Aug 2026 05:07:40 -0400
X-MC-Unique: wmjBdpFEO6iz8Cb9GM02YQ-1
X-Mimecast-MFC-AGG-ID: wmjBdpFEO6iz8Cb9GM02YQ_1787821659
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4954b1c6310so14739575e9.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 02:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787821659; x=1788426459;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BffBeBFXJjw2CjII6VfC4MCdq9z0kEc+2g8FBs774/Y=;
 b=KpoggoJVME/6qexzxXOHvAXq4M0qjcDMEdkMAvBK30HgBFft9Lk9i6qQcK9qoqIXXi
 CmOKopLPkgNHmGNVjrreerPgFEASvopBm5y4w5C/pz9FR5I34S6AGUf4F5p82M77tY/v
 80noZvWlrAKiGNeuEiFOU6PjkUZq6WhnafNBA94QM//kvtwYCFpG+KMXfg38jsDMHsfZ
 8O3w6DhCrA+ygt4TqPMCqR8Zf0cGYBLLKcPP0Ou6mu5b2ZZnQKnSem305PrbXxS9Zyf+
 sFCfUjNM4hVL3Nu3f1r55I9NhVyPB9ma+QqEmd+Bm+Vtigxwgu88HNL1G7usZAhiTkEF
 /3NA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpnRULzlcbaXNaQAK7a7WK7P5weTZylcYOih0ahXW4C7bTFNL4w8ONfG8Q0Glzgc7mT2nbG4rwd2g==@nongnu.org
X-Gm-Message-State: AFuF++lndUdDepZ1wW/5x+nCkgprWD6omzxFXkuZ13BsQRVkCM1WzKqd
 PbLcfPoQxgc+vQtA+3qG04qiop6atuqqAMEhN2cVaAx73W333r4h5nxGiIDiZYlPAcgP5z+oDwT
 XZtLmHHB1QQqHlJ7mZ+LntgRhCEafecO7wn5narXQV919sEK6z0iJ2w==
X-Gm-Gg: AR+sD12BhTn0Y1na4wBGKCkfUwD8toY4BiGfTvEhDdAMxv40fiOJUAA2Kp5iQfmenLH
 2icrJGbcwapnBWrWyHVCntmw/rlh78vmkXzFRGx9ntF3xOg6BiJ3AaRRRUF8PaEP4xQp25Ep4Ll
 /kdUe0Q5fMxNiLzSw++hmVTBQnLZ2nruFO6/vusk1ox7ogKze1C2q1hr/etfErkLrTf0f0Y9dYY
 uKKhkidOA3OnS4aWMpHkYrMW4ZVW5Ly/tuGA77hQFHGjo2jl6tys4mkwzKDo0OBTNXQ2Id/B4VN
 rFXseyQzrCmwjvqTuai3My83KGGem0x+5pB370ttocZZQSKZ4vR3pKre7iXwgS87DbqcLmCscdw
 3l3C3NBRiLmLHKdSwW+di0bTZbCqGrohsMXc5uRJJJ6PNIrML
X-Received: by 2002:a05:600c:3b1a:b0:493:c47f:3c55 with SMTP id
 5b1f17b1804b1-499dc6fb0fcmr153099695e9.5.1787821659322; 
 Thu, 27 Aug 2026 02:07:39 -0700 (PDT)
X-Received: by 2002:a05:600c:3b1a:b0:493:c47f:3c55 with SMTP id
 5b1f17b1804b1-499dc6fb0fcmr153098895e9.5.1787821658814; 
 Thu, 27 Aug 2026 02:07:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499dd56826bsm55368365e9.4.2026.08.27.02.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 02:07:36 -0700 (PDT)
Message-ID: <e4dd7318-e498-46eb-8af7-ce138c3f0caf@redhat.com>
Date: Thu, 27 Aug 2026 11:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 06/28] hw/arm/smmuv3: Plumb transaction attributes into
 config helpers
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162446.2806393-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260813162446.2806393-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q7tKLei0V2QXwRyvQFhZY3ZRDGZUGewmN-oXHhle7a8_1787821659
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/13/26 6:24 PM, Tao Tang wrote:
> Introduce helpers that derive MemTxAttrs and select an AddressSpace from
> SEC_SID, then pass SEC_SID through the Stream Table and Context Descriptor
> fetch paths. This makes reads of SMMU configuration structures use the
> corresponding Non-secure or Secure memory context.
>
> To support these helpers, include hw/arm/arm-security.h from smmu-common.h,
> making the Arm security-space definitions available to the common SMMU code.
>
> The accelerated path remains Non-secure-only and therefore passes
> SMMU_SEC_SID_NS explicitly.
> For now, the configuration cache lookup key remains based solely on the
> SMMUDevice pointer. It is extended with SEC_SID in a later commit. Other
> SEC_SID-sensitive memory accesses that still use the Non-secure address
> space are converted in follow-up commits.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmu-common.c         | 30 +++++++++++++++++++++----
>  hw/arm/smmuv3-accel.c        |  2 +-
>  hw/arm/smmuv3-internal.h     |  3 ++-
>  hw/arm/smmuv3.c              | 43 ++++++++++++++++++++++--------------
>  include/hw/arm/smmu-common.h | 10 +++++++++
Please use
[diff]
        orderFile = scripts/git.orderfile
in your .gitconfig to have headers output first in the patch.

>  5 files changed, 65 insertions(+), 23 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 54a6a9f4d62..89e1e2826d4 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -30,6 +30,27 @@
>  #include "hw/arm/smmu-common.h"
>  #include "smmu-internal.h"
>  
> +ARMSecuritySpace smmu_get_security_space(SMMUSecSID sec_sid)
> +{
> +    switch (sec_sid) {
> +    case SMMU_SEC_SID_S:
> +        return ARMSS_Secure;
> +    case SMMU_SEC_SID_NS:
> +        return ARMSS_NonSecure;
> +    case SMMU_SEC_SID_NUM:
> +        g_assert_not_reached();
> +    }
> +    g_assert_not_reached();
> +}
> +
> +MemTxAttrs smmu_get_txattrs(SMMUSecSID sec_sid)
> +{
> +    return (MemTxAttrs) {
> +        .secure = smmu_sec_sid_is_secure(sec_sid) ? 1 : 0,
> +        .space = smmu_get_security_space(sec_sid),
> +    };
> +}
> +
>  AddressSpace *smmu_get_address_space(SMMUState *s, SMMUSecSID sec_sid)
>  {
>      switch (sec_sid) {
> @@ -588,6 +609,7 @@ error:
>  /**
>   * smmu_ptw_64_s2 - VMSAv8-64 Walk of the page tables for a given ipa
>   * for stage-2.
> + * @bs: smmu state which includes TLB instance
>   * @cfg: translation config
>   * @ipa: ipa to translate
>   * @perm: access type
> @@ -599,7 +621,7 @@ error:
>   * Upon success, @tlbe is filled with translated_addr and entry
>   * permission rights.
>   */
> -static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> +static int smmu_ptw_64_s2(SMMUState *bs, SMMUTransCfg *cfg,
>                            dma_addr_t ipa, IOMMUAccessFlags perm,
>                            SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
>  {
> @@ -636,7 +658,6 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>          uint64_t pte, gpa;
>          dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
>          uint8_t s2ap;
> -
unwanted change
>          if (get_pte(baseaddr, offset, &pte, info)) {
>                  goto error;
>          }
> @@ -690,6 +711,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
>              goto error_ipa;
>          }
>  
> +        tlbe->entry.target_as = &bs->memory_as;
I don't understand why we do that change in this patch (also there is no
sumetrical change in smmu_ptw_64_s1)? It does not seem to relate to the
commit title/desc
>          tlbe->entry.translated_addr = gpa;
>          tlbe->entry.iova = ipa & ~mask;
>          tlbe->entry.addr_mask = mask;
> @@ -765,7 +787,7 @@ int smmu_ptw(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t iova,
>              return -EINVAL;
>          }
>  
> -        return smmu_ptw_64_s2(cfg, iova, perm, tlbe, info);
> +        return smmu_ptw_64_s2(bs, cfg, iova, perm, tlbe, info);
>      }
>  
>      /* SMMU_NESTED. */
> @@ -775,7 +797,7 @@ int smmu_ptw(SMMUState *bs, SMMUTransCfg *cfg, dma_addr_t iova,
>      }
>  
>      ipa = CACHED_ENTRY_TO_ADDR(tlbe, iova);
> -    ret = smmu_ptw_64_s2(cfg, ipa, perm, &tlbe_s2, info);
> +    ret = smmu_ptw_64_s2(bs, cfg, ipa, perm, &tlbe_s2, info);
>      if (ret) {
>          return ret;
>      }
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 2ce94786829..9d207acc8e3 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -310,7 +310,7 @@ bool smmuv3_accel_install_ste(SMMUv3State *s, SMMUDevice *sdev, int sid,
>          return false;
>      }
>  
> -    if (smmu_find_ste(sdev->smmu, sid, &ste, &event)) {
> +    if (smmu_find_ste(sdev->smmu, sid, &ste, &event, sec_sid)) {
>          /* No STE found, nothing to install */
>          return true;
>      }
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 202cd533636..1f2f426da01 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -367,7 +367,8 @@ typedef struct SMMUEventInfo {
>  
>  void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *event);
>  void smmuv3_propagate_event(SMMUv3State *s, Evt *evt, SMMUSecSID sec_sid);
> -int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste, SMMUEventInfo *event);
> +int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste, SMMUEventInfo *event,
> +                  SMMUSecSID sec_sid);
>  
>  #define STE_SIZE 6
>  #define L1STD_SIZE 3
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 649050b9347..b5dc67dcb01 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -366,14 +366,15 @@ static void smmuv3_reset(SMMUv3State *s)
>  }
>  
>  static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
> -                        SMMUEventInfo *event)
> +                        SMMUEventInfo *event, SMMUSecSID sec_sid)
>  {
> +    AddressSpace *as = smmu_get_address_space(ARM_SMMU(s), sec_sid);
> +    MemTxAttrs txattrs = smmu_get_txattrs(sec_sid);
>      int ret, i;
>  
>      trace_smmuv3_get_ste(addr);
>      /* TODO: guarantee 64-bit single-copy atomicity */
> -    ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
> -                          MEMTXATTRS_UNSPECIFIED);
> +    ret = dma_memory_read(as, addr, buf, sizeof(*buf), txattrs);
>      if (ret != MEMTX_OK) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "Cannot fetch pte at address=0x%"PRIx64"\n", addr);
> @@ -396,12 +397,15 @@ static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                                                   SMMUTranslationClass class);
>  /* @ssid > 0 not supported yet */
>  static int smmu_get_cd(SMMUv3State *s, STE *ste, SMMUTransCfg *cfg,
> -                       uint32_t ssid, CD *buf, SMMUEventInfo *event)
> +                       uint32_t ssid, CD *buf, SMMUEventInfo *event,
> +                       SMMUSecSID sec_sid)
>  {
>      dma_addr_t addr = STE_CTXPTR(ste);
>      int ret, i;
>      SMMUTranslationStatus status;
>      SMMUTLBEntry *entry;
> +    AddressSpace *as;
> +    MemTxAttrs txattrs;
>  
>      trace_smmuv3_get_cd(addr);
>  
> @@ -417,9 +421,10 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, SMMUTransCfg *cfg,
>          addr = CACHED_ENTRY_TO_ADDR(entry, addr);
>      }
>  
> +    as = smmu_get_address_space(ARM_SMMU(s), sec_sid);
> +    txattrs = smmu_get_txattrs(sec_sid);
>      /* TODO: guarantee 64-bit single-copy atomicity */
> -    ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
> -                          MEMTXATTRS_UNSPECIFIED);
> +    ret = dma_memory_read(as, addr, buf, sizeof(*buf), txattrs);
>      if (ret != MEMTX_OK) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "Cannot fetch pte at address=0x%"PRIx64"\n", addr);
> @@ -680,18 +685,21 @@ bad_ste:
>   * @sid: stream ID
>   * @ste: returned stream table entry
>   * @event: handle to an event info
> + * @sec_sid: StreamID Security state
>   *
>   * Supports linear and 2-level stream table
>   * Return 0 on success, -EINVAL otherwise
>   */
> -int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste, SMMUEventInfo *event)
> +int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste, SMMUEventInfo *event,
> +                  SMMUSecSID sec_sid)
>  {
>      dma_addr_t addr, strtab_base;
>      uint32_t log2size;
>      int strtab_size;
>      int ret;
> -    SMMUSecSID sec_sid = SMMU_SEC_SID_NS;
>      SMMUv3RegBank *bank = smmuv3_bank(s, sec_sid);
> +    AddressSpace *as = smmu_get_address_space(ARM_SMMU(s), sec_sid);
> +    MemTxAttrs txattrs = smmu_get_txattrs(sec_sid);
>  
>      trace_smmuv3_find_ste(sid, bank->features, bank->sid_split);
>      log2size = FIELD_EX32(bank->strtab_base_cfg, STRTAB_BASE_CFG, LOG2SIZE);
> @@ -718,8 +726,7 @@ int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste, SMMUEventInfo *event)
>          l2_ste_offset = sid & ((1 << bank->sid_split) - 1);
>          l1ptr = (dma_addr_t)(strtab_base + l1_ste_offset * sizeof(l1std));
>          /* TODO: guarantee 64-bit single-copy atomicity */
> -        ret = dma_memory_read(&address_space_memory, l1ptr, &l1std,
> -                              sizeof(l1std), MEMTXATTRS_UNSPECIFIED);
> +        ret = dma_memory_read(as, l1ptr, &l1std, sizeof(l1std), txattrs);
>          if (ret != MEMTX_OK) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "Could not read L1PTR at 0X%"PRIx64"\n", l1ptr);
> @@ -773,7 +780,7 @@ int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste, SMMUEventInfo *event)
>          addr = strtab_base + sid * sizeof(*ste);
>      }
>  
> -    if (smmu_get_ste(s, addr, ste, event)) {
> +    if (smmu_get_ste(s, addr, ste, event, sec_sid)) {
>          return -EINVAL;
>      }
>  
> @@ -904,7 +911,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>      /* ASID defaults to -1 (if s1 is not supported). */
>      cfg->asid = -1;
>  
> -    ret = smmu_find_ste(s, sid, &ste, event);
> +    ret = smmu_find_ste(s, sid, &ste, event, sec_sid);
>      if (ret) {
>          return ret;
>      }
> @@ -918,7 +925,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>          return 0;
>      }
>  
> -    ret = smmu_get_cd(s, &ste, cfg, 0 /* ssid */, &cd, event);
> +    ret = smmu_get_cd(s, &ste, cfg, 0 /* ssid */, &cd, event, sec_sid);
>      if (ret) {
>          return ret;
>      }
> @@ -933,12 +940,14 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>   *
>   * @sdev: SMMUDevice handle
>   * @event: output event info
> + * @sec_sid: StreamID Security state
>   *
>   * The configuration cache contains data resulting from both STE and CD
>   * decoding under the form of an SMMUTransCfg struct. The hash table is indexed
>   * by the SMMUDevice handle.
>   */
> -static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
> +static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event,
> +                                       SMMUSecSID sec_sid)
>  {
>      SMMUv3State *s = sdev->smmu;
>      SMMUState *bc = &s->smmu_state;
> @@ -959,7 +968,7 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
>                              (sdev->cfg_cache_hits + sdev->cfg_cache_misses));
>          cfg = g_new0(SMMUTransCfg, 1);
>  
> -        if (!smmuv3_decode_config(&sdev->iommu, cfg, event, SMMU_SEC_SID_NS)) {
> +        if (!smmuv3_decode_config(&sdev->iommu, cfg, event, sec_sid)) {
>              g_hash_table_insert(bc->configs, sdev, cfg);
>          } else {
>              g_free(cfg);
> @@ -1139,7 +1148,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          goto epilogue;
>      }
>  
> -    cfg = smmuv3_get_config(sdev, &event);
> +    cfg = smmuv3_get_config(sdev, &event, sec_sid);
>      if (!cfg) {
>          status = SMMU_TRANS_ERROR;
>          goto epilogue;
> @@ -1221,7 +1230,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>      SMMUSecSID sec_sid = SMMU_SEC_SID_NS;
>      SMMUEventInfo eventinfo = {.sec_sid = sec_sid,
>                                 .inval_ste_allowed = true};
> -    SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo);
> +    SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo, sec_sid);
>      IOMMUTLBEvent event;
>      uint8_t granule;
>  
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 9d6e2d3038f..a31ffcf6e71 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -22,6 +22,7 @@
>  #include "hw/core/sysbus.h"
>  #include "hw/pci/pci.h"
>  #include "qom/object.h"
> +#include "hw/arm/arm-security.h"
>  
>  #define SMMU_PCI_BUS_MAX                    256
>  #define SMMU_PCI_DEVFN_MAX                  256
> @@ -47,6 +48,9 @@ typedef enum SMMUSecSID {
>      SMMU_SEC_SID_NUM,
>  } SMMUSecSID;
>  
> +MemTxAttrs smmu_get_txattrs(SMMUSecSID sec_sid);
> +ARMSecuritySpace smmu_get_security_space(SMMUSecSID sec_sid);
> +
>  /*
>   * Page table walk error types
>   */
> @@ -200,6 +204,12 @@ SMMUPciBus *smmu_get_sbus(SMMUState *s, PCIBus *bus);
>  /* Initialize SMMUDevice handle associated to a SMMUPciBus */
>  void smmu_init_sdev(SMMUState *s, SMMUDevice *sdev, PCIBus *bus, int devfn);
>  
> +
> +static inline bool smmu_sec_sid_is_secure(SMMUSecSID sec_sid)
> +{
> +    return sec_sid == SMMU_SEC_SID_S;
> +}
> +
>  /* Return the stream ID of an SMMU device */
>  static inline uint16_t smmu_get_sid(SMMUDevice *sdev)
>  {
Thanks

Eric


