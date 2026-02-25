Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4EDFD45F5
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 21:21:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvMJn-0005DB-8T; Wed, 25 Feb 2026 16:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMJg-00056a-S9
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 16:21:09 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vvMJf-0001of-AI
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 16:21:08 -0500
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-c6e1dc5c5edso44298a12.1
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 13:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772054465; x=1772659265; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lo7xgZmIB5N/VcPL76vM3oc6MHhCaoLhPFZPl5KlrVE=;
 b=YXRt23E7GPmqdzNX0P0bRFIB/KfROt7GClLAMaHmUkWoCQFL+ybBjgC1IxbtV8AQxv
 reDGc4SKb5Df4D0MDgt2QAUOUqcVUxbrPGCTkgN0Fy6KaZRlIPmi2mq/j/KlOfjDSAy/
 WA3Rntk9cLmyCgTO09MwZRhw0AJtyWiG5dxQArRYRFts/BSvmVZzFW3DXARD7+ycFi/g
 tXlbyqbaTVTu8uSEPOXUnIbTIz/7dOPc8g6n95Kz1rfjL3i9R7KdjlTgE5KpZh2t9dw2
 hxfHn7iK5L/TsfD5GqXJYf3O9gW2RiVxDCy/xG+XGxsy1EUtvK4Bf0sLk7hD/WD31665
 2hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772054465; x=1772659265;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lo7xgZmIB5N/VcPL76vM3oc6MHhCaoLhPFZPl5KlrVE=;
 b=dbLrd+O1+RNjbwA1e48utLucwOFgbOXgBuOYw07hnD44Psw6rz7ywLlSUc3iXPXqos
 zzNppvegOFvTIMNTcY6D52SfF9imUBoYHWJr0eqPDbqmcB3UPi5mOmjcMVVCIvcLV9dT
 iIsFQjg4yf8BWVXId7Jz6jMC8+cFuy7waDxlyeeO3sMs1YHhJNcYhrxN8Drk/5o7Cq3D
 ROvTkOx3bijKWkV/KKP3bMpKI3eKeuspM989Sb9GTs6Cw+dqgOCyUIdCpz5XLDl8sJn+
 xVea5jHA0pqEvukSUf74svXe4hSfTQqWCQp2i9gajAxrZq/Zz23+p8Hln7droJA5S0ri
 jl0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUohu//XUdoJDLXnb9x0M88xlvka9pi5pNCuzqQB7Qn6L7jlWZLXZP4qiiM2cpldnC9jmpFklJn7Q==@nongnu.org
X-Gm-Message-State: AOJu0YyJsp0wL3OHAnBgBD0kHr0enKmHr92dbeQKjzBkF6fM0XoxQMYO
 1iGonykVRPXi4r62WnP0l8dj5lOvdIoVBAujw0W347g8/Y8p7eRt9Vm/2ui1Fr0KCCc=
X-Gm-Gg: ATEYQzzJ58Q5Gnr0nL9dpNnYedoJmIFuemTNJ3yKmqQuuqFkTMwJiuhsYvhc/LkayEv
 YkQfYncwD4+v8LyMHjmg//Zh/XL6Hyl07nhtcbJDjDD4/lac0OvThi5ZCOZ5MH5U+7sjwS/F6Bm
 5lZqTOTs94eDMmKxq+zABoFz3BhnnwV/Hsk7LNGccJnVWbDNpDWB2nmNxgGhv0O3tnKUy8ZLcC9
 x4UMrupn++EqQmqa+DyO8DuOgiTtsMwOGdWQqnwmfeRoOc4XjQIj2ZXG4ir5PtTYa7SVZWqo0gE
 MO+dvsQMFI5/bUOdOupmHwo//XOImnrCgk5YQd74QAoUPE+jhjH/GoGY2J/Y6knTH31OFUIu80H
 nZ4WWokpGB1HMF0ziKgqzX+13tuJ0KRUM3N6BW8KEJ65t1+4Ge6vvuu6JFmAka1/xOFbi6WrAXL
 73mETiNxyAFuxBPewfSoSvEsX83fxPhASTJQ5y1K9z58RwpLM2qFzyCEOWcxZm+uN7wLu0
X-Received: by 2002:a17:90b:3bcc:b0:354:a284:3fff with SMTP id
 98e67ed59e1d1-3593db91bdemr13682a91.25.1772054465395; 
 Wed, 25 Feb 2026 13:21:05 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35901880830sm5325784a91.5.2026.02.25.13.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 13:21:05 -0800 (PST)
Message-ID: <11834bbe-9f26-4533-ac0a-bde0b8bbed9d@linaro.org>
Date: Wed, 25 Feb 2026 13:21:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 15/31] hw/arm/smmuv3: Tag IOTLB cache keys with SEC_SID
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
 <20260221101657.2994097-1-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260221101657.2994097-1-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/21/26 2:16 AM, Tao Tang wrote:
> To prevent aliasing between secure and non-secure translations for the
> same address space, the IOTLB lookup key must incorporate the security
> state of the transaction.
> 
> This commit:
> - expands SMMUIOTLBKey with SEC_SID field for cache key differentiation
> - extends SMMUIOTLBPageInvInfo with SEC_SID for invalidation filtering
> - updates all IOTLB invalidation helpers (smmu_iotlb_inv_iova,
>    smmu_iotlb_inv_ipa, smmu_iotlb_inv_asid_vmid, smmu_iotlb_inv_vmid,
>    smmu_iotlb_inv_vmid_s1) to accept and filter by SEC_SID
> - plumbs SEC_SID through smmuv3_range_inval for TLB invalidation
> - enhances trace events to include SEC_SID for better debugging
> 
> This ensures that secure and non-secure TLB entries are treated as
> distinct entities within the cache, preventing TLB pollution between
> different worlds.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>   hw/arm/smmu-common.c         | 80 ++++++++++++++++++++++++------------
>   hw/arm/smmu-internal.h       |  2 +
>   hw/arm/smmuv3.c              | 36 ++++++++--------
>   hw/arm/trace-events          | 12 +++---
>   include/hw/arm/smmu-common.h | 16 +++++---
>   5 files changed, 92 insertions(+), 54 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

