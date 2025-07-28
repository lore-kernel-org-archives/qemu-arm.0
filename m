Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D020C83F26
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Jul 2025 22:04:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugVx2-0006pe-HP; Mon, 28 Jul 2025 18:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ugVwz-0006kR-Bl
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 18:04:05 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ugVwx-00020A-7I
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 18:04:04 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-74264d1832eso5782331b3a.0
 for <qemu-arm@nongnu.org>; Mon, 28 Jul 2025 15:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753740241; x=1754345041; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fI+Qhb5lyK6qCqmX8xSsOM+1RYsyQ1ZWf3PKH+ULSbE=;
 b=yw008zwz2gpY7fNDaxnGAIt4l2pavniP4sZl/qluPPYJY2h1dc8nr6xRkapFgTm9ws
 R0RTP2QsGRhgzDnl7wI0pPQJkKlqmow5rJYJ0IUrD4N/fMYJWs7AoxVMqR0qaxOsWS/p
 Q7N0uedrGg3N63vpKJ3DpRcSbYUg0F8JG0GLbh3Lxs3Blgjzx+wYLyJ4Bu47Hgul8Uji
 9H3iSIFWtXGt3VltreMggR8hG3GnQLvNVtyd4j1T6A6o6URqJ1eSsO7hUCLzum85qiUf
 WotdpDJWmgwFBkGfQ1I3QY1W4KCgCzK6bkPjUx2ui84aZcgm3ekSjnDgrZEOSlhMchtw
 qnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753740241; x=1754345041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fI+Qhb5lyK6qCqmX8xSsOM+1RYsyQ1ZWf3PKH+ULSbE=;
 b=gNVSS39iEjYxshA7ByIlOmpaMk/5OFCQcf0bDoH5igw4DBv30LLX5lUieOcPU9WMFe
 7dOiCqVsblMOzfqJY8YmE+rGeKoTTzYwQtENhLIs4ex2lK8pZ2JKSMnFqG4quch8+Rk2
 tKmY8rDdnCrK7zsM3cqNpbswc0tmnFTdQEpanGpHiS4EyoVMpe2i+iN3wK0/E5xtppav
 gYwMa7aSRPGRWsJhElSo5B7rWKcB1DJmuTGehYGMqHvzDpow92x/q8ciOzONsL92SgtM
 4govsYIfIOah4O2Ev7+Oc5kqvGoIVbog88KBo1a07fZXXeACRzJ39eEjJgC/zN5uC3Ac
 luDg==
X-Gm-Message-State: AOJu0Yym4Ms2DJGAEw/ZRrYjA8njs6W5t/jI1d4nVOlq89tM6EAygTop
 vi5PVEpgSfKFZxYa52/nRHfMs0CctBaLNyMefpy0TOCjlL+evjkOcXrBILQeGJ7Pt9w=
X-Gm-Gg: ASbGncvWQ/tyFECHMXKF/Qft/+eMv4/WVJkhMMmiY6g0CgO02uddIi7snlYUNlFUF8s
 WkBNbD6ydCJaE7hX956lSpN0nPbVUPC1PvmAYPhlN+kz9VxTuTsSwvF2wuPI76xz27XkDREXamU
 RMQ54giQS8aSzTBQjOf4vXUinjwUOAJx7QAgtZVk2NCc7FYO/PxmOMjQtdpcobFXatO41wmi493
 sdZL3W0qqotv0AwfhRqkC+0cTf66HoxUlaMAWg7qyy8Ftniewh7g8Lia01I379Kh1+cJIcIQowk
 BKRqdY6mV14Z3zTe2iz02NAx3J81wOyX1HWyT481kN1j5rBi86U8kJ4EDL1Y0YOvv+vnsrbBx84
 Kp8TNPNF3X/ILXhWg9d1fWP2f+p5YlKNphxg=
X-Google-Smtp-Source: AGHT+IFpKbVjXizWzBX2Q93FMwhmxCrxmRu7YIW7ziGOZwiEfIWUMC0KYYjdFHmlOMrDbD4jpha5ZA==
X-Received: by 2002:a05:6a00:430f:b0:769:999c:eec0 with SMTP id
 d2e1a72fcca58-769999cef2amr623588b3a.7.1753740241387; 
 Mon, 28 Jul 2025 15:04:01 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640adfc111sm6258148b3a.63.2025.07.28.15.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 15:04:00 -0700 (PDT)
Message-ID: <09d56dc3-76f6-4186-822e-fcb338e2cddd@linaro.org>
Date: Mon, 28 Jul 2025 15:04:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] single-binary: compile hw/intc/arm* files once
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250725201906.19533-1-pierrick.bouvier@linaro.org>
 <bfdd8821-a7f7-4648-a389-124426da6d15@linaro.org>
 <144f0930-af30-42b0-849c-99242d3f09ee@linaro.org>
 <62c947c3-0e16-4484-83cc-3aff3a694041@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <62c947c3-0e16-4484-83cc-3aff3a694041@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x429.google.com
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

On 7/28/25 2:57 PM, Philippe Mathieu-Daudé wrote:
> On 28/7/25 21:34, Pierrick Bouvier wrote:
>> On 7/28/25 2:39 AM, Philippe Mathieu-Daudé wrote:
>>> On 25/7/25 22:19, Pierrick Bouvier wrote:
>>>> Move those files to hw/arm, as they depend on arm target code.
>>>>
>>>> Pierrick Bouvier (3):
>>>>      hw/arm/arm_gicv3_cpuif_common: move to hw/arm and compile only once
>>>>      hw/arm/arm_gicv3_cpuif: move to hw/arm and compile only once
>>>>      hw/arm/armv7m_nvic: move to hw/arm and compile only once
>>>>
>>>>     hw/{intc => arm}/arm_gicv3_cpuif.c        |  2 +-
>>>>     hw/{intc => arm}/arm_gicv3_cpuif_common.c |  2 +-
>>>>     hw/{intc => arm}/armv7m_nvic.c            |  0
>>>
>>> Alternatively add arm_common_ss in hw/intc/meson.build?
>>>
>>>      arm_common_ss = ss.source_set()
>>>      arm_common_ss.add(when: 'CONFIG_ARM_GIC',
>>>                        if_true: files('arm_gicv3_cpuif_common.c'))
>>>      arm_common_ss.add(when: 'CONFIG_ARM_GICV3',
>>>                        if_true: files('arm_gicv3_cpuif.c'))
>>>      arm_common_ss.add(when: 'CONFIG_ARM_V7M',
>>>                        if_true: files('armv7m_nvic.c'))
>>>      hw_common_arch += {'arm': arm_common_ss}
>>>
>>
>> The problem with this approach is that we need to aggregate hw/arm and
>> hw/intc arm related source sets, and the last line in your proposed
>> change does not have this semantic.
>> Regarding meson, hw/intc subfolder is parsed *before* hw/arm (see hw/
>> meson.build), so we can't reuse the same source set, defined in hw/arm/
>> meson.build.
>>
>> This old commit (7702e47c2) was the origin of having interrupt related
>> code in a generic folder, but I don't really understand the rationale
>> behind it to be honest. It seems to be an exception regarding all the
>> rest of the codebase, thus the idea to bring back things where they belong.
> 
> Yeah, you are right. What was suggested once was to move them to
> target/arm/hw/, being architecture dependent / specific.
> 
> $ ls -l hw/arm | wc -l
>         97
> 
> hw/arm/ contains board / soc / arm-specific hw and helpers (such
> code loaders). Nothing wrong, I'm just wondering there is room for
> improvements.
>

Sure, that makes sense.
GIC is a bit in the middle, as it's definitely an arm specific 
controller, and not a classical device. SMMU is directly in hw/arm for 
instance.

I'm really open to any structure Arm related developers would think is 
the best. It's just that moving a lot of files is always a pain for 
everyone, as it creates a lot of conflicts for people working on them 
currently, so I tried to minimize it here to target the strictly needed 
set of files only.

As well, I would prefer having a clean build system more than a clear 
filesystem structure, considering it's quite easy to jump into any 
definition automatically with your work editor nowadays, vs understand a 
meson.build file full of tricks and implicit dependencies where no tool 
can help you.

> Personally I'd rather keep hw/arm/ for boards / soc, and move
> ARM specific components (like GIC, NVIC, SMMU, timers to target/arm/hw/.
> 
> Anyhow, I don't object to your approach :) For this series:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>>
>> I'm open to any other idea someone would have. Peter, without
>> necessarily a working solution, do you have any preference on where
>> those things should be?
>>
>>>>     hw/arm/meson.build                        |  3 +
>>>>     hw/arm/trace-events                       | 79 +++++++++++++++++++
>>>> ++++
>>>>     hw/intc/meson.build                       |  3 -
>>>>     hw/intc/trace-events                      | 79
>>>> -----------------------
>>>>     7 files changed, 84 insertions(+), 84 deletions(-)
>>>>     rename hw/{intc => arm}/arm_gicv3_cpuif.c (99%)
>>>>     rename hw/{intc => arm}/arm_gicv3_cpuif_common.c (92%)
>>>>     rename hw/{intc => arm}/armv7m_nvic.c (100%)
>>>>
>>>
>>
> 


