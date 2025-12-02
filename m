Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94703CFD2F6
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Dec 2025 14:18:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQRD1-0006aL-Nv; Tue, 02 Dec 2025 09:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vQRD0-0006Zt-6J
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 09:18:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vQRCw-0004Bz-Kt
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 09:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764685100;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N02afQ6nsKtEvowCN0rYgCNOKt9twcfH2EwiRsRX6FU=;
 b=bzImdXLebD+6mDFWeVP5z2d+KWPUkoRi0c4bIGrH0I3Cj2uchRF9YE7RUyi/jsiu+zxG1U
 fJM1NhHH3Z0bljzMtY5preMqCMxCZHR9Ya4V7C439yvRmRuHsH/eWM2pWkMsr5FQKEV1vg
 twQGQt0SjdTMWppMVSvdpFNSRS7Wmz0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-3FHg_EyJP_KmJMwSis6pDA-1; Tue, 02 Dec 2025 09:18:19 -0500
X-MC-Unique: 3FHg_EyJP_KmJMwSis6pDA-1
X-Mimecast-MFC-AGG-ID: 3FHg_EyJP_KmJMwSis6pDA_1764685099
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2e41884a0so1269880685a.1
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 06:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764685099; x=1765289899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N02afQ6nsKtEvowCN0rYgCNOKt9twcfH2EwiRsRX6FU=;
 b=EC82qHikyo48ZjIDUoxdQCkKs0FxLys8FTjNlLXqRrokn+ZuRFrI5o+++QO23Txwuo
 DqZwX2TpowOpR5jrkCWfnCiMVMLV9doR+n8uZy0QXTn3wg3gs0Kx27Qq1jqImnXsDg1m
 Dr+uwqxQIgHcX1Sb9NR6OreTWZduMUaMtXogYTxwxOJdG47C6EpzmUvMLHPpTqaiG+eo
 EnkKPdj5K1APjWlZRWexs5hV8gMrUZ4I60Tda399C4WVf35SmQvVTz1bZzyrLmtWEP1X
 IclMlKeUZUWmO6a477nyHcCuebnSWodvlkBx/NrPXKZGnmvIZRaGoWBKAJtxMvupLFax
 ggVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBtndt5AWNWgIV9cmqhjVhqlZ3ftQ06c19it6RQMHl2rTHoobEHhmSOaofO1+Wfx3+31hJ8UrIZw==@nongnu.org
X-Gm-Message-State: AOJu0YzRv8Qznxv3i4i/WpYB2Sh14iW2QDBBVskzdH94fntcd9uQ1NB1
 KZ/Btpxe0XCNHlRV742Kfev8CHk5ExCku39YtSpeROIMzcLpFyk89u9aZbSSIsvW2nFTJm8X5iJ
 QNGQRtwU/UhaJXxwFzkP3D2EYt59pu/5Cyg0XlFpczd9VYMsrVJ5kqZMqE/fxZg==
X-Gm-Gg: ASbGncvuNq7WjyvfJIRjYeCsd4G7Zf3J/dpmoteg1RIpAVl6DHQLDOc74vESwo0IjjY
 gMe6VywkkcScQm3Lf5KDnwSkUUpX4m+CY5VrcNJe0uWev5FR/vL+S6kqGdVDPM5fXSiUdT54tQb
 nYF7Xx+O+uSl5EDR2VnS276hXkNKbIb7SvSZTiBgPM78CwsJFHuWxwL16lmTHSqG6zFnlZQuZ8q
 RsUtdAUXDThUqO6lUO/f0Vm3drXm+cV/j8YrI57lSpc/rWp6kKjARGpcyo3OuUybrDNul/kT8fZ
 oCvSLcfees7n239o2nQE3CpBKKTHVmoau+MMfnkiuhyxc/a5YszkEaLQOTqtOg1/oZkDgRJs53e
 sEJEdyz/+ZKBO+voE9gpqX9oNHxKHidrGIawy153enrWTnwXvobcPihdxbQ==
X-Received: by 2002:a05:620a:172c:b0:8b2:efb6:5d07 with SMTP id
 af79cd13be357-8b33d47823amr5530873685a.48.1764685098796; 
 Tue, 02 Dec 2025 06:18:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBbdswql/b3NYDzcwk4inq93LOqv4tOlhQDI+gFHupHGdAci1VIVPdq1+6n1t1q+F01CINeg==
X-Received: by 2002:a05:620a:172c:b0:8b2:efb6:5d07 with SMTP id
 af79cd13be357-8b33d47823amr5530866685a.48.1764685098262; 
 Tue, 02 Dec 2025 06:18:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e?
 ([2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b5304c960asm997598585a.19.2025.12.02.06.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 06:18:17 -0800 (PST)
Message-ID: <a9a840a6-c65f-4352-9a49-ddd1b5483f43@redhat.com>
Date: Tue, 2 Dec 2025 15:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 10/21] hw/arm/smmu-common: Key configuration cache on
 SMMUDevice and SEC_SID
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
References: <20251012150701.4127034-1-tangtao1634@phytium.com.cn>
 <20251012150701.4127034-11-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251012150701.4127034-11-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ixy1C3f4UOnjSFVTkSbLKYPJBirQxdiHgdp4LgQlAEc_1764685099
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

Hi Tao,

On 10/12/25 5:06 PM, Tao Tang wrote:
> Adapt the configuration cache to support multiple security states by
> introducing a composite key, SMMUConfigKey. This key combines the
> SMMUDevice with SEC_SID, preventing aliasing between Secure and
> Non-secure configurations for the same device, also the future Realm and
> Root configurations.
>
> The cache lookup, insertion, and invalidation mechanisms are updated
> to use this new keying infrastructure. This change is critical for
> ensuring correct translation when a device is active in more than one
> security world.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmu-common.c         | 45 ++++++++++++++++++++++++++++++++++--
>  hw/arm/smmuv3.c              | 13 +++++++----
>  include/hw/arm/smmu-common.h |  7 ++++++
>  3 files changed, 58 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 82308f0e33..5fabe30c75 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -30,6 +30,26 @@
>  #include "hw/arm/smmu-common.h"
>  #include "smmu-internal.h"
>  
> +/* Configuration Cache Management */
> +static guint smmu_config_key_hash(gconstpointer key)
> +{
> +    const SMMUConfigKey *k = key;
> +    return g_direct_hash(k->sdev) ^ (guint)k->sec_sid;
> +}
> +
> +static gboolean smmu_config_key_equal(gconstpointer a, gconstpointer b)
> +{
> +    const SMMUConfigKey *ka = a;
> +    const SMMUConfigKey *kb = b;
> +    return ka->sdev == kb->sdev && ka->sec_sid == kb->sec_sid;
> +}
> +
> +SMMUConfigKey smmu_get_config_key(SMMUDevice *sdev, SMMUSecSID sec_sid)
> +{
> +    SMMUConfigKey key = {.sdev = sdev, .sec_sid = sec_sid};
> +    return key;
> +}
> +
>  ARMSecuritySpace smmu_get_security_space(SMMUSecSID sec_sid)
>  {
>      switch (sec_sid) {
> @@ -256,7 +276,8 @@ static gboolean smmu_hash_remove_by_vmid_ipa(gpointer key, gpointer value,
>  static gboolean
>  smmu_hash_remove_by_sid_range(gpointer key, gpointer value, gpointer user_data)
>  {
> -    SMMUDevice *sdev = (SMMUDevice *)key;
> +    SMMUConfigKey *config_key = (SMMUConfigKey *)key;
> +    SMMUDevice *sdev = config_key->sdev;
>      uint32_t sid = smmu_get_sid(sdev);
>      SMMUSIDRange *sid_range = (SMMUSIDRange *)user_data;
>  
> @@ -274,6 +295,24 @@ void smmu_configs_inv_sid_range(SMMUState *s, SMMUSIDRange sid_range)
>                                  &sid_range);
>  }
>  
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
> @@ -961,7 +1000,9 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
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
> index 351bbf1ae9..55f4ad1757 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -878,10 +878,11 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
>   *
>   * @sdev: SMMUDevice handle
>   * @event: output event info
> + * @sec_sid: StreamID Security state
>   *
>   * The configuration cache contains data resulting from both STE and CD
>   * decoding under the form of an SMMUTransCfg struct. The hash table is indexed
> - * by the SMMUDevice handle.
> + * by a composite key of the SMMUDevice and the sec_sid.
>   */
>  static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event,
>                                         SMMUSecSID sec_sid)
> @@ -889,8 +890,9 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event,
>      SMMUv3State *s = sdev->smmu;
>      SMMUState *bc = &s->smmu_state;
>      SMMUTransCfg *cfg;
> +    SMMUConfigKey lookup_key = smmu_get_config_key(sdev, sec_sid);
>  
> -    cfg = g_hash_table_lookup(bc->configs, sdev);
> +    cfg = g_hash_table_lookup(bc->configs, &lookup_key);
>      if (cfg) {
>          sdev->cfg_cache_hits++;
>          trace_smmuv3_config_cache_hit(smmu_get_sid(sdev),
> @@ -915,7 +917,9 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sdev, SMMUEventInfo *event,
>          }
>  
>          if (!smmuv3_decode_config(&sdev->iommu, cfg, event)) {
> -            g_hash_table_insert(bc->configs, sdev, cfg);
> +            SMMUConfigKey *persistent_key = g_new(SMMUConfigKey, 1);
> +            *persistent_key = lookup_key;
> +            g_hash_table_insert(bc->configs, persistent_key, cfg);
>          } else {
>              g_free(cfg);
>              cfg = NULL;
> @@ -929,8 +933,7 @@ static void smmuv3_flush_config(SMMUDevice *sdev)
>      SMMUv3State *s = sdev->smmu;
>      SMMUState *bc = &s->smmu_state;
>  
> -    trace_smmu_config_cache_inv(smmu_get_sid(sdev));
> -    g_hash_table_remove(bc->configs, sdev);
> +    smmu_configs_inv_sdev(bc, sdev);
>  }
>  
>  /* Do translation with TLB lookup. */
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index c17c7db6e5..bccbbe0115 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -182,6 +182,11 @@ typedef struct SMMUIOTLBKey {
>      uint8_t level;
>  } SMMUIOTLBKey;
>  
> +typedef struct SMMUConfigKey {
> +    SMMUDevice *sdev;
> +    SMMUSecSID sec_sid;
> +} SMMUConfigKey;
> +
>  typedef struct SMMUSIDRange {
>      uint32_t start;
>      uint32_t end;
> @@ -257,6 +262,7 @@ SMMUTLBEntry *smmu_iotlb_lookup(SMMUState *bs, SMMUTransCfg *cfg,
>  void smmu_iotlb_insert(SMMUState *bs, SMMUTransCfg *cfg, SMMUTLBEntry *entry);
>  SMMUIOTLBKey smmu_get_iotlb_key(int asid, int vmid, uint64_t iova,
>                                  uint8_t tg, uint8_t level);
> +SMMUConfigKey smmu_get_config_key(SMMUDevice *sdev, SMMUSecSID sec_sid);
>  void smmu_iotlb_inv_all(SMMUState *s);
>  void smmu_iotlb_inv_asid_vmid(SMMUState *s, int asid, int vmid);
>  void smmu_iotlb_inv_vmid(SMMUState *s, int vmid);
> @@ -266,6 +272,7 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>  void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
>                          uint64_t num_pages, uint8_t ttl);
>  void smmu_configs_inv_sid_range(SMMUState *s, SMMUSIDRange sid_range);
> +void smmu_configs_inv_sdev(SMMUState *s, SMMUDevice *sdev);
>  /* Unmap the range of all the notifiers registered to any IOMMU mr */
>  void smmu_inv_notifiers_all(SMMUState *s);
>  


