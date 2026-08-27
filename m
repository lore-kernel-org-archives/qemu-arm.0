Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0270FC61DC6
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 12:25:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzZAa-0006FA-3M; Thu, 27 Aug 2026 08:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wzZAY-0006EI-GP
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 08:25:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wzZAW-0003m7-N4
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 08:25:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787833519;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAd7JjxuKF4O5Z9JpLPWkK2/P2bhhQECbF3uyXhTb2c=;
 b=ezPThfF8zMi/5MRL8JOQ/bwSapnnS07MS4Ex0Mi/2S5spTzX6Ucqi9kM8gHP1HYaGeOFiU
 rfvjR+UCBb6z4oxqD2JlUga+SCLIGwjeVzttwzQpViXaC5baR+SVBCF7VFbMgOnnscvWbw
 lhSZoSNaNClsok1gwhhgokctxxQJ6mE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-CibSv3nkPByfi8zF6wIVGA-1; Thu, 27 Aug 2026 08:25:18 -0400
X-MC-Unique: CibSv3nkPByfi8zF6wIVGA-1
X-Mimecast-MFC-AGG-ID: CibSv3nkPByfi8zF6wIVGA_1787833517
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-47f8f8fde2dso1224999f8f.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 05:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787833517; x=1788438317;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GAd7JjxuKF4O5Z9JpLPWkK2/P2bhhQECbF3uyXhTb2c=;
 b=pFn2SB1cogY2qSiG5NCO+lbInZnP1++AcF1S0JRMjKNrXk30jmqQdMPRC/AETwiW5o
 7hBfsYP4wAii+o2sRZ/18FvMO0CZJhCDCwvoGTi8O/RDXQt2PXvbu+NZqzJsQn9dyVPX
 809MMLquV1RroDiBlKkJJsTdoe1GfqFgsrB9y5xrC6vORn3F9vvHAq5YV2clGGeKdTFV
 3N7Hx7ebvqEDRgSEQ/CxXmuVT4QP1Ce3AS2/7A3rsgrgxVW+Ing+dbZRJ1iOjiPhB7WZ
 sDPMsBxlYeZMPzGqKO1ffud3zjMKak4lEAvfSEGJJn1fGvPsBGKRQtFc3rQseLI5F1/A
 QVdw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoIllVgBcG8Vf+Wp+pWGDnRepb8HsKQJ+trGq5HMTByYGBJXvSQu60gKc6kTX+nPMaAssjSqCGblA==@nongnu.org
X-Gm-Message-State: AFuF++l7N1lwNi88o0JWirNXErTOZUkEepx8eh0lz/hVkaSL2CD004lr
 lIDQ65xinBmyF53rTeFZJ9/27Ei0mGSM3AIOLteT9RNVT2tEW79Wx8WIojHdtu8btM/hrOfANUu
 6FPQGmzZMgf9E04moGuigo9qel1VCHhRiPn4mBVUetWV86VN/oL8KIg==
X-Gm-Gg: AR+sD12DKTp9h95HDBz7bT850wDd5PelZL7pHGVGPtw0VI+Asy8bYFrUc+PJ3FIGN/q
 CA3E4F1HfevXU0IL5NlSDQxktJqlnZjSlp0VS6Qcv9Wzq+EotDIwQ7aoUGJW6Eb4u36ONbQYj/L
 CbTTBeyCKfXkmrcL0lxHtY1xZZmY0fI+Vl6DI/l3efQbwuWqSHGsX3Kz9VegB7xt2C74o2m2U8X
 +AzV7B82zHV+ckRuhw13QIUmkzAeS80ae+bUSIehCOIe43puB/9hSaSAr9+0Qq3ACGfBUDmbVBG
 cpBc5EDtMRq90Okt/mSUWnFm98d8mu2gwxENjGeMnN/Q/3gKybsKbijz3a+SaEBMGT2RkHHjJ5K
 hlMiCINgE/LXoznanv02WPk4SJoLnXSExvIDhklZ9vqKFzOZY
X-Received: by 2002:a05:6000:4605:b0:482:e2f2:19c9 with SMTP id
 ffacd0b85a97d-482e2f21dc2mr19449658f8f.2.1787833517168; 
 Thu, 27 Aug 2026 05:25:17 -0700 (PDT)
X-Received: by 2002:a05:6000:4605:b0:482:e2f2:19c9 with SMTP id
 ffacd0b85a97d-482e2f21dc2mr19449551f8f.2.1787833516808; 
 Thu, 27 Aug 2026 05:25:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e27ab569sm8617295f8f.16.2026.08.27.05.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 05:25:16 -0700 (PDT)
Message-ID: <74a383fb-e124-44ea-95d7-63c6add2a53c@redhat.com>
Date: Thu, 27 Aug 2026 14:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 09/28] hw/arm/smmu: Add PTE NS/NSTable helpers
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162446.2806393-4-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260813162446.2806393-4-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NcyW7oxUk7EHXGJo16NfsZClPyhQR6PUpF_1DL-8wtA_1787833517
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



On 8/13/26 6:24 PM, Tao Tang wrote:
> Add helper macros for NS and NSTable bits and group PTE attribute
> accessors for clarity. No functional change beyond the new helpers.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


> ---
>  hw/arm/smmu-internal.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index d143d296f34..004abd58bca 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -58,16 +58,27 @@
>      ((level == 3) &&                                                    \
>       ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_L3_PTE_TYPE_PAGE))
>  
> +/* Stage 1 attribute fields in VMSAv8-64 Block and Page descriptors */
> +/* Non-secure bit */
> +#define PTE_NS(pte) \
> +    (extract64(pte, 5, 1))
> +
>  /* access permissions */
>  
>  #define PTE_AP(pte) \
>      (extract64(pte, 6, 2))
>  
> +/* Stage 1 VMSAv8-64 Table descriptor fields */
>  #define PTE_APTABLE(pte) \
>      (extract64(pte, 61, 2))
>  
> +#define PTE_NSTABLE(pte) \
> +    (extract64(pte, 63, 1))
> +
> +/* Access flag: defined for both Block/Page and Table descriptors. */
>  #define PTE_AF(pte) \
>      (extract64(pte, 10, 1))
> +
>  /*
>   * TODO: At the moment all transactions are considered as privileged (EL1)
>   * as IOMMU translation callback does not pass user/priv attributes.


