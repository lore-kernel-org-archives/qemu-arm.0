Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D270C61DF0
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 05:24:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0uUm-0003WO-PE; Mon, 31 Aug 2026 01:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x0uUl-0003Vr-EB
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 01:23:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x0uUj-00084u-Is
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 01:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788153823;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eY9MsCEXUuolmJZN31JCHWI9YnnSoSFkbcDH4Ro0H9k=;
 b=RR0nqy+28P14cvVfngt3vHhxlNDZWYUNhHJdqjv1lkW88FNv2T+NTe85+Bhl5GWPZMGcAC
 Su94+IguIs0MrzozYBwSENexj6NkdCh5yhzSDOTkV9sIw1BwkSSwoTagRcJNsewiJEd0kg
 BDG8Zps5UqrGnA8VDkKhYUwSetD12Oo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-QafmPWr0MR2NeE0rZBU0jQ-1; Mon, 31 Aug 2026 01:23:42 -0400
X-MC-Unique: QafmPWr0MR2NeE0rZBU0jQ-1
X-Mimecast-MFC-AGG-ID: QafmPWr0MR2NeE0rZBU0jQ_1788153821
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4955fd77c18so15492155e9.2
 for <qemu-arm@nongnu.org>; Sun, 30 Aug 2026 22:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788153821; x=1788758621;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eY9MsCEXUuolmJZN31JCHWI9YnnSoSFkbcDH4Ro0H9k=;
 b=eI0o3wOJtyLFxLjtfgGjbDGmqZQT89x/y1A7wIiQNubvJUL2RtoW6tV9gBrvviya1l
 /wgeWClwE3uE47ZgQUIQaNAtImgifrqdbyoQ4Oes4F9IBKssb07j2R4Eai2fiDPDbSpt
 1SEDoIJW63yTinpoK0XupW4u5oCGvQl6uHrUY8SlDClbcLfrBVnDWxgOoHUi6iASQc5v
 iBciAgxHvOuxmfkPoqP7ptqim8Uan0nwGeqkpcjFAzSJ9XTozVktuwCVXDGRPf3i49Q4
 jgFYLc6WeUqTQUPODA2Q/RsJO9tqaQ4rxOr7UlD2yfYbjtRN45B8ImXLi2PgHtTbLGBt
 pSpQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpNkmMU/iKi/ueyLSmZ+3JfyE8taKW++vuvLAu8vc7YNbsAYi5Q8/+B39t+ycFolqWHxuia2q3NEg==@nongnu.org
X-Gm-Message-State: AFuF++nbnlxRJQS4cM0IB6LL5SuxNRnKqNXfI5jKC3WyqU8gABP8BizB
 N0JYMVYQKOpnSRJn3tCsk8Tbf1AftWrukaIPD7RXaN7hVsqgeKHvzYBJFsqc0ULEe1/kc2q9Nu4
 NC1ThnjoRJuimldjyWalkkF1nJC6sZ19Zuwhz2ZgsLQSQheGB/RaJpw==
X-Gm-Gg: AR+sD13EhrGQNDsW5KTUvwc/SBEErqFRsQtYOLlGG8X0o+ykysAm6G7SZekr9HgRkeN
 nm826Osz20wuB2cVHzCG+xr17d8SvhVoAsN2TVbMCINyvwVgUo83FDWy+V+PXSOEbw93NbQj75R
 OdhcqjIIxRR6ihkzwbzZZPh9ye8k/ZPvlWBFvm5RUvSwVTHNtL6EDPb7qZzwoNwa44IU2GvBcun
 42dI1DBdNByrKLrnFo41MhidaP3vBjFQDrU8KpBfwGs7iyoh8eIeXa6AZOXAK2VZS5AaLoEBB9a
 rvCoMn4Su5bfu5weSo8mXVmqYLPQNKnPW6Fy+ei9Os3uhQgOJ7KSx06876KVmBOp+0YKK8dW/z4
 z0JdEbKdb9pfRuLX5sqynzRVYvor2gGH7GPTVYHOiBzBJOoUy
X-Received: by 2002:a05:600c:608d:b0:49b:9438:7785 with SMTP id
 5b1f17b1804b1-49cd9415f38mr11266065e9.4.1788153821051; 
 Sun, 30 Aug 2026 22:23:41 -0700 (PDT)
X-Received: by 2002:a05:600c:608d:b0:49b:9438:7785 with SMTP id
 5b1f17b1804b1-49cd9415f38mr11265745e9.4.1788153820673; 
 Sun, 30 Aug 2026 22:23:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cd775dae8sm83661815e9.9.2026.08.30.22.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 22:23:39 -0700 (PDT)
Message-ID: <5d280603-e2f9-4d24-a31b-19f908a30c55@redhat.com>
Date: Mon, 31 Aug 2026 07:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 21/28] hw/arm/smmuv3: Implement SMMU_S_INIT register
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162624.2809349-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260813162624.2809349-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2X-trcybYTfio49vhD6eGnIGRpBEOwGK6cZSPNK_M3k_1788153821
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/13/26 6:26 PM, Tao Tang wrote:
> Implement read/write handlers for the SMMU_S_INIT secure-only register.
>
> Writing INV_ALL provides a mechanism for software to perform a global
> invalidation of ALL caches within the SMMU, including IOTLBs and
> configuration caches across all security states.
>
> The MMIO dispatcher decodes the target register bank from the offset and
> normalizes Secure-window offsets by subtracting SMMU_SECURE_REG_START
> before switching on the bank-local offset. S_INIT is a Secure-only
> register and its A_S_INIT constant is an absolute Secure-window offset,
> so the handler matches it using A_S_INIT - SMMU_SECURE_REG_START and
> rejects accesses through Non-secure banks.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3.c     | 43 +++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events |  1 +
>  2 files changed, 44 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index d69fc0898af..dc3fa618883 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -393,6 +393,21 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
>  
>  }
>  
> +static void smmuv3_invalidate_all_caches(SMMUv3State *s)
> +{
> +    SMMUState *bs = &s->smmu_state;
> +    trace_smmuv3_invalidate_all_caches();
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
> @@ -2206,7 +2221,29 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>  
>          bank->eventq_irq_cfg2 = data;
>          break;
> +    case A_S_INIT - SMMU_SECURE_REG_START:
> +        if (reg_sec_sid != SMMU_SEC_SID_S) {
> +            goto unhandled;
> +        }
> +        if (data & R_S_INIT_INV_ALL_MASK) {
> +            /*
> +             * If SMMU_ROOT_CR0.GPCEN == 0, a write of 1 to INV_ALL when any
> +             * SMMU_(*_)CR0.SMMUEN == 1, .... , is CONSTRAINED UNPREDICTABLE
> +             * according to (IHI 0070G.b) 6.3.62 SMMU_S_INIT, Page 465.
> +             */
> +            if (!smmuv3_smmu_disabled_stable(s, SMMU_SEC_SID_NS) ||
> +                !smmuv3_smmu_disabled_stable(s, SMMU_SEC_SID_S)) {
> +                /* CONSTRAINED UNPREDICTABLE behavior: Ignore this write */
> +                qemu_log_mask(LOG_GUEST_ERROR, "S_INIT write ignored: "
> +                              "(S_)CR0.SMMUEN or (S_)CR0ACK.SMMUEN is set\n");
> +                return MEMTX_OK;
> +            }
shall we really bother: I read:
"
If SMMU_ROOT_CR0.GPCEN == 0, a write of 1 to INV_ALL when any
SMMU_(*_)CR0.SMMUEN == 1,
or an Update of any SMMUEN to 1 is in progress, or
SMMU_ROOT_CR0.ACCESSEN == 1, or an Update of
ACCESSEN to 1 is in progress, is CONSTRAINED UNPREDICTABLE and has one
of the following behaviors:
• The write is IGNORED.
• The invalidation operation occurs and completes, with INV_ALL reset to
0 on completion.
"
So the second behavior would let us simplify the code, no?

By the way where is GPCEN checked?

Eric
> +            smmuv3_invalidate_all_caches(s);
> +        }
> +        /* Synchronous emulation: invalidation completed instantly. */
> +        break;
>      default:
> +    unhandled:
>          qemu_log_mask(LOG_UNIMP,
>                        "%s Unexpected 32-bit access to 0x%"PRIx64" (WI)\n",
>                        __func__, offset);
> @@ -2444,6 +2481,12 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
>  
>          *data = bank->eventq_irq_cfg2;
>          return MEMTX_OK;
> +    case A_S_INIT - SMMU_SECURE_REG_START:
> +        if (reg_sec_sid != SMMU_SEC_SID_S) {
> +            goto unhandled;
> +        }
> +        *data = 0;
> +        return MEMTX_OK;
>      default:
>      unhandled:
>          *data = 0;
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 7cd4eb38578..ac9f737a5e6 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -67,6 +67,7 @@ smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
>  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
>  smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
> +smmuv3_invalidate_all_caches(void) "Invalidate all SMMU caches and TLBs"
>  smmu_reset_exit(void) ""
>  
>  #smmuv3-accel.c


