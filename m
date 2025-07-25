Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9FCC87FCE
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 15:07:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufK14-0002pg-1X; Fri, 25 Jul 2025 11:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1ufK0b-00029l-VJ
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 11:06:54 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1ufK0a-0001Vo-BO
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 11:06:53 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-234b440afa7so20251145ad.0
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 08:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753456010; x=1754060810; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z6Py8ZwS0kfqeDhym1u+VYnJ4E+KS3P82qJoNRkABKk=;
 b=O9Luj0goe15UWMH9/lQpVzWA29OMVDbnf+jS9eKs4WkrCPBLi/rYl7P7nhGejCv5Qp
 XproAf2b2H57mW1SRuctET4OSOD9L87OvNRQTd5EQWYk+7Fw1GUj0nJIv6t5xYZ9CTZZ
 /I4SHxpL8VGNXL8lDCRwcA6RmJQ/okwF2EU75/1I8Ff/Np2jsCo8zKyc1MvnKnMO9mnn
 27BlGNzl2Ru1d2Uib4NZylSCFbIBVR5mtzaVQD/0F0XtFDGX764YnNxGGiAp/xDf/DrE
 J4JEHF3Ejr8MQ+izQg0M1NI7Wr3YUEC7CzOzN6FAhOynNVOBIjxAVTd3ja4DlgvXvzmq
 2wRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753456010; x=1754060810;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z6Py8ZwS0kfqeDhym1u+VYnJ4E+KS3P82qJoNRkABKk=;
 b=wt6AhabdEXWq4RyJh+78tpnbvZ/vxC1FHvhWhUrbbMZA9QpROoywrFL37qFlDv9DBw
 +kgF33f1DIyBWfWl6c92zUhHsmaUWX7b4QJUDdFYkzCLI1wJSUJCnZpMxtOwuTSVHd+R
 BuYEAoI/U8LFEApqr+Y7QTbW797ezcUuRJ0biysTYDBgkYdCe3NAadw0NgrGHLzVj3vT
 1uQurBinNrQM5JzeETKPoT/3bRBurOzywTzEsw1Wtqd8/VEQzzoI8r5S4ZQhhzIi6hHu
 Igyvnt5FzMjzt/bwbKYyf57UxgGfPUv/KmnsTeCSP4s7wcx1thw6VbINJz2FTRD5tquw
 JZDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIuYHDKSkdQ1TWVkyL4E5Vqfbh8Bjvulhcsjg+OsxzhN2T3EBghEYhtmUXEMO5nnmLfr3ll3Yubw==@nongnu.org
X-Gm-Message-State: AOJu0YwCMlEtw9inek+fTTW0ZX/3mYSXqR58P6EsQTjmxCze9W3mwvB2
 l9ZyCQXbjZoRYMxOuMxWv3mysLWbuGTqBS4KnPyCxEaqFc1dnBwh91WFR1s8HPCpqwM=
X-Gm-Gg: ASbGnctaaxQ9Wrg8mp2cGrWT6+CUOG8sDc5eHLMq91yLQgTYoDj1cAfdBTMkFCRyNCE
 i/A65ifkyG8HX77THJfx8KytelmiCMiTU9PWlmDmd5Ymm5DxWnN9DNmCfDwEhNhnR03PeNvNojs
 iX9P8T6xqv9eKkoEuD812spCc3On1Z7aqfS63pP5lo3zvTYsGUrtbyxfwxZYiSihaXFNEIFYu1k
 vcCKA3DOwgyajNGcvG51jPqXP3cjZoN8eLNThaPSMyni0suKEoiiCS1Xlmpg4fhzJkXyY3NLmf/
 RYC04WMe9V3MX52hQyDty+jKocwZ1z+rz1cm2xyi4vpvbxqyZIbFwRmi90Ez6OlqodlFMNMcMjN
 pOztu692ucyIXg1gO1RjlPhgygaMnFmGarQ==
X-Google-Smtp-Source: AGHT+IHP69mvkV6J1NoYGMnKr/W4aNwIS8AKl897sDFXRo/m5F6BIEskvMxCmP4+rHJxasf6FE2aiQ==
X-Received: by 2002:a17:903:246:b0:235:ed01:18cd with SMTP id
 d9443c01a7336-23fb317ae95mr32840655ad.44.1753456010440; 
 Fri, 25 Jul 2025 08:06:50 -0700 (PDT)
Received: from [192.168.0.102] ([187.75.37.236])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fa491804bsm39106985ad.206.2025.07.25.08.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 08:06:50 -0700 (PDT)
Message-ID: <29a7b7ac-831d-4124-9f93-427bec6205ff@linaro.org>
Date: Fri, 25 Jul 2025 12:07:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Clean up of register field definitions
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20250725014755.2122579-1-gustavo.romero@linaro.org>
 <17254b66-4902-4ee0-8c9a-4082146255e3@linaro.org>
 <aad0c640-b736-4f5a-a6cf-e5459f60630d@linaro.org>
 <CAFEAcA8CN2GEGGrPZGweFHffSsBLF5Q-kfHwYhiRXfrgqGJ_Mg@mail.gmail.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <CAFEAcA8CN2GEGGrPZGweFHffSsBLF5Q-kfHwYhiRXfrgqGJ_Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x633.google.com
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

Hi Peter,

On 7/25/25 11:47, Peter Maydell wrote:
> On Fri, 25 Jul 2025 at 15:38, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>>
>> Hi Phil,
>>
>> On 7/25/25 10:18, Philippe Mathieu-Daudé wrote:
>>> Hi Gustavo,
>>>
>>> On 25/7/25 03:47, Gustavo Romero wrote:
>>>>            if (stage2idx == ARMMMUIdx_Stage2_S) {
>>>> -            s2walk_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
>>>> +            s2walk_secure = !(env->cp15.vstcr_el2 & R_VSTCR_SW_MASK);
>>>
>>> FYI register API provides helper macros:
>>>
>>>               s2walk_secure = !FIELD_EX32(env->cp15.vstcr_el2, VSTCR, SW);
>>>
>>
>> Do you know which form is currently preferred? I see that R_<REGNAME>_<FIELD>_MASK is used a lot, .e.g, in helper.c.
> 
> Where a mask is the most simple or useful way to get what
> you want, it's fine to use R_*_MASK directly; for instance
> in this patch
>   (env->cp15.vstcr_el2 & (R_VSTCR_SA_MASK | R_VSTCR_SW_MASK)
> is better than
>   (FIELD_EX64(env->cp15.vstcr_el2, VSTCR, SA) ||
>    FIELD_EX64(env->cp15.vstcr_el2, VSTCR, SW))
> and
>    value |= R_FOO_BAR_MASK;
> seems simpler than
>    value = FIELD_DP64(value, FOO, BAR, 1);
> 
> I think (though this is to some extent a matter of personal taste).

I also prefer the mask for the most simple cases, like in 1 bit masks and where the code becomes more succinct.


> Where we're using the mask to test whether a single bit field
> is set or not, you could do it either way. I think in new code
> I would probably use the FIELD_EX64 macro, but a test against
> the mask value is fine too.
> 
>> Also, even tho the SW field in VSTCR is <= 31, VSTCR is a 64-bit register, so should I really use FIELD_EX32 (which works) or FIELD_EX64 (my first thought would be to use it, i.e. based on the register size, not the field)?
> 
> Use FIELD_EX64 for working on 64-bit values, yes.

Thanks for the clarifications.


> Personally I don't feel strongly about any of this, so I
> would be happy taking this patch the way it is.
> 
> -- PMM

OK, thanks.


Cheers,
Gustavo

