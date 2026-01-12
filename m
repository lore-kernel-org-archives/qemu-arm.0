Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC70CF45B0
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 17:16:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfLWJ-00075k-Hy; Mon, 12 Jan 2026 12:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vfLWF-0006v1-5l
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 12:15:55 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vfLWD-000892-EJ
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 12:15:54 -0500
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-81f3b4ae67bso1039370b3a.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 09:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768238152; x=1768842952; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bP8nw+4xRIgU1pe42o0KsYU/1+seivXe73OoPZKPxAo=;
 b=nUWXsswV6vlJsH5Yc7+IKZqQ+TZ6MqRC3tl6F/fwhLlgijJKkMDXGPTpm8b7qjdmnY
 K1rubcUmbQ3XuItmjc8g+1FYgycSdYJ9lM8GRKCTjef+QnUBiqeWpgQuD1xuTwNTy0sp
 YSIhVwuqrNZB2Nu9t2FFvpBM8s+9cgpL8EJN7lNwgvA4QjosMxr+ERQ3cRbnBbmhscI2
 adioKGGEHIYEioxJtffnJIOyCFWoRTJkauhpdSdFJixFdiWajgStudEATLvHJ/n8jpao
 UncUZlYdcWJ8gyE1rDsiW2K6/0weAKFQhYbZ6LFsDmteHoyQlV/btq86EPEPzbLZMcUl
 MI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768238152; x=1768842952;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bP8nw+4xRIgU1pe42o0KsYU/1+seivXe73OoPZKPxAo=;
 b=XSQDpA28q2hI0zQ/UOeXete/2SXR5u3sswLhjnMd71mMZRmLopbJnxjCN58Ni8O1Ou
 H8PPqXiI41bSlQND/TOkHFu7FO99rYjN4srzo5gtBKDtDO05XsG+uUyAMZiOCvxVR3Oo
 7+L4AYghwi3DPKfcgIDh3VMcTd2Grz2qpcaUAh5DmVj+yMBTPdcWj79CIOUeoeOwyKIv
 cRZPacUXmKU/nepG94zjv3hRJgz0/9fztHABXu0mZDfKbOr/DB5l7gqV/SnP36Vug2KD
 Z43Yirhhzps/kekPu6f+w45hFkpMP98LPCpYKZ0hCFxJG+moEQ1PRUoifM9sqe2ISZp/
 Clow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpTYfloq5nd90mYWtc84DQdR3gCXAZWuWF2U2HS7HzchSxVfPvGN3wZNzOWHw8lJ1we6YzmCFptg==@nongnu.org
X-Gm-Message-State: AOJu0YyQ5+ZKq4EJoOK/4vD4Xe+n9GZVF1ZL3us2YG4/pt+KQGPfrNgd
 XNeAn80PAm+FtIChIFS+4sL1mzoujOajQ+knuAZD8q+ABq468N9PS6+Op0cY1pX7LGg=
X-Gm-Gg: AY/fxX6Wf/ltFx8hzgeEoIkz9MmmoVh5CG5zZ2d2rQ8KjCVf6ALYezt5hJd2+hbuhBe
 obQkQVs0gkSaZAxx2+ZGF2ftvAdPG18YXMNkMuKQHnmFpTeLZbKI/7VS1zPbVqJnZznjuUDGRyI
 r0B155wVXJF1UAfmsFYqVl+b0tA/9EYnx0RMddZGrHYOFJ0CQXySUJ4Wfx3X8xYH9+O+DSDu9R1
 IrvcDvaMH5/nY4v5VCsOHEazhusYuXsKWt6HsILZdQBldKiZZQKjopLGh6/nLDqdJGWlZGSRqG8
 MA9fx8GNg7vFwROKoIC07IteIa5azIOgcURnD0etafTlorYGztE2g2Gi/yOFF00su5V7RU2euyY
 WYrBSA6klO0YS/iT9z7by6fi1A9lVeJS1u7aiB+5Gq0NPTgY7UlDMBhny+gv2rTXO+lW+y+ZVJ2
 DtfZic3GbH7aqAKqlce34zv02FveqQ8Oz2Gm0Czn1aP9BD6tEk0dGNDEdW
X-Google-Smtp-Source: AGHT+IHpu1smMO8bgQC0dtYejvdgS7E08chd1p6soqZp6mljs3PiwqcypFka06FM9I+Vum9qN92vWA==
X-Received: by 2002:a17:90b:1a81:b0:32e:3c57:8a9e with SMTP id
 98e67ed59e1d1-34f68cc2973mr18150268a91.35.1768238151768; 
 Mon, 12 Jan 2026 09:15:51 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34f5fb7419csm18215894a91.13.2026.01.12.09.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 09:15:50 -0800 (PST)
Message-ID: <7f09a713-c889-4afc-a4b7-34e3df402ec8@linaro.org>
Date: Mon, 12 Jan 2026 09:15:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] target/arm: make granule_protection_check usable
 from SMMU
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Tao Tang <tangtao1634@phytium.com.cn>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
References: <20251216000122.763264-1-pierrick.bouvier@linaro.org>
 <c8e80923-d837-4874-a072-d5ae579576a4@linaro.org>
 <CAFEAcA_iXHEFTJ0mS+kRC=rNxxhyCHyw5R=nQNMXYE03qkBTZA@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_iXHEFTJ0mS+kRC=rNxxhyCHyw5R=nQNMXYE03qkBTZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 1/12/26 9:01 AM, Peter Maydell wrote:
> On Mon, 12 Jan 2026 at 16:29, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> On 12/15/25 4:01 PM, Pierrick Bouvier wrote:
>>> This series prepare granule_protection_check to be usable from SMMU, for
>>> implementing RME feature.
>>> It's based on Tao's commit [1] extracting ARMSecuritySpace from cpu.h header for
>>> convenience.
> 
> 
>> Another gentle ping.
>> This series has been reviewed and should be ready to be pulled.
> 
> Applied to target-arm.next, thanks. I folded in this minor change
> which avoids the "local variables not declared at beginning of block"
> style issue:
> 
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -3785,9 +3785,7 @@ static bool get_phys_addr_gpc(CPUARMState *env,
> S1Translate *ptw,
>           return true;
>       }
> 
> -    const uint64_t gpccr = env->cp15.gpccr_el3;
> -    const bool gpc_enabled = FIELD_EX64(gpccr, GPCCR, GPC);
> -    if (gpc_enabled) {
> +    if (FIELD_EX64(env->cp15.gpccr_el3, GPCCR, GPC)) {
>           ARMCPU *cpu = env_archcpu(env);
>           MemTxAttrs attrs = {
>               .secure = true,
> 
> -- PMM

Ok, thanks.

