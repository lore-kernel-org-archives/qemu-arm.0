Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B1ED216AE
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 16:29:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRCCI-0004gR-Cw; Thu, 04 Dec 2025 11:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vRCCC-0004eh-Eo
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 11:28:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vRCCA-0006GR-R2
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 11:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764865721;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0ly1dfeTRgYoDjIfLQD4tHzW2gz2wRP0ixiWHSasIM=;
 b=UyY+OxmjR7co6xjpaNe/fGgA2FrxkBeFnWZj2ZVdtCaMEEGlji9VnxSlY8nNcmv8C6VWp9
 s/nnL+CCv12RIpfZX8QLaD+kq/vqulhWsCvhHX5jQLYg23Rl+VwONn2FleBPZp2s8tbPjS
 j5pzGbc90wy1BPQZCuoYeudGybfoGzE=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-FQBP6q8WMw2MnxWPPwQ0TA-1; Thu, 04 Dec 2025 11:28:30 -0500
X-MC-Unique: FQBP6q8WMw2MnxWPPwQ0TA-1
X-Mimecast-MFC-AGG-ID: FQBP6q8WMw2MnxWPPwQ0TA_1764865710
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-64308330c34so1419838d50.1
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 08:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764865710; x=1765470510;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0ly1dfeTRgYoDjIfLQD4tHzW2gz2wRP0ixiWHSasIM=;
 b=E1Qjh/UxKeGmvs32Lb4/13j2tpmGJxojmPzPODinCffd/+fjiahuxTZCtNFeyaNQPl
 EF6a6MHedunimOnBRn7y6m9P9zDM+dT23yAul6GV6A/FxUm5AyFx2n2jivFDiIwLvvM3
 X+EnBAnoit1VHF+FX0J+AFtc/yaofLq+zPGFRj2ZsX0YApIs2cm02BsqrfJ8VmoqTjT1
 6aTcCK+sOwCTBNiOFcTzHytXcGZKVEUtgjdWc9PSJkBx1FbZ8uQSerfrrXKyFOJ3YD3c
 ZTLeqXlzYbV8grkB2cgHMh1qp8yCw9nBNxCr6rlAWEAmo7L81KrS3I7UlQlagD39tSG4
 pzGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlNRMmmIa2tUzsW+GX+HI6AQrZnNt4LaTyiFhWR7wh2ZuitrJvv2YRkLmrapgZqBo6KloYs/52/A==@nongnu.org
X-Gm-Message-State: AOJu0YwxLswVkLt70kytDQ3BqWZTjlvZoNB6Q41S2X7azEOmicwSRQxB
 EEmz0VPuvduERXJLXCiOke6KJSHsyhD3IbUSzdADw5tK9FV2vkFEOgO9GSXtu221zhPpWa//63o
 7EiH45B+WJf0vm+8Zn1SXM9xtloNeFLxKHwirK93W7ImEBZRNXOAEWw==
X-Gm-Gg: ASbGncudvsz+mvFafICDAdPbbPc2/z5HFB9ZqGwqXBbpPnKbb6FIFoVT2X8KG1w9FGk
 3ETy+V+aJe36wjRaA6glyec8Fhf5kNL9X2Ulxm3ciFqyawgLFE9b/3UvxD1gQbtQuYXCWLTsqWz
 TwZ+B8OYZ5LfQA/htRQT5wE2/WduNEQg7Kbt0kFcDLP/utl5w6oa/M5Af9hGXiwJpeIafnfP9pl
 1CIU0pgBayKfsy4aC9McRkaWdim+BOmIOTljpsDm0DJOwftUAChryxDA/FYtf8XNNIoN6NWywGq
 mOIrGyvIb0AA96UBRD80dj+5+SPU7N6dArtE9pXb+qip60thnH5LOuK7/Xi5mB/R57gl6q9kvXI
 aLqpYF78cnVHg1gSmB1u40XhQbWv9Hay/jhae11vu+sUIUj0ltFNmjbAO4g==
X-Received: by 2002:a05:690e:130b:b0:63e:33a7:cdd7 with SMTP id
 956f58d0204a3-64436faa95dmr5340409d50.20.1764865710047; 
 Thu, 04 Dec 2025 08:28:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaFti/t3XbAaWKfw0XW2dPcZyLApmSJxHthuj/FrWgJCblNoI73Oc7Z1qkaN3pa0pIP0V7jg==
X-Received: by 2002:a05:690e:130b:b0:63e:33a7:cdd7 with SMTP id
 956f58d0204a3-64436faa95dmr5340370d50.20.1764865709633; 
 Thu, 04 Dec 2025 08:28:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e?
 ([2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6443f5aeac5sm778613d50.17.2025.12.04.08.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 08:28:29 -0800 (PST)
Message-ID: <4e211bdd-b23a-4141-a341-3ee2429e0dee@redhat.com>
Date: Thu, 4 Dec 2025 17:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/33] hw/arm/smmuv3: propagate smmuv3_cmdq_consume()
 errors to caller
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-14-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251120132213.56581-14-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FPmGGcrpdnEAe0UOPKAxZ7zrTlztIRwIW7LLq7tCuxw_1764865710
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 11/20/25 2:21 PM, Shameer Kolothum wrote:
> smmuv3_cmdq_consume() is updated to return detailed errors via errp.
>
> Although this is currently a no-op, it prepares the ground for accel
> SMMUv3 specific command handling where proper error reporting will be
> useful.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3.c | 67 +++++++++++++++++++++++++++----------------------
>  1 file changed, 37 insertions(+), 30 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ef991cb7d8..374ae08baa 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1279,7 +1279,7 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
>      }
>  }
>  
> -static int smmuv3_cmdq_consume(SMMUv3State *s)
> +static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp)
>  {
>      SMMUState *bs = ARM_SMMU(s);
>      SMMUCmdError cmd_error = SMMU_CERROR_NONE;
> @@ -1547,42 +1547,44 @@ static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
>  static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>                                 uint64_t data, MemTxAttrs attrs)
>  {
> +    Error *local_err = NULL;
> +
>      switch (offset) {
>      case A_CR0:
>          s->cr[0] = data;
>          s->cr0ack = data & ~SMMU_CR0_RESERVED;
>          /* in case the command queue has been enabled */
> -        smmuv3_cmdq_consume(s);
> -        return MEMTX_OK;
> +        smmuv3_cmdq_consume(s, &local_err);
> +        break;
>      case A_CR1:
>          s->cr[1] = data;
> -        return MEMTX_OK;
> +        break;
>      case A_CR2:
>          s->cr[2] = data;
> -        return MEMTX_OK;
> +        break;
>      case A_IRQ_CTRL:
>          s->irq_ctrl = data;
> -        return MEMTX_OK;
> +        break;
>      case A_GERRORN:
>          smmuv3_write_gerrorn(s, data);
>          /*
>           * By acknowledging the CMDQ_ERR, SW may notify cmds can
>           * be processed again
>           */
> -        smmuv3_cmdq_consume(s);
> -        return MEMTX_OK;
> +        smmuv3_cmdq_consume(s, &local_err);
> +        break;
>      case A_GERROR_IRQ_CFG0: /* 64b */
>          s->gerror_irq_cfg0 = deposit64(s->gerror_irq_cfg0, 0, 32, data);
> -        return MEMTX_OK;
> +        break;
>      case A_GERROR_IRQ_CFG0 + 4:
>          s->gerror_irq_cfg0 = deposit64(s->gerror_irq_cfg0, 32, 32, data);
> -        return MEMTX_OK;
> +        break;
>      case A_GERROR_IRQ_CFG1:
>          s->gerror_irq_cfg1 = data;
> -        return MEMTX_OK;
> +        break;
>      case A_GERROR_IRQ_CFG2:
>          s->gerror_irq_cfg2 = data;
> -        return MEMTX_OK;
> +        break;
>      case A_GBPA:
>          /*
>           * If UPDATE is not set, the write is ignored. This is the only
> @@ -1592,71 +1594,76 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>              /* Ignore update bit as write is synchronous. */
>              s->gbpa = data & ~R_GBPA_UPDATE_MASK;
>          }
> -        return MEMTX_OK;
> +        break;
>      case A_STRTAB_BASE: /* 64b */
>          s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
> -        return MEMTX_OK;
> +        break;
>      case A_STRTAB_BASE + 4:
>          s->strtab_base = deposit64(s->strtab_base, 32, 32, data);
> -        return MEMTX_OK;
> +        break;
>      case A_STRTAB_BASE_CFG:
>          s->strtab_base_cfg = data;
>          if (FIELD_EX32(data, STRTAB_BASE_CFG, FMT) == 1) {
>              s->sid_split = FIELD_EX32(data, STRTAB_BASE_CFG, SPLIT);
>              s->features |= SMMU_FEATURE_2LVL_STE;
>          }
> -        return MEMTX_OK;
> +        break;
>      case A_CMDQ_BASE: /* 64b */
>          s->cmdq.base = deposit64(s->cmdq.base, 0, 32, data);
>          s->cmdq.log2size = extract64(s->cmdq.base, 0, 5);
>          if (s->cmdq.log2size > SMMU_CMDQS) {
>              s->cmdq.log2size = SMMU_CMDQS;
>          }
> -        return MEMTX_OK;
> +        break;
>      case A_CMDQ_BASE + 4: /* 64b */
>          s->cmdq.base = deposit64(s->cmdq.base, 32, 32, data);
> -        return MEMTX_OK;
> +        break;
>      case A_CMDQ_PROD:
>          s->cmdq.prod = data;
> -        smmuv3_cmdq_consume(s);
> -        return MEMTX_OK;
> +        smmuv3_cmdq_consume(s, &local_err);
> +        break;
>      case A_CMDQ_CONS:
>          s->cmdq.cons = data;
> -        return MEMTX_OK;
> +        break;
>      case A_EVENTQ_BASE: /* 64b */
>          s->eventq.base = deposit64(s->eventq.base, 0, 32, data);
>          s->eventq.log2size = extract64(s->eventq.base, 0, 5);
>          if (s->eventq.log2size > SMMU_EVENTQS) {
>              s->eventq.log2size = SMMU_EVENTQS;
>          }
> -        return MEMTX_OK;
> +        break;
>      case A_EVENTQ_BASE + 4:
>          s->eventq.base = deposit64(s->eventq.base, 32, 32, data);
> -        return MEMTX_OK;
> +        break;
>      case A_EVENTQ_PROD:
>          s->eventq.prod = data;
> -        return MEMTX_OK;
> +        break;
>      case A_EVENTQ_CONS:
>          s->eventq.cons = data;
> -        return MEMTX_OK;
> +        break;
>      case A_EVENTQ_IRQ_CFG0: /* 64b */
>          s->eventq_irq_cfg0 = deposit64(s->eventq_irq_cfg0, 0, 32, data);
> -        return MEMTX_OK;
> +        break;
>      case A_EVENTQ_IRQ_CFG0 + 4:
>          s->eventq_irq_cfg0 = deposit64(s->eventq_irq_cfg0, 32, 32, data);
> -        return MEMTX_OK;
> +        break;
>      case A_EVENTQ_IRQ_CFG1:
>          s->eventq_irq_cfg1 = data;
> -        return MEMTX_OK;
> +        break;
>      case A_EVENTQ_IRQ_CFG2:
>          s->eventq_irq_cfg2 = data;
> -        return MEMTX_OK;
> +        break;
>      default:
>          qemu_log_mask(LOG_UNIMP,
>                        "%s Unexpected 32-bit access to 0x%"PRIx64" (WI)\n",
>                        __func__, offset);
> -        return MEMTX_OK;
> +        break;
>      }
> +
> +    if (local_err) {
> +        error_report_err(local_err);
> +    }
> +    return MEMTX_OK;
>  }
>  
>  static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,


