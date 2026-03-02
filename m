Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279E7EB3621
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 17:08:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx6kJ-0006yH-0s; Mon, 02 Mar 2026 12:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx6kG-0006vS-E6
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:07:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx6kE-0006d8-KU
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 12:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772471264;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B+oQpBNNo4gl3vWw7Uae51pb033vs0p612iY93+q2Xc=;
 b=Yr32RZi85aawXhD0XtBfSBT/CX0vk/iYp956+zTV2gQPlogCNPrYPLR9xilHofoXxewXMl
 Aa7D2+sMZ/bEM67AlV65CJNXomZhvk0LS+35Fjl1zTg+5SFf8xoTu6h/hvRKJ8v9tajPhl
 IKMxn6z6fdB8x8qUdpKPYAVrApXJT7U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-cnM0hVo-Of-fzrYeFMTDzw-1; Mon, 02 Mar 2026 12:07:41 -0500
X-MC-Unique: cnM0hVo-Of-fzrYeFMTDzw-1
X-Mimecast-MFC-AGG-ID: cnM0hVo-Of-fzrYeFMTDzw_1772471260
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4837f288194so35420395e9.2
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 09:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772471260; x=1773076060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+oQpBNNo4gl3vWw7Uae51pb033vs0p612iY93+q2Xc=;
 b=BvtwBsHSbJQQRo8mM4ljJqG41512phns6s8sZGa70AJrNl2nkghF/vnApNhIaglbQ5
 iz4LdB1/AFcxcwkU0cjSwysDknQaCNCXcfdqaORb4OKMAWR+REkNq/0EIvkYvEkz5QGF
 zjfupDsLmjZA7jq/dimXwMSHtwkWSQY1tyR/yzEMMAhmzS11/0oZtghlh0ZcW3K5lHKR
 Q4cHtvcczmzom6NJmYuTLBC8iAf8bBzkIUBzGli+gtkRicbKzXC2tKK3lIa5jjRfRpYe
 T2Puas7O1at7j/xHGYZLxD8y6qRquXDUafiM/HnFz5lLCOCcbTQqD4Q0Hda4AjZsoLz2
 JHoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9oelOuCanQylPd8SBJ6CSlhAkDn7uYp2+o9x6KST3wj4fa9BqJiJo4eggfBU79F4z9ei3WufCwA==@nongnu.org
X-Gm-Message-State: AOJu0YxizywiodVAeGSpLyZmpvurI5KWDOk2/0j9os5mZc60WrDKI2IJ
 3JTL085BD2dTbz7YrlIorUb1W7YzmAh70Ne2RbAFMcLoA2W/hkZZWemZR3gPvobfTSVzDaAEgp4
 9MEE0rBowl+DDEk0wcxdzqf/WwLgzhSQN6sSLaARZUuGVIQDBDaE32w==
X-Gm-Gg: ATEYQzwBx5lYF2QfmBCWs9woKVvzhD5S/8YjjL7FqGg3v7x9kJTJf77vuc8/4fZQX5V
 gKzA2ybx/E+xBdKAWKAOMm2kvqYFOZuY1AcFQ9pWNFPMH2XjxFcH7rCaSPSvpFVS4d5MEk/u++7
 46zkBclftRBwXEyY605owCEQdpiamNy9P8i9jNQIrx1npIp2uF6IpnTXR3UBsSFPJgUQxdRS9c8
 lmgYCOtUB6Rfgd09eoPCyG0UOU6BQICMsGRbrmyDkUtdaQqTzXeShWMD7hJ6jlgzC4pyMn0QMpH
 rK2UP2FV3Z8ghM/KaJVSC+8wq8YBt3hCkJBn9xYfpBvq8Kjzbl4nNPBtGuhobk1sL9ZO0BgQUGT
 22Ukx62/5kgMO+QPHeXiBZ05qmYcngf2QmhRePz/XsXaY0WLnIUSwBosrPuLrKb6CSmgT1Q==
X-Received: by 2002:a05:600c:8106:b0:47e:e8de:7420 with SMTP id
 5b1f17b1804b1-483c9c1d4bamr211427885e9.22.1772471260394; 
 Mon, 02 Mar 2026 09:07:40 -0800 (PST)
X-Received: by 2002:a05:600c:8106:b0:47e:e8de:7420 with SMTP id
 5b1f17b1804b1-483c9c1d4bamr211427245e9.22.1772471259939; 
 Mon, 02 Mar 2026 09:07:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb29715sm310318445e9.0.2026.03.02.09.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 09:07:39 -0800 (PST)
Message-ID: <67ce2d21-0b7e-4f21-aa3a-d4a7dc52a059@redhat.com>
Date: Mon, 2 Mar 2026 18:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 11/31] hw/arm/smmu: Add PTE NS/NSTable helpers
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101544.2992355-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260221101544.2992355-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wnOmlgGpO5AtblUnWpU-L8BxHrcB8L5uigS3xCaCMSQ_1772471260
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.968, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.495,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 2/21/26 11:15 AM, Tao Tang wrote:
> Add helper macros for NS and NSTable bits and group PTE attribute
> accessors for clarity. No functional change beyond the new helpers.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmu-internal.h | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index d143d296f34..a0454f720da 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -58,16 +58,28 @@
>      ((level == 3) &&                                                    \
>       ((pte & ARM_LPAE_PTE_TYPE_MASK) == ARM_LPAE_L3_PTE_TYPE_PAGE))
>  
> +/* Block & page descriptor attributes */
Maybe use the spec terminology:
Stage 1 attribute fields in VMSAv8-64 Block and Page descriptors
vs 7 Stage 1 VMSAv8-64 Table descriptor fields

By the way AF belongs to both

> +/* Non-secure bit */
> +#define PTE_NS(pte) \
> +    (extract64(pte, 5, 1))
> +
>  /* access permissions */
>  
>  #define PTE_AP(pte) \
>      (extract64(pte, 6, 2))
>  
> +/* access flag */
> +#define PTE_AF(pte) \
> +    (extract64(pte, 10, 1))
> +
> +
> +/* Table descriptor attributes */
>  #define PTE_APTABLE(pte) \
>      (extract64(pte, 61, 2))
>  
> -#define PTE_AF(pte) \
> -    (extract64(pte, 10, 1))
> +#define PTE_NSTABLE(pte) \
> +    (extract64(pte, 63, 1))
> +
>  /*
>   * TODO: At the moment all transactions are considered as privileged (EL1)
>   * as IOMMU translation callback does not pass user/priv attributes.
Eric


