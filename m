Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B1FC61DBD
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 10:26:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wztn6-0004Rx-2i; Fri, 28 Aug 2026 06:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wztn4-0004Rg-HM
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 06:26:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wztn2-0004xC-8F
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 06:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787912786;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/0p3cQRH0ebwjJJleDIzJeEv8hjoBOgpQAgJj6qn70=;
 b=DL1TcrvKrqdTGuTzuC4KBjrxEkjr3K5X24B1BhHqnCnusLkDdDWDLnd3XpRW5A/R0y4Rbu
 yTGBPMVsI+yywKXJdKs/KEfauIfaQ8KZuNrnva81nbpZ7RJqEKitgVg8FnFahkzzwgap7b
 6zukFW2GICDk1/K5sXxDfVC9daM5KlE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-oMLuJSvLNhqat6mlMnd5oQ-1; Fri, 28 Aug 2026 06:26:25 -0400
X-MC-Unique: oMLuJSvLNhqat6mlMnd5oQ-1
X-Mimecast-MFC-AGG-ID: oMLuJSvLNhqat6mlMnd5oQ_1787912784
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-499a7993a9bso7157325e9.1
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 03:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787912784; x=1788517584;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=U/0p3cQRH0ebwjJJleDIzJeEv8hjoBOgpQAgJj6qn70=;
 b=oeAfMYPuwc0YUJoe7VIgquDRuPSmBlrBZ2DROV7Kl10Xxy0sYczsFCGxEYwbzCf8ji
 tEIdLJM0IIgusBux4TSHolLzDxeYU7nVBZF/GYVhvGmwCE/gZbx/OilpEyWW2MvIX6iu
 5kpLgZLkczq/HMbDfxsaNsYtMgVs3GICJJ4wTjL+GYFAt9eY1n8BMSSs5Dse1t/VSPVu
 D3mI0TX4fidqzvcfSbNGqjvtoQWzSsgG0xCThAmk4UuI1zThBc5sZ6fmms9RiD3zpLnZ
 g1JgdXJ4ZA1z0CbE59biIk1V3pSwpgDklTjTq19r0D1a+zEKla31/IgCzVy3YErVx2Gz
 z7FA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqzuNS2AbMctouutmr+YZgacPuPXCWHIadllNgisE/mefRgFJ6ZG2n0IyIWnhyUEPWiqHG9GPAYBg==@nongnu.org
X-Gm-Message-State: AFuF++mSePA561qBlWBTI4ANPnlBqM8q901uB/lA0/QMDfKtaTuj2ZRw
 IFkjBagbN5f18GkEAWE8H8/y68+OOKhrRVrD8J7FJh9Xh2KFkVInVhMhRpMWAQGFOnF0gmKm7Gz
 KjyKhdv5SJE1eNVZxhAT0AXFbn+TS7u1W9Z3HlCcFvZVRKm36BRx+JA==
X-Gm-Gg: AR+sD11IJV+5duZG3fWx/eXa+b0KYlov2BVnmK3ROhsQ2NiR04dtd/QoqSwBoB22DSi
 P5Bf5HqK6CYXHYda5VYhlpy6Sk2/sthiXB/ToD9Xxlmvlajy+WDf+n5/+KFqoNYTJObXrwY8Hmn
 zYKqvpTuHmb84T135Z0FS+vLHYd1XefURGRG7QtWVsnGqAFopCEl3iR13qzakQzZDn1x6fp1nOm
 cyqQT6+IeM0zgLNUNCwajrU1XQ6XPv8GTAz5Nl1foIHNnAO+ZcgNOZn4AL6Qb2YHsE7Y4GjZDFl
 l4BLIzLaH2j0BiyEdjQJmwbLZItM1AUSZ+xbKI2sZ91MkFe8mrif3I1l8jRuje9x5Z2OvmplJdT
 4MGGDhHLcGbkmbNyS0xOLkiiuXY0YlQ3w6UhYbM3quShg1/vP
X-Received: by 2002:a05:600c:c494:b0:499:8aff:59b6 with SMTP id
 5b1f17b1804b1-49b91c486c3mr68503535e9.14.1787912783294; 
 Fri, 28 Aug 2026 03:26:23 -0700 (PDT)
X-Received: by 2002:a05:600c:c494:b0:499:8aff:59b6 with SMTP id
 5b1f17b1804b1-49b91c486c3mr68502695e9.14.1787912782743; 
 Fri, 28 Aug 2026 03:26:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f45sm4665506f8f.7.2026.08.28.03.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 03:26:21 -0700 (PDT)
Message-ID: <703c2ecc-6d74-4fe3-ba8f-f358c9f18436@redhat.com>
Date: Fri, 28 Aug 2026 12:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 19/28] hw/arm/smmuv3: Determine register bank from MMIO
 offset
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162558.2808607-4-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260813162558.2808607-4-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3ZNHjJew3VAuAqpW4oN4xPSTz7-cTFCaWKAsmx2hht4_1787912784
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 8/13/26 6:25 PM, Tao Tang wrote:
> Modify the main MMIO handlers to select the target register bank from the
> memory-mapped offset.
>
> Offsets in the Secure register window select SMMU_SEC_SID_S and are
> normalized by subtracting SMMU_SECURE_REG_START. Other offsets select the
> Non-secure bank. Pass the selected SEC_SID to the register access helpers,
> where the normalized bank-local offset identifies the register.
>
> Keep bank-specific differences explicit, such as S_IDR5 being unimplemented.
> This patch implements Non-secure and Secure bank dispatch and prepares for
> later access checks; Realm and Root programming interfaces are not modeled.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3.c | 44 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index efa78869251..b36bc4a54e0 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1889,9 +1889,9 @@ static int smmuv3_cmdq_consume(SMMUv3State *s, Error **errp, SMMUSecSID sec_sid)
>  }
>  
>  static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
> -                               uint64_t data, MemTxAttrs attrs)
> +                                uint64_t data, MemTxAttrs attrs,
> +                                SMMUSecSID reg_sec_sid)
>  {
> -    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>      SMMUv3RegBank *bank = smmuv3_bank(s, reg_sec_sid);
>  
>      switch (offset) {
> @@ -1959,10 +1959,10 @@ static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
>  }
>  
>  static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
> -                               uint64_t data, MemTxAttrs attrs)
> +                               uint64_t data, MemTxAttrs attrs,
> +                               SMMUSecSID reg_sec_sid)
>  {
>      Error *local_err = NULL;
> -    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>      SMMUv3RegBank *bank = smmuv3_bank(s, reg_sec_sid);
>  
>      switch (offset) {
> @@ -2223,16 +2223,26 @@ static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
>      SMMUState *sys = opaque;
>      SMMUv3State *s = ARM_SMMUV3(sys);
>      MemTxResult r;
> +    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>  
>      /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
>      offset &= ~0x10000;
>  
> +    /*
> +     * Dispatch the Non-secure window directly. After access validation,
> +     * translate the Secure window to its bank-local register offsets.
> +     */
> +    if (offset >= SMMU_SECURE_REG_START) {
> +        reg_sec_sid = SMMU_SEC_SID_S;
> +        offset -= SMMU_SECURE_REG_START;
> +    }
> +
>      switch (size) {
>      case 8:
> -        r = smmu_writell(s, offset, data, attrs);
> +        r = smmu_writell(s, offset, data, attrs, reg_sec_sid);
>          break;
>      case 4:
> -        r = smmu_writel(s, offset, data, attrs);
> +        r = smmu_writel(s, offset, data, attrs, reg_sec_sid);
>          break;
>      default:
>          r = MEMTX_ERROR;
> @@ -2244,9 +2254,9 @@ static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
>  }
>  
>  static MemTxResult smmu_readll(SMMUv3State *s, hwaddr offset,
> -                               uint64_t *data, MemTxAttrs attrs)
> +                               uint64_t *data, MemTxAttrs attrs,
> +                               SMMUSecSID reg_sec_sid)
>  {
> -    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>      SMMUv3RegBank *bank = smmuv3_bank(s, reg_sec_sid);
>  
>      switch (offset) {
> @@ -2285,9 +2295,9 @@ static MemTxResult smmu_readll(SMMUv3State *s, hwaddr offset,
>  }
>  
>  static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
> -                              uint64_t *data, MemTxAttrs attrs)
> +                              uint64_t *data, MemTxAttrs attrs,
> +                              SMMUSecSID reg_sec_sid)
>  {
> -    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>      SMMUv3RegBank *bank = smmuv3_bank(s, reg_sec_sid);
>  
>      switch (offset) {
> @@ -2295,6 +2305,10 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
>          *data = smmuv3_idreg(offset - A_IDREGS);
>          return MEMTX_OK;
>      case A_IDR0 ... A_IDR5:
> +        /* IDR5 does not support Secure or Realm state. */
> +        if ((reg_sec_sid != SMMU_SEC_SID_NS) && (offset == A_IDR5)) {
> +            goto unhandled;
> +        }
>          *data = bank->idr[(offset - A_IDR0) / 4];
>          return MEMTX_OK;
>      case A_IIDR:
> @@ -2429,6 +2443,7 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
>          *data = bank->eventq_irq_cfg2;
>          return MEMTX_OK;
>      default:
> +    unhandled:
>          *data = 0;
>          qemu_log_mask(LOG_UNIMP,
>                        "%s unhandled 32-bit access at 0x%"PRIx64" (RAZ)\n",
> @@ -2443,16 +2458,21 @@ static MemTxResult smmu_read_mmio(void *opaque, hwaddr offset, uint64_t *data,
>      SMMUState *sys = opaque;
>      SMMUv3State *s = ARM_SMMUV3(sys);
>      MemTxResult r;
> +    SMMUSecSID reg_sec_sid = SMMU_SEC_SID_NS;
>  
>      /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
>      offset &= ~0x10000;
> +    if (offset >= SMMU_SECURE_REG_START) {
> +        reg_sec_sid = SMMU_SEC_SID_S;
> +        offset -= SMMU_SECURE_REG_START;
> +    }
>  
>      switch (size) {
>      case 8:
> -        r = smmu_readll(s, offset, data, attrs);
> +        r = smmu_readll(s, offset, data, attrs, reg_sec_sid);
>          break;
>      case 4:
> -        r = smmu_readl(s, offset, data, attrs);
> +        r = smmu_readl(s, offset, data, attrs, reg_sec_sid);
>          break;
>      default:
>          r = MEMTX_ERROR;


