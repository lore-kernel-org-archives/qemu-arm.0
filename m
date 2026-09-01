Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB7BC624D4
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 14:15:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1PH7-0005vG-7H; Tue, 01 Sep 2026 10:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1PH4-0005uR-97
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:15:43 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1x1PH1-0000BL-UU
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 10:15:41 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6a5f95a879cso12929a12.0
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1788272138; x=1788876938; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zTD+QCVIKqJnedl4UmwOKa0Xh+aBZ8Vf/SdL0KZT8OE=;
 b=Y3JK2bDaLXkB0c08DIvRkS2ysrylHSdTaJCS1cscFnSYY7/hCtWBax4TWVJ09AF3Fb
 DAIQmTD7qMvWaUQnXpUnPEW96MEyF3FVx2GeiJqE4jid4rnaJ+/ABC/eupQhmxz9PgH8
 ILkD2x5CpWZ0Cfy6rQ3+AkTIQ3a3Z2LOGwvvgGYdtA1mA78o91a1URMgyJ0NTTWJJXB5
 KL7lK1Csy+EmZeF3EO7pVqDA06obU5t+Ky59unreTDdNFwEkbChCTLzj2EgRtX326+EL
 uJ7ufrxBV2lB1ovywHTkoI8cJVlNKcTW/+VvY9DtLjcqihSBczFWHZtzxdiFFWCEXi2/
 nDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788272138; x=1788876938;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zTD+QCVIKqJnedl4UmwOKa0Xh+aBZ8Vf/SdL0KZT8OE=;
 b=mbA6e4sdipVFOsxz0l6LxnCdf2cJU76NB7/IpaECQVt9AULGjPFUgWHd4v2dp1ePDm
 RD8PhlEDy0MlfEg4IGmOtNFgYnohJ1r6D9mlgeSIB+QHoAA0D731K7qkgPeIvn8nQfgT
 koXpH8k+ZKzszGLCpUDzRKClG0TmHxBBiI7HNElRYQqBbe9HBfsow/jy+n1npplgqTCr
 ouUumag0j3HrPTq3QhumftwC8YNUwO7FAf7OoVLE4o62E9+knGCLFNnuwSXFJLJCbpO3
 Cl90wWebh81yuBY2ld17onS6+5BFjWMC2rurZGhBPJ7BI5/UHCn72JeRj/v+COK5F6Bp
 2FrQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxvqUYx8u1P2yIa5wxfzxopkOv/F5fLdlM2E0tZyIlw40yKp8HYnh+XMXMsONih4A8IoAlx9Spnuw==@nongnu.org
X-Gm-Message-State: AFuF++kBCoaTDinjZviZxf1BLt92qNY+39aXcTorQq+IwjSeBqjl4V+Z
 I+itLqeylF+qEe8btVTI/Cg3UZA5YpvGp2aLSS0UmhlyRiTVUoI4OODYS+xZt1GE8X+DN7JIUks
 l4gweFA==
X-Gm-Gg: AYBFou2ikVXMt4ocpEv4GsPesELLogw9/Gqez1tIvKYA1ClFUI1U0REw1JJ/7PmRC6z
 r74WKcSe9K9fdCus/w82EQu96PfEEYq9Hglg/WkSquo/ukcsQJXhEo50KUb47yIbrzGUNV+iUd6
 xA+Ou1J32uZIgAd1FLGQTww9vy+xf3gnCGcNm7gsQKCjSHDiLBJhvIWKYwO0daRXwc+9xgcxBcA
 v7m/UW+XLILgrgZqjG9T5BmRzWMuGRV2xaMGC0t5Tx+bSkLT0B7mijeJcnHuis/KzaeuwuT8vWc
 y0R+MmUhBdZoL/nzR1f6VLOddmAciuO4x3Vvr+8pO9cQhPIMkjsOAniiipQ7wLEonO0vpgNNDEI
 JyEvTAFnwhmFEYzLf1D86etgvCTwZabZZoI7gxTg/E3lMC+50IDyb3XSl/fYHZAQ+3dObTIcevy
 p5iqJ+YDiKHcWPyNvrstIDClyJ2xlGwoP0qxkeP8NNB3T7OgOQ2CK/VJDI5jlhuenpv5CZfrAEW
 UGQkzCfLWuAHMdn7ztK/RB5asJHRw==
X-Received: by 2002:aa7:c417:0:b0:6a6:32f6:2841 with SMTP id
 4fb4d7f45d1cf-6a66a293d1cmr54321a12.14.1788272137167; 
 Tue, 01 Sep 2026 07:15:37 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com.
 [35.189.192.250]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a66d0529edsm902388a12.20.2026.09.01.07.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 07:15:32 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:15:28 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: Re: [RFC v5 14/28] hw/arm/smmuv3: Make evtq producer use SEC_SID
Message-ID: <apbeAGLm5HW_ydP2@google.com>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162512.2807281-4-tangtao1634@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813162512.2807281-4-tangtao1634@phytium.com.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=smostafa@google.com; helo=mail-ed1-x531.google.com
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

On Fri, Aug 14, 2026 at 12:25:11AM +0800, Tao Tang wrote:
> The event queue producer path wrote entries through address_space_memory
> with MEMTXATTRS_UNSPECIFIED, so produced entries did not use the
> sec_sid-selected DMA context. Pass AddressSpace and MemTxAttrs to
> queue_write() based on sec_sid.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  hw/arm/smmuv3.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index fa13191fc3b..7e08b88689f 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -129,7 +129,8 @@ static inline MemTxResult queue_read(SMMUQueue *q, Cmd *cmd,
>      return ret;
>  }
>  
> -static MemTxResult queue_write(SMMUQueue *q, Evt *evt_in)
> +static MemTxResult queue_write(SMMUQueue *q, Evt *evt_in,
> +                               AddressSpace *as, MemTxAttrs attrs)
>  {
>      dma_addr_t addr = Q_PROD_ENTRY(q);
>      MemTxResult ret;
> @@ -139,8 +140,7 @@ static MemTxResult queue_write(SMMUQueue *q, Evt *evt_in)
>      for (i = 0; i < ARRAY_SIZE(evt.word); i++) {
>          cpu_to_le32s(&evt.word[i]);
>      }
> -    ret = dma_memory_write(&address_space_memory, addr, &evt, sizeof(Evt),
> -                           MEMTXATTRS_UNSPECIFIED);
> +    ret = dma_memory_write(as, addr, &evt, sizeof(Evt), attrs);
>      if (ret != MEMTX_OK) {
>          return ret;
>      }
> @@ -155,6 +155,9 @@ static MemTxResult smmuv3_write_eventq(SMMUv3State *s, SMMUSecSID sec_sid,
>      SMMUv3RegBank *bank = smmuv3_bank(s, sec_sid);
>      SMMUQueue *q = &bank->eventq;
>      MemTxResult r;
> +    SMMUState *bs = ARM_SMMU(s);
> +    MemTxAttrs txattrs = smmu_get_txattrs(sec_sid);
> +    AddressSpace *as = smmu_get_address_space(bs, sec_sid);
>  
>      if (!smmuv3_eventq_enabled(s, sec_sid)) {
>          return MEMTX_ERROR;
> @@ -164,7 +167,7 @@ static MemTxResult smmuv3_write_eventq(SMMUv3State *s, SMMUSecSID sec_sid,
>          return MEMTX_ERROR;
>      }
>  
> -    r = queue_write(q, evt);
> +    r = queue_write(q, evt, as, txattrs);
>      if (r != MEMTX_OK) {
>          return r;
>      }
> -- 
> 2.34.1
> 

