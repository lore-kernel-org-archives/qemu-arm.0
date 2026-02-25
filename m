Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA265FD45F1
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 20:56:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvLvF-0002fK-EF; Wed, 25 Feb 2026 15:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvLvD-0002es-UV
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 15:55:51 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvLvA-0005om-Eu
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 15:55:50 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso638845ad.0
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 12:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772052946; x=1772657746; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PkcIX1QHSNOeeKJy7eBSe+HhZrb6DJ5nCXAorN/spQ0=;
 b=emWzqi7YZAnDjQZGcfQK8nPQ5iXK8TTx+kgbpWff78uDFjHj/hOrtczn5uaA89T71x
 L3cgS/PDawzMDFNm9DmK9Obc9eykSGeJgdx+wbJ43rbZ2wmMGbY+FBNH0B9qhwkpKCPx
 Bb2XurMuovpaVZxvW7bPm6z/DLdMrEUauRr0yvqoQkm6A23Bw8fFiYACls/TYGQPufOp
 UH24QNlvnH2rEVMqxKETBQZrKu4jAL9E61FrLTTXEJtkyGOgbTAxUFAIBzHRNsVc5DEn
 I/I1edWIuUSLxmksSjpflojk2/+lVFBVMDTk6V4G3CT8B4fHsPwyZmCyhj6VxGJ+6nfI
 HYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772052946; x=1772657746;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PkcIX1QHSNOeeKJy7eBSe+HhZrb6DJ5nCXAorN/spQ0=;
 b=A25j0ApnGStDi2qtxQbzCOorqBhWFFAUkXV/tfpVLXMKxJy3jNn6isnMm1RsTyDYG/
 zcUGGPI583o5TauEbLOD8bripndZ7yF4+LHm5cpPaw6cGK+wQ5ZuonfHsNP+RV9N+tiP
 0WZDfngk1HDCUSprH2fMM+5havYxvPFWIP5MX/B/CIjmm3QwJjvbggmr5DalJ1Zn44Yb
 Bp3jYwejja/393fwRJRtLMW6iX4d23ChuWK4Q4g1dz8sey/FLpe7daQMapc0UrCRGdJf
 Eo+wHL/U0UjbBMj+ya/hSHe9rVfWzaKBVTNJniG126l/OaStvinJ7v6Bwl7eJ9Ytl5cb
 JVLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGl1EMnNBet5FD6sJRaI3KtNukjZw4ZC9ZM+ge0aRze6A60bJLFBBB6bVTjNBZcm1X23mXDrAVRw==@nongnu.org
X-Gm-Message-State: AOJu0YzYmP23UkO+ICCrVpYfbQn6/8RAI84mWfPoIBze9vtOyk4s7GCE
 wQf1/dW8xophtmkfcefz+3l6XJbKNmEkmAe0WMFMv+12ckUINu/pGxnwiz2y9NLgQfY=
X-Gm-Gg: ATEYQzwSzc+CJCIHIT3NvUbleK3gAdlx4duXPsTFqexwx2xQjAGWlnw8YYWFBQYy1EA
 bOhgZoshIF2Z4t02iI1GbsKUgfEu9/1YjGQ/fFLbT3sW1QH/7T0rVA9XZGUz547kKGOnOkkpI6C
 Rk8XASHtk0Yr73ixG43VXpGdUuDBxqR83fSitKMf1BmF8B3h7YXbRXh3lCl4h5lmT5l4uAd+d7q
 S+g0hr6gGhxFphdTGDQXK+WlOLISqqmhkq/UaEdK/27CXkXHnkZrb+Ck9B1lhqqERwrea0i4K1v
 cQYQn4TFogpaT0KQyKoi/BCvfEsZMqNanB+o1/kDr5cxr///G2r7mnrk79IHduS4vFV7Pujufpy
 5fI8ZjSqN9Mt6KaN/DN2/u461oTRb09QVf7sHF+DfHwSlaTVqAku8T13kGEMqt+gyN5m4CUVHp5
 LHfu54XyC7m8pTdkYqZtLPLWQ0HVi9iPLgO822rX6CZKvGYbD8md8nBHh/CuitX/OshDkR3mRiY
 NsCYLo=
X-Received: by 2002:a17:902:cf04:b0:2a0:f0e5:74eb with SMTP id
 d9443c01a7336-2adf79692e1mr2954865ad.28.1772052946500; 
 Wed, 25 Feb 2026 12:55:46 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6df578sm979105ad.81.2026.02.25.12.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 12:55:45 -0800 (PST)
Message-ID: <0ace6596-fba6-48dd-b0af-e0444565a5ae@linaro.org>
Date: Wed, 25 Feb 2026 12:55:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 08/31] hw/arm/smmuv3: Plumb transaction attributes into
 config helpers
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger
 <eric.auger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221100250.2976287-9-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221100250.2976287-9-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/21/26 2:02 AM, Tao Tang wrote:
> As a preliminary step towards a multi-security-state configuration
> cache, introduce MemTxAttrs and AddressSpace * members to the
> SMMUTransCfg struct. The goal is to cache these attributes so that
> internal functions can use them directly.
> 
> To facilitate this, hw/arm/arm-security.h is now included in
> smmu-common.h. This is a notable change, as it marks the first time
> these Arm CPU-specific security space definitions are used outside of
> cpu.h, making them more generally available for device models.
> 
> The decode helpers (smmu_get_ste, smmu_get_cd, smmu_find_ste,
> smmuv3_get_config) are updated to use these new attributes for memory
> accesses. This ensures that reads of SMMU structures from memory, such
> as the Stream Table, use the correct security context.
> 
> For the special case of smmuv3-accel.c, we only support the NS-only path
> for now. Therefore, we initialize a minimal cfg with sec_sid, txattrs,
> and as for the NS-only accel path.
> 
> For now, the configuration cache lookup key remains unchanged and is
> still based solely on the SMMUDevice pointer. The new attributes are
> populated during a cache miss in smmuv3_get_config. And some paths still
> rely on the NS-only address_space_memory, for example smmuv3_notify_iova
> and get_pte(). These will be progressively converted in follow-up commits
> to use an AddressSpace selected according to SEC_SID.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmu-common.c         | 19 ++++++++++++++++++
>   hw/arm/smmuv3-accel.c        | 12 +++++++++++-
>   hw/arm/smmuv3-internal.h     |  3 ++-
>   hw/arm/smmuv3.c              | 38 ++++++++++++++++++++++--------------
>   include/hw/arm/smmu-common.h | 12 ++++++++++++
>   5 files changed, 67 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 3baba2a4c8e..b320aec8c60 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -30,6 +30,25 @@
>   #include "hw/arm/smmu-common.h"
>   #include "smmu-internal.h"
>   
> +ARMSecuritySpace smmu_get_security_space(SMMUSecSID sec_sid)
> +{
> +    switch (sec_sid) {
> +    case SMMU_SEC_SID_S:
> +        return ARMSS_Secure;
> +    case SMMU_SEC_SID_NS:
> +    default:
> +        return ARMSS_NonSecure;
> +    }
> +}
> +

Would that be possible to add all switch values, and use 
g_assert_not_reached() for SMMU_SEC_SID_NUM.
This way, when adding SMMU_SEC_SID_R, we'll be directly blocked at 
compilation because case is missing.

Regards,
Pierrick

