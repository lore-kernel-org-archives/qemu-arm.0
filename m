Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE17E92710
	for <qemu-arm@archiver.kernel.org>; Sat, 27 Dec 2025 21:23:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vZbkI-0000me-TP; Sat, 27 Dec 2025 16:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vZbkI-0000mR-0J
 for qemu-arm@nongnu.org; Sat, 27 Dec 2025 16:22:42 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vZbkE-0007bM-U8
 for qemu-arm@nongnu.org; Sat, 27 Dec 2025 16:22:40 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-29efd139227so107087455ad.1
 for <qemu-arm@nongnu.org>; Sat, 27 Dec 2025 13:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766870556; x=1767475356; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ukPY+wecDD816Go77BPGjZ2rqdmj3GrBKdUhVI/tAfU=;
 b=IOTRI/ig6mk1JIv/O0QZlmWP9I1pp+yjvrn9+D1eaGKBTwgKoICD7a2SBVhpFEwjxM
 llpvHlXHR8wkTG3D6JdTsvXnln+v/D+F7pLrMiJP19r56pTMHRfPnw8quCeVCYH690b8
 Gy/5xCYy4NAgN/mkhJwyqV30Mhu4q0zkKAI3cYwnQZ4cvpOUYKypBrjaUM5PncauI/0U
 fKiq1LzxU5AXYlszs5RUblRxsNphmp8oOR+FgOeU6yOlpoMdpMlg8Bt0LwUkrTXwfg15
 IppTYSxlGlu3+RsoQDTD6frMczOjiK9Ho3B/uFlkFlm9fely0Gn5NrgwhnESFRuzdA3u
 aOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766870556; x=1767475356;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ukPY+wecDD816Go77BPGjZ2rqdmj3GrBKdUhVI/tAfU=;
 b=fuqzv0j8Dt/7YlSVM8ggZhuvW/tbybUzW01vKBLH1oZkvJfEbSh+J0Tw7zfXwyN+cI
 tYy/y5SJhYMC0fSmTpZSduiT8jQS786UZ7jPkqEuPq0CLPjkzA7LhqNaycOjn3Ag7taj
 prHWx+qsyca5pIjb9zIVcKcWMSgPXKjYBH7tfpoBZc0xLntbbnGR/dhnzbOUYAeOnbvi
 jHYOcp+Sgievp7ip5sg0pQY3ZmA1uWMfNA7w2UGhY/YbZw/CKe/A0p1X72abBoEz8jLX
 Pyk8BJwKR8EPzZLNvL3PDbEhbvNJ1hx8uCvc33uLSKLC8V51Bw9rBMoxFtmUbnmJ0RDo
 uySQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURjleoG3yqsIdVnNGw0Nsxh+wUZpKE3MaQM9YgNAKn/xQo9RaVB+5v+CHgN/VRg7jAUy6DcRRBfA==@nongnu.org
X-Gm-Message-State: AOJu0YxeTrEeCF7wkHT4pjCTZXzRt8hYKUaoqsrMWCABAjpg7KBjCduC
 mexr+Eahdo2rZhmx6N0I9C1IuZTlGrJiBWnIinBJXTkZd78eJOx/jR7V4KdJ2bxLH30=
X-Gm-Gg: AY/fxX5mTN9S9Ebq5bBoTJ2tLJ95/Jz1gAou7GmRWng0lRU+XvKLPPPmDe7OaRHbuFK
 kcjyMDZM4jqL7O8bTDeoXDDgH0ZJ2fuDuWfwBIceTfxlnEWt6Sb4tgAahPKAtjoerCMaX2RAAd1
 MAasjcAfjrJjylfhKsWSCwQiv0q7UaoSJ7zVHEwZLJbe9lkv6CxR4Dd/PiezvM4LBL5dIi6h8Pi
 QgT+X50VtrxyXMShDMZ2QumwuIgGt8qh/UDYi1p+HufwVUkp0h4ONl9aFUePZLah4y/oU5M2Upq
 KtWNYNCgoor/jUMqk92X4pGiFciqe7jFTKl5cb2abw7+bnrL2F0Hzzu8MTzUU56iIHkfNfc2ALY
 AKMNE2udqFGceaAq/Dm6CiAtX4YqVwKPzdhawyxXyy0pISMTmcmQfrXYv5TwJqu8VlWC+vm3UTA
 lYNZxhwHmOIrp7T3e36Cbc8OUXxgZp15OSvYUKYEbVTz/tkBCwsIcf+AmZydGgZpF4MdA=
X-Google-Smtp-Source: AGHT+IFiwgGa9az7asTZkSqNsXD/5kmss/UT/gRho0vs8iv7vsgx8BWXSRgpx481UKFL1tprmWw7hw==
X-Received: by 2002:a17:903:943:b0:2a0:a0cc:9994 with SMTP id
 d9443c01a7336-2a2f2833076mr290736305ad.47.1766870556135; 
 Sat, 27 Dec 2025 13:22:36 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f330d25esm232483755ad.0.2025.12.27.13.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Dec 2025 13:22:35 -0800 (PST)
Message-ID: <54a238fa-2946-4df9-ae6c-ee30ab10fb46@linaro.org>
Date: Sat, 27 Dec 2025 13:22:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 1/7] hw/arm/smmuv3: Extract common definitions to
 smmuv3-common.h
To: Tao Tang <tangtao1634@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20251224034647.2596434-1-tangtao1634@phytium.com.cn>
 <20251224034647.2596434-2-tangtao1634@phytium.com.cn>
 <1c56c2d4-d472-4ec7-b3f2-22c7b4e935fb@linaro.org>
 <9388d28b-1c94-4863-b295-68eb84595501@phytium.com.cn>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <9388d28b-1c94-4863-b295-68eb84595501@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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

On 12/26/25 9:01 PM, Tao Tang wrote:
> Hi Philippe,
> 
> On 2025/12/27 06:45, Philippe Mathieu-Daudé wrote:
>> On 24/12/25 04:46, Tao Tang wrote:
>>> Move register definitions, command enums, and Stream Table Entry (STE) /
>>> Context Descriptor (CD) structure definitions from the internal header
>>> hw/arm/smmuv3-internal.h to a new common header
>>> include/hw/arm/smmuv3-common.h.
>>>
>>> This allows other components, such as generic SMMUv3 tests or test
>>> devices,
>>> to utilize these definitions without including the specific SMMUv3
>>> device
>>> internal state.
>>>
>>> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    hw/arm/smmuv3-internal.h       | 255 +------------------------------
>>>    include/hw/arm/smmuv3-common.h | 268 +++++++++++++++++++++++++++++++++
>>>    2 files changed, 269 insertions(+), 254 deletions(-)
>>>    create mode 100644 include/hw/arm/smmuv3-common.h
>>
>>
>>> --- /dev/null
>>> +++ b/include/hw/arm/smmuv3-common.h
>>> @@ -0,0 +1,268 @@
>>> +/*
>>> + * ARM SMMUv3 support - Common API
>>> + *
>>> + * Copyright (C) 2014-2016 Broadcom Corporation
>>> + * Copyright (c) 2017 Red Hat, Inc.
>>> + * Written by Prem Mallappa, Eric Auger
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#ifndef HW_ARM_SMMUV3_COMMON_H
>>> +#define HW_ARM_SMMUV3_COMMON_H
>>> +
>>> +/* Configuration Data */
>>> +
>>> +/* STE Level 1 Descriptor */
>>> +typedef struct STEDesc {
>>> +    uint32_t word[2];
>>> +} STEDesc;
>>> +
>>> +/* CD Level 1 Descriptor */
>>> +typedef struct CDDesc {
>>> +    uint32_t word[2];
>>> +} CDDesc;
>>> +
>>> +/* Stream Table Entry(STE) */
>>> +typedef struct STE {
>>> +    uint32_t word[16];
>>> +} STE;
>>> +
>>> +/* Context Descriptor(CD) */
>>> +typedef struct CD {
>>> +    uint32_t word[16];
>>> +} CD;
>> Pre-existing: should these be QEMU_PACKED?
> 
> 
> Thanks for the feedback.
> 
> 
> I tried adding QEMU_PACKED to STEDesc/CDDesc/STE/CD in smmuv3-common.h,
> but that means some call sites need updates.
> 
> For example, with packed structs, this triggers
> -Waddress-of-packed-member (and becomes a build failure with -Werror):
> 
>       le32_to_cpus(&buf->word[i]); // smmu_get_ste function in
> hw/arm/smmuv3.c
> 
> It needs to be changed to something like:
> 
>       buf->word[i] = le32_to_cpu(buf->word[i]);
> 
> 
> Do you prefer that I send an extra commit to fix all affected call sites
> and keep QEMU_PACKED, or should we instead drop QEMU_PACKED and add
> compile-time size checks, e.g.:
> 
>       QEMU_BUILD_BUG_ON(sizeof(STEDesc) != 8);
>       QEMU_BUILD_BUG_ON(sizeof(CDDesc) != 8);
>       QEMU_BUILD_BUG_ON(sizeof(STE) != 64);
>       QEMU_BUILD_BUG_ON(sizeof(CD) != 64);
>

I think it's not really needed.
Those structs have only one member, which is an array, thus contiguous, 
so packed attribute will have no effect in practice.

> Best regards,
> 
> Tao
> 


