Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93D4CAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 09:55:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3AbX-000813-MG; Mon, 29 Sep 2025 05:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v3AbV-0007xo-0r
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 05:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v3AbK-0008Eo-0I
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 05:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759139716;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AEcXhDfh5bSuEKi7eDUTCUYyARzR/a1aihohRluLboI=;
 b=e89w6l9xII6uwjlCJbUIfuJYeOCtT/7Ofsp4v8u7xUuImEXpg41Tr0cl9Nvc5g5Krg/sza
 gYrqg/VgEELi3DgH6SJ0saqky4esVHJVH7jpv7K6VEAMNl2P5fzf1qhBOktrAWVQAWSOTX
 EhvmVG6dIpV0e80pst7BMrzqqg2d1/k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-IkMJ4OF5MMCZf8G5LIs5SA-1; Mon, 29 Sep 2025 05:55:14 -0400
X-MC-Unique: IkMJ4OF5MMCZf8G5LIs5SA-1
X-Mimecast-MFC-AGG-ID: IkMJ4OF5MMCZf8G5LIs5SA_1759139713
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3efe4fcc9ccso2697923f8f.3
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 02:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759139713; x=1759744513;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AEcXhDfh5bSuEKi7eDUTCUYyARzR/a1aihohRluLboI=;
 b=vTv9D45wEtoJuhC6PenrZCleK11Fkvo9368W/dP8mN34ZBpSm065kGkSww19Q/Yo2C
 fJnwGEPAwQTSYS+LOJTRCOPPtyXWJa1vRzLzEy+Bj7tr/vqZQ7E7FGudJy86hGQdChDI
 9kZaOIkaXy+QCmuKapyFh9Kp2fsjG/c7TknNd6hR4mWsIS0vq91twzEhlaNqRcOkVAyh
 cdrrHFIu+Xt4iIkxhAnFrZ7NecpIaamv3iRkZRkwMT50u7tN2DwiVFxP3bJXMWHm6zqr
 rMhw1g9TltlwCroWgfIgem4FfOgd2CosMKpNph3EZA3z+IBA6omPPqNI1oXJgf57gwWQ
 WAhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWck4iilDtqgjFsMfQigPTni6TqcmiPSTbKEC6eNRQTw/Cp8I3AYtauZ3xNcHA6JmPZyLEBY0vbkw==@nongnu.org
X-Gm-Message-State: AOJu0Yy2DmWlAmuV9SLa8wI5GpzaEmOjAF+HQU4ZnlGv0LPzexPyr0IY
 Uz7u9sXuA5viwIZTPJIWYNlUt3TSLS16ggdP7/Wh9OmHe3KRMfOZNFGLY3hqqa972i1id5w0lyZ
 ZweZNxTIIxF4+KvgR++NiZwpGP1tSaCfxq/KB9uEizNIB0GjX4KEMbw==
X-Gm-Gg: ASbGncsnW5IiV+th7Pof7cncO4JfGf25VlKjgZrfQ23mFqwuCwcFjMkBaO4x/t1sA1W
 KuHHJ+O6g4IHhoxis4ENx5zttSfv7l4muYKw66+r4m2ywoPw2Ov+mOgVC+M5ARA2iK8VdwJRZmz
 Tiba016dHHokldEZrLHTG3O3CGps/F6+zXwQEfwjqvg9deiyXVK05IONSOtvkgH8tjN9SoqBPGy
 wf2D2ElcXu3jxGfYIxw76RgQ2Y9dclzbC/wBEJaXVRWkjcK8HxR5s66+R63htF7vD8tbugvitIk
 ByXrWaiWVPKREERKAS8XzWckj8/Dd4xaqf+Z8gvPfsweX4qrIID3ILKRIFNU+Lq7F0RrAsx/ixU
 tAmvDvvnfhpc=
X-Received: by 2002:a05:6000:601:b0:40e:604:8e29 with SMTP id
 ffacd0b85a97d-40e4a7113a4mr14979091f8f.15.1759139713206; 
 Mon, 29 Sep 2025 02:55:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW1DuWEMAUd6aaFZcnh52j+3LTIEIiYz5peS1QmqKsHCmJqDJS8Jw8sQtidAyAawOWRJk/hg==
X-Received: by 2002:a05:6000:601:b0:40e:604:8e29 with SMTP id
 ffacd0b85a97d-40e4a7113a4mr14979057f8f.15.1759139712701; 
 Mon, 29 Sep 2025 02:55:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc6921bcfsm18492329f8f.43.2025.09.29.02.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 02:55:12 -0700 (PDT)
Message-ID: <4b90afba-d708-4628-a087-c16829ee0512@redhat.com>
Date: Mon, 29 Sep 2025 11:55:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] hw/arm/smmuv3: Make Configuration Cache
 security-state aware
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>, pierrick.bouvier@linaro.org,
 philmd@linaro.org, jean-philippe@linaro.org, smostafa@google.com
References: <20250925162618.191242-1-tangtao1634@phytium.com.cn>
 <20250925162618.191242-8-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250925162618.191242-8-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jEbmkrRxnGJvXsqZUDWE8rg-hE-WqmHB0m28XA5X1Kc_1759139713
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



On 9/25/25 6:26 PM, Tao Tang wrote:
> This patch adapts the Configuration Cache (STE/CD caches) to support
> multiple security states.
>
> The cache key, previously just the SMMUDevice, is now a composite key
> of the SMMUDevice and the security index (sec_idx). This allows for
> separate cache entries for the same device when operating in different
> security states, preventing aliasing between secure and non-secure
> configurations.
>
> The configuration cache invalidation functions have been refactored to
> correctly handle multiple security states, ensuring that invalidation
> commands operate on the appropriate cache entries.
>
> Finally, checks have been added to the stream table's MMIO read/write
> logic to verify if the stream table is writable. This ensures that the
> Configuration Cache management is compliant with the architecture.
I think this patch shall be split too. I would suggest

- In a preliminary patch, add txattrs and as new members in SMMUTransCfg
+ the related changes (smmu_get_ste, smmu_get_cd, smmu_find_ste.
smmuv3_translate. Add their init in smmuv3_get_config while leaving the
current key as is.
- In a second patch, manage the new config key
- then there are a bunch of changes which does not relate to
configuration cache: smmu_writell, smmu_writel and
smmu_strtab_base_writable. I think this can go in a separate patch.

What do you think?

Eric

>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmu-common.c         | 63 ++++++++++++++++++++++-
>  hw/arm/smmuv3.c              | 98 ++++++++++++++++++++++++++++--------
>  include/hw/arm/smmu-common.h | 14 ++++++
>  3 files changed, 153 insertions(+), 22 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 24db448683..bc13b00f1d 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -30,6 +30,43 @@
>  #include "hw/arm/smmu-common.h"
>  #include "smmu-internal.h"
>  
> +/* Configuration Cache Management */
> +static guint smmu_config_key_hash(gconstpointer key)
> +{
> +    const SMMUConfigKey *k = key;
> +    return g_direct_hash(k->sdev) ^ (guint)k->sec_idx;
> +}
> +
> +static gboolean smmu_config_key_equal(gconstpointer a, gconstpointer b)
> +{
> +    const SMMUConfigKey *ka = a;
> +    const SMMUConfigKey *kb = b;
> +    return ka->sdev == kb->sdev && ka->sec_idx == kb->sec_idx;
> +}
> +
> +SMMUConfigKey smmu_get_config_key(SMMUDevice *sdev, SMMUSecurityIndex sec_idx)
> +{
> +    SMMUConfigKey key = {.sdev = sdev, .sec_idx = sec_idx};
> +    return key;
> +}
> +
> +ARMSecuritySpace smmu_get_security_space(SMMUSecurityIndex sec_idx)
> +{
> +    switch (sec_idx) {
> +    case SMMU_SEC_IDX_S:
> +        return ARMSS_Secure;
> +    case SMMU_SEC_IDX_NS:
> +    default:
> +        return ARMSS_NonSecure;
> +    }
> +}
> +
> +MemTxAttrs smmu_get_txattrs(SMMUSecurityIndex sec_idx)
> +{
> +    return (MemTxAttrs) { .secure = sec_idx > SMMU_SEC_IDX_NS ? 1 : 0,
> +                          .space = smmu_get_security_space(sec_idx) };
> +}
> +
>  /* Global state for secure address space availability */
>  bool arm_secure_as_available;
>  
> @@ -237,7 +274,8 @@ static gboolean smmu_hash_remove_by_vmid_ipa(gpointer key, gpointer value,
>  static gboolean
>  smmu_hash_remove_by_sid_range(gpointer key, gpointer value, gpointer user_data)
>  {
> -    SMMUDevice *sdev = (SMMUDevice *)key;
> +    SMMUConfigKey *config_key = (SMMUConfigKey *)key;
> +    SMMUDevice *sdev = config_key->sdev;
>      uint32_t sid = smmu_get_sid(sdev);
>      SMMUSIDRange *sid_range = (SMMUSIDRange *)user_data;
>  
> @@ -255,6 +293,25 @@ void smmu_configs_inv_sid_range(SMMUState *s, SMMUSIDRange sid_range)
>                                  &sid_range);
>  }
>  
> +/* Remove all cached configs for a specific device, regardless of security. */
> +static gboolean smmu_hash_remove_by_sdev(gpointer key, gpointer value,
> +                                         gpointer user_data)
> +{
> +    SMMUConfigKey *config_key = (SMMUConfigKey *)key;
> +    SMMUDevice *target = (SMMUDevice *)user_data;
> +
> +    if (config_key->sdev != target) {
> +        return false;
> +    }
> +    trace_smmu_config_cache_inv(smmu_get_sid(target));
> +    return true;
> +}
> +
> +void smmu_configs_inv_sdev(SMMUState *s, SMMUDevice *sdev)
> +{
> +    g_hash_table_foreach_remove(s->configs, smmu_hash_remove_by_sdev, sdev);
> +}
> +
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl)
>  {
> @@ -942,7 +999,9 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>          error_propagate(errp, local_err);
>          return;
>      }
> -    s->configs = g_hash_table_new_full(NULL, NULL, NULL, g_free);
> +    s->configs = g_hash_table_new_full(smmu_config_key_hash,
> +                                       smmu_config_key_equal,
> +                                       g_free, g_free);
>      s->iotlb = g_hash_table_new_full(smmu_iotlb_key_hash, smmu_iotlb_key_equal,
>                                       g_free, g_free);
>      s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 2efa39b78c..eba709ae2b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -352,14 +352,13 @@ static void smmuv3_init_regs(SMMUv3State *s)
>  }
>  
>  static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
> -                        SMMUEventInfo *event)
> +                        SMMUEventInfo *event, SMMUTransCfg *cfg)
>  {
>      int ret, i;
>  
>      trace_smmuv3_get_ste(addr);
>      /* TODO: guarantee 64-bit single-copy atomicity */
> -    ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
> -                          MEMTXATTRS_UNSPECIFIED);
> +    ret = dma_memory_read(cfg->as, addr, buf, sizeof(*buf), cfg->txattrs);
>      if (ret != MEMTX_OK) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "Cannot fetch pte at address=0x%"PRIx64"\n", addr);
> @@ -404,8 +403,7 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, SMMUTransCfg *cfg,
>      }
>  
>      /* TODO: guarantee 64-bit single-copy atomicity */
> -    ret = dma_memory_read(&address_space_memory, addr, buf, sizeof(*buf),
> -                          MEMTXATTRS_UNSPECIFIED);
> +    ret = dma_memory_read(cfg->as, addr, buf, sizeof(*buf), cfg->txattrs);
>      if (ret != MEMTX_OK) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "Cannot fetch pte at address=0x%"PRIx64"\n", addr);
> @@ -699,8 +697,8 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>          l2_ste_offset = sid & ((1 << sid_split) - 1);
>          l1ptr = (dma_addr_t)(strtab_base + l1_ste_offset * sizeof(l1std));
>          /* TODO: guarantee 64-bit single-copy atomicity */
> -        ret = dma_memory_read(&address_space_memory, l1ptr, &l1std,
> -                              sizeof(l1std), MEMTXATTRS_UNSPECIFIED);
> +        ret = dma_memory_read(cfg->as, l1ptr,
> +                              &l1std, sizeof(l1std), cfg->txattrs);
>          if (ret != MEMTX_OK) {
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "Could not read L1PTR at 0X%"PRIx64"\n", l1ptr);
> @@ -742,7 +740,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>          addr = strtab_base + sid * sizeof(*ste);
>      }
>  
> -    if (smmu_get_ste(s, addr, ste, event)) {
> +    if (smmu_get_ste(s, addr, ste, event, cfg)) {
>          return -EINVAL;
>      }
>  
> @@ -900,18 +898,21 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>   *
>   * @sdev: SMMUDevice handle
>   * @event: output event info
> + * @sec_idx: security index
>   *
>   * The configuration cache contains data resulting from both STE and CD
>   * decoding under the form of an SMMUTransCfg struct. The hash table is indexed
>   * by the SMMUDevice handle.
>   */
> -static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
> +static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event,
> +                                       SMMUSecurityIndex sec_idx)
>  {
>      SMMUv3State *s = sdev->smmu;
>      SMMUState *bc = &s->smmu_state;
>      SMMUTransCfg *cfg;
> +    SMMUConfigKey lookup_key = smmu_get_config_key(sdev, sec_idx);
>  
> -    cfg = g_hash_table_lookup(bc->configs, sdev);
> +    cfg = g_hash_table_lookup(bc->configs, &lookup_key);
>      if (cfg) {
>          sdev->cfg_cache_hits++;
>          trace_smmuv3_config_cache_hit(smmu_get_sid(sdev),
> @@ -925,9 +926,14 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event)
>                              100 * sdev->cfg_cache_hits /
>                              (sdev->cfg_cache_hits + sdev->cfg_cache_misses));
>          cfg = g_new0(SMMUTransCfg, 1);
> +        cfg->sec_idx = sec_idx;
> +        cfg->txattrs = smmu_get_txattrs(sec_idx);
> +        cfg->as = smmu_get_address_space(sec_idx);
>  
>          if (!smmuv3_decode_config(&sdev->iommu, cfg, event)) {
> -            g_hash_table_insert(bc->configs, sdev, cfg);
> +            SMMUConfigKey *persistent_key = g_new(SMMUConfigKey, 1);
> +            *persistent_key = smmu_get_config_key(sdev, sec_idx);
> +            g_hash_table_insert(bc->configs, persistent_key, cfg);
>          } else {
>              g_free(cfg);
>              cfg = NULL;
> @@ -941,8 +947,8 @@ static void smmuv3_flush_config(SMMUDevice *sdev)
>      SMMUv3State *s = sdev->smmu;
>      SMMUState *bc = &s->smmu_state;
>  
> -    trace_smmu_config_cache_inv(smmu_get_sid(sdev));
> -    g_hash_table_remove(bc->configs, sdev);
> +    /* Remove all security-indexed configs for this device */
> +    smmu_configs_inv_sdev(bc, sdev);
>  }
>  
>  /* Do translation with TLB lookup. */
> @@ -1102,7 +1108,7 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>          goto epilogue;
>      }
>  
> -    cfg = smmuv3_get_config(sdev, &event);
> +    cfg = smmuv3_get_config(sdev, &event, sec_idx);
>      if (!cfg) {
>          status = SMMU_TRANS_ERROR;
>          goto epilogue;
> @@ -1182,7 +1188,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>  {
>      SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>      SMMUEventInfo eventinfo = {.inval_ste_allowed = true};
> -    SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo);
> +    SMMUTransCfg *cfg = smmuv3_get_config(sdev, &eventinfo, SMMU_SEC_IDX_NS);
>      IOMMUTLBEvent event;
>      uint8_t granule;
>  
> @@ -1314,6 +1320,38 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
>      }
>  }
>  
> +static inline int smmuv3_get_cr0_smmuen(SMMUv3State *s,
> +                                        SMMUSecurityIndex sec_idx)
> +{
> +    return smmu_enabled(s, sec_idx);
> +}
> +
> +static inline int smmuv3_get_cr0ack_smmuen(SMMUv3State *s,
> +                                           SMMUSecurityIndex sec_idx)
> +{
> +    return FIELD_EX32(s->bank[sec_idx].cr0ack, CR0, SMMUEN);
> +}
> +
> +static inline bool smmuv3_is_smmu_enabled(SMMUv3State *s,
> +                                          SMMUSecurityIndex sec_idx)
> +{
> +    int cr0_smmuen = smmuv3_get_cr0_smmuen(s, sec_idx);
> +    int cr0ack_smmuen = smmuv3_get_cr0ack_smmuen(s, sec_idx);
> +    return (cr0_smmuen == 0 && cr0ack_smmuen == 0);
> +}
> +
> +/* Check if STRTAB_BASE register is writable */
> +static bool smmu_strtab_base_writable(SMMUv3State *s, SMMUSecurityIndex sec_idx)
> +{
> +    /* Check TABLES_PRESET - use NS bank as it's the global setting */
> +    if (FIELD_EX32(s->bank[SMMU_SEC_IDX_NS].idr[1], IDR1, TABLES_PRESET)) {
> +        return false;
> +    }
> +
> +    /* Check SMMUEN conditions for the specific security domain */
> +    return smmuv3_is_smmu_enabled(s, sec_idx);
> +}
> +
>  static int smmuv3_cmdq_consume(SMMUv3State *s, SMMUSecurityIndex sec_idx)
>  {
>      SMMUState *bs = ARM_SMMU(s);
> @@ -1553,6 +1591,11 @@ static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
>      uint32_t reg_offset = offset & 0xfff;
>      switch (reg_offset) {
>      case A_STRTAB_BASE:
> +        if (!smmu_strtab_base_writable(s, reg_sec_idx)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "STRTAB_BASE write ignored: register is RO\n");
> +            return MEMTX_OK;
> +        }
>          /* Clear reserved bits according to spec */
>          s->bank[reg_sec_idx].strtab_base = data & SMMU_STRTAB_BASE_RESERVED;
>          return MEMTX_OK;
> @@ -1637,14 +1680,29 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>          }
>          return MEMTX_OK;
>      case A_STRTAB_BASE: /* 64b */
> -        s->bank[reg_sec_idx].strtab_base =
> -            deposit64(s->bank[reg_sec_idx].strtab_base, 0, 32, data);
> -        return MEMTX_OK;
>      case A_STRTAB_BASE + 4:
> -        s->bank[reg_sec_idx].strtab_base =
> -            deposit64(s->bank[reg_sec_idx].strtab_base, 32, 32, data);
> +        if (!smmu_strtab_base_writable(s, reg_sec_idx)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "STRTAB_BASE write ignored: register is RO\n");
> +            return MEMTX_OK;
> +        }
> +
> +        data &= SMMU_STRTAB_BASE_RESERVED;
> +        if (reg_offset == A_STRTAB_BASE) {
> +            s->bank[reg_sec_idx].strtab_base = deposit64(
> +                s->bank[reg_sec_idx].strtab_base, 0, 32, data);
> +        } else {
> +            s->bank[reg_sec_idx].strtab_base = deposit64(
> +                s->bank[reg_sec_idx].strtab_base, 32, 32, data);
> +        }
>          return MEMTX_OK;
>      case A_STRTAB_BASE_CFG:
> +        if (!smmu_strtab_base_writable(s, reg_sec_idx)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "STRTAB_BASE_CFG write ignored: register is RO\n");
> +            return MEMTX_OK;
> +        }
> +
>          s->bank[reg_sec_idx].strtab_base_cfg = data;
>          if (FIELD_EX32(data, STRTAB_BASE_CFG, FMT) == 1) {
>              s->bank[reg_sec_idx].sid_split =
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index cd61c5e126..ed21db7728 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -22,6 +22,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/pci/pci.h"
>  #include "qom/object.h"
> +#include "hw/arm/arm-security.h"
>  
>  #define SMMU_PCI_BUS_MAX                    256
>  #define SMMU_PCI_DEVFN_MAX                  256
> @@ -53,6 +54,9 @@ typedef enum SMMUSecurityIndex {
>      SMMU_SEC_IDX_NUM,
>  } SMMUSecurityIndex;
>  
> +MemTxAttrs smmu_get_txattrs(SMMUSecurityIndex sec_idx);
> +ARMSecuritySpace smmu_get_security_space(SMMUSecurityIndex sec_idx);
> +
>  extern AddressSpace __attribute__((weak)) arm_secure_address_space;
>  extern bool arm_secure_as_available;
>  void smmu_enable_secure_address_space(void);
> @@ -150,6 +154,8 @@ typedef struct SMMUTransCfg {
>      /* Used by stage-2 only. */
>      struct SMMUS2Cfg s2cfg;
>      SMMUSecurityIndex sec_idx; /* cached security index */
> +    MemTxAttrs txattrs;        /* cached transaction attributes */
> +    AddressSpace *as;          /* cached address space */
>  } SMMUTransCfg;
>  
>  typedef struct SMMUDevice {
> @@ -176,6 +182,11 @@ typedef struct SMMUIOTLBKey {
>      uint8_t level;
>  } SMMUIOTLBKey;
>  
> +typedef struct SMMUConfigKey {
> +    SMMUDevice *sdev;
> +    SMMUSecurityIndex sec_idx;
> +} SMMUConfigKey;
> +
>  typedef struct SMMUSIDRange {
>      uint32_t start;
>      uint32_t end;
> @@ -251,6 +262,7 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>  void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
>  SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level);
> +SMMUConfigKey smmu_get_config_key(SMMUDevice *sdev, SMMUSecurityIndex sec_idx);
>  void smmu_iotlb_inv_all(SMMUState *s);
>  void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
>  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
> @@ -260,6 +272,8 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>  void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
>                          uint64_t num_pages, uint8_t ttl);
>  void smmu_configs_inv_sid_range(SMMUState *s, SMMUSIDRange sid_range);
> +/* Invalidate all cached configs for a given device across all security idx */
> +void smmu_configs_inv_sdev(SMMUState *s, SMMUDevice *sdev);
>  /* Unmap the range of all the notifiers registered to any IOMMU mr */
>  void smmu_inv_notifiers_all(SMMUState *s);
>  


