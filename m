Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CDDD206A9
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 14:33:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRAOn-0007bb-SP; Thu, 04 Dec 2025 09:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vRAOm-0007b6-Ty
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 09:33:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vRAOk-0007RO-BE
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 09:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764858813;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJTbbx9bvccEvtU1F7UOZYSh0YBKtNEjL+ESlkbOtvs=;
 b=CPlTJ1n7LuIxxqV51iz6UqqNSW/NBtiRBZCRVT82AwY+KiKpt4g4k0LSE1m7x6RIsgWwNy
 Kkvw8tBviMWEAF4GximTRBaaazq3rx4MWSzJNvslnZZirWjOanRW2eGsmZqgejS+kS6Xkc
 jKOoVj5UxchQDOsi6d2QHCfWwRTKd/Y=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-0io4t1gjOlOnjHCvZ_LAqg-1; Thu, 04 Dec 2025 09:33:30 -0500
X-MC-Unique: 0io4t1gjOlOnjHCvZ_LAqg-1
X-Mimecast-MFC-AGG-ID: 0io4t1gjOlOnjHCvZ_LAqg_1764858809
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-6421389c362so1177650d50.1
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 06:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764858809; x=1765463609;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yJTbbx9bvccEvtU1F7UOZYSh0YBKtNEjL+ESlkbOtvs=;
 b=CE8ZElszpqounBVPAqAGLKyZwjZdYKod2ua/t806uIdWELgyReng+tu8JTmmrfTUNF
 hZ5U7nQBUQxTeR5vkOO/WKyDKJa47YcI6Lo7eIKxv76BdMrAYVl5HfzdmCge5PA+m7BI
 o93Q+7PWZ25MITLUPjrLlkPA4V3rCKUvDqfYpSM7WXneY5T+Tsc4RnjSLKZZIOSP4EvX
 dnogGa7WLUOP4Njk1sjH4eRUSDsqcnoXYpNxHMhHK6QX9g7cQ5kh2/4Nwq4EAjop7ONO
 /S5cjedZZmiIkJM2eIxRsIa2zUjsMzF/MxsmtAkQADFjRP7hDrSg2BJHH2PNFLSYwRUQ
 aaCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1qxhwgDhVf0SBwd+31t9MF5mmQKIcwqrX+0LSeRNAAkku+aK4CXubYiIJrAb3z4r25dtwU6anOw==@nongnu.org
X-Gm-Message-State: AOJu0Yy6aD4JsqbbeTIZBLMoDn29h0ZZOaYD612EDREu+hhQeNYtSLbl
 ZkSqdakhExlUuQlfn1eTRh9kAJi6qYs41Oxp0XseGMjb4MPCln1sqtK8FZaDt5gkd3kEwl72vbg
 IEIRFjfBzEeZ4tOfDFXzRx8Yv8xemvxd7pfxkoEJS4QLm8w4huDmb+mXNNZh47g==
X-Gm-Gg: ASbGncsrl9HfI1SSrFfrhTrwIC/bdetwcNmb65l7bDPOwLFzjm0l2uB55S6QOvxXH2E
 HMm76kF5LcwONw5skUjbYqVKyrgZ5IeJL0BcDQ/gqnhflo5KrOW0eeO3ioHtATW9rS0b2RVxalt
 fcw330rwtbaeMJIae3VcTeMRWlgGeYJXUUNMoWNYmAHni4CnWoVzgq1kkv1Uim3lFdajsfi84Ol
 Ctr9eWc3vjrN6YAzxYe6xlmR45JRMl++Mx7vr2F3zdcZnNyhiWyKrI0qtWtpDp7MC60wHuINuiO
 gQng11/JbPloyrZ3VjascLbITcQPeSnXyL6xatsBa3eiChLWxdquoQtb8I03x8msPVcuusjw/05
 olEXzEVtHlhyxrZPmOVqRDClfo2p9qtqyVHMuQpiQ6FYeiKa0phT02j4EVA==
X-Received: by 2002:a05:690e:1486:b0:63f:b5a5:37c with SMTP id
 956f58d0204a3-6443d8ea4c2mr2696993d50.2.1764858809317; 
 Thu, 04 Dec 2025 06:33:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8MolvGFND5akNFmibK9HSspDeQ5bXOfjmLTbA1M+rKG/sJ/7ngViswEZ3iXdAQBv2MvDXgQ==
X-Received: by 2002:a05:690e:1486:b0:63f:b5a5:37c with SMTP id
 956f58d0204a3-6443d8ea4c2mr2696967d50.2.1764858808924; 
 Thu, 04 Dec 2025 06:33:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e?
 ([2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-78c1b78e8b5sm5724037b3.43.2025.12.04.06.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 06:33:28 -0800 (PST)
Message-ID: <421fdc65-c21d-4606-a241-28341955104a@redhat.com>
Date: Thu, 4 Dec 2025 15:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 16/21] hw/arm/smmuv3: Implement SMMU_S_INIT register
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
References: <20251012150701.4127034-1-tangtao1634@phytium.com.cn>
 <20251012151351.4130239-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251012151351.4130239-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NaMXX26q0Nxm0Fgdq0_6jerwkwxJteW4cRbqo73JIQQ_1764858809
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 10/12/25 5:13 PM, Tao Tang wrote:
> Implement read/write handlers for the SMMU_S_INIT secure-only
> register.
>
> Writing to this register provides a mechanism for software to perform a
> global invalidation of ALL caches within the SMMU. This includes the
> IOTLBs and Configuration Caches across all security states.
>
> This feature is critical for secure hypervisors like Hafnium, which
> use it as a final step in their SMMU initialization sequence. It
> provides a reliable, architecturally defined method to ensure a clean
> and known-good cache state before enabling translations.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c     | 33 +++++++++++++++++++++++++++++++++
>  hw/arm/trace-events |  1 +
>  2 files changed, 34 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 100caeeb35..432de88610 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -354,6 +354,21 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
>  
>  }
>  
> +static void smmuv3_invalidate_all_caches(SMMUv3State *s)
> +{
> +    trace_smmuv3_invalidate_all_caches();
> +    SMMUState *bs = &s->smmu_state;
> +
> +    /* Clear all cached configs including STE and CD */
> +    if (bs->configs) {
> +        g_hash_table_remove_all(bs->configs);
> +    }
> +
> +    /* Invalidate all SMMU IOTLB entries */
> +    smmu_inv_notifiers_all(&s->smmu_state);
> +    smmu_iotlb_inv_all(bs);
> +}
> +
>  static SMMUTranslationStatus smmuv3_do_translate(SMMUv3State *s, hwaddr addr,
>                                                   SMMUTransCfg *cfg,
>                                                   SMMUEventInfo *event,
> @@ -1969,6 +1984,21 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>  
>          bank->eventq_irq_cfg2 = data;
>          return MEMTX_OK;
> +    case (A_S_INIT & 0xfff):
why do we apply & 0xfff ?
> +        if (data & R_S_INIT_INV_ALL_MASK) {
> +            int cr0_smmuen = smmu_enabled(s, reg_sec_sid);
> +            int s_cr0_smmuen = smmuv3_get_cr0ack_smmuen(s, reg_sec_sid);
> +            if (cr0_smmuen || s_cr0_smmuen) {
use smmuv3_is_smmu_enabled()?
> +                /* CONSTRAINED UNPREDICTABLE behavior: Ignore this write */
> +                qemu_log_mask(LOG_GUEST_ERROR, "S_INIT write ignored: "
> +                              "CR0.SMMUEN=%d or S_CR0.SMMUEN=%d is set\n",
> +                              cr0_smmuen, s_cr0_smmuen);
> +                return MEMTX_OK;
> +            }
> +            smmuv3_invalidate_all_caches(s);
> +        }
> +        /* Synchronous emulation: invalidation completed instantly. */
> +        return MEMTX_OK;
>      default:
>          qemu_log_mask(LOG_UNIMP,
>                        "%s Unexpected 32-bit access to 0x%"PRIx64" (WI)\n",
> @@ -2172,6 +2202,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
>      case A_EVENTQ_CONS:
>          *data = bank->eventq.cons;
>          return MEMTX_OK;
> +    case (A_S_INIT & 0xfff):
> +        *data = 0;
> +        return MEMTX_OK;
>      default:
>          *data = 0;
>          qemu_log_mask(LOG_UNIMP,
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 434d6abfc2..0e7ad8fee3 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -64,6 +64,7 @@ smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
>  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
>  smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
> +smmuv3_invalidate_all_caches(void) "Invalidate all SMMU caches and TLBs"
>  smmu_reset_exit(void) ""
>  
>  # strongarm.c
Thanks

Eric


