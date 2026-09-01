Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DCAC61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 14:22:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1PNO-0007X0-CT; Tue, 01 Sep 2026 10:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1PNN-0007Wm-Rx
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:22:13 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1PNM-0001iM-18
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:22:13 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49ccf12bed0so44545e9.1
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1788272530; x=1788877330; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=YKj8EL//xe39XxDq/0xcUfmuYuJ8FXibbsXI3kg5GcA=;
 b=lmx2Z0rCPtdvSoQfbqzNm1LGzSZvkAd/eP+j0/8jvLXiYIrVxe1gCIMN652BgiwY7m
 iY7ynrL6naMYwpTgpnkklRmNjf5mmFmogSHfOfQDdjunrn4SPblUHqF+sr/Hsm/90eX+
 Q8+wukC9ybr8qlAgfv/EkJBXEqpYHETIjylsFls1Wdboo5TORyvkvLdI4vJZ7yOUsrPU
 +/V6SqMBvp5vT5J2zek49ZG7T4FKtyZxUn7vpAj/cdoy9KWfIwhqlzF6vt3c9x8ni3By
 A5YejsFc8MwltynNK4zBfm7T7hYLBdQr/+/7Y1N1ReyA54xlk5q8Cn+8FNnI0vCsvxaV
 ZfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788272530; x=1788877330;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YKj8EL//xe39XxDq/0xcUfmuYuJ8FXibbsXI3kg5GcA=;
 b=kbebKBaPT/v1oEqVosWyyEtsD+V50DycbkPCujAZuXXjVacLMaX7XB6mO7Vw7/9lhT
 0oQw4BhO9JD7uVdOU8GrQ+NvgAlOiINh4G53nkcPjfdWsvnT+AL4g2+c8yDHtUknFytp
 LNXeVdjpq2ehdDc3DWHa9en+rJX/Ys91fhbubomW1dnyrLQ7LwETPSopsPbWVAB+zG/V
 K+WkPFy6cJZ4qa/XNpnLHlipddYZq7Vq4AY92bItuG+p8lEyR5qPJiX2TWMO4bvZPVic
 U2aKqChsvFcbfnxTgJd3b6Yrgf7rWP7J0u7v/0I6Ds5GA6gdqjaLg/V8Yve3SZSuHt53
 yKtw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrI7YjGmID840Q9FHnjeZFl8MChhcDdYvWiNALy8qNR+dU8Xa64rSr3mHPk+qE3UG8y/Iw5Wp3IhQ==@nongnu.org
X-Gm-Message-State: AFuF++lMG+aJovZw8KqkAk7kh7I3oUTRP5KZDceZaS/pQO3WZE/MVm08
 9AW9hh9AB762q6gVsrecndoLzt+EH4z/QdnTXrqvZwvyuZsKGUsXstt7hGO//qwdfA==
X-Gm-Gg: AR+sD120SzFGWbym15kPACW6C9kcmAjmj5iD3RIf8NFF8L4Q8iYKuKjDCzLcrEbvRQv
 EyJ91tC5o50VvZ6OLRWIdGTjmrjtr7t5f6qHdfR6AWdyPlBm+6O9AB5VfKVDcWB20xg+yc4ZKgR
 MyjxVnhpX6fG34797J2+fmQeFZ8djSqTpubXpn3xx2J7YVRdF/ZSgw/u1ZFqZKXWqhODHBevJvw
 81er7jhxXbTIq3AgrCa28c/drLpBhTJVdjQy4SIJBYahNCwo19fTUKB3KAsUPdwv0eUXblVBx9D
 CeqCF9niU5ZpYn1Eh2xQIu+Zcf3samYNMOXaYAOeh8/9/7bNi28JBjIgLKXRcOHzvLIktOoQaDV
 1p6yE7DNceB+sYBClruuh/POmevbKKe1jENH6rwejpP+EVN7yiwpfkAM8VxJj1xeZRh7m/MfwBu
 HdcwHn9NTsGYM2fWwdihGzf38Wi5fFM28LpW3abNhEBaTnpZRpbbRVnR+DIqsGddVWJWkL+BhA4
 sqemPDjQZqPLNvWoL5Kjo+cb+LmOw==
X-Received: by 2002:a05:600c:6d1:b0:499:c46c:addc with SMTP id
 5b1f17b1804b1-49cdd24349dmr612395e9.2.1788272529964; 
 Tue, 01 Sep 2026 07:22:09 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com.
 [35.189.192.250]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d787b8sm5393882f8f.29.2026.09.01.07.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 07:22:08 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:22:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [RFC v5 17/28] hw/arm/smmuv3: Add access checks for STRTAB_BASE
 and CR2 registers
Message-ID: <apbfjNgfmlRKWaqQ@google.com>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162558.2808607-2-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162558.2808607-2-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=smostafa@google.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Fri, Aug 14, 2026 at 12:25:55AM +0800, Tao Tang wrote:
> Add access control for SMMU_STRTAB_BASE and SMMU_CR2 registers to
> ensure they can only be modified when the SMMU is disabled.
> 
> This implements:
> - smmuv3_smmu_disabled_stable(): Check whether the SMMU is in a stable
>    disabled state (CR0.SMMUEN == 0 and CR0ACK.SMMUEN == 0);
> - smmu_strtab_base_writable(): returns true only when IDR1.TABLES_PRESET==0
>    and SMMU is completely disabled.
> 
> Additionally, mask reserved bits on writes to SMMU_STRTAB_BASE using
> SMMU_STRTAB_BASE_RESERVED.
> 
> Fixes: fae4be38b35d ("hw/arm/smmuv3: Implement MMIO write operations")
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/smmuv3.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 628911d3f21..de8ca7cda48 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1484,6 +1484,36 @@ smmu_gerror_irq_cfg_writable(SMMUv3State *s, SMMUSecSID sec_sid)
>      return smmu_irq_cfg_writable(s, sec_sid, SMMU_IRQ_GERROR);
>  }
>  
> +static inline int smmuv3_get_cr0ack_smmuen(SMMUv3State *s, SMMUSecSID sec_sid)
> +{
> +    /*
> +     * CR0, CR0ACK, S_CR0 and S_CR0ACK are bit-layout compatible, so we reuse
> +     * the CR0 field definitions and only switch banks via sec_sid to reduce
> +     * code duplication. Also the other bits in CR0/CR0ACK are relevant here.
> +     */
> +    return FIELD_EX32(s->bank[sec_sid].cr0ack, CR0, SMMUEN);
> +}
> +
> +/* Check if SMMU is disabled in stable status */
> +static inline bool smmuv3_smmu_disabled_stable(SMMUv3State *s, SMMUSecSID sec_sid)
> +{
> +    int cr0_smmuen = smmu_enabled(s, sec_sid);
> +    int cr0ack_smmuen = smmuv3_get_cr0ack_smmuen(s, sec_sid);
> +    return (cr0_smmuen == 0 && cr0ack_smmuen == 0);
> +}
> +
> +/* Check if STRTAB_BASE register is writable */
> +static bool smmu_strtab_base_writable(SMMUv3State *s, SMMUSecSID sec_sid)
> +{
> +    /* SMMU_IDR1.TABLES_PRESET applies to both modeled interfaces. */
> +    if (FIELD_EX32(s->bank[SMMU_SEC_SID_NS].idr[1], IDR1, TABLES_PRESET)) {
> +        return false;
> +    }
> +

Again, I think those are not configurable at the moment, so I'd drop
such checks.


> +    /* Check SMMUEN conditions for the specific security domain */
> +    return smmuv3_smmu_disabled_stable(s, sec_sid);
> +}
> +
>  static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp, SMMUSecSID sec_sid)
>  {
>      SMMUState *bs = ARM_SMMU(s);
> @@ -1801,7 +1831,14 @@ static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
>          bank->gerror_irq_cfg0 = data & SMMU_GERROR_IRQ_CFG0_RESERVED;
>          return MEMTX_OK;
>      case A_STRTAB_BASE:
> -        bank->strtab_base = data;
> +        if (!smmu_strtab_base_writable(s, reg_sec_sid)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "STRTAB_BASE write ignored: register is RO\n");
> +            return MEMTX_OK;
> +        }
> +
> +        /* Clear reserved bits according to spec */
> +        bank->strtab_base = data & SMMU_STRTAB_BASE_RESERVED;
>          return MEMTX_OK;
>      case A_CMDQ_BASE:
>          bank->cmdq.base = data;
> @@ -1852,7 +1889,15 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>          bank->cr[1] = data;
>          break;
>      case A_CR2:
> -        bank->cr[2] = data;
> +        if (smmuv3_smmu_disabled_stable(s, reg_sec_sid)) {
> +            /* Allow write: SMMUEN is 0 in both CR0 and CR0ACK */
> +            bank->cr[2] = data;
> +        } else {
> +            /* CONSTRAINED UNPREDICTABLE behavior: Ignore this write */
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "CR2 write ignored: register is read-only when "
> +                          "CR0.SMMUEN or CR0ACK.SMMUEN is set\n");
> +        }
>          break;
>      case A_IRQ_CTRL:
>          bank->irq_ctrl = data;
> @@ -1915,12 +1960,32 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>          }
>          break;
>      case A_STRTAB_BASE: /* 64b */
> +        if (!smmu_strtab_base_writable(s, reg_sec_sid)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "STRTAB_BASE write ignored: register is RO\n");
> +            return MEMTX_OK;
> +        }
> +
> +        data &= SMMU_STRTAB_BASE_RESERVED;
>          bank->strtab_base = deposit64(bank->strtab_base, 0, 32, data);
>          break;
>      case A_STRTAB_BASE + 4:
> +        if (!smmu_strtab_base_writable(s, reg_sec_sid)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "STRTAB_BASE + 4 write ignored: register is RO\n");
> +            return MEMTX_OK;
> +        }
> +
> +        data &= SMMU_STRTAB_BASE_RESERVED;

SMMU_STRTAB_BASE_RESERVED is the mask for the whole stream table base it
doesn't apply to A_STRTAB_BASE + 4 offset.

Thanks,
Mostafa

>          bank->strtab_base = deposit64(bank->strtab_base, 32, 32, data);
>          break;
>      case A_STRTAB_BASE_CFG:
> +        if (!smmu_strtab_base_writable(s, reg_sec_sid)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "STRTAB_BASE_CFG write ignored: register is RO\n");
> +            return MEMTX_OK;
> +        }
> +
>          bank->strtab_base_cfg = data;
>          if (FIELD_EX32(data, STRTAB_BASE_CFG, FMT) == 1) {
>              bank->sid_split = FIELD_EX32(data, STRTAB_BASE_CFG, SPLIT);
> -- 
> 2.34.1
> 

