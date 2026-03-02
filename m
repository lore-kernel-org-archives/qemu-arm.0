Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964A3D58E61
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 16:49:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vx6S7-0000M2-1X; Mon, 02 Mar 2026 11:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx6S5-0000LK-9e
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 11:49:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vx6S3-0003im-22
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 11:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772470138;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fBpMbwX3UDx8VRo8Xyumd1xbogO0srXD+bob7gtfAw=;
 b=LlEm5//9ym7VzoURf2jjwBrVLfb4u+YuxPaDvUPBSJHF0Eie5iOFk6BLQ+TKwZc3mlFkaF
 7lZbBcuUriS2xu8NLFjnEQ1WCEjMUpaIxBifHW2SfRDVvoKAOJp7VlIz/HmpCYgvjiezJb
 VPtHNZ03cpliq8xa/LPA4xklma/Atys=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-ig6BcromP9yShmQYodu5Rg-1; Mon, 02 Mar 2026 11:48:57 -0500
X-MC-Unique: ig6BcromP9yShmQYodu5Rg-1
X-Mimecast-MFC-AGG-ID: ig6BcromP9yShmQYodu5Rg_1772470136
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-483bcfdaf7dso44282675e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 08:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772470136; x=1773074936;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fBpMbwX3UDx8VRo8Xyumd1xbogO0srXD+bob7gtfAw=;
 b=X+IdkTwsyNApqTZdrq72M7Q60Yhq8w+fkkeBYQDES6vmchHwOTK50fgodvZlZe0Z/C
 2nyVOPzKw30VKkkfcs3n0hUau+YQyFf6sF8CdN9mZUe2RIytjtHYRifRFvcQ7QkS7zDR
 ffnxBfCPBsq75Qg8dcgYm+BkE+yiRPEAU35ZtlbPqefYa4LJvAyp75XAiG5+tYpHFEwL
 Juw08uU9ccrSNu9OUW67iVVd9BCVQdLXypLjJcNOH9WUldqFvNvMOT5l96ZTHh0vLfwN
 RiKO6/PCM4fvgUAH4jTnCRt9LPhOWl5daYp2vz27LDiy1XPJDPmgw8+E8McczU59+jRl
 rc0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA7qnK9Qr6ZIOJksgxhmbriNgnDGpDBx90uAW0xBUM7rQL68MFHpN+O2JztWLhDAJ34WRr5giziw==@nongnu.org
X-Gm-Message-State: AOJu0YwI6O5MFtbXFvroLJ9mWj4j9dH61c2m/WF7Nrg+rWTQfpzLwEJT
 y/sHvD4X7LtsPZN6mbo3qpyBxP76U/6GvUJpPvQJLLOoSlXZKzzj80j4gY3s6uw9JCvKt3/9DYk
 vvM2FSsdh6Px2p6WGVpEAK+eu7KlcCNs9WBcOO1MA6+GcoLfPd/cOhg==
X-Gm-Gg: ATEYQzyW0QO5Qg3a1fDEnLSW28lODiblq5dh6NKdfqdKS4WaCmcw5DBDNyM/xHsi6Ie
 ruuaw2yokt/+ZNKjJJMOKaRb1FdjNY5NgjjuPy/XILm7yH4XS7rTf71JjaCVFYyBRbPyXN0flNq
 BoZmQvlL/dFTLdIOnJH55/2k5O39NS09nRcaPZqXtjkS0a4+Cs+1MeaYmCodTFkDHQMPXmD4BXb
 U4YVW1C93A8LdPSHKAtthJflJ2EOiwgo3Nv4T9r+mG4XTRDAgpsn7fL1wjEa8FCf1NopJo9ToXo
 +H1KjSNVrRPTvYa98IOzurwB5+QU+n0lMhXRUDCFZXZknqfwDvSxuBr0Oh/HToVJ8+o45+HaY7i
 QvNAnw4yIeODY0nEhYTxqfuGe0dLPaHIDP8aXERpZJpLRLvio6ShjNShMZd7yfdz58WoUTA==
X-Received: by 2002:a05:600c:198a:b0:482:ef72:5781 with SMTP id
 5b1f17b1804b1-483c9bfa529mr200899205e9.25.1772470135776; 
 Mon, 02 Mar 2026 08:48:55 -0800 (PST)
X-Received: by 2002:a05:600c:198a:b0:482:ef72:5781 with SMTP id
 5b1f17b1804b1-483c9bfa529mr200898405e9.25.1772470134638; 
 Mon, 02 Mar 2026 08:48:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b770e7sm315928895e9.9.2026.03.02.08.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 08:48:54 -0800 (PST)
Message-ID: <ad1f2339-0f48-4431-8334-5641c817d8c8@redhat.com>
Date: Mon, 2 Mar 2026 17:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 09/31] hw/arm/smmuv3: Enforce Secure stage 2 capability
 check when decoding STE
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
 <20260221100250.2976287-10-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260221100250.2976287-10-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jMg93z087etJbG3zWNO9mFypHn38V4CWS4zVLGSLUFc_1772470136
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



On 2/21/26 11:02 AM, Tao Tang wrote:
> When decoding a Stream Table Entry (STE) from the Secure stream table
> that enables stage-2 translation, verify that the SMMU implementation
> advertises Secure stage-2 support via S_IDR1.SEL2. If stage-2 is
> requested but S_IDR1.SEL2 is 0, mark the STE as ILLEGAL.
>
> This implements the requirement from the Arm SMMUv3 architecture
> specification (IHI 0070G.b, Section 5.2, Page 218) that a Secure STE
> with stage-2 enabled is only valid when the implementation supports
> Secure stage-2 translation.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 2192bec2368..d011357253e 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -623,6 +623,16 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
I think I would rather pass the sec_sid as a parameter, indicating which
secure stream table shall be used for ste decoding
>          if (ret) {
>              goto bad_ste;
>          }
> +
> +        /*
> +         * Stage 2 is implemented but Secure stage 2 is not supported while
> +         * STE is from Secure stream table. STE is ILLEGAL in this case
> +         * according to (IHI 0070G.b) 5.2 STE, Stream Table Entry, Page 218.
would reuse the spec full terminology:
I would explicitly tell explicitly: " it is ILLEGAL to set STE.Config ==
0b11x."
> +         */
> +        if ((cfg->sec_sid == SMMU_SEC_SID_S) &&
> +            !(FIELD_EX32(s->bank[SMMU_SEC_SID_S].idr[1], S_IDR1, SEL2))) {
> +            goto bad_ste;
> +        }
>      }
>  
>      /* Multiple context descriptors require SubstreamID support */
Otherwise looks good

Eric


