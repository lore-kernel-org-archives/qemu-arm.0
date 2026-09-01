Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD7FC61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 14:27:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1PRw-0000Tc-Cp; Tue, 01 Sep 2026 10:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1PRu-0000TH-Mh
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:26:54 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1PRs-0002g4-Q8
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:26:54 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4996e2575dbso57415e9.0
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1788272811; x=1788877611; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=AmcOf0zzV7N2R7KKQO4EvyBbTvg1dcXldiipehHyEkk=;
 b=J5hD+NSiomRlJPlhnx15JaxR6F90mSy9V84DluH+lzU75kdb99+jYLW9gBTf4ViOGj
 HxyxuNr2R/3xIPOdpBzwbwsNNUqvTwkSY5oIWo2z76XdRkoJcBczf4UD74Tjdo9UyIST
 fMJDgdONm0YxHm9dihzgQhxRcunvkMcx5+dhaWMtOGxtUWcfslsCMbBjUkJHwLcJcPwS
 SIBBw9RcAJk38NxBnzDYVmexXC+8z40k6h9FPU4nv0GYRHIeRroOJyKokppeE5/r0Bq6
 qur/EIod23CKjgKxJnbH8ahoWWwWTgJoCdaw4ZkA7ey/n+hmiX11Y6J6AII76nqqQfS2
 24Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788272811; x=1788877611;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=AmcOf0zzV7N2R7KKQO4EvyBbTvg1dcXldiipehHyEkk=;
 b=N9jfWL4zOUsdHSdSMlwtJX/DEnwLmjWbdT7Ze2u3cfuB5JvtaqgQ1DoI/Ee5vGGPNW
 hF19Y5vtwtBOsjZ8vk3DOIOvbPYyNEnn5BFmDFeu1ZtWYV8TUQHHwK8xJQS5G4wyMOac
 p/sWhTJs9jv34qP662KK32sAZjtZjTWvxpm8eqX7WstfqHZ34GZuWE4/vg90ci//HXtI
 ESDuRmunAht1FWe1x2/B6n525EP6jhwGXL8EHJpgjiTIdGQtF8lbsKS1+apip0I7mrt4
 GhDGcZNunmAH+JXvONwIfaG/PhV9p/Yn3MXqu+D7a4HfGKEp2YI2eydIl/khJq14dYdl
 iYxQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro2Z94AtbEgAG6vnXaKcjaFMrBBu4XjcqiVkwtUZbQ19wVmkAfoJE94taaCP57eMzHVUlJcLNW2jQ==@nongnu.org
X-Gm-Message-State: AFuF++luI1xhpvX7btPGFlBMKCufn+S7GBmKe7cycZH/xYM1nQE8Pw+4
 i6niWi2vAaRaBHc+SRnXh8eYl0hKThqmJkcr8/TIV5ii+CkYwq3ko3b1eKRGiZ6zDg==
X-Gm-Gg: AR+sD13IAFmQFLLJmxsPOo3FmQncIZ00E0+JxdBC/9dMFikuhjgKyqhL8JfkV+ZnEw/
 pvVE2/2na1YWYFmDRV/MLiKfmC0swLXlbEpYHwB39In0+X0FmrdwavZRogV+Kifn3q9qtB5SHfL
 eRru7ZmuJIecBo5zQaVKTaFMKrCnf1d5z/VLfDe7ZtSXu3i0g3+9UzdDlyqcFy9/frapbyeYm1I
 eOWmyimUR4dPiGWoq9Q2RkEcYHtSDFoQ3KkX7ac4hL32Z2493nwppKcEQkYm6jNsrXDyEu/kOuh
 E9MU1Rvgh5k4swlKlFxsTwFhnIw4kP4cpDyRntBp+JVbu0RCqFzpSers5zkeRU6tCztnVDRnzgG
 oZ4V9p4vuUgD28z3a+WNR0W+XBsY0Hr1VQ4g+7MFGeltY5QTCoQMN/kn50RARXl6Bxa9/EcukAh
 RWqrUWflooqLfs7hFicFGzsa/qKJ+tA9pGMtgwrZHAhOV5grs0IGMZ0SOqwoLQRP7NwBwN63iAS
 kALKLYt6cL7V8yRFHdHPfoj6vwwCA==
X-Received: by 2002:a7b:cd05:0:b0:495:7a0b:3b4a with SMTP id
 5b1f17b1804b1-49cde7b12b3mr642065e9.7.1788272810747; 
 Tue, 01 Sep 2026 07:26:50 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com.
 [35.189.192.250]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce365048asm10524485e9.5.2026.09.01.07.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 07:26:48 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:26:42 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [RFC v5 19/28] hw/arm/smmuv3: Determine register bank from MMIO
 offset
Message-ID: <apbgonXpyX3ehO5i@google.com>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162558.2808607-4-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162558.2808607-4-tangtao1634@phytium.com.cn>
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

On Fri, Aug 14, 2026 at 12:25:57AM +0800, Tao Tang wrote:
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

It's not that simple, both banks aren't identical.

Beyond the IDR5 handled here, AFAICT the following doesn't also exist
in the secure bank:
- 0x0018 SMMU_IIDR
- 0x001C SMMU_AIDR
- 0x0040 SMMU_STATUSR

Also, A_GBPA seems to call smmuv3_accel_attach_gbpa_hwpt() irrelevant
of security state.

Finally, the first patch introduced SMMU_S_CR0_RESERVED for the secure
register, but SMMU_CR0_RESERVED is still used here.

Thanks,
Mostafa

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
> -- 
> 2.34.1
> 

