Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00681C98328
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 16:34:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xA8sE-0006iP-1F; Fri, 25 Sep 2026 12:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xA8sC-0006i2-FV
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 12:34:08 -0400
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xA8sA-0001mz-TY
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 12:34:08 -0400
Received: by mail-pj2-x0d.google.com with SMTP id
 98e67ed59e1d1-3a0bcdf41a3so449945a91.2
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 09:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790354045; x=1790958845; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8k0GeIq/elNnRc8rE4A+91KWCyinznyHOoVU4iBo2cE=;
 b=AyqvuJLl9j+LUwLhCP0GcRBVAC1GeGRgHhpEBiXbkrmZgKOYGuwnSGeW79ec6jrlna
 Lu5A9vjSLJncOnuTb2m6eO5Qd2CpRYNJvtKmPdC3FHfrMqLW8QuhphfBFke1dJYk+F95
 DPbU2k0kzhvXBWLCAYGd/yRbP/DFWP3RaNFFnATThX8mvpagDXCvI1Do5z0hb+LBGn3A
 auHP5s+HWLg0GUF1QYyHrTGkh10+JlpxI3vYNdRYRJtqLa3lPA7pxs+9w5zG5AtppG+r
 WcF3RUyT9Wvl7UfgKeqOc7n3wRTzEJbbVIGOkL8hMqOjjbqJFj4e/OpnUgAPf6xiVW/9
 BU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790354045; x=1790958845;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8k0GeIq/elNnRc8rE4A+91KWCyinznyHOoVU4iBo2cE=;
 b=XpdrJLlbGMMbli0xcfqHUAMVzlHVWFJZXNpzZt/5zyUdSXP+w/Tx/x4hqsHf7HvyXE
 WDz3UFVGrzrlRJKACAf9I1RsHh4VrFRd7USNJ6TFgLKuevphrrpaIN9ilq0cZE3SfaJ5
 ek4BoISajU+ebKpyPl9wnd1DXT0Ku1VZ/5BprSxxQqqpXaLW4+b6bHjk8tv8vgTSBSQu
 VBf8xid6p3PioSxXeq6w3DXpTy7giVNdNhbW9p3S1OCwfNPxnQ9vqSjlzrzImnqA3ASR
 ztBAl4V24a/5mkzlOmEoLKpSJZ8ZTl9Hyzy01C7CSNDQMxw1iv1EWq6PcH4Qnm3AKdVj
 v4+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxeAZm7Ohxr2xpAG+0gM6FCPAN4m7kgJooyYuCaWNU94zKCPVO0EpH5pZMu5HjM8YCmo1eUkcsTKg==@nongnu.org
X-Gm-Message-State: AFuF++niSSqX719RXtPI0K5spTu6ahKLxOG4BR4xumlu6QuaH6xOJpev
 QcmQruNK3PUBX7R3pSLg0l8WfmcgRKIZffC3PkGllL7/5G2hQ9PYIgrYr9xFwW+2BQ4=
X-Gm-Gg: AYBFou30gIRoUl8z6dmQmz14VRJEXW/hALpe3K9rYh5qbHP+qaNVtAPvNrIKiqihMUR
 G/987xsbF6mVOb/esN0KhUp6iQIA41SiQxwf8zIPnrG+KmO3dMv9Aoa+7pV2R9E7TqvtiBjygCX
 lBWkwFbzx8z5hCeVRDsO8G4PKTWZATS3rfL4NOah+59TSSPSe03+1rtdWMPKbZEHPVy0IVQWpiW
 /ZE4+WVo6q4uewDT7Lz0ymkymlBY9JJXfXD+YtG/6fZmWbrimY1vcAe6P/8dQp7gjHU7qZKsNbw
 KXJN/3VaI7Y/lJj6QhSIIm4vF60p0l0Wv9CX2Ui6+XLwmhC0q/0hvbRyhu7qjIY5TM1Oosjakmx
 JJ4T51VeNvhU/uhSfo/ZRblwVGxTfWrB1UkWKsZ9zZTco8GKJOBLpE+5SNEWUPsdULerwo1mCto
 kR1UB09icFHFyloKlUKAUSVtnIyZmmYdLKYz6nhlahMFjMbQiNjodLGuhaeF+3tIpjLGLOcacTa
 2lDhP7juj1T9rfmEUGRRt2kLEKKP0kNzKICz0pGSBeE81b5QJs=
X-Received: by 2002:a17:90b:3888:b0:3a0:cc33:2287 with SMTP id
 98e67ed59e1d1-3a0cc3324ccmr1036590a91.6.1790354045069; 
 Fri, 25 Sep 2026 09:34:05 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0c719f86fsm3094138a91.7.2026.09.25.09.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2026 09:34:04 -0700 (PDT)
Message-ID: <ebd4f4af-b958-4d76-a671-6927fbea1d70@linaro.org>
Date: Fri, 25 Sep 2026 09:34:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] target/arm: Add PSTATE.UINJ to tbflags
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-12-richard.henderson@linaro.org>
 <CAFEAcA-9BWhLf2AagEcnacxMYKPYGKC=iKKoGRvPg4BW0PtbaA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-9BWhLf2AagEcnacxMYKPYGKC=iKKoGRvPg4BW0PtbaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/8/26 04:08, Peter Maydell wrote:
> On Fri, 28 Aug 2026 at 23:27, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
>> index 296ec8101ab..174f4aa746f 100644
>> --- a/target/arm/tcg/hflags.c
>> +++ b/target/arm/tcg/hflags.c
>> @@ -292,6 +292,9 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
>>       if (env->uncached_cpsr & CPSR_IL) {
>>           DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
>>       }
>> +    if (env->pstate & PSTATE_UINJ) {
>> +        DP_TBFLAG_ANY(flags, PSTATE__UINJ, 1);
>> +    }
>>
>>       /*
>>        * The SME exception we are testing for is raised via
>> @@ -513,6 +516,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>>       if (env->pstate & PSTATE_IL) {
>>           DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
>>       }
>> +    if (env->pstate & PSTATE_UINJ) {
>> +        DP_TBFLAG_ANY(flags, PSTATE__UINJ, 1);
>> +    }
>>
>>       if (arm_fgt_active(env, el)) {
>>           DP_TBFLAG_ANY(flags, FGT_ACTIVE, 1);
> 
> Could we do this just once in rebuild_hflags_common() rather than
> duplicating it in _a32 and _a64 ?
_common is also used with _m32.

We could probably reorg things so that we have a common _aprofile 
routine, which could also avoid the duplication from FGT.

I'll give it a shot.


r~

